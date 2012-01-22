From: Mark Alan <varia@e-healthexpert.org>
Date: Sun, 22 Jan 2012 12:23:51 +0000
Subject: Re: [mlmmj] [patch] Remove bashism from src/mlmmj-make-ml.sh.in
Message-Id: <20120122122351.7f72c040@e-healthexpert.org>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BC034.5060304@goirand.fr>
In-Reply-To: <4F1BC034.5060304@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 22 Jan 2012 15:52:20 +0800, Thomas Goirand <thomas@goirand.fr>
wrote:

> -	echo -e "$0: invalid option\nTry $0 -h for more information."
> +	echo "$0: invalid option"
> +	echo "Try $0 -h for more information."

Better yet, use a single command:
-	echo -e "$0: invalid option\nTry $0 -h for more information."
+	printf "$0: invalid option\nTry $0 -h for more information.\n"


M.

