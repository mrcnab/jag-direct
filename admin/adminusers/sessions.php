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
|	sessions.php
|   ========================================
|	Lists last x amount of admin logins
+--------------------------------------------------------------------------
*/
include("../../includes/ini.inc.php");
include("../../includes/global.inc.php");
require_once("../../classes/db.inc.php");
$db = new db();
include_once("../../includes/functions.inc.php");
$config = fetchDbConfig("config");

include_once("../../language/".$config['defaultLang']."/lang.inc.php");
$enableSSl = 1;
include_once("../../includes/sslSwitch.inc.php");
include("../includes/auth.inc.php");
include("../includes/header.inc.php");
$rowsPerPage = 50;
?>
<p class="pageTitle"><?php echo $lang['admin']['adminusers']['admin_sessions']; ?></p>
 
<p class="copyText"><?php echo $lang['admin']['adminusers']['sessions_desc']; ?></p>
<table width="100%"  border="0" cellspacing="0" cellpadding="3" class="mainTable">
  <tr>
  	<td class="tdTitle"><?php echo $lang['admin']['adminusers']['login_id']; ?></td>
    <td class="tdTitle"><?php echo $lang['admin']['adminusers']['username']; ?></td>
    <td align="center" class="tdTitle"><?php echo $lang['admin']['adminusers']['time']; ?></td>
	<td align="center" class="tdTitle"><?php echo $lang['admin']['adminusers']['ip_address']; ?></td>
    <td align="center" class="tdTitle"><?php echo $lang['admin']['adminusers']['success']; ?></td>
  </tr>
<?php

if(isset($_GET['page'])){
	$page = $_GET['page'];
} else {
	$page = 0;
}

$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_admin_sessions ORDER BY `time` DESC";
$results = $db->select($query, $rowsPerPage, $page);
$numrows = $db->numrows($query);

if($results == TRUE){

	for($i=0; $i<count($results); $i++) {
	
		$cellColor = "";
		$cellColor = cellColor($i);
?>
  <tr>
  	<td class="<?php echo $cellColor; ?>"><span class="copyText"><?php echo $results[$i]['loginId']; ?>.</span></td>
    <td class="<?php echo $cellColor; ?>"><span class="copyText"><?php echo $results[$i]['username']; ?></span></td>
    <td align="center" class="<?php echo $cellColor; ?>"><span class="copyText"><?php echo formatTime($results[$i]['time']); ?></span></td>
    <td align="center" class="<?php echo $cellColor; ?>"><a href="javascript:;" class="txtLink" onclick="openPopUp('../misc/lookupip.php?ip=<?php echo $results[$i]['ipAddress']; ?>','misc',300,130)"><?php echo $results[$i]['ipAddress']; ?></a></td>
	    <td align="center" class="<?php echo $cellColor; ?>"><img src="../images/<?php echo $results[$i]['success']; ?>.gif" alt="" title="" /></td>
  </tr>
<?php } 
}
?>

</table>
<p class="copyText"><?php echo $db->paginate($numrows, $rowsPerPage, $page, "page"); ?></p>
<?php include("../includes/footer.inc.php"); ?>

