From: =?utf-8?Q?Mads_Martin_J=C3=B8rgensen?= <mmj@mmj.dk>
Date: Tue, 16 Jun 2020 09:27:02 +0000
Subject: Re: [mlmmj] access::Deny seems to have stopped working ?
Message-Id: <4124CD62-ED29-4AF7-BCFD-639291A43B11@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <rc5bj1$gl8$1@saturn.local.net>
In-Reply-To: <rc5bj1$gl8$1@saturn.local.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

That's because it's kind of headers, in the body. IIRC you're right Per. Only headers are checked.

> On 16 Jun 2020, at 11.19, Per Jessen <per@opensuse.org> wrote:
> 
> As far as I can tell from the source code and my debugging, yes - headers are only collected until the empty line between header and body.

-- 
Mads Martin Jørgensen
“Why make things difficult, when it is possible to make them cryptic and totally illogical, with just a little bit more effort?” - A. P. J




