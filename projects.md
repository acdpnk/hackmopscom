---
layout: page
title: Projects
permalink: /projects/
---
<article class="project-list">
{% for project in site.projects %}
<div class="project">
<figure class="appicon">
    <a href="{{ project.url }}">
        <img src="{{ site.assets }}{{ project.icon }}"/>
    </a>
</figure>

<h2 class="post-title"><a href="{{ project.url }}">{{ project.title }}</a></h2>

<p class="project-description">{{ project.description }}</p>
</div>
{% endfor %}
</article>
