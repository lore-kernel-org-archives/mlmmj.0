From: Thomas Goirand <thomas@goirand.fr>
Date: Mon, 08 May 2006 08:29:22 +0000
Subject: Re: qmail+vpopmail support
Message-Id: <445F0162.8010502@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <20060503134628.GG5327@nachos.phaseit.com>
In-Reply-To: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Fabio Busatto wrote:
> Hi, I've tested patch-mlmmj-listcontrol_env with qmail, and
> I wrote a supplementary patch for it.
>
> The problem is that the patch works with the qmail standard
> installation, but quite all installations use vpopmail as
> virtual domain manager, and the patch doesn't work with it.
>   
Could you explain exactly WHY you need vpopmail? It's a very common 
mistake to think that Qmail don't handle virtual domains without it, but 
in fact IT DOES. Vpopmail does 2 things: 1/ doing that stupid virtual 
domain stuff which is not needed, and 2/ an alternative auth thing that 
is not needed as well when you see the number of alternative 
checkpassword binaries available. I really think that vpopmail survives 
only because many think it's needed, because of the bad advertising 
Inter7 is doing, which I think is a very silly stuff. I just hope that 
no MLMMJ patch will break my vpopmail-free configuration.
> The EXT environment variable infact contains the username
> section after the first delimiter, but with vpopmail we have
> a rewrite of the address like this:
>
> user@domain.tld -> domain.tld-user@domain.tld
>   
Under my configuration it's:
user@domain.tld -> domain-tld-user@domain.tld

In fact, it could be:
user@domain.tld -> what-ever-you-like-user@domain.tld

as Qmail permit it using the virtualdomains configuration file.
> So, EXT contains the username (and not the extension).
> The real extension is stored in the DEFAULT environment
> variable, in both qmail and vpopmail scenarios.
> But the problem is that DEFAULT is too common name to
> be sure that it contains really an extension, so the
> solution is to check for the value in DEFAULT, and to
> compare it with the value in the EXT environment
> variabile (qmail), or in the EXT2 environment variable
> (qmail+vpopmail). If it matches, we can assume that it
> contains an extension.
>   
I'm happy to learn that.
> +Prerequisites:
> +- qmail (and vpopmail) correctly installed
> +- mlmmj correctly installed
>   
Can it be used WITHOUT vpopmail? IMHO it shouldn't be REQUIRED.

> +WARNING: DO NOT USE 'preline' command in dot-qmail files, it will result in
> +mlmmj to not work properly!!!
>   
I DO use the preline in the binary I use, and it works !!! Here is my 
.qmail-default file content:

|preline -f /usr/bin/mlmmj-recieve -L 
/var/www/sites/dtc/gplhost.sg/lists/gplhost.sg_dtcdev

Kind regards,

    Thomas

