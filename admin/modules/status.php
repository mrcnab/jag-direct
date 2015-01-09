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
|	status.php
|   ========================================
|	Manage Module State
+--------------------------------------------------------------------------
*/
$query = sprintf("SELECT * FROM ".$glob['dbprefix']."CubeCart_Modules WHERE module = %s AND folder = %s", $db->mySQLSafe($_GET['module']), $db->mySQLSafe($_GET['folder']));
$moduleState = $db->select($query);

$data['status'] = $db->mySQLSafe($_POST['module']['status']);
$data['default'] = $db->mySQLSafe($_POST['module']['default']);

if($_POST['module']['default']==1){

	$resetData['default'] = 0;
	$where = "module = ".$db->mySQLSafe($_GET['module']);
	$update = $db->update($glob['dbprefix']."CubeCart_Modules", $resetData, $where);

}

if($moduleState == TRUE){

	$where = "module = ".$db->mySQLSafe($_GET['module'])." AND folder = ".$db->mySQLSafe($_GET['folder']);
	$update = $db->update($glob['dbprefix']."CubeCart_Modules", $data, $where);

} else {

	$data['folder'] = $db->mySQLSafe($_GET['folder']);
	$data['module'] = $db->mySQLSafe($_GET['module']);
	$insert = $db->insert($glob['dbprefix']."CubeCart_Modules", $data);

}
?>