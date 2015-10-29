---
layout: naked
permalink: /stripped/onboarding
---

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<h3 id="fail" class="onboarding-fail" style="display:none">
Whoops, something went wrong.<br />
Have you activated &quot;Stripped&quot; in Safari Content Blockers?
</h3>

<h3 id="success" class="onboarding-success">
Yay, everything seems to be working fine!
</h3>

<script language="javascript">

$(document).ready(function() {
document.getElementById('fail').style.display = "block";
document.getElementById('success').style.display = "none";
});

</script>
