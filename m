From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 19 May 2008 20:50:54 +0000
Subject: Re: Bugs
Message-Id: <1211230254.20119.8.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <4fa0f34d76Lists@torrens.org.uk>
In-Reply-To: <4fa0f34d76Lists@torrens.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, 2008-05-17 at 16:32 +0100, Torrens (lists) wrote:
> Sorry, I do not know which version of mlmmj is in use (should there be a
> header line added with this info?).

There could be a tunable for that, yes. Patches are welcome.

> 1: mlmmj is over-sensitive to files not ending in a newline character. I
> had a footer file that was like this - as a result about 65 zero bytes get
> appended to the end of every outgoing email.
> 
> The copy in the archive is however correct.

I don't think that it is over-sensitive, but it definitely reacts in an
impractical way. The outgoing mail is memory mapped, and a buffer is
allocated for the SMTP-prepared mail (. is escaped in the beginning of a
line, newlines are \r\n). The mail is copied, line for line, into this
new buffer. The last line is not copied, because there is no \n.

A special case should be added, which corrects such a mail. The SMTP
code could also use a clean up.

> 2: Just had an email with three Content-type lines. mlmmj acted on the
> third one - even though only the first was truly in the headers. Two and
> three were separated from the headers by a blank line.

mlmmj does not care about Content-Type headers. Perhaps you are using
Sascha Sommer's recievestrip?


Morten

