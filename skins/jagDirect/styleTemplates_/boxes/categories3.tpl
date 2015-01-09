<!-- BEGIN: categories3 -->
<script type="text/javascript">
    // <![CDATA[
window.onload = function() {
<!-- BEGIN: boxid -->
myMenu{DATA1.box_id} = new SDMenu("my_menu{DATA1.box_id}");
 <!-- END: boxid -->
 <!-- BEGIN: boxid_btm -->
myMenu{DATA1.box_id}.init();
<!-- END: boxid_btm -->
};
    // ]]>
</script>

<!-- BEGIN: boxcategory -->	
<div class="lft-mid-wrap">
    <div class="lft-mid-left">&nbsp;</div>
    <div class="lft-mid-center">
        <div class="glossymenu">
        <a class="menuitem submenuheader" href="#" ><span>{BOX_TITLE}</span></a>
            <div class="submenu">
                <div id="my_menu{DATA1.box_id}" class="left-nav">
                      
                      <!-- BEGIN: main_div -->
                       <div>
                                              
                     	<!-- BEGIN: category -->
                        <span>{DATA.cat_name} </span>
                       <!-- END: category -->                                             
                       
                       	<!-- BEGIN: category_false -->
                        <span class="remove-arrow">{DATA.cat_name} </span>
                        <!-- END: category_false -->
                        
                        <!-- BEGIN: maincategory -->                        
                            <!-- BEGIN: subcategory -->
                                <a  href="index.php?act=viewCat&amp;catId={DATA2.cat_id}"  >
                                {DATA2.cat_name}</a>
                            <!-- END: subcategory -->                            
                        <!-- END: maincategory -->
                        
                    </div>
                    <strong class="sptr"><img src="skins/jagDirect/styleImages/navi-bottom.jpg" alt="img" /></strong>
						<!-- END: main_div -->
                </div>
            </div>
        </div>
    </div>
    <div class="lft-mid-right">&nbsp;</div>
</div>
               
<!-- END: boxcategory -->	

<!-- END: categories3 -->
