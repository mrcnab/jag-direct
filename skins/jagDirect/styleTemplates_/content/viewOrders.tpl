<!-- BEGIN: view_orders -->
<div class="new-release01">
<div class="new-release01-upr">&nbsp;<h3>{LANG_YOUR_VIEW_ORDERS}</h3></div>
 <div class="new-release01-content" style="height:150px;">

      <div style="float:left; padding:5px; width:505px; ">
	<!-- BEGIN: session_true -->
		<!-- BEGIN: orders_true -->
		<p>{LANG_ORDER_LIST}</p>
		<table width="100%" border="0" cellpadding="3" cellspacing="2" style="margin-bottom: 25px;">
		  <tr class="main-row-table">
		    <td>{LANG_ORDER_NO}</td>
			<td>{LANG_STATUS}</td>
			<td>{LANG_DATE_TIME}</td>
			<td>{LANG_ACTION}</td>
		  </tr>
		  <!-- BEGIN: repeat_orders -->
		  <tr class="secondary-row-table">
		    <td class="linkcls12" align="left"><a href="cart.php?act=viewOrder&amp;cart_order_id={DATA.cart_order_id}">{DATA.cart_order_id}</a></td>
			<td align="left">{DATA.state}</td>
			<td align="left">{VAL_DATE_TIME}</td>
			<td align="left" class="linkcls12"><a href="cart.php?act=viewOrder&amp;cart_order_id={DATA.cart_order_id}" class="txtLink">{LANG_VIEW_ORDER}</a></td>
		  </tr>
		  <!-- END: repeat_orders -->
		</table>

		<!-- END: orders_true -->
		
		<!-- BEGIN: orders_false -->
		<p>{LANG_NO_ORDERS}</p>
		<!-- END: orders_false -->

	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<p>{LANG_LOGIN_REQUIRED}</p>
	<!-- END: session_false -->
		</div>		
</div>
<div class="new-release01-lwr">&nbsp;</div>
<br clear="all" /> </div>
<!-- END: view_orders -->