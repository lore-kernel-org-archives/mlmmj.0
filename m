From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 10 Mar 2005 18:34:02 +0000
Subject: Re: Configuring Postfix as a mailgateway for mlmmj
Message-Id: <20050310183402.GO12734@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050310112311.GF210@dinamizm.com>
In-Reply-To: <20050310112311.GF210@dinamizm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Togan Muftuoglu <toganm@dinamizm.com> [Mar 10. 2005 12:22]:
> I have installed mlmmj-1.2.4-3 on a SUSE 8.2 machine which is acting
> as a mailgateway.
> 
> I have created the list via the command
> 
> mlmmj-make-ml.sh -L 5element -a
> 
> and run the newaliases command.
> 
> Since this machine is running as a mailserver gateway doing antivirus,
> RBL, header checks along with the user check via relay_recipients maps
> and then relaying the accepted mail to the inside mailserver, I am not
> sure if the /etc/aliases file is the one I need. I have thought of the
> relay_recipients_maps yet that would deliver the mail to the inside
> mailserver which is not what I want.

I'm pretty sure it is. Did you try it out with a small list?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
