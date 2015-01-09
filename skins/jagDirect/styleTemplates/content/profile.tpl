<!-- BEGIN: profile -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_PERSONAL_INFO_TITLE}</h3></div>
 <div class="new-release01-content">
      <div style="float:left; padding:5px; width:505px; ">
	<!-- BEGIN: session_true -->
	<!-- BEGIN: no_error -->
	{LANG_PROFILE_DESC}
	<!-- END: no_error -->
	<!-- BEGIN: error -->
	{VAL_ERROR}
	<!-- END: error -->
	
		<form action="index.php?act=profile{VAL_EXTRA_GET}" target="_self" method="post">
			<table border="0" cellspacing="0" cellpadding="3" align="left" width="100%">
				<tr>
					<td  width="30%" align="left"><strong>{TXT_TITLE}</strong></td>
					<td><input name="title" type="text" class="txtfield" id="title" value="{VAL_TITLE}" size="7" maxlength="30" /></td>
				</tr>
				<tr>
					<td align="left"><strong>{TXT_FIRST_NAME}</strong></td>
					<td><input name="firstName" type="text" class="txtfield" id="firstName" value="{VAL_FIRST_NAME}" maxlength="100" /></td>
				</tr>
				<tr>
					<td align="left"><strong>{TXT_LAST_NAME}</strong></td>
					<td><input name="lastName" type="text" class="txtfield" id="lastName" value="{VAL_LAST_NAME}" maxlength="100" /></td>
				</tr>
				<tr>
					<td align="left"><strong>{TXT_EMAIL}</strong></td>
					<td><input name="email" type="text" class="txtfield" id="email" value="{VAL_EMAIL}" maxlength="100" /></td>
				</tr>
				<tr>
				  <td align="left" valign="top"><strong>{TXT_ADD_1}</strong></td>
				  <td><input name="add_1" type="text" class="txtfield" id="add_1" value="{VAL_ADD_1}" maxlength="100" /></td>
			  	</tr>
				<tr>
				  <td align="left" valign="top"><strong>{TXT_ADD_2}</strong></td>
				  <td><input name="add_2" type="text" class="txtfield" id="add_2" value="{VAL_ADD_2}" maxlength="100" /></td>
			  	</tr>
				<tr>
				  <td align="left" valign="top"><strong>{TXT_TOWN}</strong></td>
				  <td><input name="town" type="text" class="txtfield" id="town" value="{VAL_TOWN}" maxlength="100" /></td>
			  	</tr>
				<tr>
				  <td align="left" valign="top"><strong>{TXT_COUNTY}</strong></td>
				  <td><input name="county" type="text" class="txtfield" id="county" value="{VAL_COUNTY}" maxlength="100" /></td>
			  	</tr>
				<tr>
				  <td align="left" valign="top"><strong>{TXT_POSTCODE}</strong></td>
				  <td><input name="postcode" type="text" class="txtfield" id="postcode" value="{VAL_POSTCODE}" maxlength="100" /></td>
			  	</tr>
				<tr>
				  <td align="left" valign="top"><strong>{TXT_COUNTRY}</strong></td>
				  <td>
				  	<select name="country" id="country" class="txtfield_combo">
				  		<!-- BEGIN: country_opts -->
						<option value="{VAL_COUNTRY_ID}" {COUNTRY_SELECTED}>{VAL_COUNTRY_NAME}</option>
						<!-- END: country_opts -->
					</select>
				  </td>
			  	</tr>
				<tr>
					<td align="left"><strong>{TXT_PHONE}</strong></td>
					<td><input name="phone" type="text" class="txtfield" id="phone" value="{VAL_PHONE}" maxlength="100" /></td>
				</tr>
				<tr>
				  <td align="left"><strong>{TXT_MOBILE}</strong></td>
				  <td><input name="mobile" type="text" class="txtfield" id="mobile" value="{VAL_MOBILE}" maxlength="100" /></td>
			  	</tr>
                <tr>
				  <td align="left"><strong>{TXT_COMMENTS}</strong></td>
				  <td>
                  <textarea name="comments" id="comments" class="txtarea"  >{VAL_COMMENTS}</textarea></td>
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
<!-- END: profile -->