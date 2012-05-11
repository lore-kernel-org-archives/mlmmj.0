From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 11 May 2012 14:50:42 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <4FAD2742.80709@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> http://www.openspf.org/SPF_vs_Sender_ID summarizes this nicely:
>
> <quote>
> How will /Sender ID/ implementations violating the /SPF/ specification
> affect me?
>
> If you have published an |v=spf1| policy to protect the use of your
> domain in the MAIL FROM and HELO addresses, /Sender ID/
> implementations that apply your policy to /PRA/ (per RFC 4406) will
> reject your mail if you use your domain in the "|From|" (or generally
> /PRA/) header field while sending from (MAIL FROM) another system.
> </quote>
>
> organization has an |v=spf1| policy in place. Mail is outsourced to
> microsoft, which uses sender ID.
>
> It's the receiving server which has to implement spf/sender-ID, so
> delivery is erratic to say the least.

Yeah. This kind of stuff is a PITA.

As well as the solution by publishing an spf2.0 record, the document you
referenced suggests using the "Sender:" header. I can't really remember,
but did you say you already tried that and it didn't help?

>> When mlmmj send out mails to the list subscribers the envelope from
>> looks something like this:
>> listname+bounces-XXXX-recipient=example.com@listowner.tld
>
> listowner.tld doesn't have an spf record.
>
> this is not the problem. problem is the "From" field/

Hmm. Well, when an implementation is broken, who knows how broken? Maybe
the combination of a "Sender:" header and a published SPF record for
that domain (which will also be the domain of the envelope-from) will
help...if it can be done without too much hassle....

Ben.




