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
|	testimonial.inc.php
|   ========================================
|	Categories Box	
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

// query database
$results = $db->select("SELECT id, answer, question FROM ".$glob['dbprefix']."CubeCart_testimonial WHERE status = 1 ORDER BY id desc LIMIT 0,5");

//$resultsForeign = $db->select("SELECT cat_master_id as cat_id, cat_name FROM ".$glob['dbprefix']."CubeCart_cats_lang WHERE cat_lang = '".$lang_folder."'");  

$box_content=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/testimonial.tpl");

	// loop results
	if($results == TRUE){	
				if(count($results) > 0  && $results !='') {
				foreach($results as $value){				
					$box_content->assign("TESTIMONIAL_TITLE",substr($value['question'],0,15));
					$box_content->assign("TESTIMONIAL_ANSWER",substr($value['answer'],0,85)."...");
					$box_content->assign("TESTIMONIAL_ID",$value['id']);
					$box_content->parse("testimonial.services");
				}
				
			}	
	}
	
$box_content->parse("testimonial");
$box_content = $box_content->text("testimonial");
?>