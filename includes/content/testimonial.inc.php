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

$testimonial=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/content/testimonial.tpl");


// query database
$results = $db->select("SELECT id, answer,  question FROM ".$glob['dbprefix']."CubeCart_testimonial WHERE status = 1 order by id desc");

//$resultsForeign = $db->select("SELECT cat_master_id as cat_id, cat_name FROM ".$glob['dbprefix']."CubeCart_cats_lang WHERE cat_lang = '".$lang_folder."'");  

	// loop results
	if($results == TRUE){	
					foreach($results as $value){				
					$testimonial->assign("TESTIMONIAL_ANSWER",$value['answer'],0,85);
					$testimonial->assign("TESTIMONIAL_QUESTION",$value['question']);
					$testimonial->assign("TESTIMONIAL_ID",$value['id']);
					$testimonial->parse("testimonial.li");
			}	
	}
$testimonial->parse("testimonial");	
$page_content = $testimonial->text("testimonial");
?>