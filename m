From: Sascha Sommer <ssommer@suse.de>
Date: Mon, 05 Mar 2007 09:49:29 +0000
Subject: Re: [PATCH] mimestrip / mimereject
Message-Id: <200703051049.29799.ssommer@suse.de>
List-Id: <mlmmj.mlmmj.org>
References: <200702261335.13954.ssommer@suse.de>
In-Reply-To: <200702261335.13954.ssommer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

Thanks for your feedback.

On Saturday 03 March 2007 18:57, Morten K.Poulsen wrote:
> Hi Sascha,
>
> Welcome to this project!
>
> Sascha Sommer <ssommer@suse.de> wrote:
> > this is a first attempt to implement stripping and rejecting of
> > multipart/mime messages for mlmmj.
>
> As Jakob Hirsch replied, I'm not very fond of adding mime handling
> in mlmmj itself.
>

Ok. 

> I believe a better way of doing this would be for a seperate program
> to strip unwanted mime parts and/or add a header like
> X-ThisMailContainsEvilMimeParts (and later check for it in the mlmmj
> access rules) before handing the mail to mlmmj.
>
> If you move this code into a seperate program, I will be happy to
> include it in the contrib/ directory of the mlmmj tarballs.
>

So the seperate program should then more or less replace mlmmj-receive? Or 
should the preprocess program be called from within mlmmj?

Regards

Sascha

