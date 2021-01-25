From: Geert Stappers <stappers@stappers.nl>
Date: Mon, 25 Jan 2021 22:08:41 +0000
Subject: [mlmmj] server switch over
Message-Id: <20210125220841.qhrji7b77obenbu6@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Previous-Subject: Re: [mlmmj] server requirements Was: distribution "dead upstream" discussion
In-Reply-To: <35c3fffd-6878-5f16-c3a3-af55e0fba9fe@deganius.de>

On Mon, Jan 25, 2021 at 09:19:35AM +0100, Christof Thalhofer wrote:
> Am 22.01.21 um 07:53 schrieb Geert Stappers:
> 
> >> Hello, do you have any idea how much traffic the website and mailinglist
> >> generate per month?
> > 
> > Expect "low",  an amount of traffic that easily fits
> > on a low cost VPS.   ("low cost VPS"  a virtual private server that comes
> > for the price of half a cinema ticket, something fairly easy to pay.)
> > 
> > I'm willing to chip in to prevent any form of advertisment.
> 
> Yes, we are in the same money zone. :-)
> 
> I'm a member of a German cooperative called Hostsharing, its an Open
> Source Hoster which runs its machines on Debian. I asked the people, we
> can donate some webspace and Traffic for the Mlmmj community.
> 
> The machines here are managed and run (between others) Mlmmj and Apache
> on Debian (currently) Buster, so I think it would be no problem to host
> the website and also this very small mailinglist.
> 
> This would be enough:
> https://www.hostsharing.net/angebote/managed-webspace/
> 
> I am (as well as the people at Hostsharing) personally interested in the
> continuation of the Mlmmj community, because I want to use Mlmmj as a
> successor for the dying Mailman 2.
> 
> So Geert, now you have two offers to choose between. :-)

IIRC has the other choice the status "asking, I be back"



The reason for server switch over is being able to update the website.

Previous requests on website update went unanswered. It is still fine is
someone says "Oh, I can update http://mlmmj.org/"


Plan for server switch over

* Mads Martin  says something like "Yes, those who have DNS of mlmmj.org
  are with us for this transfer"
* Now it makes sense for going further
* We have a Virtual Private Server
* We prepare that VPS
** Webserver
** website content
** Mailserver
** mlmmj
* Some checks
* Go / no go  decission
* Happy flow continues
* DNS update
* DNS cache delay
* We are switched over
* Happy ever after with those who care about mlmmj



Regards
Geert Stappers
-- 
Silence is hard to parse

