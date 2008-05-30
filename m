From: Chris Webb <chris@arachsys.com>
Date: Fri, 30 May 2008 12:23:59 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <20080530122359.GD21215@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Robin H. Johnson" <robbat2@gentoo.org> writes:

>  Subject: Confirm subscription to $listaddr$
> +Reply-To: DO NOT REPLY <devnull@localhost.invalid>

This probably ought to be a 'cancel subscription' address rather than an
invalid address. Mail with invalid addresses in the headers is quite likely
to get rejected or scored very poorly by spam filters. (I think we outright
reject on invalid envelope sender or invalid domain in From: but ignore
Reply-To: unless there's a syntax error. However, other ISPs may be
stricter.)

Best wishes,

Chris.
