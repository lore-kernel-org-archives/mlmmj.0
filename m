From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Wed, 04 Mar 2009 20:34:15 +0000
Subject: Re: Autoresponders/autoreply replies are marked as bounces
Message-Id: <1236198855.6562.21.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
In-Reply-To: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, 2009-02-21 at 05:49 +0800, Thomas Goirand wrote:
> Dan Andersen wrote:
> > So what you'r saying is that im not missing any headers/settings, some
> > mailserveres are just stupid and reply to the wrong email ?
> 
> Correct. There are so many broken auto-responder out there...

True, but the one in question appears to be doing the correct thing:
Replying to the SMTP FROM address.

> > What are some RFCxxx says about it, what are the right email to
> > reply to ?
...
> > Im not caple of finding any rfc there describe wich email the mail
> > server should reply to, can anyone help wich that?

RFC 3834 - Recommendations for Automatic Responses to Electronic Mail


Do you set any RFC 2369 style List-* headers, e.g. List-Id? Or a
Precedence header? That might help the auto-responder.


Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

