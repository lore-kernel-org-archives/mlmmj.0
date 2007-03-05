From: Sascha Sommer <ssommer@suse.de>
Date: Mon, 05 Mar 2007 14:20:46 +0000
Subject: Re: [PATCH] mimestrip / mimereject
Message-Id: <200703051520.47228.ssommer@suse.de>
List-Id: <mlmmj.mlmmj.org>
References: <200702261335.13954.ssommer@suse.de>
In-Reply-To: <200702261335.13954.ssommer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

> I believe a better way of doing this would be for a seperate program
> to strip unwanted mime parts and/or add a header like
> X-ThisMailContainsEvilMimeParts (and later check for it in the mlmmj
> access rules) before handing the mail to mlmmj.
>
> If you move this code into a seperate program, I will be happy to
> include it in the contrib/ directory of the mlmmj tarballs.
>

Some more thoughts about this:

When this mime stripping and analysis should be done in a seperate program 
that then calls either mlmmj-process or mlmmj-receive.
Could we have a commandline parameter for these mlmmj tools to reject mails?

Adding a header is not optimal because it would require to either keep the 
parsed mail in memory or to parse it again in order to add the header.
It would also require to do 2 configuration changes to activate mime 
stripping:
- activating the mime parser + its rules
- setting the X-ThisMailContainsEvilMimeParts deny rules in the lists rules 
  files
The last step could be avoided if mlmmj had a commandline parameter to reject 
mails. 

What do you think?

Regards

Sascha
