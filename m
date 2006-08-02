From: Neale Pickett <neale@woozle.org>
Date: Wed, 02 Aug 2006 15:18:15 +0000
Subject: Reply-To header munging (was: Reply to the list)
Message-Id: <200608020918.15928.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday 02 August 2006 8:51 am, Allan Joergensen wrote:
> On 02-Aug-2006, Neale Pickett wrote:
> > > It may because the REPLY-TO is not forced...(?)
> >
> > http://www.unicom.com/pw/reply-to-harmful.html
>
> http://www.metasystema.net/essays/reply-to.mhtml

Normally I'd side with Charlie's "please drop it" argument.  But since this 
subject is actually pretty on-topic for this list, I'll keep going.

RFC 2822 (which supercedes RFC 822, which is what both of our URLs cite) is 
very clear about the use of the Reply-To header.  3.6.2 states:

   When the "Reply-To:" field is present, it indicates the mailbox(es) to
   which the author of the message suggests that replies be sent.

The author, mind.  Not the list owner or any other middle-man.

I used this functionality just yesterday to post a message to a list on behalf 
of my wife.  I didn't want to get follow-ups.  There would have been no way 
for me to do this if they munged the Reply-To header.

Also see section 3.4 of RFC 2369:

   The List-Post field describes the method for posting to the list.
   This is typically the address of the list, but MAY be a moderator, or
   potentially some other form of submission. For the special case of a
   list that does not allow posting (e.g., an announcements list), the
   List-Post field may contain the special value "NO".

And, in fact, my mail client (KMail, mentioned specifically in your URL) has 
four options for replying:

Reply
  Replies to the List-Post address, the Reply-To address, or From address, in 
that order.

Reply to All
  Replies to all addresses in Reply-To or From, the To, and the Cc fields

Reply to Author
  Replies to the Reply-To or From address

Reply to List
  Replies to the List-Post address


The first two are the "primary" ones, the latter two aren't bound to a 
hot-key.  I think this behavior implies that they want lists not to munge the 
Reply-To header, especially since there's no way to have it ignore the 
Reply-To header.  Munging it *would* penalize me, and in fact I have a number 
of procmail rules which remove the dumb header for silly lists that set it.


Okay, your turn Allan :)
