From: "Patrick Bennett" <patrick@pebcomputing.com>
Date: Wed, 06 Jul 2005 06:17:10 +0000
Subject: Fw: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <002601c581f2$57f28ef0$6564a8c0@stnick>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

oops, forgot to cc the list. apologies.

    -Patrick

----- Original Message ----- 
From: "Patrick Bennett" <patrick@pebcomputing.com>
To: "Casey Allen Shobe" <lists@seattleserver.com>
Sent: Tuesday, July 05, 2005 11:14 PM
Subject: Re: footer isn't appended to multipart messages (part II: reality 
check!)


> Alright, first, not intending to have started a flame war whatsoever, 
> but.... well, anyway, hoping I'm being read in a tone that takes it down a 
> notch and injects a bit of humor....
>
> I think we (ie. "free/open source" software developers {you, I presume}, 
> administrators {me} and users {lots of oft strident and fanatic folk out 
> there}), often miss the boat by insisting our preferences must be foisted 
> as "the one true way" on all the other innocent users out there (and by 
> "users" I mean not just end-users, but purchasing decision makers, pointy 
> haired bosses, systems administrators, etc.).  This, imho, is one large 
> factor that hinders open source software adoption by "the stupid users", 
> the business world, pointy haired bosses, ad infinitum.  Don't we come off 
> as a bit kooky with such unbending sloganeering?  We do propose to create 
> in the bazaar, rather than the cathedral, no?  I thought the point was to 
> create high quality, highly flexible software and share it with the world 
> for everyone's mutual benefit..... or maybe I got that wrong and it is 
> instead to create a "free as in beer" fourth reich.
>
>
> ----- Original Message ----- 
> From: "Casey Allen Shobe" <lists@seattleserver.com>
> To: <mlmmj@mmj.dk>
> Sent: Tuesday, July 05, 2005 7:38 PM
> Subject: Re: footer isn't appended to multipart messages (part II: reality 
> check!)
>
>
>> On Tuesday 05 July 2005 23:32, you wrote:
>>> This is absolutely true- you (that is to say, *we*, that is to
>>> say techie/programmer types) find this stuff very annoying.
>>> However, mailing lists are used by knitting clubs too, and I, for
>>> one, DO NOT want the nightmare of administrating a knitting club
>>> mailing list that has absolutely no dependable notification of
>>> "how to do it yourself".
>>
>> Reality check indeed:  knitting club members aren't going to have a
>> clue wtf the reminder mail or appended text means.  They don't
>> understand what "unsubscribing from a mailing list" is, they just
>> use a particular address to talk to other club members.  If they
>> want off the list, no matter how much you spam them with
>> instructions, they will ask the head of the knitting club to do it.
>> I'm on some lists which append unsubscription messages to every
>> mail, and guess what I see posted there all the time?  empty
>> messages with "unsubscribe" subjects (often with unsubscribe
>> misspelled, not that it matters since that's not how the lists
>> work).
>>
>
> You're right, my hypothetical "knitting club" was probably too far on the 
> other end of the spectrum and thus a poor example, mea maxima culpa.  My 
> target users are actually in between- comfortable with technology, but not 
> professionals nor geeks.  They desire obviousness and convenience and more 
> or less easily understand and are eager to follow a terse "unsubscribe 
> footer" or regular reminder; but are frustrated by enforced ignorance. 
> The damn shame of wasting a few hundred bits of bandwidth a day on a 
> helpful (to them, but obviously not to you) footer, or a few hundred bits 
> of bandwidth a month on a helpful (to them, but obviously not to you) 
> how-to-be-a-good-mailing-listizen email is utterly lost on them.  Some of 
> them, only a few mind you, might even actually have a background jpg 
> embedded into their email.  {Gasp!}
>
>> Also, even though Outhouse Express is not yet one of them, many mail
>> clients have built-in support for List-Unsubscribe header which
>> enables a button for unsubscribing from the list.
>>
>
> I wasn't aware of this feature.  Cool.  I'll see if I can get it to work. 
> Any further info on how to implement this?
>
>>> not sure which "example" you mean
>>
>> The example you asked about:  appending footers with
>> subscribe/unsubscribe information.
>>
>>> For other lists, on the contrary, it should be *encouraged* (see
>>> above)!
>>
>> I could not disagree with this statement more.  You really think
>> that when I (the idiot user in this example) feel like
>> unsubscribing that I'm going to wait around for the next monthly
>> mail or go digging around for an old one?  No, I'm going to whine
>> to the list owner or whomever I think is in charge if I can't
>> figure things out, and probably just the whole list to make sure
>> somebody hears me.
>>
>>> 1)  I haven't found the documentation on how to enforce text-only
>>> mailing lists
>>
>> You could filter incoming messages with something like maildrop or
>> your own script.  Not sure how you'd go about mingling this with
>> mlmmj, perhaps somebody else can answer that.
>>
> I had inferred (apparently incorrectly; a thousand apologies) from 
> something another respondent had said that there was a mlmmj built-in 
> method for enforcing text-only posting.  Thus, my comment about not being 
> able to find any documentation on it.
>
>>> 2) not sure what happens on a text-only mlmmj list when a
>>> multi-part msg is sent, but [it] has to handle the
>>> default settings of widespread [...] email clients [...].
>>
>> Short answer, if you want HTML mail to reach the list, then don't
>> block it.  If you care about people seeing signatures on every
>> single mail (even the HTML ones), then don't allow HTML.  You can't
>> (easily) have your cake and eat it too.
>>
>> Long answer, you *can* have your cake and eat it too, but it will
>> require substantial work on your part to reduce the messages (which
>> I don't think you're actually willing to do or you might have just
>> implemented multipart footer appending yourself):
>>
> If I understand correctly, and I may well be mistaken, other mailing list 
> softwares out there in the open source world (gnu mailman comes to mind as 
> an example), are able to handle appending footer messages to a wide 
> variety of incoming email formats.  No suggestion that, coding wise, this 
> is accomplished *easily*, but just that it would be cool (and, in 
> particular, useful to *me*) if mlmmj could do it as well.  Besides, I 
> doubt a corrupted final email (that is to say, a multi-part mime mail with 
> a plain-text footer appended to it inappropriately) is the goal of the 
> mlmmj crafters.  If I were both 1) an experienced programmer, and 2) an 
> expert in email protocol, formats, etc., you're right, I could implement 
> this my own damned self, couldn't I?!?  As it is, I've just wasted every 
> one's time with my unworthyness and rubish opinions.
>
>
>> Another answer, if you just want a monthly/weekly/whatever reminder,
>> just mail the list from a cron job.
>>
>
> Now *there* is a useful suggestion that I might well steal.  Even though, 
> again, I couldn't find any documentation of it, I had just hoped and 
> half-way suspected (since it seems like a common feature, even if you 
> personally are offended by it, in many mailing list managers) that mlmmj 
> had something built-in to handle this already.
>
>
>> Cheers,
>> -- 
>> Casey Allen Shobe | http://casey.shobe.info
>> cshobe@seattleserver.com | cell 425-443-4653
>> AIM & Yahoo:  SomeLinuxGuy | ICQ:  1494523
>> SeattleServer.com, Inc. | http://www.seattleserver.com
>>
>>
>
> Eeek! Is that a foote... nay, inline-spam!!!?!??!??
>
>    -Patrick 

