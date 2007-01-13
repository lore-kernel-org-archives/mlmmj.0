From: Jesper Lund <jesper@ballbreaker.dk>
Date: Sat, 13 Jan 2007 12:13:51 +0000
Subject: Re: Round robin relayhost
Message-Id: <20070113131351.d6be1d97.jesper@ballbreaker.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, 11 Jan 2007 08:16:51 +0100
Mads Martin Joergensen <mmj@mmj.dk> wrote:

> * Jesper Lund <jesper@ballbreaker.dk> [Jan 10. 2007 21:54]:
> > Maybe I could do some voodoo with a local postfix, to make it do
> > the round robin for mlmmj, which just relay to "localhost".
> > 
> > What would you do, if your smtp server was "too slow" to relay the
> > mails fast enough ?
> 
> Even with 25k mails, one single Postfix with VERP should do the job
> quickly. But if you cannot use VERP ...
> 
> How long does it take to deliver them with the current setup?

Sorry for the answring delay.

With a dedicated host, some postfix tuning og at bit of scripting, It
took about 5 minutes.

I think it is fast enough... I still think, though, that it would be
a nice feature to be able to round robin relayhosts. Just if somebody
had a booring time to waste... :)

Well, thank you all for your answers.

Kind regards, Jesper
