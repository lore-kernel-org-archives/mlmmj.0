From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 22 Jun 2005 09:03:36 +0000
Subject: Re: List creation in the perl-admin web interface
Message-Id: <20050622090336.GV27543@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <86d5qekc0f.fsf@borg.borderworlds.dk>
In-Reply-To: <86d5qekc0f.fsf@borg.borderworlds.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christian Laursen <xi@borderworlds.dk> [Jun 22. 2005 10:54]:
> There has been some talk about adding list creation functionality to
> the web interface.
> 
> Most of the work involved in getting it to work consists of making
> mlmmj itself support list creation by preconfigured unprivileged
> users.
> 
> It will probably require mlmmj-make-ml to be a suid root binary,
> preferably only installed suid root if enabled by an option to the
> configure script or similar.

I've been wanting to rewrite mlmmj-make-ml anyway, making it possible to
pass all options for making a list on the commandline. mlmmj-make-ml.sh
is an ugly hack anyway--it was written pre-0.1.0.

> Since the unprivileged user can't do any postprocessing on the created
> listdir there will have to be some support for running a custom script
> to do that. The custom script should also take care of adding an alias
> to the mail configuration.
> 
> All this would probably be configured in a global configuration file
> as the unprivileged user should be trusted as little as possible.
> 
> With this in place it should be a walk in the park to add the
> functionality to the web interface.

And when we have mlmmj-make-ml written proper, the rest seems
achievable. Especially now we can write it with the above in mind.

Any other considerations?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
