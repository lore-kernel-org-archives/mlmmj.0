From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sun, 04 Nov 2007 18:01:13 +0000
Subject: Re: [PATCH] mlmmj more verbose access denied mails
Message-Id: <472E08E9.9080708@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200710301653.46807.ssommer@suse.de>
In-Reply-To: <200710301653.46807.ssommer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Sascha,

Sorry about the delay.

Sascha Sommer wrote:
> the attached patch adds another parameter to the prepheader function. This 
> parameter can be used to pass the filename of the mail that is going to be 
> rejected.

Thanks for the patch. I like the idea.

Perhaps you could extend it a bit, with support for a keyword (or magic 
line, to ease implementation) in the listtext files? Something like this:

---
Subject: Post to $listaddr$ denied due to size limit
[...]
Thanks.

This mail was generated in response to the following mail:
$original-mail$
---

As it is now, the original mail is just appended without any information 
about what it is.

I know that it is a bit more work, but I think it would add a lot of 
value :-)


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
