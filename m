From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 04 Nov 2004 18:25:54 +0000
Subject: Re: feature request: DIR/mimereject
Message-Id: <20041104182554.GD23670@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20041104170533.GK10927@mail.lieber.org>
In-Reply-To: <20041104170533.GK10927@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Kurt Lieber <klieber@gentoo.org> [Nov 04. 2004 18:05]:
> I didn't see this feature listed on the mlmmj page -- apologies if it
> already exists.
> 
> That said, one thing we *really* need is the DIR/mimereject feature of
> ezmlm. (might be an ezmlm-idx specific feature, come to think of it) This
> feature scans list messages prior to sending them and rejects messages with
> pre-defined attachment types.  "application/octet-stream" is the one we
> block on most of our lists as those attachments are generally
> worms/viruses.
> 
> I'd *like* to have a global option that allowed me to say, "for any/all
> lists on this machine, reject messages with the following MIME types".  IF
> that's more difficult, then I'm content with at least being able to do it
> on a list-by-list basis.  Another option would be some sort of /etc/skel
> type functionality, but that's a separate feature request, so I'm going to
> send that in a separate email.

How about using the functionality already there? Here's a snippet from
README.access (tar-ball and http://mlmmj.mmj.dk/files/README.access):

 A third example. Deny any mails with "discount", "weightloss", or
 "bonus" in the subject. Allow PGP signed and plain text mails. Anything
 else is denied:

 deny ^Subject:.*discount
 deny ^Subject:.*weightloss
 deny ^Subject:.*bonus
 allow ^Content-Type: multipart/signed
 allow ^Content-Type: text/plain

That should make it possible to do what you want no? And for the global
reject file, just make one access file in a central place and symlink it
everywhere.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
