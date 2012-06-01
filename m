From: Yuri D'Elia <wavexx@thregr.org>
Date: Fri, 01 Jun 2012 13:08:50 +0000
Subject: [mlmmj] mlmmj, envelope address and BATV
Message-Id: <4FC8BEE2.1080707@thregr.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi everyone. I've posted some time ago this bug report:

   http://mlmmj.org/bugs/bug.php?id3

along with some patches, fixing mlmmj behavior regarding the 
envelope/mail from address. I've been using these patches ever since to 
fix gmane (which I use for all my mailing lists).

Got the first complaint today from a user coming from a BATV address:

   http://en.wikipedia.org/wiki/Bounce_Address_Tag_Validation

this is news to me. As was discussed before:

   http://article.gmane.org/gmane.mail.mlmmj.general/1277

this clearly requires re-reading a whole lot of stuff now. It has been 
several years since I stopped lurking on nanae, but so far SPF/DKIM have 
been completely transparent. Doesn't seem to be the same for BATV.

ezmlm seem to have the same issue, since it processes addresses 
according to the envelope from, and not from the "From:" header. I've 
been trying to read what exactly mailman does, as mailman also uses 
(used to) to process addresses based on the envelope address, but I 
stopped because of lack of time.

The current version of mlmmj will "work" for these addresses as it will 
trust the "From:" header, but probably breaks a heap of other stuff such 
as bounce/loop detection. Apparently, trusting the From: address 
/should/ be safe whenever DKIM is being used, but this poses some 
additional problems as to where to process DKIM validation entirely (at 
the MTA level?).

I'm at loss here about what to do here (BATV is still a draft afterall), 
but I figured this would be important to discuss.

