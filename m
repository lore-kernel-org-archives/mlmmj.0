From: Stefan Reinauer <stepan@openbios.org>
Date: Wed, 06 Sep 2006 18:22:37 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <20060906182237.GA12003@coresystems.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="pf9I7BMVVzbSWLtt"
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
To: mlmmj@mlmmj.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Monday, September 04, 2006 at 21:42:08, Morten K.Poulsen wrote:

> If your patch is not included, please re-send it.

Please add the following two patches as well:

  * mlmmj-1.2.12-RC1-fix-german.diff

    This applies fixes to all German list texts. No idea if someone 
    is really using them, but they had terribly many typos, comma
    mistakes and sounded really rough. No guarantees, there are for
    sure more typos, but it is a little less awkward like with this
    patch applied.

  * mlmmj-1.2.12-RC1-fix-english.diff
    
    "throught" is not an english word. Maybe this was confused with
    "trout" ? ;-)

    Please, please, don't send mails to users with "If you are admin
    of this list". If you are admin of the list, you are supposed to
    read the manual, not grep in user mails. 

Best regards,
Stefan

-- 
coresystems GmbH • Brahmsstr. 16 • D-79104 Freiburg i. Br.
      Tel.: +49 761 7668825 • Fax: +49 761 7664613
Email: info@coresystems.de  • http://www.coresystems.de/

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-1.2.12-RC1-fix-english.diff"

diff -ur mlmmj-1.2.12-RC1.orig/listtexts/digest mlmmj-1.2.12-RC1/listtexts/digest
--- mlmmj-1.2.12-RC1.orig/listtexts/digest	2006-09-02 23:14:08.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/digest	2006-09-06 19:29:52.000000000 +0200
@@ -1,5 +1,5 @@
 Subject: Digest of $listaddr$ issue $digestissue$ ($digestinterval$)
 
-Topics (messages $digestfirst$ throught $digestlast$):
+Topics (messages $digestfirst$ through $digestlast$):
 
 $digestthreads$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/notintocc mlmmj-1.2.12-RC1/listtexts/notintocc
--- mlmmj-1.2.12-RC1.orig/listtexts/notintocc	2005-04-09 17:10:23.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/notintocc	2006-09-06 19:08:47.000000000 +0200
@@ -10,8 +10,5 @@
 In order to post to this list, the list address must be contained
 in either the To: or Cc: header.
 
-If you are an admin of an mlmmj driven list, you should know that this
-behaviour can be changed by touching the list control file 'tocc'.
-
 Thanks.
 

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset="utf-8"
Content-Disposition: attachment; filename="mlmmj-1.2.12-RC1-fix-german.diff"
Content-Transfer-Encoding: 8bit

diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/access mlmmj-1.2.12-RC1/listtexts/de/access
--- mlmmj-1.2.12-RC1.orig/listtexts/de/access	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/access	2006-09-06 19:19:28.000000000 +0200
@@ -1,11 +1,12 @@
 Subject: Beitrag zur Liste $listaddr$ abgelehnt
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Tut mir leid aber Ihre Mail konnte nicht versandt werden. Ein Filter
-den der Administrator dieser Liste aufgesetzt hat traf auf Ihre Mail
-zu.
+Tut mir leid, aber Ihre Mail konnte nicht versendet werden. Ein 
+Filter, den der Administrator dieser Liste aufgesetzt hat, traf 
+auf Ihre Mail zu.
+
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/bounce-probe mlmmj-1.2.12-RC1/listtexts/de/bounce-probe
--- mlmmj-1.2.12-RC1.orig/listtexts/de/bounce-probe	2006-09-04 00:29:46.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/de/bounce-probe	2006-09-06 19:27:40.000000000 +0200
@@ -1,14 +1,16 @@
-Subject: Messages from $listaddr$ to you have been bouncing
+Subject: Nachrichten an Sie von $listaddr$ konnten nicht zugestellt werden
 
-Hi, this is the mlmmj program managing the mailinglist
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
-Some messages to you could not be delivered. If you're seeing this
-message it means things are back to normal, and it's merely for your
-information.
+verwaltet.
 
