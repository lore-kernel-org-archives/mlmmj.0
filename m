From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 02 Feb 2010 22:36:47 +0000
Subject: Re: Proposal for richer list text
Message-Id: <20100202223647.GB9387@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <4B5EE8BD.2050205@yahoo.com.au>
In-Reply-To: <4B5EE8BD.2050205@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Jan 27, 2010 at 12:06:05AM +1100, Ben Schmidt wrote:
> I'm wondering if this sounds acceptable. I'll go ahead and have a
> shot implementing it, if so.
> 
> I'm thinking of extending the listtext/prepstdreply mechanism to,
> rather than just expect and include a subject header, to allow other
> headers at the top of listtexts, that would/could replace the
> default headers, and to allow greater amounts of the original mail
> to be included, and random and subject substitutions.
> 
> The first part would involve representing the default headers (To,
> From, Reply-To, MIME-Version, Content-Type, etc.) in a
> list/structure, then parsing each header line of the listtext,
> removing existing headers from the structure if they match the new
> one, and then adding the new one. Then the structure would be
> reduced to a single string and output.
Heavily in favour of supporting custom headers in listtexts.

I just found out the hard way that subconf mails do NOT have any of the
customheaders on them, and thus ended up getting us in a blacklist for a
while.

Can we get that first part implemented ASAP? One thing I am concerned
about with it, is the ability to append vs. replace headers.

For the moment, I say we just append, not replace.

-- 
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

