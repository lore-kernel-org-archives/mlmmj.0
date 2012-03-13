From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 13 Mar 2012 07:16:18 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18a1 released
Message-Id: <4F5EF442.3050607@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F5E32B9.6090908@yahoo.com.au>
In-Reply-To: <4F5E32B9.6090908@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 03/13/2012 01:30 AM, Ben Schmidt wrote:
> An alpha release for the upcoming Mlmmj 1.2.18 has been published.

Hi!

Why suddenly changing versionning scheme? Does the "a" means alpha?

Later, if you publish 1.2.18.0, it's going to be considered smaller than
1.2.18a1, so I think it's not a nice numbering scheme (it might break
upgrading in Debian, for example). Something like:

1.2.18.0.rc1

would have been better. Then, you would release 1.2.18.1 ...

Cheers,

Thomas

