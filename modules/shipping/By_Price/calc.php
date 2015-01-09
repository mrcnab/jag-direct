<?php
/*
+--------------------------------------------------------------------------
|   CubeCart v3.0.17
|   ========================================
|	By: Naveed Asghar Bandesha
+--------------------------------------------------------------------------
|	calc.php
|   ========================================
|	Calculates shipping by weight (Lbs or Kgs)	
+--------------------------------------------------------------------------
*/
// per category shipping module
	//$perZone	= FALSE ;
//	$productID	=	$basket['invArray'][1]['productId'];
	//foreach($basket['invArray'] as $key=>$value ){
//	
//		$query = "SELECT shipping_type FROM 
//				".$glob['dbprefix']."CubeCart_category
//				where cat_id = (select cat_id from ".$glob['dbprefix']."CubeCart_inventory where productId = 
//				".$value['productId'] .")";
//		
//		$shipping_type_rs = $db->select($query);
//		$shipping_type = $shipping_type_rs[0]['shipping_type'];
//		if($shipping_type == "By Zone"){
//			$perZone = TRUE;
//			break;
//		}
//	}
	
//print_r($basket);	
function remove_numbers($string) {
  		$vowels = array("1", "2", "3", "4", "5", "6", "7", "8", "9", "0", " ");
  		$string = str_replace($vowels, '', $string);
  		return $string;
}

$module = fetchDbConfig("By_Price");



if($module['status']==1){

$cartTotal		=	$basket['subTotal'];
$deliveryTime	=	$basket['deliveryDays'];
// get the delivery ISO
$countryISO = $deliveryTime;


// build array of ISO Codes
 $zones['1'] = explode(",",str_replace(" ","",strtoupper($module['zone1class1'])));
 $zones['2'] = explode(",",str_replace(" ","",strtoupper($module['zone1class2'])));
 $zones['3'] = explode(",",str_replace(" ","",strtoupper($module['zone2class1'])));
 $zones['4'] = explode(",",str_replace(" ","",strtoupper($module['zone2class2'])));
 $zones['5'] = explode(",",str_replace(" ","",strtoupper($module['zone3class1'])));
 $zones['6'] = explode(",",str_replace(" ","",strtoupper($module['zone3class2'])));

// find the country
foreach ($zones as $key => $value){

	foreach($zones[$key] as $no => $iso){
		
		if(strtolower($iso) == strtolower($countryISO)){		
			$shipZone = $key;
		}	
	}
}





// work out cost
$shipBands = $module['zone'.$shipZone.'class1'];

if($cartTotal <= 5 && $deliveryTime == 'normal_1'){
		 $shipBands = $zones['1'][0];
}else if($cartTotal <= 5 && $deliveryTime == 'urgent_1'){
		 $shipBands = $zones['2'][0];
}else if(($cartTotal >= 6 && $cartTotal <= 10)  && $deliveryTime == 'normal_1'){
		 $shipBands = $zones['3'][0];
}else if(($cartTotal >= 6 && $cartTotal <= 10)  && $deliveryTime == 'urgent_1'){
		 $shipBands = $zones['4'][0];
}else if(($cartTotal >= 11 && $cartTotal <= 25)  && $deliveryTime == 'normal_1'){
		 $shipBands = $zones['5'][0];
}else if(($cartTotal >= 11 && $cartTotal <= 25)  && $deliveryTime == 'urgent_1'){
		 $shipBands = $zones['6'][0];
}else{
		$shipBands = 0.00;
}


$sumClass1 = $shipBands;



if($sum == 0){
	$sum = 0.00;
}

$taxVal = taxRate($module['tax']);
	//print_r($shipKey);
	$shippingPrice .= "<option value='".$shipKey."'";
	if($shipKey ==$basket['shipKey']){
		$shippingPrice .= " selected='selected'";
		$basket = $cart->setVar($lang['misc']['byWeight1stClass'],"shipMethod");
		$basket = $cart->setVar(sprintf("%.2f",$sumClass1),"shipCost");
	}
	
	$sum = $sumClass1;
	
	$shippingPrice .= ">".priceFormat($sumClass1)."</option>\r\n";
	$shippingAvailable = TRUE;
	
	$shipKey++;


unset($module, $taxVal, $shipBands, $noBands, $zones, $wheightCost, $countryISO);

}?>