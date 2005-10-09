From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 09 Oct 2005 15:12:04 +0000
Subject: [CFT] mlmmj-1.2.9-RC1
Message-Id: <20051009151204.GB17022@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

This have survived my own basic testing, but I would love for someone to
have a run with it as well. If I forgot to merge a patch that I said I
would, please resend.

Most notable is the fact that delimiter is configurable now, thanks to
Joel Aelwyn. Also to Filippo for working on this.

Also those who are running patched versions, please please download this
tar-ball and make sure your patches are folded in.

http://mlmmj.mmj.dk/files/mlmmj-1.2.9-RC1.tar.bz2
http://mlmmj.mmj.dk/files/mlmmj-1.2.9-RC1.tar.gz

The ChangeLog has it as usual:

 1.2.9
  o Make recipient delimiter configurable per list. SIC! (Joel Aelwyn)
  o Added italian list texts translation. A thanks to Andrea Barisani, he
    has checked italian texts. (Filippo F. Fadda)
  o Use is_subbed_in instead of find_subscriber when subscribing people
    (Christian Laursen)
  o Make it possible to confirm subscription even though it's a
    closedlist.  It makes sense to be able to confirm a request submitted
    by the sysadmin on the commandline
  o Add 'subonlyget' tunable which makes +get-N only work for subscribers

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
