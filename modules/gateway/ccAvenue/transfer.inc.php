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
|	transfer.php
|   ========================================
|	Core functions for the ccAvenue Gateway	
+--------------------------------------------------------------------------
*/
/*
//////////////////////////
// CCAVENUE GATEWAY
//////////////////////////
// L@@K AT ALL THE LOVELY 
// VARIABLES WE HAVE TO
// PLAY WITH!!
//////

//////////////////////////
// IN THE REPEATED REGION
//////
$orderInv['productId']						- product id as an integer
$orderInv['name']							- product name as a varchar
$orderInv['price']							- price of each product (inc options)
$orderInv['quantity']						- quantity of products as an integer
$orderInv['product_options']				- products attributes as test
$orderInv['productCode']					- product code as a varchar
$i											- This is the current incremented integer starting at 0

/////////////////////////
// FIXED VARS
///////
$cart_order_id							- cart order id as a varchar
$ccUserData[0]['email']						- Customers email address
$ccUserData[0]['title']						- Customers title (Mr Miss etc...)
$ccUserData[0]['firstName']					- Customers first name
$ccUserData[0]['lastName']					- Customers last name 
$ccUserData[0]['add_1']						- Invoice Address line 1
$ccUserData[0]['add_2']						- Invoice Address line 1
$ccUserData[0]['town']						- Invoice Town or city
$ccUserData[0]['county']					- Invoice County or state
$ccUserData[0]['postcode']					- Invoice Post/Zip Code
$ccUserData[0]['country']					- Invoice country Id we can look up the country name like this
										countryName($ccUserData[0]['country']);
$ccUserData[0]['phone']						- Contact phone no
$ccUserData[0]['mobile']					- Mobile/Cell phone number

$basket['delInf']['title']				- Delivery title (Mr Miss etc...)
$basket['delInf']['firstName']			- Delivery customers first name
$basket['delInf']['lastName']			- Delivery customers last name 
$basket['delInf']['add_1']				- Delivery Address line 1
$basket['delInf']['add_2']				- Delivery Address line 1
$basket['delInf']['town']				- Delivery Town or city
$basket['delInf']['county']				- Delivery County or state
$basket['delInf']['postcode']			- Delivery Post/Zip Code
$basket['delInf']['country']			- Delivery  country Id we can look up the country name like this	
										countryName($basket['delInf']['country']);


$basket['subTotal'] 					- Order Subtotal (exTax and Shipping)
$basket['grandTotal']					- Basket total which has to be paid (inc Tax and Shipping).
$basket['tax']							- Total tax to pay
$basket['shipCost']						- Shipping price
////////////////////////////////////////////////////////
*/

$module = fetchDbConfig("ccAvenue");

function repeatVars(){

		return FALSE;
	
}

function fixedVars(){
	
	global $module, $basket, $ccUserData, $cart_order_id, $config, $GLOBALS;
	
	require("libfuncs.php");
	$redirectURL = $GLOBALS['storeURL']."/confirmed.php?oid=".base64_encode($cart_order_id);
	$Merchant_Id = $module['acNo']; //This id(also User Id)  available at "Generate Working Key" of "Settings & Options" 
	$Amount = $basket['grandTotal']; //your script should substitute the amount in the quotes provided here
	$Order_Id = $cart_order_id; //your script should substitute the order description in the quotes provided here

	$WorkingKey = $module['WorkingKey']; //put in the 32 bit alphanumeric key in the quotes provided here.Please note that get this key ,login to your CCAvenue merchant account and visit the "Generate Working Key" section at the "Settings & Options" page. 
	$Checksum = getCheckSum($Merchant_Id,$Amount,$Order_Id ,$Redirect_Url,$WorkingKey);	
	
	$hiddenVars = "<input type='hidden' name='Checksum' value='".$Checksum."' />
	<input type='hidden' name='Order_Id' value='".$cart_order_id."' />
			<input type='hidden' name='Amount' value='".$basket['grandTotal']."' />";
			
			if($module['gate']=="IN"){
			
				$hiddenVars .= "<input type='hidden' name='Currency' value='INR' />";
			
			} else {
			
				$hiddenVars .= "<input type='hidden' name='Currency' value='USD' />";
			
			}
			
			
			$hiddenVars .= "<input type='hidden' name='TxnType' value='A' />
			<input type='hidden' name='actionID' value='TXN' />
			<input type='hidden' name='Merchant_Id' value='".$module['acNo']."' />
			<input type='hidden' name='billing_cust_name' value='".$ccUserData[0]['title']." ".$ccUserData[0]['firstName']." ".$ccUserData[0]['lastName']."' />";
			
			if(!empty($ccUserData[0]['add_2'])){

				$add = $ccUserData[0]['add_1'].",".$ccUserData[0]['add_2'].",".$ccUserData[0]['town'].", ".$ccUserData[0]['county'];
					
			} else {
						
				$add = $ccUserData[0]['add_1'].",".$ccUserData[0]['town'].",".$ccUserData[0]['county'];
					
			}
			
			if(!empty($ccUserData[0]['add_2'])){

				$delAdd = $basket['delInf']['add_1'].",".$basket['delInf']['add_2'].",".$basket['delInf']['town'].", ".$basket['delInf']['county'];
					
			} else {
						
				$delAdd = $basket['delInf']['add_1'].",".$basket['delInf']['town'].",".$basket['delInf']['county'];
					
			}
			
			$hiddenVars .= "<input type='hidden' name='billing_cust_address' value='".$add."' />
			<input type='hidden' name='billing_cust_country' value='".countryIso($ccUserData[0]['country'])."' />
			<input type='hidden' name='billing_cust_tel' value='".$ccUserData[0]['phone']."' />
			<input type='hidden' name='billing_cust_email' value='".$ccUserData[0]['email']."' />
			<input type='hidden' name='billing_cust_notes' value='".$basket['customer_comments']."' />
			<input type='hidden' name='delivery_cust_name' value='".$basket['delInf']['title']." ".$basket['delInf']['firstName']." ".$basket['delInf']['lastName']."' />
			<input type='hidden' name='delivery_cust_address' value='".$delAdd."' />
			<input type='hidden' name='delivery_cust_tel' value='".$basket['delInf']['phone']."' />
			<input type='hidden' name='Redirect_Url' value='".$redirectURL."' />";
				
			return $hiddenVars;
	
}

function success(){
	global $basket;
	
	if( (base64_decode($_GET['oid']) == $basket['cart_order_id']) && ($_POST['AuthDesc']=="Y") ) {
	
		return TRUE;
	
	} else {
	
		return FALSE;
	
	}

}

///////////////////////////
// Other Vars
////////
if($module['gate']=="IN"){

	$formAction = "https://www.ccavenue.com/shopzone/cc_details.jsp";

} else {

	$formAction = "https://world.ccavenue.com/servlet/ccw.CCAvenueController";

}

$formMethod = "post";
$formTarget = "_self";
$transfer = "auto";
$stateUpdate = TRUE;
?>