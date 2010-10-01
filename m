From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 01 Oct 2010 23:00:54 +0000
Subject: Re: [mlmmj] more than 100 lines for moderation
Message-Id: <4CA66826.4000407@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
In-Reply-To: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ben Schmidt wrote:
>> That's one thing I always find annoying with MLMMJ. Why are all scripts
>> postfixed with ".sh"? Look into your distribution files, no scripts are
>> like that. Using just "mlmmj-make-ml" (without the ".sh") directly into
>> your source would be a wise change, IMHO. If you didn't know, in Debian,
>> we had to do that change, because having the ".sh" extension is against
>> the policy of Debian. What do you think?
> 
> There's only one, isn't there (asks the maintainer, who probably should
> know...)? I agree, it is unconventional for a script designed to be run
> by a user. Generally only scripts used as intermediate steps in a build,
> or something like that, that are generally sourced, not executed, have
> the .sh extension. I don't mind changing it, though will keep a symlink
> for a while for compatibility. Likewise with mlmmj-receive. I've got to
> find that patch someone made for that.
> 
> Ben.

I think I forgot to explain why I don't like it, so let me explain.

In Debian, we are *forced* by the policy to remove the .sh extension (I
do not want to discuss if it's a good policy or not, it's like that,
that's it). In other OSes like FreeBSD and others, you might have some
more loose policy, meaning that the .sh extension will be there.

As a result, in FreeBSD, we have .sh for all scripts, while in Debian we
don't. For someone that wishes to support both OSes (like we do), it's
painful, and I would be glad if that could be avoided.

Thomas

