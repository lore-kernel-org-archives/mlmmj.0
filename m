From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 09 Oct 2007 07:55:15 +0000
Subject: Re: change hostname, messages in queue
Message-Id: <1191916515.5907.3.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <20071008215435.GN7082@localhost>
In-Reply-To: <20071008215435.GN7082@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


On Mon, 2007-10-08 at 23:54 +0200, Lukáš Hlůže wrote:
>   when I change hostname on my debian mail server. Mlmmj only recieve
>   mail and save msg in queue directory and do nothig.

That is strange.

>  I use postfix and procmail to delivery message to mlmmj.

Should be fine.

>  What should I do?

Read the log files. Are there anything there, indicating why it is
acting so strange?

>   So now I change my hostname back but I have some messages in queue
>   dir. What should I do to delivery them. 

Do you run the mlmmj-maintd via cron? If not, you should do that. You
can run it manually once, to see if that delivers your mails:

/usr/bin/mlmmj-maintd -F -L /var/spool/mlmmj/your-list-dir

Morten

