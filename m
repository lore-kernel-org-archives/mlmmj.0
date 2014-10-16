From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Thu, 16 Oct 2014 19:02:29 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <54401645.3040805@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050109050301040400010607"
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------050109050301040400010607
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ben,

Thanks for the feedback!

I was able to use chown to change the ownership for all the list files 
as you suggested, and now I've moved several steps closer to getting 
mlmmj working!  (for anyone interested, uid = 8 on my server turned out 
to be user = "mail" )

mlmmj-receive is beginning to process posts sent to my test list, but so 
far they are ending up in

../listname/queue/discarded

and the maillog is reporting this as:

Oct 16 18:29:59 cloud sendmail[5502]: STARTTLS=server, relay=eapps-spx02.vm.eapps.com [69.89.2.76], version=TLSv1/SSLv3, verify=NO, cipher=DHE-RSA-AES256-SHA, bits=256/256

Oct 16 18:29:59 cloud sendmail[5502]: s9GITxnP005502: from=<philip@parshley.net>, size=6474, class=0, nrcpts=1, msgid=<54400DD3.3020404@parshley.net>, proto=ESMTP, daemon=MTA, relay=eapps-spx02.vm.eapps.com [69.89.2.76]

Oct 16 18:30:00 cloud sendmail[5504]: s9GITxnP005502: to="|mlmmj-receive -L /var/spool/mlmmj/sail2", ctladdr=<listname@mydomain.com> (8/0), delay=00:00:01, xdelay=00:00:00, mailer=prog, pri=36735, dsn=2.0.0, stat=Sent

Oct 16 18:30:00 cloud /etc/smrsh/mlmmj-process[5506]: mlmmj-process.c:811: Discarding /var/spool/mlmmj/listname/incoming/6386743745f1a098 due to missing envelope from address: Success


I understand the "due to missing envelope from address" error is a 
reference to an (empty) envelope from address, but I'm not sure why this 
is being triggered.  I've seen some references to this being a problem 
if the envelope from address is in < > brackets, but its unclear to me 
how I can address this. Here's the header from the post file that ended 
up in ../discarded

 From philip@parshley.net Thu Oct 16 18:29:59 2014

Received: from eapps-spx02.vm.eapps.com (eapps-spx02.vm.eapps.com 
[69.89.2.76])

     by cloud.mydomain.com (8.14.4/8.14.4) with ESMTP id s9GITxnP005502

     (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)

     for <listname@mydomain.com>; Thu, 16 Oct 2014 18:29:59 GMT

Received: from sagediagram.com ([216.154.217.29])

     by eapps-spx02.vm.eapps.com with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)

     (Exim 4.84)

     (envelope-from <philip@parshley.net>)

     id 1Xepnz-0006F6-M5

     for listname@mydomain.com; Thu, 16 Oct 2014 14:29:56 -0400

Received-SPF: softfail (sagediagram.com: domain of transitioning 
philip@parshley.net does not designate 24.22.61.28 as permitted sender) 
receiver=sagediagram.com; client-ip=24.22.61.28; helo=[192.168.1.104]; 
envelope-from=philip@parshley.net; x-software=spfmilter 0.97 
http://www.acme.com/software/spfmilter/ with libspf2-1.0.0;

Received: from [192.168.1.104] (c-24-22-61-28.hsd1.or.comcast.net 
[24.22.61.28])

     by sagediagram.com (8.14.2/8.14.2) with ESMTP id s9GITgEh026480

     for <listname@mydomain.com>; Thu, 16 Oct 2014 14:29:42 -0400

Message-ID: <54400DD3.3020404@parshley.net>

Date: Thu, 16 Oct 2014 11:26:27 -0700

From: Philip <philip@parshley.net>

User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 
Thunderbird/24.6.0

MIME-Version: 1.0

To: listname@mydomain.com

Subject: re. test results

Content-Type: multipart/alternative;

  boundary="------------030407040502070403070707"

Received-SPF: pass (eapps-spx02.vm.eapps.com: domain of parshley.net 
designates 216.154.217.29 as permitted sender) client-ip=216.154.217.29; 
envelope-from=philip@parshley.net; helo=sagediagram.com;

X-SPF-Result: eapps-spx02.vm.eapps.com: domain of parshley.net 
designates 216.154.217.29 as permitted sender

