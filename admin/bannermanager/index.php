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
|	Manage Images on Server
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
include("../../classes/gd.inc.php");
if(permission("filemanager","read")==FALSE){
	header("Location: ".$GLOBALS['rootRel']."admin/401.php");
	exit;
}
include("../includes/header.inc.php");

?>
<p class="pageTitle">Brand Manager
  <?php //echo $lang['admin']['filemanager']['image_manager']; 
				if(isset($_REQUEST['status']) && $_REQUEST['status']!=""){
					$record["status"] = $db->mySQLSafe($_REQUEST['status']);		
					$where = "id=".$db->mySQLSafe($_REQUEST['id']);
					$update = $db->update($glob['dbprefix']."CubeCart_banner", $record, $where);
					writeFile($db);
				}
				if(isset($_REQUEST['delete_id']) && $_REQUEST['delete_id']!=""){
					$where = "id=".$db->mySQLSafe($_GET["delete_id"]);
					$delete = $db->delete($glob['dbprefix']."CubeCart_banner", $where);
					$path	="../../aziaBannerImages/".$_REQUEST['image_path'];	
					$thumb_path	="../../aziaBannerImages/thumbs/thumb_".$_REQUEST['image_path'];
					if(file_exists($path)){
						unlink($path);
					}	
					if(file_exists($thumb_path)){
						unlink($thumb_path);
					}	
					writeFile($db);
				}
	?>
</p>
<?php 
if(isset($msg)){ 
	echo stripslashes($msg); 
} else { ?>
<p class="copyText">
  <?php //echo $lang['admin']['filemanager']['delete_from_server']; ?>
</p>
<?php } ?>
<form action="<?php echo $GLOBALS['rootRel'];?>admin/bannermanager/index.php" method="post" enctype="multipart/form-data" target="_self">
  <table align="center" border="0" cellpadding="3" cellspacing="0" class="mainTable">
    <tr>
      <td class="tdTitle">Brand Name: 
        <?php //echo $lang['admin']['filemanager']['Please enter title']; ?></td>
    </tr>
    <tr>
      <td><input name="FCKeditor_Title" type="text" class="textbox" /></td>
    </tr>
    <tr>
      <td class="tdTitle"><?php echo $lang['admin']['filemanager']['please_browse_img']; ?></td>
    </tr>
    <tr>
      <td><input name="FCKeditor_File" type="file" class="textbox" /></td>
    </tr>
    <tr>
      <td align="center"><input name="submit" type="submit" class="submit" value="<?php echo $lang['admin']['filemanager']['upload_image']; ?>" /></td>
    </tr>
  </table>
  <?php if(isset($_GET['redir'])){ ?>
  <input type="hidden" value="0" name="redir" />
  <?php } ?>
  <input type="hidden" value="1" name="custom" />
