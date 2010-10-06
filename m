From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 06 Oct 2010 22:29:17 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <4CACF83D.2030502@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

> I subscribed from a PHP script using mlmmj-sub.

Great to know.

> The input comes from a textarea, where multiple mails are delimeted by
> 'line changes' (whatever the browser uses. seems like '\r\n')

It should be, at least if standards are followed. HTML4 defines the
linebreak representation for form submission as CRLF. It's the most
sensible thing to use, because it means a bunch of translation doesn't
have to go on between HTTP's linebreak representation.

I fixed basically the same problem in php-admin recently:

http://mlmmj.org/hg/mlmmj/rev/b37f66e0852b

It was writing to control files, though, not calling programs, and Mlmmj
probably chomps the lines in the control files when it reads them and
masks the problem, unlike the case you found.

> I split into an array on '\n' and send to command line, to be excact:
>
> $addressA =3D explode("\n", $_REQUEST['address']);
> foreach ($addressA as $a) {
>     $a =3D trim($a); // Didn't trim when the bad mail was injected
>    exec("sudo /usr/bin/mlmmj-sub -L /var/spool/mlmmj/nyhedsbrev/ -a {$a}
> -s");
> }

Thank you. Bug filed with this as a test case!

Ben.



> By the way, php describes trim like....
> This function returns a string with whitespace stripped from the
> beginning and end of str. Without the second parameter, trim() will
> strip these characters:
>
>        * " " (ASCII 32 (0x20)), an ordinary space.
>        * "\t" (ASCII 9 (0x09)), a tab.
>        * "\n" (ASCII 10 (0x0A)), a new line (line feed).
>        * "\r" (ASCII 13 (0x0D)), a carriage return.
>        * "\0" (ASCII 0 (0x00)), the NUL-byte.
>        * "\x0B" (ASCII 11 (0x0B)), a vertical tab.
>
>
> ons, 06 10 2010 kl. 18:55 +1100, skrev Ben Schmidt:
>> On 2/10/10 6:27 PM, Mads Martin J=C3=B8rgensen wrote:
>>> On Sat, Oct 2, 2010 at 10:14 AM, Christian Gleerup
>>> <christian.gleerup@swn.nu>   wrote:
>>>> I just checked the file, and it indeed contained a whitespace character
>>>> (\r)
>>>>
>>>> this must have been an error when I made the mass subscribe system,
>>
>> In what way did this interface with Mlmmj? Do you know where the
>> carriage return came from in the first place? Would it have appeared in
>> a commandline argument to mlmmj-sub? Or...?
>>
>>>> I will look out for this, but it would be nice if the system was a
>>>> bit more robust, and automatically removed trailing whitespaces :)
>>>
>>> I believe it does remove trailing whitespaces, but that's not a
>>> whitespace, that's a carriage return.
>>
>> I think that's a whitespace. Non-linear, but still whitespace.
>>
>>> We agree that it should be able to handle it, and be more robust,
>>> since \r is not a valid emailaddress character.
>>
>> Yep. We all agree it would be nice to guard against this!
>>
>> Ben.
>>
>>
>>
>
>
>
>
>


