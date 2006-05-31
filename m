From: Fabio Busatto <fabio.busatto@programmazione.it>
Date: Wed, 31 May 2006 23:23:12 +0000
Subject: Re: qmail+vpopmail support
Message-Id: <20060531232312.GA309@nachos.phaseit.com>
List-Id: <mlmmj.mlmmj.org>
References: <20060503134628.GG5327@nachos.phaseit.com>
In-Reply-To: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I finally reached the conclusion that DEFAULT is the right
place to look for real extension commands.
Every configuration i found uses .qmail files to manage the
mlmmj list.
By the way, DEFAULT is too common and can create a collision
with other MTA (really?).

So, two ways:
- use DEFAULT instead of EXT when looking for extension
- set another environment variabile using .qmail file,
  and then check it

The first solution is clean, but maybe lacks of protection
that can do mlmmj thinking to qmail even if it's not.
The second is safer, but more complex to configure (each
list must have variable setting in the .qmail file.

Any ideas? Which one do you think is better?
Waiting for comments.

-fabio
-- 
Fabio Busatto <fabio.busatto@programmazione.it>
