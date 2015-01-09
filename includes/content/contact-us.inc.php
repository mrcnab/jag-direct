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
|	reg.inc.php
|   ========================================
|	Customer Registration	
+--------------------------------------------------------------------------
*/

if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

if($ccUserData[0]['customer_id']>0){

//header("Location: cart.php?act=step1");

}
if(isset($_POST['email'])){
	$spamCode = fetchSpamCode($_POST['ESC'],TRUE);	

	if((!isset($_POST['spamcode']) || ($spamCode['SpamCode']!==$_POST['spamcode']) || ($_SERVER['REMOTE_ADDR']!==$spamCode['userIp'])) AND ($config['floodControl']==1))
		{
			$errorMsg = $lang['front']['tellafriend']['error_code'];
		}elseif(empty($_POST['fullName']) 
		|| empty($_POST['email']) 
		|| empty($_POST['mobile']) 
		|| empty($_POST['country']) 
		|| empty($_POST['comments'])){
		$errorMsg = $lang['front']['reg']['fill_required'];
	} elseif(validateEmail($_POST['email'])==FALSE) {
		$errorMsg = $lang['front']['reg']['enter_valid_email'];
	} elseif(!ereg("[0-9]",$_POST['mobile'])) {
		$errorMsg = $lang['front']['reg']['enter_valid_tel'];
	} elseif(!empty($_POST['phone']) && !ereg("[0-9]",$_POST['phone'])) {
		$errorMsg = $lang['front']['reg']['enter_valid_tel'];
	} else {
		$record["fullName"] = $_POST['fullName'];
		$record["email"] = $_POST['email'];
		$record["mobile"] = $_POST['mobile'];
		$record["phone"] = $_POST['phone'];
		$record["address"] = $_POST['address'];
		$record["city"] = $_POST['city'];
		$record["country"] = $_POST['country'];
		$record["County"] = $_POST['County'];
		$record["Postcode"] = $_POST['Postcode'];
		$record["comments"] = $_POST['comments'];
		
		$record["htmlEmail"] = $_POST['htmlEmail'];
		//$emailArray = $db->select("SELECT customer_id, type FROM ".$glob['dbprefix']."CubeCart_customer WHERE email=".$db->mySQLSafe($_POST['email']));
		
		
		//////////////
		include_once("classes/htmlMimeMail.php");
		$mail = new htmlMimeMail();
			
			
		$text =$record['fullName']." has entered following comments\n\nFull Name: ".$record['fullName']."\n".
		"Email Address: ".$record['fullName']."\n".
		"Mobile Number: ".$record['email']."\n".
		"Phone Number: ".$record['mobile']."\n".
		"Address: ".$record['address']."\n".
		"City: ".$record['city']."\n".
		"County: ".$record['County']."\n".
		"Postcode: ".$record['Postcode']."\n".
		"Country: ".$record['country']."\n".				
		"Comments: ".$record['comments']."\n";
		
		//$config['to'] = 'shussain@titlewebsolutions.com';
  		$mail->setText($text);
		$mail->setReturnPath($config['to']);
		$mail->setFrom($record['fullName'].' <'.$record['email'].'>');
		$mail->setSubject('Contact Us Inquiry');
		//$mail->setHeader('Contact Us Inquiry', 'Contact Us Inquiry');
		$send = $mail->send(array($config['masterEmail']),'mail');
		$errorMsg = 'Thanks for your comments, we will contact you soon.';
	}
}

