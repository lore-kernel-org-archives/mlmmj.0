From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 08 Mar 2011 21:03:50 +0000
Subject: Re: [mlmmj] Fwd: Bug#617242: mlmmj-make-ml does not ensure correct
Message-Id: <4D7699B6.2070700@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4D7513EB.7090407@goirand.fr>
In-Reply-To: <4D7513EB.7090407@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> Any objections or other feature requests for mlmmj-make-ml? (Telling me this is
>> a dumb idea is perfectly fine!)
>
> Removing the .sh from the original distribution would be welcome: adding
> .sh to a shell script is forbidden in Debian, and having different
> naming schemes across various Unixes is an issue for a software that
> uses MLMMJ and is cross-unix (but I already extensively discussed the
> issue, others pointed out that for backward compatibility, MLMMJ should
> create symlinks).

This has already been done in version control. Speaking of which, yeah,
patches against the current revision in VC would be easier for me to
apply than patches against the release, of course. Hg changeset patches
even easier, or an Hg or Git repo I can pull from.

All the ideas discussed around this feature are sounding good to me.

Cheers,

Ben.



>> But what is most sensible?
>>
>> - chown to the list owner and chmod 0[67]00 and do nothing about groups?
>> - chown to the list owner, chgrp to the mail system user, and chmod
>> 0[67][67]0?
>
> I think it's fine not to do chown (the calling user should own the
> folders, and you aren't always calling it when being root, so chown wont
> work), but it is important to do chmod.
>
>> - prompt the user about it?
>
> Please don't (unless something like --interactive-please is used, which
> would be btw a good option)! :)

