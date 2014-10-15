From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Wed, 15 Oct 2014 12:19:02 +0000
Subject: [mlmmj] Experimenting with software configuration (was: Sendmail and mlmmj)
Message-Id: <20141015121902.GC26470@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Oct 15, 2014 at 11:32:38AM +0200, G Stansfield wrote:
> I don't have a test
> machine at present to work on - and clearly can't mess with the
> sendmail config on the operational server!

I am sorry I can't help with sendmail, last time I touched it
in the early 90's :-)

There's an easy solution to not having a test machine.

There are plenty of cheap virtual machine providers - you can fire up
a VM with any OS image you want, install some software and play with
setting until you're satisfied. I do it all the time.

You can even set up a VPN to your network if you want to test how it
will work there before putting your solution to operation.

As for email itself, it could be a bit tricker than for anything
else, because you need those pesky MX records and stuff. When I am
testing some new email 'trick' I usually create a subdomain within
the domain I control, set all the records (MX, TXT/SPF) and then
experiment with settings until I get it working, than simply
implement it in the same way on the target domain.

I don't want to turn this email into an advertisement, so if your're
interested is specific providers, mail me directly - just solve
the little puzzle from the signature :-)

P.

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

