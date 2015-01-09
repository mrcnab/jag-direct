<!-- BEGIN: view_cat_new_accessories -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>Mobile Accessories</h3></div>
 <div class="new-release01-mid">
<!-- BEGIN: sub_cats -->
<div id="subCats">
	<!-- BEGIN: sub_cats_loop -->
	<span class="subCat" >
		<a href="index.php?act=viewCat&amp;catId={TXT_LINK_CATID}" class="txtDefault"><img src="{IMG_CATEGORY}" alt="{TXT_CATEGORY}" border="0" title="{TXT_CATEGORY}"  /></a><br />
		<a href="index.php?act=viewCat&amp;catId={TXT_LINK_CATID}" class="txtDefault">{TXT_CATEGORY}</a> ({NO_PRODUCTS})
	</span>
	<!-- END: sub_cats_loop -->
</div>
<!-- END: sub_cats -->
<br clear="left" />
<!-- BEGIN: cat_img -->
<img src="{IMG_CURENT_CATEGORY}" alt="{TXT_CURENT_CATEGORY}" border="0" title="{TXT_CURENT_CATEGORY}" />
<!-- END: cat_img -->
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
<!-- END: view_cat_new_accessories -->
