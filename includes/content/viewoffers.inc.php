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
|	viewOffers.inc.php
|   ========================================
|	Display the Current Category	
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}
////////////////////////
// BUILD SUB CATEGORIES
////////

// query database
$results = $db->select("SELECT * FROM ".$glob['dbprefix']."CubeCart_inventory WHERE productMonth = 1 ORDER BY productId desc");

$view_offer = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/content/viewoffers.tpl");
	// loop results

	if($results == TRUE){	
				if(count($results) > 0  && $results !='') {
				foreach($results as $value){
				
					$view_offer->assign("PRODUCT_NAME",$value['name']);	
										
					if($value['sale_price'] != ""){
					$view_offer->assign("PRODUCT_PRICE", priceFormat($value['sale_price']));	
					}else{
					$view_offer->assign("PRODUCT_PRICE",priceFormat($value['price']));	
					}					
										
					if(file_exists($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$value['image'])){					
					$view_offer->assign("SRC_PROD_THUMB",$GLOBALS['rootRel']."/images/uploads/thumbs/thumb_".$value['image']);
					} else {
					$view_offer->assign("SRC_PROD_THUMB",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");
					}	
					
					
					if(file_exists($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$value['image'])){					
					$view_offer->assign("SRC_PROD",$GLOBALS['rootRel']."/images/uploads/".$value['image']);
					} else {
					$view_offer->assign("SRC_PROD",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");
					}	
					
									
					$view_offer->assign("PRODUCT_ID",$value['productId']);
					$view_offer->parse("view_offer.products");
				}
			}	
	}
	

$view_offer->parse("view_offer");
$page_content = $view_offer->text("view_offer");
?>