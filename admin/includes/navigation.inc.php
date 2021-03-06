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
|	navigation.inc.php
|   ========================================
|	Admin Navigation links
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}
$link401 = "href=\"javascript:alert('".$lang['admin']['nav']['permission_error']."');\" class=\"txtNullLink\"";
?>
<table width="208" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" class="noPad"><a href="index.php" target="_blank"><img src="<?php echo $GLOBALS['rootRel']; ?>admin/images/tws-logo.jpg" alt="" width="200" height="50" border="0" title="" /></a></td>
  </tr>
  <tr>
    <td class="navMenu" style="padding-top: 15px;">
	<span class="navTitle"><?php echo $lang['admin']['nav']['navigation'];?></span>
	<ul>
		<li><a href="<?php echo $GLOBALS['rootRel']; ?>admin/index.php" target="_self" class="txtLink"><?php echo $lang['admin']['nav']['admin_home'];?></a></li>
		<li><a href="<?php echo $GLOBALS['rootRel']; ?>index.php" target="_blank" class="txtLink"><?php echo $lang['admin']['nav']['store_home'];?></a></li>
	</ul>
	
	<span class="navTitle"><?php echo $lang['admin']['nav']['store_config'];?></span>
	<ul>
		<li><a <?php if(permission("settings","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/settings/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['gen_settings'];?></a></li>
		<li><a <?php if(permission("settings","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/settings/tax.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['taxes'];?></a></li>
		<li><a <?php if(permission("settings","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/settings/geo.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['countries_zones'];?></a></li>
		<li><a <?php if(permission("settings","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/settings/currency.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['currencies'];?></a></li>
	</ul>
	
	<span class="navTitle"><?php echo $lang['admin']['nav']['modules'];?></span>
	<ul>
		<li><a <?php if(permission("shipping","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/modules/shipping/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['shipping'];?></a></li>
		<li><a <?php if(permission("gateways","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/modules/gateway/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['gateways'];?></a></li>
		<li><a <?php if(permission("gateways","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/modules/affiliate/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['affiliates'];?></a></li>
	</ul>
	
	<span class="navTitle"><?php echo $lang['admin']['nav']['catalog'];?></span>
	<ul>
		<li><a <?php if(permission("products","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/products/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['view_products'];?></a></li>
		<li><a <?php if(permission("products","write")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/products/index.php?mode=new" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['add_product'];?></a></li>
		<li><a <?php if(permission("products","write")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/products/options.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['product_options'];?></a></li>
		<li><a <?php if(permission("categories","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/categories/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['view_categories'];?></a></li>
		<li><a <?php if(permission("categories","write")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/categories/index.php?mode=new" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['add_categories'];?></a></li> 
        
        
        <li><a <?php if(permission("categories","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/boxes/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['view_boxes'];?></a></li>
		<li><a <?php if(permission("categories","write")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/boxes/index.php?mode=new" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['add_box'];?></a></li> 
        
	</ul>

    <span class="navTitle">Manage Banner</span>
	<ul>
		<li><a href="<?php echo $GLOBALS['rootRel']; ?>admin/ManageBanner/" class="txtLink">Upload Banner Image</a></li>
	</ul>

 <span class="navTitle">Services</span>
	<ul>
		<li><a href="<?php echo $GLOBALS['rootRel']; ?>admin/manageTestimonial/" class="txtLink">Manage Services</a></li>
	</ul>

    
    
	<span class="navTitle"><?php echo $lang['admin']['nav']['customers'];?></span>
	<ul>
		<li><a <?php if(permission("customers","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/customers/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['view_customers'];?></a></li>
		<li><a <?php if(permission("customers","write")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/customers/email.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['email_customers'];?></a></li>
		<li><a <?php if(permission("orders","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/orders/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['orders'];?></a></li>
	</ul>
	
	<span class="navTitle"><?php echo $lang['admin']['nav']['file_manager'];?></span>
	<ul>
    
		<li><a <?php if(permission("filemanager","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/filemanager/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['manage_images']?></a></li>
		<li><a <?php if(permission("filemanager","write")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/filemanager/"  onclick="openPopUp('<?php echo $GLOBALS['rootRel']; ?>admin/filemanager/upload.php?custom=1&amp;redir=0','filemanager',850,550,scrollbars= 1)" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['upload_images'];?></a></li>
	</ul>
	
	<span class="navTitle"><?php echo $lang['admin']['nav']['statistics'];?></span>
	<ul>
		<li><a <?php if(permission("statistics","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/stats/" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['view_stats'];?></a></li>
		</ul>
	<span class="navTitle"><?php echo $lang['admin']['nav']['documents'];?></span>
	<ul>
		<li><a <?php if(permission("homepage","edit")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/docs/home.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['homepage'];?></a></li>
		<li><a <?php if(permission("documents","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/docs/siteDocs.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['site_docs'];?></a></li>
	</ul>
	
	<span class="navTitle"><?php echo $lang['admin']['nav']['misc'];?></span>
	<ul>
		<li><a href="<?php echo $GLOBALS['rootRel']; ?>admin/misc/serverInfo.php" class="txtLink"><?php echo $lang['admin']['nav']['server_info'];?></a></li>
	</ul>
	
	<span class="navTitle"><?php echo $lang['admin']['nav']['admin_users'];?></span>
	<ul>
		<li><a <?php if(permission("administrators","read")==TRUE){ ?>href="<?php echo $GLOBALS['rootRel']; ?>admin/adminusers/administrators.php" class="txtLink"<?php } else { echo $link401; } ?>><?php echo $lang['admin']['nav']['administrators'];?></a></li>
		<li><a href="<?php echo $GLOBALS['rootRel']; ?>admin/adminusers/sessions.php" class="txtLink"><?php echo $lang['admin']['nav']['admin_sessions'];?></a></li>
	</ul></td>
  </tr>
</table>
