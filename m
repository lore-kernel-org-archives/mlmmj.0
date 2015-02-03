From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 03 Feb 2015 23:57:21 +0000
Subject: Re: [mlmmj] mlmmj wishlist request
Message-Id: <54D16061.1000702@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <54D14B2F.3010003@vlsc.org>
In-Reply-To: <54D14B2F.3010003@vlsc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, Philip!

Mlmmj can do what you want already, I believe. Just add a subscriber of the 
'nomail' type using the -n option to mlmmj-sub or by sending mail to 
listname+subscribe-nomail@domain.tld. Nomail users can post to the list, but posts 
are not distributed to them.

See the third paragraph of the description here:
http://mlmmj.org/docs/mlmmj-sub/

And the help list text (which you get by sending mail to listname+help@domain.tld) 
also contains information on this (though in source form, not the most readable):
http://mlmmj.org/hg/listtexts/file/904ef6171308/en/help

Best regards,

Ben.



On 4/02/15 9:26 AM, webmaster@vlsc.org wrote:
> I've been successfully running a handful of small mlmmj lists for several months
> now, on an eApps centOS cloud server, running sendmail. I have a question/request
> related to a feature that I used to exploit when working with the old majordomo
> mailing list tool:
>
> When using majordomo it was possible to configure a "closed" list, in terms of
> senders and receivers of posts (functionally similar to how mlmmj works using the
> "subonlypost" control file), while at the same time it was also possible to
> configure a secondary file (containing addresses) that could only submit posts,
> but not receive any posts.
>
> Perhaps a simple example can illustrate how this might be used:
> Acme Services is run by a board of directors, and the board has their own closed
> mlmmj list.  There are also several dept managers that work for Acme Services, and
> the board would like these managers to be able to communicate directly with all
> the members of the board by simply sending an email to the board list. On the
> other hand, the board doesn't want the managers receiving any of the board list posts.
>
> There are several other scenarios that might benefit from this ability - in fact
> I'd say it might find many uses, and the varied possibilities are likely the
> reason majordomo had this feature.
>
> I haven't seen anything that indicates this is somehow currently possible with
> mlmmj, so I apologize in advance for missing the notes on how to do this
> currently, if its already available.
>
> With mlmmj, I could envision having another directory similar to the existing
> "subscribers.d", that would contain file(s) of addresses that only had permission
> to "submit" posts.
>
> Or perhaps there could be some way to flag or code files contained in the existing
> "subscribers.d" directory that would indicate if the addresses it contains are
> only "submitters" or only " receivers" or both "submitters and receivers".
>
> I haven't looked under the hood far enough to know how simple or complicated this
> might be to implement with mlmmj (assuming its not there now) so I'm just sharing
> the thought, in the hope that someone might be intrigued by the idea of adding
> this feature, and hoping it would not be difficult to implement.
>
> Philip Parshley
>

