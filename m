From: Casey Allen Shobe <lists@seattleserver.com>
Date: Wed, 06 Jul 2005 17:37:06 +0000
Subject: Mailing list philosophy (was: footer isn't appended to multipart messages)
Message-Id: <200507061737.06077.lists@seattleserver.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wednesday 06 July 2005 06:17, Patrick Bennett wrote:
> Alright, first, not intending to have started a flame war
> whatsoever, but.... well, anyway, hoping I'm being read in a
> tone that takes it down a notch and injects a bit of humor....

I hope you're reading me in a tone that makes it clear that while I 
will not hesitate to point out errors in your reasoning, I'm by no 
means calling you stupid, just that your wants are misguided.  How 
I read you is in a tone that likes to use mocking and sarcasm 
towards people who try to provide you with the information you want 
when it's not exactly the answer you want, which isn't very 
considerate.

> > I think we (ie. "free/open source" software developers {you, I
> > presume}, administrators {me}

Actually, I'm mostly an administrator, and secondly a developer (and 
not of mlmmj).

> > our preferences must be foisted as "the one true way" on all
> > the other innocent users out there (and by "users" I mean not
> > just end-users, but purchasing decision makers, pointy haired
> > bosses, systems administrators, etc.).

Actually, from my perspective I see is you saying that, saying that 
you must have unsubscription reminders.  In any case, there's a big 
difference between essential/useful functionality and feature 
bloat.  It's largely up to the software author to decide which is 
which.  A lot of people hate the way mailman works compared to 
majordomo, bot almost nobody will deny that majordomo is a far more 
flawed piece of software, and as such not many still use it.  
"Because X did it" is never a good reason to do something.  If X 
jumped off a bridge to their death, would you follow?

I for one don't care about pleasing purchasing decision makers (I'm 
not selling software, and when I do sell, I don't worsen the 
product just to make a sale), pointy-haired bosses (assuming by 
this you mean the kind of person who demands crazy things that are 
complete garbage and a waste of time for anybody who has to do them 
as found in the Dilbert cartoons).  A typical system administrator 
is on the complete opposite end of the scale - I know, because I am 
one.

> We do propose to create in the bazaar, rather than the cathedral,
> no?

I'm not sure what that has to do with huge software packages with 
loads of features that nobody uses.  One of the best design 
practices about unix software has been to use small simple software 
pieces together to attain the desired goal, *not* to make one big 
monolith software with a lot of options.

> I thought the point was to create high quality, highly flexible
> software and share it with the world for everyone's mutual
> benefit.....

Exactly.  I think you're misunderstanding what "flexible" means 
though...true flexibility means the software can intermingle with 
other products including your own to do pretty much anything 
easily, as opposed to a large, overburdened monolithic system that 
cannot be easily extended (i.e. Microsoft products), where 
everything you might want is realistically necessary for the vendor 
to add as a feature.

> ----- Original Message -----
[...]
> Subject: Re: footer isn't appended to multipart messages

Wow, you should really not mix top-posting and bottom-posting (and 
avoid top-posting entirely).  I didn't even realize you had any 
reply text below this until I went to delete the message text and 
at the last minute with all the text highligted before pressing 
delete noticed your comment below my signature.

> > They desire obviousness and convenience and more or less easily
> > understand and are eager to follow a terse "unsubscribe footer"
> > or regular reminder; but are frustrated by enforced ignorance.

Then, they should be happy if you make the options clear on your web 
page where they sign up; they will be frustrated with endless 
reminders which make them feel like you think they're stupid (or 
that somebody on the list is, anyways).

> The damn shame of wasting a few hundred bits of bandwidth a day
> on a helpful footer, or a few hundred bits of bandwidth a month
> on a helpful how-to-be-a-good-mailing-listizen email is utterly
> lost on them.

I think you wrote this sentence wrong - it sounds like you're 
agreeing.  It is lost on them, because they'll come asking the list 
or admin for help anyways.  I've seen it happen on dozens of lists 
with forced footers.  All you get from putting the same garbage at 
the end of every mail is the users to tune it out and forget it's 
there.  All you get from periodical mailings is users tuning it out 
and hitting the delete key immediately upon reception.  When and if 
a user wants to unsubscribe, they will come looking for it.  Make 
it clear on the page where they signed up - but you'll never 
eliminate all email requests.

> Some of them, only a few mind you, might even actually have a
> background jpg embedded into their email.

I don't see what that has to do with anything.  But if they can 
figure out how to add a background jpg, they can figure out how to 
unsubscribe.

> I wasn't aware of this feature.  Cool.  I'll see if I can get
> it to work. Any further info on how to implement this?

As I said, it depends on the mail client - it's not something you 
typically need to implement.  One example is squirrelmail, which 
has a plugin which adds such links in the message header display 
along with the From and To...  Thunderbird also has such an 
extension.  KMail has support built-in, though it requires a more 
specific header structure than it should in the current release.

> I had inferred (apparently incorrectly)

You weren't incorrect as it turns out, but I simply provided you 
with information on one possible option that would work in either 
case.

> Now *there* is a useful suggestion that I might well steal. 
> Even though, again, I couldn't find any documentation of it

What can't you find documentation of?  Cron is extremely-well 
documented, and what part of "send a mail to the list address" 
really needs documentation (not sure which part you mean)?

> Eeek! Is that a foote... nay, inline-spam!!!?!??!??

Yes, it's within the commonly-unfollowed 4-line netiquitte rule, and 
follows a '-- ' so that you can automatically drop it in a 
supporting mail client.  The Yahoo forced-footers, on the other 
hand, follow neither rule.  Further, it's not spam, it's contact 
information relevant to the sender, which is exactly what belongs 
in a signature, without even having any witty quotes or ascii art.  
I think you know that though, and you're just trolling now.

Anyways, as I said in my first mail which you didn't seem to read:
> (this is not to say that your feature request/bug report is
> invalid - it is in fact useful in some cases and should work as
> you expect, but the example you provided (unsubscription
> reminders) should be discouraged and it's also not the easiest
> thing to implement due to the varying nature of what the multipart
> messages might contain, how the HTML is structured, etc.)

Cheers,
-- 
Casey Allen Shobe | http://casey.shobe.info
cshobe@seattleserver.com | cell 425-443-4653
AIM & Yahoo:  SomeLinuxGuy | ICQ:  1494523
SeattleServer.com, Inc. | http://www.seattleserver.com
