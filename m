From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 19 Sep 2010 12:30:48 +0000
Subject: Re: [mlmmj] pkg-mlmmj on alioth.debian.org
Message-Id: <4C960278.3030503@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4C950475.9050705@goirand.fr>
In-Reply-To: <4C950475.9050705@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Call-response time!

On 19/09/10 4:27 AM, Thomas Goirand wrote:
> Daniel, Ben and others,

Hi, Thomas.

I don't believe I've met you yet, Daniel, but hi to you too, and thanks
for the effort you put in to maintaining mlmmj downstream.

> I've been granted administrator access to the pkg-mlmmj project in
> Alioth. This was created a long time ago, but it has never been used, so
> it wasn't an issue to give me the admin rights.

Sounds great.

> [...]

> Ben, what's up with the git bridge? Any progress? I would have love to
> help, but having no access to the server behind mlmmj.org, there's not
> much I can do... Having the possibility to "git pull" from you guys,
> would really help, as I don't know hg at all, and that most projects in
> Debian are moving to Git (including all my packages).

I was kinda hoping you and Wolf would collaborate on that and set it up
without involving me. I'll give Wolf a nudge; he's got some git
experience, so may be cool to sort it all out himself, and if not, he
can ask you for a hand.

> Also, I saw in the release notes for 1.2.17.1 few scary things that made
> me push the security alarm button in Debian (eg: I sent a release
> critical bug against the mlmmj package). Then I had a look into the hg
> log, and didn't find any issue, but the one that I fixed with the php
> admin. Can you confirm that there's nothing serious impacting security
> that I should add in the Debian package made for Squeeze? If possible,
> I'd like to avoid doing any modification so close to the release of
> Debian (we might send the 1.2.17.1 to proposed-updates later on
> though...). Please let me know.

Yes, the only real security bug is that php-admin one that took two
commits to actually fix right (with your fix being the better one). The
rest are just small bugs that I didn't feel needed significant testing.

> [...]

Cheers,

Ben.





