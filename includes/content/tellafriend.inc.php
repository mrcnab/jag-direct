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
|	tellafriend.inc.php
|   ========================================
|	Tell a friend about a product	
+--------------------------------------------------------------------------
*/
if (eregi(".inc.php",$HTTP_SERVER_VARS['PHP_SELF']) || eregi(".inc.php",$_SERVER['PHP_SELF'])) {
	echo "<html>\r\n<head>\r\n<title>Forbidden 403</title>\r\n</head>\r\n<body><h3>Forbidden 403</h3>\r\nThe document you are requesting is forbidden.\r\n</body>\r\n</html>";
	exit;
}

// query database
$_GET['productId'] = treatGet($_GET['productId']) ;
$result = $db->select("SELECT name FROM ".$glob['dbprefix']."CubeCart_inventory WHERE productId = ".$db->mySQLSafe($_GET['productId'])); 

	if($lang_folder !== $config['defaultLang']){
	
		$foreignVal = $db->select("SELECT name FROM ".$glob['dbprefix']."CubeCart_inv_lang WHERE prod_master_id = ".$db->mySQLSafe($_GET['productId'])." AND prod_lang=".$db->mySQLSafe($lang_folder));
		
		if($foreignVal==TRUE){
		
			$result[0]['name'] = $foreignVal[0]['name'];
			
		}
	
	}

// send email if form is submit
if(isset($_POST['submit'])){

		$spamCode = fetchSpamCode($_POST['ESC'],TRUE);

		// start validation
		if((!isset($_POST['spamcode']) || ($spamCode['SpamCode']!==$_POST['spamcode']) || ($_SERVER['REMOTE_ADDR']!==$spamCode['userIp'])) AND ($config['floodControl']==1))
		{
			$errorMsg = $lang['front']['tellafriend']['error_code'];

		}
		elseif(empty($_POST['senderName']) || empty($_POST['recipName']) )
		{
			$errorMsg = $lang['front']['tellafriend']['error_name'];

		} 
		elseif(validateEmail($_POST['senderEmail'])==FALSE || validateEmail($_POST['recipEmail'])==FALSE)
		{
			$errorMsg = $lang['front']['tellafriend']['error_email'];
		}
		else
		{

			// make email
		include_once("classes/class.phpmailer.php");
		
		$mail = new PHPMailer();
			
			
			$text .="<table width='765' border='0' align='center' cellpadding='0' cellspacing='0'>
				  <tr>
					<td>
					<table width='765' border='0' align='center'>
				   <tr>
					<td style=' font-family: Verdana, Arial, Helvetica, sans-serif;text-align: left;
				font-style: normal;text-decoration: none;background-color: #fffff;vertical-align:left;height:70px;color:#336588;font-size:20px;font-weight: bold;'><img src='http://192.168.1.202/TZWeb/jag-direct/Website/skins/jagDirect/styleImages/logo.jpg' border='0' />
                </td>
				  </tr>
				  <tr>
					<td style='font-family: Verdana, Arial, Helvetica, sans-serif;
				font-style: normal;text-decoration: none;background-color: #fffff;vertical-align:middle;height:40px;color:#336588;font-size:15px;font-weight: bold;'>&nbsp;&nbsp;Product review from Jag Direct on behalf of ".$_POST['senderName']."</td>
				  </tr>
				  <tr>
					<td align='left' style='padding-top:20px; width:50%; text-align:left;'>";
                    
                $text .= @sprintf($lang['front']['tellafriend']['email_body'],treatGet($_POST['recipName']),stripslashes(treatGet($_POST['message'])),$GLOBALS['storeURL'],treatGet($_GET['productId']),$GLOBALS['storeURL'],$_SERVER['REMOTE_ADDR']);    
                    
                    
                    
				$text .="</td>
				  </tr>
				</table></td>
				  </tr>				  
				  <tr>
					<td style='padding-top:20px;'><table width='765' align='center' border='0' cellspacing='0' cellpadding='0'>
				  <tr>
						<td colspan='2' nowrap='nowrap' style='font-family: Verdana, Arial, Helvetica, sans-serif;
				font-style: normal;text-decoration: none;background-color: #fffff;vertical-align:middle;height:40px;color:#336588;font-size:15px;font-weight: bold;'>&nbsp;&nbsp;&nbsp;All rights reserved to Jag Direct</td>
				  </tr>
					  <tr>
						<td colspan='2' nowrap='nowrap'>&nbsp;</td>
					  </tr>                  
					</table>
					</td>
				  </tr>
				</table>";
			
			$mail = new PHPMailer();
			$mail->AddReplyTo($_POST['recipEmail'],"Jag Direct");
			$mail->WordWrap = 50;                              // set word wrap
			$mail->IsHTML(true);                               // send as HTML
			$mail->From     = $_POST['senderEmail'];
			$mail->FromName = $_POST['senderName'];
			$mail->Subject  = sprintf($lang['front']['tellafriend']['email_subject'],$_POST['senderName']);
			$mail->Body = $text;
			$mail->AddAddress($_POST['recipEmail'], "Administrator Jag Direct");
			if($mail->Send())	;			

		}

}

