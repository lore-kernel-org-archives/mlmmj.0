From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 29 Oct 2013 20:21:44 +0000
Subject: Re: [mlmmj] Moderators can post, others bounce
Message-Id: <527018D8.2000903@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <B51B7915-BD6D-46BF-816E-05AF8ECC9ABE@gmail.com>
In-Reply-To: <B51B7915-BD6D-46BF-816E-05AF8ECC9ABE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I think a 'modonlypost' tunable is already in the bug tracker as a
feature request, and it will probably happen one day.

For now, the best option is probably to use a more sophisticated pattern
for an access rule. Something like this works for me, as long as a
display name *is* included:

    allow ^From:.*<user@domain\.tld>.$

Maybe a suitable hybrid would be:

    allow ^From:( *|.*<)user@domain\.tld>?.$

It's still far from perfect compared to the specs, but it probably
catches the vast majority of cases out there. The chance of a comment or
multi-line header or anything like that is pretty slim.

HTH,

Ben.



On 23/10/13 10:45 PM, Ravi Chandran. S wrote:
> Hello,
>
> Is it possible to setup an only moderator can post and emails from
> other subscribers will bounce type of mailing list ? I tried to use
> control/access with allow ^From: emailid@domain.org but that's not
> working. Name instead of emailid@domain.org is working, but I prefer
> email id based restrictions.
>
> TIA.




