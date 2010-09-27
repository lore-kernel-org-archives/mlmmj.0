From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 27 Sep 2010 01:19:30 +0000
Subject: Re: [mlmmj] undesired help emails
Message-Id: <4C9FF122.60907@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4C960847.7000102@yahoo.com.au>
In-Reply-To: <4C960847.7000102@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 27/09/10 2:40 AM, Robin H. Johnson wrote:
> On Sun, Sep 19, 2010 at 10:55:35PM +1000, Ben Schmidt wrote:
>>> Maybe a custom control/commandcustomheaders, control/commanddelheaders?
>> I have implemented a feature which hasn't made it into hg yet as I
>> haven't documented it properly, to allow arbitrary headers to be added
>> to listtexts, so this would allow you to add the relevant headers. In a
>> future Mlmmj release, I'll probably try to include more sane and
>> standards-compliant/best-practice defaults for these, too. See
>> http://mlmmj.org/archive/mlmmj/2010-02/1666.html
> The downside of that solution is that I would need to build something to
> allow easily updating listtexts for each list, with the per-list
> headers (presently, since all the texts are identical, we have them
> symlinked)
>
> Ideal if we could combine both solutions maybe?
> Worst case, I could build the listtexts w/ Make, per list.

I'm not really against a tunable like this, though I am trying to 'cut
back' on tunables, particularly where they're ambiguous or conflict
(e.g. there are many that deal with access control, so it's hard to know
which might 'win' sometimes).

However, I still suspect this might be unnecessary. I have written
documentation now. Have a look at

http://mlmmj.org/hg/mlmmj/file/32d3f7e3b523/README.listtexts

Note that $whatever$ substitutions are supported in the headers. I think
this means you should be able to code pretty much whatever you want in a
list-independent way and continue to use shared listtexts.

Is there something I'm missing?

I'll look at your specific examples in more detail later. Thanks for
forwarding them.

Ben.





