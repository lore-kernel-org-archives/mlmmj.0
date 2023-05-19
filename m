From: Baptiste Daroussin <bapt@nours.eu>
Date: Fri, 19 May 2023 05:59:21 +0000
Subject: Re: [mlmmj] Properly disabling "bounce probes"
Message-Id: <D1B75B71-7E99-46E5-A88D-3A09F9E0846F@nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <20230518-bonfire-unreached-ad9b67@meerkat>
In-Reply-To: <20230518-bonfire-unreached-ad9b67@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Le 18 mai 2023 22:36:23 GMT+02:00, Konstantin Ryabitsev <konstantin@linuxfoundation.org> a écrit :
>Hello:
>
>We are moving vger.kernel.org to be mlmmj-managed, but we've hit the problem
>of bounce probe messages confusing or annoying people.
>
>Every now and again, we accept a spam message (despite spamassassin checks and
>everything), which is not accepted by subscribers when we try to deliver it
>and therefore generates a bounce. This results in the "bounce probe" message
>going out, which tends to hit a large enough number of people to cause
>grumbling (e.g. everyone with a gmail account).
>
>I saw the suggestion to make the bounce-probe text unreadable to the mlmmj
>process, but it seems like a hack, and I'm not sure if turning of bounce-probe
>messages means that nobody is ever unsubscribed due to bounces.
>
>Is there a solution that would completely eliminate bounce-probe messages, but
>still properly unsubscribe emails that are bouncing?
>
>Thank you,
>Konstantin
>
>

Hello great news,

On freebsd side when migrating to mlmmj a couple of years ago, I faced the same issue, I patched mlmmj with https://cgit.freebsd.org/ports/plain/mail/mlmmj/files/patch-nobounceprobe for the same reasons,

It gave me time to study why I got so many bounces and once we have fine tuned enough I removed the nobounceprobe.

Happy to help sharing our experience if you need to.

Bapt


