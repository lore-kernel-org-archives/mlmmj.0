From: Mads Toftum <mads@toftum.dk>
Date: Thu, 24 Mar 2005 08:04:01 +0000
Subject: Re: memory management in mlmmj
Message-Id: <20050324080401.GA10851@cr>
List-Id: <mlmmj.mlmmj.org>
References: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
In-Reply-To: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Mar 23, 2005 at 11:44:36PM +0100, Christian Laursen wrote:
> Apache has also done something similar for years. It is probably available in
> APR, but it's probably not feasible to link against that monstrosity.
> 
Correct, it is in apr -
http://apr.apache.org/docs/apr/group__apr__pools.html
There is quite a few things in apr that might come in handy - first of
all there's the main portability issue and then along with the that we
would get things like ldap and database support (dbm, mysql, postgres and
sqllite). 

vh

Mads Toftum
-- 
`Darn it, who spiked my coffee with water?!' - lwall

