<?php
/*
+--------------------------------------------------------------------------
|   CubeCart v3.0.0
|   ========================================
|   by Alistair Brookbanks
|	CubeCart is a Trade Mark of Devellion Limited
|   (c) 2005 Devellion Limited
|   Devellion Limited,
|   Westfield Lodge,
|   Westland Green,
|   Little Hadham,
|   Nr Ware, HERTS.
|   SG11 2AL
|   UNITED KINGDOM
|   http://www.devellion.com
|	UK Private Limited Company No. 5323904
|   ========================================
|   Web: http://www.cubecart.com
|   Date: Friday, 1 July 2005
|   Email: info@cubecart.com
|	License Type: CubeCart is NOT Open Source Software and Limitations Apply
|   Licence Info: http://www.cubecart.com/site/faq/license.php
+--------------------------------------------------------------------------
|	This MOD - CardSave Payment Gateway is property of WebMediaUK
|	http://www.webmediauk.co.uk
+--------------------------------------------------------------------------
|	transfer.inc.php
|   ========================================
|	Core functions for the CardSave Gateway
|
|	CubeCart v3.x CardSave Payment Gateway
|   The Cardsave payment gateway software is provided on an "AS IS" basis, without
|   warranty of any kind, including without limitation the warranties of merchantability,
|   fitness for a particular purpose and non-infringement. The entire risk as to the 
|   quality and performance of the software is borne by the merchant or licensor.
+--------------------------------------------------------------------------
/*
//////////////////////////
// IN THE REPEATED REGION
//////
$productId								- product id as an integer
$product[0]["name"]						- product name as a varchar
$price									- price of each product (inc options)
$quantity								- quantity of products as an integer
$product_options						- products attributes as test
$product[0]["productCode"]				- product code as a varchar
$product[0]["description"]				- products description
$i										- This is the current incremented integer starting at 0

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

$module = fetchDbConfig("CardSave");

include_once("includes/session.inc.php");
include_once("includes/currencyVars.inc.php");
include_once("modules/gateway/CardSave/isoCurrencies.inc.php");

function repeatVars() {
    return false;
}

function fixedVars() {
    global $module, $config, $basket, $ccUserData, $cart_order_id, $currencyVars, $isos, $GLOBALS;
    
    // get the iso code for the currency selected
    // and die if we can't find it because we can't continue
    $isoCode = array_search($ccUserData[0]['currency'], $isos);
    if($isoCode){
    }else{
       $isoCode = array_search($config['defaultCurrency'], $isos);
    }

    // work out the total in the currency selected
    if((int)$currencyVars[0]["decimalPlaces"] > 0){
        // if the currency has decimal places defined creat the total using them
        $convertedTotal = number_format(((float)$basket['grandTotal']*(float)$currencyVars[0]["value"]), (int)$currencyVars[0]["decimalPlaces"]);
    }else{
        // if not we need to add 2 zeros to the end for cardsave
        $convertedTotal = number_format(((float)$basket['grandTotal']*(float)$currencyVars[0]["value"]), 0).".00";
    }
    

    $hash = "PreSharedKey=".$module['psk']."&MerchantID=".$module['acNo']."&Password=".$module['pwd']."&Amount=".str_replace (".", "", $convertedTotal)."&CurrencyCode=".$isoCode."&OrderID=".$cart_order_id."&TransactionType=SALE&TransactionDateTime=".date('Y-m-d H:i:s P');
    if($module['dsr']>0) {
        $hash = $hash."&CallbackURL=".$GLOBALS['storeURL']."/csConfirmed.php?act=step5";
    }else{
        $hash = $hash."&CallbackURL=".$GLOBALS['storeURL']."/confirmed.php";
    }
    $hash = $hash."&OrderDescription=Payment for order ".$cart_order_id."&CustomerName=".$ccUserData[0]['firstName']." ".$ccUserData[0]['lastName']."&Address1=".$ccUserData[0]['add_1']."&Address2=".$ccUserData[0]['add_2']."&Address3=&Address4=&City=".$ccUserData[0]['town']."&State=".$ccUserData[0]['county']."&PostCode=".$ccUserData[0]['postcode']."&CountryCode=&CV2Mandatory=true&Address1Mandatory=true&CityMandatory=true&PostCodeMandatory=true&StateMandatory=true&CountryMandatory=false&";
    if($module['dsr']>0) {
        $hash = $hash."ResultDeliveryMethod=SERVER&ServerResultURL=".$GLOBALS['storeURL']."/modules/gateway/CardSave/response.php";
    } else {
        $hash = $hash."ResultDeliveryMethod=POST&ServerResultURL=";
    }
    $hash = $hash."&PaymentFormDisplaysResult=false";
    //echo $hash;
    $hiddenVars = "<input type='hidden' name='HashDigest' value='".sha1($hash)."' />
                    <input type='hidden' name='MerchantID' value='".$module['acNo']."' />
                    <input type='hidden' name='Amount' value='".str_replace (".", "", $convertedTotal)."' />
                    <input type='hidden' name='CurrencyCode' value='".$isoCode."' />
                    <input type='hidden' name='OrderID' value='".$cart_order_id."' />
                    <input type='hidden' name='TransactionType' value='SALE' />
                    <input type='hidden' name='TransactionDateTime' value='".date('Y-m-d H:i:s P')."' />";
    if($module['dsr']>0) {
        $hiddenVars = $hiddenVars."<input type='hidden' name='CallbackURL' value='".$GLOBALS['storeURL']."/csConfirmed.php?act=step5' />";
    } else {
        $hiddenVars = $hiddenVars."<input type='hidden' name='CallbackURL' value='".$GLOBALS['storeURL']."/confirmed.php' />";
    }
    $hiddenVars = $hiddenVars."<input type='hidden' name='OrderDescription' value='Payment for order ".$cart_order_id."' />
                    <input type='hidden' name='CustomerName' value='".$ccUserData[0]['firstName']." ".$ccUserData[0]['lastName']."' />
                    <input type='hidden' name='Address1' value='".$ccUserData[0]['add_1']."' />
                    <input type='hidden' name='Address2' value='".$ccUserData[0]['add_2']."' />
                    <input type='hidden' name='Address3' value='' />
                    <input type='hidden' name='Address4' value='' />
                    <input type='hidden' name='City' value='".$ccUserData[0]['town']."' />
                    <input type='hidden' name='State' value='".$ccUserData[0]['county']."' />
                    <input type='hidden' name='PostCode' value='".$ccUserData[0]['postcode']."' />
                    <input type='hidden' name='CV2Mandatory' value='true' />
                    <input type='hidden' name='Address1Mandatory' value='true' />
                    <input type='hidden' name='CityMandatory' value='true' />
                    <input type='hidden' name='PostCodeMandatory' value='true' />
                    <input type='hidden' name='StateMandatory' value='true' />
                    <input type='hidden' name='CountryMandatory' value='false' />";

    if($module['dsr']>0) {
        $hiddenVars = $hiddenVars."<input type='hidden' name='ResultDeliveryMethod' value='SERVER' />";
        $hiddenVars = $hiddenVars."<input type='hidden' name='ServerResultURL' value='".$GLOBALS['storeURL']."/modules/gateway/CardSave/response.php' />";
    } else {
        $hiddenVars = $hiddenVars."<input type='hidden' name='ResultDeliveryMethod' value='POST' />";
        $hiddenVars = $hiddenVars."<input type='hidden' name='ServerResultURL' value='' />";

    }
    $hiddenVars = $hiddenVars."<input type='hidden' name='PaymentFormDisplaysResult' value='false' />";
    return $hiddenVars;
}

///////////////////////////
// Other Vars
////////
$formAction = "https://mms.cardsaveonlinepayments.com/Pages/PublicPages/PaymentForm.aspx";
$formMethod = "post";
$formTarget = "_self";
$transfer = "auto";
$stateUpdate = TRUE;

function checkHash(){
    global $module, $config, $GLOBALS;
    // echo the request and build the string
    //echo "CHECKING HASH...<br>";
    $hash = "PreSharedKey=".$module['psk']."&MerchantID=".$module['acNo']."&Password=".$module['pwd']."&";
    foreach ($_REQUEST as $k => $v) {
        if($k != "HashDigest" && $k != "MerchantID"){
            $hash = $hash."".$k."=".$v."&";
        }
    }
    $hash = rtrim($hash, "&");
    //echo "Raw hash: ".$hash."<br>";
    //echo "Posted hash: ".$_REQUEST["HashDigest"]."<br>";
    //echo "Encoded hash: ".sha1($hash)."<br>";
    if($_REQUEST["HashDigest"] == sha1($hash)){
        return TRUE;
    }else{
        return FALSE;
    }
}

function success(){


    global $basket;

    if($_POST['OrderID'] == $basket['cart_order_id'] && $_POST['StatusCode']=="0" && checkHash()){

        return TRUE;

    } else {

        return FALSE;

    }

}

?>