From: Morten Shearman Kirkegaard <mopo@fabletech.com>
Date: Sun, 10 Jan 2010 11:50:38 +0000
Subject: Re: Injection also in contrib/web/php-user/mlmmj.php?
Message-Id: <1263124238.5330.67.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <87eilycr4q.fsf@marvin.43-1.org>
In-Reply-To: <87eilycr4q.fsf@marvin.43-1.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ansgar,

On Sun, 2010-01-10 at 16:28 +0900, Ansgar Burchardt wrote:
>    o Fixed injection in contrib/web/perl-user (Gerd von Egidy)
...
> But the same logic is present in the PHP script as well:
> 
>    $addheader .= "Cc: ".$this->email."\n";

As far as I can see, there is no injection here, because the
$this->email variable is protected by the is_email() function. But
Christoph Thiel is probably the guy to ask; He is the author of the
code.

It might still be a good idea to keep the two sets of code as much in
sync as possible, though.

> While looking at this, I saw the regular expression used to try to
> validate e-mail addresses in the PHP script:
> 
>    "^[a-z0-9\._-]+".chr(64)."+[a-z0-9\._-]+\.+[a-z]{2,4}$"
> 
> This does not allow a plus (+) in the local part which is permitted (and
> also used by mlmmj itself).  There are also TLDs that have more than
> four characters: .travel, .museum, not to begin with international TLDs
> like .xn--zckzah (which are just in testing for now).  The PHP script
> should *not* make (wrong) assumptions about what TLDs exist.

I fully agree. Would you be up for fixing this problem?


Morten

-- 
Morten Shearman Kirkegaard <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


