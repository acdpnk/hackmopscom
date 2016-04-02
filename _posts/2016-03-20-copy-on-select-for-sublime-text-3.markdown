---
title: Copy On Select For Sublime Text 3
tags:
    - Sublime Text 3
    - Python 3
date: 2016-03-20 16:59
---

[Sublime Text 3][] is my text editor of choice. It runs very smooth, is not too ugly (as far as text editors go), and has a solid plugin infrastructure and community. After I learned to love copy on select in many of my apps[^apps] I went looking for a plugin which would give me that feature in Sublime Text, and was surprised to find that there wasn't one (that I could find — if you know about a preexisting implementation please tell me about it so I can post a link). So naturally I wrote my own.

<!-- break -->

The source is on [GitHub][], in case you want to take a look. There's not much to it, it basically just listens to changes to your selection and pastes it to the clipboard if unchanged for a certain amount of time (default is 1s).

Use of a clipboard manager is highly recommended — I use [Copied][] and love it.

~~I submitted the plugin to [package control][]. If you want to use it before it is officially accepted, go to `Command Palette → Package Control: Add Repository`, add the [repository][GitHub], then install as `CopyOnSelect`.~~

**Update** 2016-04-01: Plugin is now installable as `Copy on Select` through [Package Control][package control]


[^apps]: iTerm2, Chrome, Xcode come to mind

[Sublime Text 3]: https://www.sublimetext.com/
[GitHub]: https://github.com/chrifpa/CopyOnSelect
[Copied]: http://copiedapp.com/
[package control]: https://packagecontrol.io/packages/Copy%20on%20Select
