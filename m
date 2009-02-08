From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 08 Feb 2009 12:54:12 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <498ED5F4.5010905@goirand.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050301080907060609080608"
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------050301080907060609080608
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Christian Laursen wrote:
> Mads Martin Joergensen wrote:
> 
>> ... and when the webinterface clicks moderate you do the same as if the
>> moderator replied to the mail. Just send a mail to the reply-to address
>> from your webserver. You know how to construct the correct reply-to when
>> you have access to the moderation/ directory.
>>
>> And if you send the mail, then you don't have to do anything else, since
>> that's not needed with mail moderation either.
> 
> I would recommend this approach too. From an administration point of
> view, the only thing neccesary would then be for the web server user to
> have read access to the moderation directory.

There we go! I spent my Sunday afternoon on it, and the result is attached.

Here are some explanations.

* dependencies *

This app needs:
- php with gettext() support (for translations). Nearly all (if not all)
Unix distributions have php with gettext support.
- The Mail_mime PEAR package (php-mail-mime in Debian)

* setup *

- Unpack the tar.gz
- Run "make i18n" to generate the gettext binaries out of the sources
- Edit the 5 variables on top of mlmmj-moderation.php to set the
moderation folder, list name, domain, delimiter and the address used to
send the moderation validation messages. You will need gettext installed
on your system...
- Eventually rename mlmmj-moderation.php and edit mlmmj.css to your taste
- Add a .htaccess / .htpasswd to protect the moderation folder from others
- make it so this app have read/write access to the moderation folder.
Write access is needed because the app does some unlink() calls to
delete the messages.
- If using debian, you might need to dpkg-reconfigure locales and add
fr_FR.UTF-8, if you want to see my French translation (there might be
some other distributions needing the same kind of thing, I don't know...).

* known issues *

- Because this web app is sending an email to validate messages to be
moderated, once you have hit "validate", validated messages will still
(most of the times) show in the interface, as the folder is (most of the
times) read before MLMMJ has time to send the moderated messages and
remove them from the moderation folder.

A workaround would be to NOT display messages that are moderated on the
URL bar, but it's not a good way to go, as if the server is very busy,
the next refresh of the page (the one after the validation) can still
show some messages already validated. We see here that the method to
send emails doesn't seem to be very good... Would it be possible for me
to rename the moderated messages???

- Because it's the first version, I have not yet used POST, but some GET
in order to see things on the URL bar. So, of course, we are here
hitting the limitation of the URL size (if there are really a lot of
messages to moderate). This can be changed later simply by adding
method="POST" in the form, as I use $_REQUEST (and not the stupid $_POST
/ $_GET that everybody uses...). I might do this on the next version,
but for now, it's more easy for debug purposes to keep it this way.

I hope you guys will like my work. Comments and critics are welcome, I'd
be happy to add some improvements.

Regards,

Thomas Goirand

P.S: A nice name for this app would be cool. Ideas?

--------------050301080907060609080608
Content-Type: application/gzip;
 name="mlmmj-moderation-web-interface_0.1.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="mlmmj-moderation-web-interface_0.1.tar.gz"

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
--------------050301080907060609080608--
