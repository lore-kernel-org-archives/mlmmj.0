From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sun, 18 Nov 2007 19:06:25 +0000
Subject: Re: help
Message-Id: <47408D31.2030805@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <000001c82a13$92971820$0500a8c0@liomk23cfxd68z>
In-Reply-To: <000001c82a13$92971820$0500a8c0@liomk23cfxd68z>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

mattias wrote:
> I try to use mlmmj-php-web-admin
[...]
> Warning: fopen(../conf/tunables.pl) [
> function.fopen]:
> failed to open stream: No such file or directory in
> /var/www/mlmmj-php-web-admin/edit.php on line 117
[...]
> What are wrong?

Obviously the file tunables.pl is missing. You only copied the htdocs 
directory into your webroot, and left out (at least) the conf directory.

Please read the README for the web interface. It explains the 
installation procedure.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
