From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 11 Nov 2010 12:33:35 +0000
Subject: Re: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <4CDBE29F.9090304@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> There isn't a followup error message after the Error in RCPT TO, is
>> there? I don't expect one, but it's worth checking!
>
> Nope there is not. Today the same thing happened. No mailfile for that
> list in requeue/x/. Only thing in error log was:
>
> Nov 11 09:52:22 goulding /usr/local/bin/mlmmj-send[89349]: mlmmj-send.c:267: Error in MAIL FROM. Reply = [501 5.1.7 Bad sender address syntax^M ]: No such file or directory
>
> Again because of a bad address. But I don't think the bad address
> itself is the problem? I mean, thats what requeue is there for in the
> first place. There must be some other reason while the mailfile is
> never being created for this list on requeue. As I've mentioned, the
> other lists on the same server, gets their mailfile's created just
> fine. And all lists have same setup/config (I triple checked that!).

Yeah, exactly. Something very strange is going on. I doubt it's getting
to the relevant point in mlmmj-send where the mail is moved to mailfile.
It might be exit()ing for some undesired reason prior to that point
(like the potential init_sockfd() problem I just wrote about and found
while investigating this issue), or it might be segfaulting or
something.

Do you have a verp control file at all? What's in it if so?

Also, these are normal posts, not digests, aren't they?

> I'm using mlmmj-1.2.17.1 from the FreeBSD ports.
>
> I don't know what is going, but it is a problem, because the
> subscribers in requeue will never get their mails, because of the
> missing mailfile.
>
> Would it be possible to at least add a log_error() in the relevant
> place where the mailfile is supposed to be created? I think it's in
> mlmmj-send.c at the bottom of main():
>
> ...
> if (rename(mailfilename, requeuefilename)<  0)
>    unlink(mailfilename);
>
> - in the "noarchive" branch. The list is "noarchive".
>
> I also wonder why, when rename() fails, the if(!ctrlarchive) { branch
> does not unlink the mailfilename, whereas with noarchive it is
> unlinked.

Because rename() isn't just being used to rename. It's also being used
to check for the existence of the directory. If it fails, the idea is
that nothing was requeued, and since we're not archiving, we don't need
the file. It's not an error but a "we don't need this" condition. It
should have something more like this:

len = strlen(listdir) + 9 + 20 + 9;
requeuefilename = mymalloc(len);
snprintf(requeuefilename, len, "%s/requeue/%d",
	listdir, mindex);
if(stat(requeuefilename, &st) < 0) {
	/* Nothing was requeued and we don't keep
	 * mail for a noarchive list. */
	unlink(mailfilename);
} else {
	snprintf(requeuefilename, len,
		"%s/requeue/%d/mailfile",
		listdir, mindex);
	if (rename(mailfilename, requeuefilename) < 0) {
		log_error(LOG_ARGS,
				"Could not rename(%s,%s);",
				mailfilename,
				requeuefilename);
	}
}
myfree(requeuefilename);

I've given it only a quick and superficial test, but it seems to work,
and it can't fail much worse for you than it already is anyway, so if
you're in a position to compile a patched mlmmj yourself, please do give
it a shot!

Ben.




