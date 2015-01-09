<!-- BEGIN: session_page -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_LOGIN_TITLE}</h3></div>
 <div class="new-release01-content">
 <div style="float:left; padding:0px; ">
			<!-- BEGIN: cart_false -->
            <p>{LANG_CART_EMPTY}</p>
			<!-- END: cart_false -->
			<!-- BEGIN: cart_true -->
			<div>

					{LANG_LOGIN_BELOW}
					<form action="index.php?act=login&amp;redir={VAL_SELF}" target="_self" method="post">
						<br />
                        <table width="451" border="0" cellpadding="0" cellspacing="2" style="height:108px;">
                          <tr>
                            <td width="73" height="20" valign="top" align="left">{LANG_USERNAME}</td>
                            <td width="252" height="20" valign="top"><label>
                               <input type="text" name="username" class="txtfield" value="{VAL_USERNAME}" />
                            </label></td>
                            <td width="56" height="20" valign="top">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="20" valign="top" align="left">{LANG_PASSWORD}</td>
                            <td height="20" valign="top"> <input type="password" name="password" class="txtfield" /></td>
                            <td height="20" valign="top">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="25" valign="top">&nbsp;</td>
                            <td valign="top"><input name="remember" type="checkbox" value="1" {CHECKBOX_STATUS} /> 
                              {LANG_REMEMBER}</td>
                            <td valign="top">&nbsp;</td>
                          </tr>
                          <tr>
								<td>&nbsp;</td>
								<td class="linkcls12"><a href="index.php?act=forgotPass" >{LANG_FORGOT_PASS}</a></td>
                                <td>&nbsp;</td>
							</tr>
                          
                          <tr>
                            <td height="43" valign="top">&nbsp;</td>
                            <td valign="top"><input name="submit" type="submit" value="{TXT_LOGIN}" class="btn" /> </td>
                            <td valign="top">&nbsp;</td>
                          </tr>
                          
                        </table>
                        
                        
                        
                        
					</form>
			</div>
            <div class="main-heading"><h1>{LANG_EXPRESS_REGISTER}</h1></div>
            
			<div style="margin-bottom:20px;">
            <p>{LANG_CONT_REGISTER}</p><br />
			<a href="cart.php?act=reg" class="btn">{LANG_REGISTER_BUTN}</a>
			</div>
            <div class="main-heading"><h1>{LANG_CONT_SHOPPING}</h1></div>
                        
			<div>
			<p>{LANG_CONT_SHOPPING_DESC}</p><br />
			<a href="index.php" class="btn">{LANG_CONT_SHOPPING_BTN}</a>
			</div>
            <br />
			<!-- END: cart_true -->
</div></div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: session_page -->