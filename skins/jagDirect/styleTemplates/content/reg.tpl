<!-- BEGIN: reg -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_REGISTER}</h3></div>
 <div class="new-release01-content">
 <div style="float:left;">
	<!-- BEGIN: no_error -->
	<p style="margin:0px; padding:0px;">{LANG_REGISTER_DESC}</p>
	<!-- END: no_error -->
	<!-- BEGIN: error -->
	<p class="txtError">{VAL_ERROR}</p>
	<!-- END: error -->
	<form name="registerForm" method="post" action="{VAL_ACTION}">
	<br />
    <table border="0" cellspacing="2" cellpadding="0" width="100%">
	  <tr>
		<td colspan="2"><b>{LANG_PERSONAL_DETAILS}</b></td>
	  </tr>
	  <tr>
	    <td width="35%" valign="top">{LANG_TITLE}</td>
	    <td><input name="title" type="text" class="txtfield" id="title" size="5" value="{VAL_TITLE}" tabindex="1" /><br /> 
	      {LANG_TITLE_DESC} </td>
      </tr>
	  <tr>
		<td>{LANG_FIRST_NAME}</td>
		<td><input name="firstName" type="text" class="txtfield" id="firstName" size="16" value="{VAL_FIRST_NAME}" tabindex="2" /><font color="red">  *</font></td>
	  </tr>
	  <tr>
		<td>{LANG_LAST_NAME}</td>
		<td><input name="lastName" type="text" class="txtfield" id="lastName" size="16" value="{VAL_LAST_NAME}" tabindex="3" /><font color="red">  *</font></td>
	  </tr>
	  <tr>
		<td>{LANG_EMAIL_ADDRESS}</td>
		<td><input name="email" type="text" class="txtfield" id="email" size="16" value="{VAL_EMAIL}" tabindex="4" /><font color="red">  *</font></td>		
	  </tr>
	  <tr>
		<td>{LANG_TELEPHONE}</td>
		<td><input name="phone" type="text" class="txtfield" id="phone" size="16" value="{VAL_PHONE}" tabindex="5" /><font color="red">  *</font></td>
	  </tr>
	  <tr>
		<td>{LANG_MOBILE}</td>
		<td><input name="mobile" type="text" class="txtfield" id="mobile" size="16" value="{VAL_MOBILE}" tabindex="6" /></td>
	  </tr>
      <tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	  <tr>
		<td colspan="2"><b>{LANG_SECURITY_DETAILS}</b></td>
	  </tr>
	  <tr>
		<td>{LANG_CHOOSE_PASSWORD}</td>
		<td><input name="password" type="password" class="txtfield" id="password" size="16" value="{VAL_PASSWORD}" tabindex="7" /><font color="red">  *</font></td>
	  </tr>
	  <tr>
		<td>{LANG_CONFIRM_PASSWORD}</td>
		<td><input name="passwordConf" type="password" class="txtfield" id="passwordConf" size="16" value="{VAL_PASSWORD_CONF}" tabindex="8" /><font color="red">  *</font></td>
	  </tr>
      <tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	  <tr>
		<td colspan="2"><b>{LANG_ADDRESS}</b></td>
	  </tr>
	  <tr>
	    <td>{LANG_ADDRESS_FORM}</td>
	    <td><input name="add_1" type="text" class="txtfield" id="add_1" size="16" value="{VAL_ADD_1}" tabindex="9" /><font color="red">  *</font></td>
	    </tr>
	  <tr>
		<td>&nbsp;</td>
		<td><input name="add_2" type="text" class="txtfield" id="add_2" size="16" value="{VAL_ADD_2}" tabindex="10" /></td>
	  </tr>
	  <tr>
		<td>{LANG_TOWN}</td>
		<td><input name="town" type="text" class="txtfield" id="town" size="16" value="{VAL_TOWN}" tabindex="11" /><font color="red">  *</font></td>
	  </tr>
	  <tr>		
		<td>{LANG_COUNTY}</td>
		<td><input name="county" type="text" class="txtfield" id="county" size="16" value="{VAL_COUNTY}" tabindex="12" /><font color="red">  *</font></td>
	  </tr>
	  <tr>
		<td>{LANG_COUNTRY}</td>
	    <td nowrap='nowrap'><select name="country" class="txtfield_combo" tabindex="13">
          <!-- BEGIN: repeat_countries -->
          <option value="{VAL_COUNTRY_ID}" {VAL_COUNTRY_SELECTED}>{VAL_COUNTRY_NAME}</option>
          <!-- END: repeat_countries -->
        </select><font color="red">  *</font></td>
	  </tr>
	  <tr>
		<td>{LANG_POSTCODE}</td>
	    <td><input name="postcode" type="text" class="txtfield" id="postcode" size="16" value="{VAL_POSTCODE}" tabindex="14" /><font color="red">  *</font></td>
	  </tr>
      <tr>
		<td colspan="2">&nbsp;</td>
		</tr>
	  <tr>
		<td colspan="2"><b>{LANG_PRIVACY_SETTINGS}</b></td>
	  </tr>
      <tr>
		<td>{LANG_EMAIL_FORMAT}</td>
		<td>
            <select name="htmlEmail" class="txtfield_combo" tabindex="15">
                <option value="1">{LANG_HTML_FORMAT}</option>
                <option value="0" {VAL_HTMLEMAIL_SELECTED}>{LANG_PLAIN_TEXT}</option>
            </select>
	    </td>
	  </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
        <td>&nbsp;</td>
            <td valign="top"><input type="checkbox" name="optIn1st" value="1" tabindex="16" {VAL_OPTIN1ST_CHECKED}/> {LANG_RECIEVE_EMAILS}<br /> {LANG_PLEASE_READ} {LANG_TANDCS}.</td>
        </tr>
        <tr>
        <td colspan="2">&nbsp;</td>
        </tr>
        <tr><td>&nbsp;</td>
            <td colspan="2" ><a href="javascript:submitDoc('registerForm');" tabindex="17" class="btn">{LANG_REGISTER_SUBMIT}</a></td>
        </tr>
	</table>
<br />
	</form>
</div>
</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: reg -->
