From: Franky Van Liedekerke <liedekef@telenet.be>
Date: Sat, 20 May 2023 15:11:46 +0000
Subject: Re: [mlmmj] mlmmj error: "Have to invoke either as root or as the user owning listdir"
Message-Id: <c0d42cdc-2383-7465-d335-bb6a67b7f7f4@telenet.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------Jd0owj0AOETj0zGf1C9ppgf4"
List-Id: <mlmmj.mlmmj.org>
References: <c6645c9c-82dd-b2e0-22fe-f0f19097e649@orange.fr>
In-Reply-To: <c6645c9c-82dd-b2e0-22fe-f0f19097e649@orange.fr>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------Jd0owj0AOETj0zGf1C9ppgf4
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

For postfix, a small howto:

1) make sure the files/dirs are owned by the user mlmmj, and then in 
/etc/postfix/master.cf, create the transport (here called "mlmmj") to 
run as that specific user mlmmj:

mlmmj   unix  -       n       n       -       -       pipe
   flags=ORhu user=mlmmj argv=/usr/bin/mlmmj-receive -F -L 
/var/spool/mlmmj/${nexthop}

2) After that, in /etc/postfix/virtual, create an alias for your 
mailinglist (here "my.list@mylist-domain") to point to a local delivery:

my.list@mylist-domain mylistalias@localhost.mlmmj

3) And then in /etc/postfix/transport, point that alias to use the 
transport ("myreallistname" is the directory under /var/spool/mlmmj for 
your list, it is used as $nexthop in the mlmmj-transport definition above ):

mylistalias@localhost.mlmmj   mlmmj:myreallistname

4) Don't forget to run 'postmap' on the files /etc/postfix/virtual and 
/etc/postfix/transport and make sure your postfix uses them in 
/etc/postfix/main.cf, together with your list domain:

virtual_mailbox_domains = mylist-domain
virtual_alias_maps = hash:/etc/postfix/virtual
transport_maps = hash:/etc/postfix/transport

5) postfix reload and off you go :-)


Franky

