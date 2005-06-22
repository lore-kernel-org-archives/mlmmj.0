From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 22 Jun 2005 08:54:08 +0000
Subject: List creation in the perl-admin web interface
Message-Id: <86d5qekc0f.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

There has been some talk about adding list creation functionality to
the web interface.

Most of the work involved in getting it to work consists of making
mlmmj itself support list creation by preconfigured unprivileged
users.

It will probably require mlmmj-make-ml to be a suid root binary,
preferably only installed suid root if enabled by an option to the
configure script or similar.

Since the unprivileged user can't do any postprocessing on the created
listdir there will have to be some support for running a custom script
to do that. The custom script should also take care of adding an alias
to the mail configuration.

All this would probably be configured in a global configuration file
as the unprivileged user should be trusted as little as possible.

With this in place it should be a walk in the park to add the
functionality to the web interface.

-- 
Christian Laursen
