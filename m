From: "Carlo E. Prelz" <fluido@fluido.as>
Date: Wed, 12 Mar 2008 09:01:58 +0000
Subject: A short readme file for Courier MTA users
Message-Id: <20080312090158.GI26516@frittella.fluido.as>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_frittella-32181-1205312678-0001-2"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_frittella-32181-1205312678-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello people. I was able to configure mlmmj to run a small mailing
list under the Courier MTA. Since I did not find existing instructions
(especially, I could not find how I could change the recipient
delimiter in Courier) I had to roll my own solution. I briefly
described it in the attached file, that you may want to add to the
mlmmj distribution.

Thanks for writing a tool that it is pleasurable to work with.

Carlo

-- 
  *         Se la Strada e la sua Virtu' non fossero state messe da parte,
* K * Carlo E. Prelz - fluido@fluido.as             che bisogno ci sarebbe
  *               di parlare tanto di amore e di rettitudine? (Chuang-Tzu)

--=_frittella-32181-1205312678-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="README.courier"

Using mlmmj with the Courier MTA
(by Carlo Prelz - prelz@fluido.as)

I was able to configure te Courier MTA to use mlmmj for managing a
small group-of-friends mailing list. I used the dot-courier mechanism
(man 5 dot-courier for more information)

I am using the default Courier installation from Debian, which
installs the configuration files under /etc/courier, and executes
commands under the daemon user. YMMV.

First become user daemon, with something like

sudo su - daemon

Let's say your list is called "testlist". Create the mlmmj directory
with the mlmmj-make-ml.sh script. A directory called
/var/spool/mlmmj/testlist will now exist.

Configure all needed files under the control subdirectory, following
the info in the README and TUNABLES files. One file needs special
attention: the control/delimiter file must be present, with a line
containing a single dash ('-'). 

Then, make sure that Courier's dynamic deliveries are active. In file
/etc/courier/courierd, there has to be a line that reads

DYNAMICDELIVERIES=1

Restart the MTA if you needed to change the above line
(/etc/init.d/courier-mta restart) 

What you then need to do is create two files in the
/etc/courier/aliasdir directory. The files have to be called

.courier-testlist

and

.courier-testlist-default

They must have the same content:

| |/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/testlist/

(or whatever is the path of your mlmmj-recieve - remember you must use
the whole path of the executable). You do not need to run makealiases
after this.

Now add a few users, as described in the main README file, and test the
list. 

Remember to add the cron task for user daemon, as described in the
README file.

Good luck...

--=_frittella-32181-1205312678-0001-2--
