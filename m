From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Mon, 24 Mar 2014 23:05:54 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <7598855.ViL4Wvj0I7@trelane>
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday, March 25, 2014 07:32:32 Ben Schmidt wrote:
> On 25/03/14 6:19 AM, Chris Knadle wrote:
> > As such, putting some effort wards encrypting our own filesystems
> > seems like a worthwhile effort.
> 
> This was the point I was just about to make.
> 
> If someone *really* wanted your data, wouldn't they just seize your
> local machine and read the unencrypted stored copies?

If we're discussing law enforcement, that's exactly what's generally done, 
usually confiscating every possible device all at the same time.

> Or even if it is
> encrypted, they have a nice limited-size dataset there to hurl resources
> at to crack the encryption--and it might not take many if you've chosen
> a dumb password. Or if you're like most people and use the same password
> for everything, it can probably be got from something else (e.g. any
> unencrypted login, or some other app on the same machine storing it in
> plaintext or with a weak hash). The whole operation probably either
> needs to be done illegally or require a warrant of some kind, but it's
> still got to be easier/cheaper than a lot of other options, if
> encryption is employed.

This sort of gets back to what Matti mentioned concerning "it depends on what 
your threat model is" as to how far one needs to go with this.

There are a number of encryption algorithms to choose from, and you can create 
long passwords fairly easily:

   http://preshing.com/20110811/xkcd-password-generator/
 
but basically yes, the password needs to be nontrivial and not reused 
elsewhere.  Depending on the encryption methodology it's also possible to make 
things more interesting by splitting the authentication into parts, such as a 
file on a particular USB stick, biometric data, long password, etc.

But rather than "the gobiment", the more common reason I have for encrypting 
data is in case of theft of the machine (especially items like laptops) to 
insure that private data contained remains private.

> On 25/03/14 3:49 AM, Piotr Auksztulewicz wrote:
> > PPS. I like this list to go live - even if slighlty off-topic.
> 
> Agree with that.
> 
> There is also a relatively large amount of Mlmmj development going on at
> the moment, with most discussion happening on the bug tracker.

Which reminds me that I should probably subscribe to [mlmmj-commits].

> Hoping for a new release in a handful of weeks with some bug fixes and
> new features. Just waiting for the dust to settle on a few current
> issues.

Sweet.  :-)

  -- Chris

--
Chris Knadle
Chris.Knadle@coredump.us

