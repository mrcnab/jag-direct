<?php
/*
+--------------------------------------------------------------------------
|   CubeCart v3.0.2
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
|	Configure PayPal Direct Payment
+--------------------------------------------------------------------------
*/
include("../../../../includes/ini.inc.php");
include("../../../../includes/global.inc.php");
require_once("../../../../classes/db.inc.php");
$db = new db();
include_once("../../../../includes/functions.inc.php");
$config = fetchDbConfig("config");

include_once("../../../../language/".$config['defaultLang']."/lang.inc.php");
$enableSSl = 1;
include_once("../../../../includes/sslSwitch.inc.php");
include("../../../includes/auth.inc.php");
include("../../../includes/header.inc.php");

if(permission("settings","read")==FALSE){
	header("Location: ".$GLOBALS['rootRel']."admin/401.php");
	exit;
}

if(isset($_POST['module'])){
	include("../../status.php");
	include("../../../includes/functions.inc.php");
	$module = fetchDbConfig($_GET['folder']);
	$msg = writeDbConf($_POST['module'], $_GET['folder'], $module);
	
}
$module = fetchDbConfig($_GET['folder']);
?>
<p><a href="http://www.paypal.com/"><img src="logo.gif" alt="" border="0" title="" /></a></p>
<?php 
if(isset($msg)){ 
	echo stripslashes($msg); 
} 
?>
<p class="copyText">Accept credit cards on your site directly with PayPal &quot;Direct Payment&quot;. Please note that to use this Gateway you should also enable and configure PayPal &quot;Express Checkout&quot;. </p>

<form action="<?php echo $GLOBALS['rootRel'];?>admin/modules/<?php echo $_GET['module']; ?>/<?php echo $_GET['folder']; ?>/index.php?module=<?php echo $_GET['module']; ?>&amp;folder=<?php echo $_GET['folder']; ?>" method="post" enctype="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="3" class="mainTable">
  <tr>
    <td colspan="2" class="tdTitle">Configuration Settings </td>
  </tr>
  <tr>
    <td align="left" class="tdText"><strong>Status:</strong></td>
    <td class="tdText">
	<select name="module[status]">
		<option value="1" <?php if($module['status']==1) echo "selected='selected'"; ?>>Enabled</option>
		<option value="0" <?php if($module['status']==0) echo "selected='selected'"; ?>>Disabled</option>
    </select>
	</td>
  </tr>
   <tr>
  	<td align="left" class="tdText"><strong>Description:</strong>
	</td>
    <td class="tdText"><input type="text" name="module[desc]" value="<?php echo $module['desc']; ?>" class="textbox" size="30" /></td>
  </tr>
  <td align="left" class="tdText"><strong>Gateway Server:</strong></td>
    <td class="tdText">
	<select name="module[gateway]">
		<option value="1" <?php if($module['gateway'] == 1) echo "selected='selected'"; ?>>Live</option>
		<option value="0" <?php if($module['gateway'] == 0) echo "selected='selected'"; ?>>Sandbox</option>
	</select>
	</td>
  </tr>
  <tr>
  <td align="left" class="tdText"><strong> API Account Name:</strong></td>
    <td class="tdText"><input type="text" name="module[username]" value="<?php echo $module['username']; ?>" class="textbox" size="30" /></td>
  </tr>
  <tr>
  <td align="left" class="tdText"><strong>API Password:</strong></td>
    <td class="tdText"><input type="text" name="module[password]" value="<?php echo $module['password']; ?>" class="textbox" size="30" /></td>
  </tr>
  <tr>
  <td align="left" class="tdText"><strong>API Certificate Location:</strong><br />
	Please ensure your API certificate is <br />
uploaded to this location on your server. </td>
    <td class="tdText"><?php echo $glob['rootDir']. "/pear/cert_key_pem.txt"; ?>
	<br />
	<?php if(file_exists($glob['rootDir']. "/pear/cert_key_pem.txt")){ ?> 
	<span style="color: green;">This file exists.</span>
	<?php } else { ?>
	<span style="color: red;">This file does not currently exist.</span>
	<?php } ?>

	</td>
  </tr>
  <tr>
  <td align="left" class="tdText"><strong>Debug:</strong></td>
    <td class="tdText">
	<select name="module[debug]">
		<option value="1" <?php if($module['debug'] == 1) echo "selected='selected'"; ?>>Yes</option>
		<option value="0" <?php if($module['debug'] == 0) echo "selected='selected'"; ?>>No</option>
	</select>
	</td>
  </tr>
  <td align="left" class="tdText"><strong>Default:</strong></td>
    <td class="tdText">
	<select name="module[default]">
		<option value="1" <?php if($module['default'] == 1) echo "selected='selected'"; ?>>Yes</option>
		<option value="0" <?php if($module['default'] == 0) echo "selected='selected'"; ?>>No</option>
	</select>
	</td>
  </tr>
  <tr>
    <td align="right" class="tdText">&nbsp;</td>
    <td class="tdText"><input type="submit" class="submit" value="Edit Config" /></td>
  </tr>
</table>
</form>
<?php include("../../../includes/footer.inc.php"); ?>
