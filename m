From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 05 Nov 2007 21:37:15 +0000
Subject: Re: [PATCH] mlmmj more verbose access denied mails
Message-Id: <472F8D0B.1000102@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200710301653.46807.ssommer@suse.de>
In-Reply-To: <200710301653.46807.ssommer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Sascha,

Sascha Sommer wrote:
> On Sonntag, 4. November 2007, Morten K. Poulsen wrote:
>> Perhaps you could extend it a bit, with support for a keyword (or magic
>> line, to ease implementation) in the listtext files? Something like this:
[...]
> Ok. See the attached patch.

Thanks! I have committed it to CVS.

So, all translation maintainers, please update the following listtexts:
- access
- maxmailsize
- moderation
- notintocc
- subonlypost

to include two lines like this:

--- below this line are the first 100 lines of the denied message --->
$originalmail$

Thanks :-)


Best regards,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
