From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 16 Oct 2010 00:52:08 +0000
Subject: Re: [mlmmj] moderated twice
Message-Id: <4CB8F738.6030802@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTik6nrxYv+Yj+boWqEuJVPLN9OakMYYc=uauR7e_@mail.gmail.com>
In-Reply-To: <AANLkTik6nrxYv+Yj+boWqEuJVPLN9OakMYYc=uauR7e_@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

This shouldn't happen. Mlmmj takes steps to ensure mail isn't moderated twice. You 
should see a message in your syslog for later attempts:

"A moderate request was sent with a mismatching cookie. Ignoring mail"

It'll probably have a meaningless error code as well. (Fixing the error messages 
is a to-do item....)

Ben.



On 15/10/10 9:07 PM, Florian Effenberger wrote:
> Hi,
>
> here's a bug report I received:
>
> =
> And the other question: if two moderators approve a message does it
> appear twice in the or is the system sufficiently intelligent to
> reject moderation after the first?  I ask this since I approved a
> message I had not found in the list yesterday and subsequently found
> that it appeared three times in a list with three moderators.  Can't
> remember which list unfortunately.
> =
>
> Is this intended behavior?
>
> Florian (who promises to use the bugtracker soon ;)
>
>
>


