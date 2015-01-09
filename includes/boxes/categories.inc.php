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
|	categories.inc.php
|   ========================================
|	Categories Box	
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

// query database
$results = $db->select("SELECT cat_name, cat_id FROM ".$glob['dbprefix']."CubeCart_category WHERE cat_father_id = 0 order by cat_id ASC");


$resultsForeign = $db->select("SELECT cat_master_id as cat_id, cat_name FROM ".$glob['dbprefix']."CubeCart_cats_lang WHERE cat_lang = '".$lang_folder."'");  

$box_content=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/categories.tpl");

$box_content->assign("LANG_CATEGORY_TITLE",$lang['front']['boxes']['shop_by_cat']);

	
	// loop results
	if($results == TRUE){
		for ($i=0; $i<count($results); $i++){
		
			if(is_array($resultsForeign)){
				
				for ($k=0; $k<count($resultsForeign); $k++){
			
					if($resultsForeign[$k]['cat_id'] == $results[$i]['cat_id']){
					
						$results[$i]['cat_name'] = validHTML(substr($resultsForeign[$k]['cat_name'],0,20));
					
					}
					
				}
			
			} else {
				$results[$i]['cat_name'] = validHTML(substr($results[$i]['cat_name'],0,25));
			}
			
			$box_content->assign("DATA",$results[$i]);
			$box_content->parse("categories.li");
		} // end for loop
	}
	
	
		$results = $db->select("SELECT cat_name, cat_id FROM ".$glob['dbprefix']."CubeCart_category WHERE cat_father_id = 0 order by cat_id asc");
	if($results == TRUE){
		for ($i=0; $i<count($results); $i++){
			$parent_category_id = $results[$i]['cat_id'];
			
			$sub_result = $db->select("SELECT cat_name, cat_id 
									FROM ".$glob['dbprefix']."CubeCart_category 
										WHERE cat_father_id = $parent_category_id order by cat_name asc");
		//		print_r($sub_result);						
			if($sub_result == TRUE){
			
				for ($j=0; $j<count($sub_result); $j++){	
					$box_content->assign("DATA2",$sub_result[$j]);
					$box_content->parse("categories.maincategory.subcategory");
				}
					
			}
			
			
			
			
			$box_content->assign("DATA",$results[$i]);			
			$box_content->parse("categories.maincategory");		
	
		} // end for loop
	}
		
	
	
	if($config['saleMode']>0){
		$box_content->assign("LANG_SALE_ITEMS",$lang['front']['boxes']['sale_items']);
		
		$box_content->parse("categories.sale");		
	}

$box_content->parse("categories");
$box_content = $box_content->text("categories");
?>