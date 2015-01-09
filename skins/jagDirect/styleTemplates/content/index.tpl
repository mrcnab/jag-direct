<!-- BEGIN: index -->



	             	 <div class="new-release">
                  	<h3>
                        <strong class="floatleft">{LANG_LATEST_PRODUCTS}</strong>
                        <span class="floatright" style="padding-top:2px;"><a href="index.php?act=viewCatnewrelease" >View All </a></span>
                    </h3>
                    <br class="clear" />
                    
                <!-- BEGIN: latest_prods -->
                <!-- BEGIN: repeat_prods --> 
                
                    <div class="newRelse-add">
                   
                  <a href="{VAL_IMG}" rel="clearbox[New Release]">
                    <img src="{VAL_IMG_SRC}" alt="{VAL_PRODUCT_NAME}" border="0" title="{VAL_PRODUCT_NAME}" style="cursor:pointer"   /></a>
                    {VAL_PRODUCT_NAME}
                     
                    <span> <a href="index.php?act=viewProd&amp;productId={VAL_PRODUCT_ID}">
                    View More</a>  </span>
                    
                     <!-- BEGIN: sale_true --> 
                      <p style="color:black; text-decoration:line-through">{TXT_PRICE}</p> 
                      <p>{TXT_SALE_PRICE}</p>
                     <!-- END: sale_true --> 
                     
                      <!-- BEGIN: sale_false -->   
                      <p>{TXT_PRICE}</p> 
                       <!-- END: sale_false --> 
                      
                      
                    </div> 
                    <!-- END: repeat_prods -->                     
                    <!-- END: latest_prods -->                    
                 </div>
                 
                 
              
                 <div class="mobile-access">
                  	<h3>
                        <strong class=" class="floatleft"">{LANG_MOBILE_ACCESSORIES}</strong> 
                        <span class="floatright"> <a href="index.php?act=viewCataccessories" style="padding-right:5px; .padding-right:1px; -padding-right:0px;" >View All </a> </span>
                    </h3>
                    <br class="clear" />
                    <!-- BEGIN: mobile_accessories -->
                     <!-- BEGIN: repeat -->
                    <div class="mobile-adds">
                     <a href="{VAL_IMG_SPECIAL}" rel="clearbox[Mobile Accessories]">
                    <img src="{VAL_IMG_SRC_SPECIAL}" alt="{VAL_PRODUCT_NAME}" border="0" title="{VAL_PRODUCT_NAME}"   />
                  </a>
                     {VAL_SPECIAL_NAME}  
                      <span> <a href="index.php?act=viewProd&amp;productId={VAL_SPECIAL_ID}">View More</a>  </span>
                      <br class="clear" />
                      
                       <!-- BEGIN: sale_true --> 
                      <p style="color:black; text-decoration:line-through">{TXT_SPECIAL_PRICE}</p> 
                      <p>{TXT_SALE_SPECIAL_PRICE}</p>
                     <!-- END: sale_true --> 
                     
                      <!-- BEGIN: sale_false -->   
                      <p>{TXT_SPECIAL_PRICE}</p> 
                       <!-- END: sale_false --> 
                       
                    </div> 
                    <!-- END: repeat -->
                    <!-- END: mobile_accessories -->
                 </div>			
                
               
<!-- END: index -->







