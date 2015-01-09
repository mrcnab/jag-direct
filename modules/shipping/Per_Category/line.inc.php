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
|	line.php
|   ========================================
|	Calculates Category Line Shipping Cost	
+--------------------------------------------------------------------------
*/

// per category shipping module
$module = fetchDbConfig("Per_Category");

// get the delivery ISO
$countryISO = countryIso($basket['delInf']['country']);

// build array of ISO Codes
$zones['n'] = explode(",",str_replace(" ","",strtoupper($module['national'])));
$zones['i'] = explode(",",str_replace(" ","",strtoupper($module['international'])));
$zones['e'] = explode(",",str_replace(" ","",strtoupper($module['excluded'])));

// find the country
foreach ($zones as $key => $value){

	foreach($zones[$key] as $no => $iso){
	
		if($iso == $countryISO){
		
			$shipZone = $key;
		
		}
	
	}

}

if($shipZone == "n"){

	$lineShip = $lineShip + ($product[0]['item_ship'] * $quantity);
	
	if(!isset($perShipPrice) OR $perShipPrice<$product[0]['per_ship']){
		$perShipPrice = $product[0]['per_ship'];
	}

} elseif($shipZone == "i"){
	
	$lineShip = $lineShip + ($product[0]['item_int_ship'] * $quantity);
	
	if(!isset($perShipPrice) OR $perShipPrice<$product[0]['per_int_ship']){
		$perShipPrice = $product[0]['per_int_ship'];
	}

} elseif($shipZone == "e" || !isset($shipZone)){
// do nothing?!
}

?>