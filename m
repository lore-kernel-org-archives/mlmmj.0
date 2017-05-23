From: Geert Stappers <stappers@stappers.nl>
Date: Tue, 23 May 2017 09:53:21 +0000
Subject: Re: [mlmmj] [PATCH 1/2] src/mlmmj-make-ml.in: replaced some 'exit 0' with empty statement
Message-Id: <20170523095321.GZ32244@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <1494519763-1307-1-git-send-email-stappers@stappers.nl>
In-Reply-To: <1494519763-1307-1-git-send-email-stappers@stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, May 11, 2017 at 06:22:42PM +0200, Geert Stappers wrote:
> Some early exits by 'exit 0' are better of with no exit,
> with just an empty statement.
> ---
>  src/mlmmj-make-ml.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/src/mlmmj-make-ml.in b/src/mlmmj-make-ml.in
> index a6e10a3..c93084f 100755
> --- a/src/mlmmj-make-ml.in
> +++ b/src/mlmmj-make-ml.in
> @@ -146,7 +146,7 @@ if [ -n "$A_CREATE" ]; then
>  		echo "$ALIAS" >> $ALIASFILE
>  		;;
>  		n|N)
> -		exit 0
> +			: # empty statement
>  		;;
>  		*)
>  		echo "Options was: y, Y, n or N"
> @@ -166,7 +166,7 @@ if [ "$DO_CHOWN" ] ; then
>  			chown -R $CHOWN $SPOOLDIR/$LISTNAME
>  		;;
>  		n|N)
> -			exit 0
> +			: # empty statement
>  		;;
>  		*)
>  			echo "option is: y, Y, n, N"
> -- 
> 2.11.0
> 
> 
> 

Who cares?



Groeten
Geert Stappers
-- 
Leven en laten leven

