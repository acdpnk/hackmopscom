---
layout: naked
permalink: /stripped/onboarding/
---

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<div id="fail" class="onboarding-fail" style="display:none">
    <h3>
        Whoops, something went wrong.<br />
        Is &quot;Stripped&quot; enabled in Safari Content Blockers?
    </h3>
</div>

<div id="success" class="onboarding-success">
    <br />
    <h3>
        Yay, everything seems to be working fine!
    </h3>
</div>

<script language="javascript">
    $(document).ready(function() {
        document.getElementById('fail').style.display = "block";
    });
</script>
