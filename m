From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 09 Sep 2011 08:24:39 +0000
Subject: Re: [mlmmj] read(2) syscall bloat
Message-Id: <4E69CD47.7000302@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <20110905115603.GC22957@barfooze.de>
In-Reply-To: <20110905115603.GC22957@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 09/05/2011 08:34 PM, Ben Schmidt wrote:
> Maybe we should do some profiling to see if this truly is a bottleneck
> or not.
> 
> Ben.

Without looking, my bet is that it's NOT a bottleneck. Implementing the
buffering yourself is the kind of thing you do *not* want to do, because
it's error prone and can lead very easily to buffer overflow issue. At
least, take the implementation from something that already exists
(ideally, use a known shared lib). Working on this kind of "by hand"
optimization is, IMHO a waste of time, considering all what happens when
receiving a mail.

As a consequence, I vote for using getline() if it's available, and keep
the old (slower) implementation if it's not.

Thomas

