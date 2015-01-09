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
|	calc.php
|   ========================================
|	Calculates shipping based on a flat rate	
+--------------------------------------------------------------------------
*/
// flat rate
$module = fetchDbConfig("By_Percent");
if($module['status']==1){

$sum = sprintf("%.2f",$subTotal * (($module['percent'])/100));

$shippingPrice .= "<option value='".$shipKey."'";

if($shipKey == $basket['shipKey']){
	$shippingPrice .= " selected='selected'";
	$basket = $cart->setVar($module['percent'].$lang['misc']['perofOrderSub'],"shipMethod");
	$basket = $cart->setVar(sprintf("%.2f",$sum),"shipCost");
}

$shippingPrice .= ">".priceFormat($sum)."</option>\r\n";
$shippingAvailable = TRUE;
$shipKey++;

unset($module, $taxVal);
}
?>