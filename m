From: Nate Beaty <natebeaty@gmail.com>
Date: Thu, 14 Sep 2006 18:52:19 +0000
Subject: Re: submod tunable not working for me.. ?
Message-Id: <19688B20-4F22-4E11-85F3-A736F6BB8F54@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
In-Reply-To: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sep 14, 2006, at 11:18 AM, Mads Martin Joergensen wrote:

> Hmmm, I wonder why it would return 1 and not report anything in the
> logs... weird indeed.

The Exim log, correct?

> It's the exact same with an empty submod file, but something in owner
> instead?

Yep. My control dir:

 > /var/spool/mlmmj/comix$ la control
-rw-r--r-- 1 Debian-exim Debian-exim   7 2006-08-25 19:01 bouncelife
-rw-r--r-- 1 Debian-exim Debian-exim 323 2006-08-25 19:02 customheaders
-rw-r--r-- 1 Debian-exim Debian-exim 127 2006-08-25 19:01 footer
-rw-r--r-- 1 Debian-exim Debian-exim  23 2006-08-25 19:01 listaddress
-rw-r--r-- 1 Debian-exim Debian-exim  16 2006-09-13 23:37 owner
-rw-r--r-- 1 Debian-exim Debian-exim  12 2006-08-25 19:02 prefix
-rw-r--r-- 1 Debian-exim Debian-exim   0 2006-09-14 11:33 submod
-rw-r--r-- 1 Debian-exim Debian-exim   0 2006-08-25 19:01 subonlypost
-rw-r--r-- 1 Debian-exim Debian-exim   0 2006-08-25 19:01 verp

 > /var/spool/mlmmj/comix$ more control/owner
nate@clixel.com

And the same thing happens -- I get a bounce msg, but the file is =20
removed from subconf/ and one created in moderation/ (and no email to =20
"owner")

2006-09-14 11:36:46 1GNw4r-0007gb-V5 SA: Debug: SAEximRunCond expand =20
returned: '1'
2006-09-14 11:36:46 1GNw4r-0007gb-V5 SA: Debug: check succeeded, =20
running spamc
2006-09-14 11:36:47 1GNw4r-0007gb-V5 SA: Action: scanned but message =20
isn't spam: score=3D-2.1 required=3D5.0 (scanned in 1/1 secs | Message-=20
Id: 000AAB1C-88EF-43B0-8952-1168F9E033A1@gmail.com). From =20
<natebeaty@gmail.com> (host=3Dnz-out-0102.google.com [64.233.162.202]) =20
for comix+confsub-3b83c7304630f9c1-natebeaty=3Dgmail.com@lists.clixel.com
2006-09-14 11:36:47 1GNw4r-0007gb-V5 <=3D natebeaty@gmail.com H=3Dnz-=20
out-0102.google.com [64.233.162.202] P=3Desmtp S'69 =20
id=000AAB1C-88EF-43B0-8952-1168F9E033A1@gmail.com
2006-09-14 11:36:47 1GNw4r-0007gb-V5 ** comix@lists.clixel.com <comix=20
+confsub-3b83c7304630f9c1-natebeaty=3Dgmail.com@lists.clixel.com> =20
R=3Dmlmmj_router T=3Dmlmmj_transport: Child process of mlmmj_transport =20
transport returned 1 from command: /usr/bin/mlmmj-recieve

And the bounce msg:

