From: Lukas Fleischer <mlmmj@cryptocrack.de>
Date: Fri, 16 Sep 2011 22:37:32 +0000
Subject: Re: [mlmmj] Stale moderation/*.sending files | mlmmj-send
Message-Id: <20110916223732.GA24084@blizzard>
List-Id: <mlmmj.mlmmj.org>
References: <20110916203956.GA20431@kki.org>
In-Reply-To: <20110916203956.GA20431@kki.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Sep 16, 2011 at 10:39:56PM +0200, Christoph Thiel wrote:
> Hi everyone,
> 
> using mlmmj mlmmj-1.2.17.1 (on SLES 11 SP1 with postfix) to run about 2000
> mailing lists (most of them are moderated), I figured that I had some 200 files
> in the moderation folder ending in .sending, without any mlmmj-send process
> running. mlmmj-maintd doesn't seem to take care of those files?
> 
> Has anyone seen this? What is causing this?
> 
> 
> Maybe unrelated to this, I was digging through the logs and found:
> 
> Sep 11 15:46:18 kenny kernel: [801524.917887] mlmmj-send[25966]: segfault at 0 ip 00000000004060fa sp 00007fffe88d13a0 error 4 in mlmmj-send[400000+a000]
> Sep 12 13:48:04 kenny kernel: [880821.691820] mlmmj-send[12206]: segfault at 0 ip 00000000004060fa sp 00007ffffee6ad70 error 4 in mlmmj-send[400000+a000]
> Sep 12 15:58:18 kenny kernel: [888634.712623] mlmmj-send[1540]: segfault at 0 ip 00000000004060fa sp 00007fff38c7fc50 error 4 in mlmmj-send[400000+a000]
> Sep 13 15:59:20 kenny kernel: [975087.015259] mlmmj-send[20332]: segfault at 0 ip 00000000004060fa sp 00007fff46439d80 error 4 in mlmmj-send[400000+a000]
> Sep 14 14:11:32 kenny kernel: [1055009.528910] mlmmj-send[10202]: segfault at 0 ip 00000000004060fa sp 00007fffc39ee140 error 4 in mlmmj-send[400000+a000]
> Sep 14 14:40:24 kenny kernel: [1056741.004651] mlmmj-send[13020]: segfault at 0 ip 00000000004060fa sp 00007fff6cedb950 error 4 in mlmmj-send[400000+a000]
> Sep 16 15:11:00 kenny kernel: [1231356.973574] mlmmj-send[31009]: segfault at 0 ip 00000000004060fa sp 00007fff649c0e30 error 4 in mlmmj-send[400000+a000]

That definitely is a bug and probably related to the dangling files in
your moderation directory. Those are renamed to ".sending" to mark them
as being processed and then passed on to mlmmj-send which seems to
segfault. You could try to pick any file, invoke mlmmj-send manually and
get a backtrace so that we might get an idea of what happens here. `gdb
mlmmj-send` and then type `run -L <listdir> -m <sendfilename>` (where
"listdir" is your list directory and "sendfilename" the ".sending" file
you would like to resend).

You might need to recompile mlmmj with debugging symbols (and with
stripping disabled) in case the package you use doesn't provide these
already.

Cheers,
Lukas

