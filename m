From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 22 Dec 2016 21:05:46 +0000
Subject: Re: [mlmmj] Allowing specific addresses with subonlypost
Message-Id: <a643ec91-ad8d-a29a-b861-a561ac233c97@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <13b7eecf-62da-b77b-4685-ddae6cc0ee39@gmail.com>
In-Reply-To: <13b7eecf-62da-b77b-4685-ddae6cc0ee39@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 22/12/2016 11:51 pm, Morten Shearman Kirkegaard wrote:
> On 2016-12-22, at 13:24:10 +0100, David Demelier wrote:
>> However to stop spam I've enabled the subonlypost option to only allow
>> subscribers to post mails. The problem is that I also would like to
>> add specific addresses so my own mail server can also send mails to
>> people subscribed.
>
> The easiest way of allowing that, is adding them in nomailsubs.d/.

This is absolutely right. But using 'send' in an access file should have
worked, too. I might have to look into that.

