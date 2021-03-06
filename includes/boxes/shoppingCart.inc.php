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
|	shoppingCart.inc.php
|   ========================================
|	Shopping Cart Box	
+--------------------------------------------------------------------------
*/

if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

$box_content=new XTemplate("skins/".$config['skinDir']."/styleTemplates/boxes/shoppingCart.tpl");

$box_content->assign("LANG_SHOPPING_CART_TITLE",$lang['front']['boxes']['shopping_cart']);
$box_content->assign("VAL_SKIN",$config['skinDir']);

require_once("classes/cart.php");
$cart = new cart();
$basket = $cart->cartContents($ccUserData[0]['basket']);

if(isset($_POST['add']) && $_POST['add']>0) {

if(!isset($_POST['productOptions'])){
	// check product options are selected if they are required
	$prodOpts = $db->select("SELECT count(product) as noOpts FROM ".$glob['dbprefix']."CubeCart_options_bot WHERE product=".$db->mySQLSafe($_POST['add']));
	// if they are required redirect to product view page
	if($prodOpts[0]['noOpts'] >0){

	header("Location: index.php?act=viewProd&productId=".$_POST['add']);
	exit;
	
	}

}

// add product to the cart
	if($_POST['quan']>0){
		$quantity = ceil($_POST['quan']);
	} else {
		$quantity = 1;
	}
	
	if(isset($_POST['productOptions'])){
	
		$basket = $cart->add($_POST['add'],$quantity,$_POST['productOptions']);
	
	} else {
	
		$basket = $cart->add($_POST['add'],$quantity,"");
	
	}
	
	// prevents refresh adding extras to the basket
	header("Location: index.php?act=viewProd&productId=".$_POST['add']);
	exit;
	
}

$cartTotal = "";

if(is_array($basket['conts']) && !empty($basket['conts'])) {
	
	foreach($basket['conts'] as $key => $value){
		
		$productId = $cart->getProductId($key);
		
		// get product details
		$product = $db->select("SELECT name, price, sale_price, productId FROM ".$glob['dbprefix']."CubeCart_inventory WHERE productId=".$db->mySQLSafe($productId));
		
		if(($val = prodAltLang($product[0]['productId'])) == TRUE){
			
			$product[0]['name'] = $val['name'];
		
		}
		
		// build the product options
		$optionKeys = $cart->getOptions($key);
		
		$optionsCost = 0;
		
		if(!empty($optionKeys)){
		
			$options = explode("|",$optionKeys);
			
			
			
			foreach($options as $value)
			{
				// look up options in database
				$option = $db->select("SELECT ".$glob['dbprefix']."CubeCart_options_bot.option_id, ".$glob['dbprefix']."CubeCart_options_bot.value_id, option_price, option_symbol, assign_id FROM `".$glob['dbprefix']."CubeCart_options_bot` INNER JOIN `".$glob['dbprefix']."CubeCart_options_mid` ON ".$glob['dbprefix']."CubeCart_options_mid.value_id = ".$glob['dbprefix']."CubeCart_options_bot.value_id INNER JOIN `".$glob['dbprefix']."CubeCart_options_top` ON ".$glob['dbprefix']."CubeCart_options_bot.option_id = ".$glob['dbprefix']."CubeCart_options_top.option_id WHERE assign_id = ".$value);
				
				if($option[0]['option_price']>0){ 
					
					if($option[0]['option_symbol']=="+"){
				
						$optionsCost = $optionsCost + $option[0]['option_price'];
			
					} elseif($option[0]['option_symbol']=="-"){
			
						$optionsCost = $optionsCost - $option[0]['option_price'];
			
					}
					
				}

			}
			
		}
		
		
		if(salePrice($product[0]['price'], $product[0]['sale_price'])==FALSE){
			
			$price = $product[0]['price'];
		
		} else {
			
			$price = salePrice($product[0]['price'], $product[0]['sale_price']);
		
		}
		
		$price = $price + ($optionsCost);
		
		$box_content->assign("PRODUCT_PRICE",priceFormat($price));
		$box_content->assign("VAL_NO_PRODUCT",$cart->cartArray['conts'][$key]["quantity"]);
		$box_content->assign("PRODUCT_ID",$productId);
		
		// chop name if too long
		if(strlen($product[0]['name']) > 15){
			$product[0]['name'] = substr($product[0]['name'],0,15)."..";
		}
		
		$box_content->assign("VAL_PRODUCT_NAME",validHTML($product[0]['name']));
		$box_content->parse("shopping_cart.contents_true");
		
		//updating quantity to stock level....
		$product = $db->select("SELECT * FROM ".$glob['dbprefix']."CubeCart_inventory INNER JOIN ".$glob['dbprefix']."CubeCart_taxes ON ".$glob['dbprefix']."CubeCart_taxes.id = taxType ".$extraJoin." WHERE productId=".$db->mySQLSafe($productId));
		if(($config['outofstockPurchase']==0) && ($product[0]["stock_level"]<$cart->cartArray['conts'][$key]["quantity"])
			&& ($product[0]["useStockLevel"]==1)) {
			$quantity = $product[0]["stock_level"];
			$cart->update($key,$quantity);
		}
		
		$cartTotal = $cartTotal + ($price * $cart->cartArray['conts'][$key]["quantity"]);
	}
	
} else {

	$box_content->assign("LANG_CART_EMPTY",$lang['front']['boxes']['basket_empty']);
	$box_content->parse("shopping_cart.contents_false");
	
}


$box_content->assign("VAL_CART_ITEMS",$cart->noItems());
$box_content->assign("LANG_ITEMS_IN_CART",$lang['front']['boxes']['items_in_cart']);

if(isset($cartTotal) && $cartTotal>0){
	$box_content->assign("VAL_CART_TOTAL",priceFormat($cartTotal));
} else {
	$box_content->assign("VAL_CART_TOTAL",priceFormat(0.00, TRUE));
}
$box_content->assign("LANG_WELCOME_GUEST",substr($lang['front']['boxes']['welcome_guest'],0,8));
$box_content->assign("LANG_TOTAL_CART_PRICE",$lang['front']['boxes']['total']);
$box_content->assign("LANG_VIEW_CART",$lang['front']['boxes']['view_basket']);

if($ccUserData[0]['customer_id']>0){
	$box_content->assign("CART_STEP","step2");
} else {
	$box_content->assign("CART_STEP","cart");
}
//************************************* For Top Heading Text Begin ******************************************//


$result = $db->select("SELECT doc_content FROM ".$glob['dbprefix']."CubeCart_docs WHERE doc_id = 14");

if(strlen($result[0]['doc_content'])>6){ 

$box_content->assign("TOP_HEADING",substr($result[0]['doc_content'],0,70));
$box_content->parse("shopping_cart.heading_true");
}else{
$box_content->parse("shopping_cart.heading_false");
}


//************************************* For Top Heading Text Ended *****************************************//



$box_content->parse("shopping_cart");

$box_content = $box_content->text("shopping_cart");
?>