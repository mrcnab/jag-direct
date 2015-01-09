<!-- BEGIN: change_pass -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_CHANGE_PASS_TITLE}</h3></div>
 <div class="new-release01-content">

      <div style="float:left; padding:5px; ">

	<!-- BEGIN: session_true -->
	
	<!-- BEGIN: no_error -->
	{LANG_PASS_DESC}
	<!-- END: no_error -->
	
	<!-- BEGIN: error -->
	{VAL_ERROR}
	<!-- END: error -->
	
		<!-- BEGIN: form -->
		<form action="index.php?act=changePass" target="_self" method="post">
			<table border="0" cellspacing="0" cellpadding="3" align="left">
				<tr>
					<td align="left"><strong>{TXT_OLD_PASS}</strong></td>
					<td><input name="oldPass" type="password" class="txtfield" id="oldPass" maxlength="30" /></td>
				</tr>
				<tr>
					<td align="left"><strong>{TXT_NEW_PASS}</strong></td>
					<td><input name="newPass" type="password" class="txtfield" id="newPass" maxlength="100" /></td>
				</tr>
				<tr>
					<td align="left"><strong>{TXT_NEW_PASS_CONF}</strong></td>
					<td><input name="newPassConf" type="password" class="txtfield" id="newPassConf" maxlength="100" /></td>
				</tr>
				<tr>
				  <td>&nbsp;</td>
				  <td><input name="submit" type="submit" value="{TXT_SUBMIT}" class="btn" /></td>
			  </tr>
		</table>
	</form>
	<!-- END: form -->
	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<p>{LANG_LOGIN_REQUIRED}</p>
	<!-- END: session_false -->
</div>
</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: change_pass -->