From: Baptiste Daroussin <bapt@nours.eu>
Date: Fri, 09 Dec 2022 05:25:58 +0000
Subject: Re: [mlmmj] mlmmj patches from distributions: Gentoo
Message-Id: <A89DFEC4-0B98-4E12-83B7-78EAF60FBC1D@nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org



Le 9 décembre 2022 00:18:46 GMT+01:00, "Robin H. Johnson" <robbat2@gentoo.org> a écrit :
>On Thu, Dec 08, 2022 at 09:01:29AM +0100, Baptiste Daroussin wrote:
>> > There's one scaling discussion we need to have, but the handling needs
>> > to include how to incrementally get there:
>> > 
>> > How to have millions of mails in /archive/!
>> > 
>> > Our most active list is now approaching 1.5M emails in that directory,
>> > and it worries me.
>> 
>> Why is it worrying you? a directory can hold way more than that.
>>
>> On FreeBSD, one thing we are doing is when creating the public archives via:
>> https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.md (this may move to
>> codeberg), I append the archives to a mbox, so I can cleanup what ever is in the
>> archives directory if I need (I did not need up to now).
>Cleaning up the archives directory will break the +get-NNNN
>functionality.
>
>It makes the directory take extremely long to scan during backups.
>I think it should be partitioned more, but any +get-NNNN code will need
>to support both partitioned & non-partitioned.
>

Good point and easy to implement, I ll looking into it.

>mbox support for +get would be nice, but that's much more work than just
>partitioning the directory.
>
>We do have our own archives site:
>https://archives.gentoo.org/
>
>The older versions used to use mhonarc, but also ran into scaling
>concerns, so we built something more custom (earlier versions used
>ElasticSearch as a DB; I don't recall what the current version uses
>underneath, but we can re-ingest everything if we need to).
>

If this is public I am interrested into it, i wrote mlmmj-archiver for scaling issues as well.


Best regards,
Bapt

