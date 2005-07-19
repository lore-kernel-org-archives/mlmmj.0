From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 19 Jul 2005 06:35:22 +0000
Subject: Re: recipdelim patch
Message-Id: <20050719063522.GN83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000B1FA@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000B1FA@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* fifadd@tin.it <fifadd@tin.it> [Jul 19. 2005 00:43]:
> I have removed the FFF comments. I have corrected the memory leak.
> Here you can find the recipdelim patch.

@@ -512,14 +512,17 @@ int main(int argc, char **argv)
        else
                whichto =3D NULL;
=B7
-       if(whichto && whichto->emaillist && whichto->emaillist[0])
-               recipdelim =3D strchr(whichto->emaillist[0], RECIPDELIM);
-       else
-               recipdelim =3D NULL;
+        if(toemails.emaillist && toemails.emaillist[0])
+                recipdelim =3D strstr(toemails.emaillist[0], RECIPDELIM);
+        else
+                recipdelim =3D NULL;
+

This is bad, since this stop reacting to the Delivered-To: header, and
instead startsa only using the To: header. But the whichto will point to
the To: header in case there's no Delivered-To:. And in case someone
sends a subscribe request with the sendmail command, there's no To:
header on qmail.

Why not just change it to use strstr()? Now we're talking about strstr,
why not just use strchr, but do it on RECIPDELIM[0]. Since it can only
be one character big, it should have the same effect, no?

All the hunks in mlmmj-sub.c have different indentation. BTW, you can
make vi use tabs instead of spaces when pressing tab, by doing

 :set noet

I see you're doing:

    tmpstr =3D mystrdup(concatstr(2, RECIPDELIM, "confunsub-digest-"));

You don't need the mystrdup there, since concatstr will return an
allocated string already.

Thanks,
--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
