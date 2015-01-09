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

|	popularProducts.inc.php

|   ========================================

|	Display the most Popular Products	

+--------------------------------------------------------------------------

*/



if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {

	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";

	exit;

}



// query database

$popularProds = $db->select("SELECT name, price, image,  productId FROM ".$glob['dbprefix']."CubeCart_inventory  where `bestAccessories` = 1 ORDER BY productId DESC LIMIT 0 , 6");



//print_r($popularProds);



$box_content = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/priceProducts.tpl");



$box_content->assign("LANG_POPULAR_PRODUCTS_TITLE",$lang['front']['boxes']['price_products']);





		
	if($_SERVER['HTTP_REFERER'] != 'viewProd.php') {

if($popularProds == TRUE){

	// start loop

	for ($i=0; $i<count($popularProds); $i++){

		

		if(($val = prodAltLang($popularProds[$i]['productId'])) == TRUE){

			

				$popularProds[$i]['name'] = $val['name'];

				$popularProds[$i]['image'] = validHTML($GLOBALS['rootRel']."images/uploads/thumbs/thumb_".$val[$i]['image']);

		

		}

		$popularProds[$i]['name'] = validHTML($popularProds[$i]['name']);

		

		if(!empty($popularProds[$i]['image'])){

		$popularProds[$i]['image'] = validHTML($GLOBALS['rootRel']."images/uploads/thumbs/thumb_".$popularProds[$i]['image']);

		} else {

		$popularProds[$i]['image'] = validHTML($GLOBALS['rootRel']."images/uploads/nophoto.gif");

		}	

		

		$box_content->assign("DATA",$popularProds[$i]);

		$box_content->parse("price_products.li");

	

	} // end loop

} 
}else{
$box_content->parse("price_products.false");
}

$box_content->parse("price_products");

$box_content = $box_content->text("price_products");

?>