<?php
/*
+--------------------------------------------------------------------------
|   CubeCart v3.0.17
|   ========================================
|   by Alistair Brookbanks
|	CubeCart is a Trade Mark of Devellion Limited
|   Copyright Devellion Limited 2005 - 2006. All rights reserved.
|   Devellion Limited,
|   5 Bridge Street,
|   Bishops Stortford,
|   HERTFORDSHIRE.
|   CM23 2JU
|   UNITED KINGDOM
|   http://www.devellion.com
|	UK Private Limited Company No. 5323904
|   ========================================
|   Web: http://www.cubecart.com
|   Date: Tuesday, 17th July 2007
|   Email: sales (at) cubecart (dot) com
|	License Type: CubeCart is NOT Open Source Software and Limitations Apply 
|   Licence Info: http://www.cubecart.com/site/faq/license.php
+--------------------------------------------------------------------------
|	cart.php
|   ========================================
|	The Shopping Cart Class	
+--------------------------------------------------------------------------
*/
class cart
{
	var $cartArray;
	
	function cartContents($sqlValue)
	{
		
		if(empty($sqlValue)) {
		
			return FALSE;
		
		} else {
			
			$this->cartArray = unserialize($sqlValue);
			
			return $this->cartArray;
			
		}
		
	}
	
	function add($productId, $quantity, $options)
	{
		
		// SO: FIX FOR CHECKOUT FLOW
		$this->setVar(1,"currentStep");
		$this->setVar(2,"stepLimit");
		// EO: FIX FOR CHECKOUT FLOW
		
		$productKey = $productId.":".$this->buildOptions($options);
		
		if(isset($this->cartArray['conts'][$productKey]['quantity']) && $this->cartArray['conts'][$productKey]['quantity'] > 0){
			
			$this->cartArray['conts'][$productKey]['quantity'] = $this->cartArray['conts'][$productKey]['quantity'] + $quantity;
		
		} else {
			
			$this->cartArray['conts'][$productKey]['quantity'] = $quantity;
		
		}
		
		if($this->sqlValue() == FALSE){
		
			return $this->error();
		
		} else {
		
			return $this->cartArray;
		
		}
	}
	
	function setVar($var,$varName,$arrayName="",$i="")
	{
		
		// unset old delivery address and add new
		
		if(is_array($var)){
		
			foreach($var as $key => $value){
			
				$var[$key] = str_replace(array("\'","'"),"&#39;",$value);
			
			} 
		
		} else {
		
			$var = str_replace(array("\'","'"),"&#39;",$var);
		
		}
		
		if(empty($arrayName)){
		
			unset($this->cartArray[$varName]);
			
			$this->cartArray[$varName] = $var;
			
			if($this->sqlValue() == FALSE){
			
				return $this->error();
			
			} else {
			
				return $this->cartArray;
			
			}
			
		} else {
			
			if(isset($this->cartArray[$arrayName][$i][$varName])) { unset($this->cartArray[$arrayName][$i][$varName]); }
			
			$this->cartArray[$arrayName][$i][$varName] = $var;
			
			if($this->sqlValue() == FALSE){
			
				return $this->error();
			
			} else {
			
				return $this->cartArray;
			
			}
		
		}
	
	}
	
	function unsetVar($varName)
	{
		unset($this->cartArray[$varName]);
		
		if($this->sqlValue() == FALSE){
		
			return $this->error();
		
		} else {
		
			return $this->cartArray;
			
		}
	
	}
	
	function remove($productKey)
	{
		
		// SO: FIX FOR CHECKOUT FLOW
		$this->setVar(1,"currentStep");
		$this->setVar(2,"stepLimit");
		// EO: FIX FOR CHECKOUT FLOW
		
		unset($this->cartArray['conts'][$productKey]);
		
		if($this->sqlValue() == FALSE){
		
			return $this->error();
		
		} else {
		
			return $this->cartArray;
			
		}
	}
	function update($productKey, $quantity)
	{
		
		$quantity = ceil($quantity);
		
		if($quantity > 0)
		{
			
			$this->cartArray['conts'][$productKey]['quantity'] = $quantity;
		
		} else {
			
			unset($this->cartArray['conts'][$productKey]);
		
		}
		
		if($this->sqlValue() == FALSE){
		
			return $this->error();
			
		} else {
		
			return $this->cartArray;
		
		}
	
	}
	
	function updateDeliver($productComments)
	{
		$this->cartArray['deliveryDays'] = $productComments;
	}
	
	function sqlValue()
	{
		global $db, $glob;
		
		$cartData['basket'] = $db->mySQLSafe(serialize($this->cartArray));
		
		// sync database to array
		$update = $db->update($glob['dbprefix']."CubeCart_sessions", $cartData,"sessId=".$db->mySQLSafe($_SESSION['ccUser']));
		
		if($update == TRUE){
		
			return TRUE;
		
		} else {
		
			return FALSE;
		
		}

	}
	function noItems(){
		
		$total = 0;
		
		if(is_array($this->cartArray['conts']))
		{
		
			foreach($this->cartArray['conts'] as $key => $value)
			{
				$total = $this->cartArray['conts'][$key]['quantity'] + $total;
			}
		
		return $total;
		
		} 
		else
		{
		
		return 0;
		
		}
		
		
	}
	
	function buildOptions($options){
	
		$optionStr = "";
		
		if(is_array($options)) {
		
			$amount = count($options);
			$i=0;
		
			foreach($options as $value) {
				
				$i++;
				
				$optionStr .= $value;
				
				if($i<$amount){
					
					$optionStr .= "|";
				
				}
				
			}
			
			return $optionStr;
		
		} else {
		
			return FALSE;
		}
	
	}
	
	function getOptions($productKey){
		
		$options = explode(":", $productKey);
		
		return $options[1];
	
	}
	
	function getProductId($productKey){
		
		$options = explode(":", $productKey);
		
		return $options[0];
	
	}
	
	function emptyCart(){
		
		unset($this->cartArray);
		
		if($this->sqlValue() == FALSE){
		
			return $this->error();
		
		} else {
		
			return TRUE;
		
		}
	
	}
	
	function error(){
		$output = "<b style='font-family: Arial, Helvetica, sans-serif; color: #0B70CE;'>Cart Error</b><br />\n<span style='font-family: Arial, Helvetica, sans-serif; color: #000000;'>There was an error updating the basket.</span><br />\n";
		
		return $output;
		
	}

}
?>
