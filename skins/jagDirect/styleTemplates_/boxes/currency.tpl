<!-- BEGIN: currency -->
<h2 style="margin-top:30px; margin-bottom:10px;">{LANG_CURRENCY_TITLE}</h2>
<div>
	<select name="lang" class="txtfield" onchange="jumpMenu('parent',this,0)" style="width:170px;">
		<!-- BEGIN: option -->
		<option value="switch.php?r={VAL_CURRENT_PAGE}&amp;currency={VAL_CURRENCY}" {CURRENCY_SELECTED}>{CURRENCY_NAME}</option>
		<!-- END: option -->
	</select>
</div>
<!-- END: currency -->	