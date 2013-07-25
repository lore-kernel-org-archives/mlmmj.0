From: Marco S Hyman <marc@snafu.org>
Date: Thu, 25 Jul 2013 17:57:18 +0000
Subject: Re: [mlmmj] Rejecting HTML email
Message-Id: <74D7293E-887A-4687-926D-F5F9CCB81F26@snafu.org>
List-Id: <mlmmj.mlmmj.org>
References: <CAF8XF0eb+proK0922N7s580n=r6L65m=5JYa3x9-wMk1W8Wp=A@mail.gmail.com>
In-Reply-To: <CAF8XF0eb+proK0922N7s580n=r6L65m=5JYa3x9-wMk1W8Wp=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Jul 25, 2013, at 2:44 AM, Kai Hendry <hendry@webconverger.com> wrote:

> Could anyone offer some tips about implementing an HTML free mailing list?

In control/access for the list add

	allow ^Content-Type: text/plain
	moderate

There may be others you want to allow and you may want to change moderate to deny.
Or you may want to specifically deny multipart and text/html

There may be other ways... that's how I've done it.
