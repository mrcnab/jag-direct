<?php
/*
+--------------------------------------------------------------------------
|   CubeCart v3.0.17
|   ========================================
	By: Naveed Asghar Bandesha
	Version : 1.0
+--------------------------------------------------------------------------
|	index.php
|   ========================================
|	Manage FAQ on Server
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
$count = 0;
echo $updateid = $_REQUEST['updateid'];
?>
<p class="pageTitle">Service Manager
  <?php //echo $lang['admin']['filemanager']['image_manager']; 
				if(isset($_REQUEST['status']) && $_REQUEST['status']!=""){
					$record["status"] = $db->mySQLSafe($_REQUEST['status']);		
					$where = "id=".$db->mySQLSafe($_REQUEST['id']);
					$update = $db->update($glob['dbprefix']."CubeCart_testimonial", $record, $where);
				}
				if(isset($_REQUEST['updateid']) && $_REQUEST['updateid']!=""){
				
				
					 $updateid = $_REQUEST['updateid'];
					 $query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_testimonial WHERE id = '$updateid'";
					$results = $db->select($query);
					if(count($results) > 0) {	
					for ($i=0; $i<count($results); $i++){
					
					$updateName = $results[$i]['question'];
				
					$updateComment =$results[$i]['answer'];
					}
					}
				}
				if(isset($_REQUEST['update']) && $_REQUEST['update']!=""){
				$count = 1;	
					$record["question"] = $db->mySQLSafe($_REQUEST['question']);
							
					$record["answer"] = $db->mySQLSafe($_REQUEST['answer']);		
					$record["status"] = $db->mySQLSafe($_REQUEST['status']);		
					$where = "id=".$db->mySQLSafe($_REQUEST['update']);
					$update = $db->update($glob['dbprefix']."CubeCart_testimonial", $record, $where);
				}
				if(isset($_REQUEST['delete_id']) && $_REQUEST['delete_id']!=""){
					$where = "id=".$db->mySQLSafe($_GET["delete_id"]);
					$delete = $db->delete($glob['dbprefix']."CubeCart_testimonial", $where);					
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
<form action="<?php echo $GLOBALS['rootRel'];?>admin/manageTestimonial/index.php" method="post" enctype="multipart/form-data" target="_self">
<input type="hidden" value="<?=$updateid?>" name="update" id="update" />
  <table align="left" border="0" cellpadding="3" cellspacing="0" class="mainTable" style="width:100%;">
    <tr>
      <td class="tdTitle">Service Title: 
        <?php //echo $lang['admin']['filemanager']['Please enter title']; ?></td>
    </tr>
    <tr>
      <td><input name="question" type="text" class="textbox_faq" value="<?=$updateName?>" /></td>
    </tr>
    
    <tr>
      <td class="tdTitle">Description: 
        <?php //echo $lang['admin']['filemanager']['Please enter title']; ?></td>
    </tr>
    <tr>
      <td>
      <textarea name="answer" id="FCKeditor_File" class="textbox_faq2" cols="50" rows="10"><?=$updateComment?></textarea>
</td>
    </tr>
    <tr>
      <td class="tdTitle">Status: 
        <?php //echo $lang['admin']['filemanager']['Please enter title']; ?></td>
    </tr>
    <tr>
      <td><select name="status">
      		<option value="1">enable</option>
            <option value="0">disable</option>
            </select>
      </td>
    </tr>
    <tr>
      <td align="left"><input name="submit" type="submit" class="submit" value="Save" /></td>
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
				$record["question"] = $db->mySQLSafe($_POST['question']);
					
				$record["answer"] = $db->mySQLSafe($_POST['answer']);		
				$record["status"] = $db->mySQLSafe($_POST['status']);
				if($count == 0)
				{
				$insert = $db->insert($glob['dbprefix']."CubeCart_testimonial", $record);
				}
				if($insert == TRUE){
				
						
					$msg = "<p class='infoText'>'".$_POST['question']."' ".$lang['admin']['categories']['add_success']."</p>";
				
				} else {
					
					$msg = "<p class='warnText'>".$lang['admin']['categories']['add_failed']."</p>";
				
				}
	}
	 ?>
        </span> </td>
    </tr>
  </table>
	<table style="border:1px solid #333333; width:100%;" align="center" border="1" cellpadding="5" cellspacing="0">
		<thead>
			<th>Sr#</th>
			<th  align="left">Service Title</th>
         
			<th>Description</th>
			<th>Status</th>
            <th>EDIT</th>
			<th>Delete</th>
		</thead>
		<tbody>
		<?php
			$query = "SELECT * FROM ".$glob['dbprefix']."CubeCart_testimonial ORDER BY id ASC";
			$results = $db->select($query);

			if(count($results) > 0) {	
				for ($i=0; $i<count($results); $i++){ 
				?>		
					<tr>
						<td  align="center"><?=$i+1 ?></td>
						<td  align="left"><?=$results[$i]['question']?></td>
                       	<td  align="left" ><?=substr($results[$i]['answer'],0,200)?></td>
						<td  align="center"><a href="<?php echo $GLOBALS['rootRel']; ?>admin/manageTestimonial/index.php?status=<? if($results[$i]['status']==1)echo 0; else echo 1;?>&amp;id=<?=$results[$i]['id']?>" class="submit"><?php if($results[$i]['status']==1) echo "Enabled"; else echo "Disabled";?></a></td>
                        <td  align="center"><a href="<?php echo $GLOBALS['rootRel']; ?>admin/manageTestimonial/index.php?updateid=<?=$results[$i]['id']?>">Edit</a></td>
						<td  align="center"><a href="<?php echo $GLOBALS['rootRel']; ?>admin/manageTestimonial/index.php?delete_id=<?=$results[$i]['id']?>&amp;image_path=<?=$results[$i]['imagePath']?>" class="submit">DELETE</a></td>
					</tr>
				<?php		
				}
			}
		?>
	</tbody>
	</table>
	
	
<?php include("../includes/footer.inc.php"); ?>
