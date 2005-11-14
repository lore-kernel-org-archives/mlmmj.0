From: Jeremy Hinegardner <jeremy@hinegardner.org>
Date: Mon, 14 Nov 2005 23:58:33 +0000
Subject: Re: recipient delimiter bug with RC1
Message-Id: <20051114235833.GN24098@hinegardner.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sXc4Kmr5FA7axrvy"
List-Id: <mlmmj.mlmmj.org>
References: <20051113034740.GF4414@hinegardner.org>
In-Reply-To: <20051113034740.GF4414@hinegardner.org>
To: mlmmj@mlmmj.org


--sXc4Kmr5FA7axrvy
Content-Type: multipart/mixed; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2005 at 08:21:41AM -0700, Neale Pickett wrote:
> PS: Jeremy, how did you set up your postfix's aliases table to deal with =
the=20
> list name with the - in it?  I had to create two entries: "pajarito" and=
=20
> "pajarito-riders" that both pipe to mlmmj-recieve with the same directory.

Yes, this was an issue.  My testing of the mlmmj-test list with
recipient delimiter of '-' is what brought this whole issue about.  And
it seems to be an issue with Postfix and the local(8) delivery agent.

Using virtual as:
    /^(mlmmj-test.*)@example.com$/      $1

And aliases as:
   mlmmj-test:  "| /usr/local/mlmmj-recieve -L ...."=20

For some reason local(8) wouldn't do the right thing.  It would be
looking for a user 'mlmmj-test-subscribe' or 'mlmmj' so the alias
wouldn't resolve.  And a status=3Dbounced (unknown user:
"mlmmj-test-subscribe") would result.

So next I tried virtual as:
    /^(mlmmj-test).*@example.com$/      $1

And in this case, it would deliver to mlmmj-recieve but mlmmj-recieve
wouldn't know what the command was since trivial-rewrite hand changed
the delivery address.

Joel pointed out that this is handled correctly in Exim, so it
apparently does a more exhaustive search of the possibilities to find
out if it can find something to deliver too.  Maybe this is a cause to
submit a bug report to Postfix?

In any case, I wanted to have a single 'mailing list user' manage all
the mailing lists for my domain, which ended up being at odds with
local(8)'s delivery.  As a result I'm using a postfix transport map to
delivery mail to the 'mlmmj' user.  I wrote up a README me on it and
I've attached it.

enjoy,

-jeremy

--
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Jeremy Hinegardner                              jeremy@hinegardner.org=20


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="README.postfix"
Content-Transfer-Encoding: quoted-printable

README.postfix                                                   Nov 12th 2=
005

POSTFIX ISSUES
  =20
    The main issue with Postfix and mlmmj is the mlmmj requirement that
    the mlmmj executables must be executed by root or the owner of the
    list directory. =20

    This is at odds with Postfix.  The standard local delivery mechanism
    for Postfix is local(8) that ships with Postfix.  According to
    local(8) delivery to external programs is done on behalf of the
    receiving user.  But when delivering to a program without using a
    .forward file there is no user context.  And using an alias file
    does not provide user context.

    The man page also explains that in the absence of user context the
    local(8) daemon will use the owner of the :include: file from the
    aliases file.  But this is a problem too.  By default :include:
    files are disabled as a security precaution in aliases files for
    delivering to external programs.

    This leaves us with a conundrum on how to execute the mlmmj
    executables as an 'mlmmj' user without using alias files.  One
    answer is to use a postfix transport.

    First we'll get the 'mlmmj' user setup and then move onto the
    postfix configuration:

MLMMJ SETUP
   =20
    Create a 'mlmmj' user that will own all the lists.  Use whatever
    user creation app/script is provided by your system.  Generally
    'useradd'.

    Create the spool directory that is owned by the 'mlmmj' user.
    This is typically /var/spool/mlmmj but can be any directory so long
    as it is owned by 'mlmmj'.  It can even be the home directory of the
    'mlmmj' user.  If the spool directory is not /var/spool/mlmmj then
    everywhere in this file replace /var/spool/mlmmj with your spool
    directory.

    Create a mailing list using mlmmj-make-ml.sh.  Make sure to use the
    -s flag to set the spool directory if it isn't /var/spool/mlmmj

