From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 04 Nov 2004 18:53:36 +0000
Subject: Re: feature request: DIR/mimereject
Message-Id: <20041104185335.GF23670@mmj.dk>
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

Sure, no problem. It's a bit hidden.

> That said, one thing we *really* need is the DIR/mimereject feature of
> ezmlm. (might be an ezmlm-idx specific feature, come to think of it) This
> feature scans list messages prior to sending them and rejects messages with
> pre-defined attachment types.  "application/octet-stream" is the one we
> block on most of our lists as those attachments are generally
> worms/viruses.

In DIR/control/access:

 deny Content-Type:.*application/octet-stream
 allow

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
