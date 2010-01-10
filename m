From: Ansgar Burchardt <ansgar@43-1.org>
Date: Sun, 10 Jan 2010 07:28:41 +0000
Subject: Injection also in contrib/web/php-user/mlmmj.php?
Message-Id: <87eilycr4q.fsf@marvin.43-1.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

the changelog for mlmmj 1.2.16 contains the entry

   o Fixed injection in contrib/web/perl-user (Gerd von Egidy)

and removed the line

   -               . "Cc: $from\n"

from contrib/web/perl-user/mlmmj.cgi.  But the same logic is present
in the PHP script as well:

   $addheader .= "Cc: ".$this->email."\n";

This should probably be removed for the same reasons.

While looking at this, I saw the regular expression used to try to
validate e-mail addresses in the PHP script:

   "^[a-z0-9\._-]+".chr(64)."+[a-z0-9\._-]+\.+[a-z]{2,4}$"

This does not allow a plus (+) in the local part which is permitted (and
also used by mlmmj itself).  There are also TLDs that have more than
four characters: .travel, .museum, not to begin with international TLDs
like .xn--zckzah (which are just in testing for now).  The PHP script
should *not* make (wrong) assumptions about what TLDs exist.

Regards,
Ansgar

PS: Please CC me on replies.

