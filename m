From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Wed, 15 Oct 2014 20:04:53 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <543ED365.2050506@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050408020601050805000701"
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------050408020601050805000701
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ben!

Thanks to your reply, I was able to make great headway in getting this 
to work :)

I still have one error message I can't solve - but first, this is what I 
did to move things along...

As I mentioned offline to Geof, I already figured out the Sendmail MTA 
wasn't getting the mlmmj program call, as you suspected. I've made all 
references to my domain and email list below generic, to make things 
easier to read.

I tried your suggestion by replacing the aliases entry program-call for 
mlmmj, with a simple "cat" command to determine if this was a Sendmail 
issue, or mlmmj... turns out the "cat" command would not fire either.

Here's what I did to get Sendmail to successfully fire the basic "cat" 
command:

- I added an entry to the /etc/mail/virtusertable file:

  listname@mydomain.com   listname.mydomain.com


- then I changed the entry in the /etc/aliases file:
   from:

     listname: "|cat > /tmp/mailtest.txt"

   to:

     listname.mydomain.com: "|cat > /tmp/mailtest.txt"


Presto!  The "cat" command fired when I sent an email to 
listname@mydomain.com.

(*NOTE: this differs from the README documentation on the mlmmj website; 
which has the aliases entry displayed as "listname: xxxxxxxx" instead of 
"listname.mydomain.com:     xxxxxxx" - I'm not sure if this is Sendmail 
specific, or if this may be important for other MTAs as well... )

So now I had Sendmail set correctly to potentially fire the mlmmj 
program, so I tried this /etc/aliases entry:

listname.mydomain.com: "|/usr/local/bin/mlmmj-receive -L 
/var/spool/mlmmj/listname"

It did get as far as trying to call mlmmj-receive, but it failed to 
start mlmmj-receive:

Oct 15 18:45:22 cloud smrsh: uid 8: attempt to use "mlmmj-receive -L /var/spool/mlmmj/listname" (stat failed)

Oct 15 18:45:22 cloud sendmail[4560]: s9FIjLBe004558: to="|/etc/smrsh/mlmmj-receive -L /var/spool/mlmmj/listname", ctladdr=<listname@mydomain.com> (8/0), delay=00:00:00, xdelay=00:00:00, mailer=prog, pri=35725, dsn=5.0.0, stat=Service unavailable

Oct 15 18:45:22 cloud sendmail[4560]: s9FIjLBe004558: s9FIjMBe004560: DSN: Service unavailable

smrsh: "mlmmj-receive" not available for sendmail programs (stat failed)
554 5.0.0 Service unavailable


So here's what I did to get mlmmj-receive to fire through the restricted 
shell utility smrsh:

- I created symlinks for the mlmmj-xxx executables in the /etc/smrsh 
directory:

  ln -s  /usr/local/bin/mlmmj-xxxxx


Now mlmmj-receive executes when I send an email to listname@mydomain.com!

Unfortunately, I'm now getting the following bounce-error message:

    ----- The following addresses had permanent fatal errors -----
"|mlmmj-receive -L /var/spool/mlmmj/listname"
     (reason: 1)
     (expanded from:<listname@mydomain.com>)

    ----- Transcript of session follows -----
Have to invoke either as root or as the user owning listdir
554 5.3.0 unknown mailer error 1


The symlinks and the actual mlmmj-xxxx files are all chmod as 755, but 
I'm not sure how or where to effect a permissions change to get sendmail 
to "invoke" mlmmj-receive with the proper permissions.

As you can see, this is progress from where I was before... any ideas on 
how I should address the permissions error coming from mlmmj-receive?

Philip



On 10/14/2014 11:02 PM, Ben Schmidt wrote:
> Hi, Philip,
>
> Yes, we are definitely still here! Development has slowed a bit
> recently, but not stopped, and the mailing list is small, but friendly;
> we help when we can.
>
> Looks like not many people know how to configure Sendmail. I toyed with
> it many years ago, and can remember nothing.
>
> Perhaps if you send some configuration snippets we will have a better
> chance helping.
>
> It seems to me like the mail is never even getting to Mlmmj, i.e. that
> it is a Sendmail issue, not an Mlmmj issue. Maybe the Sendmail mailing
> list would be a better source of help.
>
> Perhaps worth a try is putting some other program in place of Mlmmj,
> e.g. a script that just does cat > /tmp/mymail. Perhaps even temporarily
> replacing the mlmmj-receive binary with that script is smartest, as you
> are changing fewest things in the system, then. Then you can send an
> email to the list address and see if it ends up in /tmp/mymail. If so,
> it looks more like an Mlmmj-related issue. If not, get that working
> first, and then replace with Mlmmj and see if you have more luck.
>
> Let us know how you go!
>
> Ben.
>


--------------050408020601050805000701
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id s9FK8B31005115

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif">Hi Ben!<br>
      <br>
      Thanks to your reply, I was able to make great headway in getting
      this to work :)<br>
      <br>
      I still have one error message I can't solve - but first, this is
      what I did to move things along...<br>
      <br>
      As I mentioned offline to Geof, I already figured out the Sendmail
      MTA wasn't getting the mlmmj program call, as you suspected. I've
      made all references to my domain and email list below generic, to
      make things easier to read.<br>
      <br>
      I tried your suggestion by replacing the aliases entry
      program-call for mlmmj, with a simple "cat" command to determine
      if this was a Sendmail issue, or mlmmj... turns out the "cat"
      command would not fire either.<br>
      <br>
      Here's what I did to get Sendmail to successfully fire the basic
      "cat" command:<br>
      <br>
      - I added an entry to the /etc/mail/virtusertable file:<br>
    </font>
    <pre><tt>=A0<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:list=
