From: Baptiste Daroussin <bapt@nours.eu>
Date: Wed, 08 Feb 2023 09:03:09 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1, glad for the work
Message-Id: <20230208090309.zz7no7xuvccrqgib@aniel.nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <572dfe82-87b0-f959-f174-0944c5658199@coredump.us>
In-Reply-To: <572dfe82-87b0-f959-f174-0944c5658199@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

(resend, to reply using a mail subscribed to the mailing list :D) 

On Wed, Feb 08, 2023 at 07:44:00AM +0000, Chris Knadle wrote:
> Greetings.
> 
> I want to give anyone working on the 1.4.0.a1 mlmmj candidate my thanks,
> it's good to see that this work is going on, and I'm looking forward to
> packaging it and other pieces for it for Debian when it's in a
> semi-stable/usable state.

Alpha 2 is out (not announced as I am working on alpha3 already) will release
when the testsuite will be covering enough of the functionnality to be safe.
> 
> I'm personally interested in an mlmmj-archiver web indexing program, because
> I've had difficulties with other mailing list archivers. Lurker works but
> seemed relatively inflexible, and Mhonarc required a fair bit of
> configuration and I never did figure out its configuration language. Debian
> mailing lists are archived in Mhonarc but I don't currently have access to
> the configuration used for those.

I wrote https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.md this is used
to generate the FreeBSD archives as you can view here:
https://lists.freebsd.org/archives

It is probably code is probably portable, and the build system is freebsd
specific for now, but should not be hard to adapt else where (requires bmake)

I am happy to turn it into a portable software and also move it elsewhere
(codeberg?) if people dislike fossil :D.

It is written in C, fully sandboxed (under freebsd), faster to process large
archives than arlternatives I tried to use. fully themable via clearsilver (yeah
I know old school but it works.

It only depends on sqlite and clearsilver.
> 
> Re: using the mlmmj name, my only thought is perhaps a minor addition to the
> name to distinguish the fork, such as mlmmj-ng (next-generation) or mlmmj2.
> It's not a requirement, it's just mentioning what I typically see other
> projects do. I think the idea is to cover the possibility of upstream
> picking up their old project again and/or avoiding old/new naming clashes.
> If the old/same name is stuck with I don't have any objection.

Well the author of the original project is happy to see it as a continuation of
the project, so let's stick with the same name :D.
> 
> Just in case I don't check the mailing list often enough: when you think the
> program is in a buildable/usable enough state for being packaged and
> uploaded to Debian, please ping me via email.

The rc phases will probably be the best moment for packaging.

Best regards,
Bapt