$reg = new XTemplate ("skins/".$config['skinDir']."/styleTemplates/content/contact-us.tpl");

	if(isset($errorMsg)){
		$reg->assign("VAL_ERROR",$errorMsg);
		$reg->parse("reg.error");
	
	} else {
	
		$reg->assign("LANG_REGISTER_DESC",$lang['front']['reg']['note_required']);
		$reg->parse("reg.no_error");
	
	}
	$content = $db->select("SELECT doc_name, doc_content FROM ".$glob['dbprefix']."CubeCart_docs WHERE doc_id = 13"); 
	
	if(isset($content) && $content == TRUE){
		$reg->assign("CONTACT_US_CONTENT",(!get_magic_quotes_gpc ()) ? stripslashes($content[0]['doc_content']) : $content[0]['doc_content']);
	}	
	
	
	$reg->assign("LANG_REGISTER",$lang['front']['reg']['express_reg']);
	$reg->assign("LANG_REGISTER_SUBMIT",$lang['front']['reg']['submit_and_cont']);
	
	if(isset($_GET['redir']) && !empty($_GET['redir'])) {
		$reg->assign("VAL_ACTION","cart.php?act=contacts&amp;redir=".treatGet($_GET['redir']));
	} else {
		$reg->assign("VAL_ACTION","cart.php?act=contacts");
	}
	
	$reg->assign("LANG_SPECIAL_NOTE",$lang['front']['reg']['special_note']);
	$reg->assign("CONTACT_US_HEADING",$lang['front']['reg']['contact_heading']);
	$reg->assign("LANG_PERSONAL_DETAILS",$lang['front']['reg']['personal_details']);
	$reg->assign("LANG_ADDRESS",$lang['front']['reg']['address']);
	$reg->assign("LANG_TITLE",$lang['front']['reg']['title']);
	$reg->assign("LANG_TITLE_DESC",$lang['front']['reg']['title_desc']);
	$reg->assign("LANG_FIRST_NAME",$lang['front']['reg']['first_name']); 
	$reg->assign("LANG_FULL_NAME",$lang['front']['reg']['full_name']); 
	$reg->assign("LANG_COMMENTS",$lang['front']['reg']['comments']); 
	$reg->assign("LANG_ADDRESS_FORM",$lang['front']['reg']['address2']); 
	$reg->assign("LANG_LAST_NAME",$lang['front']['reg']['last_name']);
	$reg->assign("LANG_EMAIL_ADDRESS",$lang['front']['reg']['email_address']); 
	$reg->assign("LANG_TOWN",$lang['front']['reg']['town']);
	$reg->assign("LANG_TELEPHONE",$lang['front']['reg']['phone']);
	$reg->assign("LANG_COUNTY",$lang['front']['reg']['county']);
	$reg->assign("LANG_MOBILE",$lang['front']['reg']['mobile']);
	$reg->assign("LANG_COUNTRY",$lang['front']['reg']['country']);
	$reg->assign("LANG_POSTCODE",$lang['front']['reg']['postcode']);
	$reg->assign("LANG_SECURITY_DETAILS",$lang['front']['reg']['security_details']);
	$reg->assign("LANG_CHOOSE_PASSWORD",$lang['front']['reg']['choose_pass']);
	$reg->assign("LANG_CONFIRM_PASSWORD",$lang['front']['reg']['conf_pass']);
	$reg->assign("LANG_PRIVACY_SETTINGS",$lang['front']['reg']['privacy_settings']);
	$reg->assign("LANG_RECIEVE_EMAILS",$lang['front']['reg']['receive_emails']);
	$reg->assign("LANG_EMAIL_FORMAT",$lang['front']['reg']['email_format']); 
	$reg->assign("LANG_HTML_FORMAT",$lang['front']['reg']['styled_html']);
	$reg->assign("LANG_PLAIN_TEXT",$lang['front']['reg']['plain_text']); 
	$reg->assign("LANG_TANDCS",$lang['front']['reg']['tandcs']);
	$reg->assign("LANG_PLEASE_READ",$lang['front']['reg']['please_read']);
	
	$countries = $db->select("SELECT id, printable_name FROM ".$glob['dbprefix']."CubeCart_iso_countries");
	
	for($i=0; $i<count($countries); $i++){
	
		$reg->assign("VAL_COUNTRY_ID",$countries[$i]['id']);
		
		$countryName = "";
		$countryName = $countries[$i]['printable_name'];
		
		if(strlen($countryName)>20){
		
		$countryName = substr($countryName,0,20)."&hellip;";
		
		}
		
		$reg->assign("VAL_COUNTRY_NAME",$countryName);
		
		if(isset($_POST['country']) && $_POST['country'] == $countries[$i]['id']){
		
			$reg->assign("VAL_COUNTRY_SELECTED","selected='selected'");
			
		} elseif(!isset($_POST['country']) && ($countries[$i]['id']==$config['siteCountry'])) {
		
			$reg->assign("VAL_COUNTRY_SELECTED","selected='selected'");
			
		} else {
			$reg->assign("VAL_COUNTRY_SELECTED","");
		}
		$reg->parse("reg.repeat_countries");
	
	}
	
	
	if(isset($_POST['title'])){
	
		$reg->assign("VAL_TITLE",treatGet($_POST['title']));
		$reg->assign("VAL_FIRST_NAME",treatGet($_POST['firstName']));
		$reg->assign("VAL_LAST_NAME",treatGet($_POST['lastName']));
		$reg->assign("VAL_EMAIL",treatGet($_POST['email']));
		$reg->assign("VAL_PHONE",treatGet($_POST['phone']));
		$reg->assign("VAL_MOBILE",treatGet($_POST['mobile']));
		$reg->assign("VAL_ADD_1",treatGet($_POST['add_1']));
		$reg->assign("VAL_ADD_2",treatGet($_POST['add_2']));
		$reg->assign("VAL_TOWN",treatGet($_POST['town']));
		$reg->assign("VAL_COUNTY",treatGet($_POST['county']));
		$reg->assign("VAL_POSTCODE",treatGet($_POST['postcode']));
		
		if($_POST['password'] == $_POST['passwordConf']){
			
			$reg->assign("VAL_PASSWORD",treatGet($_POST['password']));
			$reg->assign("VAL_PASSWORD_CONF",treatGet($_POST['passwordConf']));
		
		}
		
		if(isset($_POST['optIn1st']) && $_POST['optIn1st']==1) {
			$reg->assign("VAL_OPTIN1ST_CHECKED","checked='checked'");
		}
		
		if($_POST['htmlEmail']==0){
			$reg->assign("VAL_HTMLEMAIL_SELECTED","selected='selected'");
		}
	}
	if($config['floodControl']==1) {
		
		$spamCode = strtoupper(randomPass(5));
		$ESC = createSpamCode($spamCode);
		
		$imgSpambot = imgSpambot($ESC);
		
		$reg->assign("VAL_ESC",$ESC);
		$reg->assign("TXT_SPAMBOT",$lang['front']['reg']['spambot']);
		$reg->assign("IMG_SPAMBOT",$imgSpambot);
		$reg->parse("reg.spambot");
	}

$reg->parse("reg");
$page_content = $reg->text("reg");
?>