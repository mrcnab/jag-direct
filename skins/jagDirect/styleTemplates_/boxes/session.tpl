<!-- BEGIN: session -->
<div class="quick-search-wrap">
<!-- BEGIN: session_false -->
<span  class="linkcls" style="padding-left:30px;">{LANG_WELCOME_GUEST} : [
<a href="index.php?act=login&amp;redir={VAL_SELF}"  id="searchlink" rel="subcontent">{LANG_LOGIN}</a> -              

<a href="cart.php?act=reg&amp;redir={VAL_SELF}"  class="linkcls">{LANG_REGISTER}</a> ]</span>
<!-- END: session_false -->

<!-- BEGIN: session_true -->
	<span class="linkcls" style="padding-left:5px;">{LANG_WELCOME_BACK} : {TXT_USERNAME}</span>
[<span class="linkcls"> <a href="index.php?act=logout" >{LANG_LOGOUT}</a> - <a href="index.php?act=account">{LANG_YOUR_ACCOUNT}</a>  </span>] 
<!-- END: session_true -->
	</div>
<!-- END: session -->
