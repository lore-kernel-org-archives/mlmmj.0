From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 29 Feb 2012 03:57:34 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F4DA22E.7090702@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> As for the save.php, I also found some very silly piece of code like
> this one:
> // Perl's encode_entities (to be able to use tunables.pl)
> function encode_entities($str) { return htmlentities($str); }
>
> I'd like someone to explain to me why htmlentities() has to be wrapped
> like this... :)

For exactly the reason in the code comment: it's so that tunables.pl can
be used. The PHP file evaluates the tunables.pl (Perl) file as if it
were a PHP file. The tunables.pl file uses the Perl function
encode_entities(), so to make it work, a function of that name is
defined in PHP that just calls the equivalent PHP function. The benefit
is that only one tunables.pl file needs to be maintained, not a
tunables.pl and a tunables.php.

> Then, there's things like this which worries me:
> fwrite($fp, $HTTP_POST_VARS[$name]);
>
> Not only the variable should be checked, but also, if I'm not mistaking,
> $HTTP_POST_VARS is deprecated, and maybe even *removed* (I didn't check)
> from php 5.4, which is going to reach Debian SID in a mater of weeks now
> (we should be using $_POST instead).

This was at least partly fixed ages ago in version control, so you
evidently didn't check the current state of Mlmmj either. :-)

> Functions like mlmmj_boolean() has parameters that it isn't using, so
> it's weird.
>
> So yes, all this needs a code review... :)

Never hurts.

Ben.




