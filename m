From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:19 +0000
Subject: [mlmmj] [PATCH 01 of 10] Ensure that child processes exit if the execlp call
Message-Id: <ceda2c7e58db6611f80b.1296169159@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295968900 0
# Node ID ceda2c7e58db6611f80b5cb80f2f96cf53501db8
# Parent  e05f92db6857d67fa5a240fab614e2cfbdd14cab
Ensure that child processes exit if the execlp call fails and returns
control back to mlmmj-maint.

diff -r e05f92db6857 -r ceda2c7e58db src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Sun Nov 21 01:00:59 2010 +1100
+++ b/src/mlmmj-maintd.c	Tue Jan 25 15:21:40 2011 +0000
@@ -356,6 +356,10 @@
 						"-T", to,
 						"-a", (char *)NULL);
 			}
+			log_error(LOG_ARGS, "Could not execlp %s",
+						mlmmjsend);
+			/* This is the child. Exit on failure. */
+			exit(EXIT_FAILURE);
 		}
 	}
 
@@ -474,6 +478,10 @@
 					"-s", subnewname,
 					"-a",
 					"-D", (char *)NULL);
+			log_error(LOG_ARGS, "Could not execlp %s",
+						mlmmjsend);
+			/* This is the child. Exit on failure. */
+			exit(EXIT_FAILURE);
 		}
 	}
 
@@ -618,7 +626,8 @@
 					"-p", (char *)NULL);
 			log_error(LOG_ARGS, "Could not execlp %s",
 						mlmmjbounce);
-			return 1;
+			/* This is the child. Exit on failure. */
+			exit(EXIT_FAILURE);
 		}
 	}
 	closedir(bouncedir);
@@ -757,7 +766,8 @@
 					"-a", address, (char *)NULL);
 			log_error(LOG_ARGS, "Could not execlp %s",
 						mlmmjunsub);
-			return 1;
+			/* This is the child. Exit on failure. */
+			exit(EXIT_FAILURE);
 		}
 	}
 	closedir(bouncedir);

