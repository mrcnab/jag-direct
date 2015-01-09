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
|	siteDocs.inc.php
|   ========================================
|	Build Links to Site Docs	
+--------------------------------------------------------------------------
*/

if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

// query database
$results = $db->select("SELECT doc_id, doc_name FROM ".$glob['dbprefix']."CubeCart_docs ORDER BY doc_id ASC");

$resultsForeign = $db->select("SELECT doc_master_id as doc_id, doc_name FROM ".$glob['dbprefix']."CubeCart_docs_lang WHERE doc_lang = '".$lang_folder."'"); 

$box_content = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/siteDocs.tpl");

// build attributes
if($results == TRUE){

	// start loop
	for ($i=0; $i<count($results); $i++){
 	
		if($i<count($results)-1){
			$box_content->parse("site_docs.a.sep");
		}
		
		if(is_array($resultsForeign)){			
			for ($k=0; $k<count($resultsForeign); $k++){		
				if($resultsForeign[$k]['doc_id'] == $results[$i]['doc_id']){				
					$results[$i]['doc_name'] = $resultsForeign[$k]['doc_name'];					
				}				
			}		
		}
		
	$results[$i]['doc_link'] = "index.php?act=viewDoc&amp;docId=".$results[$i]['doc_id'];	
		if($results[$i]['doc_id'] == 3) {
			$results[$i]['doc_link'] = 'index.php?searchStr=&act=viewCatlastest&view=latest';
		}
		if($results[$i]['doc_id'] == 13) {
			$results[$i]['doc_link'] = 'cart.php?act=contacts';
		}
		if($results[$i]['doc_id'] == 8) {
			$results[$i]['doc_link'] = 'index.php?act=services';
		}
		
		if($results[$i]['doc_id'] == 1) {
			$results[$i]['doc_link'] = 'index.php';
		}
		
		$results[$i]['doc_name'] = validHTML($results[$i]['doc_name']);
		$file = $_SERVER['QUERY_STRING'];
		
		if($_REQUEST['docId'] ==  $results[$i]['doc_id']) {
			$results[$i]['class_name']=	"current";
		}else if($_REQUEST['act'] ==  'viewCatlastest' && $results[$i]['doc_id'] == 3) {
			$results[$i]['class_name']=	"current";
		}else if($_REQUEST['act'] ==  'contacts' && $results[$i]['doc_id'] == 10) {
			$results[$i]['class_name']=	"current";
		}else if($_REQUEST['act'] ==  'index.php' && $results[$i]['doc_id'] == 1) {
			$results[$i]['class_name']=	"current";
		}else if($_REQUEST['act'] ==  '' && $_REQUEST['docId'] ==  '' && $file == '' && $i == 0) {
			$results[$i]['class_name']=	"current";
		}
		
				
		$box_content->assign("DATA",$results[$i]);
		$box_content->parse("site_docs.a");
	
	} // end loop 
}
$box_content->parse("site_docs");
$box_content = $box_content->text("site_docs");
?>