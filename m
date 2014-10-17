From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Fri, 17 Oct 2014 21:17:18 +0000
Subject: [mlmmj] bulk-adding emails to a mlmmj email list
Message-Id: <5441875E.3050403@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090406000609080507000602"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------090406000609080507000602
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Now that I have mjmml working, I'm wondering if there's a way to 
bulk-add a list of emails to a mailing list?

Here's my scenario, and why I'm asking:
We run 10-15 relatively small lists, most about a dozen addresses, with 
our largest only about 125 addresses.  These are all "closed" 
subonlypost lists.  We occasionally add new lists, when projects come 
up, and sometimes retire (delete) lists once a project is done.

The idea of having to manually use mlmmj-make-ml to enter each address 
seems like lot of work.  It would be great if one could simply take an 
ASCII text file, with one address per line, and somehow stuff them all 
into the mailing list at once, rather than typing out a mlmmj-sub 
command 125 times.

In our situation we're not concerned about subscribers being able to 
self-subscribe, or self-unsubscribe, and we're don't normally use or 
need list archives. I'm not sure if these concerns make the idea of 
bulk-addition more difficult, but if there's any way to do this, it 
would make my life a lot easier.

[ I noticed after adding several addresses to a list, that they seem to 
appear in the /var/spool/mlmmj/listname/subscribers.d/ directory, each 
address ending up in a single-character-name file, based on the 1st 
letter in the address - ie. paul@me.com, peter@msn.com, etc. all ended 
up in a file called "p". Is it possible to use scripts to simply stuff 
addresses into these files, based on the 1st character in the address?  
What would be the implication of doing this independently of the 
existing mlmmj-sub script? ]

<https://vlsc.org/manager/ispmgr?func=file&plid=var/spool/mlmmj/lightnings&elid=subscribers.d> 
With the old Majordomo, it was relatively easy for me to setup some PHP 
admin scripts that let me view/add/edit the list of addresses in an 
email list, and I'm hoping to do the same with mlmmj.

Philip

P.S. is there a procedure for deleting a mailing list? can one simply 
delete the .../mlmmj/listdir and all it's contents?


--------------090406000609080507000602
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id s9HLKZq3012184

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif">Now that I have mjmml
      working, I'm wondering if there's a way to bulk-add a list of
      emails to a mailing list?<br>
      <br>
      Here's my scenario, and why I'm asking: <br>
      We run 10-15 relatively small lists, most about a dozen addresses,
      with our largest only about 125 addresses.=A0 These are all "closed=
"
      subonlypost lists.=A0 We occasionally add new lists, when projects
      come up, and sometimes retire (delete) lists once a project is
      done.<br>
      <br>
      The idea of having to manually use mlmmj-make-ml to enter each
      address seems like lot of work.=A0 It would be great if one could
      simply take an ASCII text file, with one address per line, and
      somehow stuff them all into the mailing list at once, rather than
      typing out a mlmmj-sub command 125 times. <br>
      <br>
      In our situation we're not concerned about subscribers being able
      to self-subscribe, or self-unsubscribe, and we're don't normally
      use or need list archives. I'm not sure if these concerns make the
      idea of bulk-addition more difficult, but if there's any way to do
      this, it would make my life a lot easier. <br>
      <br>
      [ I noticed after adding several addresses to a list, that they
      seem to appear in the /var/spool/mlmmj/listname/subscribers.d/
      directory, each address ending up in a single-character-name file,
      based on the 1st letter in the address - ie. <a class=3D"moz-txt-li=
nk-abbreviated" href=3D"mailto:paul@me.com">paul@me.com</a>,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:peter@msn.com"=
>peter@msn.com</a>, etc. all ended up in a file called "p". Is it
      possible to use scripts to simply stuff addresses into these
      files, based on the 1st character in the address?=A0 What would be
      the implication of doing this independently of the existing
      mlmmj-sub script? ]<br>
      <br>
      <span id=3D"title"><a
href=3D"https://vlsc.org/manager/ispmgr?func=3Dfile&amp;plid=3Dvar/spool/=
mlmmj/lightnings&amp;elid=3Dsubscribers.d"></a></span>
      With the old Majordomo, it was relatively easy for me to setup
      some PHP admin scripts that let me view/add/edit the list of
      addresses in an email list, and I'm hoping to do the same with
      mlmmj.<br>
      <br>
      Philip <br>
      <br>
      P.S. is there a procedure for deleting a mailing list? can one
      simply delete the .../mlmmj/listdir and all it's contents?<br>
      <br>
    </font>
  </body>
</html>

--------------090406000609080507000602--

