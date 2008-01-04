From: Neale Pickett <neale@woozle.org>
Date: Fri, 04 Jan 2008 17:47:22 +0000
Subject: Re: feature request: archivedir setting
Message-Id: <w53myrlfpp1.fsf@fozzie.woozle.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <mlmmj.mlmmj.org>
References: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
In-Reply-To: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
To: mlmmj@mlmmj.org

--=-=-=

I've been using this instead of the shell script that comes with mlmmj.
Minor tweaks should render it capable of symlinking your archive
directory to wherever.

This has some other stuff that links in with my postfix
auto-list-grabber thing (also attached) and an mhonarc doohickey (not
attached but I can if people want).

Neale

--=-=-=
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=newlist
Content-Transfer-Encoding: base64

IyEgL2Jpbi9zaCAtZQoKZG9tYWluPXdvb3psZS5vcmcKCmxpc3Q9JDEKaWYgISBzaGlmdDsgdGhl
bgogIGVjaG8gIlVzYWdlOiAkMCBsaXN0bmFtZSBbb3duZXJdIgogIGV4aXQgMQpmaQoKb3duZXI9
JDEKaWYgISBzaGlmdDsgdGhlbgogIGVjaG8gLW4gIldobyBydW5zIHRoZSBsaXN0PyAiCiAgcmVh
ZCBvd25lcgpmaQoKZWNobyAiRW50ZXIgYSBzaG9ydCBkZXNjcmlwdGlvbiBvZiB0aGUgJGxpc3Qg
bGlzdCwgb3IganVzdCIKZWNobyAiaGl0IGVudGVyIGZvciBubyBkZXNjcmlwdGlvbjoiCmVjaG8g
LW4gImRlc2NyaXB0aW9uOiAiCnJlYWQgZGVzYwoKd2hpbGUgdHJ1ZTsgZG8KICBlY2hvIC1uICJB
cmNoaXZlIG1lc3NhZ2VzIG9uIHRoZSB3ZWIgKHkvbik/ICIKICByZWFkIGFyY2hpdmUKICBjYXNl
ICIkYXJjaGl2ZSIgaW4KICAgIFl8eSkKICAgICAgYXJjaGl2ZT1hcmNoaXZlCiAgICAgIGJyZWFr
CiAgICAgIDs7CiAgICBOfG4pCiAgICAgIHVuc2V0IGFyY2hpdmUKICAgICAgYnJlYWsKICAgICAg
OzsKICBlc2FjCmRvbmUKCmJhc2U9L3Zhci9zcG9vbC9tbG1tai8kbGlzdApta2RpciAkYmFzZQoK
ZWNobyAiQ29weWluZyBza2VsZXRvbi4uLiIKKGNkIC9ldGMvbWxtbWovc2tlbGV0b24gJiYgdGFy
IGNmIC0gLikgfCAoY2QgJGJhc2UgJiYgdGFyIHhtZiAtKQpjaG93biAtUiBsaXN0Omxpc3QgJGJh
c2UKCmVjaG8gIlBlcmZvcm1pbmcgY29udHJvbCBmaWxlIHN1YnN0aXR1dGlvbnMuLi4iCiMgRG8g
c3Vic3RpdHV0aW9ucwpjZCAvZXRjL21sbW1qL3NrZWxldG9uL2NvbnRyb2wKZm9yIGkgaW4gKjsg
ZG8KICBtNCAtRExJU1Q9JGxpc3QgLURPV05FUj0iJG93bmVyIiAtRERPTUFJTj0iJGRvbWFpbiIg
LURTSE9SVERFU0M9IiRkZXNjIiAtREFSQ0hJVkU9IiRhcmNoaXZlIiAkaSA+ICRiYXNlL2NvbnRy
b2wvJGkKZG9uZQoKaWYgWyAtbiAiJGFyY2hpdmUiIF07IHRoZW4KICB0b3VjaCAkYmFzZS9jb250
cm9sL2FyY2hpdmUKZmkKCmVjaG8gIlJlYnVpbGRpbmcgcG9zdGZpeCBpbmRpY2VzLi4uIgptYWtl
IC1DIC9ldGMvcG9zdGZpeAoKZWNobyAiQWxsIGRvbmUuIgplY2hvCmVjaG8gIllvdSBtYXkgd2Fu
dCB0byBwb2tlIGFyb3VuZCBpbiAkYmFzZS9jb250cm9sLiIKZWNobyAiU2VlIC91c3Ivc2hhcmUv
ZG9jL21sbW1qL1RVTkFCTEVTLmd6IGZvciBtb3JlIGluZm9ybWF0aW9uLiIKCg==
--=-=-=
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=mlmmj.m4

#
# mlmmj mail list alias doohickies
#
#
# Unless you are editing a file ending with .m4, your changes will be lost.
# This means you, Matt.
#
esyscmd(`
for i in /var/spool/mlmmj/*/; do
  ml=$(basename $i)
  echo "$ml     \"|/usr/bin/mlmmj-recieve -L $i\""
done
')

--=-=-=--
