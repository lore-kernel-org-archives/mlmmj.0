From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 12 Jun 2007 23:13:58 +0000
Subject: Re: mlmmj-1.2.14-cvs20070610
Message-Id: <591c41d187d13f3dc4ab2dcdc9f8e094@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <7f91e82268803dab7b16033f919a959c@mail.n0rd.dk>
In-Reply-To: <7f91e82268803dab7b16033f919a959c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


Hi Ansgar,

Ansgar Burchardt <ansgar@2007.43-1.org> wrote:
>>> Maybe there should be a configure option (e.g. --enable-recievestrip)
>>> to build and install recievestrip?
>>
>> That would be very nice. I am no autotools guru. Could you add such
>> an option?
> 
> I can take a look at it, but I probably won't have time to do so before
> the weekend.

Ok, I'll hold RC1 for it.

By the way....

(I haven't committed it yet, but here is a teaser)

mortenp@marvin:~/mlmmj/src$ cat ~/mlmmj-test/text/test
Subject: Spa\u00DF $listaddr$ \u00E6ble

Spa\u00DF mit merkw\u00FCrdigen Buchstaben

mortenp@marvin:~/mlmmj/src$ ./test-prepstdreply
From: mlmmj-test+owner@afdelingp.dk
To: to@afdelingp.dk
Message-ID: <1181689873-32257-mlmmj-52ed680b@afdelingp.dk>
Date: Wed, 13 Jun 2007 01:11:13 +0200
Subject: =?utf-8?q?Spaß_mlmmj-test@afdelingp.dk_æble?Content-Type: text/plain; charset=utf-8
Content-Encoding: 8bit

SpaÃ mit merkwÃ¼rdigen Buchstaben


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

