From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 20 Mar 2006 22:22:55 +0000
Subject: Re: testing mlmmj
Message-Id: <XFMail.20060320232255.morten@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060319162716.GU31545@waterworld.anvame.net>
In-Reply-To: <20060319162716.GU31545@waterworld.anvame.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 20-Mar-2006 Jakob Hirsch wrote:
> Andreas V. Meier wrote:
>>>> Mar 19 01:32:41 waterworld /usr/bin/mlmmj-process[23489]:
>>>> mlmmj-process.c:612: Discarding
>>>> /raid/var/spool/mlmmj/mlmmj-test//incoming/ca5b636770aae27 due to
>>>> invalid envelope from email count (was 0, must be 1): No such file or
>>>> directory
> 
> Hm, now that I look at it, the error message looks a little strange,
> esp. the "no such file..." part.

It is a debug message. Ignore the "No such file or directory" part.

If the mail has no envelope from address ("MAIL FROM:<>" in SMTP), it is a
bounce mail. If such a mail is sent to the list, it must be from a broken mail
server, and is therefore ignored.

*But* if your mail server is not configured to add the envelope from address as
a Return-Path: header, mlmmj can not see it. Is your server configured to add
Return-Path?

In the future mlmmj will also look at environment variables for envelope
addresses (for qmail support) but it does not at the moment.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
