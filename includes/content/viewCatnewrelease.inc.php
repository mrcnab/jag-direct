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
|	viewCatlastest.inc.php
|   ========================================
|	Display the Current Category	
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

if(isset($_GET['page'])){
	
	$page = treatGet($_GET['page']);

} else {
	
	$page = 0;

}

$view_cat_new_release = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/content/viewCatnewrelease.tpl");


// build query
	
	$productListQuery = "SELECT ".$glob['dbprefix']."CubeCart_cats_idx.cat_id, ".$glob['dbprefix']."CubeCart_cats_idx.productId, productCode, quantity, description, image, price, name, popularity, sale_price, stock_level, useStockLevel FROM ".$glob['dbprefix']."CubeCart_cats_idx INNER JOIN ".$glob['dbprefix']."CubeCart_inventory ON ".$glob['dbprefix']."CubeCart_cats_idx.productId = ".$glob['dbprefix']."CubeCart_inventory.productId where `showFeatured` = 0 order by productId desc ";
	

$productResults = $db->select($productListQuery, $config['productPages'], $page);

// get different languages 
if($productResults == TRUE && $lang_folder !== $config['defaultLang']){

	for($i=0;$i<count($productResults);$i++){
	
		if(($val = prodAltLang($productResults[$i]['productId'])) == TRUE){
			
				$productResults[$i]['name'] = $val['name'];
				$productResults[$i]['description'] = $val['description'];
		
		}
		
	}

}

$totalNoProducts = $db->numrows($productListQuery);

// get current category info
	if(isset($_GET['catId']) && $_GET['catId']>0){
		$currentCatQuery = "SELECT cat_name, cat_father_id, cat_id, cat_image FROM ".$glob['dbprefix']."CubeCart_category WHERE cat_id = ".$db->mySQLSafe($_GET['catId']);
		$currentCat = $db->select($currentCatQuery);
		
		$resultForeign = $db->select("SELECT cat_master_id as cat_id, cat_name FROM ".$glob['dbprefix']."CubeCart_cats_lang WHERE cat_lang = '".$lang_folder."' AND cat_master_id = ".$db->mySQLSafe($_GET['catId']));
		
		if($resultForeign == TRUE){
			
			$currentCat[0]['cat_name'] = $resultForeign[0]['cat_name'];
		
		}
		
		
	}

		if(!empty($currentCat[0]['cat_image'])) {
			$view_cat_new_release->assign("IMG_CURENT_CATEGORY","images/uploads/".$currentCat[0]['cat_image']);
			$view_cat_new_release->assign("TXT_CURENT_CATEGORY",validHTML($currentCat[0]['cat_name']));
			$view_cat_new_release->parse("view_cat_new_release.cat_img");
		}

	if(isset($_GET['searchStr'])){
		
		$view_cat_new_release->assign("LANG_LATEST_PRODUCTS",$lang['front']['viewCatlastest']['latest_products']);
		$view_cat_new_release->assign("TXT_CAT_TITLE",$lang['front']['viewCatlastest']['search_results']);
		$view_cat_new_release->assign("PRODUCT_NAME",$lang['front']['viewCatlastest']['productname']);
		$view_cat_new_release->assign("SIZE_CHART",$lang['front']['viewCatlastest']['sizechart']);
			
	} elseif($_GET['catId']=="saleItems" && $config['saleMode']>0) {
		
		$view_cat_new_release->assign("TXT_CAT_TITLE",$lang['front']['viewCatlastest']['sale_items']);
	
	} else {
		
		$view_cat_new_release->assign("TXT_CAT_TITLE",validHTML($currentCat[0]['cat_name']));
	
	}
	
	$view_cat_new_release->assign("LANG_IMAGE",$lang['front']['viewCatlastest']['image']);
	$view_cat_new_release->assign("LANG_DESC",$lang['front']['viewCatlastest']['description']);
	$view_cat_new_release->assign("LANG_PRICE",$lang['front']['viewCatlastest']['price']);
	$view_cat_new_release->assign("PRODUCT_NAME",$lang['front']['viewCatlastest']['productname']);
	$view_cat_new_release->assign("PAGINATION",$db->paginate($totalNoProducts, $config['productPages'], $page, "page"));

