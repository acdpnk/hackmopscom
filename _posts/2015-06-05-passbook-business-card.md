---
title: My Passbook Business Card
tags: passbook card contact
comments: true
---

I made my own passbook business card!

<!-- break -->

<figure class="passbook-card"><a href="https://d2xs82utexg37l.cloudfront.net/chrifpa.pkpass"><img src="{{ site.baseurl | append: site.assets }}passbook.png" alt="My Passbook Business Card. Tap/click to download, or scan the QR-code directly from Passbook."></a><figcaption>My Passbook Business Card. Tap/click to download, or scan the QR-code directly from Passbook.</figcaption></figure>

Ever since I saw [this][tutorial] tutorial I wanted to make one, and I've finally come around to it. Tom's [post][tutorial] is pretty complete, so I won't go into much detail, but there's a couple of things I want to point out.

### Passbook Toolchain

The passbook toolchain is a pain in the ass. For a simple pass like mine, with no automated update capability and no backend validation (because there's no value attached to it), Apple's ```signpass``` utility *is* the toolchain, and it pretty much does what is on the tin: signing passes. It can also "validate" passes -- scare quotes, because it only validates the signature, NOT the content.

The only way I found to check whether my pass content was correct was to try to send it to an iPhone. A Mac will happily preview your flawed pass and "add it to passbook", but it won't show up on the phone -- and that's how you know it's flawed. Took me some time to figure that out, because there's no error message whatsoever 😩

At this point, you still have no idea what's wrong. How do you find out? You *read the spec*. Yay. Most of the time my pass broke when I removed stuff I thought was optional, but wasn't. The spec is complete but not very easy to read, because there's a couple of different pass types with different requirements and capabilities.

### "Add to Contacts"

On the back of my pass there's a link titled "Add to Contacts". It's nothing but a link to a .vcf containing my contact info, which you can then "Open in Contacts" on your device. While .vcf is not a hard format to write yourself the easiest way to obtain one is to export it from your own Contacts App. It's simple to delete info from the file you don't want out there.

All in all I'm quite happy with how it turned out, even though it's probably a vanity project without much real world use.

¯\\\_(ツ)_/¯




[tutorial]: http://www.atomicbird.com/blog/passbook-card-details
