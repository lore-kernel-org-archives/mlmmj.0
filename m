From: Marcus MERIGHI <mcmer-mlmmj@tor.at>
Date: Mon, 03 Oct 2022 13:42:58 +0000
Subject: Re: [mlmmj] clear steps to install
Message-Id: <Yzrm4kAfwVYszlJf@tor.at>
List-Id: <mlmmj.mlmmj.org>
References: <b2c60c9c-a91f-d780-59f8-683eb5cab1ec@agrox.host.lecturify.net>
In-Reply-To: <b2c60c9c-a91f-d780-59f8-683eb5cab1ec@agrox.host.lecturify.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello Agro, 

agro@agrox.host.lecturify.net (agro), 2022.10.03 (Mon) 09:54 (CEST):
> OpenBSD 7.1 + opensmtpd + dovecot with pkg_add mlmmj

that is what I have, too. Did you already read and follow

        /usr/local/share/doc/mlmmj/README ?

When OpenSMTPd receives a message destined for a mlmmj-run list, how
does OpenSMTPd get to know that fact? Via aliases(5)? Via forward(5)?

In my case this goes like:

-> OpenSMTPd receives the messages for <testlist@list.test.at> and looks
   for the delivery info.
-> aliases tells it to deliver mail for <testlist@list.test.at> to the
   system user "testlist".
-> the system user "testlist" has in its .forward:
   |/usr/local/bin/mlmmj-receive -L \
        /home/mlists/at.weiliwohn.ml.weiliwohn-info

This way the inbound messages ends up beeing handled by mlmmj. 

There are multiple ways to achieve this, the one above is just my
preferred one. 

A little more info on your setup, your configs and your logs would help!

Marcus

