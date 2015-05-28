---
permalink: /2014-11-19-pullquotes-in-jekyll
date: 2014-11-18 23:55
title: "Pullquotes in Jekyll"
layout: post
tags: tech meta coding
---

Because I spent too much time today hacking pullquotes into my Jekyll setup, this is what I'm writing about.

{% include pullquote.html quote="all the cool blogs have them" %}
You know [pullquotes][] -- all the cool blogs have them. As far as I know, all the bigger blogging platforms give you some sort of tool to include them. WordPress probably has a gazillion different plugins for pullquotes. The "platform" I am using, [Jekyll][], has a plugin system just like WordPress[^1], but my setup doesn't allow for plugins[^ghp]. So I decided to make my own.

<!-- break -->

Some googling quickly turned up [previous art by Andy Taylor][]. Unfortunately it required HTML markup. I write my posts in [Markdown][], which is way cleaner and more flexible than HTML, but also a lot less powerful. In principle there is nothing keeping me from writing my pullquotes like Andy does:
{% highlight html %}
<p data-pullquote="a pullquote"></p>
{% endhighlight %}

There's nothing wrong with this approach, but I didn't really feel comfortable with it. Polluting my Markdown files with HTML ```<ugly></ugly>``` tags somehow didn't feel right. Also, this technique would require me to write the pullquote text *twice*. Not acceptable. So here's what I did.

The CSS for my pullquotes, as per Andy's technique, looks like this:
{% highlight css %}
p[data-pullquote] {
  display: block;
  @include media-query($on-palm) {
    display: none;
  }
}
p[data-pullquote]:before {
  content: attr(data-pullquote);
  float: right;
  width: 200px;
  margin: 0 0 0.5em 30px;
  padding: 0 -5% 0 0;
  font-size: 1.3em;
  font-style: italic;
  color: $brand-color;
  text-align: center;
}
{% endhighlight %}

Also I added this little snippet:

{% highlight html %}
{% raw %}
{{ include.quote }}<p data-pullquote="{{ include.quote }}"></p>
{% endraw %}
{% endhighlight %}

to my ```_includes``` as ```pullquote.html```. Now, instead of the ugly HTML markup, I can write this:

{% highlight html %}
{% raw %}
{% include pullquote.html quote="a pullquote" %}
{% endraw %}
{% endhighlight %}

…which also saves me from writing the pullquote text twice (*the Horror!*).

{% include pullquote.html quote="I didn't find a better way – I'm really new at CSS" %}
Sadly, this had the downside of messing with the layout too much. First of all it doesn't work with ```<p></p>``` tags, because you can't nest them. A ```<span></span>``` is fine, though, but I still couldn't figure out a way to get the layout right -- the quotes would sit at the exact same height has the text they were pulled from, which looks stupid and kind of defeats the purpose. I didn't find a way to push them up without text overlapping, and if I had there would be no good way to align them. At least I didn't find one -- I'm really new at CSS.

At this point, all that was left of my glorious plan was that I could use one kind of markup instead of another one -- and worst of all -- I still had the duplicate text.

Luckily, I had just written a quick and dirty [preprocessor][] for this site, which was easily extended to handle a pseudo [liquid][] tag. Using this liquid tag, I can now use

{% highlight html %}
{% raw %}
{% pq a pullquote %}
{% endraw %}
{% endhighlight %}

in the text. The preprocessor pulls out the quote, removes the liquid-like markup leaving only the quote, and prepends the paragraph the quote was taken from with

{% highlight html %}
{% raw %}
{% include pullquote.html quote="a pullquote" %}
{% endraw %}
{% endhighlight %}

Here's how the first paragraph of this post was written:

{% highlight html %}
{% raw %}
You know [pullquotes](http://en.wikipedia.org/wiki/Pull_quote) -- {% pq all
the cool blogs have them %}. As far as I know, all the bigger blogging 
platforms give you some sort of tool to include them. WordPress probably has 
a gazillion different plugins for pullquotes. The "platform" I am using,
[Jekyll](http://jekyllrb.com/), has a plugin system just like WordPress[^1], 
but my setup doesn't allow for plugins[^ghp].
{% endraw %}
{% endhighlight %}

and what my preprocessor made of it:

{% highlight html %}
{% raw %}
{% include pullquote.html quote="all the cool blogs have them" %}
You know [pullquotes][] -- all the cool blogs have them. As far as I know,
all the bigger blogging platforms give you some sort of tool to include
them. WordPress probably has a gazillion different plugins for pullquotes. The
"platform" I am using, [Jekyll][], has a plugin system just like
WordPress[^1], but my setup doesn't allow for plugins[^ghp].

[^1]:
[^ghp]:
[pullquotes]: http://en.wikipedia.org/wiki/Pull_quote
[Jekyll]: http://jekyllrb.com/
{% endraw %}
{% endhighlight %}

{% include pullquote.html quote="I really like what I made today" %}

Now (as long as I don't try to write about pullquotes), I have a very nice way to include this fancy little piece of text styling. The way I have it set up now has the added benefit of giving me the option to move the pullquote around, or slightly rephrase it should that be appropriate. Also, should I move to a setup that lets me include plugins, I can use (or write) one and keep using the exact same syntax I am using now.

It's not that big a deal, but I really like what I made today.

 **UPDATE**: I have since fiddled with the details.

[^1]: not at all like WordPress, but with the same intent.
[^ghp]: This site is hosted on [GitHub Pages](https://pages.github.com/)
[pullquotes]: http://en.wikipedia.org/wiki/Pull_quote
[Jekyll]: http://jekyllrb.com/
[previous art by Andy Taylor]: https://andytaylor.me/2012/12/02/pull-quotes/
[Markdown]: http://daringfireball.net/projects/markdown/
[preprocessor]: https://gist.github.com/8a5a54c0518478cfc541
[liquid]: http://liquidmarkup.org/

