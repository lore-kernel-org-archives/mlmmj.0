From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 18 Jan 2005 07:59:39 +0000
Subject: Re: feature request: DIR/Log
Message-Id: <20050118075939.GF59584@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Kurt Lieber <klieber@gentoo.org> [Nov 16. 2004 15:28]:
> One feature of ezmlm that i'd really like to see implemented in mlmmj is
> the logging feature.  (DIR/Log)

It took a while, but here we go. 1.2.0-RC2 will have similar to the
following logging in DIR/mlmmj.operation.log:

 # tail -f mlmmj.operation.log 
 Tue Jan 18 08:43:43 2005 mlmmj-sub: request for regular subscription from mmj@panther.mmj.dk
 Tue Jan 18 08:44:55 2005 mlmmj-sub: mmj@panther.mmj.dk confirmed subscription to regular list
 Tue Jan 18 08:44:55 2005 mlmmj-recieve: sending mail from mlmmj-test+bounces-help@mmj.dk to owner
 Tue Jan 18 08:45:24 2005 mmj@panther.mmj.dk requested help

It might be more verbose than ezmlm, but I thought 'human readable' log
entries was preferred. Comments of course welcome.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
