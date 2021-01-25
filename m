From: Eric Wong <e@80x24.org>
Date: Mon, 25 Jan 2021 19:26:01 +0000
Subject: Re: [mlmmj] mlmmj archive recovery
Message-Id: <20210125192601.GB25291@dcvr>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20210125T083117-292157525Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20210125T083117-292157525Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Robin H. Johnson" <robbat2@gentoo.org> wrote:
> MARC + 1 alternate site, in case MARC has a large outage again.

I don't like promoting my own work...
Anyways, I try to keep public-inbox easy-to-install by only
depending on stuff packaged on GNU and *BSD systems.  Thus,
anybody should be able to host their own instance (and mirror
existing instances via "git clone --mirror")

	https://public-inbox.org/INSTALL.html
	https://public-inbox.org/README.html
	https://public-inbox.org/flow.html

(and meta@public-inbox.org uses mlmmj for replaying archives
 to readers who don't use NNTP, IMAP or Atom feeds).

Everything is designed for older hardware and those with poor
Internet connections, even the web "design" :)

