From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Tue, 24 Apr 2007 09:11:22 +0000
Subject: Re: maxmailsize text missing
Message-Id: <2748.130.83.185.211.1177405882.squirrel@130.83.185.211>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_20070424111122_20497"
List-Id: <mlmmj.mlmmj.org>
References: <20070424083515.GD16509@suse.de>
In-Reply-To: <20070424083515.GD16509@suse.de>
To: mlmmj@mlmmj.org

------=_20070424111122_20497
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hej,

On Tue, April 24, 2007 10:35, Henne Vogelsang wrote:
> Hey,
>
> the text for the maxmailsize deny mail is missing in text.skel.
> Please add it for the next release.

Have a look at the attached patch.
It includes the english text and a little modification
in the correponding Makefile.in, so the existing maxmailsize
file(s) will be installed in the text.skel directory.

>
> Henne

Ciao
Chris

ps. Please confirm, my changes in the Makefile.in are
correct. I only did a dry run with it...

>
> --
> Henne Vogelsang, Teamlead Core Services
> http://www.opensuse.org
>

------=_20070424111122_20497
Content-Type: application/octet-stream;
      name="mlmmj-1.2.14-maxmailsize-text.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
      filename="mlmmj-1.2.14-maxmailsize-text.diff"

ZGlmZiAtTnJ1IG1sbW1qLTEuMi4xNC5vcmlnL2xpc3R0ZXh0cy9NYWtlZmlsZS5pbiBtbG1tai0x
LjIuMTQvbGlzdHRleHRzL01ha2VmaWxlLmluCi0tLSBtbG1tai0xLjIuMTQub3JpZy9saXN0dGV4
dHMvTWFrZWZpbGUuaW4JMjAwNy0wNC0wMyAxMjozOTozNy4wMDAwMDAwMDAgKzAyMDAKKysrIG1s
bW1qLTEuMi4xNC9saXN0dGV4dHMvTWFrZWZpbGUuaW4JMjAwNy0wNC0yNCAxMDo1MTozNy4wMDAw
MDAwMDAgKzAyMDAKQEAgLTEwNSw3ICsxMDUsOCBAQAogdGFyZ2V0X2FsaWFzID0gQHRhcmdldF9h
bGlhc0AKIHRleHRsaWJkaXIgPSBAdGV4dGxpYmRpckAKIAotZGlzdF90ZXh0bGliX0RBVEEgPSBh
Y2Nlc3MgYm91bmNlLXByb2JlIGxpc3RoZWxwIGxpc3RmYXEgbW9kZXJhdGlvbiBub3RpZnlzdWIg
XAorZGlzdF90ZXh0bGliX0RBVEEgPSBhY2Nlc3MgYm91bmNlLXByb2JlIGxpc3RoZWxwIGxpc3Rm
YXEgbWF4bWFpbHNpemUgXAorCW1vZGVyYXRpb24gbm90aWZ5c3ViIFwKIAlub3RpZnlzdWItZGln
ZXN0IG5vdGlmeXN1Yi1ub21haWwgbm90aWZ5dW5zdWIgbm90aWZ5dW5zdWItZGlnZXN0IFwKIAlu
b3RpZnl1bnN1Yi1ub21haWwgbm90aW50b2NjIHN1Yi1jb25maXJtIHN1Yi1jb25maXJtLWRpZ2Vz
dCBcCiAJc3ViLWNvbmZpcm0tbm9tYWlsIHN1Yi1kZW55LWRpZ2VzdCBzdWItZGVueS1ub21haWwg
c3ViLW9rIFwKZGlmZiAtTnJ1IG1sbW1qLTEuMi4xNC5vcmlnL2xpc3R0ZXh0cy9tYXhtYWlsc2l6
ZSBtbG1tai0xLjIuMTQvbGlzdHRleHRzL21heG1haWxzaXplCi0tLSBtbG1tai0xLjIuMTQub3Jp
Zy9saXN0dGV4dHMvbWF4bWFpbHNpemUJMTk3MC0wMS0wMSAwMTowMDowMC4wMDAwMDAwMDAgKzAx
MDAKKysrIG1sbW1qLTEuMi4xNC9saXN0dGV4dHMvbWF4bWFpbHNpemUJMjAwNy0wNC0yNCAxMDo0
NTo1Ny4wMDAwMDAwMDAgKzAyMDAKQEAgLTAsMCArMSwxMCBAQAorU3ViamVjdDogUG9zdCB0byAk
bGlzdGFkZHIkIGRlbmllZCBkdWUgdG8gc2l6ZSBsaW1pdAorCitIaSwgdGhpcyBpcyB0aGUgbWxt
bWogcHJvZ3JhbSBtYW5hZ2luZyB0aGUgbWFpbGluZ2xpc3QKKworJGxpc3RhZGRyJAorCitJJ20g
c29ycnkgdG8gaW5mb3JtIHlvdSB0aGF0IHlvdXIgbWVzc2FnZSBjb3VsZCBub3QgYmUgZGVsaXZl
cmVkIHRvIHRoZQorbGlzdC4gWW91ciBtYWlsIHdhcyByZWplY3RlZCBkdWUgdG8gdGhlIHNpemUg
bGltaXQgb2YgJG1heG1haWxzaXplJC4KKworVGhhbmtzLgo=
------=_20070424111122_20497--

