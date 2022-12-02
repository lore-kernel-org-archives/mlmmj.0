From: Baptiste Daroussin <bapt@nours.eu>
Date: Fri, 02 Dec 2022 16:51:21 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <20221202165121.yyzxlsevyzfl4xin@aniel.nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Fri, Dec 02, 2022 at 05:45:48PM +0100, Franky Van Liedekerke wrote:
> Hi,
>=20
> while you want to remove the php-part, I've updated it (made it work
> with php 8), improved it (added some minor features to it, as view the
> log and config the text-files and allow split-user management of
> subscribers and config).
> If you're willing to keep including the php-part, I'm willing to upload
> my changes :-)=A0While I'm at it: I also did some stuff concerning a
> html-archive (no bling-bling, but it works). And I also did some work
> on the mlmmj script to create a new mailing list.
> Concerning the munge-from: some mailing lists are created so that the
> original poster's info is not visibile by default. While I do
> understand it changes possible signatures, so does the existing
> "footer" option (which is not very usefull anyway, since it doesn't
> work for html-mails, which most people tend to send nowadays).
>=20
> Franky
>=20

What about have the php thing live outside of the project? like
https://codeberg.org/mlmmj/mlmmj-web or something like that?

I created an organisation juste to allow contribution to live along
and delegate commit access to people who actually know what they are
doing with this code?

I plan to add myself: https://codeberg.org/bapt/mlmmj-webview
and https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.md (which
is used to generate https://lists.freebsd.org/archives )

But I would prefer to see the code separated.

Would it fit with your proposal?

Best regards,
Bapt

