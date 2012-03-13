From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 13 Mar 2012 12:14:26 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18a1 released
Message-Id: <4F5F3A22.3050206@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F5E32B9.6090908@yahoo.com.au>
In-Reply-To: <4F5E32B9.6090908@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 13/03/12 6:16 PM, Thomas Goirand wrote:
> On 03/13/2012 01:30 AM, Ben Schmidt wrote:
>> An alpha release for the upcoming Mlmmj 1.2.18 has been published.
>
> Hi!
>
> Why suddenly changing versioning scheme?

I didn't realise I changed anything.

> Does the "a" means alpha?

Yes, A is for alpha. Followed by B for beta, and RC for release
candidate. That's the system in my head, anyway.

> Later, if you publish 1.2.18.0, it's going to be considered smaller
> than 1.2.18a1, so I think it's not a nice numbering scheme

Well, that depends how you sort, doesn't it? What I've used is a fairly
common numbering system that a lot of packages use, so it wouldn't
surprise me if many sorting algorithms for version numbers dealt with it
OK. A simple ASCII sort won't though, it's true.

> (it might break upgrading in Debian, for example).

I'm not sure that an alpha release should be included in a distribution
anyway, to be honest.

> Something like:
>
> 1.2.18.0.rc1
>
> would have been better. Then, you would release 1.2.18.1 ...

I guess I probably should have had a hyphen in there, that's all.
1.2.18-a1 would be better, right? I'll do that for beta and beyond.

Cheers,

Ben.




