From: =?UTF-8?B?TWFkcyBNYXJ0aW4gSsO4cmdlbnNlbg==?= <mmj@mmj.dk>
Date: Wed, 30 May 2012 13:45:04 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18.0 released
Message-Id: <4FC62460.1050602@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4FC4D9CE.3010906@yahoo.com.au>
In-Reply-To: <4FC4D9CE.3010906@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 30/05/12 15.30, Thomas Goirand wrote:
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
> -					"e.g./usr/local/bin/%s\n", name); \
> +					"e.g./usr/bin/%s\n", name); \
>   			exit(EXIT_FAILURE); \
>   			};

The auto-* macros should substitute this to always Say The Right Thing[tm].

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.