X-Filter-ID: 
s0sct1PQhAABKnZB5plbIQgsumjrb/qn8pvMb0r31ZUkfdChetB4bt5LiDYVEZByx1wTMkEUUoeb

  KIhkyzl2dF32XZvZInsoHjme/WxkkRcTakFHLT/0qfWMlO3/QqSFNUDTyjn1ef5evEDDyypLgbJU

  gtOJAkXSMx9YVHdPqxKcv/HxuQ3Apsj8YeBnVa1ZUAt8TTxonK45J05twrVY/P1GDNZ9gBCIxxGx

  VFpn7AN/U/jsH4EXGgfUT7LIXyPec67TIvOBTd6L1MGTcnqLu/y5q0C++Lv/QUF02g1+DZxb5wxw

  q6a5JGTNj4jSCHVb8vzKnEie5ViFLOjCzG8IF5e2XAcAqWhPNQt97ku/DxR4FjctpFCe7sYB5/us

  QEK/UJK+F9HDeJw2f5+jo8HgFDRtF2Igz0UWV+HgG70TkVxp7cowWC4sdJbvT/6MXLfExH4YaDRm

  graL79jkgrbL24PAgTtUp75uqlx0KezvZHVB9dYBSu5jRStj6zksZS+oTOevt9oQNLQ4Wz40vjTd

  BGiH1Wgh6RAenBR+licROGZUa05SLII8ZnNgIPr9luPC4iXwjlL8lh+/xwVCxffWBA==

X-Report-Abuse-To: spam@eapps-spx01.vm.eapps.com

X-Filter-Fingerprint: 
IFrWXGses7OKB5S5G8/dJRn/7L7+nnclbWGk7OJ1jHJA3cTUQ1R++keuE7RDJ8Kg3RbMLUalw1oC

  mj99/u+PoqoVy8a3lsStJtAvpObFX0XnhRv/ZJ3kEy8bfiAr+Fb/UpndEJ0YoaLytXXo8BMTaX2p

  Mk7LBarWD9Fj4R3eIu6C5spubTEXAEkuBKN3yOZvUxf7JO+oAUByCkP7cAJnEooJtGZFyF6tI/I5

  CWVQH2sjWUvnt4XQmbZjx+Gtm4/p

Authentication-Results: vm.eapps.com; spf=pass 
smtp.mailfrom=philip@parshley.net

X-eAppsHosting-Class: ham

X-eAppsHosting-Evidence: Combined (0.20)

X-Recommended-Action: accept

This is a multi-part message in MIME format.

--------------030407040502070403070707

I can see

envelope-from <philip@parshley.net>

in the header, but not sure why this would trigger the discard action, 
and how to fix this... any ideas?

I greatly appreciate all the help you've been providing, and I feel like 
I'm nearly there, but it's still just out of reach...

Philip



