From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 30 May 2012 14:00:55 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18.0 released
Message-Id: <4FC62817.7060109@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4FC4D9CE.3010906@yahoo.com.au>
In-Reply-To: <4FC4D9CE.3010906@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Hey, that's just on time for Debian 7 (code name: Wheezy)! Thanks for
> that. I've updated the Debian packages today, and uploaded to SID, if
> everything goes well, it's going to be in Wheezy.

Excellent!

> I'm quite happy to see that I had to remove most of the Debian specific
> patches, as they were incorporated upstream (eg: on mlmmj original
> sources). Still, there are 2 patches remaining. I believe that this one
> could be somehow avoided:
>
> --- a/include/mlmmj.h	2012-01-22 15:36:11.000000000 +0800
> +++ b/include/mlmmj.h	2012-01-22 15:36:16.000000000 +0800
> @@ -88,7 +88,7 @@
>   #define CHECKFULLPATH(name) if(strchr(name, '/') = NULL) { \
>   			fprintf(stderr, "All mlmmj binaries have to " \
>   					"be invoked with full path,\n" \
> -					"e.g. /usr/local/bin/%s\n", name); \
> +					"e.g. /usr/bin/%s\n", name); \
>   			exit(EXIT_FAILURE); \
>   			};
>
> what do you think?

Yeah, that's really stupid. We should be able to get the prefix in a
macro in config.h if nothing else.

Could you possibly jump on the bug tracker at
http://mlmmj.org/bugs/report.php and add this as a bug, and upload the
patch (even though this patch doesn't fix the bug, it demonstrates and
localises the problem)? Then I should get around to it before the next
release if not before.

One day we might even fix things so you don't need to use the full path
to invoke the binaries. I certainly find it really annoying, and I don't
know any other application that requires it. You'd think we could figure
out what's going on from argv[0] or something.

> The other one is contrib/web/php-admin/htdocs/dot.htaccess:
>
> diff -u -r -N a/contrib/web/php-admin/htdocs/dot.htaccess
> b/contrib/web/php-admin/htdocs/dot.htaccess
> --- a/contrib/web/php-admin/htdocs/dot.htaccess	2012-01-22
> 15:40:16.000000000 +0800
> +++ b/contrib/web/php-admin/htdocs/dot.htaccess	2012-01-22
> 15:40:37.000000000 +0800
> @@ -1,4 +1,5 @@
>   Require valid-user
>   AuthType Basic
> -AuthName "mlmmj web-interface"
> -AuthUserFile /home/mlmmj/htpasswd
> +AuthName "mlmmj web-interface on Debian GNU/Linux"
> +AuthUserFile /etc/mlmmj-php-web-admin/htpasswd
> +php_value include_path "/usr/share/mlmmj-php-web-admin"
>
> I don't see how this one could be avoided, and I'm fine keeping it in
> the package.

Yeah, I agree. It's really an example file anyway. You just have a more
Debian-specific example. There will be no one-size-fits-all for this.

Ben.




