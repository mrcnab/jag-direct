<!-- BEGIN: view_cart -->
<div class="pro-hed">
    <h1>{LANG_VIEW_CART}</h1>
</div>
   <div class="products" style="margin-top:10px;">
			  <form action="{VAL_FORM_ACTION}" method="post" class="quickBuy" style="padding: 4px; padding-left:10px; text-align:left;">
                  {LANG_ADD_PRODCODE}
                  <input name="productCode" type="text" class="txtfield" /> 
                  <input name="submit" type="submit" class="btn" value="{LANG_ADD}" />
              </form>
			  <!-- BEGIN: cart_false -->
			  <p style="padding-left:12px;">{LANG_CART_EMPTY}</p>
			  <!-- END: cart_false -->
			  <!-- BEGIN: cart_true -->
			  <form name="cart" method="post" id="cart" action="{VAL_FORM_ACTION}">
                  <!-- BEGIN: step_3 -->
                  <table width="98%"  border="0" cellspacing="2" cellpadding="2" style="margin-bottom:10px;" class="cart-table">
                  <tr class="secondary-row">
                    <td>{LANG_DELIVERY_ADDRESS}</td>
                    <td colspan="2">{LANG_DELIVERY_ADDRESS}</td>
                  </tr>
                  <tr class="secondary-row">
                    <td>{VAL_TITLE} {VAL_FIRST_NAME} {VAL_LAST_NAME}</td>
                    <td><strong>{TXT_TITLE}</strong></td>
                    <td><input name="delInf[title]" type="text" class="textbox" id="title" value="{VAL_DEL_TITLE}" size="7" maxlength="30" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td>{VAL_ADD_1}</td>
                    <td><strong>{TXT_FIRST_NAME}</strong></td>
                    <td><input name="delInf[firstName]" type="text" class="textbox" id="firstName" value="{VAL_DEL_FIRST_NAME}" maxlength="100" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td>{VAL_ADD_2}</td>
                    <td><strong>{TXT_LAST_NAME}</strong></td>
                    <td><input name="delInf[lastName]" type="text" class="textbox" id="lastName" value="{VAL_DEL_LAST_NAME}" maxlength="100" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td>{VAL_TOWN}</td>
                    <td><strong>{TXT_ADD_1}</strong></td>
                    <td><input name="delInf[add_1]" type="text" class="textbox" id="add_1" value="{VAL_DEL_ADD_1}" maxlength="100" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td>{VAL_COUNTY}, {VAL_POSTCODE}</td>
                    <td><strong>{TXT_ADD_2}</strong></td>
                    <td><input name="delInf[add_2]" type="text" class="textbox" id="add_2" value="{VAL_DEL_ADD_2}" maxlength="100" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td>{VAL_COUNTRY}</td>
                    <td><strong>{TXT_TOWN}</strong></td>
                    <td><input name="delInf[town]" type="text" class="textbox" id="town" value="{VAL_DEL_TOWN}" maxlength="100" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td rowspan="3" align="left" valign="bottom"><a href="index.php?act=profile&amp;f={VAL_BACK_TO}" class="txtUpdate">{LANG_CHANGE_INV_ADD}</a></td>
                    <td><strong>{TXT_COUNTY}</strong></td>
                    <td><input name="delInf[county]" type="text" class="textbox" id="county" value="{VAL_DEL_COUNTY}" maxlength="100" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td><strong>{TXT_POSTCODE}</strong></td>
                    <td><input name="delInf[postcode]" type="text" class="textbox" id="postcode" value="{VAL_DEL_POSTCODE}" maxlength="100" /></td>
                  </tr>
                  <tr class="secondary-row">
                    <td><strong>{TXT_COUNTRY}</strong></td>
                    <td><select name="delInf[country]" id="country" class="textbox">
                      <!-- BEGIN: country_opts -->
                      <option value="{VAL_DEL_COUNTRY_ID}" {COUNTRY_SELECTED}>{VAL_DEL_COUNTRY_NAME}</option>
                      <!-- END: country_opts -->
                    </select></td>
                  </tr>
                </table>
                <!-- END: step_3 -->
                <br />
                <!-- BEGIN: step_4 -->
                  <table width="98%"  border="0" cellspacing="2" cellpadding="2" style="margin-bottom: 10px;" class="cart-table">
                  <tr class="secondary-row">
                    <td>{LANG_DELIVERY_ADDRESS}</td>
                    </tr>
                  <tr class="secondary-row">
                    <td>{VAL_TITLE} {VAL_FIRST_NAME} {VAL_LAST_NAME}</td>
                    </tr>
                  <tr class="secondary-row">
                    <td>{VAL_ADD_1}</td>
                    </tr>
                  <tr>
                    <td>{VAL_ADD_2}</td>
                    </tr>
                  <tr class="secondary-row">
                    <td>{VAL_TOWN}</td>
                    </tr>
                  <tr class="secondary-row">
                    <td>{VAL_COUNTY}, {VAL_POSTCODE}</td>
                    </tr>
                  <tr>
                    <td>{VAL_COUNTRY}</td>
                    </tr>
                  <tr>
                    <td>{VAL_COMMENTS}</td>
                  </tr>
                  <tr>
                    <td><a href="index.php?act=profile&amp;f={VAL_BACK_TO}" class="txtUpdate">{LANG_CHANGE_DEL_ADD}</a></td>
                    </tr>
                </table>
                <!-- END: step_4 -->
                <br />
                
                <table width="98%" border="0" cellspacing="2" cellpadding="2" class="cart-table" align="center">
                  <tr class="main-row_bg">
                    <td>&nbsp;</td>
                    <td>{LANG_QTY}</td>
                    <td>&nbsp;</td>
                    <td>{LANG_PRODUCT}</td>
                    <td>{LANG_CODE}</td>
                    <td>{LANG_STOCK}</td>
                    <td>{LANG_PRICE}</td>
                    <td>{LANG_LINE_PRICE}</td>
                  </tr>
                  <tr>
                  <td colspan="8">&nbsp;</td>
                  </tr>
                   <!-- BEGIN: repeat_cart_contents -->
                  <tr class="secondary-row">
                    <td align="center"><a href="cart.php?act={VAL_CURRENT_STEP}&amp;remove={VAL_PRODUCT_KEY}"><img src="skins/{VAL_SKIN}/styleImages/del.gif" alt="{LANG_DELETE}" width="12" height="12" border="0" title="{LANG_DELETE}" /></a></td>
                    <td align="center"><input name="quan[{VAL_PRODUCT_KEY}]" type="text" value="{VAL_QUANTITY}" size="2" class="checkbox" style="text-align:center;" {QUAN_DISABLED} /></td>
                    <td width="146"><div class="product-img-cart">
                    <img src="{VAL_IMG_SRC}" alt="" title="" /></div></td>
                    <td align="center">{VAL_PRODUCT_NAME}
                        <!-- BEGIN: options -->
                            <br /><strong>{VAL_OPT_NAME}</strong>: {VAL_OPT_VALUE} 
                        <!-- END: options -->
                    </td>
                    <td align="center">{VAL_PRODUCT_CODE}</td>
                    <td align="center">{VAL_INSTOCK}</td>
                    <td align="center"><strong>{VAL_IND_PRICE}</strong></td>
                    <td align="center"><strong>{VAL_LINE_PRICE}</strong></td>
                  </tr>
                  <!-- BEGIN: stock_warn -->
                  <tr class="secondary-row">
                      <td align="center">&nbsp;</td>
                      <td colspan="7"><span class="txtStockWarn">{VAL_STOCK_WARN}</span></td>
                  </tr>
                  <!-- END: stock_warn -->
                  <!-- END: repeat_cart_contents -->
                  <tr class="secondary-row">
                      <td colspan="6"></td>
                      <td align="right">{LANG_SUBTOTAL}</td>
                      <td align="center"><strong>{VAL_SUBTOTAL}</strong></td>
                  </tr>
                  <tr class="secondary-row">
                      <td colspan="7" align="right">{LANG_TAX}</td>
                      <td width="80" align="center">{VAL_TAX}</td>
                  </tr>
                 
                  <tr class="secondary-row">
                      <td align="right" colspan="7">{LANG_SHIPPING}</td>
                      <td width="80" align="center">{VAL_SHIPPING}</td>
                  </tr>
                  <tr class="secondary-row">
                      <td align="right" colspan="7"><strong>{LANG_CART_TOTAL}</strong></td>
                      <td width="80" align="center"><strong>{VAL_CART_TOTAL}</strong></td>
                  </tr>
                  <tr style="height:50px;">
                      <td align="right" colspan="7">{LANG_UPDATE_CART_DESC} <a href="javascript:submitDoc('cart');" class="btn1" style="margin-left:10px;">{LANG_UPDATE_CART}</a> </td>
                      <td width="80" align="left"><a href="{CONT_VAL}" class="btn1">{LANG_CHECKOUT}</a></td>
                  </tr>
                </table>
                
    		</form>
			<!-- END: cart_true -->
</div>
<!-- END: view_cart -->