-Here is the list of the bounced messages:
+Einige Nachrichten an Sie konnten nicht zugestellt werden. Wenn Sie
+diese Nachricht lesen, funktioniert die Zustellung wieder, und diese
+Nachricht dient lediglich Ihrer Information.
+
+Hier die Liste der nicht zugestellten Nachrichten:
 
 $bouncenumbers$
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/digest mlmmj-1.2.12-RC1/listtexts/de/digest
--- mlmmj-1.2.12-RC1.orig/listtexts/de/digest	2006-09-04 00:29:46.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/de/digest	2006-09-06 19:29:57.000000000 +0200
@@ -1,5 +1,5 @@
-Subject: Digest of $listaddr$ issue $digestissue$ ($digestinterval$)
+Subject: Übersicht $listaddr$ Ausgabe $digestissue$ ($digestinterval$)
 
-Topics (messages $digestfirst$ throught $digestlast$):
+Themen (Nachrichten $digestfirst$ bis $digestlast$):
 
 $digestthreads$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/listhelp mlmmj-1.2.12-RC1/listtexts/de/listhelp
--- mlmmj-1.2.12-RC1.orig/listtexts/de/listhelp	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/listhelp	2006-09-06 19:31:36.000000000 +0200
@@ -4,26 +4,26 @@
 
 Die folgenden Kommandos sind verf�gbar:
 
-Um sich auszutragen senden Sie eine Mail an:
+Um sich auszutragen, senden Sie eine Mail an:
 
 $listunsubaddr$
 
-Um sich auf die Digest Version auf die Liste einzutragen
+Um sich auf die Digest-Version auf die Liste einzutragen,
 senden Sie eine Mail an:
 
 $digestsubaddr$
 
-Um sich auf die Nomail Version auf die Liste einzutragen
+Um sich auf die Nomail-Version auf die Liste einzutragen,
 senden Sie eine Mail an:
 
 $nomailsubaddr$
 
-Wenn Sie sich auf die Nomail Version eintragen empfangen Sie keine
-Nachrichten von der Liste sind aber trotzdem eingetragen. Dies ist
-sinnvoll wenn Sie von mehreren Adressen Beitr�ge auf die Liste 
+Wenn Sie sich auf die Nomail-Version eintragen, empfangen Sie keine
+Nachrichten von der Liste, sind aber trotzdem eingetragen. Dies ist
+sinnvoll, wenn Sie von mehreren Adressen aus Beitr�ge auf die Liste 
 schicken m�chten.
 
-Um die Nachricht mit der Archivnummer N zu erhalten senden Sie eine
+Um die Nachricht mit der Archivnummer N zu erhalten, senden Sie eine
 Mail an:
 
 $listgetN$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/listsubs mlmmj-1.2.12-RC1/listtexts/de/listsubs
--- mlmmj-1.2.12-RC1.orig/listtexts/de/listsubs	2005-04-26 12:13:25.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/de/listsubs	2006-09-06 19:32:08.000000000 +0200
@@ -1,11 +1,11 @@
 Subject: Liste der Abonnenten von $listaddr$
 
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Folgendes ist die Liste der Abonnenten:
+Dies ist die Liste der Abonnenten:
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/moderation mlmmj-1.2.12-RC1/listtexts/de/moderation
--- mlmmj-1.2.12-RC1.orig/listtexts/de/moderation	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/moderation	2006-09-06 19:34:42.000000000 +0200
@@ -2,24 +2,24 @@
 
 Hallo,
 
-Jemand hat eine Nachricht die Moderation ben�tigt an
+jemand hat eine Nachricht, welche moderiert werden muss, an
 
 $listaddr$
 
 geschickt.
 
-Um die Nachricht zu akzeptieren schicken Sie eine Mail an:
+Um die Nachricht zu akzeptieren, schicken Sie eine Mail an:
 
 $moderateaddr$
 
-Ihr Mailprogramm benutzt diese Adresse warscheinlich von selber wenn Sie
-die Antworten funktion benutzen.  
-Wenn Sie die Machricht nicht akzeptieren m�chten ignorieren sie einfach
-diese Mail.
+Ihr Mailprogramm verwendet diese Adresse vermutlich automatisch, wenn 
+Sie die Antworten-Funktion benutzen.
 
-die folgenden Moderatoren haben dies Mail erhalten:
+Wenn Sie die Nachricht nicht akzeptieren m�chten, ignorieren sie diese 
+Mail einfach.
+
+Die folgenden Moderatoren haben diese Mail erhalten:
 
 $moderators$
 
