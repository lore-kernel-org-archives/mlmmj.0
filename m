From: Martin Koch Andersen <martin@925.dk>
Date: Thu, 28 Oct 2010 22:58:17 +0000
Subject: [mlmmj] Re: Permission trouble
Message-Id: <F061C563-3C6B-40F9-B5CB-755310B3B63E@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
In-Reply-To: <A6F4BBD6-0B74-48A4-B0D5-4400CF089CF0@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On 28/10/2010 23.17, Martin Koch Andersen wrote:
> I have a little permission trouble setting up mlmmj alongside perl-admin.
> 
> I use postfix, which puts files as nobody. I have apache which runs as www.
> I followed the instructions of the README file of both mlmmj and perl-admin.
> www and nobody users have been added to group mlmmj.
> 
> [..]
> 
> Problem is:
> If I add a user using perl-admin I can not un-subscribe using mlmmj (sending list+unsubscribe@ mail).

Ah, my problem seem to be that postfix (local) does not read secondary-groups. So adding postfix to the mlmmj group made no difference.
It would have been nice with a "permission denied" message somewhere though :)

-- 
Martin Koch Andersen
http://925.dk

