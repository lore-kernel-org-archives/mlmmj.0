From: Jakob Hirsch <jh@plonk.de>
Date: Thu, 05 Jul 2007 17:47:42 +0000
Subject: Re: Support for X-No-Archive planned?
Message-Id: <468D2EBE.3000001@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20070705144515.GC21671@ptaff.ca>
In-Reply-To: <20070705144515.GC21671@ptaff.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Quoting Patrice Levesque:

> I know I can delete the file in spool/ml/archive/, but is there anything
> else that can be done?  Is something like “X-No-Archive: yes” supported
> or planned?

Is this necessary inside the mlmmj itself? You could just grep over 
recent files with find and grep. This would be no real-time solution, of 
course, but more like Google's "remove after X days" feature (which I'd 
say is a good thing).

Anyway, a simple approach to do it synchronously could be to use the 
"noarchive" control flag, i.e. setting it to "2" would honour the 
X-No-Archive header. But it would be probably better (more generic and 
flexible) to create a new flag "archivewith", which would define an 
external program to do the archiving (or not, depending on whatever 
somebody wants, and also _where_ one wants, like an RDBMS or such, e.g.).

