From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 19 May 2004 13:46:47 +0000
Subject: 0.5.1-RC
Message-Id: <20040519134647.GG92302@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey together,

I've made mlmmj-0.5.1-RC.tar.{gz,bz2} available for testing. The
relevant changelog:

0.5.1
 o Add a file TUNABLES which documents the ways to tune mlmmj lists.
 o Add support for Subject: prefix
 o Added WAITTIME (time to sleep before checking if we should spawn
   another mlmmj-send process) option in mlmmj.h
 o Fixed error handling in mlmmj-unsub if we can not open subscribers.d/

The reason for this quick release is that I know at least one member of
this list is awaiting the second changelog item from the top ;-)

Please test it.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
