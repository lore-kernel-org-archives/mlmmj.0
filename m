From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Wed, 25 Jun 2008 08:30:37 +0000
Subject: Re: Discarded mail: Bad file descriptor
Message-Id: <200806251030.37789.thomas.jarosch@intra2net.com>
List-Id: <mlmmj.mlmmj.org>
References: <200806241046.51759.thomas.jarosch@intra2net.com>
In-Reply-To: <200806241046.51759.thomas.jarosch@intra2net.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello Morten,

On Tuesday, 24. June 2008 16:02:30 Morten K. Poulsen wrote:
> > I'm surprised by the "Bad file descriptor" entry. The size is 3487 bytes,
> > so the message should be processed in memory. Any idea what that could
> > be?
>
> It's due to a log system which always append an error description (based
> on errno), even in cases where the error is not a system error. Ignore
> the "Bad file descriptor" part of the log entry. Remind me when I get
> home, and I will remove that message (reset errno before logging).

Thanks for clearing this up. In the meantime, enjoy your vacation,
I hope there's a beach nearby ;-)

Thomas
