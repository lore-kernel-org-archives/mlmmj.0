From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Tue, 05 Nov 2019 10:53:06 +0000
Subject: Re: [mlmmj] How to start mlmmj as a service on Ubuntu 16.04
Message-Id: <20191105105306.GA28447@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <c52f5e7ebee197bd7ad6a46820f7368d@dalek.zone>
In-Reply-To: <c52f5e7ebee197bd7ad6a46820f7368d@dalek.zone>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, Nov 05, 2019 at 09:29:15AM +0000, Martin Brampton wrote:
> 
> Quite correct, but it does prompt a related question. There is mention in
> the documentation of running mlmmj-maintd as a service, but how would this
> be done? Is it advantageous, relative to running maintd with cron?

I think it is better to run fewer, well tested deamons than have every
single piece of software manage itself. So I'd go for cron for periodic
things like maintenance - or systemd timer if I am being facetious :-)

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

