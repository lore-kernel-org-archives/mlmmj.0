From: Sabahattin Gucukoglu <mail@sabahattin-gucukoglu.com>
Date: Wed, 14 Apr 2010 19:28:02 +0000
Subject: Re: [mlmmj] More Nits
Message-Id: <1F93CDAB-BE68-4B58-A125-7411203C109A@sabahattin-gucukoglu.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-4-908306826"
List-Id: <mlmmj.mlmmj.org>
References: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
In-Reply-To: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
To: mlmmj@mlmmj.org


--Apple-Mail-4-908306826
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 13 Apr 2010, at 06:20, Morten Shearman Kirkegaard wrote:
On Sun, 2010-04-11 at 23:58 +0100, Sabahattin Gucukoglu wrote:
>> On Wed, 2010-04-07 at 05:39 +0100, Sabahattin Gucukoglu wrote:
>>>> Delimiter, if set to '-', causes problems when list names have '-' =
in
>>>> them.  Since this isn't the behaviour of for instance ezmlm, it'd =
be
>>>> nice if this could be fixed somehow.
>>=20
>> If I try to send mail to list "me-mates" when delimiter is '-',
>> there'll be a message in syslog that tells me that "mates" isn't a
>> valid command. :-)
>=20
> Which mail server are you using, and how do you invoke mlmmj?

XMail.  Mlmmj is invoked from a script that sets $SENDER, $RECIPIENT and =
$EXT.  Yes, $EXT is set wrong (to "mates").  I didn't realise mlmmj uses =
the environment, only Return-Path and Delivered-To - for the docs.

> I think the solution is to scan from the right, so that the list can
>> contain the delimiter character.
>=20
> No, then listname-bounce-user=3Dexample.org@example.net would be
> interpreted as the list "listname-bounce" with the command
> "user=3Dexample.org".

Just tried with ezmlm, indeed DJB worked around this by fixing the =
fields to three and using dots to separate everything else, EG return.*, =
sc.*, get.*.

> Having the delimiter in the name is quite ugly, and requires help from
> the mail server; It must set the environment variable EXTENSION,
> LOCAL_PART_SUFFIX or DEFAULT, or invoke mlmmj-recieve [sic] with the =
-e
> option.

Nit: mlmmj-recieve.1 must mention -e.  Gave up and now use '+' like =
everybody else.

BTW: Will there ever be a transition period to mlmmj-receive?  Yes, I =
know. :-)

Cheers,
Sabahattin


