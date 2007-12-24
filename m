From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 24 Dec 2007 22:30:22 +0000
Subject: Re: delimiter problem
Message-Id: <477032FE.1060306@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20071221161243.8DC4F10AC1A4@canopus.gading.de>
In-Reply-To: <20071221161243.8DC4F10AC1A4@canopus.gading.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Oliver Gading wrote:
> i have some lists named "list-mylist", with a dash ("-").
> In previous postings I read, that it's not possible to use the 
> "-"-delimiter in that cases. But the "+"-delimiter would be possible.

Well, it depends on your mail server software. If it exports the 
"recipient extra" data as an environment variable, it will work just 
fine. Examples of such fine mail server software is qmail, Postfix and Exim.

> In Germany we have a very well known freemail hoster (web.de), and their 
> webmail gui does not accept the "+"-character within email addresses.

That is bad. Have you told them about the issue?

> Are there any plans to make it possible to use list-mylist@domain.tld 
> named lists with the "-"-delimiter?

Not if your mail server does not export the "recipient extra" data. It 
is impossible to tell if "list-faq@example.com" is for "list" with "faq" 
as extra data, or if it is for "list-faq" with no extra data.

Merry Christmas,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
