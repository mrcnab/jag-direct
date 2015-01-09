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
|	response.php
|   ========================================
|	Core functions for the CardSave Gateway
|
|	CubeCart v3.x CardSave Payment Gateway
|   The Cardsave payment gateway software is provided on an "AS IS" basis, without
|   warranty of any kind, including without limitation the warranties of merchantability,
|   fitness for a particular purpose and non-infringement. The entire risk as to the 
|   quality and performance of the software is borne by the merchant or licensor.
+--------------------------------------------------------------------------
*/
// INCLUDE CORE VARIABLES & FUNCTIONS
include_once("../../../includes/global.inc.php");

// initiate db class
include_once("../../../classes/db.inc.php");
$db = new db();

include_once("../../../includes/functions.inc.php");
$config = fetchDbConfig("config");

include_once("../../../includes/sslSwitch.inc.php");

// get session data
if($_GET['act']!=="logout"){
    include_once("../../../includes/session.inc.php");
}

$lang_folder = "";

if(empty($ccUserData[0]['lang'])){
    $lang_folder = $config['defaultLang'];
} else {
    $lang_folder = $ccUserData[0]['lang'];
}

include_once("../../../language/".$lang_folder."/lang.inc.php");

require_once("../../../classes/cart.php");

global $basket, $GLOBALS;

$cart = new cart();
$basket = $cart->cartContents($ccUserData[0]['basket']);

$message = $_POST['Message'];
$orderId = $_POST['OrderID'];
$arr = array("comments" => $db->mySQLSafe($message,"'"));
$updatedMessage = $db->update($glob['dbprefix']."cubecart_order_sum", $arr,"cart_order_id=".$db->mySQLSafe($orderId,"'"));

if($_POST['StatusCode']=="0"){
    //fwrite($fh, "SUCCESS\n");
    $cart_order_id = $orderId;
    include_once("../../../includes/orderSuccess.inc.php");
}
?>