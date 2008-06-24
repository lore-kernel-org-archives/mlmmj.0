From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Tue, 24 Jun 2008 08:46:51 +0000
Subject: Discarded mail: Bad file descriptor
Message-Id: <200806241046.51759.thomas.jarosch@intra2net.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello together,

I just checked my logs and noticed an error message from mlmmj
that caught my attention. One spam message contained a more
than malformed "From:" line:

-----------------------------------------------------------
From: "Servidor de e-mail - Tecmicro Sistemas"@Servidor,
        de@intranator.m.i2n, e-mail@intranator.m.i2n, -@intranator.m.i2n,
        Tecmicro@intranator.m.i2n, Sistemas@intranator.m.i2n
-----------------------------------------------------------

This will lead to the following error message:

Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:688: Discarding /var/spool/mlmmj/intra2net-tech/incoming/291e75865c83d9cf due to invalid From:: Bad file descriptor
Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:691: fromemails.emaillist[0] = Servidor de e-mail - Tecmicro Sistemas@Servidor : Bad file descriptor
Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:691: fromemails.emaillist[1] = de@intranator.m.i2n : Bad file descriptor
Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:691: fromemails.emaillist[2] = e-mail@intranator.m.i2n : Bad file descriptor
Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:691: fromemails.emaillist[3] = -@intranator.m.i2n : Bad file descriptor
Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:691: fromemails.emaillist[4] = Tecmicro@intranator.m.i2n : Bad file descriptor
Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:691: fromemails.emaillist[5] = Sistemas@intranator.m.i2n : Bad file descriptor

I'm surprised by the "Bad file descriptor" entry. The size is 3487 bytes,
so the message should be processed in memory. Any idea what that could be?

Cheers,
Thomas
