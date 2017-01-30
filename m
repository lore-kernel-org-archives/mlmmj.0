From: David Demelier <demelier.david@gmail.com>
Date: Mon, 30 Jan 2017 09:04:03 +0000
Subject: [mlmmj] Re: Thunderbird behaviour with Reply-To header
Message-Id: <210078af-c871-9050-29bc-50e8cef7fe7d@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <7d088555-5608-b9c9-46e5-8a54eaae4f1a@gmail.com>
In-Reply-To: <7d088555-5608-b9c9-46e5-8a54eaae4f1a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 01/29/2017 11:31 AM, David Demelier wrote:
> Hello,
>
> For my mailing lists I prefer to have the address of the mailing list
> instead of the original poster. This makes easier contributions for
> people not used to mailing list which only use "Reply" instead of Reply
> All or Reply List.
>
> I've tried to add Reply-To as custom header with the mailing list.
>
> When sending a mail to the list, I get the original post (fine), hitting
> the simple "Reply" button makes thunderbird answering twice:
>
>     To: thelist@thedomain
>     Reply-To: thelist@thedomain
>
> Without the Reply-To header, clicking the Reply button makes thunderbird
> answering the original poster and not the mailing list address.
>
> It looks like it's the only mail application doing that but I wonder if
> I should add more settings or use something else?
>
> What's your thoughts on it?
>
> Regards
>

Adding List-Id and all List-* headers belong the Reply-To header fixes 
the problem!

Regards,

-- 
David Demelier

