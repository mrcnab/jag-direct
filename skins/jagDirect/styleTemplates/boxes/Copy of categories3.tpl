<!-- BEGIN: categories3 -->
<!-- BEGIN: boxcategory -->	
<div class="lft-mid-left">&nbsp;</div>
  <div class="lft-mid-center">
    <span> {DATA1.box_title}</span>
	<div id="ddsidemenubar" class="category">
    	 
        <div class="markermenu" align="left">		
            <ul>
                <!-- BEGIN: category -->
                    <li  id="left-menu{DATA.cat_id}"><a href="index.php?act=viewCat&catId={DATA.cat_id}" rel="submenu{DATA.cat_id}">
                    	<strong>{DATA.cat_name}</strong></a>
                        <script type="text/javascript">
						ddlevelsmenu.setup("left-menu{DATA.cat_id}", "sidebar");
					</script>
                    </li>
                <!-- END: category -->
               
           </ul>
        </div>
        
        
        <!-- BEGIN: maincategory -->
        <ul id="submenu{DATA.cat_id}" class="ddsubmenustyle blackwhite" style=".margin-left:-25px;" >
            <!-- BEGIN: subcategory -->
            <li>
                <a href="index.php?act=viewCat&amp;catId={DATA2.cat_id}" >
                    {DATA2.cat_name}
                </a>
            </li>
            <!-- END: subcategory -->
        </ul>
        <!-- END: maincategory -->
	</div>
</div>
<div class="lft-mid-right">&nbsp;</div>                
<!-- END: boxcategory -->	
<!-- END: categories3 -->
