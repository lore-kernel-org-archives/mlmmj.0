From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Tue, 24 Nov 2015 02:45:54 +0000
Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <20151124024554.GJ20402@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <2814c8bd343523366b23a6289b918a5f@swn.nu>
In-Reply-To: <2814c8bd343523366b23a6289b918a5f@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Nov 23, 2015 at 11:08:19PM +0100, Christian Gleerup wrote:
> Good question,
> there is 'something' at port 25, here is the output

I had a quick look at the code, are you sure you are not overriding the
port in the control/smtpport setting for your list? Also, there's
a "secret" MLMMJ_TESTING environment variable which overrrides the port
to 10025 :-)

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

