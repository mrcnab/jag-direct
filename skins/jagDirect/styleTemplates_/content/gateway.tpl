<!-- BEGIN: gateway -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_PAYMENT}</h3></div>
 <div class="new-release01-content">
      <div style="float:left; padding:5px; ">
			<!-- BEGIN: cart_false -->
            {LANG_CART_EMPTY}
			<!-- END: cart_false -->
			<!-- BEGIN: cart_true -->

			<form action="{VAL_FORM_ACTION}" method="{VAL_FORM_METHOD}" name="gateway" target="{VAL_TARGET}">
				
				<!-- BEGIN: choose_gate -->
				<p>{LANG_CHOOSE_GATEWAY}</p>
				<table width="150" border="0" align="left" cellspacing="0" cellpadding="5" >
					<!-- BEGIN: gateways_true -->
					<tr class="secondary-row">
						<td><b style="padding-left:7px;">{VAL_GATEWAY_DESC}:</b></td>
					  	<td width="50" align="center">
						<input name="gateway" type="radio" value="{VAL_GATEWAY_FOLDER}" {VAL_CHECKED} />
						</td>
					</tr>
					<!-- END: gateways_true -->
					<tr>
						<td colspan="2" align="left"><b style="padding-left:7px;">{LANG_COMMENTS}</b></td>
				  	</tr>
					<tr align="right">
					  <td colspan="2"><textarea name="customer_comments" cols="35" rows="3" class="txtarea">{VAL_CUSTOMER_COMMENTS}</textarea></td>
				  	</tr>
					<!-- BEGIN: gateways_flase -->
					<tr>
						<td>{LANG_GATEWAYS_FALSE}</td>
					</tr>
					<!-- END: gateways_false -->
				</table>
				<!-- END: choose_gate -->
				
				<!-- BEGIN: transfer -->
					<!-- BEGIN: auto_submit-->
					<p>{LANG_TRANSFERRING}</p>
					<p><img src="skins/{VAL_SKIN}/styleImages/progress.gif"  alt="" title="" onload="submitDoc('gateway');" /></p>
					<!-- END: auto_submit-->
					<!-- BEGIN: manual_submit-->
					<p align="left">{LANG_FORM_TITLE}</p>
					{FORM_TEMPLATE}
					<!-- END: manual_submit-->
					{FORM_PARAMETERS}
				<!-- END: transfer -->
				<p style="float:left;  width:97%;"><a href="javascript:submitDoc('gateway');" class="btn" style="color:#FFFFFF; margin-left:5px;">{LANG_CHECKOUT}</a></p>
				
			</form>

			<!-- END: cart_true -->
</div></div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: gateway -->