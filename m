From: Ulrich Mueller <ulm@kph.uni-mainz.de>
Date: Wed, 14 Mar 2007 18:50:34 +0000
Subject: Digest format lacks line break before boundary lines
Message-Id: <17912.17402.917135.795821@a1ihome1.kph.uni-mainz.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

the format of mailing list digests created by mlmmj seems to lack a
line break before the boundary delimiter lines.

There should be _two_ line breaks preceding the boundary lines,
however, there is only one. I cite from RFC 2046, section 5.1.1.
"Common Syntax":

# NOTE: The CRLF preceding the boundary delimiter line is conceptually
# attached to the boundary so that it is possible to have a part that
# does not end with a CRLF (line break). Body parts that must be
# considered to end with line breaks, therefore, must have two CRLFs
# preceding the boundary delimiter line, the first of which is part of
# the preceding body part, and the second of which is part of the
# encapsulation boundary.

This is a long-standing problem with the Gentoo mailing lists, see
Gentoo bug #108286 <http://bugs.gentoo.org/show_bug.cgi?id8286>
for further explanation and for examples.

Ulrich
