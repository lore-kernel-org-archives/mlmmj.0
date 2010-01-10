From: "Gerd v. Egidy" <lists@egidy.de>
Date: Sun, 10 Jan 2010 14:29:05 +0000
Subject: Re: Injection also in contrib/web/php-user/mlmmj.php?
Message-Id: <201001101529.05102.lists@egidy.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_xQeSLptAxqZdeYz"
List-Id: <mlmmj.mlmmj.org>
References: <87eilycr4q.fsf@marvin.43-1.org>
In-Reply-To: <87eilycr4q.fsf@marvin.43-1.org>
To: mlmmj@mlmmj.org

--Boundary-00=_xQeSLptAxqZdeYz
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

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

Good catch. Since the use is the same I think it we should use the same regex 
for perl and php. And then verify once if it fits all valid mail addrs.

The attached patch uses the same regex for php as I introduced for perl with 
1.2.16. Please have a deep look at it.

Kind regards,

Gerd

--Boundary-00=_xQeSLptAxqZdeYz
Content-Type: text/x-patch;
  charset="UTF-8";
  name="mlmmj-1.2.17-RC2-php-regex.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-1.2.17-RC2-php-regex.patch"

diff -r -u mlmmj-1.2.17-RC2.orig/contrib/web/php-user/mlmmj.php mlmmj-1.2.17-RC2/contrib/web/php-user/mlmmj.php
--- mlmmj-1.2.17-RC2.orig/contrib/web/php-user/mlmmj.php	2008-10-30 21:06:16.000000000 +0100
+++ mlmmj-1.2.17-RC2/contrib/web/php-user/mlmmj.php	2010-01-10 15:19:50.000000000 +0100
@@ -37,7 +37,7 @@
 
     function is_email($string="") 
 	{
-	    if (eregi("^[a-z0-9\._-]+".chr(64)."+[a-z0-9\._-]+\.+[a-z]{2,4}$", $string)) 
+	    if (preg_match("/^[-!#$%&\'*+\.\/0-9=?A-Z^_a-z{|}~]+@[-0-9A-Za-z]+\.[-\.0-9A-Za-z]+$/", $string))
 	    { 
 		return TRUE; 
 	    }

--Boundary-00=_xQeSLptAxqZdeYz--

