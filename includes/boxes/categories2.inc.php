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
|	categories2.inc.php
|   ========================================
|	Categories Box	
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

// query database
$results = $db->select("SELECT id, imagePath, imageName FROM ".$glob['dbprefix']."CubeCart_banner WHERE status = 1 ORDER BY id desc LIMIT 0,15");

//$resultsForeign = $db->select("SELECT cat_master_id as cat_id, cat_name FROM ".$glob['dbprefix']."CubeCart_cats_lang WHERE cat_lang = '".$lang_folder."'");  

$box_content=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/categories2.tpl");

$box_content->assign("LANG_CATEGORY_TITLE",$lang['front']['boxes']['shop_by_cat']);

$box_content->assign("SRC_IMG","skins/".$config['skinDir']."/styleImages/product-gallery-img1.jpg");


$box_content->assign("LANG_CATEGORY_TITLE",$lang['front']['boxes']['shop_by_cat']);

	$box_content->assign("LANG_HOME",$lang['front']['boxes']['homepage']);

	// loop results
	if($results == TRUE){
	
				if(count($results) > 0  && $results !='') {
				foreach($results as $value){
				
					$box_content->assign("BRANE_NAME",$value['imageName']);
					$box_content->assign("BRAND_IMAGE",$value['imagePath']);
					$box_content->assign("BRAND_ID",$value['id']);
					$box_content->parse("categories2.li");
				}
			}
	
	
//		for ($i=0; $i<count($results); $i++){
//		
//			if(is_array($resultsForeign)){
//				
//				for ($k=0; $k<count($resultsForeign); $k++){
//			
//					if($resultsForeign[$k]['cat_id'] == $results[$i]['cat_id']){
//					
//						$results[$i]['cat_name'] = validHTML($resultsForeign[$k]['cat_name']);						
//					
//					}
//					
//				}
//			
//			} else {
//				$results[$i]['cat_image'] = validHTML($GLOBALS['rootRel']."images/uploads/thumbs/thumb_".$results[$i]['cat_image']);
//				$results[$i]['cat_name'] = validHTML($results[$i]['cat_name']);
//			}
//			
//			$box_content->assign("DATA",$results[$i]);
//			$box_content->parse("categories2.li");
//		} // end for loop
	}
	
	if($config['saleMode']>0){
		$box_content->assign("LANG_SALE_ITEMS",$lang['front']['boxes']['sale_items']);
		$box_content->parse("categories2.sale");		
	}

$box_content->parse("categories2");
$box_content = $box_content->text("categories2");
?>