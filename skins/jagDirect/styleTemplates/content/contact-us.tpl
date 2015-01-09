<!-- BEGIN: reg -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{CONTACT_US_HEADING}</h3></div>
 <div class="new-release01-content">

	<!-- BEGIN: no_error -->
	<p style="text-align:left; width:100%; padding-left:2px;">{LANG_REGISTER_DESC}</p>
	<!-- END: no_error -->
	<!-- BEGIN: error -->
	<p class="txtError" style=" padding-left:2px;">{VAL_ERROR}</p>
	<!-- END: error -->
	<form name="registerForm" id="registerForm" method="post" action="{VAL_ACTION}">
	<table border="0" cellspacing="3" cellpadding="0" width="100%" style="position:relative;right:2px;">
	<tr>
    	<td>
			<table border="0" cellspacing="3" cellpadding="0" width="100%">
	
	  <tr>
	    <td width="25%" valign="top">{LANG_FULL_NAME}</td>
	    <td width="75%">
			<input name="fullName" type="text" class="txtfield" id="fullName" size="5" tabindex="1" /><font color="red">  *</font>
	    </td>
      </tr>

	  <tr>
		<td>{LANG_EMAIL_ADDRESS}</td>
		<td><input name="email" type="text" class="txtfield" id="email" size="23" tabindex="4" /><font color="red">  *</font></td>		
	  </tr>
	  <tr>
		<td>Mobile Phone:</td>
		<td><input name="mobile" type="text" class="txtfield" id="mobile" size="23" tabindex="5" /><font color="red">  *</font></td>
	  </tr>
	  <tr>
		<td>{LANG_TELEPHONE}</td>
		<td><input name="phone" type="text" class="txtfield" id="phone" size="23" tabindex="6" /></td>
	  </tr>
	  <tr>
		<td>{LANG_ADDRESS_FORM}</td>
		<td><input name="address" type="text" class="txtfield" id="address" size="23" tabindex="6" /></td>
	  </tr>	  <tr>
		<td>{LANG_TOWN}</td>
		<td><input name="city" type="text" class="txtfield" id="city" size="23" tabindex="6" /></td>
	  </tr>
	  <tr>
		<td>{LANG_COUNTY}</td>
		<td><input name="County" type="text" class="txtfield" id="County" size="23" tabindex="6" /></td>
	  </tr>

	  
	  <tr>
		<td>{LANG_COUNTRY}</td>
	    <td nowrap='nowrap'>
			<select name="country" class="txtfield_combo" tabindex="11">
				<!-- BEGIN: repeat_countries -->
				<option value="{VAL_COUNTRY_ID}" {VAL_COUNTRY_SELECTED}>{VAL_COUNTRY_NAME}</option>
				<!-- END: repeat_countries -->
        	</select><font color="red">  *</font>
		</td>
	  </tr>
	  <tr>
		<td>{LANG_POSTCODE}</td>
		<td><input name="Postcode" type="text" class="txtfield" id="Postcode" size="23" tabindex="6" /></td>
	  </tr>
        <!-- BEGIN: spambot -->
        <tr>
        <td align="left" valign="top"><strong>{TXT_SPAMBOT}</strong></td>
        <td>{IMG_SPAMBOT}<br />
        <input name="spamcode" type="text" class="txtfield" value="" size="5" maxlength="5" /><font color="red">  *</font></td></tr>
	  <tr>
        <!-- END: spambot -->
		<td valign="top">{LANG_COMMENTS}</td>
		<td valign="top">
			<textarea name="comments" id="comments" class="txtarea" rows="5"  ></textarea><font color="red" style="vertical-align:top">  *</font>
		</td>
	  </tr>
     
        <tr>
        <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
			<td></td>
            <td colspan="1" align="left">
				<a href="javascript:submitDoc('registerForm');" class="btn"  tabindex="17">{LANG_REGISTER_SUBMIT}</a>
					<a href="javascript:document.getElementById('registerForm').reset();" class="btn" tabindex="17">Reset</a>
			</td>
        </tr>
	</table>
		</td>
		<td valign="top">
			
		</td>
	</tr>
	</table>
    
<br />
	<input name="ESC" type="hidden" value="{VAL_ESC}" />
	</form>

{CONTACT_US_CONTENT}

</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: reg -->