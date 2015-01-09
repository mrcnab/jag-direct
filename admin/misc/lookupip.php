<?
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
|	lookupip.php
|   ========================================
|	Look up IP Hostname
+--------------------------------------------------------------------------
*/
include("../../includes/ini.inc.php");
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><?php echo $_GET['ip']; ?></title>
<link href="../styles/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<p class="pageTitle"><?php echo $_GET['ip']; ?></p>
<p class="copyText"><?php echo gethostbyaddr($_GET['ip']); ?></p>
<p align="center" class="copyText"><strong>[<a href="javascript:window.close();" class="txtLink">x</a>]</strong></p>
</body>
</html>
