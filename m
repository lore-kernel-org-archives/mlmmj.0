From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 25 Jul 2007 00:47:44 +0000
Subject: Re: question about tunable option
Message-Id: <20070725004744.GG2073@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070724205639.58a3afa6@franky>
In-Reply-To: <20070724205639.58a3afa6@franky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Charlie Brady <charlieb@budge.apana.org.au> [Jul 25. 2007 02:40]:
> >>Yes, messages in an mbox file do have a "From " header. But that is not
> >>relevant to what an MTA expects to see. 'From ' is not an RFC2821/2822
> >>message header - it's mbox specific metadata storage (and also a message
> >>separator in that format). mlmmj should never see a message with a line in
> >>the message header starting 'From '.
> >
> >Point taken. But in case there is one--I want to delete it. I've seen
> >mails to lists with From in it.
> 
> Really? Really truly? If you see it, it almost certainly didn't arrive via 
> SMTP.

Yeah, some broken mailer or such I assume. But rather get rid of it
anyway then.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
