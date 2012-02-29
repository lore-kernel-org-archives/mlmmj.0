From: Thomas Goirand <thomas@goirand.fr>
Date: Wed, 29 Feb 2012 03:09:25 +0000
Subject: Re: [mlmmj] Subscribers management in php-admin
Message-Id: <4F4D96E5.9080009@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F4BFAA7.4060702@pub.positon.org>
In-Reply-To: <4F4BFAA7.4060702@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 02/28/2012 05:47 PM, Marc MAURICE wrote:
> I agree with you Thomas.
> I forgot the check because the interface is http auth restricted, but
> this is not not an excuse.
> 
> We should also fix the existing code in save.php.
> 
> Marc

Not only this. You should check for the variable validity, with a
regular expression like this one for example:
$reg = "/(^([a-zA-Z0-9])|^([a-zA-Z0-9]+)([._a-zA-Z0-9-]*))@
([a-z0-9]+)([-a-z0-9.]*)\.([a-z0-9-]*)([a-z0-9]+)\$/";

(note that you should remove the \n after the @)

but you should *also* use escapeshellarg():
http://www.php.net/manual/en/function.escapeshellarg.php



As for the save.php, I also found some very silly piece of code like
this one:
// Perl's encode_entities (to be able to use tunables.pl)
function encode_entities($str) { return htmlentities($str); }

I'd like someone to explain to me why htmlentities() has to be wrapped
like this... :)

Then, there's things like this which worries me:
fwrite($fp, $HTTP_POST_VARS[$name]);

Not only the variable should be checked, but also, if I'm not mistaking,
$HTTP_POST_VARS is deprecated, and maybe even *removed* (I didn't check)
from php 5.4, which is going to reach Debian SID in a mater of weeks now
(we should be using $_POST instead).

Functions like mlmmj_boolean() has parameters that it isn't using, so
it's weird.

So yes, all this needs a code review... :)

Thomas

