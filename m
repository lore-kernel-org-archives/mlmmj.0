From: Vegard Svanberg <vegard@svanberg.no>
Date: Sun, 21 Nov 2004 13:30:20 +0000
Subject: Re: incoming emails ends up in queue/discarded
Message-Id: <20041121133020.GT9290@svanberg.no>
List-Id: <mlmmj.mlmmj.org>
References: <20041121000711.GL9290@svanberg.no>
In-Reply-To: <20041121000711.GL9290@svanberg.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Vegard Svanberg <vegard@svanberg.no> [2004-11-21 01:07]:

> However the message ends up in queue/discarded and I have nothing to go
> on.

OK, solved now.  mlmmj seems to require the Return-Path header, which
postfix does not prepend per default on custom transports.  Adding the R
flag solves it.

-- 
Vegard Svanberg <vegard@svanberg.no> [*Takapa@IRC (EFnet)]

