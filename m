From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Date: Thu, 20 Jun 2019 22:15:35 +0000
Subject: [mlmmj] Auto-Reply / Auto-Response?
Message-Id: <20190620221535.GO2500@otheros>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

We have an unmoderated mlmmj mailing list here where anyone can
write to. And would like to send an automatic reply to anyone
sending an email to it (something like a "a response can take some
time, please stand-by" text).

So far we tried just creating a file in $listdir/text/ with
"finish-post", "finish-post-request" and
"wait-post-modnonsubposts" but those do not seem to work.

Does an auto-reply feature exist with mlmmj? Ideally the
non-subscribed sender would also only get an auto-reply for the
first message in a newly created mail thread (so basically for any
message without an "In-Reply-To" field).

Regards, Linus