---- unterhalb dieser Linie sehen Sie die ersten 100 Zeilen der Nachricht
-die Moderation erfordert. --->
+--- Unterhalb dieser Linie sehen Sie die ersten 100 Zeilen der Nachricht, welche moderiert werden muss. --->
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/notifysub mlmmj-1.2.12-RC1/listtexts/de/notifysub
--- mlmmj-1.2.12-RC1.orig/listtexts/de/notifysub	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/notifysub	2006-09-06 19:35:02.000000000 +0200
@@ -1,12 +1,12 @@
 Subject: $newsub$ eingetragen auf $listaddr$
 
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Die folgende Adresse wurde gerade auf die Mailingliste eingetragen.
+Die folgende Adresse wurde gerade auf die Mailingliste eingetragen:
 
 $newsub$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/notifysub-digest mlmmj-1.2.12-RC1/listtexts/de/notifysub-digest
--- mlmmj-1.2.12-RC1.orig/listtexts/de/notifysub-digest	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/notifysub-digest	2006-09-06 19:35:32.000000000 +0200
@@ -1,12 +1,12 @@
-Subject: $newsub$ eingetragen auf die Digest Version von $listaddr$ 
+Subject: $newsub$ eingetragen auf die Digest-Version von $listaddr$ 
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Die folgende Adresse wurde gerade auf die Digest Version der
-Mailingliste eingetragen. 
+Die folgende Adresse wurde gerade auf die Digest-Version der
+Mailingliste eingetragen: 
 
 $newsub$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/notifysub-nomail mlmmj-1.2.12-RC1/listtexts/de/notifysub-nomail
--- mlmmj-1.2.12-RC1.orig/listtexts/de/notifysub-nomail	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/notifysub-nomail	2006-09-06 19:35:52.000000000 +0200
@@ -1,12 +1,12 @@
-Subject: $newsub$ eingetragen auf die nomail Version von $listaddr$ 
+Subject: $newsub$ eingetragen auf die nomail-Version von $listaddr$ 
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
 Die folgende Adresse wurde gerade auf die nomail Version der
-Mailingliste eingetragen. 
+Mailingliste eingetragen:
 
 $newsub$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/notifyunsub mlmmj-1.2.12-RC1/listtexts/de/notifyunsub
--- mlmmj-1.2.12-RC1.orig/listtexts/de/notifyunsub	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/notifyunsub	2006-09-06 19:36:06.000000000 +0200
@@ -1,6 +1,6 @@
 Subject: $oldsub$ ausgetragen aus $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/notifyunsub-digest mlmmj-1.2.12-RC1/listtexts/de/notifyunsub-digest
--- mlmmj-1.2.12-RC1.orig/listtexts/de/notifyunsub-digest	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/notifyunsub-digest	2006-09-06 19:36:24.000000000 +0200
@@ -1,12 +1,12 @@
 Subject: $oldsub$ ausgetragen aus der Digest Version von $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
 Die folgende Adresse wurde gerade aus der Digest Version der
-Mailingliste ausgetragen.
+Mailingliste ausgetragen:
 
 $oldsub$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/notifyunsub-nomail mlmmj-1.2.12-RC1/listtexts/de/notifyunsub-nomail
--- mlmmj-1.2.12-RC1.orig/listtexts/de/notifyunsub-nomail	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/notifyunsub-nomail	2006-09-06 19:36:58.000000000 +0200
@@ -1,12 +1,12 @@
-Subject: $oldsub$ ausgetragen aus der Nomail Version von $listaddr$
+Subject: $oldsub$ ausgetragen aus der Nomail-Version von $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Die folgende Adresse wurde gerade aus der Nomail Version der
-Mailingliste ausgetragen.
+Die folgende Adresse wurde gerade aus der Nomail-Version der
+Mailingliste ausgetragen:
 
 $oldsub$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/notintocc mlmmj-1.2.12-RC1/listtexts/de/notintocc
--- mlmmj-1.2.12-RC1.orig/listtexts/de/notintocc	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/notintocc	2006-09-06 19:37:14.000000000 +0200
@@ -1,19 +1,16 @@
 Subject: Nachricht an $listaddr$ abgelehnt
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Es tut mir leid aber Ihre Nachricht konnte nicht ant die Liste zugestellt
+Es tut mir leid, aber Ihre Nachricht konnte nicht an die Liste zugestellt
 werden.
 
