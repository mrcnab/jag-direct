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
|	Calculates the Royal Mail postage value based on weight	
+--------------------------------------------------------------------------
*/

// per category shipping module
$module = fetchDbConfig("Royal_Mail");
if($module['status']==1){

// get the delivery ISO
$countryISO = countryIso($basket['delInf']['country']);

// build array of ISO Codes
$zones['1'] = explode(",",str_replace(" ","",strtoupper($module['zone1Countries'])));
$zones['2'] = explode(",",str_replace(" ","",strtoupper($module['zone2Countries'])));
$zones['3'] = explode(",",str_replace(" ","",strtoupper($module['zone3Countries'])));
$zones['4'] = explode(",",str_replace(" ","",strtoupper($module['zone4Countries'])));



// find the country
foreach ($zones as $key => $value){

	foreach($zones[$key] as $no => $iso){
	 
		if($iso == $countryISO){
		
			$shipZone = $key;
		
		}
	
	}

}

// work out cost
$shipBands = explode(",",str_replace(" ","",$module['zone'.$shipZone.'Rates']));
$noBands = count($shipBands);

for($j=0; $j<count($shipBands);$j++){

	$wheightCost = explode(":",str_replace(" ","",$shipBands[$j]));
	
	if($totalWeight<=$wheightCost[0]){
		
		$sum = $wheightCost[1]+$module['zone'.$shipZone.'Handling'];
		break;
		
	} elseif($totalWeight>$wheightCost[0] && $j+1==$noBands){
	
		$overWeight = TRUE;
	
	}

}

if($sum>0)
{
	$shippingPrice .= "<option value='".$shipKey."'";
	
	if($shipKey==$basket['shipKey'])
	{
		$shippingPrice .= " selected='selected'";
		$basket = $cart->setVar("Royal Mail","shipMethod");
		$basket = $cart->setVar(sprintf("%.2f",$sum),"shipCost");
	}

	$shippingPrice .= ">".priceFormat($sum)."</option>\r\n";
	$shippingAvailable = TRUE;
}

$shipKey++;
unset($module, $taxVal);
}
?>