POSTFIX SETUP
 =20
    First thing is to make sure that the postfix server accepts mail for
    the mailing lists.  For a server that handles mail for multiple
    domains, this is done with a 'virtual_alias_map'.  This is how I'll
    demonstrate.

    Add a virtual_alias_map file to main.cf configuration.  We'll use a
    regular expression map since we need to be able to match all the
    various mjmml delimiter addresses (list-subscribe, list-unsubscribe,
    etc)

        main.cf:
            virtual_alias_maps =3D hash:/etc/postfix/virtual,=20
                                 regexp:/var/spool/mlmmj/virtual.regexp
          =20
        /var/spool/mlmmj/virtual.regexp:
            /^(mlmmj-test.*)@example.com$/          $1
            /^(another-list.*)@sample.com$/         $1

   =20
    One line needs to be in the virtual map for each list the 'mlmmj' id
    is to handle.  The regex formula is:

        /^(list-name.*)@domain$/                $1

  =20
    Next we make sure that postfix can invoke the mlmmj executables as
    the 'mlmmj' user.  This is where the transport map comes in.  So we
    add a transport map and a configuration option that instructs the
    transport to only deliver one file at a time.  See transport(5) for
    more information on transports.

        main.cf:
            transport_maps =3D regexp:/var/spool/mlmmj/transport=20
            mlmmj_destination_recipient_limit =3D 1
         =20
        /var/spool/mlmmj/transport:
            /^(mlmmj-test).*$/              mlmmj:$1
            /^(another-list).*$/            mlmmj:$1

    What this transport file says, is that any message destined for an
    email address that matches the regexp on the left, deliver it using
    the transport 'mlmmj' and setting 'nexthop' to the value in $1.
    Which in this case is the mailing list name.  'nexthop' is special
    variable for transports.

    Now we setup the 'mlmmj' transport.  The 'mlmmj' in mlmmj:$1 above
    indicates a transport listed in the postfix master.cf file.  We are
    just going to create a transport called 'mlmmj' but it is nothing
    more than a pipe(8) to the mlmmj-recieve program that is invoked as
    the 'mlmmj' user.

        master.cf:
            # mlmmj mailing lists
            mlmmj   unix  -       n       n       -       -       pipe
                flags=3DDORhu user=3Dmlmmj argv=3D/usr/local/bin/mlmmj-reci=
eve -F -L /var/spool/mlmmj/$nexthop/

    This takes the pipe(8) postfix delivery agent and tells it to invoke
    '/usr/local/bin/mlmmj-recieve' as the 'mlmmj' user and pipe the
    email to it on stdin.  This mode of transportation is given the name
    'mlmmj'.

    The 'flags' parameter to pipe(8) is pretty critical here. In
    particular if the 'R' option is not used mlmmj-recieve fails to
    recieve the mail correctly. The options mean:

        D - Prepend a 'Delivered-To: recipient' header
        O - Prepend an 'X-Original-To: recipient' header
        R - Prepend a 'Return-Path:'. header
        h - fold $nexthop to lowercase
        u - fold $recipient to lowercase

    $nexthop gets set to what was on the right had side of the ':' in
    the transport file.  The way we have that configured is that
    $nexthop will get set to the name of the mailing list.

    Restart postfix and enjoy your new lists.


--t0UkRYy7tHLRMCai--

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (OpenBSD)

iD8DBQFDeSSpbWdxTh8E8XERAgQcAJ4pCjhIOp/v9eKxNCRe44fIy7JZ7QCcDiJi
AWNR+lepWfedO3nTBgL3xRQ=
=rSlq
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
