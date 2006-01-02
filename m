From: "Benny Pedersen" <me@junc.org>
Date: Mon, 02 Jan 2006 10:59:32 +0000
Subject: Re: mlmlmj control files
Message-Id: <52144.80.166.75.19.1136199572.squirrel@mail.junc.org>
List-Id: <mlmmj.mlmmj.org>
References: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
In-Reply-To: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Mon, January 2, 2006 11:07, Mads Martin Joergensen wrote:
> * Benny Pedersen <me@junc.org> [Jan 02. 2006 10:26]:
>> can i set relayhost from a control file ?
>> i tryed to make a patch, but that failed :(
> Quote from TUNABLES:
> =B7 relayhost                     (normal)

i solved it by make an listner for smtpd on 127.0.0.1 in master.cf

with out any restricktions, now finaly mlmmj works here


