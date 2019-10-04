From: Martin Brampton <martin@black-sheep-research.com>
Date: Fri, 04 Oct 2019 10:02:52 +0000
Subject: [mlmmj] Custom headers
Message-Id: <821dfe3a-4f36-017c-5f28-7070f179d96a@black-sheep-research.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

When I set up my first test list, I used the example given in the 
documenation i.e.

X-Mailinglist: test-list
Reply-To: test-list@yorkshiremail.com

However, this doesn't give a particularly good result in Thunderbird. 
Noticing that this list gives better results, I looked at the headers. 
It seems that (adapted for my list) these are:

List-Id: <test-list.yorkshiremail.com>
List-Help: <mailto:test-list+help@yorkshiremail.com>
List-Post: <mailto:test-list@yorkshiremail.com>
List-Subscribe: <mailto:test-list+subscribe@yorkshiremail.com>
List-Unsubscribe: <mailto:test-list+unsubscribe@yorkshiremail.com>

There don't seem to be either X-MailingList or Reply-To headers.

The (un)subscribe headers don't seem to have any effect on Thunderbird, 
are they useful elsewhere? Or are they for people who know how to look 
at mail headers?

Is the second list above the best configuration for headers?

Should this go into the documentation perhaps?

Martin

