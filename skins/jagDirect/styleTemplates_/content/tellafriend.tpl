<!-- BEGIN: tellafriend -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{TAF_TITLE}</h3></div>
 <div class="new-release01-content">

    
	<!-- BEGIN: error -->
	<p class="txtError">{VAL_ERROR}</p>
	<!-- END: error -->
	<p>{TAF_DESC}</p>
	
		<form action="index.php?act=taf&amp;productId={PRODUCT_ID}" target="_self" method="post">
			<table border="0" cellspacing="2" cellpadding="2" align="left">
				<tr>
					<td align="right" valign="top"><strong>{TXT_RECIP_NAME}</strong></td>
					<td><input type="text" name="recipName" class="txtfield" /> <span class="asterik">*</span></td>
				</tr>
				<tr>
					<td align="right" valign="top"><strong>{TXT_RECIP_EMAIL}</strong></td>
					<td><input type="text" name="recipEmail" class="txtfield" /> <span class="asterik">*</span></td>
				</tr>
				<tr>
					<td align="right" valign="top"><strong>{TXT_SENDER_NAME}</strong></td>
					<td><input type="text" name="senderName" class="txtfield" value="{VAL_SENDER_NAME}" /> <span class="asterik">*</span></td>
				</tr>
				<tr>
					<td align="right" valign="top"><strong>{TXT_SENDER_EMAIL}</strong></td>
					<td><input type="text" name="senderEmail" class="txtfield" value="{VAL_SENDER_EMAIL}" /> <span class="asterik">*</span></td>
				</tr>
				<!-- BEGIN: spambot -->
				<tr>
				  <td align="right" valign="top"><strong>{TXT_SPAMBOT}</strong></td>
				  <td>{IMG_SPAMBOT}<br /><br />
				    <input name="spamcode" type="text" class="txtfield" value="" size="5" maxlength="5" /> <span class="asterik">*</span></td></tr>
			  	<!-- END: spambot -->
				<tr>
					<td align="right" valign="top"><strong>{TXT_MESSAGE}</strong></td>
					<td><textarea name="message" cols="30" rows="5" class="txtfield">{VAL_MESSAGE}</textarea> <font color="red" style="vertical-align:top;">*</font></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input name="submit" type="submit" value="{TXT_SUBMIT}" class="btn" /></td>
				</tr>
		</table>
	<input name="ESC" type="hidden" value="{VAL_ESC}" />
	</form>


</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: tellafriend -->