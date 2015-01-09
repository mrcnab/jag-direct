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
|	confirmed.inc.php
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
include_once("includes/global.inc.php");
$enableSSl = 1;

// initiate db class
include_once("classes/db.inc.php");

include_once("includes/functions.inc.php");
$config = fetchDbConfig("config");

function serverPostSuccess(){
    global $order;
    // we need to see what the status of the order is
    // by now it has been updated to processing or pending by response.php
    $db = new db();
    $orderId = $_REQUEST['OrderID'];
    $order = $db->select("SELECT * FROM ".$glob['dbprefix']."cubecart_order_sum WHERE cart_order_id = '".$orderId."';");
    //echo "status: ".$order[0]['status'];
    if($order[0]['status']>1){
        return TRUE;
    }else{
        return FALSE;
    }

}

if(!isset($config)){
    echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
    exit;
}

require_once("classes/cart.php");
$cart = new cart();

$basket = $cart->cartContents($ccUserData[0]['basket']);

// WORK OUT IS THE ORDER WAS SUCCESSFULL OR NOT ;)

// 1. Include gateway file
include("modules/gateway/CardSave/transfer.inc.php");

// 2. Include function which returns ture or false
$success = serverPostSuccess();

$confirmation = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/content/confirmed.tpl");

$confirmation->assign("LANG_CONFIRMATION_SCREEN",$lang['front']['confirmed']['confirmation_screen']);

$confirmation->assign("LANG_CART",$lang['front']['confirmed']['cart']);
$confirmation->assign("LANG_ADDRESS",$lang['front']['confirmed']['address']);
$confirmation->assign("LANG_PAYMENT",$lang['front']['confirmed']['payment']);
$confirmation->assign("LANG_COMPLETE",$lang['front']['confirmed']['complete']);

if($success == TRUE){

    // CardSave want to add some extra text to the confirmation page
    // It's an IPC requirement so we want to display the message and order id etc
    $extra = "<br><br>Order Number: ".$order[0]['cart_order_id']."<br>Payment Processor Response: ".$order[0]['comments']."</strong><br>";
    $confirmation->assign("LANG_ORDER_SUCCESSFUL",$lang['front']['confirmed']['order_success'].$extra);

    // add affilate tracking code/module
    $affiliateModule = $db->select("SELECT folder, `default` FROM ".$glob['dbprefix']."cubecart_modules WHERE module='affiliate' AND status = 1");

    if($affiliateModule == TRUE) {

        for($i=0; $i<count($affiliateModule); $i++){

            include("modules/affiliate/".$gatewayModules[$i]['folder']."/tracker.inc.php");
            // VARS AVAILABLE
            // Order Id Number $basket['cart_order_id']
            // Order Total $order[0]['prod_total']
            $confirmation->assign("AFFILIATE_IMG_TRACK",$affCode);
            $confirmation->parse("confirmation.session_true.order_success.aff_track");

        }

    }

    $confirmation->parse("confirmation.session_true.order_success");

    // empty basket & other session data
    $basket = $cart->unsetVar("conts");
    $basket = $cart->unsetVar("delInf");
    $basket = $cart->unsetVar("cart_order_id");
    $basket = $cart->unsetVar("shipCost");
    $basket = $cart->unsetVar("subTotal");
    $basket = $cart->unsetVar("tax");
    $basket = $cart->unsetVar("shipCost");
    $basket = $cart->unsetVar("grandTotal");
    $basket = $cart->unsetVar("customer_comments");
    $basket = $cart->unsetVar("counted");
    $basket = $cart->unsetVar("shipMethod");


} else {

    $extra = "<br><br>Payment Processor Response: ".$order[0]['comments']."</strong><br><br>";
    $confirmation->assign("LANG_ORDER_FAILED",$lang['front']['confirmed']['order_fail'].$extra);
    $confirmation->assign("LANG_ORDER_RETRY",$lang['front']['confirmed']['try_again_desc']);
    $confirmation->assign("LANG_RETRY_BUTTON",$lang['front']['confirmed']['try_again']);
    $confirmation->parse("confirmation.session_true.order_failed");
}

$confirmation->assign("LANG_LOGIN_REQUIRED",$lang['front']['confirmed']['request_login']);

if($ccUserData[0]['customer_id']>0) $confirmation->parse("confirmation.session_true");

else $confirmation->parse("confirmation.session_false");

$confirmation->parse("confirmation");

$page_content = $confirmation->text("confirmation");
?>