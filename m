From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 23 Oct 2010 00:55:02 +0000
Subject: Re: [mlmmj] mlmmj and GMANE posting
Message-Id: <4CC23266.7020601@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTik-oBQtEUfMXR3LxYRrrDz4ay_9uvF+gwrPujx9@mail.gmail.com>
In-Reply-To: <AANLkTik-oBQtEUfMXR3LxYRrrDz4ay_9uvF+gwrPujx9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I don't know how far spammers might go, particularly for high-exposure
lists like yours, but a Received: header could probably quite easily be
forged, and Mlmmj's rather simple access method may well not be able to
distinguish between that and a sensible set of Received headers.

Do the GMANE servers implement SenderID/SPF and/or Domainkeys/DKIM? If
you can set up your MTA to validate one or both of those, add a header,
and then check that header for Mlmmj access purposes, it would be more
secure.

Ben.



On 20/10/10 9:20 PM, Florian Effenberger wrote:
> Hi,
>
> some people are complaining that posting from GMANE does not work, and
> that they have to subscribe to the nomail version before. Anyone has a
> practical idea on how to make sure it works, without being open to
> spammers? I guess it's something in the access file, allowing posting
> from GMANE servers, even when not subscribed.
>
> Anyone ever did this and has a code snippet to share? ;)
>
> Thanks
> Florian
>
>
>


