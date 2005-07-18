From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 18 Jul 2005 21:41:03 +0000
Subject: Re: mlmmj 1.2.9 UNOFFICIAL release, with qmail support
Message-Id: <20050718214103.GM83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000AB73@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000AB73@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* fifadd@tin.it <fifadd@tin.it> [Jul 18. 2005 23:33]:
> Memory leaks? This is very strange because I don't make any malloc
> that I remember. Where did you find them?

 From mlmmj-process.c:
 if(owner && strncmp(recipdelim, concatstr(2, RECIPDELIM, "owner@"), 7) = 0) {

concatstr() returns a string that needs to be free'd afterwards, since
it mallocs room for the new string it concats.

> I have inserted only some comments FFF, that you can easily catch (then remove)
> using a grep 'FFF' *. But there are changes in a lof of files and only three
> or four of them are signed by FFF characters sequence, If you need it I can
> make a patch, but you can make it by yourself. Simply remove the few FFF
> comments from listcontrol.c, mlmmj-process.c and mlmmj-send.c. Also remove
> the commented code that follows the FFF comment only.

But when I get a diff it's so much easier to see what have changed,
since it's not just one line adding a comment closure several lines
down, but explicitly showing me what's being removed. You don't have to
comment you you've been doing stuff.

And since it's not my code, I feel uncomfortable whether I really catch
everything when removing stuff.

So if you don't mind just removing everything you want to remove and add
all that's needed to make it work with qmail and send the patch, I would
be most grateful.

> I have used the existence code style, and the existence functions, like your
> contactstr.

Yeah, I see that. I was just puzzled that some places in the patch it
seemed the indentation was different. I use tabs for indentation.

Thanks!

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
