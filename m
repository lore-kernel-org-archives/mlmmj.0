From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 31 Aug 2004 22:58:25 +0000
Subject: Re: ETA for digests?
Message-Id: <20040831225825.GJ2877@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <20040831214700.GX23171@mail.lieber.org>
In-Reply-To: <20040831214700.GX23171@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

On Tue, Aug 31, 2004 at 09:47:00PM +0000, Kurt Lieber wrote:
> one of the key features we need is digest support.  As I understand
> it, that feature isn't currently available in mlmmj.  Are there plans
> to add it?  If so, is there an ETA?

I am not sure about Mads Martin's plans.

How much can be changed in the RCs? I would like to see the following
done (I know, I know, but I've been outside, enjoying the summer) before
1.0.0:

- A standard way of creating queue files (like prepstdreply.c:66-74) in
  a function.
- Use prepstdreply() everywhere.
- Move subjects to listtext files (now we have hardcoded english
  subjects). This change will break existing installations.

I think there should be a 1.0 branch soon after the 1.0.0 release, so we
can start developing 1.1 on HEAD. I have another feature that I would
like to do, but I guess it's too late for 1.0 now :-)

Digest should be quite simple to add. I think we should have a counter
(like index), indicating the last mail sent in a digest. Then every time
we (mlmmj-maintd, cron?) would like to send a digest, it digests every
mail with an archive-index > counter, and save the last send index in
the counter.

MMJ, how about a coding session in the beginning of next week?

Best regards,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
