From: Patrick Bennett <patrick@pebcomputing.com>
Date: Thu, 15 Dec 2005 22:58:04 +0000
Subject: Re: Posts still being silently discarded in 1.2.9 [was Re: [boll+mlmmj@fork.dk:
Message-Id: <43A1F4FC.6040406@pebcomputing.com>
List-Id: <mlmmj.mlmmj.org>
References: <43A1BA85.6010605@pebcomputing.com>
In-Reply-To: <43A1BA85.6010605@pebcomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>* Patrick Bennett <patrick@pebcomputing.com> [Dec 15. 2005 19:48]:
> =20
>
>>>>Excellent!  It sounds like the "find_email_addr()" bit will better=20
>>>>handle the "From:" header my user is locked into.  Soren, you offerred =

>>>>to backport 1.2.8 to sarge before, I wonder if 1.2.9 could also be=20
>>>>backported?
>>>>       =20
>>>>
>>>The packages at http://people.debian.org/~boll/mlmmj/ were built in a sa=
rge
>>>chroot. They are based on the same source tree that was just used to=20
>>>generate the sid packages which should hit unstable real soon now=AE.
>>>
>>>I haven't actually tested the sarge packages though, as I don't have
>>>a sarge system running mlmmj. Let me know if you run into trouble.
>>>     =20
>>>
>>The sarge packages are functioning, thanks Soren!
>>
>>However, the problem of my user's posts being silently discarded is not=20
>>solved.  I've attached the test email he sent for everyone's=20
>>examination.  Unfortunately, this is an email account provided by his=20
>>employer, and he will be starting a new job on Monday!  Thus, though his =

>>issue of not being able to post will likely be resolved by getting a new =

>>email account, he will not be able to test for the bug any more.
>>   =20
>>
>
>What's the name of the list address? As I can see here, it's sent to
>stockton@norcalsolutions.com and has stockton@cielini.org in the To:.
>
> =20
>
the list address is "stockton@cielini.org".  norcalsolutions.com is the=20
"real" domain name of the email server that is hosting the list. =20
cielini.org is a "postfix style" virtual server.

this sample email is the only user, out of 6 or so, that has any problem=20
posting to the list.  you may recall we talked about this before on the=20
list starting on 9/29/2005 under the thread "silently discarded posts". =20
we came to the conclusion that is was because there were two "@" symbols=20
in the "From:" header.   the details and whatnot have not changed except=20
that now the list software is at Soren's packaging of 1.2.9 for sarge. =20
if I understand correctly, 1.2.9 included a patch to better handle the=20
"From:" header, including the case of two (legitimate) "@" symbols. =20
apparently either the patch isn't working entirely correct for this=20
case, or there is some other reason the posts are put into queue/discarded.

    -Patrick
