From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 22 Jun 2005 09:25:52 +0000
Subject: Re: List creation in the perl-admin web interface
Message-Id: <868y12kajj.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <86d5qekc0f.fsf@borg.borderworlds.dk>
In-Reply-To: <86d5qekc0f.fsf@borg.borderworlds.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen <mmj@mmj.dk> writes:

> * Christian Laursen <xi@borderworlds.dk> [Jun 22. 2005 10:54]:
>
> I've been wanting to rewrite mlmmj-make-ml anyway, making it possible to
> pass all options for making a list on the commandline. mlmmj-make-ml.sh
> is an ugly hack anyway--it was written pre-0.1.0.

Ah yes, I forgot about the requirement of a non-interactive mlmmj-make-ml.
 
> And when we have mlmmj-make-ml written proper, the rest seems
> achievable. Especially now we can write it with the above in mind.
> 
> Any other considerations?

I have some ideas about what would be nice to have in the configuration file.
(Although it could be made possible to override those if running as root)

- Unprivileged users who are allowed to make lists (Perhaps just a group)
- Directories in which new listdirs are allowed to be created
- Allowed list domains
- Allowed prepopulated skeleton control dirs
- Allowed custom scripts to run after list creation
- Allowed listtexts directories

Some of this might work better if grouped in profiles.

Nothing more comes to mind at this time.

-- 
Christian Laursen
