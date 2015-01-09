<!-- BEGIN: unsubscribe -->
<div class="pro-wrap">
<div class="feature-heading-wrap">
<div class="feature-heading-left"></div>
<div class="feature-heading"><b>{UNSUBSCRIBE_TITLE}</b></div>
<div class="feature-heading-rite"></div>
</div>
	<!-- BEGIN: no_error -->
	<p>{LANG_UNSUBSCRIBE_DESC}</p>
	<!-- END: no_error -->
	<!-- BEGIN: error -->
	<p class="txtError">{VAL_ERROR}</p>
	<!-- END: error -->

	<!-- BEGIN: form -->
	<form action="index.php?act=unsubscribe" target="_self" method="post" style="text-align: center;">
		<strong>{TXT_ENTER_EMAIL}</strong><input type="text" name="email" class="textbox" />
		<input name="submit" type="submit" value="{TXT_SUBMIT}" class="submit" />
	</form>
	<!-- END: form -->
	
</div>
<!-- END: unsubscribe -->