From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Tue, 24 Jul 2007 19:50:30 +0000
Subject: Re: question about tunable option
Message-Id: <Pine.LNX.4.64.0707241538390.9356@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <20070724205639.58a3afa6@franky>
In-Reply-To: <20070724205639.58a3afa6@franky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Tue, 24 Jul 2007, Mads Martin Joergensen wrote:

> * Franky Van Liedekerke <liedekef@telenet.be> [Jul 24. 2007 20:57]:
>> Hi,
>>
>> one of the tunable options is "delheaders", which by default removes
>> the headers "From " and "Return-Path:".
>> And here is my question: why "From " and not "From:"? There is no
>> "From " header in a mail, every header is followed by a colon ... so
>> for now this doesn't do anything (please correct me if I'm wrong).
>
> The tunable delheaders is for adding the headers you want to delete
> apart from "From " and "Return-Path:", since they _have_ to be deleted
> since they have to change now we send the mail on. Maybe you don't have
> a "From " header in a single mail, but look in an mbox file.

Yes, messages in an mbox file do have a "From " header. But that is not 
relevant to what an MTA expects to see. 'From ' is not an RFC2821/2822 
message header - it's mbox specific metadata storage (and also a message 
separator in that format). mlmmj should never see a message with a line in 
the message header starting 'From '.

Return-Path: is a an RFC2821 message header, but it should only be added 
to messages for final delivery (as a permanent record of the envelope 
sender). It shouldn't be seen "on the wire" during SMTP. mlmmj might see 
it, but should delete it.

---
Charlie
