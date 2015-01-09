<!-- BEGIN: categories -->	
<ul id="chromemenu">
		<li><a href="index.php">Home</a></li>
        	<li><span>|</span></li>
        
        <!-- BEGIN: li -->
		<li><a href="index.php?act=viewCat&catId={DATA.cat_id}" rel="submenu{DATA.cat_id}">
        {DATA.cat_name}</a></li>
        <li><span>|</span></li>
		<!-- END: li -->
        
</ul>

<!-- BEGIN: maincategory -->
<div id="submenu{DATA.cat_id}" class="dropmenudiv">
<!-- BEGIN: subcategory -->

    <a href="index.php?act=viewCat&amp;catId={DATA2.cat_id}"  >
        {DATA2.cat_name}
    </a>

		<!-- END: subcategory -->
</div>
 <!-- END: maincategory -->

  <script type="text/javascript">
			
  cssdropdown.startchrome("chromemenu")
  
  </script>


<!-- END: categories -->
