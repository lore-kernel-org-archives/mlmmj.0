From: =?utf-8?Q?Mads_Martin_J=C3=B8rgensen?= <mmj@mmj.dk>
Date: Tue, 05 Nov 2019 09:40:56 +0000
Subject: Re: [mlmmj] How to start mlmmj as a service on Ubuntu 16.04
Message-Id: <59E35CA0-2DC3-476A-AA77-CC60B620C91A@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <c52f5e7ebee197bd7ad6a46820f7368d@dalek.zone>
In-Reply-To: <c52f5e7ebee197bd7ad6a46820f7368d@dalek.zone>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

> On 5 Nov 2019, at 10.29, Martin Brampton <martin@black-sheep-research.com> wrote:
> 
> Quite correct, but it does prompt a related question. There is mention in the documentation of running mlmmj-maintd as a service, but how would this be done? Is it advantageous, relative to running maintd with cron?

It’s hard to think of good ideas to not just use cron, if it’s there. Why run more daemons than necessary on the server? It’s more a historical reason that it’s not default to fork to the background, and I think I wanted to make it the default at some point, but never got around to it.

-- 
Mads Martin Jørgensen
“Why make things difficult, when it is possible to make them cryptic and totally illogical, with just a little bit more effort?” - A. P. J




