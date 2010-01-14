From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 14 Jan 2010 05:00:31 +0000
Subject: Re: 'Not metoo' feature
Message-Id: <4B4EA4EF.8090303@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4B4DDEAC.5030103@yahoo.com.au>
In-Reply-To: <4B4DDEAC.5030103@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> As I think through the things in Mailman that I used to use
>> before deciding I'd like to switch, a feature I'd be interested
>> in having is a 'not metoo' feature. This means when the manager
>> sends out an email it omits the sender from the distribution list.
>
> Just checked, and I believe the changes for this need to be done in
> mlmmj-send.c, in the functions send_mail_verp and send_mail_many_list,
> both in the loop
>
> for(i = 0; i < addrs->count; i++) {
>
> => comparing "from" with addrs->strs[i] and just "continue" when these
> are equal should be ok ...
>
> Of course then the new tunable needs to be checked etc ...

Sounds like a good start. Ideally this would be selectable on a
per-subscriber basis. Perhaps best would be a notmetoo version of the
list (much like the nomail and digest versions), then subscribers could
have their preferred delivery method by subscribing to the right
version; a tunable could make the default +subscribe action a notmetoo
subscription.

Hmm. As I further my investigations into things that I have found useful
but which mlmmj doesn't have, I discover another, which is moderation
being choosable on a per-subscriber basis. You can get an approximation
of this using access rules, but after a little while and as list sizes
grow, this will quickly become cumbersome and inefficient. Making
another 'version' of the list, though, just starts to get ridiculous, as
combinations of different versions start to become possible and
desirable. I think to do this properly somehow the idea of
per-subscriber options needs to be given to mlmmj, and that's both a
sizeable job, and a bit of an upheaval to current practice. Perhaps
something to consider long term.

In the meantime, my most pressing need is what I originally wrote about,
and perhaps an easier short-term solution to this is just to allow an
exception list. Smartest may be to have two tunables: 'metoo' and
'notmetoo'; if neither exist, behaviour is as normal; if notmetoo
exists, senders are included in the distribution unless listed in the
notmetoo file; if metoo exists, senders are omitted from distribution
unless listed in the metoo file. I would usually use the metoo file,
then, but others may prefer the other.

Perhaps we could have some discussion about how these other
per-subscriber things could be implemented satisfactorily long-term
later.

I've pretty much finished my survey of things I'd like/find useful in
mlmmj now, and everything else is easier than the stuff mentioned in
this email. I'll raise the issues over time in new threads and hopefully
help make some patches.

Ben.





