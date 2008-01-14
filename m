From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 14 Jan 2008 12:02:29 +0000
Subject: Re: Gentoo lists mailing loss solved, mlmmj bug patched
Message-Id: <1200312149.6509.20.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <20080114113658.GF5504@curie-int.orbis-terrarum.net>
In-Reply-To: <20080114113658.GF5504@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2008-01-14 at 03:36 -0800, Robin H. Johnson wrote:
> So I see this was mentioned once before on the lists, but was dismissed
> as an issue at the time. Back in April I suspected an mlmmj bug, and was
> told to get off sendmail, but after all this time, I finally had time
> and managed to trace the issue.

Must have been mmj who told you to get off sendmail - I'm a happy
sendmail user.


> If you run into this error:
> /usr/bin/mlmmj-send[9353]: getaddrsfromfd.c:27: Could not mmap fd: Invalid argument
> and you seem to be losing mail, you should apply this patch:
> http://sources.gentoo.org/viewcvs.py/gentoo-x86/net-mail/mlmmj/files/mlmmj-1.2.15_mmap_zero_byte.patch?rev=1.1
> 
> The linux manpage for mmap notes that since 2.6.12, mmap of a zero-byte
> file will fail. For mlmmj, this means that getaddrsfromfd returned -1,
> which triggered the termination condition in send_mail_many_fd.

Nice. This was patched in subscriberfuncs.c, but obviously not in
getaddrsfromfd.c and mlmmj-list.c. Thanks for the patch.

> The 0-byte files must have arisen from earlier earlier versions of
> mlmmj, or somebody before me mucking with the subscriber files directly,
> as the present version does remove empty files.

Yeah, IIRC old versions didn't remove empty files.

> I didn't do a complete audit of the rest of mlmmj, but I suspect the
> same bug may exist in other places.

Could be. I will look at every mmap() call when I commit your patch.


Morten

