From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 14 May 2010 01:18:05 +0000
Subject: Re: [mlmmj] deletion of From-header
Message-Id: <4BECA4CD.6050201@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20100513192626.4a9759e8@telenet.be>
In-Reply-To: <20100513192626.4a9759e8@telenet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

The "From " header isn't truly a header. It is, however, how the
envelope sender is often communicated to mlmmj by the MTA. A line of the
form "From emailaddress@domain.tld" is prepended to the mail, the same
as in mbox files. It needs to be removed precisely because it is not
truly a header. To be honest, it would perhaps be better to simply
swallow the first line of input if it had that form, but doing it the
current way works, too; no valid header will have that form, so we won't
remove too much, and by ensuring we do remove it, we don't remove too
little (which would result in invalid mails and much nastiness).

Cheers,

Ben.



On 14/05/10 3:26 AM, Franky Van Liedekerke wrote:
> Hi,
>
> in the source code there's a line:
>
> delheaders->strs[delheaders->count++] = mystrdup("From ");
>
> effectively deleting a header called "From " in a mail, but this never
> happens in reality (maybe it does with feeded mails via a program); the
> header is always "From:".
>
> For now this always forced me to add "From:" to the delheaders section,
> but maybe this can be changed? Maybe just by removing it from the code
> entirely (so people can choose wether or not to remove the
> "From:"-information) ?
>
> Just a thought ...
>
> Franky





