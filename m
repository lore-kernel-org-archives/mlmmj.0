From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 11 Sep 2006 18:14:48 +0000
Subject: Re: [PATCH] chomp to remove '\r' as well
Message-Id: <dfd76b251180ce4e3e96006402eca800@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060911123559.GK1815@mmj.dk>
In-Reply-To: <20060911123559.GK1815@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Mon, 11 Sep 2006 14:35:59 +0200, Mads Martin Joergensen <mmj@mmj.dk> wrote:
> Anyone object to this behaviour?
[snip]
> -       while(str[i] = '\n') {
> +       while(str[i] = '\n' || str[i] = '\r') {

Fine by me.

Was the guy using the twisted BSD variant from Apple Computer, which uses \r and not \n?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

