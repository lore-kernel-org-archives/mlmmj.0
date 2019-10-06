From: Geert Stappers <stappers@stappers.nl>
Date: Sun, 06 Oct 2019 19:25:50 +0000
Subject: Re: [mlmmj] Custom headers
Message-Id: <20191006192550.zgwwef6hzwp5pa5m@gpm.stappers.nl>
List-Id: <mlmmj.mlmmj.org>
References: <821dfe3a-4f36-017c-5f28-7070f179d96a@black-sheep-research.com>
In-Reply-To: <821dfe3a-4f36-017c-5f28-7070f179d96a@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Oct 04, 2019 at 11:02:52AM +0100, Martin Brampton wrote:
> When I set up my first test list, I used the example given in the
> documenation i.e.
> 
> X-Mailinglist: test-list
> Reply-To: test-list@yorkshiremail.com
> 
> However, this doesn't give a particularly good result in Thunderbird.
> Noticing that this list gives better results, I looked at the headers. It
> seems that (adapted for my list) these are:
> 
> List-Id: <test-list.yorkshiremail.com>
> List-Help: <mailto:test-list+help@yorkshiremail.com>
> List-Post: <mailto:test-list@yorkshiremail.com>
> List-Subscribe: <mailto:test-list+subscribe@yorkshiremail.com>
> List-Unsubscribe: <mailto:test-list+unsubscribe@yorkshiremail.com>
> 
> There don't seem to be either X-MailingList or Reply-To headers.
> 
> The (un)subscribe headers don't seem to have any effect on Thunderbird, are
> they useful elsewhere? Or are they for people who know how to look at mail
> headers?
> 
> Is the second list above the best configuration for headers?

No    :-)
But good enough    8^)

 
> Should this go into the documentation perhaps?

Done in https://gitlab.com/mlmmj/mlmmj/commit/280fcce1f728832718b9f7767b1ea014978e9e42

And yes, Improvements are welcome.


Groeten
Geert Stappers
-- 
Leven en laten leven

