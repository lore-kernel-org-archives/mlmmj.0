From: Thomas Goirand <thomas@goirand.fr>
Date: Wed, 04 Mar 2009 23:38:27 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <49AF10F3.10106@goirand.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040105020003060909000003"
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------040105020003060909000003
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Morten K. Poulsen wrote:
> Thanks for the code - I've committed it to CVS, and it will be included
> in the next release of mlmmj :)

Cheers!

> For the impatient souls out there, it can also be downloaded from
> http://mlmmj.mmj.dk/~mortenp/mlmmj-php-moderation-cvs20090304.tar.bz2
> 
> There is a few notices. Could you take care of them? It's not urgent.

Outch! I normally work with error reporting E_ALL, my bad...

By the way, I did it right away, because otherwise I will forget.

> These can only be provoked by a malformed mail, but it would be nice to
> get rid of them anyway:

I didn't even think a mail could ever be sent with no From:, Date: or
such header. How nasty can it be that a mail server is accepting such
email? :(

Attached is a diff to apply. It seems you missed my README, can you
re-add it in the folder? The notes are quite important for the setup,
especially the things about the .htaccess. Also, why the .htaccess in
the translation folder has been renamed to dot.htaccess? Is that because
you are using CVS? To me, it would be wise to switch to Git. You would
never regret it!!!

Thomas


--------------040105020003060909000003
Content-Type: text/x-diff;
 name="mlmmj-web-moderation.diff"
Content-Disposition: inline;
 filename="mlmmj-web-moderation.diff"
Content-Transfer-Encoding: quoted-printable

diff -u -r mlmmj.orig/contrib/web/php-moderation/mlmmj-moderation.php mlm=
mj/contrib/web/php-moderation/mlmmj-moderation.php
--- mlmmj.orig/contrib/web/php-moderation/mlmmj-moderation.php	2009-02-08=
 20:43:11.000000000 +0800
+++ mlmmj/contrib/web/php-moderation/mlmmj-moderation.php	2009-03-05 07:2=
5:14.000000000 +0800
@@ -151,14 +151,24 @@
 		}
 		$out .=3D "<tr>";
 		$out .=3D "<td $cls>" . "<input type=3D\"checkbox\" name=3D\"msg_id[]\=
