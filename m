From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 01 Sep 2004 06:44:23 +0000
Subject: Re: ETA for digests?
Message-Id: <867jrebi9k.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040831214700.GX23171@mail.lieber.org>
In-Reply-To: <20040831214700.GX23171@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Morten K. Poulsen" <morten@afdelingp.dk> writes:

> - Move subjects to listtext files (now we have hardcoded english
>   subjects). This change will break existing installations.

There could be a check to see if the first line in the listtext starts
with "Subject:" and if not use the default subject.

Then nobody would need to get surprised.

-- 
Christian Laursen
