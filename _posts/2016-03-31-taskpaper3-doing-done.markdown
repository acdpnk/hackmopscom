---
title: Taskpaper 3 Scripting
layout: post
tags:
  - taskpaper 3
  - javascript
date: 2016-04-02 22:25
---

My Taskmanager for coding projects is [Taskpaper 3][]. I've been using the preview version for a couple of months, and although it took me some time to get into I now *love* it. It's not that it has a steep learning curve — you can pretty much start using it out of the box with basic functionality. In this regard it is much like a Text Editor: all the power is hidden away.

I had to tap into this power to learn to love it.

<!-- break -->

This post is about a [JXA][] script (code [below](#the-code)) I just wrote to automate a pretty standard procedure, which serves as an example for what you can do with Taskpaper 3.

## The Problem

When I stop working on a project for any amount of time, ideally I am done with the last task I was working on. In order to get back into the flow quicker, I'll pick what I'll work on next and tag it — surprise! — **@next**.

Then, when I sit down on the project again, I'll know where to pick up, and mark the item(s) I'm working on **@doing**. This tag helps me focus and lets me get back to work quicker in case I'm disturbed or need to get a coffee or something. Also, some tasks take longer than anticipated (or more than a day), in which case it serves the same purpose as **@next** above.

Once finished, a task is marked **@done** — no need to elaborate, I presume.

There's also a **@later** tag I use, which is removed for obvious reasons as soon as I start working on a task.

And then sometimes I'll *exhume* a task, i.e. bring it back from the archive, either because It wasn't done after all or because I have to do the same thing again.

The script will do all of this automatically, at the push of a button. I use [KeyboardBoard Maestro][] to override Taskpaper's native ⌘D Keyboard shortcut, which tags/untags with **@done**. I think you can achieve the same thing with Automator, but Keyboard Maestro is what I'm familiar with.

Used this way, ⌘D gets some extra powers. Not only will it remove **@later** when you start working on something, when a task is tagged **@done** all it's descendants are, too. Also they're stripped of lingering **@next** or **@doing** tags. The way I organize my .taskpaper files, a task only has two kinds of children: prerequesites and notes, both of which are necessarily done when their parent is[^notes]. The reverse happens when *exhuming* a task: child nodes are marked undone with their parents.

## The Code

And here's the script. I think it's pretty self-explanatory, if you have questions feel free to ask. You might want to look into Taskpaper's [documentation][], too.

<script src="https://gist.github.com/chrifpa/fee64fd8d19ac4396852b616965a2356.js"></script>

There's more to love about Taskpaper 3, so stay tuned.

Thanks for reading, have a nice day ♥️

[Taskpaper 3]: https://www.taskpaper.com
[JXA]: https://github.com/dtinth/JXA-Cookbook
[KeyboardBoard Maestro]: http://www.keyboardmaestro.com
[documentation]: http://guide.taskpaper.com

[^notes]: For notes, tagging them **@done** seems strange but is necessary to allow Taskpaper to archive them with their parent. Also it makes them not show up in searches for things `not @done`.