$tellafriend=new XTemplate ("skins/".$config['skinDir']."/styleTemplates/content/tellafriend.tpl");

	$tellafriend->assign("PRODUCT_ID",$_GET['productId']);
	
	$tellafriend->assign("TAF_TITLE",$lang['front']['tellafriend']['tellafriend']);
	
	if(isset($_POST['submit']) && !isset($errorMsg))
	{
	
		$tellafriend->assign("TAF_DESC",sprintf($lang['front']['tellafriend']['message_sent'],$_POST['recipName'],$result[0]['name']));
	
	} 
	else 
	{
	
		$tellafriend->assign("TAF_DESC",sprintf($lang['front']['tellafriend']['fill_out_below'],$result[0]['name']));
	
		if(isset($errorMsg))
		{

			$tellafriend->assign("VAL_ERROR",$errorMsg);
			$tellafriend->parse("tellafriend.error");
	
		}
	
		
	
	}
	
	$tellafriend->assign("TXT_RECIP_NAME",$lang['front']['tellafriend']['friends_name']);
	
	$tellafriend->assign("TXT_RECIP_EMAIL",$lang['front']['tellafriend']['friends_email']);
	
	
	$tellafriend->assign("TXT_SENDER_NAME",$lang['front']['tellafriend']['your_name']);
	
	if(isset($_POST['senderName'])){
		$tellafriend->assign("VAL_SENDER_NAME",$_POST['senderName']);
	}
	
	$tellafriend->assign("TXT_SENDER_EMAIL",$lang['front']['tellafriend']['your_email']);
	
	if(isset($_POST['senderName'])){
		$tellafriend->assign("VAL_SENDER_EMAIL",$_POST['senderEmail']);
	}
	
	$tellafriend->assign("TXT_MESSAGE",$lang['front']['tellafriend']['message']);
	
	if(isset($_POST['message'])){
		$tellafriend->assign("VAL_MESSAGE",stripslashes($_POST['message']));
	} else {
		$tellafriend->assign("VAL_MESSAGE",sprintf($lang['front']['tellafriend']['default_message'],$result[0]['name']));
	}
	
	$tellafriend->assign("TXT_SUBMIT",$lang['front']['tellafriend']['send']);
	
	// Start Spam Bot Control
	if($config['floodControl']==1) {
		
		$spamCode = strtoupper(randomPass(5));
		$ESC = createSpamCode($spamCode);
		
		$imgSpambot = imgSpambot($ESC);
		
		$tellafriend->assign("VAL_ESC",$ESC);
		$tellafriend->assign("TXT_SPAMBOT",$lang['front']['tellafriend']['spambot']);
		$tellafriend->assign("IMG_SPAMBOT",$imgSpambot);
		$tellafriend->parse("tellafriend.spambot");
	}


$tellafriend->parse("tellafriend");
$page_content = $tellafriend->text("tellafriend");
?>