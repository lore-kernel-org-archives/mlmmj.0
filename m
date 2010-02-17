From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Wed, 17 Feb 2010 21:40:57 +0000
Subject: Re: PATCH: Access priority
Message-Id: <1266442857.22451.26.camel@mopo-laptop>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-M9lk+75sflibZvbuA6u9"
List-Id: <mlmmj.mlmmj.org>
References: <4B5D7A55.4090302@yahoo.com.au>
In-Reply-To: <4B5D7A55.4090302@yahoo.com.au>
To: mlmmj@mlmmj.org


--=-M9lk+75sflibZvbuA6u9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-17 at 08:40 +1100, Ben Schmidt wrote:
> > One possible solution - at least to the bypass moderation problem -
> > might be to add another keyword. We could add "send" to force the mail
> > past normal moderation procedures.
> 
> Exactly what I was thinking after reading the issues you raised above.
...
> Shall I put together a new patch?

Yes, that would be nice.

I can't think of many real-world scenarios where it would be useful, but
if you have the time to write a patch, let's have that feature. It
should not complicate things by much.

On Tue, 2010-02-16 at 23:03 +0100, Franky Van Liedekerke wrote:
> my 2 cents:
> - I always though of allow/reject as being on the IN-side: allow a mail
>   to be send to the list and go on with the next steps (or reject), so
>   personally I prefer the third flow. But functionally the second and
>   third flow are almost alike, with the advantage of the third flow
>   that you can force certain mails to be moderated

It is, and I think it makes good sense.

> - if the third flow is choosen, don't call the new keyword plain
>   "send", call it eg. "force-send" or "bypass-mod" or so. People tend
>   to like descriptive keywords :-)

Why break a tradition og choosing ambiguous keywords? ;-)

> - whatever flow is choosen, I find it very nicely explained and want
>  this ASCII art in a README :-)

Patch attached. Will that do?


Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/

--=-M9lk+75sflibZvbuA6u9
Content-Disposition: attachment; filename="patch-mlmmj-1.2.17-README.access.diff"
Content-Type: text/x-patch; name="patch-mlmmj-1.2.17-README.access.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Index: README.access
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/README.access,v
retrieving revision 1.5
diff -u -r1.5 README.access
--- README.access	9 May 2007 16:59:23 -0000	1.5
+++ README.access	17 Feb 2010 21:30:20 -0000
@@ -23,9 +23,42 @@
 - "Regexp" is a POSIX.2 extended regular expression. Matching is done case
   insensitive.
 
+The action "allow" will pass the mail on to the next step in processing. The
+mail may still be held for moderation, if it would have been so without access
+rules.
+
+The action "deny" will not send the mail to the mailing list, but will send a
+rejection mail to the sender.
+
+The action "discard" will not send the mail to the list, and will not send a
+rejection mail.
+
+The action "moderate" will hold the mail for moderation.
+
 IMPORTANT: if "moderate" is used then don't forget to add people who should
            function as moderators in listdir/control/moderators
 
+
+The flow out of the access system is like this:
+
+                      |
+                      v
++--------+   deny +--------+ discard   +---------+
+| reject |<-------| access |---------->| discard |
++--------+        +--------+           +---------+
+               allow |  | moderate
+                     |  +-----------+
+                     v              v
+               +------------+    +------+
+               | moderation |--->| hold |
+               +------------+    +------+
+                     |              |
+                     v              |
+                  +------+          |
+                  | send |<---------+
+                  +------+
+
+
 First a simple example. This rule set will reject any mail that is NOT plain
 text, or has a subject that contains "BayStar", and allow anything else:
 

--=-M9lk+75sflibZvbuA6u9--


