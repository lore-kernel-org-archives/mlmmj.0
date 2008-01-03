From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 03 Jan 2008 19:58:38 +0000
Subject: Re: feature request: archivedir setting
Message-Id: <20080103195838.GG1940@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
In-Reply-To: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Jan 03. 2008 20:21]:
> WRT the existing list a very simple for loop will help.

for i in /var/spool/mlmmj/* ; do
        mv $i/archive /path/to/newplace
        ln -s /path/to/newplace/`basename $i`/archive $/archive
done

Untested, but you get the idea.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
