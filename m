From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 03 Nov 2008 20:24:24 +0000
Subject: Re: mlmmj-1.2.16-PRE2 released
Message-Id: <20081103202424.GR28005@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <1225668062.14901.42.camel@mopo-laptop>
In-Reply-To: <1225668062.14901.42.camel@mopo-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Chris Webb <chris@arachsys.com> [Nov 03. 2008 19:20]:
> "Morten K. Poulsen" <mopo@fabletech.com> writes:
>
> > Am I still missing something?
>
> For a long time now, I've done something clumsy along the lines of
>
>   find . -name '*recieve*' | while read F; do mv $F `sed 's/recieve/receive/g' <<< "$F"`; done
>   find . -name '*voodo*' | while read F; do mv $F `sed 's/voodo/voodoo/g' <<< "$F"`; done
>   find . -type f | while read F; do sed -e s/recieve/receive/g -e s/voodo/voodoo/g -i $F; done
>
> as part of my package build for mlmmj. It'd be nice to get these trivial
> spelling clean-ups upstream: how would you feel about a patch correcting the
> spelling of 'receive' and 'voodoo' through the code and filenames if I were
> to generate one?
>
> Of course, we could install a symlink from mlmmj-receive-strip to
> mlmmj-recieve-strip so nothing will break for people using the old,
> incorrectly spelled binary name.

If someone makes the autotools cope with installing a symlink, I'll make
a patch that warns in the logs something along the line of:

"You are using the old obsolete name for invoking mlmmj-recieve. Please
correct your invocation to use mlmmj-receive."

do-all-the-voodo-here is not a binary, so I couldn't care less about
that one.

--
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
