From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Tue, 24 Nov 2015 07:40:18 +0000
Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <20151124074017.GA3414@europa.afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <2814c8bd343523366b23a6289b918a5f@swn.nu>
In-Reply-To: <2814c8bd343523366b23a6289b918a5f@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi Christian,

On 2015-11-23 at 23:08:19 +0100, Christian Gleerup wrote:
> Good question,
> there is 'something' at port 25, here is the output
...
> tcp=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0 0 0.0.0.0:25=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0.0.0.0:*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 L=
ISTEN=A0=A0=A0=A0=A0 1135/master

So, Postfix *is* listening on TCP/25. Can you telnet to 127.0.0.1 25 ?

Kind regards,
Morten

