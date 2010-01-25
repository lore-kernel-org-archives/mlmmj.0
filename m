From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Mon, 25 Jan 2010 10:56:38 +0000
Subject: German translations (was: Re: mlmmj-1.2.17 released)
Message-Id: <6f2a2e22f41140549ba17e5c6fb22aa5.squirrel@130.83.185.211>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_20100125115638_38613"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


------=_20100125115638_38613
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 8bit

Hej,

On Sat, January 23, 2010 20:42, Morten Shearman Kirkegaard wrote:
[...]
> The following listtexts are missing. Could somebody translate them?
[...]

I translated the missing german texts and the new snippets -- attached.

[...]
>
> Also, the following changes were made to the English texts. Could you
> translate them to all the other languages?

[...]

Regards,
Christoph
------=_20100125115638_38613
Content-Type: text/x-diff; name="mlmmj-1.2.17_de-listtexts.diff"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="mlmmj-1.2.17_de-listtexts.diff"

diff -Nruad mlmmj-1.2.17/listtexts/de/listfaq mlmmj-1.2.17.mod/listtexts/de/listfaq
--- mlmmj-1.2.17/listtexts/de/listfaq	1970-01-01 01:00:00.000000000 +0100
+++ mlmmj-1.2.17.mod/listtexts/de/listfaq	2010-01-25 11:44:46.000000000 +0100
@@ -0,0 +1,4 @@
+Subject: FAQ - Frequently asked questions der Liste $listaddr$.
+
+Leider nicht verf\u00FCgbar.
+
diff -Nruad mlmmj-1.2.17/listtexts/de/listhelp mlmmj-1.2.17.mod/listtexts/de/listhelp
--- mlmmj-1.2.17/listtexts/de/listhelp	2008-10-30 21:06:23.000000000 +0100
+++ mlmmj-1.2.17.mod/listtexts/de/listhelp	2010-01-25 11:38:33.000000000 +0100
@@ -8,6 +8,16 @@
 
 $listunsubaddr$
 
+Um sich von der Digest-Version der Liste auszutragen, senden Sie eine
+Mail an:
+
+$digestunsubaddr$
+
+Um sich von der Nomail-Version der Liste auszutragen, senden Sie eine
+Mail an:
+
+$nomailunsubaddr$
+
 Um sich auf die Digest-Version auf die Liste einzutragen,
 senden Sie eine Mail an:
 
@@ -31,3 +41,4 @@
 Die Adresse des Verwalters dieser Liste ist:
 
 $listowner$
+
diff -Nruad mlmmj-1.2.17/listtexts/de/sub-deny-digest mlmmj-1.2.17.mod/listtexts/de/sub-deny-digest
--- mlmmj-1.2.17/listtexts/de/sub-deny-digest	1970-01-01 01:00:00.000000000 +0100
+++ mlmmj-1.2.17.mod/listtexts/de/sub-deny-digest	2010-01-25 11:46:28.000000000 +0100
@@ -0,0 +1,8 @@
+Subject: Eintragen zur Digest-Version von $listaddr$ nicht m\u00F6glich.
+
+Die Digest-Version der Mailingliste
+
+$listaddr$
+
+ist deaktiviert, somit wurde Ihre Eintragung abgelehnt.
+
diff -Nruad mlmmj-1.2.17/listtexts/de/sub-deny-nomail mlmmj-1.2.17.mod/listtexts/de/sub-deny-nomail
--- mlmmj-1.2.17/listtexts/de/sub-deny-nomail	1970-01-01 01:00:00.000000000 +0100
+++ mlmmj-1.2.17.mod/listtexts/de/sub-deny-nomail	2010-01-25 11:46:06.000000000 +0100
@@ -0,0 +1,8 @@
+Subject: Eintragen zur Nomail-Version von $listaddr$ nicht m\u00F6glich.
+
+Die Nomail-Version der Mailingliste
+
+$listaddr$
+
+ist deaktiviert, somit wurde Ihre Eintragung abgelehnt.
+
diff -Nruad mlmmj-1.2.17/listtexts/de/sub-subscribed mlmmj-1.2.17.mod/listtexts/de/sub-subscribed
--- mlmmj-1.2.17/listtexts/de/sub-subscribed	2008-10-30 21:06:24.000000000 +0100
+++ mlmmj-1.2.17.mod/listtexts/de/sub-subscribed	2010-01-25 11:47:34.000000000 +0100
@@ -1,4 +1,4 @@
-Subject: Bereits eingetragen auf $listaddr$
+Subject: Bereits auf $listaddr$ eingetragen.
 
 Hi, hier ist das mlmmj-Programm, das die Mailingliste
 
@@ -13,7 +13,17 @@
 
 $listunsubaddr$
 
-Um eine Hilfe zu erhalten, senden Sie eine Nachricht an:
+Um sich von der Digest-Version der Liste abzumelden, senden Sie eine
+Mail an:
+
+$digestunsubaddr$
+
+Um sich von der Nomail-Version der Liste abzumelden, senden Sie eine
+Mail an:
+
+$nomailunsubaddr$
+
+Um Hilfe zu erhalten, senden Sie eine Nachricht an:
 
 $helpaddr$
 
diff -Nruad mlmmj-1.2.17/listtexts/de/unsub-notsubscribed mlmmj-1.2.17.mod/listtexts/de/unsub-notsubscribed
--- mlmmj-1.2.17/listtexts/de/unsub-notsubscribed	2008-10-30 21:06:24.000000000 +0100
+++ mlmmj-1.2.17.mod/listtexts/de/unsub-notsubscribed	2010-01-25 11:46:57.000000000 +0100
@@ -1,4 +1,4 @@
-Subject: Nicht eingetragen auf $listaddr$
+Subject: Nicht auf $listaddr$ eingetragen.
 
 Hi, hier ist das mlmmj-Programm, das die Mailingliste 
 
@@ -9,6 +9,10 @@
 Sie sind nicht auf dieser Liste eingetragen, deshalb k\u00F6nnen Sie
 sich auch nicht austragen.
 
+Um sich aus der Digest-Version auszutragen, senden Sie eine Mail an:
+
+$digestunsubaddr$
+
 Um sich einzutragen, senden Sie eine Mail an:
 
 $listsubaddr$
------=_20100125115638_38613--