--Apple-Mail-4-908306826
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIGsjCCBq4w
ggWWoAMCAQICAwEBkDANBgkqhkiG9w0BAQUFADCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0
YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcx
ODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENB
MB4XDTEwMDIxNDE5MTgwM1oXDTExMDIxNjA5MTA1N1owgZsxIDAeBgNVBA0TFzE0Nzg0Ni1TclB0
b1dHUVJMYTExRVREMR4wHAYDVQQKExVQZXJzb25hIE5vdCBWYWxpZGF0ZWQxKTAnBgNVBAMTIFN0
YXJ0Q29tIEZyZWUgQ2VydGlmaWNhdGUgTWVtYmVyMSwwKgYJKoZIhvcNAQkBFh1tYWlsQHNhYmFo
YXR0aW4tZ3VjdWtvZ2x1LmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALSmrng+
PdhwKkjj3VZZLbF5aiVOUe7Cbui+Z5/BntaojcZYaVk5BKMcKh8aW4InSLZ5Da698zFHUFFbBgSv
PI8tTFwBM5Uq5eSlrs6pGsvGuYyAOMCeN2VvWZbcbFy5RKSUT9V9eRKu3/vDTXzquYuTaWaSDLrQ
cNQXjHNcmSKI5VDIOk/oYCDHvsQDBRG5R85HKe74zYZbgFPsasRPfloDSjWAfldkSPqVBvShefhl
tT5uvgCWf616cBFoqHtZe9/NUX3pLBiXdU9lQ4zN2dE7Ml6+3AobHLB/RSCxBWtb8YDln4X1JjZE
0swEDvyD0GEskAcyA2/bnRjvV9HOcY8CAwEAAaOCAwYwggMCMAkGA1UdEwQCMAAwCwYDVR0PBAQD
AgSwMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQU9rx1cJmSaz5fmKyy
///im4m/gOIwHwYDVR0jBBgwFoAUU3Ltkpzg2ssBXHx+ljVO8tS4UYIwKAYDVR0RBCEwH4EdbWFp
bEBzYWJhaGF0dGluLWd1Y3Vrb2dsdS5jb20wggFCBgNVHSAEggE5MIIBNTCCATEGCysGAQQBgbU3
AQIBMIIBIDAuBggrBgEFBQcCARYiaHR0cDovL3d3dy5zdGFydHNzbC5jb20vcG9saWN5LnBkZjA0
BggrBgEFBQcCARYoaHR0cDovL3d3dy5zdGFydHNzbC5jb20vaW50ZXJtZWRpYXRlLnBkZjCBtwYI
KwYBBQUHAgIwgaowFBYNU3RhcnRDb20gTHRkLjADAgEBGoGRTGltaXRlZCBMaWFiaWxpdHksIHNl
ZSBzZWN0aW9uICpMZWdhbCBMaW1pdGF0aW9ucyogb2YgdGhlIFN0YXJ0Q29tIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5IFBvbGljeSBhdmFpbGFibGUgYXQgaHR0cDovL3d3dy5zdGFydHNzbC5jb20v
cG9saWN5LnBkZjBjBgNVHR8EXDBaMCugKaAnhiVodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9jcnR1
MS1jcmwuY3JsMCugKaAnhiVodHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9jcnR1MS1jcmwuY3JsMIGO
BggrBgEFBQcBAQSBgTB/MDkGCCsGAQUFBzABhi1odHRwOi8vb2NzcC5zdGFydHNzbC5jb20vc3Vi
L2NsYXNzMS9jbGllbnQvY2EwQgYIKwYBBQUHMAKGNmh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL2Nl
cnRzL3N1Yi5jbGFzczEuY2xpZW50LmNhLmNydDAjBgNVHRIEHDAahhhodHRwOi8vd3d3LnN0YXJ0
c3NsLmNvbS8wDQYJKoZIhvcNAQEFBQADggEBABfpkTQK6G6ZAdRpaGvgcQmxjQ1odHcV2LwyCQWv
ZwksY68aN7YhG2Y3qAhixQFGPWmoJu9R1Tfl80RCzXzFPERkAvl62b0RSJeZa40q9E0EHc8wYcsQ
ak5KVDxbknfQzIknnL3ZLsc33Ropca7FzudPXYO72tXF0oz+QQvUMS7qRpTJb/jLQ4LTsGM1muSg
IICcR1dDxf6nCKm0Gu4sS6RmrvDJ/UmCo/3Xz/LBV9TQ7n/j0+aiulOBZ6Rh6utDCWNb9XLZD40l
0xJ09mimXKmVoc5c+MzMkUJX4LWDoFOJmD8ON208++Of8hDF8lSY39HYubSgpkTqJnWcicylg1Ux
ggNvMIIDawIBATCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzAp
BgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0
Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMBAZAwCQYFKw4DAhoF
AKCCAa8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTAwNDE0MTky
ODAzWjAjBgkqhkiG9w0BCQQxFgQU3NgC8hB+2Wmu+np2hw9XGL+3HkowgaUGCSsGAQQBgjcQBDGB
lzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNl
Y3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNz
IDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMBAZAwgacGCyqGSIb3DQEJEAILMYGX
oIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2Vj
dXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3Mg
MSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwEBkDANBgkqhkiG9w0BAQEFAASCAQCN
v+RaGGp9ez0zPbT1hKC+dkz/glMoNZ9pYuQO5KCjMrftB4yWvEak/CadVb9R1/YYCcErhyQF00aB
9x2hFDBivdZuUxYKPG5T6Qkr7FQMOhAUxJMFTqVJVQ1GxgB5i58H++7i+krwhlicVxzcmBIXEWcX
TLwtAYvygkhM+x7meUcMb4sW1cT+SBwQWRK0tx96r88m2/YScCo9dwtyFuvM1nWtx5RqxtUNfoef
8NBF6FwHUzODAmwCH52RBsUnm1kTauWxDtgWNAfULkCRasWAfZDBrdk6HSIaaQQAR/jae4GNfd+b
SPzP8rLKTeqXZ7jboIZ5LXXcrnhO9GlgVuxMAAAAAAAA

--Apple-Mail-4-908306826--

