From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 22 Jan 2012 13:56:53 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F1C15A5.50202@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi, Thomas,

Thanks for this. I have a few issues/questions.

1. This doesn't apply cleanly to current sources in version control.
Would you be able to provide a patch that does? I can probably resolve
the clashes OK, but I know little about groff, so I'm not sure if other
man-page changes/additions might also require fixing, so it'd be better
if someone who knows more what they're doing could look at it.

2. My system (Mac OS X) doesn't like the UTF-8 encoding. The existing
Latin-1 encoding works for me (in fact, the =F8 is replaced by just an o
for me automagically somewhere). I guess this is locale-related. This
means we need to figure out how to do an encoding conversion appropriate
to the host system as part of the build/install process, or find a groff
directive that makes it interpret the file as a particular encoding, or
something, rather than just change the encoding. I'm happy to change the
encoding to UTF-8 if we can figure out how to make all systems interpret
the files properly. Any ideas?

3. Could we keep the separate issues in separate patches? If the
encoding change is in one patch, the hyphen issue in another, and the
content changes in another, that'd be nice (and I can then easily apply
any that have no issues while continuing to discuss any that do).

Cheers, and thanks again,

Ben.



On 22/01/12 8:08 PM, Thomas Goirand wrote:
> Hi,
>
> Please also apply these man page fixes. I'm currently adding this patch
> in the Debian packaging to reduce lintian warnings which are quite
> annoying me when working on MLMMJ: too many warnings, and I wont see
> anything... By the way, hyphen-as-minus use are breaking groff
> indentation, so it's a good thing to fix them.
>
> Cheers,
>
> Thomas Goirand (zigo)