" value=3D\"". $all_msg[$i]["filename"] ."\">" . "</td>";
-		$out .=3D "<td $cls>" . htmlspecialchars($all_msg[$i]["headers"]["date=
"]) . "</td>";
-		if( strlen($all_msg[$i]["headers"]["subject"]) =3D=3D 0){
+		if( isset($all_msg[$i]["headers"]["date"]) ){
+			$mydate =3D htmlspecialchars($all_msg[$i]["headers"]["date"]);
+		}else{
+			$mydate =3D _("No date");
+		}
+		$out .=3D "<td $cls>" . $mydate . "</td>";
+		if( !isset($all_msg[$i]["headers"]["subject"]) || strlen($all_msg[$i][=
"headers"]["subject"]) =3D=3D 0){
 			$subject =3D _("No subject");
 		}else{
 			$subject =3D $all_msg[$i]["headers"]["subject"];
 		}
 		$out .=3D "<td $cls><a href=3D\"". $_SERVER["PHP_SELF"] ."?action=3Dsh=
ow_message&msgid=3D". $all_msg[$i]["filename"] ."\">" . htmlspecialchars(=
$subject) . "</a></td>";
-		$out .=3D "<td $cls>" . htmlspecialchars($all_msg[$i]["headers"]["from=
"]) . "</td>";
+		if( isset($all_msg[$i]["headers"]["from"]) ){
+			$myfrom =3D htmlspecialchars($all_msg[$i]["headers"]["from"]);
+		}else{
+			$myfrom =3D _("No from in headers");
+		}
+		$out .=3D "<td $cls>" . $myfrom . "</td>";
 		$out .=3D "</tr>\n";
 	}
 	$out .=3D "</table>\n";
@@ -234,7 +244,7 @@
 <h3>MLMMJ "._("moderation web interface")."</h3>
 <a href=3D\"".$_SERVER["PHP_SELF"]."\">"._("Refresh page")."</a>";
=20
-if( isset($_REQUEST["action"]) && $_REQUEST["action"] =3D=3D show_messag=
e){
+if( isset($_REQUEST["action"]) && $_REQUEST["action"] =3D=3D "show_messa=
ge"){
 	if( !ereg("^([0-9a-f]+)\$",$_REQUEST["msgid"]) ){
 		echo "<span class=3D\"errorMessages\">"._("Message ID format is wrong:=
 can't display!")."</span>";
 	}else{
diff -u -r mlmmj.orig/contrib/web/php-moderation/translations/fr_FR.po ml=
mmj/contrib/web/php-moderation/translations/fr_FR.po
--- mlmmj.orig/contrib/web/php-moderation/translations/fr_FR.po	2009-02-0=
8 19:46:34.000000000 +0800
+++ mlmmj/contrib/web/php-moderation/translations/fr_FR.po	2009-03-05 07:=
29:30.000000000 +0800
@@ -7,15 +7,15 @@
 msgstr ""
 "Project-Id-Version: 0.1\n"
 "Report-Msgid-Bugs-To: \n"
-"POT-Creation-Date: 2009-02-08 11:46+0000\n"
-"PO-Revision-Date: 2009-02-08 11:15+0000\n"
+"POT-Creation-Date: 2009-03-05 07:25+0800\n"
+"PO-Revision-Date: 2009-03-05 07:29+0800\n"
 "Last-Translator: Thomas Goirand <thomas@goirand.fr>\n"
 "Language-Team: Thomas Goirand <thomas@goirand.fr>\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=3DUTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
=20
-#: mlmmj-moderation.php:249
+#: mlmmj-moderation.php:259
 msgid "Back to messages list"
 msgstr "Retour a la liste des messages"
=20
@@ -23,27 +23,27 @@
 msgid "Date"
 msgstr "Date"
=20
-#: mlmmj-moderation.php:251
+#: mlmmj-moderation.php:261
 msgid "Date:"
 msgstr "Date :"
=20
-#: mlmmj-moderation.php:167
+#: mlmmj-moderation.php:177
 msgid "Delete"
 msgstr "Effacer"
=20
-#: mlmmj-moderation.php:246
+#: mlmmj-moderation.php:256
 msgid "Error: could not read"
 msgstr "Erreur: impossible de lire"
=20
-#: mlmmj-moderation.php:165
+#: mlmmj-moderation.php:175
 msgid "For the selection:"
-msgstr "Pour la selection :"
+msgstr "Pour la s=C3=A9lection :"
=20
 #: mlmmj-moderation.php:144
 msgid "From"
 msgstr "De"
=20
-#: mlmmj-moderation.php:250
+#: mlmmj-moderation.php:260
 msgid "From:"
 msgstr "De:"
=20
@@ -51,27 +51,35 @@
 msgid "Inverse selection"
 msgstr "Inverser la selection"
=20
-#: mlmmj-moderation.php:239
+#: mlmmj-moderation.php:249
 msgid "Message ID format is wrong: can't display!"
 msgstr "Le format de l'ID du message est faux: affichage impossible !"
=20
-#: mlmmj-moderation.php:254
+#: mlmmj-moderation.php:264
 msgid "Message body:"
 msgstr "Corp du message :"
=20
-#: mlmmj-moderation.php:184
+#: mlmmj-moderation.php:194
 msgid "Moderation ID not found in the moderation folder!"
-msgstr "ID de moderation non trouve dans le dossier de moderation!"
+msgstr "ID de mod=C3=A9ration non trouve dans le dossier de mod=C3=A9rat=
ion!"
=20
-#: mlmmj-moderation.php:174
+#: mlmmj-moderation.php:157
+msgid "No date"
+msgstr "Pas de date"
+
+#: mlmmj-moderation.php:169
+msgid "No from in headers"
+msgstr "Pas de from dans les ent=C3=AAtes"
+
+#: mlmmj-moderation.php:184
 msgid "No message selected!"
-msgstr "Pas de message selectionne !"
+msgstr "Pas de message s=C3=A9lectionn=C3=A9 !"
=20
-#: mlmmj-moderation.php:156
+#: mlmmj-moderation.php:161
 msgid "No subject"
 msgstr "Pas de sujet"
=20
-#: mlmmj-moderation.php:235
+#: mlmmj-moderation.php:245
 msgid "Refresh page"
 msgstr "Rafraichir la page"
=20
@@ -79,22 +87,23 @@
 msgid "Subject"
 msgstr "Sujet"
=20
-#: mlmmj-moderation.php:253
+#: mlmmj-moderation.php:263
 msgid "Subject:"
 msgstr "Sujet :"
=20
-#: mlmmj-moderation.php:252
+#: mlmmj-moderation.php:262
 msgid "To:"
 msgstr "Pour :"
=20
-#: mlmmj-moderation.php:166
+#: mlmmj-moderation.php:176
 msgid "Validate"
 msgstr "Valider"
=20
 #: mlmmj-moderation.php:122
 msgid "Warning: could not read"
-msgstr "Warning : impossible de lire"
+msgstr "Alerte : impossible de lire"
=20
-#: mlmmj-moderation.php:234
+#: mlmmj-moderation.php:244
 msgid "moderation web interface"
 msgstr "interface web de moderation"
+
Only in mlmmj/contrib/web/php-moderation/translations: templates.pot

--------------040105020003060909000003--