On 10/15/2014 2:53 PM, Ben Schmidt wrote:
>> Oct 15 18:45:22 cloud smrsh: uid 8: attempt to use "mlmmj-receive -L 
>> /var/spool/mlmmj/listname" (stat failed)
>
>> Unfortunately, I'm now getting the following bounce-error message:
>>
>>     ----- The following addresses had permanent fatal errors -----
>> "|mlmmj-receive -L /var/spool/mlmmj/listname"
>>      (reason: 1)
>>      (expanded from:<listname@mydomain.com>)
>
>> Have to invoke either as root or as the user owning listdir
>> 554 5.3.0 unknown mailer error 1
>
>> The symlinks and the actual mlmmj-xxxx files are all chmod as 755, but
>> I'm not sure how or where to effect a permissions change to get
>> sendmail to "invoke" mlmmj-receive with the proper permissions.
>
>> As you can see, this is progress from where I was before... any ideas
>> on how I should address the permissions error coming from
>> mlmmj-receive?
>
> This may do it (but obviously understand it; don't execute it blindly!).
> 8 is the UID/user indicated in the sendmail log.
>
> sudo chown 8 /var/spool/mlmmj/listname
>
> Make sure Mlmmj through smrsh can also get to that dir (do you need more
> symlinks, e.g. because you're chrooted?).
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
> Version: 2014.0.4765 / Virus Database: 4040/8394 - Release Date: 10/15/14
>
>


--------------050109050301040400010607
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by cloud.vlsc.org id s9GJ5khP005681

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <font face=3D"Helvetica, Arial, sans-serif"><font face=3D"Helvetica,
        Arial, sans-serif">Ben,<br>
      </font><br>
      Thanks for the feedback!<br>
      <br>
      I was able to use chown to change the ownership for all the list
      files as you suggested, and now I've moved several steps closer to
      getting mlmmj working!=A0 (for anyone interested, uid =3D 8 on my
      server turned out to be user =3D "mail" )<br>
      <br>
      mlmmj-receive is beginning to process posts sent to my test list,
      but so far they are ending up in <br>
      <br>
      ../listname/queue/discarded <br>
      <br>
      and the maillog is reporting this as:<br>
    </font>
    <pre><tt>Oct 16 18:29:59 cloud sendmail[5502]: STARTTLS=3Dserver, rel=
ay=3Deapps-spx02.vm.eapps.com [69.89.2.76], version=3DTLSv1/SSLv3, verify=
=3DNO, cipher=3DDHE-RSA-AES256-SHA, bits=3D256/256</tt></pre>
    <pre><tt>Oct 16 18:29:59 cloud sendmail[5502]: s9GITxnP005502: from=3D=
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:philip@parshley.net">&l=
t;philip@parshley.net&gt;</a>, size=3D6474, class=3D0, nrcpts=3D1, msgid=3D=
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:54400DD3.3020404@parshl=
ey.net">&lt;54400DD3.3020404@parshley.net&gt;</a>, proto=3DESMTP, daemon=3D=
MTA, relay=3Deapps-spx02.vm.eapps.com [69.89.2.76]</tt></pre>
    <pre><tt>Oct 16 18:30:00 cloud sendmail[5504]: s9GITxnP005502: to=3D"=
|mlmmj-receive -L /var/spool/mlmmj/sail2", ctladdr=3D<a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:listname@mydomain.com">&lt;listname@mydomai=
n.com&gt;</a> (8/0), delay=3D00:00:01, xdelay=3D00:00:00, mailer=3Dprog, =
pri=3D36735, dsn=3D2.0.0, stat=3DSent</tt></pre>
    <pre><tt>Oct 16 18:30:00 cloud /etc/smrsh/mlmmj-process[5506]: mlmmj-=
process.c:811: Discarding /var/spool/mlmmj/listname/incoming/6386743745f1=
a098 due to missing envelope from address: Success</tt></pre>
    <font face=3D"Helvetica, Arial, sans-serif"><br>
    </font><font face=3D"Helvetica, Arial, sans-serif">I understand the "=
</font><font
      face=3D"Helvetica, Arial, sans-serif">due to missing envelope from
      address</font><font face=3D"Helvetica, Arial, sans-serif">" error i=
s
      a reference to an (empty) envelope from address, but I'm not sure
      why this is being triggered.=A0 I've seen some references to this
      being a problem if the envelope from address is in &lt; &gt;=A0
      brackets, but its unclear to me how I can address this. Here's the
      header from the post file that ended up in ../discarded <br>
      <br>
    </font>
    <p><tt>From <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:phil=
ip@parshley.net">philip@parshley.net</a> Thu Oct 16 18:29:59 2014</tt></p=
>
    <p><tt>Received: from eapps-spx02.vm.eapps.com
        (eapps-spx02.vm.eapps.com [69.89.2.76])</tt></p>
    <p><tt>=A0=A0=A0 by cloud.mydomain.com (8.14.4/8.14.4) with ESMTP id
        s9GITxnP005502</tt></p>
    <p><tt>=A0=A0=A0 (version=3DTLSv1/SSLv3 cipher=3DDHE-RSA-AES256-SHA b=
its=3D256
        verify=3DNO)</tt></p>
    <p><tt>=A0=A0=A0 for <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:listname@mydomain.com">&lt;listname@mydomain.com&gt;</a>; Thu, 16 Oct 2=
014
        18:29:59 GMT</tt></p>
    <p><tt>Received: from sagediagram.com ([216.154.217.29])</tt></p>
    <p><tt>=A0=A0=A0 by eapps-spx02.vm.eapps.com with esmtps
        (TLSv1:DHE-RSA-AES256-SHA:256)</tt></p>
    <p><tt>=A0=A0=A0 (Exim 4.84)</tt></p>
    <p><tt>=A0=A0=A0 (envelope-from <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:philip@parshley.net">&lt;philip@parshley.net&gt;</a>)</tt></=
p>
    <p><tt>=A0=A0=A0 id 1Xepnz-0006F6-M5</tt></p>
    <p><tt>=A0=A0=A0 for <a class=3D"moz-txt-link-abbreviated" href=3D"ma=
ilto:listname@mydomain.com">listname@mydomain.com</a>; Thu, 16 Oct 2014 1=
4:29:56
        -0400</tt></p>
    <p><tt>Received-SPF: softfail (sagediagram.com: domain of
        transitioning <a class=3D"moz-txt-link-abbreviated" href=3D"mailt=
o:philip@parshley.net">philip@parshley.net</a> does not designate 24.22.6=
1.28
        as permitted sender) receiver=3Dsagediagram.com;
        client-ip=3D24.22.61.28; helo=3D[192.168.1.104];
        <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:envelope-fro=
m=3Dphilip@parshley.net">envelope-from=3Dphilip@parshley.net</a>; x-softw=
are=3Dspfmilter 0.97
        <a class=3D"moz-txt-link-freetext" href=3D"http://www.acme.com/so=
ftware/spfmilter/">http://www.acme.com/software/spfmilter/</a> with libsp=
f2-1.0.0;</tt></p>
    <p><tt>Received: from [192.168.1.104]
        (c-24-22-61-28.hsd1.or.comcast.net [24.22.61.28])</tt></p>
    <p><tt>=A0=A0=A0 by sagediagram.com (8.14.2/8.14.2) with ESMTP id
        s9GITgEh026480</tt></p>
    <p><tt>=A0=A0=A0 for <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:listname@mydomain.com">&lt;listname@mydomain.com&gt;</a>; Thu, 16 Oct 2=
014
        14:29:42 -0400</tt></p>
    <p><tt>Message-ID: <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
54400DD3.3020404@parshley.net">&lt;54400DD3.3020404@parshley.net&gt;</a><=
/tt></p>
    <p><tt>Date: Thu, 16 Oct 2014 11:26:27 -0700</tt></p>
    <p><tt>From: Philip <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:philip@parshley.net">&lt;philip@parshley.net&gt;</a></tt></p>
    <p><tt>User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0)
        Gecko/20100101 Thunderbird/24.6.0</tt></p>
    <p><tt>MIME-Version: 1.0</tt></p>
    <p><tt>To: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:listn=
ame@mydomain.com">listname@mydomain.com</a></tt></p>
    <p><tt>Subject: re. test results<br>
      </tt></p>
    <p><tt>Content-Type: multipart/alternative;</tt></p>
    <p><tt>=A0boundary=3D"------------030407040502070403070707"</tt></p>
    <p><tt>Received-SPF: pass (eapps-spx02.vm.eapps.com: domain of
        parshley.net designates 216.154.217.29 as permitted sender)
        client-ip=3D216.154.217.29; <a class=3D"moz-txt-link-abbreviated"=
 href=3D"mailto:envelope-from=3Dphilip@parshley.net">envelope-from=3Dphil=
ip@parshley.net</a>;
        helo=3Dsagediagram.com;</tt></p>
    <p><tt>X-SPF-Result: eapps-spx02.vm.eapps.com: domain of
        parshley.net designates 216.154.217.29 as permitted sender</tt></=
p>
    <p><tt>X-Filter-ID:
s0sct1PQhAABKnZB5plbIQgsumjrb/qn8pvMb0r31ZUkfdChetB4bt5LiDYVEZByx1wTMkEUU=
oeb</tt></p>
    <p><tt>=A0KIhkyzl2dF32XZvZInsoHjme/WxkkRcTakFHLT/0qfWMlO3/QqSFNUDTyjn=
1ef5evEDDyypLgbJU</tt></p>
    <p><tt>=A0gtOJAkXSMx9YVHdPqxKcv/HxuQ3Apsj8YeBnVa1ZUAt8TTxonK45J05twrV=
Y/P1GDNZ9gBCIxxGx</tt></p>
    <p><tt>=A0VFpn7AN/U/jsH4EXGgfUT7LIXyPec67TIvOBTd6L1MGTcnqLu/y5q0C++Lv=
/QUF02g1+DZxb5wxw</tt></p>
    <p><tt>=A0q6a5JGTNj4jSCHVb8vzKnEie5ViFLOjCzG8IF5e2XAcAqWhPNQt97ku/DxR=
4FjctpFCe7sYB5/us</tt></p>
    <p><tt>=A0QEK/UJK+F9HDeJw2f5+jo8HgFDRtF2Igz0UWV+HgG70TkVxp7cowWC4sdJb=
vT/6MXLfExH4YaDRm</tt></p>
    <p><tt>=A0graL79jkgrbL24PAgTtUp75uqlx0KezvZHVB9dYBSu5jRStj6zksZS+oTOe=
vt9oQNLQ4Wz40vjTd</tt></p>
    <p><tt>=A0BGiH1Wgh6RAenBR+licROGZUa05SLII8ZnNgIPr9luPC4iXwjlL8lh+/xwV=
CxffWBA=3D=3D</tt></p>
    <p><tt>X-Report-Abuse-To: <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:spam@eapps-spx01.vm.eapps.com">spam@eapps-spx01.vm.eapps.com</a><=
/tt></p>
    <p><tt>X-Filter-Fingerprint:
IFrWXGses7OKB5S5G8/dJRn/7L7+nnclbWGk7OJ1jHJA3cTUQ1R++keuE7RDJ8Kg3RbMLUalw=
1oC</tt></p>
    <p><tt>=A0mj99/u+PoqoVy8a3lsStJtAvpObFX0XnhRv/ZJ3kEy8bfiAr+Fb/UpndEJ0=
YoaLytXXo8BMTaX2p</tt></p>
    <p><tt>=A0Mk7LBarWD9Fj4R3eIu6C5spubTEXAEkuBKN3yOZvUxf7JO+oAUByCkP7cAJ=
nEooJtGZFyF6tI/I5</tt></p>
    <p><tt>=A0CWVQH2sjWUvnt4XQmbZjx+Gtm4/p</tt></p>
    <p><tt>Authentication-Results: vm.eapps.com; spf=3Dpass
        <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:smtp.mailfro=
m=3Dphilip@parshley.net">smtp.mailfrom=3Dphilip@parshley.net</a></tt></p>
    <p><tt>X-eAppsHosting-Class: ham</tt></p>
    <p><tt>X-eAppsHosting-Evidence: Combined (0.20)</tt></p>
    <p><tt>X-Recommended-Action: accept</tt></p>
    <p><tt>This is a multi-part message in MIME format.</tt></p>
    <p><tt>--------------030407040502070403070707</tt></p>
    <font face=3D"Helvetica, Arial, sans-serif">I can see <br>
    </font><br>
    <font face=3D"Helvetica, Arial, sans-serif"><tt>envelope-from
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:philip@parshley=
.net">&lt;philip@parshley.net&gt;</a><br>
      </tt><br>
      in the header, but not sure why this would trigger the discard
      action, and how to fix this... any ideas?<br>
      <br>
      I greatly appreciate all the help you've been providing, and I
      feel like I'm nearly there, but it's still just out of reach...<br>
      <br>
      Philip</font><br>
    <br>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 10/15/2014 2:53 PM, Ben Schmidt
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:543EECC3.4000108@yahoo.com.au" type=3D"cite">
      <blockquote type=3D"cite">Oct 15 18:45:22 cloud smrsh: uid 8:
        attempt to use "mlmmj-receive -L /var/spool/mlmmj/listname"
        (stat failed)
        <br>
      </blockquote>
      <br>
      <blockquote type=3D"cite">Unfortunately, I'm now getting the
        following bounce-error message:
        <br>
        <br>
        =A0=A0=A0 ----- The following addresses had permanent fatal error=
s
        -----
        <br>
        "|mlmmj-receive -L /var/spool/mlmmj/listname"
        <br>
        =A0=A0=A0=A0 (reason: 1)
        <br>
        =A0=A0=A0=A0 (expanded from:<a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:listname@mydomain.com">&lt;listname@mydomain.com&gt;</a>)
        <br>
      </blockquote>
      <br>
      <blockquote type=3D"cite">Have to invoke either as root or as the
        user owning listdir
        <br>
        554 5.3.0 unknown mailer error 1
        <br>
      </blockquote>
      <br>
      <blockquote type=3D"cite">The symlinks and the actual mlmmj-xxxx
        files are all chmod as 755, but
        <br>
        I'm not sure how or where to effect a permissions change to get
        <br>
        sendmail to "invoke" mlmmj-receive with the proper permissions.
        <br>
      </blockquote>
      <br>
      <blockquote type=3D"cite">As you can see, this is progress from
        where I was before... any ideas
        <br>
        on how I should address the permissions error coming from
        <br>
        mlmmj-receive?
        <br>
      </blockquote>
      <br>
      This may do it (but obviously understand it; don't execute it
      blindly!).
      <br>
      8 is the UID/user indicated in the sendmail log.
      <br>
      <br>
      sudo chown 8 /var/spool/mlmmj/listname
      <br>
      <br>
      Make sure Mlmmj through smrsh can also get to that dir (do you
      need more
      <br>
      symlinks, e.g. because you're chrooted?).
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
      Version: 2014.0.4765 / Virus Database: 4040/8394 - Release Date:
      10/15/14
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------050109050301040400010607--

