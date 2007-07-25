From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Wed, 25 Jul 2007 00:40:13 +0000
Subject: Re: question about tunable option
Message-Id: <Pine.LNX.4.64.0707242038430.17631@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <20070724205639.58a3afa6@franky>
In-Reply-To: <20070724205639.58a3afa6@franky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Wed, 25 Jul 2007, Mads Martin Joergensen wrote:

>> Yes, messages in an mbox file do have a "From " header. But that is not
>> relevant to what an MTA expects to see. 'From ' is not an RFC2821/2822
>> message header - it's mbox specific metadata storage (and also a message
>> separator in that format). mlmmj should never see a message with a line in
>> the message header starting 'From '.
>
> Point taken. But in case there is one--I want to delete it. I've seen
> mails to lists with From in it.

Really? Really truly? If you see it, it almost certainly didn't arrive via 
SMTP.

