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
|	index.inc.php
|   ========================================
|	The Homepage :O)	
+--------------------------------------------------------------------------
*/
if(isset($_GET['page'])){
	
	$page = treatGet($_GET['page']);

} else {
	
	$page = 0;

}
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

$index=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/content/index.tpl");

include("language/".$lang_folder."/home.inc.php");

if($home['enabled']==0){

	include("language/".$config['defaultLang']."/home.inc.php");

}
$index->assign("HOME_TITLE",validHTML(stripslashes($home['title'])));
$index->assign("HOME_CONTENT",stripslashes($home['copy']));

$latestProducts = $db->select("SELECT productId, image, price, name, sale_price FROM ".$glob['dbprefix']."CubeCart_inventory WHERE `showFeatured` = 0 ORDER BY productId DESC LIMIT ".$config['noLatestProds']);



if($latestProducts==TRUE){
	
	for($i=0;$i<count($latestProducts);$i++){
	
		if(($val = prodAltLang($latestProducts[$i]['productId'])) == TRUE){
			
				$latestProducts[$i]['name'] = $val['name'];
		
		}
		
		if(file_exists($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$latestProducts[$i]['image'])){			
			$index->assign("VAL_IMG_SRC",$GLOBALS['rootRel']."images/uploads/thumbs/thumb_".$latestProducts[$i]['image']);		
		} else {		
			$index->assign("VAL_IMG_SRC",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");	
		}
		
		if(file_exists($GLOBALS['rootDir']."/images/uploads/".$latestProducts[$i]['image'])){					
			$index->assign("VAL_IMG",$GLOBALS['rootRel']."images/uploads/".$latestProducts[$i]['image']);		
		} else {		
			$index->assign("VAL_IMG",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");
		}
		
		
		
	$index->assign("LANG_LATEST_PRODUCTS",$lang['front']['index']['new_release']);
	$index->assign("LANG_MOBILE_ACCESSORIES",$lang['front']['index']['accessories']);
	$index->assign("PRODUCT_NAME",$lang['front']['index']['productname']);
	$index->assign("VIEW_ALL_PRODUCTS",$lang['front']['index']['viewallproducts']);
	$index->assign("PRODUCT_DETAIL",$lang['front']['index']['prodetail']);
	$index->assign("SIZE_CHART",$lang['front']['index']['sizechart']);
	
	if(salePrice($latestProducts[$i]['price'], $latestProducts[$i]['sale_price'])==FALSE){
			
			$index->assign("TXT_PRICE",(priceFormat($latestProducts[$i]['price'])));
			
			$index->assign("TXT_PRO_NAME",($latestProducts[$i]['name']));
	
	} else {
			
		
			$index->assign("TXT_PRO_NAME",($latestProducts[$i]['name']));
			
			$index->assign("PAGINATION",$db->paginate($totalNoProducts, $config['productPages'], $page, "page"));
	
	}
		
		$salePrice = salePrice($latestProducts[$i]['price'], $latestProducts[$i]['sale_price']);
		
		if($salePrice != ""){
		$index->assign("TXT_PRICE", priceFormat($salePrice));	
		}else{
			$index->assign("TXT_PRICE",priceFormat($latestProducts[$i]['price']));
			}
		
	$index->assign("VAL_WIDTH", $config['gdthumbSize']+75);		
	$index->assign("VAL_PRODUCT_ID",$latestProducts[$i]['productId']);	
	$index->assign("VAL_PRODUCT_NAME",validHTML(substr($latestProducts[$i]['name'],0,25)));	
	$index->parse("index.latest_prods.repeat_prods");	
	}	
	$index->parse("index.latest_prods");
}



 $specialProducts = $db->select("SELECT productId, image, price, name, sale_price, description FROM ".$glob['dbprefix']."CubeCart_inventory WHERE `showFeatured` = 1 ORDER BY productId DESC LIMIT ".$config['noLatestProds']);

if($specialProducts==TRUE){	
	for($j=0;$j<count($specialProducts);$j++){
	
		if(($val = prodAltLang($specialProducts[$j]['productId'])) == TRUE){			
				$specialProducts[$j]['name'] = $val['name'];		
		}
	

		
		if(file_exists($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$specialProducts[$j]['image'])){			
			$index->assign("VAL_IMG_SRC_SPECIAL",$GLOBALS['rootRel']."images/uploads/thumbs/thumb_".$specialProducts[$j]['image']);		
		} else {		
			$index->assign("VAL_IMG_SRC_SPECIAL",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");	
		}
		
		if(file_exists($GLOBALS['rootDir']."/images/uploads/".$specialProducts[$j]['image'])){					
			$index->assign("VAL_IMG_SPECIAL",$GLOBALS['rootRel']."images/uploads/".$specialProducts[$j]['image']);		
		} else {		
			$index->assign("VAL_IMG_SPECIAL",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");
		}



		$index->assign("TXT_SPECIAL_PRICE", priceFormat($specialProducts[$j]['price']));		
		$index->assign("VAL_SPECIAL_ID",$specialProducts[$j]['productId']);	
		$index->assign("VAL_SPECIAL_DES",validHTML(substr($specialProducts[$j]['description'],0,200)."..."));
		$index->assign("VAL_SPECIAL_NAME",validHTML(substr($specialProducts[$j]['name'],0,12)));	
		$index->parse("index.mobile_accessories.repeat");
		}	
		$index->parse("index.mobile_accessories");	
}
$index->parse("index.top_products");



$index->parse("index");
$page_content = $index->text("index");
?>