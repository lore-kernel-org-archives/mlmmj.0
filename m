From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 20 Jul 2015 00:50:49 +0000
Subject: Re: [mlmmj] Gmail strips away the footer
Message-Id: <55AC45E9.5060600@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <55A4BE95.10402@axilleas.me>
In-Reply-To: <55A4BE95.10402@axilleas.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 14/07/15 5:47 PM, Achilleas Pipinellis wrote:
> Has anyone else noticed this?
>
> I did a test and sent from the Gmail interface, no footer attached.
> Sent the same e-mail from the same google account from thunderbird and
> footer appeared.

If you're talking about *sending* from Gmail, it is not stripping the footer, 
because at Gmail's output, the footer is not even there.

With what are you *receiving* the mail after it's been processed by Mlmmj?

In any case, if you are using Mlmmj's built-in footer support this does not 
surprise me in the slightest. It can only really add footers to the simplest of 
mails, i.e. simple text mail without a transfer encoding. I have found that some 
email providers (and I can't remember if Gmail is one of them) send even the mail 
body base64 encoded, which Mlmmj won't work with. There are a number of 
workarounds for this. See this page which I've just updated, as I realised I 
hadn't refreshed the documentation on the website since the new release:

http://mlmmj.org/docs/readme-footers/

Ben




