From: Martin Koch Andersen <martin@925.dk>
Date: Thu, 11 Nov 2010 10:06:06 +0000
Subject: Re: [mlmmj] Re: Mail delivery issues and requeue
Message-Id: <4B0CD63F-B896-4CA0-93EC-75BEC6B46087@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
In-Reply-To: <D5B431D8-D13A-468D-BE78-81FB9FAFB10D@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ben & others,

On 11/11/2010 01.36, Ben Schmidt wrote:
> Any idea how the address got there? I suspect it's come through
> mlmmj-sub via a web interface or something? I know mlmmj-sub doesn't
> have particularly adequate validation at present.

Yah, addresses come from a variety of places. These lists have tens of thousands of subscribers. So a bad address will eventually sneak in once in a while.

>> I've unsubscribed this address, and other syntax error ones, from the list now.
>> 
>>> There should always be a /requeue/x/mailfile, though. If that doesn't
>>> exist, perhaps mlmmj is even crashing.
>> 
>> Could this be a bug in mlmmj? The mailfile was not created today either for the list in question.
>> I'll perhaps see tomorrow, with the invalid addresses removed, if it is.
> 
> It most certainly could be. I've had a look at the relevant code and
> can't quickly spot a bug, though.
> 
> There isn't a followup error message after the Error in RCPT TO, is there? I don't expect one, but it's worth checking!

Nope there is not. Today the same thing happened. No mailfile for that list in requeue/x/. Only thing in error log was:

Nov 11 09:52:22 goulding /usr/local/bin/mlmmj-send[89349]: mlmmj-send.c:267: Error in MAIL FROM. Reply = [501 5.1.7 Bad sender address syntax^M ]: No such file or directory

Again because of a bad address. But I don't think the bad address itself is the problem? I mean, thats what requeue is there for in the first place. There must be some other reason while the mailfile is never being created for this list on requeue. As I've mentioned, the other lists on the same server, gets their mailfile's created just fine. And all lists have same setup/config (I triple checked that!).

I'm using mlmmj-1.2.17.1 from the FreeBSD ports.

I don't know what is going, but it is a problem, because the subscribers in requeue will never get their mails, because of the missing mailfile.

Would it be possible to at least add a log_error() in the relevant place where the mailfile is supposed to be created? I think it's in mlmmj-send.c at the bottom of main():

...
if (rename(mailfilename, requeuefilename) < 0)
  unlink(mailfilename);

- in the "noarchive" branch. The list is "noarchive".

I also wonder why, when rename() fails, the if(!ctrlarchive) { branch does not unlink the mailfilename, whereas with noarchive it is unlinked.

Kind regards,

-- 
Martin Koch Andersen
http://925.dk

