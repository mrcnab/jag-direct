<!-- BEGIN: account -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_YOUR_ACCOUNT}</h3></div>
 <div class="new-release01-content" style="height:150px;">

	<!-- BEGIN: session_true -->
	<div class="my_account" style="position:relative;right:25px;">	
		<ul>
			<li><a href="index.php?act=profile"><strong>{TXT_PERSONAL_INFO}</strong></a></li>
			<li><a href="cart.php?act=viewOrders"><strong>{TXT_ORDER_HISTORY}</strong></a></li>
			<li><a href="index.php?act=changePass"><strong>{TXT_CHANGE_PASSWORD}</strong></a></li>
			<li><a href="index.php?act=newsletter"><strong>{TXT_NEWSLETTER}</strong></a></li>
		</ul>
	</div>
	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<p>{LANG_LOGIN_REQUIRED}</p>
	<!-- END: session_false -->

</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: account -->