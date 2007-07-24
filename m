From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 24 Jul 2007 22:09:47 +0000
Subject: Re: question about tunable option
Message-Id: <20070724220947.GD2073@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070724205639.58a3afa6@franky>
In-Reply-To: <20070724205639.58a3afa6@franky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Charlie Brady <charlieb@budge.apana.org.au> [Jul 24. 2007 21:50]:
> >The tunable delheaders is for adding the headers you want to delete
> >apart from "From " and "Return-Path:", since they _have_ to be deleted
> >since they have to change now we send the mail on. Maybe you don't have
> >a "From " header in a single mail, but look in an mbox file.
> 
> Yes, messages in an mbox file do have a "From " header. But that is not 
> relevant to what an MTA expects to see. 'From ' is not an RFC2821/2822 
> message header - it's mbox specific metadata storage (and also a message 
> separator in that format). mlmmj should never see a message with a line in 
> the message header starting 'From '.

Point taken. But in case there is one--I want to delete it. I've seen
mails to lists with From in it.

> Return-Path: is a an RFC2821 message header, but it should only be added 
> to messages for final delivery (as a permanent record of the envelope 
> sender). It shouldn't be seen "on the wire" during SMTP. mlmmj might see 
> it, but should delete it.

And so we do.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
