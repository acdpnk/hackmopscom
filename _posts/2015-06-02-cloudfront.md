---
tags: aws amazon cloudfront
date: 2015-06-02 13:14
title: "Cloudfront"
comments: true
---
I just set up Amazon [Cloudfront][] to serve hackmops.com.

<!-- break -->

I went to Cloudfront because I want to make the site available via https -- it is now, but only if you go through the [cloudfront url][]. As a "side effect", the site is now crazy fast, as long as it comes from the cdn -- not likely, since the cache is invalidated after 300 seconds, and traffic is… lets just say it's unlikely someone looked at the site no longer than 300s before you do. But who knows -- if traffic increases I'm ready.

The main reason I wanted to write about Cloudfront, however, was that I had some hiccups setting it up, and I thought I'd share my workaround. At first I followed their [instructions][] (including configuring a CNAME), which seemed to work fine -- except that only my root object (index.html) and the 404 site[^404] were available. So after lots of superbly fast-served 404s I took to google and found [this][tutorial] tutorial, containing the following crucial bit of advice:

> The next page is trickier. If you click on “Origin Domain Name”, CloudFront will automatically auto-complete with your S3 bucket. However, don’t select this one. Instead, copy-paste the endpoint we had in previous step [Note: that would be the bucket endpoint from the bucket's static website configuration section].

I'm not terribly familiar with aws, and might very well have missed some configuration options that would have made this easier for me. If you can explain to me why it works now and didn't before, please tell me -- I'm always eager to learn.

The important thing is that one way or another it works now, and if you're like me and just want to set up a Cloudfront distribution for your s3-hosted static website real quick, this little piece of advice might save you some frustration.

#### UPDATE
Turns out: [s3_website][], which I use to deploy the site, does all of this by itself if configured properly. The [README][s3_website] is quite helpful.

[Cloudfront]: https://aws.amazon.com/cloudfront/
[cloudfront url]: https://d2xs82utexg37l.cloudfront.net
[instructions]: http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.html
[tutorial]: http://www.michaelgallego.fr/blog/2013/08/27/static-website-on-s3-cloudfront-and-route-53-the-right-way/
[s3_website]: https://github.com/laurilehmijoki/s3_website

[^404]: If you want to have custom error pages you'll have to set them up separately, which I did for my [404](http://hackmops.com/404.html).
