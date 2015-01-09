<!-- BEGIN: newsletter -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_NEWSLETTER_TITLE}</h3></div>
 <div class="new-release01-content">

      <div style="float:left; padding:5px; ">
<!-- BEGIN: session_true -->
	{LANG_NEWSLETTER_DESC}
	
		<form action="index.php?act=newsletter" target="_self" method="post">
			<table border="0" cellspacing="0" cellpadding="3" align="left">
				<tr align="left">
				  <td colspan="2"><strong>{TXT_SUBSCRIBED}</strong></td>
			  </tr>
				<tr>
					<td align="right">{LANG_YES}
                    <input type="radio" name="optIn1st" value="1" {STATE_SUBSCRIBED_YES}  /></td>
					<td align="right">
					{LANG_NO} 
					  <input type="radio" name="optIn1st" value="0" {STATE_SUBSCRIBED_NO} />
				    </td>
				</tr>
				<tr align="left">
				  <td colspan="2"><strong>{TXT_EMAIL_FORMAT}</strong></td>
			  </tr>
				<tr>
					<td align="right">{LANG_TEXT}
                    <input type="radio" name="htmlEmail" value="0" {STATE_HTML_TEXT} /></td>
					<td align="right">
					<abbr title="{LANG_HTML_ABBR}">{LANG_HTML}</abbr> <input type="radio" name="htmlEmail" value="1" {STATE_HTML_HTML} />
					</td>
				</tr>
				<tr>
				  <td>&nbsp;</td>
				  <td><input name="submit" type="submit" value="{TXT_SUBMIT}" class="btn" /></td>
			  </tr>
		</table>
	</form>
	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<p>{LANG_LOGIN_REQUIRED}</p>
	<!-- END: session_false -->
</div>
</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: newsletter -->