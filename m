From: Jakob Hirsch <jh@plonk.de>
Date: Tue, 21 Mar 2006 16:56:30 +0000
Subject: Re: testing mlmmj
Message-Id: <4420303E.1020909@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20060319162716.GU31545@waterworld.anvame.net>
In-Reply-To: <20060319162716.GU31545@waterworld.anvame.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Andreas V. Meier wrote:

>> Exim does not add a Return-Path header by default, this is done by
>> return_path_add in the transport.
> Maybe this command should be stated explicitly in the README at the place where
> it says "Also make sure ...". I read that part, but due to lack of knowledge how
> to just discarded it :)

README.exim4 lists it in its transport, but you'll probably not read it
when using mlmmj's default way.

FWIW, the first thing I stumbled over when installing mlmmj was right
that. Somehow this line in the readme must have some magic autohide
feature. :)
