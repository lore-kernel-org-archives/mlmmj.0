From: Sabahattin Gucukoglu <mail@sabahattin-gucukoglu.com>
Date: Sun, 11 Apr 2010 23:32:35 +0000
Subject: Re: [mlmmj] Resent-From + subonlypost
Message-Id: <5F31F96D-E00E-4C45-91B4-56A388638CF7@sabahattin-gucukoglu.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-90-663779156"
List-Id: <mlmmj.mlmmj.org>
References: <D3B4DC71-9D58-4DC3-86F9-C08C14A106BC@sabahattin-gucukoglu.com>
In-Reply-To: <D3B4DC71-9D58-4DC3-86F9-C08C14A106BC@sabahattin-gucukoglu.com>
To: mlmmj@mlmmj.org


--Apple-Mail-90-663779156
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 10 Apr 2010, at 20:34, Morten Shearman Kirkegaard wrote:
> On Thu, 2010-04-08 at 00:07 +0100, Sabahattin Gucukoglu wrote:
>> Sometimes I "Redirect" (RFC 5322 Resent-* fields) directly to my =
list.=20
>> The From: header thus is the original From:.  You might guess the
>> problem: I'll redirect, then because subonlypost is set, a bounce =
will
>> confuse the original sender.
>>=20
>> Please can mlmmj support the Resent-=46rom for the checks requiring a
>> check against the original sender prior to the From: field?
>=20
> No.
>=20
> Quoting RFC 5322:
>=20
> Resent fields are strictly informational.  They MUST NOT be used in =
the
> normal processing of replies or other such automatic actions on
> messages.

That's right.  So how does this prevent using Resent-=46rom before From? =
 (Remember, you don't ever use those fields for any kind of non-delivery =
notifications, only the return address, envelope sender.)

> BTW: would it be possible to implement nomail subscription
>> automatically using a response to an initial post?
>=20
> Could you rephrase that?

The idea is, sometimes someone wants to reply-all, including to a list, =
when they get into a thread someone quotes a list on.  Given the chance =
they may not want to subscribe but would, one time, reply to a message =
asking them if they want to post (like Dan's qsecretary).  When they =
reply, they get subscribed nomail, and the original post goes through.  =
So it's a bit like TMDA in front of a list, only much faster and more =
useful. :-)

Cheers,
Sabahattin


--Apple-Mail-90-663779156
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
AKCCAa8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTAwNDExMjMz
MjM1WjAjBgkqhkiG9w0BCQQxFgQUdIDbt4pqwSXgHQUOPD4bEb1rseMwgaUGCSsGAQQBgjcQBDGB
lzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNl
Y3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNz
IDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMBAZAwgacGCyqGSIb3DQEJEAILMYGX
oIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2Vj
dXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3Mg
MSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwEBkDANBgkqhkiG9w0BAQEFAASCAQB5
acP9PDkunPSBaKMVAhFriNiWpCEDwU1SYOe/gJfQbxglhI5uKwY402fpX+yLZb5G15JbhdqTcGj7
e3Eh2+2VoFkPKSwVmB5mLRpxFx1zHxXeLh26UzKGOoqrBdG1k3a4S3uT9VSStxHJgZccnhJf5DEm
HVuTfU+qEc/Z4BZQ4EYIefIFCAt5gqsptIDYI094TIXDpFbSgEVmZLwddBYf9MVhUphxIH1p/vdE
50hUhw6CACmBURHxJOlMnDdmiXuTqeM0MjFHuBbxjkPf9u76dMwdf3tOm/3+dYw6KomPSemRtjcO
MFbyqZIVqoMIBw9ebWaRiW4DT5FvieI7duriAAAAAAAA

--Apple-Mail-90-663779156--

