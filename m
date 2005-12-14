From: Neale Pickett <neale@woozle.org>
Date: Wed, 14 Dec 2005 18:02:25 +0000
Subject: Re: mlmmj-1.2.9 released
Message-Id: <200512141102.26234.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <20051214151526.GA92814@mmj.dk>
In-Reply-To: <20051214151526.GA92814@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday 14 December 2005 10:35 am, you wrote:

> Excellent!  It sounds like the "find_email_addr()" bit will better
> handle the "From:" header my user is locked into.  Soren, you offerred
> to backport 1.2.8 to sarge before, I wonder if 1.2.9 could also be
> backported?

The find_email_addr patch can be trivially packported.  Just drop the new file 
into the old tree and you're done.
