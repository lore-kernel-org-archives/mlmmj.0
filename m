From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Fri, 13 May 2011 17:31:17 +0000
Subject: Re: [mlmmj] Mail loss on failed mmap
Message-Id: <4DCD6AE5.4050104@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <201105131519.27505.thomas.jarosch@intra2net.com>
In-Reply-To: <201105131519.27505.thomas.jarosch@intra2net.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 13/05/11 15.19, Thomas Jarosch wrote:

> I recently had lost "big" emails containing attachments
> while running them through mlmmj 1.2.15. Here's the relevant log output:
>
> -------------------------
>   May 2 14:33:55 /usr/bin/mlmmj-send[13098]: mlmmj-send.c:891: Not preparing
> in memory. Mail is 6428395 bytes: Success
>   May 2 14:33:55 /usr/bin/mlmmj-send[13098]: getaddrsfromfd.c:27: Could not
> mmap fd: Invalid argument
> -------------------------
>
> Do I guess correctly that getaddrsfromfd() returns -1 and then
> the mail is silently discarded?

No, it's wrong.

> mlmmj 1.2.16+ contains Robin's fix for a mmap() call of zero bytes.
> I'm wondering if that might be an issue but the file size
> shouldn't be zero bytes anyway.

Actually it's mlmmj not preparing the reply in memory, because it's so 
big, that we don't want it to be a way to DoS the server through mlmmj.

If you look at the messages one by one:

First one is mlmmj-send, making an informal message - it says "success". 
It says it wont prepare it in memory, due to previously mentioned risk 
of DoS. Instead, it prepares on disk where it's probably still sitting, 
but the recipient wouldn't accept it due to size. You can tune this 
through a tunable (but that wont fix it if the recipient rejects it). 
Quote from TUNABLES:

- memorymailsize		(normal)

Here is specified in bytes how big a mail can be and still be prepared 
for sending in memory. It's greatly reducing the amount of write system 
calls to prepare it in memory before sending it, but can also lead to 
denial of service attacks. Default is 16k (16384 bytes).

Second one is getaddrsfromfd() in mlmmj-send, where there's probably a 
zero-sized file within subscribers.d/. It's a harmless error which I 
partly fixed quite some time ago. Reason for it is, that before 
linux-2.6.9 it was legal to mmap a zero-sized file, as well on FreeBSD-5 
where I did most development.


I believe you should go hunting for that loss of mail somewhere else. 
Might be it's a bug in mlmmj, but it's not related to those 
errormessages you posted here.

Have a great weekend :)

/mmj
-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
  and totally illogical, with just a little bit more effort?"
                                  -- A. P. J.

