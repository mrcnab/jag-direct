<!-- BEGIN: body -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>{META_TITLE}</title>
<meta name="description" content="{META_DESC}" />
<meta name="keywords" content="{META_KEYWORDS}" />
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"> 
<link href="skins/{VAL_SKIN}/styleSheets/style.css" rel="stylesheet" type="text/css" />   

   <!--gallery files-->
<link href="skins/{VAL_SKIN}/styleSheets/gallery-slideshow.css" rel="stylesheet" type="text/css" />   
<script type="text/javascript" src="js/gallery-slideshow.js"></script>
   <!--gallery-->

<link href="skins/{VAL_SKIN}/styleSheets/clearbox.css" rel="stylesheet" type="text/css" /> 
<script src="js/clearbox.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/ddlevelsmenu.js">
</script>
<script type="text/javascript" src="js/jslibrary.js"></script>
<script type="text/javascript" src="js/virtualpaginate.js"></script>

    <!-- menu -->
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/ddaccordion.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<link rel="stylesheet" href="skins/{VAL_SKIN}/styleSheets/menu.css" type="text/css" />
<!-- menu -->

<!-- Start Slide Menu -->
<link rel="stylesheet" type="text/css" href="skins/{VAL_SKIN}/styleSheets/sdmenu.css" />
<script type="text/javascript" src="js/sdmenu.js"></script>

<!-- End Slide Menu -->

<!-- SLIDER STARTS -->

<script type="text/javascript" src="js/easySlider1.7.js"></script>
<script type="text/javascript">
		$(document).ready(function(){	
			$("#slider").easySlider({
				auto: true, 
				continuous: true,
				numeric: true
			});
		});	
	</script>


<!-- SLIDER ENDS  -->    
    
</head>

<body>
<div id="outer-cont">
<!--............starting Head................-->
	<div id="header">
    	<div class="header-upper">
            <div class="logo-cont">
            <a href="index.php"><img src="skins/jagDirect/styleImages/logo.jpg" alt="logo" border="0" /></a>
            </div>
            <div class="cart-detail">
            {SHOPPING_CART}
            </div>
        </div>
	 {SITE_DOCS}         
        <div class="search-cont">
		{SEARCH_FORM}{SESSION}	  
	    </div>        
    </div>    
    <div id="middle">
    	<div id="mid-left">
        	<div class="lft-upr">&nbsp;</div>
            <div class="lft-mid"> 
             {CATEGORIES3}
            	{TOP_PRODUCTS} 
				{TESTIMONAIL}                  
            </div>
        </div>        
        <!-- MID RIGHT STARTS -->
        <div id="mid-right-upr">
        <div id="mid-center">
               
        
            {PAGE_CONTENT} 
            </div>
         <div id="right">
            {BANNERRIGHT}
         </div>
            
        <!-- MID RIGHT ENDS -->

        {PRICE_PRODUCTS}
        </div>    

        
    </div>
    <br class="clear" />
    <!-- FOOTER CONT SRTARTS -->
    <div id="footer">
        <div id="footer-cont">
        	<div class="footer-left">
            	<div class="footer-links">
               {SITE_DOCS_FOOTER}
                </div>
                
                <div class="copyrights">
                &nbsp;Copyright &copy; 2010 Title Web Solutions, Powered by <a href="http://www.titlewebsolutions.com" target="_blank">
                Title</a>
                </div>
                
            </div>
            
            <div class="footer-right">
                {MAIL_LIST}
                
                <img src="skins/jagDirect/styleImages/paypal.jpg" alt="gateways" style="position:relative;left:75px;" border="0"  />
                
            </div>
        </div>
    </div>
    <!-- FOOTER CONT ENDS -->
    
</div>
</body>
</html>

<!-- END: body -->