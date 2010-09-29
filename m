From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 29 Sep 2010 22:35:10 +0000
Subject: Re: [mlmmj] more than 100 lines for moderation
Message-Id: <4CA3BF1E.5070701@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
In-Reply-To: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 30/09/10 6:20 AM, Christian Laursen wrote:
> On 09/29/10 22:01, Florian Effenberger wrote:
>> is it possible to see more than 100 lines for moderation mails? It's
>> hard to determine if I can moderate a message through if I see no
>> content :-(
>
> It would actually be nice if the message to be moderated was included as a mime
> attachment. That way the MUA will be able to display the message properly, even if
> it is base64 encoded or otherwise hard to read in source form.

This has been implemented in version control and I've been using it for
about 6 months so I am confident it is fairly solid. If you would like
download the current sources and help test it, I would certainly welcome
the help.

I'm also hoping someone will be able to do a code review of the changes.
I was hoping Mads or Morten might have time, but I think they are just
too busy. Might either of you be able to help?

The relevant changes are those from "Arbitrary headers in listtexts"
(b72bcb7e08a2) through to "Richer MIME list texts with inline messages"
(32d3f7e3b523).

Cheers,

Ben.