On 5/20/23 15:54, Eric J.P.E. Davanture wrote:
>
> Greetings,
>
> I just installed mlmmj on SuSE Linux Enterprise Server 15 SP4 running 
> a mail server thanks to postfix and dovecot.
>
> I can create a mailing list and subscribe my e-mail with mlmmj-sub 
> without any problem.
>
> When I get the e-mail from mlmmj, I send the answer accepting the 
> subscription but get a new e-mail in return from mlmmj sying:
>
> _Subject: Undelivered Mail Returned to Sender _
>
> This is the mail system at host <MY_SERVER>.
>
> I'm sorry to have to inform you that your message could not
> be delivered to one or more recipients. It's attached below.
>
> For further assistance, please send mail to postmaster.
>
> If you do so, please include this problem report. You can
> delete your own text from the attached returned message.
>
>                     The mail system
>
> <mlmmj_list_1_dav+confsub-55f8b4567a40e8c8-eric.davanture=orange.fr@MY_DOMAIN.com>:
>      Command died with status 1: "/usr/bin/mlmmj-receive -L
>      /var/vmail/mlmmj/mlmmj_list_1_DAV/". Command output: Have to invoke either
>      as root or as the user owning listdir
> I am blocked here and can't reach finding what the problem could be.
> Any help will be greatly appreciated.
> Thanks a lot by now.
>
> -- 
> Librement vôtre / Libremente suyo / Freely yours,
> *Eric J.P.E. Davanture - eric.davanture@orange.fr
> *
> _Approximate location:_ Planet Earth < Solar System < Milky Way Galaxy 
> < Local Group < Virgo Cluster < Laniakea Supercluster < known Universe 
> (https://youtu.be/P6cw5Yv-zqU)
> *There is NO CLOUD, just other people's computers !*
--------------Jd0owj0AOETj0zGf1C9ppgf4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>For postfix, a small howto:<br>
    </p>
    <p>1) make sure the files/dirs are owned by the user mlmmj, and then
      in /etc/postfix/master.cf, create the transport (here called
      "mlmmj") to run as that specific user mlmmj:</p>
    <p>mlmmj   unix  -       n       n       -       -       pipe<br>
        flags=ORhu user=mlmmj argv=/usr/bin/mlmmj-receive -F -L
      /var/spool/mlmmj/${nexthop}<br>
    </p>
    <p>2) After that, in /etc/postfix/virtual, create an alias for your
      mailinglist (here "my.list@mylist-domain") to point to a local
      delivery:</p>
    <p>my.list@mylist-domain    <a class="moz-txt-link-abbreviated" href="mailto:mylistalias@localhost.mlmmj">mylistalias@localhost.mlmmj</a><br>
    </p>
    <p>3) And then in /etc/postfix/transport, point that alias to use
      the transport ("myreallistname" is the directory under
      /var/spool/mlmmj for your list, it is used as $nexthop in the
      mlmmj-transport definition above ):</p>
    <p><a class="moz-txt-link-abbreviated" href="mailto:mylistalias@localhost.mlmmj">mylistalias@localhost.mlmmj</a>   mlmmj:myreallistname</p>
    <p>4) Don't forget to run 'postmap' on the files
      /etc/postfix/virtual and /etc/postfix/transport and make sure your
      postfix uses them in /etc/postfix/main.cf, together with your list
      domain:<br>
    </p>
    <p>virtual_mailbox_domains = mylist-domain<br>
      virtual_alias_maps = hash:/etc/postfix/virtual<br>
      transport_maps = hash:/etc/postfix/transport<br>
    </p>
    <p>5) postfix reload and off you go :-)</p>
    <p><br>
    </p>
    <p>Franky<br>
    </p>
    <div class="moz-cite-prefix">On 5/20/23 15:54, Eric J.P.E. Davanture
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c6645c9c-82dd-b2e0-22fe-f0f19097e649@orange.fr">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p>Greetings,</p>
      <p>I just installed mlmmj on SuSE Linux Enterprise Server 15 SP4
        running a mail server thanks to postfix and dovecot.</p>
      <p>I can create a mailing list and subscribe my e-mail with
        mlmmj-sub without any problem.</p>
      <p>When I get the e-mail from mlmmj, I send the answer accepting
        the subscription but get a new e-mail in return from mlmmj
        sying:</p>
      <p><u>Subject: Undelivered Mail Returned to Sender </u><br>
      </p>
      <pre class="moz-quote-pre" wrap="">This is the mail system at host &lt;MY_SERVER&gt;.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

                   The mail system

<a class="moz-txt-link-rfc2396E" href="mailto:mlmmj_list_1_dav+confsub-55f8b89c5a40e8c8-eric.davanture=orange.fr@110250.com" moz-do-not-send="true">&lt;mlmmj_list_1_dav+confsub-55f8b4567a40e8c8-eric.davanture=orange.fr@MY_DOMAIN.com&gt;</a>:
    Command died with status 1: "/usr/bin/mlmmj-receive -L
    <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>var/vmail/mlmmj/mlmmj_list_1_DAV<span class="moz-txt-tag">/</span></i>". Command output: Have to invoke either
    as root or as the user owning listdir</pre>
      <div class="moz-signature">I am blocked here and can't reach
        finding what the problem could be.</div>
      <div class="moz-signature">Any help will be greatly appreciated.</div>
      <div class="moz-signature">Thanks a lot by now.</div>
      <div class="moz-signature"><br>
      </div>
      <div class="moz-signature">-- <br>
        Librement vôtre / Libremente suyo / Freely yours,<br>
        <b>Eric J.P.E. Davanture - <a class="moz-txt-link-abbreviated
            moz-txt-link-freetext"
            href="mailto:eric.davanture@orange.fr"
            moz-do-not-send="true">eric.davanture@orange.fr</a><br>
        </b><br>
        <u>Approximate location:</u> Planet Earth &lt; Solar System &lt;
        Milky Way Galaxy &lt; Local Group &lt; Virgo Cluster &lt;
        Laniakea Supercluster &lt; known Universe (<a
          class="moz-txt-link-freetext"
          href="https://youtu.be/P6cw5Yv-zqU" moz-do-not-send="true">https://youtu.be/P6cw5Yv-zqU</a>)<br>
        <b>There is NO CLOUD, just other people's computers !</b></div>
    </blockquote>
  </body>
</html>

--------------Jd0owj0AOETj0zGf1C9ppgf4--

