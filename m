From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 18 Oct 2004 12:51:02 +0000
Subject: Re: mail accepted but not retransmitted?
Message-Id: <20041018125102.GA6989@mopo.i.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, Oct 17, 2004 at 10:31:25PM -0400, Andrew Kohlsmith wrote:
> Everything seems to be as it should be as far as I can tell -- It was a
> standard install.

Could you try adding the -F option to mlmmj-recieve in your alias? That will
force mlmmj-recieve to NOT fork into the background, thereby getting the output
from it back to the mail server. That should give you (the sender) an error
mail with the output from mlmmj-recieve.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
