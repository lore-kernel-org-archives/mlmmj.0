From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 11 Nov 2010 16:07:05 +0000
Subject: Re: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <4CDC14A9.5000607@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> Yeah, exactly. Something very strange is going on. I doubt it's getting
>> to the relevant point in mlmmj-send where the mail is moved to mailfile.
>> It might be exit()ing for some undesired reason prior to that point
>> (like the potential init_sockfd() problem I just wrote about and found
>> while investigating this issue), or it might be segfaulting or
>> something.

I think I found a code path that could cause a segfault if the MTA
disconnects the client, so that could be the answer. It should probably
be logging another error message, though, which it isn't, so perhaps
that's not the problem.

>> Do you have a verp control file at all? What's in it if so?
>
> Nope I don't.

No maxverprecips either? That means the default 100 will be used. Even
if not using verp, this is how many mails will be sent in a single SMTP
transaction.

> Would it perhaps make sense, and not be too difficult to write the
> mailfile before sending out the mails - rather than after all is done?
> E.g. before anything takes place (and then delete it, when all is
> done, if not needed) or on first requeue. That way, if things go bad
> (for reasons still unknown...), at least there is a mailfile for the
> subscribers that have already been requeued?

Maybe. It could essentially be reorganised so that requeuing is the
norm. Everything in place as if requeuing, but then remove the requeue
file if there are no requeue subscribers. I'll probably leave it until
after 1.2.18, though, as it would be a biggish change and would need to
be carefully thought through.

And I'd prefer to find whatever this other bug/problem is, anyway. I
don't like it.

Ben.




