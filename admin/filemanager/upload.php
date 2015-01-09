<?php
/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2004 Frederico Caldeira Knabben
 *
 * Licensed under the terms of the GNU Lesser General Public License
 * (http://www.opensource.org/licenses/lgpl-license.php)
 *
 * For further information go to http://www.fredck.com/admin/includes/rte/ 
 * or contact fckeditor@fredck.com.
 *
 * upload.php: Basic file upload manager for the editor. You have
 *   to have set a directory called "userimages" in the root folder
 *   of your web site.
 *
 * Authors:
 *   Frederic TYNDIUK (http://www.ftls.org/ - tyndiuk[at]ftls.org)
 * Modded by:
 *	Alistair Brookbanks Devellion Limited
 */

// Init var :
include("../../includes/global.inc.php");
require_once("../../classes/db.inc.php");
$db = new db();
include_once("../../includes/functions.inc.php");
$config = fetchDbConfig("config");
include_once("../../language/".$config['defaultLang']."/lang.inc.php");
$enableSSl = 1;
include_once("../../includes/sslSwitch.inc.php");
include("../../classes/gd.inc.php");

include("../includes/auth.inc.php");
if(permission("filemanager","write")==FALSE){
	header("Location: ".$GLOBALS['rootRel']."admin/401.php");
	exit;
}
ob_start();
include("../includes/header.inc.php");
// End int var

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title><?php echo $lang['admin']['filemanager']['file_uploader']; ?></title>
		<link rel="stylesheet" type="text/css" href="../includes/rte/css/fck_dialog.css">
		<link rel="stylesheet" type="text/css" href="../styles/style.css">
        <script>
			function closeWindowAutomatically(name,imageName) {
				opener.document.getElementById('naveed').innerHTML = name;	
				opener.document.getElementById('imageName').value = imageName;	
				window.close();
			}
		</script>
	</head>
	<body>
	<p class="pageTitle"><?php echo $lang['admin']['filemanager']['upload_image']; ?></p>
<?
$targetLocation = $GLOBALS['rootRel'].'admin/filemanager/upload.php';

error_reporting (E_ALL ^ E_NOTICE);
//session_start(); //Do not remove this
//only assign a new timestamp if the session variable is empty

if (!isset($_SESSION['random_key']) || strlen($_SESSION['random_key'])==0 || isset($_POST["upload"])){
    $_SESSION['random_key'] = strtotime(date('Y-m-d H:i:s')); //assign the timestamp to the session variable
	$_SESSION['user_file_ext']= "";
}
//$upload_dir = 'images/upload';
//$upload_dir_thumb = 'images/upload/thumbs';
#########################################################################################################
# CONSTANTS									255+159															#
# You can alter the options below																		#
#########################################################################################################
$upload_dir = "../../images/uploads"; 			// The directory for the images to be saved in
$upload_path = $upload_dir."/";				// The path to where the image will be saved
$large_image_prefix = ""; 			// The prefix name to large image
$thumb_image_prefix = "thumb_";			// The prefix name to the thumb image
$large_image_name = $large_image_prefix.$_SESSION['random_key'];     // New name of the large image (append the timestamp to the filename)
$thumb_image_name = $thumb_image_prefix.$_SESSION['random_key'];     // New name of the thumbnail image (append the timestamp to the filename)
$max_file = "3"; 							// Maximum file size in MB
$max_width = "750";							// Max width allowed for the large image
$thumb_width = "98";						// Width of thumbnail image
$thumb_height = "99";						// Height of thumbnail image
// Only one of these image types should be allowed for upload
$allowed_image_types = array('image/pjpeg'=>"jpg",'image/jpeg'=>"jpg",'image/jpg'=>"jpg",'image/png'=>"png",'image/x-png'=>"png",'image/gif'=>"gif");
$allowed_image_ext = array_unique($allowed_image_types); // do not change this
$image_ext = "";	// initialise variable, do not change this.
foreach ($allowed_image_ext as $mime_type => $ext) {
    $image_ext.= strtoupper($ext)." ";
}


##########################################################################################################
# IMAGE FUNCTIONS																						 #
# You do not need to alter these functions																 #
##########################################################################################################
function resizeImage($image,$width,$height,$scale) {
	list($imagewidth, $imageheight, $imageType) = getimagesize($image);
	$imageType = image_type_to_mime_type($imageType);
	$newImageWidth = ceil($width * $scale);
	$newImageHeight = ceil($height * $scale);
	$newImage = imagecreatetruecolor($newImageWidth,$newImageHeight);
	switch($imageType) {
		case "image/gif":
			$source=imagecreatefromgif($image); 
			break;
	    case "image/pjpeg":
		case "image/jpeg":

		case "image/jpg":
			$source=imagecreatefromjpeg($image); 
			break;
	    case "image/png":
		case "image/x-png":
			$source=imagecreatefrompng($image); 
			break;
  	}
	imagecopyresampled($newImage,$source,0,0,0,0,$newImageWidth,$newImageHeight,$width,$height);
	
	switch($imageType) {
		case "image/gif":
	  		imagegif($newImage,$image); 
			break;
      	case "image/pjpeg":
		case "image/jpeg":
		case "image/jpg":
	  		imagejpeg($newImage,$image,90); 
			break;
		case "image/png":
		case "image/x-png":
			imagepng($newImage,$image);  
			break;
    }
	
	chmod($image, 0777);
	return $image;
}
//You do not need to alter these functions
function resizeThumbnailImage($thumb_image_name, $image, $width, $height, $start_width, $start_height, $scale){
	list($imagewidth, $imageheight, $imageType) = getimagesize($image);
	$imageType = image_type_to_mime_type($imageType);
	
	$newImageWidth = ceil($width * $scale);
	$newImageHeight = ceil($height * $scale);
	$newImage = imagecreatetruecolor($newImageWidth,$newImageHeight);
	switch($imageType) {
		case "image/gif":
			$source=imagecreatefromgif($image); 
			break;
	    case "image/pjpeg":
		case "image/jpeg":
		case "image/jpg":
			$source=imagecreatefromjpeg($image); 
			break;
	    case "image/png":
		case "image/x-png":
			$source=imagecreatefrompng($image); 
			break;
  	}
	imagecopyresampled($newImage,$source,0,0,$start_width,$start_height,$newImageWidth,$newImageHeight,$width,$height);
	switch($imageType) {
		case "image/gif":
	  		imagegif($newImage,$thumb_image_name); 
			break;
      	case "image/pjpeg":
		case "image/jpeg":
		case "image/jpg":
	  		imagejpeg($newImage,$thumb_image_name,90); 
			break;
		case "image/png":
		case "image/x-png":
			imagepng($newImage,$thumb_image_name);  
			break;
    }
	chmod($thumb_image_name, 0777);
	return $thumb_image_name;
}
//You do not need to alter these functions
function getHeight($image) {
	$size = getimagesize($image);
	$height = $size[1];
	return $height;
}
//You do not need to alter these functions
function getWidth($image) {
	$size = getimagesize($image);
	$width = $size[0];
	return $width;
}

//Image Locations
$large_image_location = $upload_path.$large_image_name.$_SESSION['user_file_ext'];
$thumb_image_location = $upload_path."/thumbs/".$thumb_image_name.$_SESSION['user_file_ext'];


//Check to see if any images with the same name already exist

if (file_exists($large_image_location)){
	if(file_exists($thumb_image_location)){
		$thumb_photo_exists = "<img src=\"".$upload_path."/thumbs/".$thumb_image_name.$_SESSION['user_file_ext']."\" alt=\"Thumbnail Image\"/>";
	}else{
		$thumb_photo_exists = "";
	}
   	$large_photo_exists = "<img src=\"".$upload_path.$large_image_name.$_SESSION['user_file_ext']."\" alt=\"Large Image\"/>";
} else {
   	$large_photo_exists = "";
	$thumb_photo_exists = "";
}


if (isset($_POST["upload"])) { 
	//Get the file information
	$userfile_name = $_FILES['image']['name'];
	$userfile_tmp = $_FILES['image']['tmp_name'];
	$userfile_size = $_FILES['image']['size'];
	$userfile_type = $_FILES['image']['type'];
	
	list($width, $height) = getimagesize($_FILES['image']['tmp_name']); 
	
	$uploadedImageHight =$height;
	$uploadedImageWidth =$width;
	
	
	$filename = basename($_FILES['image']['name']);
	$file_ext = strtolower(substr($filename, strrpos($filename, '.') + 1));
	
	//Only process if the file is a JPG, PNG or GIF and below the allowed limit
	if((!empty($_FILES["image"])) && ($_FILES['image']['error'] == 0)) {
		
		foreach ($allowed_image_types as $mime_type => $ext) {
			//loop through the specified image types and if they match the extension then break out
			//everything is ok so go and check file size
			if($file_ext==$ext && $userfile_type==$mime_type){
				$error = "";
				break;
			}else{
				$error = "Only <strong>".$image_ext."</strong> images accepted for upload<br />";
			}
		}

		//check if the file size is above the allowed limit
		if ($userfile_size > ($max_file*1048576)) {
			$error.= "Images must be under ".$max_file."MB in size";
		}
		
	
		if ($uploadedImageHight  < 150 || $uploadedImageWidth < 200 ) {
			$error.= "Images must be Greater then 200x150 px  ";
		}
		
		
	}else{
		$error= "Select an image for upload";
	}
	//Everything is ok, so we can upload the image.
	if (strlen($error)==0){
		
		if (isset($_FILES['image']['name'])){
			//this file could now has an unknown file extension (we hope it's one of the ones set above!)
			$large_image_location = $large_image_location.".".$file_ext;
			$thumb_image_location = $thumb_image_location.".".$file_ext;
			
			//put the file ext in the session so we know what file to look for once its uploaded
			$_SESSION['user_file_ext']=".".$file_ext;
			
			move_uploaded_file($userfile_tmp, $large_image_location);
			chmod($large_image_location, 0777);
			if(!isset($_POST['redir'])){
?>
		<script language=javascript>
		
		<?php if($_POST["custom"]==1){ ?>
			window.opener.addImage('<?php echo $large_image_name.$_SESSION['user_file_ext']; ?>', '<?php echo $GLOBALS['rootRel']."images/uploads/".$large_image_name.$_SESSION['user_file_ext']; ?>') ;
		<?php } else { ?>
			window.opener.setImage('<?php echo $GLOBALS['rootRel']."images/uploads/".$large_image_name.$_SESSION['user_file_ext']; ?>') ;
		<?php } ?>
			window.close();
		</script>
		<?php
	} // end if not set redir

			$width = getWidth($large_image_location);
			$height = getHeight($large_image_location);
			//Scale the image if it is greater than the width set above
			if ($width > $max_width){

				$scale = $max_width/$width;
				$uploaded = resizeImage($large_image_location,$width,$height,$scale);
			}else{
				$scale = 1;
				$uploaded = resizeImage($large_image_location,$width,$height,$scale);
			}
			//Delete the thumbnail file so the user can create a new one
			if (file_exists($thumb_image_location)) {
				unlink($thumb_image_location);
			}
			
		}
		//Refresh the page to show the new uploaded image			
				header("location:".$targetLocation."?saveFile=yes");
			
		}
		
}

if (isset($_POST["upload_thumbnail"]) && strlen($large_photo_exists)>0) {
	//Get the new coordinates to crop the image.
	$x1 = $_POST["x1"];
	$y1 = $_POST["y1"];
	$x2 = $_POST["x2"];
	$y2 = $_POST["y2"];
	$w = $_POST["w"];
	$h = $_POST["h"];
	//Scale the image to the thumb_width set above
	$scale = $thumb_width/$w;
	$cropped = resizeThumbnailImage($thumb_image_location, $large_image_location,$w,$h,$x1,$y1,$scale);
	//Reload the page again to view the thumbnail
	
				header("location:".$targetLocation."?saveFile=yes");				
}  

if ($_GET['a']=="delete" && strlen($_GET['t'])>0){
//get the file locations 
	$large_image_location = $upload_path.$large_image_prefix.$_GET['t'];
	$thumb_image_location = $upload_path.$thumb_image_prefix.$_GET['t'];
	if (file_exists($large_image_location)) {
		unlink($large_image_location);
	}
	if (file_exists($thumb_image_location)) {
		unlink($thumb_image_location);
	}
	
				header("location:".$targetLocation."?saveFile=yes");
				
}
?>  
    
    <div id="progress" style="display:none;">
        <img src="../../images/ajax-loader.gif" width="220" height="19" alt="Please wait" title="Please wait" />
    </div>
	<div align="center"  style="widows:600px;" >
    
     <?php
//Only display the javacript if an image has been uploaded
if(strlen($large_photo_exists)>0){
	$current_large_image_width = getWidth($large_image_location);
	$current_large_image_height = getHeight($large_image_location); ?>
<script type="text/javascript">
function preview(img, selection) { 
	var scaleX = 98 / selection.width; 
	var scaleY = 100 / selection.height; 
	

	
	$('#thumbnail + div > img').css({ 
		
		width: Math.round(scaleX * <?php echo $current_large_image_width;?>) + 'px', 
		height: Math.round(scaleY * <?php echo $current_large_image_height;?>) + 'px',
		marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px', 
		marginTop: '-' + Math.round(scaleY * selection.y1) + 'px' 
	});
	$('#x1').val(selection.x1);
	$('#y1').val(selection.y1);
	$('#x2').val(selection.x2);
	$('#y2').val(selection.y2);
	$('#w').val(selection.width);
	$('#h').val(selection.height);

	document.getElementById("saber").innerHTML = "<font color=red>Selected Dimentions("+selection.width+"X"+selection.height+")&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>";
	
} 

//$(document).ready(function () { 
//	$('#save_thumb').click(function() {
//		var x1 = $('#x1').val();
//		var y1 = $('#y1').val();
//		var x2 = $('#x2').val();
//		var y2 = $('#y2').val();
//		var w = $('#w').val();
//		var h = $('#h').val();
//		var MinH = Math.round(200 / h);
//		var MinW =  Math.round(130 / w);
//		if(x1 =="" || y1=="" || x2=="" || y2=="" || w=="" || h==""){
//			alert("You must make a selection first");
//			return false;
//		}else{
//			if( MinH != 1  || MinW!= 1 ){
//			alert("Please select dimentions 200 X 130 for best result.");
//			return false;
//			}
//			else
//			{ return true; }
//		}
//	});
//}); 

$(window).load(function () { 
	$('#thumbnail').imgAreaSelect({ aspectRatio: '1:<?php echo $thumb_height/$thumb_width;?>', onSelectChange: preview }); 
});

</script>
<?php }?>

<?php

$FileNameThumb = '';
//Display error message if there are any
if(strlen($error)>0){
	echo "<ul><li><strong>Error!</strong></li><li>".$error."</li></ul>";
}
if(strlen($large_photo_exists)>0 && strlen($thumb_photo_exists)>0){
   $FileNameThumb = $thumb_image_name.$_SESSION['user_file_ext'];
	//echo $large_photo_exists."&nbsp;".$thumb_photo_exists;
	echo '<h3 align="left"> Thumbnail Preview.</h3>';
	echo $thumb_photo_exists;
	echo "<p><a href=\"".$targetLocation."?a=delete&t=".$_SESSION['random_key'].$_SESSION['user_file_ext']."\">Delete images</a></p>";
	echo "<script language='javascript'>closeWindowAutomatically('<img src=".$GLOBALS['rootRel'].'images/uploads/'.$_SESSION['random_key'].$_SESSION['user_file_ext'].">','".$_SESSION['random_key'].$_SESSION['user_file_ext']."')</script>";
//	echo "<input type='text' name='imageName' id='imageName' value='".$_SESSION['random_key'].$_SESSION['user_file_ext']."' />";	
	echo "<p><a href=\"".$targetLocation."\">Upload another</a></p>";
	//Clear the time stamp session and user file extension
	$_SESSION['random_key']= "";
	$_SESSION['user_file_ext']= "";
}else{
		
		
		
		if(strlen($large_photo_exists)>0){?>
		<script>
			document.getElementById('progress').style.display='none';
		</script>
		<h2>Create Thumbnail</h2>
		<div align="center">
            <h4 align="left">Please Click on the Image bellow and select proper Area. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thumbnail Preview.</h4>
			<div id="saber" style="padding-right:100px;"></div>
			<img src="<?php echo $upload_path.$large_image_name.$_SESSION['user_file_ext'];?>" style="float: left; margin-right: 10px;" id="thumbnail" alt="Create Thumbnail" />
			
            <div  style="border:1px #e5e5e5 solid; float:left; position:relative; overflow:hidden; width:98px; height:100px;">
			
            	<img src="<?php echo $upload_path.$large_image_name.$_SESSION['user_file_ext'];?>" style="position: relative;" alt="Thumbnail Preview" />
			
            </div>

			<form name="thumbnail" action="<?php echo $targetLocation;?>" method="post">
				<input type="hidden" name="x1" value="" id="x1" />
				<input type="hidden" name="y1" value="" id="y1" />
				<input type="hidden" name="x2" value="" id="x2" />
				<input type="hidden" name="y2" value="" id="y2" />
				<input type="hidden" name="w" value="" id="w" />
				<input type="hidden" name="h" value="" id="h" />
		<input name="proDetailId" id="proDetailId" type="hidden" value="<? if(isset($_REQUEST['proDetailId']) && $_REQUEST['proDetailId'] != "") echo $_REQUEST['proDetailId'];?>"/>
				<input type="submit" name="upload_thumbnail" value="Save Thumbnail" id="save_thumb" />
			</form>
            <br style="clear:both;"/>
		</div>
		
	<hr />
	<?php 	} ?>

<script>
function CustomerImagevalidate(){

	if(document.getElementById("image").value == "")
			{
					alert("Please upload an image.");
					document.getElementById("image").focus();
					return false;
			}
return true;
}
</script>
	
	<form name="photo" enctype="multipart/form-data" action="<?php echo $targetLocation;?>" method="post"   onsubmit="javascript: return CustomerImagevalidate();">
	Select Photo and Press Upload <input id="image" type="file" name="image" size="30" />
     <input type="submit" name="upload"  value="Upload" onClick="document.getElementById('progress').style.display='block'" />
	<input name="proDetailId" id="proDetailId" type="hidden" value="<? if(isset($_REQUEST['proDetailId']) && $_REQUEST['proDetailId'] != "") echo $_REQUEST['proDetailId'];?>"/>
   	<?php if(isset($_GET['redir'])){ ?>
	<input type="hidden" value="0" name="redir" />
	<?php } ?>
	<input type="hidden" value="1" name="custom" />


	</form>
<?php } ?>  
    
    </div> 		
<!--<input type="button" class="submit" value="<?php// echo $lang['admin']['filemanager']['close_window']; ?>"  onclick="opener.document.getElementById('naveed').innerText  = '<img src=<?php// echo $GLOBALS['rootRel'].'images/uploads/'.$large_image_name.".jpg";?>/>';<?php// if(isset($_POST['redir'])) { echo "window.opener.location.reload();"; } ?> javascript:window.close();" />
-->
	</body>
</html>

