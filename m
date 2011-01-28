From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Fri, 28 Jan 2011 05:13:50 +0000
Subject: Re: [mlmmj] ezmlm-like single command to subscribe an user?
Message-Id: <AANLkTi=TE99JX9aq_x71L4_J2RuyZLEntUHZaTLFD3Yq@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
In-Reply-To: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Fri, Jan 28, 2011 at 12:28 AM, Ben Schmidt
<mail_ben_schmidt@yahoo.com.au> wrote:
>> Those risks simply do not exist if one forwards an empty email to
>> some_list+subscribe-any.user=3Dexample.com@domain.tld , using the
>> system's mail server.
>
> Some of the web interfaces bundled with Mlmmj make use of similar
> workarounds already, too.

Why all the commandline stuff? I still fail to see what the problem
with sending an empty mail through the system mail server, where the
envelope from is set to any.user@example.com.

mlmmj uses the envelope from to determine who sent the subscription request.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
=A0and totally illogical, with just a little bit more effort?"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 -- A. P.=
 J.


