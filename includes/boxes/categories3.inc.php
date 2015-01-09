<?php
/*
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


$boxresults = $db->select("SELECT box_id, box_title FROM ".$glob['dbprefix']."CubeCart_boxs order by box_id asc");

// query database
//$results = $db->select("SELECT cat_name, cat_id FROM ".$glob['dbprefix']."CubeCart_category WHERE cat_father_id = 0 order by cat_name asc");

$box_content=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/categories3.tpl");

	// loop results

	if($boxresults == TRUE){	
	for ($k=0; $k<count($boxresults); $k++){
			$box_id = $boxresults[$k]['box_id'];		
			$box_content->assign("DATA1",$boxresults[$k]);
			$sub_result_box = $db->select("SELECT cat_name, cat_id 
									FROM ".$glob['dbprefix']."CubeCart_category 
										WHERE cat_father_id = 0 and  box_id = $box_id order by cat_name asc");
										
			$box_content->assign("BOX_TITLE",substr($boxresults[$k]['box_title'],0,20));								
										
	
	
		if($sub_result_box  == TRUE){
		for ($i=0; $i<count($sub_result_box); $i++){
			$parent_category_id = $sub_result_box[$i]['cat_id'];		
			$box_content->assign("DATA",$sub_result_box[$i]);
			$sub_result = $db->select("SELECT cat_name, cat_id 
									FROM ".$glob['dbprefix']."CubeCart_category 
										WHERE cat_father_id = $parent_category_id order by cat_name asc");
										
			$box_content->assign("VAL_CAT_ID", $sub_result_box[$i]['cat_id']);							
										
										
			if($sub_result == TRUE){
				for ($j=0; $j<count($sub_result); $j++){
					$cat_id = $sub_result[$i]['cat_id'];
					$box_content->assign("DATA2",$sub_result[$j]);
					
					$box_content->parse("categories3.boxcategory.main_div.maincategory.subcategory");
				}
				$box_content->parse("categories3.boxcategory.main_div.maincategory");
			}
			if($sub_result > 0){
			$box_content->parse("categories3.boxcategory.main_div.category");
			
			}else{
			$box_content->parse("categories3.boxcategory.main_div.category_false");
			
			}
			$box_content->parse("categories3.boxcategory.main_div");		
			} // end for loop
			}			
			$box_content->parse("categories3.boxid");
			$box_content->parse("categories3.boxid_btm");	
			$box_content->parse("categories3.boxcategory");		
		} // end for loop
	}
	

$box_content->parse("categories3");
$box_content = $box_content->text("categories3");
?>