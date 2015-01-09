<!-- BEGIN: view_prod -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{TXT_PRODTITLE}</h3></div>
 <div class="new-release01-content">

	<!-- BEGIN: prod_true -->	
	<form action="{CURRENT_URL}" method="post" name="addtobasket" target="_self">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
            
            <td width="1%" valign="top">
            	  <div class="proimg">
                 <a href="{IMG_SRC_ZOOM}"  rel="clearbox" title="{TXT_PRODTITLE}">
               <img src="{IMG_SRC}" id="mainImage"  alt="{TXT_PRODTITLE}" border="0" title="{TXT_PRODTITLE}" style="margin-right:12px;" /></a> <br /><br />
                 </div> 
                  
                </td>
                
            <td width="100%" valign="top">            
                
                  <!-- BEGIN: prod_opts -->
                    <table border="0" cellspacing="0" cellpadding="0">
                        <!-- BEGIN: repeat_options -->
                        <tr>
                            <td>{VAL_OPTS_NAME}:</td>
                            <td>
                                <select name="productOptions[]" class="txtfield_combo">
                                    <!-- BEGIN: repeat_values -->
                                    <option value="{VAL_ASSIGN_ID}">
                                    {VAL_VALUE_NAME}
                                    <!-- BEGIN: repeat_price -->
                                   {VAL_OPT_PRICE}
                                    <!-- END: repeat_price -->
                                    </option>
                                    <!-- END: repeat_values -->
                                </select>
                            </td>
                        </tr>
                        <!-- END: repeat_options -->
                    </table>
                    <!-- END: prod_opts -->
                   
				   <!-- BEGIN: price_wsale -->
                    	{LANG_PRODCODE}  {TXT_PRODCODE} <br />
						{LANG_PRICE}&nbsp;<span style="text-decoration:line-through">{TXT_PRICE}</span><br />
						 <!-- END: price_wsale --> 
					
					<!-- BEGIN: price_osale -->
				    <div style="line-height:18px; width:100%;">
                    	{LANG_PRODCODE}  {TXT_PRODCODE} <br />
						{LANG_PRICE}&nbsp;<span>{TXT_PRICE}</span><br />
						 <!-- END: price_osale --> 
					
						 
						 <!-- BEGIN: sale_price -->
                        {LANG_SALEPRICE}&nbsp;{TXT_SALE_PRICE}<br />
                        <strong>{TXT_INSTOCK}</strong> <span class="txtOutOfStock"> {TXT_OUTOFSTOCK} </span>
                        <!-- END: sale_price -->
						
                        <!-- BEGIN: buy_btn -->
                        <div style="float:left; text-align: left;">{LANG_QUAN} 
                        <input name="quan" type="text" value="1" size="2" class="chkbox" style="text-align:center;" /><br />
                        <a href="javascript:submitDoc('addtobasket');" class="btn" style="position:relative;top:13px; ">{BTN_ADDBASKET}</a>&nbsp;&nbsp;<a href="index.php?act=taf&amp;productId={PRODUCT_ID}"  class="btn" style="position:relative;top:13px; " target="_self">{LANG_TELLFRIEND}</a>
                        </div>
                        <!-- END: buy_btn -->
                        
                        </div>  
                    <input type="hidden" name="add" value="{PRODUCT_ID}" />
                  
                 </td>
            </tr>
            <tr>
            	<td width="1%" valign="top" colspan="2">
            	   
                  <div style="float:left; width:100%;">
                 <div class="des-detail" style="width:100%; float: left; text-align:left;">{TXT_DESCRIPTION}</div> <br />             
                 
                  
                 </div>                 
                <!-- BEGIN: more_images -->
                <div class="linkcls" style="text-align: center;"><a href="javascript:openPopUp('extra/prodImages.php?productId={PRODUCT_ID}', 'images', 848, 655, 0);" class="btn" style="color:#FFFFFF;">{LANG_MORE_IMAGES}</a></div>
                <!-- END: more_images -->
              	
                </td>
            </tr>
            </table> 
 
</form>
<!-- END: prod_true -->
<!-- BEGIN: prod_false -->
<p>{LANG_PRODUCT_EXPIRED}</p>
<div class="next-previous">
<a href="index.php" class="linkcls">Home</a>  
                 </div>
<!-- END: prod_false -->
</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: view_prod -->