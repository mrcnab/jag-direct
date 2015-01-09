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
|	Add/Edit/Delete Products	
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
include("../../includes/sslSwitch.inc.php");
include("../includes/auth.inc.php");
include("../includes/rte/fckeditor.php");
include("../../classes/gd.inc.php");
include("../../includes/currencyVars.inc.php");

if(permission("products","read")==FALSE){
	header("Location: ".$GLOBALS['rootRel']."admin/401.php");
	exit;
}
$productsPerPage = 25;
if(isset($_GET['action']) && $_GET['action']=="gbase"){

	$db = new db();
	$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_month ORDER BY name ASC";
	$results = $db->select($query);


	if(isset($_POST['productId'])) {

	$record["name"] = $db->mySQLSafe($_POST['name']);		
	$record["image"] = $db->mySQLSafe($_POST['imageName']);

	// if image is a JPG check thumbnail doesn't exist and if not make one
	$imageFormat = strtoupper(ereg_replace(".*\.(.*)$","\\1",$_POST['imageName']));
	if($imageFormat == "JPG" || $imageFormat == "JPEG" || $imageFormat == "PNG" || ($imageFormat == "GIF" && $config['gdGifSupport']==1)){
		
		if(file_exists($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$_POST['imageName'])){
			@chmod($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$_POST['imageName'], 0775);
			unlink($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$_POST['imageName']);
		}
		
		$thumb=new thumbnail($GLOBALS['rootDir']."/images/uploads/".$_POST['imageName']);
		
		$thumb->size_auto($config['gdthumbSize']);

		$thumb->jpeg_quality($config['gdquality']);
		$thumb->save($GLOBALS['rootDir']."/images/uploads/thumbs/thumb_".$_POST['imageName']);
	}

	if(isset($_POST['productId']) && $_POST['productId']>0){
	 	
	echo	$insert = $db->insert($glob['dbprefix']."CubeCart_month", $record);
		unset($record);
		
//		$record['cat_id'] = $db->mySQLSafe($_POST['cat_id']);
//		$record['productId'] = $db->insertid();  
//		$insertIdx = $db->insert($glob['dbprefix']."CubeCart_cats_idx", $record);
//		unset($record);

		if($insert == TRUE){
			
			$msg = "<p class='infoText'>'Product of month has been added Sucessfully.'</p>";
			
			// notch up amount of products in category
			$db->categoryNos($_POST['cat_id'], "+");
		
		} else {
			$msg = "<p class='warnText'>'Product of month has not been added.'</p>";
		}
	}
}
}
//$query = "SELECT productId, name FROM ".$glob['dbprefix']."CubeCart_inventory ORDER BY productId ASC";
////	print_r($query);
//	$categoryArray = $db->select($query);
	
	$optionsPerPage = "";
	$attributesPerPage = "";
	$existingOptionsPerPage = "";
	
	$optionsPerPage = 10;
	$attributesPerPage = 10;
	$existingOptionsPerPage = 10;
	
	$query = "SELECT productId,  ".$glob['dbprefix']."CubeCart_inventory.cat_id, name, cat_name FROM ".$glob['dbprefix']."CubeCart_inventory INNER JOIN  ".$glob['dbprefix']."CubeCart_category ON  ".$glob['dbprefix']."CubeCart_inventory.cat_id =  ".$glob['dbprefix']."CubeCart_category.cat_id ORDER BY cat_name ASC";
	$products = $db->select($query);
	
	$options = $db->select($query, $optionsPerPage, $optPage);
	$optionsPaginate = "";
	$optionsPaginate = $db->paginate($db->numrows($query), $optionsPerPage, $optPage, "optPage");
	
	
	
	include("../includes/header.inc.php"); 
?>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td nowrap='nowrap'><p class="pageTitle">Product of Month</p></td>
     <?php if(!isset($_GET["mode"])){ ?><td align="right" valign="middle"><a <?php if(permission("products","write")==TRUE){ ?>href="?mode=new" class="txtLink" <?php } else { echo $link401; } ?>><img src="../images/buttons/new.gif" alt="" hspace="4" border="0" title="" /><?php echo $lang['admin']['add_new'];?></a></td><?php } ?>
  </tr>
  <tr align="right">
    <td colspan="2" nowrap='nowrap'>
	<a href="index.php?action=gbase"><img src="../images/googleBase.gif" alt="Download Google Base Product Feed" width="76" height="28" border="0" title="" /></a></td>
  </tr>