> This message was created automatically by mail delivery software.
>
> A message that you sent could not be delivered to one or more of its
> recipients. This is a permanent error. The following address(es) =20
> failed:
>
>   comix+confsub-3b83c7304630f9c1-natebeaty=3Dgmail.com@lists.clixel.com
>     local delivery failed
>
> ------ This is a copy of the message, including all the headers. =20
> ------
>
> Return-path: <natebeaty@gmail.com>
> Received: from nz-out-0102.google.com ([64.233.162.202])
> 	by mail.clixel.com with esmtp (Exim 4.60)
> 	(envelope-from <natebeaty@gmail.com>)
> 	id 1GNw4r-0007gb-V5
> 	for comix+confsub-3b83c7304630f9c1-=20
> natebeaty=3Dgmail.com@lists.clixel.com; Thu, 14 Sep 2006 11:36:47 -0700
> Received: by nz-out-0102.google.com with SMTP id 4so1250017nzn
>         for <comix+confsub-3b83c7304630f9c1-=20
> natebeaty=3Dgmail.com@lists.clixel.com>; Thu, 14 Sep 2006 11:43:09 =20
> -0700 (PDT)
> DomainKey-Signature: a=3Drsa-sha1; q=3Ddns; c=3Dnofws;
>         s=BEta; d=3Dgmail.com;
>         h=3Dreceived:mime-version:in-reply-to:references:content-=20
> type:message-id:content-transfer-encoding:from:subject:date:to:x-=20
> mailer;
>         b=3DIFA9G/tbR=20
> +udjUFJSKBM6KO6ZT5wLpG7YLfSyICLWRNWUVY4orSDT5HAUEN2WVHhFJSUzDiFRfSzMAw=20
> MjO2AdTLUTo7eXOYD/V0pzEJeRYFztM=20
> +ULAgz3X87jXz6DauLN0SY3ylCx0S4nf3w5339FUZMMi7nhe0XUV9EJERz54M> Received: =
by 10.65.112.5 with SMTP id p5mr11160788qbm;
>         Thu, 14 Sep 2006 11:43:08 -0700 (PDT)
> Received: from ?192.168.0.16? ( [63.105.22.58])
>         by mx.gmail.com with ESMTP id e11sm1393584qbc.=20
> 2006.09.14.11.43.08;
>         Thu, 14 Sep 2006 11:43:08 -0700 (PDT)
> Mime-Version: 1.0 (Apple Message framework v752.2)
> In-Reply-To: <1158258829-25987b96-mlmmj-6c66daf9@2721aabb.plonk>
> References: <1158258829-25987b96-mlmmj-6c66daf9@2721aabb.plonk>
> Content-Type: text/plain; charset=3DUS-ASCII; delsp=3Dyes; format=3Dflowed
> Message-Id: <000AAB1C-88EF-43B0-8952-1168F9E033A1@gmail.com>
> Content-Transfer-Encoding: 7bit
> From: Nate Beaty <natebeaty@gmail.com>
> Date: Thu, 14 Sep 2006 11:43:04 -0700
> To: comix+confsub-3b83c7304630f9c1-=20
> natebeaty=3Dgmail.com@lists.clixel.com
> X-Mailer: Apple Mail (2.752.2)
> X-SA-Exim-Connect-IP: 64.233.162.202
> X-SA-Exim-Mail-From: natebeaty@gmail.com
> X-Spam-Checker-Version: SpamAssassin 3.1.0 (2005-09-13) on =20
> mail.clixel.com
> X-Spam-Level:
> X-Spam-Status: No, score=3D-2.1 required=3D5.0 tests=3DAWL,BAYES_00 =20
> autolearn=3Dham
> 	version=3D3.1.0
> Subject: Re: Confirm subscription to comix@lists.clixel.com
> X-SA-Exim-Version: 4.2 (built Thu, 14 Apr 2005 16:52:54 +0000)
> X-SA-Exim-Scanned: Yes (on mail.clixel.com)
>
>
> On Sep 14, 2006, at 11:33 AM, comix+help@lists.clixel.com wrote:
>
>
>> Hi, this is the mlmmj program managing the mailinglist
>>
>> comix@lists.clixel.com
>>
>> To confirm you want the address
>>
>> natebeaty@gmail.com
>>
>> added to this list, please send a reply to
>>
>> comix+confsub-3b83c7304630f9c1-natebeaty=3Dgmail.com@lists.clixel.com
>>
>> This confirmation serves two purposes. It tests that mail can be
>> sent to
>> your address. Secondly it makes sure someone else did not try and
>> subscribe your emailaddress without your permission.
>>
>> Your mailer may automatically reply to the confirmation address
>> when you hit
>> the reply button.
>>
>> The subject and the body of the mail can be anything.

Thanks again!

Nate.

--
Clixel Design & Coding ~ http://clixel.com/



