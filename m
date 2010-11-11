From: Martin Koch Andersen <martin@925.dk>
Date: Thu, 11 Nov 2010 13:05:35 +0000
Subject: Re: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <F5DDAB49-9EA6-401D-A4B4-98CB76808A76@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

On 11/11/2010 13.33, Ben Schmidt wrote:
> Yeah, exactly. Something very strange is going on. I doubt it's getting
> to the relevant point in mlmmj-send where the mail is moved to mailfile.
> It might be exit()ing for some undesired reason prior to that point
> (like the potential init_sockfd() problem I just wrote about and found
> while investigating this issue), or it might be segfaulting or
> something.
> 
> Do you have a verp control file at all? What's in it if so?

Nope I don't.

> Also, these are normal posts, not digests, aren't they?

Normal yes.

> Because rename() isn't just being used to rename. It's also being used
> to check for the existence of the directory. If it fails, the idea is
> that nothing was requeued, and since we're not archiving, we don't need
> the file. It's not an error but a "we don't need this" condition. It
> should have something more like this:

I see.

> len = strlen(listdir) + 9 + 20 + 9;
> requeuefilename = mymalloc(len);
> snprintf(requeuefilename, len, "%s/requeue/%d",
> 	listdir, mindex);
> if(stat(requeuefilename, &st) < 0) {
> 	/* Nothing was requeued and we don't keep
> 	 * mail for a noarchive list. */
> 	unlink(mailfilename);
> } else {
> 	snprintf(requeuefilename, len,
> 		"%s/requeue/%d/mailfile",
> 		listdir, mindex);
> 	if (rename(mailfilename, requeuefilename) < 0) {
> 		log_error(LOG_ARGS,
> 				"Could not rename(%s,%s);",
> 				mailfilename,
> 				requeuefilename);
> 	}
> }
> myfree(requeuefilename);
> 
> I've given it only a quick and superficial test, but it seems to work,
> and it can't fail much worse for you than it already is anyway, so if
> you're in a position to compile a patched mlmmj yourself, please do give
> it a shot!

Patch makes sense. I don't have a chance right now to test it though. But looks fine, and will help us exclude rename() failing. Will try it when new release is out. Until then I just have to keep an eye of the requeue I guess :(

Would it perhaps make sense, and not be too difficult to write the mailfile before sending out the mails - rather than after all is done?
E.g. before anything takes place (and then delete it, when all is done, if not needed) or on first requeue. That way, if things go bad (for reasons still unknown...), at least there is a mailfile for the subscribers that have already been requeued?

-- 
Martin Koch Andersen
http://925.dk