-Um auf die liste zu posten muss die Adresse der Liste entweder im 
-To: oder im Cc: Feld eingetragen sein.
-
-Wenn Sie ein Admin einer mlmmj liste sind sollten Sie wissen das dieses
-Verhalten in dem control file 'tocc' ver�ndert werden kann.
+Um auf die Liste zu posten, muss die Adresse der Liste entweder im 
+To: oder im Cc: Feld der Mail eingetragen sein.
 
 Danke.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/sub-confirm mlmmj-1.2.12-RC1/listtexts/de/sub-confirm
--- mlmmj-1.2.12-RC1.orig/listtexts/de/sub-confirm	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/sub-confirm	2006-09-06 19:41:14.000000000 +0200
@@ -1,26 +1,27 @@
-Subject: Best�tigen Sie bitte das eintragen auf die Liste $listaddr$
+Subject: Best�tigen Sie bitte das Eintragen auf die Liste $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Um zu best�tigen das Sie die Adresse
+Um zu best�tigen, dass Sie die Adresse
 
 $subaddr$
 
-auf die Liste eintragen wollen senden Sie bitte eine
-Best�tigung an folgende Adresse:
+auf die Liste eintragen wollen, senden Sie bitte eine
+Antwortmail an folgende Adresse:
 
 $confaddr$
 
-Diese Best�tigung erf�llt zwei zwecke. Wenn Sie diese Mail erhalten haben
-kann die Liste Nachrichten an Sie zustellen und zweitens wird sichergestellt
-das niemand diese Adresse auf eine Liste eintr�gt ohne das Sie dies m�chten.
+Diese Best�tigung erf�llt zwei Zwecke. Wenn Sie diese Mail erhalten
+haben, kann die Liste Nachrichten an Sie zustellen. Zweitens wird
+sichergestellt, dass niemand diese Adresse auf eine Liste eintr�gt, ohne
+dass Sie dies m�chten.
 
-Ihr Mail-Programm sollte wenn Sie die Antworten Funktion benutzen automatisch
-eine Mail an die Best�tigungsadresse schicken.
+Ihr Mail-Programm sollte, wenn Sie die Antworten-Funktion benutzen,
+automatisch eine Mail an die Best�tigungsadresse schicken.
 
-Das Subject und der Text spielen bei dieser Mail keine Rolle.
+Der Betreff und der Text spielen bei dieser Mail keine Rolle.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/sub-confirm-digest mlmmj-1.2.12-RC1/listtexts/de/sub-confirm-digest
--- mlmmj-1.2.12-RC1.orig/listtexts/de/sub-confirm-digest	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/sub-confirm-digest	2006-09-06 19:43:17.000000000 +0200
@@ -1,26 +1,27 @@
-Subject: Best�tigen Sie bitte das eintragen auf die Digest Version der Liste $listaddr$
+Subject: Best�tigen Sie bitte das Eintragen auf die Digest-Version der Liste $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Um zu best�tigen das Sie die Adresse 
+Um zu best�tigen, das Sie die Adresse 
 
 $subaddr$
 
-auf die Digest Version der Mailingliste eintragen wollen senden
-Sie bitte eine Best�tigung an folgende Adresse:
+auf die Digest-Version der Mailingliste eintragen wollen, senden
+Sie bitte eine Antwortmail an folgende Adresse:
 
 $confaddr$
 
-Diese Best�tigung erf�llt zwei zwecke. Wenn Sie diese Mail erhalten haben
-kann die Liste Nachrichten an Sie zustellen und zweitens wird sichergestellt
-das niemand diese Adresse auf eine Liste eintr�gt ohne das Sie dies m�chten.
+Diese Best�tigung erf�llt zwei Zwecke: Wenn Sie diese Mail erhalten
+haben, kann die Liste Nachrichten an Sie zustellen. Zweitens wird
+sichergestellt, dass niemand diese Adresse auf eine Liste eintr�gt, 
+ohne das Sie dies m�chten.
 
-Ihr Mail-Programm sollte wenn Sie die Antworten Funktion benutzen automatisch
-eine Mail an die Best�tigungsadresse schicken.
+Ihr Mail-Programm sollte, wenn Sie die Antworten Funktion benutzen,
+automatisch eine Mail an die Best�tigungsadresse schicken.
 
