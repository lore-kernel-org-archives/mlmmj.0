From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Fri, 05 Nov 2004 09:17:04 +0000
Subject: Re: feature request: DIR/mimereject
Message-Id: <20041105091704.GA6901@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <20041104170533.GK10927@mail.lieber.org>
In-Reply-To: <20041104170533.GK10927@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Nov 04, 2004 at 07:53:36PM +0100, Mads Martin Joergensen wrote:
> > That said, one thing we *really* need is the DIR/mimereject feature of
> > ezmlm. (might be an ezmlm-idx specific feature, come to think of it) This
> > feature scans list messages prior to sending them and rejects messages with
> > pre-defined attachment types.  "application/octet-stream" is the one we
> > block on most of our lists as those attachments are generally
> > worms/viruses.
> 
> In DIR/control/access:
> 
>  deny Content-Type:.*application/octet-stream
>  allow

I don't think that's what Kurt want. Our access check only checks the mail's
headers. He probably wants to check the headers of each MIME part in the mail
body. That would require parsing the body, and checking the headers of each
part - not an easy task. And definitely not an easy thing to do correctly.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
