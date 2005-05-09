From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 09 May 2005 12:56:42 +0000
Subject: Re: 1.2.6.1 (Was Re: 1.2.6 released. No more queue littering ...)
Message-Id: <427F5E0A.7020203@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20050509074717.GJ87309@mmj.dk>
In-Reply-To: <20050509074717.GJ87309@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

> So there was another condition causing potential wrong MAIL FROM: on the
> sub-subscriber mails, and since the Subject: bug is grave enough I've

You mean it's possible that listaddr is not set (or not correct) when 
generate_subscribed in mlmmj-sub.c is called? I don't see that right 
now. What am I missing?
