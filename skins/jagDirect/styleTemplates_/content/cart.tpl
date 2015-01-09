<!-- BEGIN: view_cart -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_VIEW_CART}</h3></div>
 <div class="new-release01-content">
 <div style="float:left; ">
			 <form action="{VAL_FORM_ACTION}" method="post" cclass="quickBuy" style="padding:0px; padding-left:3px; margin-bottom:10px; text-align:left;">
                  {LANG_ADD_PRODCODE}
                  <input name="productCode" type="text" class="txtfield_cart" /> 
                  <input name="submit" type="submit" class="btn123" value="{LANG_ADD}" />
              </form>
			  <!-- BEGIN: cart_false -->
			  <p style="padding-left:4px;">{LANG_CART_EMPTY}</p>
			  <!-- END: cart_false -->
			  <!-- BEGIN: cart_true -->
			  <form name="cart" method="post" id="cart" action="{VAL_FORM_ACTION}">
			  <!-- BEGIN: step_3 -->
			  <table width="98%"  border="0" cellspacing="2" cellpadding="2" style="margin-bottom:10px;" class="cart-table">
			  <tr class="secondary-row" style="height:30px;">
				<td><strong>{LANG_INVOICE_ADDRESS}</strong></td>
				<td  colspan="2"><strong>{LANG_DELIVERY_ADDRESS}</strong></td>
				</tr>
			  <tr class="secondary-row">
				<td>{VAL_TITLE} {VAL_FIRST_NAME} {VAL_LAST_NAME}</td>
				<td><strong>{TXT_TITLE}</strong></td>
				<td><input name="delInf[title]" type="text" class="txtfield" id="title" value="{VAL_DEL_TITLE}" size="7" maxlength="30" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td>{VAL_ADD_1}</td>
			    <td><strong>{TXT_FIRST_NAME}</strong></td>
			    <td><input name="delInf[firstName]" type="text" class="txtfield" id="firstName" value="{VAL_DEL_FIRST_NAME}" maxlength="100" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td>{VAL_ADD_2}</td>
			    <td><strong>{TXT_LAST_NAME}</strong></td>
			    <td><input name="delInf[lastName]" type="text" class="txtfield" id="lastName" value="{VAL_DEL_LAST_NAME}" maxlength="100" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td>{VAL_TOWN}</td>
			    <td><strong>{TXT_ADD_1}</strong></td>
			    <td><input name="delInf[add_1]" type="text" class="txtfield" id="add_1" value="{VAL_DEL_ADD_1}" maxlength="100" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td>{VAL_COUNTY}, {VAL_POSTCODE}</td>
			    <td><strong>{TXT_ADD_2}</strong></td>
			    <td><input name="delInf[add_2]" type="text" class="txtfield" id="add_2" value="{VAL_DEL_ADD_2}" maxlength="100" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td>{VAL_COUNTRY}</td>
			    <td><strong>{TXT_TOWN}</strong></td>
			    <td><input name="delInf[town]" type="text" class="txtfield" id="town" value="{VAL_DEL_TOWN}" maxlength="100" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td rowspan="3" align="left" valign="bottom"><a href="index.php?act=profile&amp;f={VAL_BACK_TO}" class="btn">{LANG_CHANGE_INV_ADD}</a></td>
			    <td><strong>{TXT_COUNTY}</strong></td>
			    <td><input name="delInf[county]" type="text" class="txtfield" id="county" value="{VAL_DEL_COUNTY}" maxlength="100" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td><strong>{TXT_POSTCODE}</strong></td>
			    <td><input name="delInf[postcode]" type="text" class="txtfield" id="postcode" value="{VAL_DEL_POSTCODE}" maxlength="100" /></td>
			  </tr>
			  <tr class="secondary-row">
			    <td><strong>{TXT_COUNTRY}</strong></td>
			    <td><select name="delInf[country]" id="country" class="txtfield">
                  <!-- BEGIN: country_opts -->
                  <option value="{VAL_DEL_COUNTRY_ID}" {COUNTRY_SELECTED}>{VAL_DEL_COUNTRY_NAME}</option>
                  <!-- END: country_opts -->
                </select></td>
			  </tr>
               <tr class="secondary-row">
			   <td >&nbsp;</td>
                <td colspan="2"><font color="black" style="font-weight:bold" >We provide shipping services only for United Kingdom.</font></td>
			  </tr>
			</table>
			<!-- END: step_3 -->
            <br />
			<!-- BEGIN: step_4 -->
			  <table width="98%"  border="0" cellspacing="2" cellpadding="2" style="margin-bottom: 10px;" class="cart-table">
			  <tr class="secondary-row" style="height:30px;">
				<td><strong>{LANG_INVOICE_ADDRESS}</strong></td>
				<td><strong>{LANG_DELIVERY_ADDRESS}</strong></td>
				</tr>
			  <tr class="secondary-row">
				<td>{VAL_TITLE} {VAL_FIRST_NAME} {VAL_LAST_NAME}</td>
				<td>{VAL_DEL_TITLE} {VAL_DEL_FIRST_NAME} {VAL_DEL_LAST_NAME}</td>
				</tr>
			  <tr class="secondary-row">
			    <td>{VAL_ADD_1}</td>
			    <td>{VAL_DEL_ADD_1}</td>
			    </tr>
			  <tr class="secondary-row">
			    <td>{VAL_ADD_2}</td>
			    <td>{VAL_DEL_ADD_2}</td>
			    </tr>
			  <tr class="secondary-row">
			    <td>{VAL_TOWN}</td>
			    <td>{VAL_DEL_TOWN}</td>
			    </tr>
			  <tr class="secondary-row">
			    <td>{VAL_COUNTY}, {VAL_POSTCODE}</td>
			    <td>{VAL_DEL_COUNTY}, {VAL_DEL_POSTCODE}</td>
			    </tr>
			  <tr class="secondary-row">
			    <td>{VAL_COUNTRY}</td>
			    <td>{VAL_DEL_COUNTRY}</td>
			  </tr>
 <tr class="secondary-row">
                    <td>{VAL_COMMENTS}</td>
                     <td>{VAL_DEL_COMMENTS}</td>
                  </tr>
              <tr>
              
			    <td><a href="index.php?act=profile&amp;f={VAL_BACK_TO}" class="btn">{LANG_CHANGE_INV_ADD}</a></td>
			    <td>
				<!-- BEGIN: edit_btn -->
				<a href="cart.php?act=step3" class="btn">{LANG_CHANGE_DEL_ADD}</a>
				<!-- END: edit_btn -->
				</td>
			  </tr>
               <tr class="secondary-row">
			   <td >&nbsp;</td>
                <td colspan="2"><font color="black" style="font-weight:bold" >We provide shipping services only for United Kingdom.</font></td>
			  </tr>
			</table>
			<!-- END: step_4 -->
            <br />
            
            <table width="98%" border="0"  cellspacing="0" cellpadding="2" align="center">
              <tr class="main-row_bg">
                <td>&nbsp;</td>
                <td align="center">{LANG_QTY}</td>
                <td align="center">Image</td>
                <td width="700">{LANG_PRODUCT}</td>
                <td align="center">{LANG_CODE}</td>
                <td align="center">{LANG_STOCK}</td>
                <td align="center">{LANG_PRICE}</td>
                <td align="center">{LANG_LINE_PRICE}</td>
              </tr>
               <!-- BEGIN: repeat_cart_contents -->
              <tr class="secondary-row-table">
                    <td align="center"><a href="cart.php?act={VAL_CURRENT_STEP}&amp;remove={VAL_PRODUCT_KEY}"><img src="skins/{VAL_SKIN}/styleImages/del.gif" alt="{LANG_DELETE}" width="12" height="12" border="0" title="{LANG_DELETE}" /></a></td>
                    <td align="center"><input name="quan[{VAL_PRODUCT_KEY}]" type="text" value="{VAL_QUANTITY}" size="2" class="chkbox" style="text-align:center;" {QUAN_DISABLED} /></td>
                    <td align="center"><div class="product-img-main">
                    <img src="{VAL_IMG_SRC}" alt="{VAL_PRODUCT_NAME}" title="{VAL_PRODUCT_NAME}" /></div></td>
                    <td align="center"><div style="text-align:left; padding:2px;">{VAL_PRODUCT_NAME}</div>
                        <!-- BEGIN: options -->
                          <br />  <br /><strong>{VAL_OPT_NAME}</strong>: {VAL_OPT_VALUE} 
                        <!-- END: options -->
                    </td>
                    <td align="center">{VAL_PRODUCT_CODE}</td>
                    <td align="center">{VAL_INSTOCK}</td>
                    <td align="center"><strong>{VAL_IND_PRICE}</strong></td>
                    <td align="center"><strong>{VAL_LINE_PRICE}</strong></td>
                  </tr>
              <!-- BEGIN: stock_warn -->
              <tr class="secondary-row-table">
                  <td align="center">&nbsp;</td>
                  <td colspan="7"><span class="txtStockWarn">{VAL_STOCK_WARN}</span></td>
              </tr>
              <!-- END: stock_warn -->
              <!-- END: repeat_cart_contents -->
              <tr class="secondary-row-table">
                  <td colspan="6"></td>
                  <td align="right">{LANG_SUBTOTAL}</td>
                  <td align="center">{VAL_SUBTOTAL}</td>
              </tr>
              <tr class="secondary-row-table">
                  <td colspan="7" align="right">{LANG_TAX}</td>
                  <td width="80" align="center">{VAL_TAX}</td>
              </tr>
             
               <!-- BEGIN: shipping_true -->
            <tr class="secondary-row-table">
				  <td align="right" colspan="7">{LANG_SHIPPING}</td>
				  <td width="192" align="center">{VAL_SHIPPING}</td>
			  </tr>
			    <!-- END: shipping_true -->
                
    <!-- BEGIN: shipping_day_check -->
            <tr class="secondary-row-table">
				  <td align="right" colspan="7">Select when you want delivery.</td>
				  <td width="192" align="center">
                  <select name="deliverydays" id="deliverydays" class="txtfieldsmall" onChange="javascript: document.cart.submit();">
                  	<option value="normal_1" {VAL_SELECTED_DELIVERY_DAYS} >2 to 5 working days</option>
                  	<option value="urgent_1" {VAL_SELECTED_DELIVERY_DAYS_TEST}>Next Day</option>
                  </select>
	                  </td>
			  </tr>
              
			  
			  </script>
 <!-- END: shipping_day_check -->
                
                
              <tr class="secondary-row-table">
                  <td align="right" colspan="7"><strong>{LANG_CART_TOTAL}</strong></td>
                  <td width="80" align="center"><strong>{VAL_CART_TOTAL}</strong></td>
              </tr>
              <tr style="height:50px;" align="right">
                  <td align="right" colspan="8">{LANG_UPDATE_CART_DESC} <a href="javascript:submitDoc('cart');" class="btn" style=".padding:3px;" >{LANG_UPDATE_CART}</a> 
                  <a href="{CONT_VAL}" class="btn" style=".padding:3px;">{LANG_CHECKOUT}</a> </td>
              </tr>
            </table>
            
            

</form>
<br /><br />
			<!-- END: cart_true -->
</div></div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: view_cart -->