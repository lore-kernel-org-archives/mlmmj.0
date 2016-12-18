From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Sun, 18 Dec 2016 08:19:30 +0000
Subject: [mlmmj] mlmmj: list subscriber email in both nomailsubs.d and subscribers.d
Message-Id: <73838a63-024c-900b-dd20-bae090c5d2a1@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------263AB83C6FC1AC347F946AE4"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------263AB83C6FC1AC347F946AE4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I have been using mlmmj on a CentOS server for several years now (to
great effect!), but recently came across an interesting scenario that
begs these questions:

What happens when a list subscriber's email appears in an ASCII text
file in the list's subscribers.d directory, as well as being contained
in a file in the list's nomailsubs.d directory? Which takes precedence?

One of our list subscribers was attempting to send a simple email to the
list (ie. not beyond the maxsize), but received a bounce-back message
containing "...was unable to be delivered to the list because you are
not a list subscriber".  I triple-checked to make sure their email
address was spelled correctly in the subscribers.d text file (it was),
but I haven't yet determined why they received this "not a list
subscriber" bounce. 

I did notice this subscriber's email address was also included in a
nomailsubs.d text file for the same email list.  Regardless of whether
this is or isn't related to why they received the bounce message, I'm
now wondering what mlmmj does in this situation - does it honor the
subscribers.d permission to receive email from the list, or does it
enforce the non-receipt policy defined by the address' existence in the
nomailsubs.d directory?

(Due to how our organization is structured, and the data automation
we've wrapped around the mlmmj deployment on our email server, its
possible and logical that a subscriber email address might end up in
both places.)

I would like to understand why this subscriber's email submission was
denied, but I would also like to know how mlmmj reacts when presented
with an email address in both the subscribers.d and nomailsubs.d directory.

Thanks for any feedback!

Philip Parshley
webmaster@vlsc.org


--------------263AB83C6FC1AC347F946AE4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id uBI8Mv5R007248

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif"><span>I have been using
        mlmmj on a CentOS server for several years now (to great
        effect!), but recently came across an interesting scenario that
        begs these questions:<br>
        <br>
        What happens when a list subscriber's email appears in an ASCII
        text file in the list's subscribers.d directory, as well as
        being contained in a file in the list's nomailsubs.d directory?
        Which takes precedence?<br>
        <br>
        One of our list subscribers was attempting to send a simple
        email to the list (ie. not beyond the maxsize), but received a
        bounce-back message containing "...was unable to be delivered to
        the list because you are not a list </span></font><span><font
        face=3D"Helvetica, Arial, sans-serif">subscriber".=C2=A0 I
        triple-checked to make sure their email address was spelled
        correctly in the subscribers.d text file (it was), but I haven't
        yet determined why they received this "not a list subscriber"
        bounce.=C2=A0 <br>
        <br>
        I did notice this subscriber's email address was also included
        in a nomailsubs.d text file for the same email list.=C2=A0 Regard=
less
        of whether this is or isn't related to why they received the
        bounce message, I'm now wondering what mlmmj does in this
        situation - does it honor the subscribers.d permission to
        receive email from the list, or does it enforce the non-receipt
        policy defined by the address' existence in the nomailsubs.d
        directory?<br>
        <br>
        (Due to how our organization is structured, and the data
        automation we've wrapped around the mlmmj deployment on our
        email server, its possible and logical that a subscriber email
        address might end up in both places.)<br>
        <br>
        I would like to understand why this subscriber's email
        submission was denied, but I would also like to know how mlmmj
        reacts when presented with an email address in both the
        subscribers.d and nomailsubs.d directory.<br>
        <br>
        Thanks for any feedback!<br>
        <br>
        Philip Parshley<br>
        <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:webmaster@vl=
sc.org">webmaster@vlsc.org</a><br>
        <br>
      </font></span>
  </body>
</html>

--------------263AB83C6FC1AC347F946AE4--

