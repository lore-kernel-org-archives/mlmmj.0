From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 22 Jan 2012 13:27:26 +0000
Subject: Re: [mlmmj] [patch] Remove bashism from src/mlmmj-make-ml.sh.in
Message-Id: <4F1C0EBE.6080703@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BC034.5060304@goirand.fr>
In-Reply-To: <4F1BC034.5060304@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 22/01/12 11:23 PM, Mark Alan wrote:
> On Sun, 22 Jan 2012 15:52:20 +0800, Thomas Goirand<thomas@goirand.fr>
> wrote:
>
>> -	echo -e "$0: invalid option\nTry $0 -h for more information."
>> +	echo "$0: invalid option"
>> +	echo "Try $0 -h for more information."
>
> Better yet, use a single command:
> -	echo -e "$0: invalid option\nTry $0 -h for more information."
> +	printf "$0: invalid option\nTry $0 -h for more information.\n"

Are you sure this is sh compatible?

I wonder if the echo version is perhaps more readable, and thus
preferable anyway, rather than single-command wizardry. What do you
think?

Ben.




