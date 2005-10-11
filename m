From: Neale Pickett <neale@woozle.org>
Date: Tue, 11 Oct 2005 12:55:23 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II:  reality check!)
Message-Id: <200510110655.24309.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday 11 October 2005 03:30 am, Jakob Hirsch wrote:

> > DIR/control/mimeencapsulate seems like the TUNABLE for it :-)
>
> something like footer_use_mime sounded logical for me, as it's only used
> if there's a footer, but I don't really care about that.

What if you call it control/mime_footer, which would supercede control/footer 
and contain a full MIME part?  For instance:

  Content-Type: text/plain

  This is the snot mail list.  To unsubscribe, send a message with
  the subject "UNSUBSCIBE" to every member of the list, individually.

The advantage here would be that you could make the footer anything you like: 
it could be HTML, or a PNG, or even a multipart/alternative with all three.

If you wanted to be super spiff about it, you could check to make sure there's 
a header block in the file and if not prepend the Content-Type: text/plain 
part.

Call me crazy,

Neale
