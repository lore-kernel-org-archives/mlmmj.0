From: Gavin Henry <ghenry@suretec.co.uk>
Date: Tue, 17 May 2016 07:57:10 +0000
Subject: Re: [mlmmj] Adding customheaders & footer to mlmmj list-control mails message
Message-Id: <CAPcb_GKMaJ9Lmz+hQSZZq=EHHy+RSxpaPYgbBAEf8UzSsvftgQ@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20160504T203222-118504689Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> So the plan is to improve this, but for now, the mechanisms I mentioned
>> above are the way to go.
> Ok, as a fast start to getting everybody to a better state, here's a
> rough patch to add to all of the listtext files.
> --- ./listtexts/en/confirm 2012-11-30 17:34:26.000000000 +0000
> +++ ./listtexts/en/confirm      2016-05-17 01:29:20.000000000 +0000
> @@ -1,5 +1,16 @@
>  %ifaction sub%Subject: Confirm subscription to $list$@$domain$%endif%
>  %ifaction unsub%Subject: Confirm unsubscribe from $list$@$domain$%endif%
> +Precedence: bulk
> +List-Post: <mailto:$listaddr$>
> +List-Help: <mailto:$list+$help@$domain$>
> +List-FAQ: <mailto:$list+$faq@$domain$>
> +List-Owner: <mailto:$list+$owner@$domain$>
> +%iftype normal%List-Subscribe: <mailto:$list+$subscribe@$domain$>%endif%
> +%iftype normal%List-Unsubscribe: <mailto:$list+$unsubscribe@$domain$>%endif%
> +%iftype digest%List-Subscribe: <mailto:$list+$subscribe-digest@$domain$>%endif%
> +%iftype digest%List-Unsubscribe: <mailto:$list+$unsubscribe-digest@$domain$>%endif%
> +%iftype nomail%List-Subscribe: <mailto:$list+$subscribe-nomail@$domain$>%endif%
> +%iftype nomail%List-Unsubscribe: <mailto:$list+$unsubscribe-nomail@$domain$>%endif%
>
>  %text prologue%

We use the following in customheaders. Let me know if it's wrong, as
it's been collected over a while:

X-Mailinglist: surevoip-service-status
precedence: bulk
precedence: list
List-Id: <surevoip-service-status@lists.suretec.net>
List-FAQ: <surevoip-service-status+faq@lists.suretec.net>
List-Help: <surevoip-service-status+help@lists.suretec.net>
List-Post: <mailto:surevoip-service-status@lists.suretec.net>
List-Owner: <surevoip-service-status+owner@lists.suretec.net>
List-Archive: <https://lists.suretec.net/archives/surevoip-service-status>
List-Subscribe:
<mailto:surevoip-service-status+subscribe@lists.suretec.net>,
<https://lists.suretec.net/?list=surevoip-service-status>
List-Unsubscribe:
<mailto:surevoip-service-status+unsubscribe@lists.suretec.net>,
<https://lists.suretec.net/?list=surevoip-service-status>


-- 
Kind Regards,
Gavin Henry.

