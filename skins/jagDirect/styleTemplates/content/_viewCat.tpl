<!-- BEGIN: view_cat -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{TXT_CAT_TITLE}</h3></div>
 <div class="new-release01-content">
<!-- BEGIN: sub_cats -->
<div id="subCats">
	<!-- BEGIN: sub_cats_loop -->
     <div class="newRelse-add2">
                    <img src="{IMG_CATEGORY}" alt="{TXT_CATEGORY}" border="0" title="{TXT_CATEGORY}"   />
                    {TXT_CATEGORY} 
                    <span><a href="index.php?act=viewCat&catId={TXT_LINK_CATID}">
                    Total Product ({NO_PRODUCTS})</a> </span>
                    
</div>
	<!-- END: sub_cats_loop -->
</div>
<!-- END: sub_cats -->
<br clear="left" />
<div class="prod_category"><strong>{LANG_CURRENT_DIR}</strong> {CURRENT_DIR}</div>
<!-- BEGIN: productTable -->

    <!-- BEGIN: products -->
        <div class="newRelse-add2">
                    <img src="{SRC_PROD_THUMB}" alt="{TXT_TITLE}" border="0" title="{TXT_TITLE}"   />
                    {TXT_TITLE} 
                    <span> <a href="index.php?act=viewProd&amp;productId={PRODUCT_ID}">
                    View More</a>  </span>
                    <p style="color:#8E0402; font-weight:bold; padding-top:3px;">   {TXT_PRICE} </p>
</div>
    <!-- END: products -->
<!-- END: productTable -->
<!-- BEGIN: noProducts -->
<div style="padding-top:10px; float:left; color:#1A354B;">{TXT_NO_PRODUCTS}</div>
<!-- END: noProducts -->

<div class="paging">{PAGINATION}</div>


</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: view_cat -->


       