</form>
  <TABLE>
    <tr>
      <td><span class="copyText">
        <?php
				if($_POST){
		$uploadFileName = str_replace(array(" ","%20"),"_",$_FILES['FCKeditor_File']['name']);
 
		if($_FILES['FCKeditor_File']['size'] > $config['maxImageUploadSize']) { 
				echo sprintf($lang['admin']['filemanager']['file_too_big'],$uploadFileName,format_size($config['maxImageUploadSize'])); 
				unlink($_FILES['FCKeditor_File']['tmp_name']);
		} elseif (file_exists($GLOBALS['rootDir']."/aziaBannerImages/".$uploadFileName)) {
				echo sprintf($lang['admin']['filemanager']['img_already_exists'],$uploadFileName);
		} elseif (!is_uploaded_file($_FILES['FCKeditor_File']['tmp_name'])) { 
				echo $lang['admin']['filemanager']['upload_too_large'];
		} elseif ($_FILES['FCKeditor_File']['type'] != "image/jpeg" AND $_FILES['FCKeditor_File']['type'] != "image/png"  AND $_FILES['FCKeditor_File']['type'] != "image/x-png" AND $_FILES['FCKeditor_File']['type'] != "image/pjpeg" AND $_FILES['FCKeditor_File']['type'] != "image/x-jpeg" AND $_FILES['FCKeditor_File']['type'] != "image/gif"){
				echo sprintf($lang['admin']['filemanager']['not_valid_mime'],$uploadFileName);
				unlink($_FILES['FCKeditor_File']['tmp_name']); 
		} else {
				if (is_uploaded_file($_FILES['FCKeditor_File']['tmp_name'])) {
						$savefile = $GLOBALS['rootDir']."/aziaBannerImages/".$uploadFileName;
						if (move_uploaded_file($_FILES['FCKeditor_File']['tmp_name'], $savefile)) {
								@chmod($savefile, 0777);
								// if image is a JPG check thumbnail doesn't exist and if not make one
								$imageFormat = strtoupper(ereg_replace(".*\.(.*)$","\\1",$uploadFileName));
						if($imageFormat == "JPG" || $imageFormat == "JPEG" || $imageFormat == "PNG" || ($imageFormat == "GIF" && $config['gdGifSupport']==1)){
								// check image is not too big
								$size = getimagesize($savefile);
							//	print_r($size);
/*								if($size[3] > 150){
									@chmod($savefile, 0777);
									print_r($savefile);
									$thumb=new thumbnail($savefile);
									$thumb->size_auto2();
									$thumb->jpeg_quality($config['gdquality']);
									$thumb->save($savefile);
								} else {
								
								}
*/
							if(file_exists($GLOBALS['rootDir']."/aziaBannerImages/thumbs/thumb_".$uploadFileName)){
								@chmod($GLOBALS['rootDir']."/aziaBannerImages/thumbs/thumb_".$uploadFileName, 0777);
								unlink($GLOBALS['rootDir']."/aziaBannerImages/thumbs/thumb_".$uploadFileName);
							}
				$thumb=new thumbnail($GLOBALS['rootDir']."/aziaBannerImages/".$uploadFileName);
				// see if we need to resize 
				//if(($size[0] > $config['gdthumbSize']) OR ($size[1] > $config['gdthumbSize'])){
				if(($size[0] > $config['gdthumbSize']) OR ($size[1] > 55)){
					$thumb->size_height();					
				} else {
					$thumb->size_height();
				}
					$thumb->jpeg_quality($config['gdquality']);
					$thumb->save($GLOBALS['rootDir']."/aziaBannerImages/thumbs/thumb_".$uploadFileName);
				}
				echo sprintf($lang['admin']['filemanager']['image_upload_success'],$uploadFileName);
				
				$record["imageName"] = $db->mySQLSafe($_POST['FCKeditor_Title']);		
				$record["imagePath"] = $db->mySQLSafe($uploadFileName);	
				$record["status"] = 1;
				
				$insert = $db->insert($glob['dbprefix']."CubeCart_banner", $record);
				if($insert == TRUE){
						writeFile($db);
						
						
					$msg = "<p class='infoText'>'".$_POST['cat_name']."' ".$lang['admin']['categories']['add_success']."</p>";
				
				} else {
					
					$msg = "<p class='warnText'>".$lang['admin']['categories']['add_failed']."</p>";
				
				}
				
				if(!isset($_POST['redir'])){
?>
        <script language=javascript>
					<?php if($_POST["custom"]==1){ ?>
							window.opener.addImage('<?php echo $uploadFileName; ?>', '<?php echo $GLOBALS['rootRel']."aziaBannerImages/".$uploadFileName; ?>') ;
					<?php } else { ?>
							window.opener.setImage('<?php echo $GLOBALS['rootRel']."aziaBannerImages/".$uploadFileName; ?>') ;
					<?php } ?>
							window.close();
			</script>
			<?php
					} // end if not set redir
				}
			}
		}
	}
		function writeFile($db){
		
		$xmlFileName 			= array();
						$xmlFileName 		= "couture.xml";
						$xmlPrepared 	= "<"."?xml version=\"1.0\" encoding=\"utf-8\"?"."><thumbnails>";
						$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_banner WHERE status=1 AND isGallery<>1 ORDER BY id ASC";
						$results = $db->select($query);
						
						if(count($results) > 0) {	
							for ($i=0; $i<count($results); $i++){ 
								$xmlPrepared .= "<thumbnail filename='aziaBannerImages/".$results[$i]['imagePath']."' >
													<![CDATA[".$results[$i]['imageName']."]]>
												</thumbnail>";							
							}
						} else {
							$xmlPrepared .= "<thumbnail filename='aziaBannerImages/'></thumbnail>";									
						}			
						$xmlPrepared .= "</thumbnails>";
					
						$fp = fopen("../../".$xmlFileName, 'w');
						fwrite($fp, $xmlPrepared);							 
						fclose($fp);
		
		
		}
		 ?>
        </span> </td>
    </tr>
  </table>
	<table style="border:1px solid #333333; width:100%;" align="center">
		<thead>
			<th>Sr#</th>
			<th>Brand Name</th>
			<th>Brand Image</th>
			<th>Status</th>
			<th>Delete</th>
		</thead>
		<tbody>
		<?php
			$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_banner ORDER BY id ASC";
			$results = $db->select($query);

			if(count($results) > 0) {	
				for ($i=0; $i<count($results); $i++){ 
				?>		
					<tr>
						<td  align="center"><?=$i+1 ?></td>
						<td  align="center"><?=$results[$i]['imageName']?></td>
						<td  align="center"><img src="../../aziaBannerImages/<?=$results[$i]['imagePath']?>" height="100" width="150" /></td>
						<td  align="center"><a href="<?php echo $GLOBALS['rootRel']; ?>admin/bannermanager/index.php?status=<? if($results[$i]['status']==1)echo 0; else echo 1;?>&amp;id=<?=$results[$i]['id']?>" class="submit"><?php if($results[$i]['status']==1) echo "Enabled"; else echo "Disabled";?></a></td>
						<td  align="center"><a href="<?php echo $GLOBALS['rootRel']; ?>admin/bannermanager/index.php?delete_id=<?=$results[$i]['id']?>&amp;image_path=<?=$results[$i]['imagePath']?>" class="submit">DELETE</a></td>
					</tr>
				<?php		
				}
			}
		?>
	</tbody>
	</table>
	
	
<?php include("../includes/footer.inc.php"); ?>
