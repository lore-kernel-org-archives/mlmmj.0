From: Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
Date: Mon, 20 Sep 2004 06:57:50 +0000
Subject: Re: mlmmj doesn't send mails to the list
Message-Id: <Pine.LNX.4.61.0409200953540.19142@watson.hemma.bergenheim.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="117353488-1572763463-1095663285=:19142"
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0409200903170.19142@watson.hemma.bergenheim.net>
In-Reply-To: <Pine.LNX.4.61.0409200903170.19142@watson.hemma.bergenheim.net>
To: mlmmj@mlmmj.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--117353488-1572763463-1095663285=:19142
Content-Type: TEXT/PLAIN; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Content-ID: <Pine.LNX.4.61.0409200956551.19142@watson.hemma.bergenheim.net>

On Mon, 20 Sep 2004, [iso-8859-1] S=F8ren Boll Overgaard wrote:

> On Mon, Sep 20, 2004 at 08:30:14AM +0200, S=F8ren Boll Overgaard wrote:
>>
>> Could you include the relevant snippets from /var/spool/mail.log?
>
> That's /var/log/mail.log obviously.
>

This is resolved. I didn't really follow the instructions, so it was my=20
own fault. (:

Thanks anayway. I have put a different exim configuration:

  In the routers section:
  mlmmj_router:
    driver =3D accept
    require_files =3D /etc/mlmmj/lists/${local_part}/control/listaddress
    local_part_suffix_optional
    local_part_suffix =3D +*
    local_parts =3D !.bin:!.etc
    domains =3D +local_domains
    transport =3D mlmmj_transport

  and in the transports section:
  mlmmj_transport:
    driver =3D pipe
    return_path_add
    command =3D /usr/bin/mlmmj-recieve -L /var/spool/mlmmj/${local_part}/
    current_directory =3D /var/spool/mlmmj
    home_directory =3D /var/spool/mlmmj
    user =3D list
    group =3D list

The problem was the missing return_path_add instruction in the transport.

--W

--=20

<:3 )---- Wolf Bergenheim ----( 8:>
--117353488-1572763463-1095663285=:19142--
