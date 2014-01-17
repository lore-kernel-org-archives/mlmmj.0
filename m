From: Yuri D'Elia <wavexx@thregr.org>
Date: Fri, 17 Jan 2014 14:15:04 +0000
Subject: Re: [mlmmj] Export lists subscribers
Message-Id: <52D93AE8.5020002@thregr.org>
List-Id: <mlmmj.mlmmj.org>
References: <CA+pf5NKFhJp2Uo7j-F5g=e+cJUt0PYSrML_4m4dSDqZNrv+19Q@mail.gmail.com>
In-Reply-To: <CA+pf5NKFhJp2Uo7j-F5g=e+cJUt0PYSrML_4m4dSDqZNrv+19Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 01/17/2014 12:08 AM, An=EDbal Pacheco wrote:
> Hello, in our organization all the time people are asking who are the
> subscribers of a list, which represent effort to our IT department. I want
> to export this data from the server frequently and present it on a wiki or
> plain HTML.
> Is there a tool or script that already does that?

Depends on the level of sophistication you need ;)

=3D=3D

#!/bin/sh
list=3D"$1"
echo '<html><body><ul>'
cat /var/spool/mlmmj/$list/subscribers.d/* \
  | sed -e 's/.*/<li><a href=3D"mailto:\0">\0<\/a>/'
echo '</ul></body></html>'

=3D=3D


