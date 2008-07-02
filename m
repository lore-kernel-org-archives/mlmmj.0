From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 02 Jul 2008 14:32:34 +0000
Subject: Re: limit post to moderators
Message-Id: <486B9182.5060502@afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <60567dcc0807020140u46488453n9a4fd25e46df6c09@mail.gmail.com>
In-Reply-To: <60567dcc0807020140u46488453n9a4fd25e46df6c09@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Franky Van Liedekerke wrote:
> is there a config option (or patch) to limit the posting possibility to 
> moderators only (without them needing to be subscribers if possible)?

Not directly, but you can do it via the "access" tunable. Something like:

moderate aaa@example.org
moderate bbb@example.org
deny

> For now every subscriber can post (using moderation), but I want a kind 
> of newsletter functionality ...

For a newsletter I usually have a secret header with a password, 
something like:

allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517
deny

and in "delheaders":
X-MySecret:

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
