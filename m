From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 28 Nov 2013 21:20:26 +0000
Subject: Re: [mlmmj] Problems with microsoft
Message-Id: <5297B39A.7010700@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
In-Reply-To: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 29/11/13 4:58 AM, Christian Gleerup wrote:
> I am considering just copying the 8 binaries
> (mlmmj-(bounce,list,maintd,process, recieve, send, sub, unsub)) in
> ~/mlmmj-1.2.18.0/src/ to /usr/bin/ where my old mlmmj files are.
>
> is there something I should be aware of or should it just Work?
> (I will give the files same owership, I will delete mlmmj-make-ml and mlmmj-make-ml.sh)

I never used a version as old as 1.2.16, so I'm not 100% sure.

However...

Take a bit of time to update your list texts as Mlmmj 1.2.18 uses a new
list text mechanism. As well as list-specific ones, there are
system-wide ones (can't quite remember where; maybe
/usr/local/share/mlmmj) which Mlmmj falls back to when it can't find
list-specific ones (and IIRC, it doesn't fall back in the most optimal
way, so it's best to update both).

Also note how mlmmj-receive has had the spelling fixed. "make install"
installs a symlink with the old name, I think, so old entries in mail
server config continue to work. You might prefer to update your mail
server config.

Apart from that, I think replacing the binaries will work. But no
guarantees!

> (I have upgraded the installation so I now have 768MB of ram, so I
> hope there will be no more 'log blackouts')

Cool. I had similar problems at one stage, where processes were killed
due to lack of memory. In fact, that's one reason I got into Mlmmj in
the first place, as its minimalist design makes it suitable for
constrained-memory applications. I have also found the software Monit
(single-host M/Monit) very helpful to keep essential services running
despite the kernel killing things (or other process death). By
installing it into inittab, Monit can be made to never die (or at least
be guaranteed a resurrection if it does).

Ben.




