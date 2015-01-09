<?php
/*
+--------------------------------------------------------------------------
|   CubeCart 3.x
|   ========================================
|	CubeCart is a registered trade mark of Devellion Limited
|   Copyright Devellion Limited 2006. All rights reserved.
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
|   Email: info (at) cubecart (dot) com
|	License Type: CubeCart is NOT Open Source Software and Limitations Apply
|   Licence Info: http://www.cubecart.com/v4-software-license
+--------------------------------------------------------------------------
|	This MOD - CardSave Payment Gateway is property of WebMediaUK
|	http://www.webmediauk.co.uk
+--------------------------------------------------------------------------
|	index.inc.php
|   ========================================
|	Admin Configure CardSave
|
|	CubeCart v3.x CardSave Payment Gateway
|   The Cardsave payment gateway software is provided on an "AS IS" basis, without
|   warranty of any kind, including without limitation the warranties of merchantability,
|   fitness for a particular purpose and non-infringement. The entire risk as to the 
|   quality and performance of the software is borne by the merchant or licensor.
+--------------------------------------------------------------------------
*/
include("../../../../includes/ini.inc.php");
include("../../../../includes/global.inc.php");
include("../../../../classes/db.inc.php");
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

<p><a href="http://www.cardsave.net/" target="_blank"><img src="logo.gif" alt="" border="0" title="" /></a><br><span class="tdText"><strong>Cardsave.net Payment Gateway Version 1.0</strong></span>
    </p>
<?php
if(isset($msg)){
    echo $msg;
}
?>
<p></p>
<form action="<?php echo $GLOBALS['rootRel'];?>admin/modules/<?php echo $_GET['module']; ?>/<?php echo $_GET['folder']; ?>/index.php?module=<?php echo $_GET['module']; ?>&amp;folder=<?php echo $_GET['folder']; ?>" method="post" enctype="multipart/form-data">
    <table border="0" cellspacing="1" cellpadding="3" class="mainTable">
        <tr>
            <td colspan="2" class="tdTitle">Configuration Settings </td>
        </tr>
        <tr>
            <td align="left" class="tdText"><strong>Status:</strong></td>
            <td class="tdText">
                <select name="module[status]">
                    <option value="1" <?php if($module['status']==1) echo "selected='selected'"; ?>>Enabled</option>
                    <option value="0" <?php if($module['status']==0) echo "selected='selected'"; ?>>Disabled</option>
            </select>	</td>
        </tr>
        <tr>
            <td align="left" class="tdText"><strong>Description:</strong>	</td>
            <?php if($module['desc']!='') {?>
            <td class="tdText"><input type="text" name="module[desc]" value="<?php echo $module['desc']; ?>" class="textbox" size="30" /></td>
            <?php }else{ ?>
            <td class="tdText"><input type="text" name="module[desc]" value="Cardsave" class="textbox" size="30" /></td>
            <?php } ?>
        </tr>
        <tr>
            <td align="left" class="tdText"><strong>Merchant ID:</strong><br>
            This can be found in the account <br>creation email from CardSave</td>
            <td class="tdText"><input type="text" name="module[acNo]" value="<?php echo $module['acNo']; ?>" class="textbox" size="30" /></td>
        </tr>
        <tr>
            <td align="left" class="tdText"><strong>Password:</strong><br>
            This can be found in the account <br>creation email from CardSave</td>
            <td class="tdText"><input type="text" name="module[pwd]" value="<?php echo $module['pwd']; ?>" class="textbox" size="30" /></td>
        </tr>
        <tr>
            <td align="left" class="tdText"><strong>Preshared key:</strong><br>
            Login to your merchant account to find your key</td>
            <td class="tdText"><input type="text" name="module[psk]" value="<?php echo $module['psk']; ?>" class="textbox" size="30" /></td>
        </tr>
        <tr>
            <td align="left" class="tdText"><strong>Communication Method?</strong><br>
            &quot;Server&quot; recommended for extra security</td>
            <td class="tdText"><select name="module[dsr]">
                    <option value="1" <?php if($module['dsr'] == '1') echo "selected='selected'"; ?>>Server</option>
                    <option value="0" <?php if($module['dsr'] == '0') echo "selected='selected'"; ?>>Post</option>
            </select></td>
        </tr>
        <tr>
            <td align="left" class="tdText"><strong>Default Payment Option:</strong></td>
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
