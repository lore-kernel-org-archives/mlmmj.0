From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 28 Jan 2011 17:24:54 +0000
Subject: Re: [mlmmj] [PATCH 00 of 10] mlmmj-maintd.c tweaks
Message-Id: <4D42FBE6.3040107@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <patchbomb.1296169158@duncow>
In-Reply-To: <patchbomb.1296169158@duncow>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 28/01/11 9:59 AM, Richard Mortimer wrote:
> As mentioned the other day here are a number of patches against
> mlmmj-maintd.c that fix relatively minor issues. I haven't attempted
> to make any changes outside of this one file but intend to look at those
> over the coming month or two as time allows.

Thanks. I'll look at them when my time allows. I have a couple of high
Mlmmj priorities, so it may be a little while, I'm afraid.

> I have also spotted a couple of other issues that I haven't addressed yet.
> The first is the fact that unlink calls never have their error status
> checked.

Yes. This is a problem with unlink and a number of other system calls.
They need to be checked and errors logged appropriately.

Another big issue is that messages related to errno are often logged
when it shouldn't be, so it produces bogus error messages.

In fact, the whole error and logging parts of Mlmmj need a makeover.
This is one of my priorities after getting 1.2.18 out, and I would love
help with it. We need to design a small family of functions and/or
macros that provide a simpler, richer and more consistent interface for
performing logging and handling errors. Then we need to go through the
code and make existing logging use the new interfaces, and add logging
where it's missing for unchecked return codes and so on.

> I was thinking about introducing a myunlink() method that does
> the unlink and reports any error. That would help catch any permissions
> problems. There is a potential that some of the files might not exist
> in all situations (the -probe files for example) so it might not be
> appropriate to log an error in all circumstances.

Yeah, that's right. I think this needs to be done on a case-by-case
basis, not by adding just one myunlink() function.

> Also there are a couple of places in mlmmj-maintd.c where it doesn't find
> the contents of the files that it expects. It just carries onto the next
> file without logging an error.

Yep, of course this should be fixed too.

> Review comments most welcome.

I'll throw them your way when I have time. You may see your changesets
in Hg before or after I review them. We'll see.

Anyone else, of course, is also welcome to make comments. Please ensure
I am CCed if you do, guys.

Cheers,

Ben.




