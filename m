From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 24 Jun 2008 14:02:30 +0000
Subject: Re: Discarded mail: Bad file descriptor
Message-Id: <4860FE76.1040700@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200806241046.51759.thomas.jarosch@intra2net.com>
In-Reply-To: <200806241046.51759.thomas.jarosch@intra2net.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thomas Jarosch wrote:
> I just checked my logs and noticed an error message from mlmmj
> that caught my attention. One spam message contained a more
> than malformed "From:" line:
> Jun 24 06:13:51 intranator /usr/bin/mlmmj-process[9274]: mlmmj-process.c:688: Discarding /var/spool/mlmmj/intra2net-tech/incoming/291e75865c83d9cf due to invalid From:: Bad file descriptor
...
> I'm surprised by the "Bad file descriptor" entry. The size is 3487 bytes,
> so the message should be processed in memory. Any idea what that could be?

It's due to a log system which always append an error description (based 
on errno), even in cases where the error is not a system error. Ignore 
the "Bad file descriptor" part of the log entry. Remind me when I get 
home, and I will remove that message (reset errno before logging).

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