-Das Subject und der Text spielen bei dieser Mail keine Rolle.
+Der Betreff und der Text spielen bei dieser Mail keine Rolle.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/sub-confirm-nomail mlmmj-1.2.12-RC1/listtexts/de/sub-confirm-nomail
--- mlmmj-1.2.12-RC1.orig/listtexts/de/sub-confirm-nomail	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/sub-confirm-nomail	2006-09-06 19:45:47.000000000 +0200
@@ -1,26 +1,27 @@
-Subject: Best�tigen Sie bitte das eintragen auf die Nomail Version der Liste $listaddr$
+Subject: Best�tigen Sie bitte das Eintragen auf die Nomail-Version der Liste $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Um zu best�tigen das Sie die Adresse 
+Um zu best�tigen, dass Sie die Adresse 
 
 $subaddr$
 
-auf die Nomail Version der Mailingliste eintragen wollen senden
-Sie bitte eine Best�tigung an folgende Adresse:
+auf die Nomail-Version der Mailingliste eintragen wollen, senden Sie
+bitte eine Antwort-Mail an folgende Adresse:
 
 $confaddr$
 
-Diese Best�tigung erf�llt zwei zwecke. Wenn Sie diese Mail erhalten haben
-kann die Liste Nachrichten an Sie zustellen und zweitens wird sichergestellt
-das niemand diese Adresse auf eine Liste eintr�gt ohne das Sie dies m�chten.
+Diese Best�tigung erf�llt zwei Zwecke: Wenn Sie diese Mail erhalten
+haben, kann die Liste Nachrichten an Sie zustellen. Zweitens wird
+sichergestellt, dass niemand diese Adresse auf eine Liste eintr�gt, 
+ohne dass Sie dies m�chten.
 
-Ihr Mail-Programm sollte wenn Sie die Antworten Funktion benutzen automatisch
-eine Mail an die Best�tigungsadresse schicken.
+Ihr Mail-Programm sollte, wenn Sie die Antworten-Funktion benutzen,
+automatisch eine Mail an die Best�tigungsadresse schicken.
 
-Das Subject und der Text spielen bei dieser Mail keine Rolle.
+Der Betreff und der Text spielen bei dieser Mail keine Rolle.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/submod-moderator mlmmj-1.2.12-RC1/listtexts/de/submod-moderator
--- mlmmj-1.2.12-RC1.orig/listtexts/de/submod-moderator	2006-09-04 00:29:46.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/de/submod-moderator	2006-09-06 19:52:31.000000000 +0200
@@ -1,22 +1,26 @@
-Subject: Subscription request for $listaddr$
+Subject: Abonnement-Antrag $listaddr$
 
-Hi, this is the mlmmj program managing the mailinglist
+Hi, dies ist das mlmmj-Programm, das die Mailingliste 
 
 $listaddr$
 
-There is a subscription request from
+verwaltet.
+
+Ein Abonnement-Antrag von
 
 $subaddr$
 
-waiting. To approve this request, please send a reply to
+wartet aus Bestätigung. Um diesen Antrag zu gewähren, senden Sie bitte
+eine Antwort an
 
 $moderateaddr$
 
-Your mailer probably automatically replies to this address, when you hit
-the reply button. If you don't want to approve the request, simply ignore this
-message.
+Ihr Mail-Programm sollte, wenn Sie die Antworten-Funktion benutzen,
+automatisch eine Mail an die Bestätigungsadresse schicken. Wenn Sie
+diesen Antrag nicht bestätigen möchten, ignorieren Sie diese Mail
+einfach.
 
-The following subscription moderators have received this mail:
+Die folgenden Abonnement-Moderatoren haben diese Mail erhalten:
 
 $moderators$
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/submod-requester mlmmj-1.2.12-RC1/listtexts/de/submod-requester
--- mlmmj-1.2.12-RC1.orig/listtexts/de/submod-requester	2006-09-04 00:29:46.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/de/submod-requester	2006-09-06 19:54:57.000000000 +0200
@@ -1,9 +1,11 @@
-Subject: Subscription request waiting for approval
+Subject: Abonnemen-Antrag wartet auf Bestätigung
 
-Hi, this is the mlmmj program managing the mailinglist
+Hi, dies ist das mlmmj-Program, welches die Mailingliste
 
 $listaddr$
 
-This list is configured to have moderated subscription, the request have
-been queued for approval.
+verwaltet.
+
+Bevor Ihr Abonnement eingetragen werden kann, muss der Antrag von
+einem Moderator bestätigt werden. 
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/sub-ok mlmmj-1.2.12-RC1/listtexts/de/sub-ok
--- mlmmj-1.2.12-RC1.orig/listtexts/de/sub-ok	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/sub-ok	2006-09-06 19:55:26.000000000 +0200
@@ -6,12 +6,12 @@
 
 eingetragen.
 
