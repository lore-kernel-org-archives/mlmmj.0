From: "Joaquin ALMAGRO" <jan@ffhockey.org>
Date: Sun, 03 Sep 2006 10:30:03 +0000
Subject: Accents and diacritics in mail headers
Message-Id: <CGEOKDHOKECBNBHBENCHIEDDCFAA.jan@ffhockey.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

It is difficult to persuade French people to avoid accents or diacritics in the mail's headers.
But RFC 2822 rule is clear.    

[snip-begin {W3C World Wide Web Consortium}]
-----------
"RFC 2822 specifies rules for forming Internet messages. It does not allow the use of characters with codes above 127 to be used directly (non-encoded) in mail headers (it also prohibits NUL and bare CR)"
-----------
[snip-end]

International "text" translations must AVOID the use of "national" characters in headers (Christophe ?).
Risk : banned mail with BAD HEADER error code.

Perhaps a built-in procedure to remove all diacritics in header texts (Morten)?

  .^.
  /V\
/(   )\
 ^^-^^
 

