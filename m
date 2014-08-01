From: philipp@4-mail.net
Date: Fri, 01 Aug 2014 19:35:04 +0000
Subject: [mlmmj] issue with umlauts in message body
Message-Id: <53DBEBE8.7000903@4-mail.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

hey there.
i decided to setup an openbsd 5.5 instance running opensmtpd and the 
most recent, packaged version of mlmmj thats available in
openbsd's package system (i.e. version 1.2.18.0).
i was pretty surprised how easy it was to setup a mailing list with 
mlmmj, so kudos to everyone who made this possible.
after some testing i discovered that when i send emails to my list 
(let's call it <list>) containing umlauts, all list members seem to receive
some kind of mangled version of the original mail. looking at the 
message in <list>/archive/<number>, i get:
--[...]--
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

äöü
--
with the umlauts correctly displayed by the terminal. (hexdump: c3 a4 c3 
b6 c3 bc)

if i however look at the message as it was received by the list members 
on their respective clients, i get:
--[...]--

Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Kolab-Scheduling-Message: FALSE

C$C6C<
--

i'm not quite sure what causes those umlauts to not get send properly.
is this an issue with my system's setup? is opensmtpd to blame or rather mlmmj-send?

kind regards,
philipp



