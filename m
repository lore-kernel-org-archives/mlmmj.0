From: Baptiste Daroussin <bapt@nours.eu>
Date: Mon, 15 May 2023 10:15:29 +0000
Subject: Re: [mlmmj] make check fail for 1.4.0.a2
Message-Id: <xntx64bzrfsnq4uefcaapzlu7degyxyhegd3ekfxb4mwgidf2m@6vc43qvyzyob>
List-Id: <mlmmj.mlmmj.org>
References: <3a21b675-1ae7-71e8-1338-ccc2666e9f5d@andreasschulze.de>
In-Reply-To: <3a21b675-1ae7-71e8-1338-ccc2666e9f5d@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Mar 06, 2023 at 11:07:54AM +0100, Franky Van Liedekerke wrote:
> Fedora 37, latest updates, testing git master.
> 
> Franky

Sorry it took so long to reply.

I have now a full CI runnin fedora (to complete with debian and archlinux)
I have been able to track down the bug. This is due to the atf framework being
outdated on fedora, in particular: https://github.com/jmmv/atf/issues/15,

0.21 was released in 2014 and has the fix.
I will see to remove the nested forks in the test suite, still it would be a
good idea to make fedora upgrade libatf from 0.20 to 0.21.

Bapt

