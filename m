From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Fri, 17 Oct 2014 20:56:02 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <54418262.8090907@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020201060001030807060902"
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------020201060001030807060902
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ben,

Success!!!

The LOCAL_SHELL_FLAGS entry for sendmail.cf worked, and I'm now able to 
send posts to my mlmmj email list.

To recap my steps to getting mlmmj working with Sendmail on a CentOS server:

- mlmmj installed into /usr/local/bin/ by default... but I had to create 
symlinks, one for each mlmmj script, in the /etc/smrsh/ directory before 
they would run when called from sendmail (which uses the smrsh shell).

- to get sendmail to include a Return Path, I added this line to 
/etc/mail/sendmail.mc:

     define(`LOCAL_SHELL_FLAGS', `eu9P')dnl

...then ran "m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf" ...to 
update the changes to the real sendmail.cf file, and restarted the 
sendmail service

- I ran mlmmj-make-ml to create a mailing list

- I created an entry in the /etc/mail/virtusertable file:

listname@mydomain.com    listname.mydomain.com


- I had to update/change the /etc/aliases entry that was auto-created by 
mlmmj-make-ml, from:

    listname: "|/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/listname"

to:

    listname.mydomain.com : "|mlmmj-receive -L /var/spool/mlmmj/listname"

to correctly match the list alias in the virtusertable file, and because 
the symlinks were now directly in the /etc/mail/smrsh directory

- I ran the following chown command, to set the owner of the list dir 
and files to the "mail" user:

chown -R mail /var/spool/mlmmj/[listdir]

- I'm not sure I needed to, but I also created a list-owner entry in the 
virtusertable file:

listname-owner@mydomain.com    listname-owner.mydomain.com

and an entry in the /etc/aliases file:

listname-owner.mydomain.com   myownaddr@mydomain.com
  

I think this covers all the steps I took to successfully configure mlmmj 
for the Sendmail MTA on my CentOS server.  It looks complicated, but 
it's actually not that much work to get it running. (it was a long slog 
to figure out, though!)

I've already created a couple of our small working lists already, and 
have several more to build - which leads me to a couple follow-on 
questions, but I'll send them to the support list under a new thread 
heading.

Thanks again to Ben and Geof for helping me get from zero to 100% up and 
running!

Philip