</table>

<?php if(isset($msg)){ echo stripslashes($msg); }?>
<?php
if(($_GET["mode"]=="new" && permission("products","write")==TRUE) || ($_GET["edit"]>0 && permission("products","edit")==TRUE)){  

if(isset($_GET["edit"]) && $_GET["edit"]>0){ $modeTxt = $lang['admin']['edit']; } else { $modeTxt = $lang['admin']['add']; } 
?>
<p class="copyText"><?php echo $lang['admin']['products']['add_month_desc'];?></p>
<form action="<?php echo $GLOBALS['rootRel'];?>admin/products/month.php" method="post" enctype="multipart/form-data" name="form1" language="javascript">
<table border="0" cellspacing="0" cellpadding="3" class="mainTable">
  <tr>
    <td colspan="2" class="tdTitle"><?php if(isset($_GET["edit"]) && $_GET["edit"]>0){ echo $modeTxt; } else { echo $modeTxt; } ?> Product of Month </td>
  </tr> 
  
 
  <tr>
    <td width="25%" class="tdText"><strong>Please Select <?php echo $lang['admin']['products']['product'];?></strong></td>
    <td>
	
  		<select name="productId" id="productId" class="textbox">
        <?php for ($i=0; $i<count($products); $i++){ print_r($products)."products";?>

		<?php if($products[$i]['cat_id']!==$products[$i-1]['cat_id']){ ?>
		<optgroup label="<?php echo $products[$i]['cat_name']; ?>"></optgroup>
		<?php } ?>
		
		<option value="<?php echo $products[$i]['productId']; ?>" <?php if($products[$i]['productId']==$existingOptions[0]['product']) echo "selected='selected'"; ?>><?php echo $products[$i]['name']; ?></option>
		<?php } ?>
		
		</select> 
	</td>
  </tr>
  <tr>
    <td width="25%" align="left" valign="top" class="tdText"><strong><?php echo $lang['admin']['products']['image2'];?></strong> <br />
	<?php echo $lang['admin']['products']['opt_and_thumbs'];?></td>
    <td valign="top"><div id="selectedImage"><?php if(!empty($results[0]['image'])){ ?><img src="<?php echo $GLOBALS['rootRel']."images/uploads/".$results[0]['image']; ?>" alt="<?php echo $results[0]['image']; ?>" title="" />
	<br/>
	<div  style="padding: 3px;"><input type="button" class="submit" src="../images/remove.gif" name="remove" style="width: 200px;" value="Remove Image" onclick="addImage('','')" /></div>
	<?php } ?></div><div id="imageControls"><table border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><input name="upload" style="width: 200px;" class="submit" type="button" id="upload" onclick="openPopUp('../filemanager/upload.php?custom=1','filemanager',450,250)" value="<?php echo $lang['admin']['products']['upload_new'];?>" /></td>
  </tr>
  <tr>
    <td><input name="browse" style="width: 200px;" class="submit" type="button" id="browse" onclick="openPopUp('../filemanager/browse.php?custom=1','filemanager',450,500)" value="<?php echo $lang['admin']['products']['browse_existing'];?>" /></td>
  </tr>
</table>
</div><input type="hidden" name="imageName" id="imageName" value="<?php if(isset($results[0]['image'])) echo $results[0]['image']; ?>" /></td>
  </tr>
 
  <tr>
    <td width="25%">&nbsp;</td>
    <td>
	<input type="hidden" name="oldCatId" value="<?php if(isset($results[0]['cat_id'])) echo $results[0]['cat_id']; ?>" />
	<input type="hidden" name="productId" value="<?php if(isset($results[0]['productId'])) echo $results[0]['productId']; ?>" />
	<input type="submit" name="Submit" class="submit" value="<?php if(isset($_GET["edit"]) && $_GET["edit"]>0){ echo $modeTxt; } else { echo $modeTxt;  } ?> <?php echo $lang['admin']['products']['product'];?>" /></td>
  </tr>
</table>
<br />
</form>
<?php } ?>
<?php include("../includes/footer.inc.php"); ?>