name@mydomain.com">listname@mydomain.com</a>=A0=A0 listname.mydomain.com<=
/tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif"><br>
      - then I changed the entry in the /etc/aliases file:<br>
      =A0 from:<br>
    </font>
    <pre><tt>=A0 =A0 listname: "|cat &gt; /tmp/mailtest.txt"</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif">=A0 to:<br>
    </font>
    <pre><tt>=A0 =A0 listname.mydomain.com: "|cat &gt; /tmp/mailtest.txt"=
</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif"><br>
      Presto!=A0 The "cat" command fired when I sent an email to
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:listname@mydom=
ain.com">listname@mydomain.com</a>.<br>
      <br>
      (*NOTE: this differs from the README documentation on the mlmmj
      website; which has the aliases entry displayed as "listname: =A0=A0
      xxxxxxxx" instead of "listname.mydomain.com: =A0 =A0 xxxxxxx" - I'm
      not sure if this is Sendmail specific, or if this may be important
      for other MTAs as well... )<br>
      <br>
      So now I had Sendmail set correctly to potentially fire the mlmmj
      program, so I tried this /etc/aliases entry:<br>
      <br>
      listname.mydomain.com: "|/usr/local/bin/mlmmj-receive -L
      /var/spool/mlmmj/listname"<br>
      <br>
      It did get as far as trying to call mlmmj-receive, but it failed
      to start mlmmj-receive:<br>
      <br>
    </font>
    <pre><tt>Oct 15 18:45:22 cloud smrsh: uid 8: attempt to use "mlmmj-re=
ceive -L /var/spool/mlmmj/listname" (stat failed)</tt></pre>
    <pre><tt>Oct 15 18:45:22 cloud sendmail[4560]: s9FIjLBe004558: to=3D"=
|/etc/smrsh/mlmmj-receive -L /var/spool/mlmmj/listname", ctladdr=3D<a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:listname@mydomain.com">&lt;li=
stname@mydomain.com&gt;</a> (8/0), delay=3D00:00:00, xdelay=3D00:00:00, m=
ailer=3Dprog, pri=3D35725, dsn=3D5.0.0, stat=3DService unavailable</tt></=
pre>
    <pre><tt>Oct 15 18:45:22 cloud sendmail[4560]: s9FIjLBe004558: s9FIjM=
Be004560: DSN: Service unavailable</tt></pre>
    <pre><tt>smrsh: "mlmmj-receive" not available for sendmail programs (=
stat failed)
554 5.0.0 Service unavailable</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif"><br>
      So here's what I did to get mlmmj-receive to fire through the
      restricted shell utility smrsh:<br>
      <br>
      - I created symlinks for the mlmmj-xxx executables in the
      /etc/smrsh directory:<br>
      <br>
    </font>
    <pre><tt><span style=3D"vertical-align: middle;">=A0ln -s=A0 /usr/loc=
al/bin/mlmmj-xxxxx</span></tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif"><br>
      Now mlmmj-receive executes when I send an email to
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:listname@mydom=
ain.com">listname@mydomain.com</a>!<br>
      <br>
      Unfortunately, I'm now getting the following bounce-error message:<=
br>
      <br>
    </font>
    <pre><pre><tt>   ----- The following addresses had permanent fatal er=
rors -----
"|mlmmj-receive -L /var/spool/mlmmj/listname"
    (reason: 1)
    (expanded from: <span class=3D"moz-txt-link-rfc2396E"><a class=3D"moz=
-txt-link-rfc2396E" href=3D"mailto:listname@mydomain.com">&lt;listname@my=
domain.com&gt;</a></span>)

   ----- Transcript of session follows -----
Have to invoke either as root or as the user owning listdir
554 5.3.0 unknown mailer error 1</tt></pre></pre>
    <font face=3D"Helvetica, Arial, sans-serif"><br>
      The symlinks and the actual mlmmj-xxxx files are all chmod as 755,
      but I'm not sure how or where to effect a permissions change to
      get sendmail to "invoke" mlmmj-receive with the proper permissions.=
<br>
      <br>
      As you can see, this is progress from where I was before... any
      ideas on how I should address the permissions error coming from mlm=
mj-receive?<br>
      <br>
      Philip</font><br>
    <br>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 10/14/2014 11:02 PM, Ben Schmidt
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:543E0E03.2080102@yahoo.com.au" type=3D"cite">=
Hi,
      Philip,
      <br>
      <br>
      Yes, we are definitely still here! Development has slowed a bit
      <br>
      recently, but not stopped, and the mailing list is small, but
      friendly;
      <br>
      we help when we can.
      <br>
      <br>
      Looks like not many people know how to configure Sendmail. I toyed
      with
      <br>
      it many years ago, and can remember nothing.
      <br>
      <br>
      Perhaps if you send some configuration snippets we will have a
      better
      <br>
      chance helping.
      <br>
      <br>
      It seems to me like the mail is never even getting to Mlmmj, i.e.
      that
      <br>
      it is a Sendmail issue, not an Mlmmj issue. Maybe the Sendmail
      mailing
      <br>
      list would be a better source of help.
      <br>
      <br>
      Perhaps worth a try is putting some other program in place of
      Mlmmj,
      <br>
      e.g. a script that just does cat &gt; /tmp/mymail. Perhaps even
      temporarily
      <br>
      replacing the mlmmj-receive binary with that script is smartest,
      as you
      <br>
      are changing fewest things in the system, then. Then you can send
      an
      <br>
      email to the list address and see if it ends up in /tmp/mymail. If
      so,
      <br>
      it looks more like an Mlmmj-related issue. If not, get that
      working
      <br>
      first, and then replace with Mlmmj and see if you have more luck.
      <br>
      <br>
      Let us know how you go!
      <br>
      <br>
      Ben.
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------050408020601050805000701--

