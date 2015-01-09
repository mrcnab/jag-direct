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
|	Main pages of the store	
+--------------------------------------------------------------------------
*/
	include_once("includes/ini.inc.php");
	
	
	
	// INCLUDE CORE VARIABLES & FUNCTIONS
	include_once("includes/global.inc.php");
	
	// check if installed
	if($glob['installed']==0){
	
		header("location: install/index.php");
		exit;
		
	} elseif((file_exists($glob['rootDir']."/install/index.php") || file_exists($glob['rootDir']."/upgrade.php") && $glob['installed']==1)){
	
		echo "<strong>WARNING</strong> - Your store will not function until the install directory and/or upgrade.php is deleted from the server.";
		exit;
		
	}
	

	
	// initiate db class
	include_once("classes/db.inc.php");
	$db = new db();
	include_once("includes/functions.inc.php");
	$config = fetchDbConfig("config");
	
	include_once("includes/sessionStart.inc.php");
	
	include_once("includes/sslSwitch.inc.php");
	
	// get session data
	include_once("includes/session.inc.php");
	
	// get exchange rates etc
	include_once("includes/currencyVars.inc.php");
	
	$lang_folder = "";
	
	if(empty($ccUserData[0]['lang'])){
		$lang_folder = $config['defaultLang'];
	} else {
		$lang_folder = $ccUserData[0]['lang'];
	}
	include_once("language/".$lang_folder."/lang.inc.php");
	
	// require template class
	include_once("classes/xtpl.php");
	
	$body = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/global/index.tpl");

	if(isset($_GET['searchStr'])){
		$body->assign("SEARCHSTR",treatGet($_GET['searchStr']));
	} else {
		$body->assign("SEARCHSTR","");
	}
	
	$body->assign("CURRENCY_VER",$currencyVer);
	$body->assign("VAL_ISO",$charsetIso);
	$body->assign("VAL_SKIN",$config['skinDir']);
	

		
	// START  MAIN CONTENT
	if(isset($_GET['act'])){
	
		switch (treatGet($_GET['act'])) {

			case "viewDoc":
				include("includes/content/viewDoc.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break; 
			
			case "viewCat":
				include("includes/content/viewCat.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "viewCatlastest":
				include("includes/content/viewCatlastest.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "viewCatnewrelease":
				include("includes/content/viewCatnewrelease.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "viewCataccessories":
				include("includes/content/viewCataccessories.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "viewCatbestprice":
				include("includes/content/viewCatpriceaccessories.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "services":
				include("includes/content/testimonial.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "viewCatbrands":
				include("includes/content/viewCatbrands.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "viewCatbrandstitle":
				include("includes/content/viewCatbrandstitle.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;					
			
			case "viewoffers":
				include("includes/content/viewoffers.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			
			case "viewProd":
				include("includes/content/viewProd.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			case "unsubscribe":
				include("includes/content/unsubscribe.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			case "taf":
				include("includes/content/tellafriend.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			case "login":
				include("includes/content/login.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break; 
			case "logout":
				include("includes/content/logout.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break; 
			case "forgotPass":
				include("includes/content/forgotPass.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break; 
			case "account":
				include("includes/content/account.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break; 
			case "profile":
				include("includes/content/profile.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;     
			case "changePass":
				include("includes/content/changePass.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			case "newsletter":
				include("includes/content/newsletter.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
			case "dnExpire":
				include("includes/content/dnExpire.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break; 
			default:
				include("includes/content/index.inc.php");
				$body->assign("PAGE_CONTENT",$page_content);
			break;
		}
		
	} else {
		
		include("includes/content/index.inc.php");
		$body->assign("PAGE_CONTENT",$page_content);
	
	}
	// END MAIN CONTENT
	
	// START META DATA
	if(isset($meta)){
		$body->assign("META_TITLE",htmlspecialchars($meta['siteTitle']).c());
		$body->assign("META_DESC",$meta['metaDescription']);
		$body->assign("META_KEYWORDS",$config['metaKeyWords']);
	} else {
		$body->assign("META_TITLE",htmlspecialchars(str_replace("&#39;","'",$config['siteTitle'])).c());
		$body->assign("META_DESC",$config['metaDescription']);
		$body->assign("META_KEYWORDS",$config['metaKeyWords']);
	}
	
	// START CONTENT BOXES
	include("includes/boxes/searchForm.inc.php");
	$body->assign("SEARCH_FORM",$box_content);
	

	include("includes/boxes/searchForm2.inc.php");
	$body->assign("SEARCH_FORM2",$box_content);
	
	include("includes/boxes/session.inc.php");
	$body->assign("SESSION",$box_content);

	include("includes/boxes/session2.inc.php");
	$body->assign("SESSION2",$box_content);
	
	include("includes/boxes/bannerLeft.inc.php");
	$body->assign("BANNERLEFT",$box_content);
	
	include("includes/boxes/bannerRight.inc.php");
	$body->assign("BANNERRIGHT",$box_content);
	
	include("includes/boxes/testimonial.inc.php");
	$body->assign("TESTIMONAIL",$box_content);
	
	include("includes/boxes/categories.inc.php");
	$body->assign("CATEGORIES",$box_content);
	
	include("includes/boxes/categories2.inc.php");
	$body->assign("CATEGORIES2",$box_content);
	
	include("includes/boxes/categories3.inc.php");
	$body->assign("CATEGORIES3",$box_content);
	
	include("includes/boxes/categories_women.inc.php");
	$body->assign("CATEGORIES_WOMEN",$box_content);
	
	include("includes/boxes/randomProd.inc.php");
	$body->assign("RANDOM_PROD",$box_content);
	
	include("includes/boxes/info.inc.php");
	$body->assign("INFORMATION",$box_content);
	
	include("includes/boxes/language.inc.php");
	$body->assign("LANGUAGE",$box_content);
	
	include("includes/boxes/currency.inc.php");
	$body->assign("CURRENCY",$box_content);
	
	include("includes/boxes/shoppingCart.inc.php");
	$body->assign("SHOPPING_CART",$box_content);
	
	include("includes/boxes/popularProducts.inc.php");
	$body->assign("POPULAR_PRODUCTS",$box_content);
	
	include("includes/boxes/topProducts.inc.php");
	$body->assign("TOP_PRODUCTS",$box_content);
	
	include("includes/boxes/saleItems.inc.php");
	$body->assign("SALE_ITEMS",$box_content);
	
	include("includes/boxes/mailList.inc.php");
	$body->assign("MAIL_LIST",$box_content);
	
	include("includes/boxes/siteDocs.inc.php");
	$body->assign("SITE_DOCS",$box_content);
	
	include("includes/boxes/priceProducts.inc.php");
	$body->assign("PRICE_PRODUCTS",$box_content);	
	
	
	include("includes/boxes/siteDocsFooter.inc.php");
	$body->assign("SITE_DOCS_FOOTER",$box_content);
	// END CONTENT BOXES
	
	// parse and spit out final document
	$body->parse("body");
	$body->out("body");
?>