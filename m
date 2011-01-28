From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 28 Jan 2011 06:03:48 +0000
Subject: Re: [mlmmj] ezmlm-like single command to subscribe an user?
Message-Id: <4D425C44.5050105@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
In-Reply-To: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 28/01/11 4:13 PM, Mads Martin J=F8rgensen wrote:
> On Fri, Jan 28, 2011 at 12:28 AM, Ben Schmidt
> <mail_ben_schmidt@yahoo.com.au>  wrote:
>>> Those risks simply do not exist if one forwards an empty email to
>>> some_list+subscribe-any.user=3Dexample.com@domain.tld , using the
>>> system's mail server.
>>
>> Some of the web interfaces bundled with Mlmmj make use of similar
>> workarounds already, too.
>
> Why all the commandline stuff? I still fail to see what the problem
> with sending an empty mail through the system mail server, where the
> envelope from is set to any.user@example.com.

I expect that's what the current mlmmj web interface does. All I was
referring to was the use of the mail system rather than the commandline
to avoid having to deal with permissions etc..

As far as I can tell, the only real benefit to the Ezmlm way rather than
the current Mlmmj way is that it leverages the support of existing Ezmlm
plugins for CMSes, as the OP mentioned.

Ben.



> mlmmj uses the envelope from to determine who sent the subscription
> request.


