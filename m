From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 25 Feb 2008 18:50:24 +0000
Subject: Re: [patch] Static bounce address
Message-Id: <20080225185024.GQ79716@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
In-Reply-To: <20080223021959.85x4a8e6sick48gk@intranator.m.i2n>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Jarosch <thomas.jarosch@intra2net.com> [Feb 25. 2008 19:27]:
> Is there already a function to split an email address into
> localpart/domain?  Didn't see one when I took a quick look.

In strgen.h you'll see:

 char *genlistname(const char *listaddr);
 char *genlistfqdn(const char *listaddr);

Example:

 localpart = genlistname("mlmmj@mmj.dk");
 domain = genlistfqdn("mlmmj@mmj.dk");

 printf("%s@%s\n", localpart, domain); /* prints mlmmj@mmj.dk */

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
