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
|	index.php
|   ========================================
|	Admin Homepage	
+--------------------------------------------------------------------------
*/
include("../includes/ini.inc.php");
include_once("../includes/global.inc.php");
include_once("../classes/db.inc.php");
$db = new db();
include_once("../includes/functions.inc.php");
$config = fetchDbConfig("config");
include_once("../language/".$config['defaultLang']."/lang.inc.php");
$enableSSl = 1;
include_once("../includes/sslSwitch.inc.php");
include_once("includes/auth.inc.php");
include_once("includes/header.inc.php");

// no Products
$query = "SELECT count(productId) as noProducts FROM ".$glob['dbprefix']."CubeCart_inventory";
$noProducts = $db->select($query);

// no Categories
$query = "SELECT count(cart_order_id) as noOrders FROM ".$glob['dbprefix']."CubeCart_order_sum";
$noOrders = $db->select($query);

// no Ccustomers
$query = "SELECT count(customer_id) as noCustomers FROM ".$glob['dbprefix']."CubeCart_customer WHERE type = 1";
$noCustomers = $db->select($query);

// no Ccustomers
$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_admin_sessions ORDER BY time DESC LIMIT 1, 1";
$lastSession = $db->select($query);
  
?>
<p class="pageTitle">Welcome to the Jag Direct Administration Control Panel</p>
<?php
if(isset($config['filePerms']) && $config['filePerms']==1 && substr(sprintf('%o', fileperms('../includes/global.inc.php')), -4) != 644){
?>
<p class='warnText'><?php echo $lang['admin']['other']['global_risk']; ?></p>
<?php
}
?>
<?php if($lastSession==TRUE){ ?>
<p <?php if($lastSession[0]['success']==1) { ?>class="infoText"<?php } else { echo "class='warnText'"; } ?>><?php echo $lang['admin']['other']['last_login']; ?> <?php echo formatTime($lastSession[0]['time']); ?> <?php echo $lang['admin']['other']['by']; ?> <?php echo $lastSession[0]['username']; ?> <?php if($lastSession[0]['success']==0) { ?><?php echo $lang['admin']['other']['failed']; ?><?php } ?></p>
<?php } ?>
<table width="100%" border="0" cellpadding="4" cellspacing="0" class="mainTable">
  <tr>
    <td colspan="4" class="tdTitle"><?php echo $lang['admin']['other']['store_overview']; ?></td>
  </tr> 
  <tr>
    <td width="25%"><a href="http://www.php.net" target="_blank" class="txtLink">PHP</a> <span  class="tdText"><?php echo $lang['admin']['other']['version']; ?></span></td>
    <td width="25%"><span class="tdText"><?php echo phpversion();?></span></td>
    <td width="25%"><span class="tdText"><?php echo $lang['admin']['other']['no_products'];?></span></td>
    <td width="25%" class="tdText"><?php echo number_format($noProducts[0]['noProducts']); ?></td>
  </tr>
  <tr>
    <td width="25%"><a href="http://www.mysql.com" target="_blank" class="txtLink">MySQL</a> <span class="tdText"><?php echo $lang['admin']['other']['version']; ?></span></td>
    <td width="25%"><span class="tdText"><?php echo mysql_get_server_info(); ?></span></td>
    <td width="25%"><span class="tdText"><?php echo $lang['admin']['other']['no_customers']; ?></span></td>
    <td width="25%" class="tdText"><?php echo number_format($noCustomers[0]['noCustomers']); ?></td>
  </tr>
  <tr>
    <td width="25%" class="tdText"><?php echo $lang['admin']['other']['img_upload_size']; ?></td>
    <td width="25%" class="tdText">
	<?php 
	$dirArray = walk_dir($GLOBALS['rootDir']."/images/uploads");
	$size = 0;
	if(is_array($dirArray)){

		foreach($dirArray as $file) {
			$size = filesize($file) + $size;
		}
	}

	echo format_size($size); 
	?></td>
    <td width="25%" class="tdText"><?php echo $lang['admin']['other']['no_orders']; ?></td>
    <td width="25%" class="tdText"><?php echo number_format($noOrders[0]['noOrders']); ?> </td>
  </tr>
  <tr>
    <td width="25%" class="tdText"><?php echo $lang['misc']['server_software']; ?></td>
    <td colspan="3" class="tdText"><?php echo @$_SERVER["SERVER_SOFTWARE"]; ?></td>
  </tr>
  <tr>
    <td width="25%" class="tdText"><?php echo $lang['misc']['client_browser']; ?></td>
    <td colspan="3" class="tdText"><?php echo @$_SERVER["HTTP_USER_AGENT"]; ?></td>
  </tr>
</table>
<br />
<table width="100%" border="0" cellpadding="4" cellspacing="0" class="mainTable">
  <tr>
    <td colspan="2" class="tdTitle"><?php echo $lang['admin']['other']['quick_search']; ?></td>
  </tr>
  <tr>
    <td><span  class="tdText"><?php echo $lang['admin']['other']['order_no']; ?></span></td>
    <td>
<form name="orderSearch" method="get" action="<?php echo $GLOBALS['rootRel'];?>admin/orders/index.php"><input name="oid" type="text" class="textbox" size="30" <?php if(permission("orders","read")==FALSE) { echo "disabled";    } ?> /> 
<input name="submit" type="submit" id="submit" value="<?php echo $lang['admin']['other']['search_now']; ?>" class="submit" <?php if(permission("orders","read")==FALSE) { echo "disabled"; } ?> /> 
</form></td>
  </tr>
  <tr>
    <td><span class="tdText"><?php echo $lang['admin']['other']['customer']; ?></span></td>
    <td>
<form name="customerSearch" method="get" action="<?php echo $GLOBALS['rootRel']; ?>admin/customers/"> <input name="searchStr" type="text" class="textbox" id="searchStr" size="30" <?php if(permission("customers","read")==FALSE) { echo "disabled"; } ?> /> 
<input name="search" type="submit" id="search" value="<?php echo $lang['admin']['other']['search_now']; ?>" class="submit" <?php if(permission("customers","read")==FALSE) { echo "disabled"; } ?> /> 
</form></td>
  </tr>
</table>
<?php if(!isset($config['lk'])) { ?>
<br />
<iframe src="misc/licForm.php" style="border: none; margin: 0px; padding: 0px; <?php if(ereg("MSIE",@$_SERVER["HTTP_USER_AGENT"])){ echo "width: 99%"; } else { ?>width: 100%<?php } ?>;" frameborder="0"></iframe>
<?php } ?>
<?php include("includes/footer.inc.php"); ?>