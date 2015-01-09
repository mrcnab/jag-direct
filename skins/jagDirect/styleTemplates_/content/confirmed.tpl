<!-- BEGIN: confirmation -->
<div class="pro-wrap">
<div class="feature-heading-wrap">
<div class="feature-heading-left"></div>
<div class="feature-heading"><b>{LANG_CONFIRMATION_SCREEN}</b></div>
<div class="feature-heading-rite"></div>
</div>
	
	<!-- BEGIN: session_true -->
	<div>
		<div style="text-align: center; height: 25px;">
			<div class="cartProgress">
			{LANG_CART} &raquo; {LANG_ADDRESS} &raquo; {LANG_PAYMENT} &raquo; <span class='txtcartProgressCurrent'>{LANG_COMPLETE}</span>
			</div>
		</div>
		<!-- BEGIN: order_success -->
		<p>{LANG_ORDER_SUCCESSFUL}</p>
		<!-- BEGIN: aff_track -->
		{AFFILIATE_IMG_TRACK}
		<!-- END: aff_track -->
		<!-- END: order_success -->
		
		<!-- BEGIN: order_failed -->
		<p>{LANG_ORDER_FAILED}</p>
		<p>{LANG_ORDER_RETRY}</p>
		<div style="text-align: center; padding: 10px;"><a href="cart.php?act=step4"  class="txtCheckout">{LANG_RETRY_BUTTON}</a></div>
		<!-- END: order_failed -->
	</div>
	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<p>{LANG_LOGIN_REQUIRED}</p>
	<!-- END: session_false -->
			
</div>
<!-- END: confirmation -->