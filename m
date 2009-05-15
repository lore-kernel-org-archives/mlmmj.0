From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Fri, 15 May 2009 12:14:28 +0000
Subject: Bug in mlmmj-maintd: notice on non-existing digests
Message-Id: <34372.172.16.32.1.1242389668.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hej,

after some time-eating server updating I stumbled over the fact, that
mlmmj-maintd doesn't honour the nodigestsub tunable. It tries to
resend digests even if there aren't any at all, omitting a notice
for every existing non-digestive list.

Mlmmj-maintd skips run_digests() only if noarchive is present. Can this
check extended to include nodigestsub as well?

Ciao
Chris

ps. Is it possible that nodigestsub is set and there is a static list
of digesters? If yes, then my easy solution described above will break
this case.
