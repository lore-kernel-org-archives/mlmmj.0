From: Uffe Jakobsen <uffe@uffe.org>
Date: Thu, 03 Feb 2005 14:30:54 +0000
Subject: Corrections to mlmmj-1.2.2
Message-Id: <4202359E.7030404@uffe.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi,

Using Fedore Core 2 and the new mlmmj-1.2.2 I've tried to follow your README in order to establish the mlmmj-test list (for evaluation pusposes)

I've found the following corrections to your README document and sources:

"/etc/aliases": in order to support arguments to the proc alias the command needs to be enclosed in quotes like this:

mlmmj-test:     |"/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"


Somewhere along the road /usr/local/bin/mlmmj-recieve or some other binary called by mlmmj-recieve logs this message:
log_oper.c:71: Could not open /var/spool/mlmmj/mlmmj-testmlmmj.operation.log: Permission denied

I found out that the problem var related to a missing (final) '/' in the arguments to mlmmj-recieve.

This will provoke the error: /usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test

Introducing a last '/' will fix the error: /usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/

I guess that you've forgot to postpend a '/' between the listdir and the file name for the logfile.


Suggestion the README document does not mention anything about how to build the mlmmj-project.
Maybe it was an idea just to mention that in order to build/install mlmmj the user have to run "./configure" followed by "make" and "make install"... ?

Anyway mlmmj have passed the first hours of my evaluation - it looks as a very promising alternativ to ezmlm/ezmlm-idx !!! :-)

Kind regards Uffe Jakobsen


