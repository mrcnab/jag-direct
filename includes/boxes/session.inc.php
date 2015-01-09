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
|	session.inc.php
|   ========================================
|	Session Links & Welcome Text	
+--------------------------------------------------------------------------
*/

if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

$box_content = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/boxes/session.tpl");

// build attributes
if($ccUserData[0]['customer_id']>0){

		$box_content->assign("LANG_WELCOME_BACK",substr($lang['front']['boxes']['welcome_back'],0,8));
		$box_content->assign("TXT_USERNAME",substr($ccUserData[0]['lastName'],0,7));
		$box_content->assign("LANG_LOGOUT",substr($lang['front']['boxes']['logout'],0,13));
		$box_content->assign("LANG_YOUR_ACCOUNT",substr($lang['front']['boxes']['your_account'],0,13));
		$box_content->parse("session.session_true");

} else {

		$box_content->assign("LANG_WELCOME_GUEST",substr($lang['front']['boxes']['welcome_guest'],0,8));
		$box_content->assign("VAL_SELF",base64_encode(currentPage()));
		$box_content->assign("LANG_LOGIN",substr($lang['front']['boxes']['login'],0,5));
		$box_content->assign("LANG_REGISTER",substr($lang['front']['boxes']['register'],0,9));
		$box_content->parse("session.session_false");

}

$box_content->parse("session");
$box_content = $box_content->text("session");
?>