// repeated region
if($productResults == TRUE){
	
	if($_GET['catId']>0){
	
		$view_cat_new_release->assign("LANG_CURRENT_DIR",$lang['front']['viewCatlastest']['products_in']);
		$view_cat_new_release->assign("CURRENT_DIR",getCatDir(validHTML($currentCat[0]['cat_name']),$currentCat[0]['cat_father_id'], $currentCat[0]['cat_id'], $link=TRUE));
	
	}
	
	for ($i=0; $i<count($productResults); $i++){
	
		// alternate class
		$view_cat_new_release->assign("CLASS",cellColor($i, $tdEven="tdEven", $tdOdd="tdOdd"));

		if(file_exists($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$productResults[$i]['image'])){
			
			$view_cat_new_release->assign("SRC_PROD_THUMB",$GLOBALS['rootRel']."images/uploads/thumbs/thumb_".$productResults[$i]['image']);
		} else {
			$view_cat_new_release->assign("SRC_PROD_THUMB",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");
		}
		
		
		if(file_exists($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$productResults[$i]['image'])){
			
			$view_cat_new_release->assign("SRC_PROD",$GLOBALS['rootRel']."images/uploads/".$productResults[$i]['image']);
		} else {
			$view_cat_new_release->assign("SRC_PROD",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");
		}


		$view_cat_new_release->assign("TXT_TITLE",validHTML($productResults[$i]['name']));	
		$view_cat_new_release->assign("PRODUCT_NAME",$lang['front']['viewCatlastest']['productname']);	

		$view_cat_new_release->assign("TXT_DESC",substr(strip_tags($productResults[$i]['description']),0,$config['productPrecis'])."&hellip;");

		
		$salePrice = salePrice($productResults[$i]['price'], $productResults[$i]['sale_price']);
		
		if($salePrice != ""){
		$view_cat_new_release->assign("TXT_SALE_PRICE", priceFormat($salePrice));	
		$view_cat_new_release->assign("TXT_PRICE",priceFormat($productResults[$i]['price']));
		$view_cat_new_release->parse("view_cat_new_release.productTable.products.sale_true");
		}
		
		if($salePrice == ""){
		$view_cat_new_release->assign("TXT_PRICE",priceFormat($productResults[$i]['price']));
		$view_cat_new_release->parse("view_cat_new_release.productTable.products.sale_false");
		}
		
				
		

		if(isset($_GET['add']) && isset($_GET['quan'])){
			
			$view_cat_new_release->assign("CURRENT_URL",str_replace(array("&amp;add=".$_GET['add'],"&amp;quan=".$_GET['quan']),"",currentPage()));
			
		} else {
		
			$view_cat_new_release->assign("CURRENT_URL",currentPage());
			
		}

		if($config['outofstockPurchase']==1){
			
			$view_cat_new_release->assign("BTN_BUY",$lang['front']['viewCatlastest']['buy']);
			$view_cat_new_release->assign("PRODUCT_ID",$productResults[$i]['productId']);
			$view_cat_new_release->parse("view_cat_new_release.productTable.products.buy_btn");
		
		} elseif($productResults[$i]['useStockLevel']==1 && $productResults[$i]['stock_level']>0){
			
			$view_cat_new_release->assign("BTN_BUY",$lang['front']['viewCatlastest']['buy']);
			$view_cat_new_release->assign("PRODUCT_ID",$productResults[$i]['productId']);
			$view_cat_new_release->parse("view_cat_new_release.productTable.products.buy_btn");
		
		} elseif($productResults[$i]['useStockLevel']==0){
		
			$view_cat_new_release->assign("BTN_BUY",$lang['front']['viewCatlastest']['buy']);
			$view_cat_new_release->assign("PRODUCT_ID",$productResults[$i]['productId']);
			$view_cat_new_release->parse("view_cat_new_release.productTable.products.buy_btn");
		
		}

		$view_cat_new_release->assign("BTN_MORE",$lang['front']['viewCatlastest']['more']);
		$view_cat_new_release->assign("PRODUCT_ID",$productResults[$i]['productId']);

		if($productResults[$i]['stock_level']<1 && $productResults[$i]['useStockLevel']==1 && $productResults[$i]['digital']==0){
		
			$view_cat_new_release->assign("TXT_OUTOFSTOCK",$lang['front']['viewCatlastest']['out_of_stock']);
			
			
		} else {
		
			$view_cat_new_release->assign("TXT_OUTOFSTOCK","");
		
		}
		
		$view_cat_new_release->parse("view_cat_new_release.productTable.products");
	}
	$view_cat_new_release->parse("view_cat_new_release.productTable");

} elseif(isset($_GET['searchStr'])) {

	$view_cat_new_release->assign("TXT_NO_PRODUCTS",$lang['front']['viewCatlastest']['no_products_match']." ".treatGet($_GET['searchStr']));
	$view_cat_new_release->parse("view_cat_new_release.noProducts");

} else {
	
	$view_cat_new_release->assign("TXT_NO_PRODUCTS",$lang['front']['viewCatlastest']['no_prods_in_cat']);
	$view_cat_new_release->parse("view_cat_new_release.noProducts");

}

$view_cat_new_release->parse("view_cat_new_release");
$page_content = $view_cat_new_release->text("view_cat_new_release");
?>