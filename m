From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Sun, 17 Jun 2007 21:24:00 +0000
Subject: mlmmj-1.2.15-RC1 released
Message-Id: <0eaaeca0580d3b98edaa72c7e0da0d10@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list,


mlmmj-1.2.15-RC1 is available for download:

035567e40129a7931c3e510d1271b9a4
http://mlmmj.mmj.dk/files/mlmmj-1.2.15-RC1.tar.bz2

ae075b07302f267e32e530a2a775125a
http://mlmmj.mmj.dk/files/mlmmj-1.2.15-RC1.tar.gz


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


Also the search for listtexts is changed to the following:
- LISTDIR/text/
- PREFIX/share/text.skel/default/
- PREFIX/share/text.skel/en/


Please test and send feedback!

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

