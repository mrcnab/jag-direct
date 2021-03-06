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
|	auth.inc.php
|   ========================================
|	Admin Authentication and Permissions
+--------------------------------------------------------------------------
*/

if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}
ob_start();
$sessionDomain = substr($GLOBALS['rootRel'],0, strlen($GLOBALS['rootRel'])-1);
@ini_set("session.cookie_path",$sessionDomain);
if($glob['rootRel']=="/"){

    $sessionName = "ccSID";
} else {
    $sessionName = "ccSID".md5($glob['rootRel']);
}
ob_start();
session_name($sessionName);
session_start();

if(!isset($_SESSION['ccAdmin'])){
	
	header("Location: ".$GLOBALS['rootRel']."admin/login.php?goto=".currentPage());
	exit;

// check session path is correct
} elseif(strpos(dirname($_SERVER['PHP_SELF']), $_SESSION['ccAdminPath']) !== 0){
	
	header("Location: ".$GLOBALS['rootRel']."admin/login.php?goto=".currentPage());
	exit;
	
} else {
	// get session information as array
	include_once($GLOBALS['rootDir']."/classes/db.inc.php");
	$db = new db();
	$query = sprintf("SELECT * FROM ".$glob['dbprefix']."CubeCart_admin_users WHERE adminId = %s", $db->mySQLSafe($_SESSION['ccAdmin']));
	$ccAdminData = $db->select($query);
	
	// fimd permissions for those who are not super users
	if($ccAdminData[0]['isSuper']==0){
		
		$query = sprintf("SELECT ".$glob['dbprefix']."CubeCart_admin_sections.sectId, name, `read`, `write`, `edit`, `delete` FROM ".$glob['dbprefix']."CubeCart_admin_sections LEFT JOIN ".$glob['dbprefix']."CubeCart_admin_permissions ON ".$glob['dbprefix']."CubeCart_admin_sections.sectId = ".$glob['dbprefix']."CubeCart_admin_permissions.sectId WHERE adminId = %s", $db->mySQLSafe($_SESSION['ccAdmin']));
		$permissionArray = $db->select($query);
		
		if(is_array($permissionArray)){
			for($i=0; $i<count($permissionArray); $i++){
		
				foreach($permissionArray[$i] as $key => $value){
				
					$masterKey = $permissionArray[$i]['name'];
					$ccAdminData[$masterKey][$key] = $value;
				
				}
			}
		}
	}
}
unset($permissionArray);
?>