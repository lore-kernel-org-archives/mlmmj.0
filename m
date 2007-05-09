From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 09 May 2007 18:41:37 +0000
Subject: Re: Installing mlmmj on a host
Message-Id: <26a3d47b2ff19372288145e20524d468@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070509171725.DBC0174B5C@spunkymail-a17.g.dreamhost.com>
In-Reply-To: <20070509171725.DBC0174B5C@spunkymail-a17.g.dreamhost.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Florent,

"Florent F Rizvanolli" <florent.faik@rizvanolli.com> wrote:
> Is this a list to send newbie questions or there is a mlmmj FAQ?

There is only the FAQ distributed with mlmmj. Newbie questions are
welcome. Also, the web archive is broken....

> I would like to install mlmmj on a host where I can create
> users but don't have root privileges and had a feasibility
> question.

Sure, you can use mlmmj. It does not require root privileges.

- Make sure the MTA accepts mails with a recipient delimiter
  (see README). Ask your system administrator.
- Log in as some user (let's call him joe) and create the list.
- Set up a mail alias so mlmmj-recieve [sic] is run by user joe.
- Set up mlmmj-maintd in a cron job as user joe.

That's it; Check out the README file for details.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

