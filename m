From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 07 Nov 2007 19:19:25 +0000
Subject: Re: Autoresponders vs. reply-to list
Message-Id: <1194463165.6200.6.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
In-Reply-To: <42c4a32b0711070948g1c748fd2u1d9b1bcad23f8f68@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi Kofa,

On Wed, 2007-11-07 at 17:48 +0000, Kovács István wrote:
> It was in those days that I learned (the hard way) that
> out-of-office autoreplies (vacation responders) and setting
> the reply-to to the list address mean bad luck

Oh yes. The pain of dealing with broken mail (user|transfer|delivery)
agents.

> and I used PMMail's filters to get rid of such mail. How do
> I do it with Linux, postfix and mlmmj?

You could use mlmmj's built-in access control to deny mails with some
subjects or other headers indicating an automatically generated mail.
You can find a small HOW-TO in README.access in the mlmmj distribution.

Morten

