<!-- BEGIN: login -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_LOGIN_TITLE}</h3></div>
 <div class="new-release01-content">
			    <div style="float:left;">
    <p style="margin:0px; padding:0px;">{LOGIN_STATUS}</p>
	
	<!-- BEGIN: form -->
	<form action="index.php?act=login&amp;redir={VAL_SELF}" target="_self" method="post">

        <table border="0" cellspacing="0" cellpadding="5" align="left" style="position:relative;right:5px;" >
			<tr>
				<td align="left"><strong>{LANG_USERNAME}</strong></td>
				<td><input type="text" name="username" class="txtfield" value="{VAL_USERNAME}" /><font color="red">  *</font></td>
			</tr>
			<tr>
				<td align="left"><strong>{LANG_PASSWORD}</strong></td>
				<td><input type="password" name="password" class="txtfield" /><font color="red">  *</font></td>
			</tr>
			<tr>
				<td align="left"></td>
				<td><input name="remember" type="checkbox" value="1" class="checkbox" {CHECKBOX_STATUS} style=" position:relative;right:3px;" /> {LANG_REMEMBER}</td>
			</tr>
            <tr>
				<td>&nbsp;</td>
				<td class="linkcls12"><a href="index.php?act=forgotPass">{LANG_FORGOT_PASS}</a></td>
			</tr>
            <tr>
				<td>&nbsp;</td>
				<td class="linkcls12"><a href="cart.php?act=reg">Register Now</a></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input name="submit" type="submit" value="{TXT_LOGIN}" class="btn" /></td>
			</tr>
			
	  </table>

	</form>
	<!-- END: form -->
    </div>
</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: login -->