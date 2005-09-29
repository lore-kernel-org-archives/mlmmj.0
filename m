From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 29 Sep 2005 10:50:24 +0000
Subject: Re: silently discarded post
Message-Id: <20050929105024.GJ75399@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
In-Reply-To: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Patrick Bennett <patrick@pebcomputing.com> [Sep 29. 2005 12:47]:
> I have a mlmmj 1.2.4-1 mailing list running on a debian+postfix host
> and one particular user is having trouble posting to it.  Every mail
> he sends is silently filed away into queue/discarded.  The address he
> is emailing from is properly subscribed to the "nomail" part of the
> list.  There is no control/access file.  Others, both on the
> mail-receipt and noreciept lists, are able to post to the list
> successfully.
> 
> Below is a copy of one of the mails that ended up in queue/discarded.
> Two things catch my eye, I wonder if either of them has something to
> do with it: 1) his "from" address has a 3-part domain; 2) the "to"
> address has single quotes around it (he seems to be unable to prevent
> this in his mailer, and at any rate, postfix was obviously able to
> handle it...).

Can you try and reproduce with mlmmj-1.2.8?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
