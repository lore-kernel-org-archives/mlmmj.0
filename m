From: Barco van Rhijn <barco@atservice.co.za>
Date: Thu, 26 Jan 2017 15:16:10 +0000
Subject: Re: [mlmmj] Configuring Exim
Message-Id: <18f06889-10da-ef60-fc37-2f26a959dbde@atservice.co.za>
List-Id: <mlmmj.mlmmj.org>
References: <f147daff-67ff-3421-ebf3-8b844ba44fbe@atservice.co.za>
In-Reply-To: <f147daff-67ff-3421-ebf3-8b844ba44fbe@atservice.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

So I retraced my steps. Found out I used the wrong domain in the 
exim.conf file.

The documentation specifies using "list.yourdomain.com" in the exim config.
So I figured there's a no why documentation is specifies a list 
subdomain. Turns out it was just there as a suggestion.

Unless I setup my list email account at mlmmj-test@list.yourdomain.com 
it would not have gone through.

I setup a root domain i.e. yourdomain.com -- so using 
mlmmj-test@yourdomain.com as my list address matches the domain and mail 
gets passed.

Obvious once I saw it.  Changing this has resolved this issue.

Warm Regards
Barco van Rhijn