On 10/16/2014 9:39 PM, Ben Schmidt wrote:
> On 17/10/14 6:02 AM, webmaster@vlsc.org wrote:
>> Oct 16 18:30:00 cloud /etc/smrsh/mlmmj-process[5506]: 
>> mlmmj-process.c:811: Discarding 
>> /var/spool/mlmmj/listname/incoming/6386743745f1a098 due to missing 
>> envelope from address: Success
>>
>> I understand the "due to missing envelope from address" error is a 
>> reference to an
>> (empty) envelope from address, but I'm not sure why this is being 
>> triggered.
>
> The envelope from isn't empty, it's just not passing from Sendmail to
> Mlmmj properly.
>
> Strangely, Mlmmj doesn't look for a Unix/mbox "From " line to extract an
> envelope from address. I actually think this is an Mlmmj shortcoming,
> and I will attempt to address it in a future release.
>
> However, Mlmmj does look for a Return-Path header, and that is
> conspicuously missing from the headers you posted. Did you include
>
> define(`LOCAL_SHELL_FLAGS', `eu9P')dnl
>
> in your Sendmail config as per <http://mlmmj.org/docs/readme-sendmail/>?
>
> It's the capital P that is necessary to include the Return-Path header.
>
> Best regards,
>
> Ben.
>
>
>
>
>
>
>
> -----
> No virus found in this message.
> Checked by AVG - www.avg.com
> Version: 2014.0.4765 / Virus Database: 4040/8403 - Release Date: 10/16/14
>
>


--------------020201060001030807060902
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id s9HKxJF3012060

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif">Ben,<br>
      <br>
      Success!!! <br>
      <br>
      The LOCAL_SHELL_FLAGS entry for sendmail.cf worked, and I'm now
      able to send posts to my mlmmj email list.<br>
      <br>
      To recap my steps to getting mlmmj working with Sendmail on a
      CentOS server:<br>
      <br>
      - mlmmj installed into /usr/local/bin/ by default... but I had to
      create symlinks, one for each mlmmj script, in the /etc/smrsh/
      directory before they would run when called from sendmail (which
      uses the smrsh shell).<br>
      <br>
      - to get sendmail to include a Return Path, I added this line to
      /etc/mail/sendmail.mc:<br>
    </font>
    <pre><font face=3D"Helvetica, Arial, sans-serif">=A0</font><tt>=A0 de=
fine(`LOCAL_SHELL_FLAGS', `eu9P')dnl</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif">...then ran "m4
      /etc/mail/sendmail.mc &gt; /etc/mail/sendmail.cf" ...to update the
      changes to the real sendmail.cf file, and restarted the sendmail
      service<br>
      <br>
      - I ran mlmmj-make-ml to create a mailing list<br>
      <br>
      - I created an entry in the /etc/mail/virtusertable file:<br>
    </font>
    <pre><tt><a class=3D"moz-txt-link-abbreviated" href=3D"mailto:listnam=
e@mydomain.com">listname@mydomain.com</a>=A0=A0=A0 listname.mydomain.com<=
/tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif"><br>
      - I had to update/change the /etc/aliases entry that was
      auto-created by mlmmj-make-ml, from:<br>
    </font>
    <pre><font face=3D"Helvetica, Arial, sans-serif">=A0=A0 </font><tt>li=
stname: "</tt>|/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/listname"=
</pre>
    <font face=3D"Helvetica, Arial, sans-serif">to:<br>
    </font>
    <pre><tt>=A0=A0 listname.mydomain.com : "|mlmmj-receive -L /var/spool=
/mlmmj/listname"</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif">=A0=A0 </font><font
      face=3D"Helvetica, Arial, sans-serif"><font face=3D"Helvetica, Aria=
l,
        sans-serif">to correctly match the list alias in the virtusertabl=
e
        file, and </font>because the symlinks were now directly in the
      /etc/mail/smrsh directory<br>
      <br>
      - I ran the following chown command, to set the owner of the list
      dir and files to the "mail" user:<br>
    </font>
    <pre><tt>chown -R mail /var/spool/mlmmj/[listdir]

</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif">- I'm not sure I needed
      to, but I also created a list-owner entry in the virtusertable
      file:</font><br>
    <pre><tt><tt>listname-owner@mydomain</tt>.com    listname-owner.mydom=
ain.com</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif">and an entry in the
      /etc/aliases file:</font><tt><br>
    </tt>
    <pre>listname-owner.mydomain.com   <a class=3D"moz-txt-link-abbreviat=
ed" href=3D"mailto:myownaddr@mydomain.com">myownaddr@mydomain.com</a>
 </pre>
    <font face=3D"Helvetica, Arial, sans-serif">I think this covers all
      the steps I took to successfully configure mlmmj for the Sendmail
      MTA on my CentOS server.=A0 It looks complicated, but it's actually
      not that much work to get it running. (it was a long slog to
      figure out, though!)<br>
      <br>
      I've already created a couple of our small working lists already,
      and have several more to build - which leads me to a couple
      follow-on questions, but I'll send them to the support list under
      a new thread heading.<br>
      <br>
      Thanks again to Ben and Geof for helping me get from zero to 100%
      up and running!<br>
      <br>
      Philip<br>
      <br>
      <br>
    </font>
    <div class=3D"moz-cite-prefix">On 10/16/2014 9:39 PM, Ben Schmidt
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:54409D7F.60208@yahoo.com.au" type=3D"cite">On
      17/10/14 6:02 AM, <a class=3D"moz-txt-link-abbreviated" href=3D"mai=
lto:webmaster@vlsc.org">webmaster@vlsc.org</a> wrote:
      <br>
      <blockquote type=3D"cite">Oct 16 18:30:00 cloud
        /etc/smrsh/mlmmj-process[5506]: mlmmj-process.c:811: Discarding
        /var/spool/mlmmj/listname/incoming/6386743745f1a098 due to
        missing envelope from address: Success
        <br>
        <br>
        I understand the "due to missing envelope from address" error is
        a reference to an
        <br>
        (empty) envelope from address, but I'm not sure why this is
        being triggered.
        <br>
      </blockquote>
      <br>
      The envelope from isn't empty, it's just not passing from Sendmail
      to
      <br>
      Mlmmj properly.
      <br>
      <br>
      Strangely, Mlmmj doesn't look for a Unix/mbox "From " line to
      extract an
      <br>
      envelope from address. I actually think this is an Mlmmj
      shortcoming,
      <br>
      and I will attempt to address it in a future release.
      <br>
      <br>
      However, Mlmmj does look for a Return-Path header, and that is
      <br>
      conspicuously missing from the headers you posted. Did you include
      <br>
      <br>
      define(`LOCAL_SHELL_FLAGS', `eu9P')dnl
      <br>
      <br>
      in your Sendmail config as per
      <a class=3D"moz-txt-link-rfc2396E" href=3D"http://mlmmj.org/docs/re=
adme-sendmail/">&lt;http://mlmmj.org/docs/readme-sendmail/&gt;</a>?
      <br>
      <br>
      It's the capital P that is necessary to include the Return-Path
      header.
      <br>
      <br>
      Best regards,
      <br>
      <br>
      Ben.
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      -----
      <br>
      No virus found in this message.
      <br>
      Checked by AVG - <a class=3D"moz-txt-link-abbreviated" href=3D"http=
://www.avg.com">www.avg.com</a>
      <br>
      Version: 2014.0.4765 / Virus Database: 4040/8403 - Release Date:
      10/16/14
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------020201060001030807060902--

