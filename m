From: Marvin =?utf-8?Q?G=C3=BClker?= <m-guelker@phoenixmail.de>
Date: Sat, 03 Jun 2017 14:50:22 +0000
Subject: Re: [mlmmj] mlmmj-chown
Message-Id: <20170603145022.GA3717@hades.fritz.box>
List-Id: <mlmmj.mlmmj.org>
References: <20170603142334.GE32244@gpm.stappers.nl>
In-Reply-To: <20170603142334.GE32244@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, Jun 03, 2017 at 04:23:34PM +0200, Geert Stappers wrote:
> But `sudo` is not allowed for all users and surely not wanted
> for webusers  ( the operating system user that runs the webserver
> process )

While I personally don't think that such functionality belongs into
mlmmj, something different should. Currently, mlmmj forcibly creates all
mails in archive/ with a mode of 0600. If I want to run a web archive
under a user different from the mlmmj one, this requires ugly hacks
(such as the one suggested by the OP). Can there be some kind of option
in mlmmj that a) causes the archive files to be created with mode 0640
and b) allows to set the group they're stored under?

Greetings
Marvin

-- 
Blog: https://www.guelkerdev.de
PGP/GPG ID: F1D8799FBCC8BC4F

