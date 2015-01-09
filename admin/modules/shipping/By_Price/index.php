<?php
/*
	By: Naveed Asghar
+--------------------------------------------------------------------------
|	index.php
|   ========================================
|	Configure Shipping By Zone
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
<?php 
if(isset($msg)){ 
	echo stripslashes($msg); 
} 
?>

<p class="copyText">This module is for shipping by Zone (Please make sure you have the correct Post Code or Zones in your settings)</p>
<form action="<?php echo $GLOBALS['rootRel'];?>admin/modules/<?php echo $_GET['module']; ?>/<?php echo $_GET['folder']; ?>/index.php?module=<?php echo $_GET['module']; ?>&amp;folder=<?php echo $_GET['folder']; ?>" method="post" enctype="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="3" class="mainTable" width="60%;">
  <tr>
    <td colspan="2" class="tdTitle">Configuration Settings </td>
  </tr>
  <tr>
    <td align="left" class="tdText"><strong>Status:</strong></td>
    <td class="tdText">
	<select name="module[status]">
	<option value="1" <?php if($module['status']==1) echo "selected='selected'"; ?>>Enabled</option>
	<option value="0" <?php if($module['status']==0) echo "selected='selected'"; ?>>Disabled</option>
    </select></td>
  </tr>
<tr>
    <td align="left" valign="top" colspan="2" class="tdOdd"><span class="copyText"><strong>Orders between &pound;1 - &pound;5
</strong></td>
   
  </tr>
  <tr>
    <td align="left" valign="top" class="tdOdd"><span class="tdText">Delivery Charges for 2 to 5 working days:</span></td>
    <td class="tdOdd"> &pound; <input type="text" name="module[zone1class1]" value="<?php echo $module['zone1class1']; ?>" class="textbox" size="5" /></td>
  </tr>
  <tr>
    <td align="left" valign="top" class="tdOdd"><span class="tdText">Next Day</span></td>
    <td class="tdOdd"> &pound; <input type="text" name="module[zone1class2]" value="<?php echo $module['zone1class2']; ?>" class="textbox" size="5" /></td>
  </tr>




  <tr>
    <td align="left" valign="top" colspan="2" class="tdEven"><span class="copyText"><strong>Orders between &pound;6 - &pound;10
</strong></td>
   
  </tr>
  <tr>
    <td align="left" valign="top" class="tdEven"><span class="tdText">Delivery Charges for 2 to 5 working days:</span></td>
    <td class="tdEven"> &pound; <input type="text" name="module[zone2class1]" value="<?php echo $module['zone2class1']; ?>" class="textbox" size="5" /></td>
  </tr>
   <tr>
    <td align="left" valign="top" class="tdEven"><span class="tdText">Next Day:</span></td>
    <td class="tdEven"> &pound; <input type="text" name="module[zone2class2]" value="<?php echo $module['zone2class2']; ?>" class="textbox" size="5" /></td>
  </tr>
  
 

  <tr>
    <td align="left" valign="top" class="tdOdd" colspan="2"><span class="copyText"><strong>Orders between &pound;11 - &pound;25
</strong></td>
  </tr>
  
  <tr>
    <td align="left" valign="top" class="tdOdd"><span class="tdText">Delivery Charges for 2 to 5 working days:</span></td>
    <td class="tdOdd"> &pound; <input type="text" name="module[zone3class1]" value="<?php echo $module['zone3class1']; ?>" class="textbox" size="5" />  </td>
  </tr>
   <tr>
    <td align="left" valign="top" class="tdOdd"><span class="tdText">Next Day:</span></td>
    <td class="tdOdd"> &pound; <input type="text" name="module[zone3class2]" value="<?php echo $module['zone3class2']; ?>" class="textbox" size="5" />  </td>
  </tr>
  
  
  <tr>
    <td align="left" class="tdText"><strong>Tax Class: </strong></td>
    <td class="tdText"><?php
	$tax = $db->select("SELECT * FROM ".$glob['dbprefix']."CubeCart_taxes");
	?>
	<select name="module[tax]">
	<?php for($i=0; $i<count($tax); $i++){ ?>
	<option value="<?php echo $tax[$i]['id']; ?>" <?php if($module['tax'] == $tax[$i]['id']) echo "selected='selected'"; ?>>
	<?php echo $tax[$i]['taxName']; ?>
	</option>
	<?php } ?>
	</select></td>
  </tr>
  <tr>
    <td align="right" class="tdText">&nbsp;</td>
    <td class="tdText"><input type="submit" class="submit" value="Edit Config" /></td>
  </tr>
</table>
<p class="copyText">Shipping rates are worked out by Zone-Post Code Area/price.</p>
<p class="copyText">e.g. 1:1.29 (For a parcel of AL, B46, B72-79, or under the shipping would be 1.29 <?php echo $config['defaultCurrency'];?>) </p>
</form>
<?php include("../../../includes/footer.inc.php"); ?>