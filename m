From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 03 Apr 2006 21:21:06 +0000
Subject: Re: Two To: headers added to auto-mails from list
Message-Id: <20060403232106.7egb9h09sgc0wcw0@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <44312C59.8000100@925.dk>
In-Reply-To: <44312C59.8000100@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

Quoting Martin Koch Andersen <martin@925.dk>:
> I have noticed that in emails from the list (confirm-sub, sub-ok 
> etc.) I get two To: headers.
>
> In the configuration of my list I have 'Add To: header'. And in 
> 'Delete headers' 'To:' is listed also.

That sounds very strange.

The headers are changed in the incoming mail. Then the mail is checked 
for list control commands, and a reply is sent if needed. The changed 
headers should never appear in the reply.

> Why do I get this extra To: header? Could it be a bug with the 
> mentioned configuration above?

I cannot see how the customheaders option could change a confsub or 
sub-ok mail.

> Using latest version.

mlmmj 1.2.11?

Could you send an example of a mail with an extra To: header and your 
configuration files? A tarball on a web server is preferred :)

Morten
