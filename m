From: Christopher Mahmood <ckm@loafer.org>
Date: Thu, 19 Aug 2004 19:03:16 +0000
Subject: Re: Checking envelope From for recipient delimiter
Message-Id: <20040819190316.GB27547@oogabooga.loafer.org>
List-Id: <mlmmj.mlmmj.org>
References: <20040819121309.GK70901@panther.mmj.dk>
In-Reply-To: <20040819121309.GK70901@panther.mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen (mmj@mmj.dk) [040819 05:13]:
> They bounced to listname+bounces-... in envelope From but had a
> different address in To:. Since they've configured the list to not
> require the listaddress in the To: or Cc: header, the bounce ended up on
> the list.

I think bouncing to header addresses is normal behavior for Lotus
although it is configurable.

ezmlm just silently drops any mail with a null sender.

-- 

-ckm
