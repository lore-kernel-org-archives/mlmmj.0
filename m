From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 30 Jul 2007 22:00:24 +0000
Subject: mlmmj-1.2.15 released
Message-Id: <8dd4cf3c878f4796dc98c2099e2ce817@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list,


mlmmj-1.2.15 is available for download:

465b01218c3834346ecc7b25a9d9208d
http://mlmmj.mmj.dk/files/mlmmj-1.2.15.tar.bz2

da0c43e8767fa9c5460305489f3a2337
http://mlmmj.mmj.dk/files/mlmmj-1.2.15.tar.gz


No changes have been made since 1.2.15-RC1.

The changes since 1.2.14:
o Added --enable-recieve-strip configure option (Ansgar Burchardt)
o Added unicode support to listtexts
o Fixed build outside the source directory (Ansgar Burchardt)
o Moved English listtexts and install all languages (Ansgar Burchardt)
o Fixed missing exit()s in case of failed execl() calls (Ansgar Burchardt)
o Changed Message-ID headers to include FQDN (Ansgar Burchardt)
o Added support for 'discard' keyword in access rules (Sascha Sommer)


Please note that the format of listtexts have changed. So, if you have
custom listtexts which contain non-USASCII characters, you should convert
them. It is easily done with the following one-liner:

perl -i -p -e 's/([\x80-\xff])/sprintf("\\u%04X",ord($1))/ge' /path/to/texts/* 

The distributions may wish to include a note about that (or the above perl
code) in upgrade packages.


Also the search for listtexts is changed to the following:
- LISTDIR/text/
- PREFIX/share/text.skel/default/
- PREFIX/share/text.skel/en/


Have fun!

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

