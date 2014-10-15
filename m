From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 15 Oct 2014 06:02:43 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <543E0E03.2080102@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi, Philip,

Yes, we are definitely still here! Development has slowed a bit
recently, but not stopped, and the mailing list is small, but friendly;
we help when we can.

Looks like not many people know how to configure Sendmail. I toyed with
it many years ago, and can remember nothing.

Perhaps if you send some configuration snippets we will have a better
chance helping.

It seems to me like the mail is never even getting to Mlmmj, i.e. that
it is a Sendmail issue, not an Mlmmj issue. Maybe the Sendmail mailing
list would be a better source of help.

Perhaps worth a try is putting some other program in place of Mlmmj,
e.g. a script that just does cat > /tmp/mymail. Perhaps even temporarily
replacing the mlmmj-receive binary with that script is smartest, as you
are changing fewest things in the system, then. Then you can send an
email to the list address and see if it ends up in /tmp/mymail. If so,
it looks more like an Mlmmj-related issue. If not, get that working
first, and then replace with Mlmmj and see if you have more luck.

Let us know how you go!

Ben.



On 15/10/14 5:16 AM, webmaster@vlsc.org wrote:
> Hi Geof!
>
> Thanks for your note.
>
> I have not heard any response, except an automated note - some list membe=
r's
> original email address is no longer valid.
>
> I'm still attempting to chase down the proper configuration to get mlmmj =
running
> with Sendmail as the MTA.  I too, considered using Postfix, but Sendmail =
is
> already running, and don't want to try with Postfix if it's not required.
>
> I've begun the slow process of reading through the list archives, but hav=
en't
> found anything that helps me yet.
>
> When you tried asking the list previously, did you receive any responses?=
  If so,
> can you recall more specifically when that might have been? - I'd like to=
 go back
> and see any feedback you might have received, even if it wasn't enough to=
 help you
> solve this. Perhaps a 2nd pair of eyes on the same feedback, combined wit=
h what
> I'm seeing on my server, might somehow reveal the trick.
>
> Is there anyone still doing development/support for mlmmj?
>
> I've spend years working with and configuring servers, including customiz=
ing
> automated processes that work in the background with majordomo lists.
> Unfortunately majordomo hasn't been supported in years and is quickly bec=
oming
> unusable in today's server/mail environments.
>
> I would love to find a new mailing list tool to work with, and mlmmj seem=
s like a
> great candidate, but I need some help getting out of the starting blocks =
with
> configuring this on a CentOS LAMP server environment running Sendmail - a=
 very
> common platform.
>
> Unless I've completely missed something obvious, the documentation on the=
 mlmmj
> website doesn't speak to running with Sendmail, except when trying to use=
 VERP
> (using VERP isn't a requirement for configuring mlmmj to work with Sendma=
il, is it?)
>
> I'm not even sure that my issue is related Sendmail, but I can't find any
> documentation that can tell me either way.
>
> Any help that can be provided would be greatly appreciated!!!
>
> Philip
>
>
>
> On 10/14/2014 5:26 AM, G Stansfield wrote:
>> On 08-Oct-14 7:00 PM, webmaster@vlsc.org wrote:
>>> I looked through the documentation, and installed mlmmj per the readme
>>> and install documents on a virtual CentOS server.
>>>
>>> I have created a test email list - sail2@vlsc.org - and added 2
>>> subscribers using mlmmj-sub. All appears to be setup properly, but when
>>> I send an email to the list using one of the subscribed addresses
>>> (webmaster@vlsc.org), my mail log file shows the following:
>>>
>>> Oct    7 23:14:21 cloud sendmail[1390]: s97NEL7Z001390:
>>> from=3D<webmaster@vlsc.org>, size=1250, class=3D0, nrcpts=3D1,
>>> msgid=3D<54347310.8030905@vlsc.org>, proto=3DESMTP, daemon=3DMSA,
>>> relay=3Dc-24-22-61-28.hsd1.or.comcast.net [24.22.61.28]
>>>
>>> Oct    7 23:14:22 cloud sendmail[1390]: s97NEL7Z001390: Milter insert (=
1):
>>> header: DKIM-Signature:    v=3D1; a=3Drsa-sha256; c=3Dsimple/simple; d=
=3Dvlsc.org;
>>> s=DEfault;\n\tt=1412723662;
>>> bh=3DSrfRFSC5LbQjGOAy8L6/MImtgtMNuon//Nkbtb0XVZI=3D;\n\th=DAte:From:To:=
Subject;\n\tb=3DoKK6sefKYUbo7sC8oIAK0bnVA92vas8lkpOYQsVd//ru+cu5Eyg13wGRlZ+=
vyAUH2\n\t
>>> ko/f+ma6dQdizl1mVIq35h62m1tS+THd8LMZtadOFT1kiyG2HHyasmiqK1UuVjCbxO\n\t
>>> 6RfbPTriyZKsXnZfDK4y4pcoAqRextw+ZdKOrDU8>>>
>>> Oct    7 23:14:22 cloud opendkim[771]: s97NEL7Z001390: DKIM-Signature f=
ield
>>> added (s=DEfault, d=3Dvlsc.org)
>>>
>>> Oct    7 23:14:22 cloud sendmail[1392]: s97NEL7Z001390: to=3D/dev/null,
>>> ctladdr=3D<sail2@vlsc.org>  (8/0), delay=00:00:01, xdelay=00:00:00,
>>> mailer=3D*file*, pri1824, dsn=3D2.0.0, stat=3DSent
>>>
>>>
>>> The entry "to=3D/dev/null, ctladdr=3D<sail2@vlsc.org>" seems suspicious,
>>> like the email is being dumped to /dev/null instead of being delivered
>>> to the list.
>>>
>>> Can anyone help me by letting me know if I've missed some piece in my
>>> setup, or at least how to interpret this log entry correctly?
>>>
>>> I'm a refugee from majordomo who is trying to get our new server running
>>> with mlmmj so our organization can continue to run several small
>>> in-house email lists.
>>>
>>> Thanks for any help!
>>>
>>> Philip
>> Hi Philip!
>> Did you come right with this? If so, please tell me how!
>>
>> I tried this some years ago in a home / test environment (using OpenSUSE=
) before
>> rolling out to a small production LAN - and failed miserably! The only
>> documentation I found was from mlmmj. Asked the mlmmj list and still did=
 not
>> come right. Perhaps I was misunderstanding something on the sendmail sid=
e of
>> things.
>>
>> I toyed with the idea of switching to postfix, but have some custom rule=
s in
>> sendmail so did not want to take on a new learning curve for what was
>> essentially a functionality for which the users were not clamouring at t=
hat time.
>>
>> Regards,
>> Geoff
>>
>>
>>
>>
>> -----
>> No virus found in this message.
>> Checked by AVG - www.avg.com
>> Version: 2014.0.4765 / Virus Database: 4040/8384 - Release Date: 10/13/14
>>
>>
>

