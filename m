From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Thu, 25 Nov 2004 10:30:24 +0000
Subject: Re: Moving from Mailman to mlmmj
Message-Id: <20041125103024.GC8153@mopo.i.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0411251200530.27766@watson.hemma.bergenheim.net>
In-Reply-To: <Pine.LNX.4.61.0411251200530.27766@watson.hemma.bergenheim.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Wolf,

On Thu, Nov 25, 2004 at 12:02:25PM +0200, Wolf Bergenheim wrote:
> I've decided to move from Mailman to mlmmj, but I have all the archives to
> work with. Do you ppl know of any handy tool to convert Mailman mbox style
> archives to mlmmj archives?

When we converted FLUG's lists from Mailman to mlmmj, we just resent the mails
to the list (without subscribers) like this:

formail -de -s /usr/local/bin/mlmmj-recieve -L \
     /var/spool/mlmmj/flug-announce/ </tmp/flug-announce.mbox

Best regards,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
