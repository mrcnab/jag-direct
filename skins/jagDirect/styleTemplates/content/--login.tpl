<!-- BEGIN: login -->
<div class="pro-wrap">
<div class="feature-heading"><b>{LANG_LOGIN_TITLE}</b></div>
			    <div style="float:left; padding-top:3px; padding-left:0px;">
    <p>{LOGIN_STATUS}</p>
	
	<!-- BEGIN: form -->
	<form action="index.php?act=login&amp;redir={VAL_SELF}" target="_self" method="post" style="position:relative;right:2px;">

        <table border="0" cellspacing="0" cellpadding="5" align="left" >
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
				<td><input name="remember" type="checkbox" value="1" class="checkbox" {CHECKBOX_STATUS} /> {LANG_REMEMBER}</td>
			</tr>
            <tr>
				<td>&nbsp;</td>
				<td class="linkcls"><a href="index.php?act=forgotPass">{LANG_FORGOT_PASS}</a></td>
			</tr>
            <tr>
				<td>&nbsp;</td>
				<td class="linkcls"><a href="cart.php?act=reg">Register Now</a></td>
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
<!-- END: login -->