---
layout: naked
permalink: /stripped/slowpage
---

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

# Slow Loading Page

<div id='loaded'>

It's not the most beautiful page like this, but at least you can read it on a slow connection.

</div>

<script language="javascript">
    $(document).ready(function() {
        document.getElementById('loaded').style.display = "none";
    });
</script>
