From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 06 Mar 2011 12:29:55 +0000
Subject: Re: [mlmmj] Google Summer of Code
Message-Id: <4D737E43.6080303@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
In-Reply-To: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 4/03/11 7:40 AM, Wolf Bergenheim wrote:
> I was wondering if we should get involved with Google Summer of Code
> [1]? I know this is sort of late, however we have over a week to get
> the application done. This year Google also seem to focus on cool
> small projects. So what do you say, should we go for it? Who would be
> willing and/or capable to mentor a student? I'd be willing to take
> care of the administrative stuff.
>
> [1] http://code.google.com/soc

I definitely like the idea of being involved with it. A few thoughts:

- This ultimately depends on mentors being available. I might be able to
   manage to mentor a student, but I need to think a little more about
   it. Is anyone on the list able to give a solid commitment that they'd
   be able to be a mentor? This is the highest priority. We have only a
   few days to sort this out.

- I'd prefer it if we could think ahead and avoid having code written
   that will just bitrot. For instance, the idea of a forum with Mlmmj as
   a backend in Rails is a good and interesting idea, but to me it sounds
   more like a separate project, not part of Mlmmj. I'm not sure I'd be
   able and competent to maintain something like that (not knowing
   Ruby!). Of course, it could go in contrib, but if it's not going to
   just bitrot there (as a couple of things have a bit), it would need
   somebody to maintain it. Given the short-term-project nature of GSoC,
   I'm not sure we could rely on a student doing this (though that would
   be great if we got someone willing). So, ideally, for a project like
   that, we would have a person/people step up as mentor and maintainer.

- Some ideas for projects more in the Mlmmj core, that are pushing ahead
   towards what I envision to be Mlmmj 2.0:

    - Make a CGI binary (i.e. another small program written in C like the
      rest of Mlmmj--small and slim) to allow archive browsing.
    - Or the same to allow list administration (modifying tunables,
      subscribing and unsubscribing members, etc.).
    - Refactor some code into clearer modules and extend the list access
      module to support per-user options (delivery mode of normal, digest
      or nomail, their real name, notmetoo, whether they're a moderator,
      whether they're moderated, etc.). Possibly do this in a new module
      that uses a database backend.
    - (Eventually those three projects would all be extended/combined to
      allow things such as viewing and moderating mail messages, archive
      access only by list members authenticated by password, etc..)
    - Develop a test suite, including testing relaying mail through
      different MTAs (e.g. by automating setting up environments on a
      virtual machine), simulating MTA failures and bounces (with a mock
      SMTP server written in some scripting language or something),
      different tunables, use cases, and so on, so the other large
      changes to the codebase can be made with greater confidence.
    - Improve the logging mechanisms and add some gathering of statistics
      (include some nice scripts to generate graphs and things). (Not
      sure this is big and exciting enough for a summer project, though,
      unless it did a lot of mail parsing to gather detailed stats on
      senders and things, which is probably a separate project--indeed,
      something may already exist to do this that is mlm-agnostic.)

Ben.




