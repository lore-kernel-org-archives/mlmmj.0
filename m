From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Tue, 03 Feb 2015 22:26:55 +0000
Subject: [mlmmj] mlmmj wishlist request
Message-Id: <54D14B2F.3010003@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070709040301000409010009"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------070709040301000409010009
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've been successfully running a handful of small mlmmj lists for 
several months now, on an eApps centOS cloud server, running sendmail. I 
have a question/request related to a feature that I used to exploit when 
working with the old majordomo mailing list tool:

When using majordomo it was possible to configure a "closed" list, in 
terms of senders and receivers of posts (functionally similar to how 
mlmmj works using the "subonlypost" control file), while at the same 
time it was also possible to configure a secondary file (containing 
addresses) that could only submit posts, but not receive any posts.

Perhaps a simple example can illustrate how this might be used:
Acme Services is run by a board of directors, and the board has their 
own closed mlmmj list.  There are also several dept managers that work 
for Acme Services, and the board would like these managers to be able to 
communicate directly with all the members of the board by simply sending 
an email to the board list. On the other hand, the board doesn't want 
the managers receiving any of the board list posts.

There are several other scenarios that might benefit from this ability - 
in fact I'd say it might find many uses, and the varied possibilities 
are likely the reason majordomo had this feature.

I haven't seen anything that indicates this is somehow currently 
possible with mlmmj, so I apologize in advance for missing the notes on 
how to do this currently, if its already available.

With mlmmj, I could envision having another directory similar to the 
existing "subscribers.d", that would contain file(s) of addresses that 
only had permission to "submit" posts.

Or perhaps there could be some way to flag or code files contained in 
the existing
"subscribers.d" directory that would indicate if the addresses it 
contains are only "submitters" or only " receivers" or both "submitters 
and receivers".

I haven't looked under the hood far enough to know how simple or 
complicated this might be to implement with mlmmj (assuming its not 
there now) so I'm just sharing the thought, in the hope that someone 
might be intrigued by the idea of adding this feature, and hoping it 
would not be difficult to implement.

Philip Parshley


--------------070709040301000409010009
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id t13MSaZk028680

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif">I've been successfully
      running a handful of small mlmmj lists for several months now, on
      an eApps centOS cloud server, running sendmail. I have a
      question/request related to a feature that I used to exploit when
      working with the old majordomo mailing list tool:<br>
      <br>
      When using majordomo it was possible to configure a "closed" list,
      in terms of senders and receivers of posts (functionally similar
      to how mlmmj works using the "subonlypost" control file), while at
      the same time it was also possible to configure a secondary file
      (containing addresses) that could only submit posts, but not
      receive any posts.<br>
      <br>
      Perhaps a simple example can illustrate how this might be used: <br=
>
      Acme Services is run by a board of directors, and the board has
      their own closed mlmmj list.=C2=A0 There are also several dept mana=
gers
      that work for Acme Services, and the board would like these
      managers to be able to communicate directly with all the members
      of the board by simply sending an email to the board list. On the
      other hand, the board doesn't want the managers receiving any of
      the board list posts.<br>
      <br>
      There are several other scenarios that might benefit from this
      ability - in fact I'd say it might find many uses, and the varied
      possibilities are likely the reason majordomo had this feature.<br>
      <br>
      I haven't seen anything that indicates this is somehow currently
      possible with mlmmj, so I apologize in advance for missing the
      notes on how to do this currently, if its already available. <br>
      <br>
      With mlmmj, I could envision having another directory similar to
      the existing "subscribers.d", that would contain file(s) of
      addresses that only had permission to "submit" posts. <br>
      <br>
      Or perhaps there could be some way to flag or code files contained
      in the existing <br>
      "subscribers.d" directory that would indicate if the addresses it
      contains are only "submitters" or only " receivers" or both
      "submitters and receivers".<br>
      <br>
      I haven't looked under the hood far enough to know how simple or
      complicated this might be to implement with mlmmj (assuming its
      not there now) so I'm just sharing the thought, in the hope that
      someone might be intrigued by the idea of adding this feature, and
      hoping it would not be difficult to implement.=C2=A0 <br>
      <br>
      Philip Parshley<br>
      <br>
    </font>
  </body>
</html>

--------------070709040301000409010009--

