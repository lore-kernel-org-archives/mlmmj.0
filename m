From: Yuri D'Elia <wavexx@thregr.org>
Date: Sun, 22 Jan 2012 13:36:43 +0000
Subject: Re: [mlmmj] [patch] Remove bashism from src/mlmmj-make-ml.sh.in
Message-Id: <0d8a5f04581092e0afc61b4cc31f84f8@thregr.org>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BC034.5060304@goirand.fr>
In-Reply-To: <4F1BC034.5060304@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 22.01.2012 14:27, Ben Schmidt wrote:
> Are you sure this is sh compatible?

Yes, printf is a standard posix utility and actually less susceptible 
to the echo builtin in various shells.

> I wonder if the echo version is perhaps more readable, and thus
> preferable anyway, rather than single-command wizardry. What do you
> think?

I would prefer two echos myself.


