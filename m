From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 06 Jun 2004 22:35:15 +0000
Subject: mlmmj-0.6.0
Message-Id: <20040606223515.GC10614@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hey people,

I've just released 0.6.0. Major thing here is code cleanup and
performance. FILE* usage is completely gone, and mmap are used some more
places.

Feedback is as always appreciated :)

The latest ChangeLog:

0.6.0
 o Add several unlinks. No need to litter queue/ with useless files
 o Don't use moderation/queue for outgoing, just use queue/
 o Christoph Thiel pointed out that listaddress and moderators belong in
   control/ so move them there
 o Get rid of all FILE * instances and replace them with fd's
 o Also mmap the subscribers file when reading subcribers
 o Do an mmap of the mail to send once, instead of reading the mail for
   each mail to send
 o Rip out the ability to fork to make more than one connection to relayhos=
t.
   It turned out to not make any performance gain (tested with lists with
   more than 120000 subscribers), and thus only complicated things. [*]
   KISS won, so it's gone.
 o mlmmj-maint now handles resends and cleanup
 o Fixed interrupted fgets() in write_mailbody_from_file()
 o Fixed leak of subfile in mlmmj-send

And the relevant stuff from UPGRADE:

This applies to everyone using mlmmj > 0.5.2:

 Following directories have moved into the control/ directory since that
 is where they rightfully belong:

  =B7 listaddress
  =B7 moderators

 The following directory can be deleted:

  =B7 moderation/queue

 Start mlmmj-maintd

[*] As usual a big Thank You goes to Morten Poulsen for testing mlmmj
    with his big ass lists.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