-Wenn Sie sich wieder austragen m�chten senden Sie eine Mail
+Wenn Sie sich wieder austragen m�chten, senden Sie eine Mail
 an:
 
 $listunsubaddr$
 
-Um Hilfe zu dieser Liste zu bekommen senden Sie bitte ein Mail
+Um Hilfe zu dieser Liste zu bekommen, senden Sie bitte ein Mail
 an:
 
 $helpaddr$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/sub-ok-digest mlmmj-1.2.12-RC1/listtexts/de/sub-ok-digest
--- mlmmj-1.2.12-RC1.orig/listtexts/de/sub-ok-digest	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/sub-ok-digest	2006-09-06 19:55:50.000000000 +0200
@@ -1,17 +1,17 @@
-Subject: Willkommen auf der Digest Version von $listaddr$
+Subject: Willkommen auf der Digest-Version von $listaddr$
 
-Willkommen! Sie sind jetzt auf der Digest Version der Liste
+Willkommen! Sie sind jetzt auf der Digest-Version der Liste
 
 $listaddr$
 
 eingetragen.
 
-Wenn Sie sich wieder austragen m�chten senden Sie eine Mail
+Wenn Sie sich wieder austragen m�chten, senden Sie eine Mail
 an:
 
 $listunsubaddr$
 
-Um Hilfe zu dieser Liste zu bekommen senden Sie bitte ein Mail
+Um Hilfe zu dieser Liste zu bekommen, senden Sie bitte eine Mail
 an:
 
 $helpaddr$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/sub-ok-nomail mlmmj-1.2.12-RC1/listtexts/de/sub-ok-nomail
--- mlmmj-1.2.12-RC1.orig/listtexts/de/sub-ok-nomail	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/sub-ok-nomail	2006-09-06 19:56:32.000000000 +0200
@@ -1,17 +1,17 @@
-Subject: Willkommen auf der Nomail Version von $listaddr$
+Subject: Willkommen auf der Nomail-Version von $listaddr$
 
-Willkommen! Sie sind jetzt auf der Nomail Version der Liste
+Willkommen! Sie sind jetzt auf der Nomail-Version der Liste
 
 $listaddr$
 
 eingetragen.
 
-Wenn Sie sich wieder austragen m�chten senden Sie eine Mail
+Wenn Sie sich wieder austragen m�chten, senden Sie eine Mail
 an:
 
 $listunsubaddr$
 
-Um Hilfe zu dieser Liste zu bekommen senden Sie bitte ein Mail
+Um Hilfe zu dieser Liste zu bekommen, senden Sie bitte eine Mail
 an:
 
 $helpaddr$
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/subonlypost mlmmj-1.2.12-RC1/listtexts/de/subonlypost
--- mlmmj-1.2.12-RC1.orig/listtexts/de/subonlypost	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/subonlypost	2006-09-06 19:59:28.000000000 +0200
@@ -1,26 +1,28 @@
 Subject: $listaddr$ ist eine geschlossene Liste.
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Sie haben versuchen von der Adresse:
+Sie haben versucht, von der Adresse
 
 $posteraddr$
 
 eine Nachricht an die Liste zu schreiben. 
+
 Diese Adresse ist aber nicht auf der Liste eingetragen.  
 
 Diese Liste ist eine geschlossene Liste und erlaubt nur
-Nachrichten von Adressen die auch eingetragen sind. 
+Nachrichten von Adressen, die auch eingetragen sind. 
 
-Wenn Sie glauben das Sie eingetragen sind �berpr�fen Sie bitte
-die Willkommen Nachricht oder �berpr�fen Sie die Header irgendeiner
-Mail an die Liste.
-
-Um auch von einer anderen Adresse als von der mit der Sie eingetragen
-sind Nachrichten an die Liste schicken zu k�nnen tragen Sie sich bitte
-auf die Nomail Version dieser Liste ein.
+Wenn Sie glauben, dass Sie eingetragen sind, �berpr�fen Sie bitte die
+Willkommen-Nachricht, oder �berpr�fen Sie die Header irgendeiner Mail 
+an die Liste, um herauszufinden, mit welcher Email-Adresse Sie sich
+eingetragen haben.
+
+Um auch von einer anderen Adresse, als der mit der Sie eingetragen
+sind, Nachrichten an die Liste schicken zu k�nnen, tragen Sie die neue
+Adresse bitte auf die Nomail-Version dieser Liste ein.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/sub-subscribed mlmmj-1.2.12-RC1/listtexts/de/sub-subscribed
--- mlmmj-1.2.12-RC1.orig/listtexts/de/sub-subscribed	2005-05-07 15:11:37.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/de/sub-subscribed	2006-09-06 20:05:28.000000000 +0200
@@ -1,6 +1,6 @@
 Subject: Bereits eingetragen auf $listaddr$
 
