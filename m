From: Baptiste Daroussin <bapt@nours.eu>
Date: Mon, 15 May 2023 15:42:59 +0000
Subject: [mlmmj] MLMMJ 1.4.0 beta1
Message-Id: <c7wzjdlvdvb65ktjmj46g4acd4nsj3bewky4t5hvt5x3bf5jsg@3cvuyew6h4nx>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello everyone,

This is getting slower than I would like it to be but still progress is being
made!

This is the first "usable" version of the 1.4 series, it is still beta and
probably have plenty of bugs and even obvious bugs given the amount of
refactoring.

The test suite starts to be relevant.
This release has been tested on debian stable, archlinux, alpine and FreeBSD

Note the testsuite is known to be broken on Fedora due to a too old version of
libatf there.

In the beta compared to previous version:
- the contributed php code now runs on modern php (thanks Franky Van Liedekerke)
- manpage converted from man(7) to mdoc(7)
- Fix a potential crash with mail without separator between headers and body
- mlmmj-send: -l 6 has been removed
- mlmmj-send: accept file descriptor number as -s argument
- mlmmj-send: accept file descriptor number as -m argument
- cleanup .omit files leftover if moderated emails are rejected and
  notmetoo is set.
- remove many fork/exec
- reduce memory usage

I will now focus on stabilising the new code base, and extend more the
testsuite.

Partitioning support (requested by Gentoo people) will be worked on after the
relase, planned for 1.5
If I find time, I may merge the "always munge from" feature for 1.4.0

Please test and report issues.

https://codeberg.org/mlmmj/mlmmj

Best regards,
Bapt

