From: Baptiste Daroussin <bapt@nours.eu>
Date: Fri, 09 Dec 2022 05:56:35 +0000
Subject: Re: [mlmmj] mlmmj patches from distributions: Gentoo
Message-Id: <F0AE59F0-56DA-44DF-9BA7-0532D6B17101@nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org



Le 9 décembre 2022 06:36:54 GMT+01:00, "Robin H. Johnson" <robbat2@gentoo.org> a écrit :
>On Fri, Dec 09, 2022 at 06:25:58AM +0100, Baptiste Daroussin wrote:
>> >Cleaning up the archives directory will break the +get-NNNN
>> >functionality.
>> >
>> >It makes the directory take extremely long to scan during backups.
>> >I think it should be partitioned more, but any +get-NNNN code will need
>> >to support both partitioned & non-partitioned.
>> Good point and easy to implement, I ll looking into it.
>Great to hear. Please do consider how to migrate existing /archive/
>directories into it.
>
My current plan is pretty simple make a 100k partition via mlmmj-maintd, is scans the archives and move mails around. So the rest of the code remains the same.

+get will look into 2 places the root of the archive and the partitionned directory

This should (famous last word) be easy and not really intrusive.

Best regards
Bapt