-Hi, hier ist das mlmmj Programm, das die Mailingliste
+Hi, hier ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-confirm mlmmj-1.2.12-RC1/listtexts/de/unsub-confirm
--- mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-confirm	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/unsub-confirm	2006-09-06 20:07:21.000000000 +0200
@@ -1,25 +1,25 @@
-Subject: Best�tigen Sie bitte das austragen aus der Liste $listaddr$
+Subject: Best�tigen Sie bitte das Austragen aus der Liste $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Um zu best�tigen das Sie die Adresse
+Um zu best�tigen, dass Sie die Adresse
 
 $subaddr$
 
-aus der Liste austragen wollen senden Sie bitte eine
-Best�tigung an folgende Adresse:
+aus der Liste austragen wollen, senden Sie bitte eine
+Antwort-Mail an folgende Adresse:
 
 $confaddr$
 
-Ihr Mail-Programm sollte wenn Sie die Antworten Funktion benutzen automatisch
-eine Mail an die Best�tigungsadresse schicken.
+Ihr Mail-Programm sollte, wenn Sie die Antworten-Funktion benutzen,
+automatisch eine Mail an die Best�tigungsadresse schicken.
 
-Wenn Sie nicht auf der Liste eingetragen sind werden Sie keine Antwort
-erhalten. Um zu sehen mit welcher Adresse Sie auf der Liste eingetragen
-sind �berpr�fen Sie bitte die Willkommen Nachricht oder �berpr�fen Sie
+Wenn Sie nicht auf der Liste eingetragen sind, werden Sie keine Antwort
+erhalten. Um zu sehen, mit welcher Adresse Sie auf der Liste eingetragen
+sind, �berpr�fen Sie bitte die Willkommen-Nachricht, oder �berpr�fen Sie
 die Header irgendeiner Nachricht an die Liste.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-confirm-digest mlmmj-1.2.12-RC1/listtexts/de/unsub-confirm-digest
--- mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-confirm-digest	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/unsub-confirm-digest	2006-09-06 20:07:23.000000000 +0200
@@ -1,25 +1,25 @@
-Subject: Best�tigen Sie bitte das austragen aus der Digest Version der Liste $listaddr$
+Subject: Best�tigen Sie bitte das Austragen aus der Digest-Version der Liste $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Um zu best�tigen das Sie die Adresse
+Um zu best�tigen, dass Sie die Adresse
 
 $subaddr$
 
-aus der Digest Version der Liste austragen wollen senden Sie bitte eine
-Best�tigung an folgende Adresse:
+aus der Digest-Version der Liste austragen m�chten, senden Sie bitte
+eine Antwort-Mail an folgende Adresse:
 
 $confaddr$
 
-Ihr Mail-Programm sollte wenn Sie die Antworten Funktion benutzen automatisch
-eine Mail an die Best�tigungsadresse schicken.
+Ihr Mail-Programm sollte, wenn Sie die Antworten-Funktion benutzen,
+automatisch eine Mail an die Best�tigungsadresse schicken.
 
-Wenn Sie nicht auf der Liste eingetragen sind werden Sie keine Antwort
-erhalten. Um zu sehen mit welcher Adresse Sie auf der Liste eingetragen
-sind �berpr�fen Sie bitte die Willkommen Nachricht oder �berpr�fen Sie
+Wenn Sie nicht auf der Liste eingetragen sind, werden Sie keine Antwort
+erhalten. Um zu sehen, mit welcher Adresse Sie auf der Liste eingetragen
+sind, �berpr�fen Sie bitte die Willkommen-Nachricht, oder �berpr�fen Sie
 die Header irgendeiner Nachricht an die Liste.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-confirm-nomail mlmmj-1.2.12-RC1/listtexts/de/unsub-confirm-nomail
--- mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-confirm-nomail	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/unsub-confirm-nomail	2006-09-06 20:09:32.000000000 +0200
@@ -1,25 +1,25 @@
-Subject: Best�tigen Sie bitte das austragen aus der Nomail Version der Liste $listaddr$
+Subject: Best�tigen Sie bitte das Austragen aus der Nomail Version der Liste $listaddr$
 
-Hi, dies ist das mlmmj Programm das die Mailingliste
+Hi, dies ist das mlmmj-Programm, das die Mailingliste
 
 $listaddr$
 
 verwaltet.
 
-Um zu best�tigen das Sie die Adresse
+Um zu best�tigen, dass Sie die Adresse
 
 $subaddr$
 
-aus der Nomail Version der Liste austragen wollen senden Sie bitte eine
-Best�tigung an folgende Adresse:
+aus der Nomail-Version der Liste austragen wollen, senden Sie bitte eine
+Antwort-Mail an folgende Adresse:
 
 $confaddr$
 
-Ihr Mail-Programm sollte wenn Sie die Antworten Funktion benutzen automatisch
-eine Mail an die Best�tigungsadresse schicken.
+Ihr Mail-Programm sollte, wenn Sie die Antworten-Funktion verwenden,
+automatisch eine Mail an die Best�tigungsadresse schicken.
 
-Wenn Sie nicht auf der Liste eingetragen sind werden Sie keine Antwort
-erhalten. Um zu sehen mit welcher Adresse Sie auf der Liste eingetragen
-sind �berpr�fen Sie bitte die Willkommen Nachricht oder �berpr�fen Sie
+Wenn Sie nicht auf der Liste eingetragen sind, werden Sie keine Antwort
+erhalten. Um zu sehen, mit welcher Adresse Sie auf der Liste eingetragen
+sind, �berpr�fen Sie bitte die Willkommen-Nachricht, oder �berpr�fen Sie
 die Header irgendeiner Nachricht an die Liste.
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-notsubscribed mlmmj-1.2.12-RC1/listtexts/de/unsub-notsubscribed
--- mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-notsubscribed	2005-05-07 15:11:37.000000000 +0200
+++ mlmmj-1.2.12-RC1/listtexts/de/unsub-notsubscribed	2006-09-06 20:10:13.000000000 +0200
@@ -1,16 +1,15 @@
 Subject: Nicht eingetragen auf $listaddr$
 
-Hi, hier ist das mlmmj Programm, das die Mailingliste 
+Hi, hier ist das mlmmj-Programm, das die Mailingliste 
 
 $listaddr$
 
 verwaltet.
 
-Sie sind nicht auf dieser Liste eingetragen, deshalb koennen sie
+Sie sind nicht auf dieser Liste eingetragen, deshalb können Sie
 sich auch nicht austragen.
 
-
-Um sich einzutragen, senden sie eine Mail an:
+Um sich einzutragen, senden Sie eine Mail an:
 
 $listsubaddr$
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-ok mlmmj-1.2.12-RC1/listtexts/de/unsub-ok
--- mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-ok	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/unsub-ok	2006-09-06 20:10:30.000000000 +0200
@@ -1,4 +1,4 @@
-Subject: Auf Wiedersehen von  $listaddr$
+Subject: Auf Wiedersehen von $listaddr$
 
 Auf Wiedersehen! Sie wurden von der Liste 
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-ok-digest mlmmj-1.2.12-RC1/listtexts/de/unsub-ok-digest
--- mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-ok-digest	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/unsub-ok-digest	2006-09-06 20:10:38.000000000 +0200
@@ -1,4 +1,4 @@
-Subject: Auf Wiedersehen von der Digest Version der Liste $listaddr$
+Subject: Auf Wiedersehen von der Digest-Version der Liste $listaddr$
 
 Auf Wiedersehen! Sie wurden von der Liste 
 
diff -ur mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-ok-nomail mlmmj-1.2.12-RC1/listtexts/de/unsub-ok-nomail
--- mlmmj-1.2.12-RC1.orig/listtexts/de/unsub-ok-nomail	2004-11-28 19:52:41.000000000 +0100
+++ mlmmj-1.2.12-RC1/listtexts/de/unsub-ok-nomail	2006-09-06 20:10:49.000000000 +0200
@@ -1,4 +1,4 @@
-Subject: Auf Wiedersehen von der Nomail Version der Liste $listaddr$
+Subject: Auf Wiedersehen von der Nomail-Version der Liste $listaddr$
 
 Auf Wiedersehen! Sie wurden von der Liste 
 

--pf9I7BMVVzbSWLtt--
