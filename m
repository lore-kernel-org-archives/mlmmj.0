From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 14 Feb 2018 11:58:53 +0000
Subject: Re: [mlmmj] Misleading operations log output: moderation & more
Message-Id: <a805abfd-d20c-7740-3aa2-279789947513@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20180213T212446-133084908Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20180213T212446-133084908Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I agree with all this, Robin. Will try to get to it soon. Reworking 
logging and some other broad architectural things are some of my next 
goals for Mlmmj development which I hope will accelerate in the coming 
weeks.

Ben



On 14/2/18 8:33 am, Robin H. Johnson wrote:
> Hi,
> 
> Recently saw some behavior that was unclear.
> 
> The gentoo-dev-announce list is configured as an announce list.
> subonlypost, notoccdenymails, nosubonlydenymails, noaccessdenymails,
> moderated.
> 
> access:
> - (lots of deny lines)
> - moderate ^From: .*@gentoo.org
> - deny
> 
> The user was subscribed as username@gentoo.org, but sent their mail with
> a plus-address suffix in From. The plus-address was not subscribed.
> 
> Log output: (wrapped for reading)
> mlmmj-process:
>   access - A mail from "username+gentoo-dev@gentoo.org" with
>   header "From: A User <username+gentoo-dev@gentoo.org>" was
>   moderated by rule #18 "moderate ^From: .*@gentoo.org"
> 
> That was the only log line, and then it seemed to vanish.
> What happened is that subonlypost was applied AFTER the access was
> processed, and did not log that it decided to drop the mail.
> I think that there should be a log message stating it was dropped.
> 
> Relatedly, if you try to sub an address that is already on a list, there
> should be a log message (and likewise for unsub).
> 
> P.S.
> 'A mail' is also ambiguous on busy lists, since you could have multiple
> mails being processed at the same time, need to figure out something to
> describe which mail is in logging.
> 

