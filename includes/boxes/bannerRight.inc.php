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
|	bannerRight.inc.php
|   ========================================
|	Categories Box	
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

// query database
$results = $db->select("SELECT id, imagePath, imageName FROM ".$glob['dbprefix']."CubeCart_banner2 WHERE status = 1  ORDER BY id desc");

$box_content=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/bannerRight.tpl");
	// loop results
	if($results == TRUE){	
				if(count($results) > 0  && $results !='') {
				foreach($results as $value){
					$box_content->assign("BANNER_NAME",$value['imageName']);								
					if(file_exists($GLOBALS['rootDir']."/BannerImages/".$value['imagePath'])){					
					$box_content->assign("SRC_PROD",$GLOBALS['rootRel']."BannerImages/".$value['imagePath']);
					} else {
					$box_content->assign("SRC_PROD",$GLOBALS['rootRel']."skins/".$config['skinDir']."/styleImages/thumb_nophoto.gif");
					}					
					$box_content->assign("BANNER_ID",$value['id']);
					$box_content->parse("bannerRight");
				}
			}	
	}
	

$box_content = $box_content->text("bannerRight");
?>