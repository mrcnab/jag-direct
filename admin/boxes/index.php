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
|	Manage Categories
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
if(permission("boxes","read")==FALSE){
	header("Location: ".$GLOBALS['rootRel']."admin/401.php");
	exit;
}
$catsPerPage = 25;

if(isset($_GET["delete"]) && $_GET["delete"]>0){  
		// delete category
		$where = "box_id=".$db->mySQLSafe($_GET["delete"]);
		$delete = $db->delete($glob['dbprefix']."CubeCart_boxs", $where);
		
		if($delete == TRUE){
			$msg = "<p class='infoText'>".$lang['admin']['categories']['delete_success']."</p>";
		} else {
			$msg = "<p class='warnText'>".$lang['admin']['categories']['delete_failed']."</p>";
		}

} elseif(isset($_POST['box_id'])) {
	$record["box_title"] = $db->mySQLSafe($_POST['box_title']);		

	if($_POST['box_id']>0) { 		
		
		$where = "box_id=".$db->mySQLSafe($_POST['box_id']);
		$update = $db->update($glob['dbprefix']."CubeCart_boxs", $record, $where);

		if($update == TRUE){			
			$msg = "<p class='infoText'>'".$_POST['box_title']."' ".$lang['admin']['categories']['update_success']."</p>";		
		} else {			
			$msg = "<p class='warnText'>".$lang['admin']['categories']['update_fail']."</p>";		
		}
 		
	} else {	 	
		$insert = $db->insert($glob['dbprefix']."CubeCart_boxs", $record);

		if($insert == TRUE){			
			$msg = "<p class='infoText'>'".$_POST['box_title']."' ".$lang['admin']['categories']['add_success']."</p>";		
		} else {			
			$msg = "<p class='warnText'>".$lang['admin']['categories']['add_failed']."</p>";		
		}
	}
}

if(!isset($_GET['mode'])){	
	// make sql query
	if(isset($_GET['edit']) && $_GET['edit']>0){		
		$query = sprintf("SELECT * FROM ".$glob['dbprefix']."CubeCart_boxs WHERE box_id = %s", $db->mySQLSafe($_GET['edit'])); 	
	} else {	
		$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_boxs ORDER BY box_id ASC";
	} 
	
	if(isset($_GET['page'])){
		$page = $_GET['page'];
	} else {
		$page = 0;
	}
	
	// query database
	$results = $db->select($query, $catsPerPage, $page);
	$numrows = $db->numrows($query);
	$pagination = $db->paginate($numrows, $catsPerPage, $page, "page");
}

include("../includes/header.inc.php"); 
?>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td nowrap='nowrap'><p class="pageTitle">Box Heading</p></td>
     <?php if(!isset($_GET["mode"])){ ?><td align="right" valign="middle"><a <?php if(permission("boxes","write")==TRUE){?>href="?mode=new" class="txtLink"<?php } else { echo $link401; } ?>><img src="../images/buttons/new.gif" alt="" hspace="4" border="0" title="" />Add New Box</a></td><?php } ?>
  </tr>
</table>
<?php if(isset($msg)){ echo stripslashes($msg); }?>
<?php
if(!isset($_GET['mode']) && !isset($_GET['edit'])){
?>
<p class="copyText"><?php echo $lang['admin']['categories']['box_desc']; ?></p>
<p class="copyText"><?php echo $pagination; ?></p>
<table width="100%"  border="0" cellspacing="0" cellpadding="4" class="mainTable">
  <tr>
    <td width="10%" nowrap='nowrap' class="tdTitle"><?php echo $lang['admin']['categories']['box_title']; ?></td>
    <td class="tdTitle" colspan="3" align="center" width="20%"><?php echo $lang['admin']['categories']['action']; ?></td>
  </tr>
  <?php 
  if($results == TRUE){
  
  	for ($i=0; $i<count($results); $i++){ 
	
	$cellColor = "";
	$cellColor = cellColor($i);
	?>
  <tr>
    <td nowrap='nowrap' width="10%" class="<?php echo $cellColor; ?>"><a href="<?php echo $GLOBALS['rootRel']."index.php?act=viewCat&amp;box_id=".$results[$i]['box_id']; ?>" target="_blank" class="txtLink"><?php echo $results[$i]['box_title']; ?></a></td>
    <td nowrap='nowrap'  class="<?php echo $cellColor; ?>"><span class="txtDir"></td>
    <td align="center" width="10%" class="<?php echo $cellColor; ?>"><a 
	<?php if(permission("boxes","edit")==TRUE){ ?>
	href="?edit=<?php echo $results[$i]['box_id']; ?>" class="txtLink"
	<?php } else { echo $link401; } ?>
	><?php echo $lang['admin']['edit']; ?></a></td>
    <td align="center" width="5%" class="<?php echo $cellColor; ?>"><a 
	
	<?php if(permission("boxes","delete")==TRUE ){ ?>
	href="javascript:decision('<?php echo $lang['admin']['delete_q']; ?>','?delete=<?php echo $results[$i]['box_id']; ?>&amp;box_id=<?php echo $results[$i]['box_id'];?>');" class="txtLink"
	
	<?php } elseif(permission("boxes","delete")==TRUE) {
	echo "href='javascript:alert(\"".$lang['admin']['categories']['cannot_del']."\")' class='txtNullLink'";
	} else { echo $link401; } ?>
	
	><?php echo $lang['admin']['delete']; ?></a></td>   
  </tr>
  <?php } // end loop
  } else { ?>
   <tr>
    <td colspan="7" class="tdText"><?php echo $lang['admin']['categories']['no_box_exist'];?></td>
  </tr>
  <?php } ?>
</table>
<p class="copyText"><?php echo $pagination; ?></p>

<?php 
} elseif($_GET["mode"]=="new" OR $_GET["edit"]>0){  

if(isset($_GET["edit"]) && $_GET["edit"]>0){ $modeTxt = $lang['admin']['edit']; } else { $modeTxt = $lang['admin']['add']; } 
?>
<p class="copyText">You can add new boxes for different categories and products.</p>
<form action="<?php echo $GLOBALS['rootRel'];?>admin/boxes/index.php" method="post" name="form1">
<table border="0" cellspacing="0" cellpadding="3" class="mainTable">
  <tr>
    <td colspan="2" class="tdTitle"><?php if(isset($_GET["edit"]) && $_GET["edit"]>0){ echo $modeTxt; } else { echo $modeTxt;  } ?> <?php echo $lang['admin']['categories']['box_title'];?></td>
  </tr>
  <tr>
    <td class="tdText">Box Name:</td>
    <td>
      <input name="box_title" type="text" class="textbox" value="<?php if(isset($results[0]['box_title'])) echo validHTML($results[0]['box_title']); ?>" maxlength="255" />
    </td>
  </tr>

  <tr>
    <td>&nbsp;</td>
    <td>
	<input type="hidden" name="box_id" value="<?php echo $results[0]['box_id']; ?>" />
	<input type="submit" name="Submit" class="submit" value="<?php if(isset($_GET["edit"]) && $_GET["edit"]>0){ echo $modeTxt; } else { echo $modeTxt;  } ?>" /></td>
  </tr>
</table>
</form>
<?php } ?>
<?php include("../includes/footer.inc.php"); ?>
