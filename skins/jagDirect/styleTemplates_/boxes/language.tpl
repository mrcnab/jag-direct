<!-- BEGIN: language -->
<div style="float:left;">

{LANG_LANGUAGE_TITLE}

	<select name="lang" class="search-lang" onchange="jumpMenu('parent',this,0)">
		<!-- BEGIN: option -->
		<option value="switch.php?r={VAL_CURRENT_PAGE}&amp;lang={LANG_VAL}" {LANG_SELECTED} onmouseover="javascript:getImage('language/{LANG_VAL}/flag.gif');">{LANG_NAME}</option>
		<!-- END: option -->
	</select>
	<img src="language/{ICON_FLAG}" alt="{ICON_FLAG}"  width="27" height="17" id="img" align="absmiddle" /> 
</div>
<!-- END: language -->