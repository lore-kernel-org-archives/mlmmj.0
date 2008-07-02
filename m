From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Wed, 02 Jul 2008 09:42:33 +0000
Subject: Re: Maxmailsize don't work?
Message-Id: <200807021142.33688.thomas.jarosch@intra2net.com>
List-Id: <mlmmj.mlmmj.org>
References: <486B3895.3010804@atpss.net>
In-Reply-To: <486B3895.3010804@atpss.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday, 2. July 2008 11:41:15 Christoph Wilke wrote:
> On Wed, July 2, 2008 11:12, Claudio Prono wrote:
> > The value of 20000000000 bytes is just an example, i have tried to set
> > it to a smaller value, but the problem persist. Seems like the control
> > of  the maxmailsize have something wrong. If i remove the maxmailsize,
> > it's all ok, but is just  a work-around. Can be a bug of mlmmj ?

Have you tested various sizes like 32000, 65000 etc?

I have the same feeling as Chris that maybe
a too-small integer variable is overflowing.

Thomas
