From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Tue, 07 Jul 2009 17:13:38 +0000
Subject: Re: Patch to extend list command
Message-Id: <1246986818.4080.28.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
In-Reply-To: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Chris,

On Tue, 2009-06-23 at 17:36 +0200, Christoph Wilke wrote:
> maybe you have already discovered it, I forgot a semicolon in
> the patch (in send_list.h).

The header file was not included in your
all_subs-send_list_part-rev2.diff so I didn't notice ;-)

I marked the function as static, as it is not used outside of
send_list.c. Isn't that the way to do it? We can always change it, if
someone wants to call it from someplace else.

> See the attached revised patch.

I've committed your updated listtexts and added a Danish translation.

Would all the translation contributers change the following in their
"listsubs" file and send me a patch?

-Following is the list of subscribers:
+Following is the list of subscribers, nomailers and digesters:

We need the translation for:
cz
es
fr
it
nl
ru

> Regards and sorry for inconvenience,

No inconvenience. Once again, thanks for your patches.

Best regards,
Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


