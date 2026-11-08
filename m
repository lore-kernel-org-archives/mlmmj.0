Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC50606A31C
	for <mlmmj@archiver.kernel.org>; Sun,  8 Nov 2026 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=stargrave.org header.i=@stargrave.org header.a=ed25519-sha256 header.s=202401 header.b=5uy1q6QY
Received: from localhost ([127.0.0.1]:35306 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3125-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1xPwsq-003sty-13
	for mlmmj@archiver.kernel.org;
	Sun, 08 Nov 2026 07:00:08 +0000
Received: from mail3.stargrave.org ([45.10.110.72]:29599)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <stargrave@mail2.stargrave.org>)
	id 1xPwsi-003stE-2T
	for mlmmj@mlmmj.org;
	Sun, 08 Nov 2026 07:00:00 +0000
Received: from mail2.stargrave.org (www.stargrave.org [IPv6:2a11:e140:0:11::1])
	by mail3.stargrave.org (Postfix) with ESMTP id 5171161FDC
	for <mlmmj@mlmmj.org>; Sun,  8 Nov 2026 10:00:26 +0300 (MSK)
DKIM-Signature: a=ed25519-sha256; bh=/OaRULoVxI3Df3UUJNeD8Kq4g4xB/6KgAGrsA7IIbI0=;
 c=simple/simple; d=stargrave.org;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 q=dns/txt; s=202401; t=1794121224; v=1;
 b=5uy1q6QYnrLEprL3wkSAWDz6Xo59A8Jg5OjddBLj8ZuVUJeYWKBhnAibYXvSXC9F/tK9+7AI
 0t09Lsq+M6nSDw==
Received: by mail2.stargrave.org (Postfix, from userid 1001)
	id 1A3BA121BF; Sun,  8 Nov 2026 10:00:24 +0300 (MSK)
Received: by stargrave.org (Postfix, from userid 1001)
	id 099B677FBC; Sun,  8 Nov 2026 10:00:13 +0300 (MSK)
From: Sergey Matveev <stargrave+mlmmj@stargrave.org>
To: mlmmj@mlmmj.org
Subject: [PATCH] Add Russian listtexts
Date: Sun,  8 Nov 2026 10:00:10 +0300
Message-ID: <20261108070013.78874-1-stargrave+mlmmj@stargrave.org>
X-Mailer: git-send-email 2.56.0
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Mail-Followup-To: mlmmj@mlmmj.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergey Matveev <stargrave@stargrave.org>

---
 listtexts/ru/confirm       | 53 +++++++++++++++++++++++
 listtexts/ru/deny          | 77 +++++++++++++++++++++++++++++++++
 listtexts/ru/deny-post     | 64 ++++++++++++++++++++++++++++
 listtexts/ru/digest        |  5 +++
 listtexts/ru/faq           |  4 ++
 listtexts/ru/finish        | 53 +++++++++++++++++++++++
 listtexts/ru/finish-sub    | 44 +++++++++++++++++++
 listtexts/ru/gatekeep-sub  | 19 +++++++++
 listtexts/ru/help          | 87 ++++++++++++++++++++++++++++++++++++++
 listtexts/ru/list          | 25 +++++++++++
 listtexts/ru/moderate-post | 51 ++++++++++++++++++++++
 listtexts/ru/notify        | 41 ++++++++++++++++++
 listtexts/ru/probe         | 11 +++++
 listtexts/ru/prologue      |  1 +
 listtexts/ru/wait-post     | 34 +++++++++++++++
 listtexts/ru/wait-sub      |  7 +++
 16 files changed, 576 insertions(+)
 create mode 100644 listtexts/ru/confirm
 create mode 100644 listtexts/ru/deny
 create mode 100644 listtexts/ru/deny-post
 create mode 100644 listtexts/ru/digest
 create mode 100644 listtexts/ru/faq
 create mode 100644 listtexts/ru/finish
 create mode 100644 listtexts/ru/finish-sub
 create mode 100644 listtexts/ru/gatekeep-sub
 create mode 100644 listtexts/ru/help
 create mode 100644 listtexts/ru/list
 create mode 100644 listtexts/ru/moderate-post
 create mode 100644 listtexts/ru/notify
 create mode 100644 listtexts/ru/probe
 create mode 100644 listtexts/ru/prologue
 create mode 100644 listtexts/ru/wait-post
 create mode 100644 listtexts/ru/wait-sub

diff --git a/listtexts/ru/confirm b/listtexts/ru/confirm
new file mode 100644
index 0000000..8230981
--- /dev/null
+++ b/listtexts/ru/confirm
@@ -0,0 +1,53 @@
+%ifaction sub%Subject: Подтвердите подписку на $list$@$domain$%endif%
+%ifaction unsub%Subject: Подтвердите отписку от $list$@$domain$%endif%
+
+%text prologue%
+
+%ifaction sub%
+  %^%%wrap%
+  %ifreason admin%
+    Администратор
+  %endif%
+  %ifreason request%
+    Некто (мы надеемся что это были вы)
+  %endif%
+  запросил чтобы ваш email адрес <$subaddr$> был добавлен
+  %iftype normal%
+    к рассылке. Это означает, что каждый раз когда сообщение
+    отправляется в рассылку, вы получите его копию.
+  %endif%
+  %iftype digest%
+    к рассылке, получая дайджесты. Это означает, что вы будете получать
+    несколько сообщений в одном письме, регулярными интервалами, или
+    когда много сообщений будет агрегировано.
+  %endif%
+  %iftype nomail%
+    к рассылке, без получения писем. Это означает, что вы не будете
+    получать сообщения отправляемые в рассылку, но будете считаться её
+    участником. Это значит, например, что у вас будет возможность
+    посылать сообщения в рассылку, для которой это разрешено только
+    подписчикам, а вы можете следить за сообщениями через web архив или
+    другой подписанный адрес.
+  %endif%
+%endif%
+
+%ifaction unsub%
+  %^%%wrap%
+  %ifreason admin%
+    Администратор
+  %endif%
+  %ifreason request%
+    Некто (мы надеемся что это были вы)
+  %endif%
+  запросил чтобы этот email адрес <$subaddr$> был удалён из рассылки.
+%endif%
+
+%wrap%Чтобы подтвердить что вы хотите сделать это, пожалуйста отправьте
+сообщение на <$confirmaddr$>, что обычно может быть сделано просто ответом
+на данное сообщение. Тема и тело письма могут быть любыми.
+
+После того, как вы это сделаете, вы должны получить ответ информирующий
+что операция успешна.
+
+Если вы не хотите делать этого, просто игнорируйте это сообщение.
+
diff --git a/listtexts/ru/deny b/listtexts/ru/deny
new file mode 100644
index 0000000..c353504
--- /dev/null
+++ b/listtexts/ru/deny
@@ -0,0 +1,77 @@
+%ifaction sub%Subject: Невозможно подписаться на $list$@$domain$%endif%
+%ifaction unsub%Subject: Невозможно отписаться от $list$@$domain$%endif%
+%ifaction release reject%Subject: Невозможно модерировать $list$@$domain$%endif%
+%ifaction permit obstruct%Subject: Невозможно курировать $list$@$domain$%endif%
+
+%text prologue%
+
+%ifaction sub%
+  %^%%wrap%Вас не смогли подписать на рассылку
+  %ifreason disabled%
+    потому что
+    %iftype normal% нормальная %endif%
+    %iftype digest% дайджест %endif%
+    %iftype nomail% no-mail %endif%
+    версия рассылки отключена.
+  %endif%
+  %ifreason closed%
+    потому что людям запрещено подписываться на рассылку через email.
+  %endif%
+  %ifreason subbed%
+    потому что вы уже подписаны.
+  %endif%
+  %ifreason expired%
+    потому что слишком много времени прошло в ожидании привратиника
+    подтвердить вашу заявку.
+  %endif%
+  %ifreason obstruct%
+    потому что привратник отклонил вашу заявку.
+  %endif%
+%endif%
+
+%ifaction unsub%
+  %^%%wrap%Вас не смогли отписать от рассылки
+  %ifreason unsubbed%
+    потому что вы не подписаны.
+
+    %^%%wrap%Если вы получаете сообщения, то возможно другой email адрес
+    подписан. Чтобы найти каким именно адресом вы подписаны, обратите
+    внимание на сообщение приветствовавшее вас в рассылке, или
+    посмотрите на "Return-Path" заголовок сообщений получаемых из рассылки.
+  %endif%
+%endif%
+
+%ifaction release reject%
+  %^%%wrap%
+  %ifaction release%
+    Вы не смогли принять указанное сообщение в рассылку,
+  %endif%
+  %ifaction reject%
+    Вы не смогли отклонить указанное сообщение,
+  %endif%
+  %ifreason notfound%
+    потому что оно не нашлось. Возможно другой модератор уже принял или
+    отклонил его, либо истёк срок его жизни.
+  %endif%
+  %ifreason moderators%
+    потому что вы не модератор рассылки.
+  %endif%
+%endif%
+
+%ifaction permit obstruct%
+  %^%%wrap%
+  %ifaction permit%
+    Вы не смогли разрешить указанный запрос на подписку,
+  %endif%
+  %ifaction obstruct%
+    Вы не смогли отклонить указанный запрос на подписку,
+  %endif%
+  %ifreason notfound%
+    потому что он не найден. Возможно другой привратник уже разрешил или
+    отклонил его, либо истёк срок его жизни.
+  %endif%
+  %ifreason gatekeepers%
+    потому что вы не привратник рассылки.
+  %endif%
+%endif%
+
diff --git a/listtexts/ru/deny-post b/listtexts/ru/deny-post
new file mode 100644
index 0000000..7b29e31
--- /dev/null
+++ b/listtexts/ru/deny-post
@@ -0,0 +1,64 @@
+Subject: Сообщение в $list$@$domain$ отклонено: $subject$
+MIME-Version: 1.0
+Content-Type: multipart/mixed;
+ boundary="=_$random0$$random1$_="
+Content-Transfer-Encoding: 8bit
+
+--=_$random0$$random1$_=
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+%text prologue%
+
+%wrap%Сообщение от <$posteraddr$> с темой "$subject$" не может быть
+доставлено в рассылку,
+%ifreason maxmailsize%
+  потому что его размеры превышают допустимый максимум в $maxmailsize$ байт.
+%endif%
+%ifreason tocc%
+  потому что адрес рассылки не найден ни в To:, ни в Cc: заголовках.
+%endif%
+%ifreason access%
+  из-за правила доступа установленного администратором рассылки.
+%endif%
+%ifreason expired%
+  потому что прошло слишком много времени ожидая подтверждения модератора.
+%endif%
+%ifreason reject%
+  потому что модератор отклонил его.
+%endif%
+%ifreason subonlypost%
+  потому что вы не подписчик рассылки.
+
+  %ifcontrol closedlist closedlistsub%
+    %^%%wrap%Если вы хотите стать подписчиком, то вам нужно связаться с
+    администратором рассылки. Отправьте письмо на <$list+$owner@$domain$>
+    для связи с владельцем рассылки.
+  %endif%
+
+  %^%%wrap%Если вы убеждены что вы подписчик, то возможно подписаны
+  другим email адресом. Чтобы найти каким именно адресом вы подписаны,
+  обратите внимание на сообщение приветствовавшее вас в рассылке, или
+  посмотрите на "Return-Path" заголовок сообщений получаемых из рассылки.
+%endif%
+%ifreason modonlypost%
+  потому что вы не модератор.
+%endif%
+
+%ifreason maxmailsize%
+  %^%(Начала отклонённого сообщения ниже)
+%else%
+  %^%(Отклонённое сообщение ниже)
+%endif%
+
+--=_$random0$$random1$_=
+Content-Type: message/rfc822
+Content-Transfer-Encoding: 8bit
+Content-Disposition: inline; filename="message.eml"
+
+%ifreason maxmailsize%
+  %^%%originalmail 300%
+%else%
+  %^%%originalmail%
+%endif%
+--=_$random0$$random1$_=--
diff --git a/listtexts/ru/digest b/listtexts/ru/digest
new file mode 100644
index 0000000..25128c8
--- /dev/null
+++ b/listtexts/ru/digest
@@ -0,0 +1,5 @@
+Subject: Дайджест $list$@$domain$ выпуск $digestissue$ ($digestinterval$)
+
+Темы (сообщения с $digestfirst$ по $digestlast$):
+- %digestthreads%
+
diff --git a/listtexts/ru/faq b/listtexts/ru/faq
new file mode 100644
index 0000000..8a9d5ce
--- /dev/null
+++ b/listtexts/ru/faq
@@ -0,0 +1,4 @@
+Subject: Часто задаваемые вопросы по $list$@$domain$
+
+Извините, но ЧАВО пока нет.
+
diff --git a/listtexts/ru/finish b/listtexts/ru/finish
new file mode 100644
index 0000000..4f1143a
--- /dev/null
+++ b/listtexts/ru/finish
@@ -0,0 +1,53 @@
+%ifaction unsub%Subject: До свидания от $list$@$domain$%endif%
+%ifaction release reject%Subject: Модерируется $list$@$domain$: $subject$%endif%
+%ifaction permit obstruct%Subject: Курируется $list$@$domain$: $subaddr$%endif%
+%ifaction post%Subject: Опубликовано в $list$@$domain$: $subject$%endif%
+
+%text prologue%
+
+%ifaction unsub%
+  %^%%wrap%
+  %ifreason request%
+  %endif%
+  %ifreason confirm%
+    Спасибо за подтверждение отписки.
+  %endif%
+  %ifreason admin%
+    Администратор удалил вас из рассылки.
+  %else%
+    Вы удалены из рассылки.
+  %endif%
+%endif%
+
+%ifaction release%
+  %^%%wrap%Вы успешно приняли сообщение от <$posteraddr$>
+  с темой "$subject$" в рассылку.
+%endif%
+
+%ifaction reject%
+  %^%%wrap%Вы успешно отклонили сообщение от <$posteraddr$>
+  с темой "$subject$".
+%endif%
+
+%ifaction permit%
+  %^%%wrap%Вы успешно разрешили <$subaddr$> присоединиться к рассылке.
+%endif%
+
+%ifaction obstruct%
+  %^%%wrap%Вы успешно запретили <$subaddr$> присоединяться к рассылке.
+%endif%
+
+%ifaction post%
+  %^%%wrap%
+  %ifreason confirm%
+    Спасибо за подтверждение вашего сообщения
+  %endif%
+  %ifreason release%
+    Модератор пропустил ваше сообщение
+  %endif%
+  %ifreason request%
+    Спасибо за ваше сообщение
+  %endif%
+  с темой "$subject$". Оно отправлено в рассылку.
+%endif%
+
diff --git a/listtexts/ru/finish-sub b/listtexts/ru/finish-sub
new file mode 100644
index 0000000..2f342cc
--- /dev/null
+++ b/listtexts/ru/finish-sub
@@ -0,0 +1,44 @@
+Subject: Добро пожаловать в $list$@$domain$
+
+%text prologue%
+
+%wrap%
+%ifreason request%
+  Спасибо за ваш запрос присоединиться к нам.
+%endif%
+%ifreason confirm%
+  Спасибо за подтверждение вашего запроса подписки.
+%endif%
+%ifreason permit%
+  Привратник разрешил вам присоединиться к нам.
+%endif%
+%ifreason switch%
+  Ваша подписка переключена в
+%else%
+  %ifreason admin%
+    Администратор подписал вас к
+  %else%
+    Вы добавлены к
+  %endif%
+%endif%
+%iftype normal% нормальной %endif%
+%iftype digest% дайджест %endif%
+%iftype nomail% no-mail %endif%
+версии рассылки.
+
+%wrap%Email адрес которым вы подписались: <$subaddr$>.
+
+%ifcontrol closedlist%
+  %^%%wrap%Если вы когда либо захотите отписаться, то вам нужно
+  связаться с администратором рассылки. Отправьте письмо на
+  <$list+$owner@$domain$> для связи с владельцем рассылки.
+%else%
+  %^%%wrap%Если вы когда либо захотите отписаться, отправьте письмо на
+  <$list+$unsubscribe@$domain$> используя текущий email адрес. Тема и
+  тело письма могут быть любыми. Вы получите либо подтверждение, либо
+  дальнейшие инструкции.
+%endif%
+
+%wrap%Для дополнительной информации и помощи по этой рассылке, отправьте
+сообщение на <$list+$help@$domain$>.
+
diff --git a/listtexts/ru/gatekeep-sub b/listtexts/ru/gatekeep-sub
new file mode 100644
index 0000000..b43e480
--- /dev/null
+++ b/listtexts/ru/gatekeep-sub
@@ -0,0 +1,19 @@
+Subject: Запрос на подписку на $list$@$domain$: $subaddr$
+
+%text prologue%
+
+%wrap%Тут запрос от <$subaddr$> на подписку к
+%iftype normal% нормальной %endif%
+%iftype digest% дайджест %endif%
+%iftype nomail% no-mail %endif%
+версии рассылки.
+
+%wrap%Для разрешения этого, пожалуйста отправьте сообщение на <$permitaddr$>,
+что обычно может быть сделано просто ответом на данное сообщение.
+
+%wrap%Если вы не хотите делать этого, то либо отправьте сообщение на
+<$obstructaddr$>, либо просто проигнорируйте это сообщение.
+
+Следующие привратники получили это сообщение:
+- %gatekeepers%
+
diff --git a/listtexts/ru/help b/listtexts/ru/help
new file mode 100644
index 0000000..340b064
--- /dev/null
+++ b/listtexts/ru/help
@@ -0,0 +1,87 @@
+Subject: Информация о $list$@$domain$
+
+%text prologue%
+
+Вы можете подписаться на следующие версии:
+
+- %wrap%Нормальная версия: каждый раз, когда сообщение отправляется в
+рассылку, подписчики получают его копию.
+%ifcontrol closedlist closedlistsub%
+  Для подписки свяжитесь с администратором рассылки.
+%else%
+  Для подписки отправьте письмо на <$list+$subscribe@$domain$>.
+%endif%
+
+%ifncontrol nodigestsub%
+  %^%- %wrap%Дайджест версия: подписчики получают несколько сообщений в
+  одном письме, регулярными интервалами, или когда много сообщений будет
+  агрегировано.
+  %ifcontrol closedlist closedlistsub%
+    Для подписки свяжитесь с администратором рассылки.
+  %else%
+    Для подписки отправьте письмо на <$list+$subscribe-digest@$domain$>.
+  %endif%
+%endif%
+
+%ifncontrol nonomailsub%
+  %^%- %wrap%no-mail версия: подписчики не получают никаких сообщений из
+  рассылки. Однако это означает что они могут отправлять их в рассылку,
+  для которой разрешён приём только от подписчиков, а следить за
+  сообщениями можно через web архив или другой подписанный адрес.
+  %ifcontrol closedlist closedlistsub%
+    Для подписки свяжитесь с администратором рассылки.
+  %else%
+    Для подписки отправьте письмо на <$list+$subscribe-nomail@$domain$>.
+  %endif%
+%endif%
+
+%ifcontrol submod%
+  %^%%wrap%Рассылка имеет привратников, которые будут рассматривать запросы
+  на подписку перед приёмом новых участников.
+%endif%
+
+%ifcontrol closedlist%
+  %^%%wrap%Для отписки свяжитесь с администратором рассылки.
+%else%
+  %^%%wrap%Для отписки отправьте письмо на <$list+$unsubscribe@$domain$>.
+%endif%
+
+%wrap%Отправить сообщение в рассылку можно письмом на <$list$@$domain$>.
+
+%ifcontrol subonlypost%%ifncontrol modnonsubposts%
+  %^%%wrap%Но только подписчики могут отправлять сообщения в рассылку.
+%endif%%endif%
+
+%ifcontrol moderated%
+  %^%%wrap%В рассылке есть модераторы, которые будут рассматривать
+  сообщения перед их отправкой в рассылку.
+%else%
+  %ifcontrol subonlypost%%ifcontrol modnonsubposts%
+    %^%%wrap%В рассылке есть модераторы, которые будут рассматривать
+    сообщения от не-подписчиков перед их отправкой в рассылку.
+  %endif%%endif%
+%endif%
+
+%ifcontrol access%
+  %^%%wrap%В рассылке есть правила доступа, которые могут влиять на то,
+  кто сможет отправлять сообщения и кто будет модерироваться.
+%endif%
+
+%ifncontrol noget%%ifncontrol noarchive%
+  %^%%wrap%
+  %ifcontrol subonlyget%
+    Любой может
+  %else%
+    Подписчики могут
+  %endif%
+  получить сообщение с номером N из архива рассылки, путём отправки
+  письма на <$list+$get-N@$domain$> (замените N на номер нужного вам
+  сообщения).
+%endif%%endif%
+
+%wrap%Вы можете получить документ часто задаваемых вопросов путём
+отправки письма на <$list+$faq@$domain$>.
+
+%wrap%Для связи с владельцем рассылки, отправьте сообщение на
+<$list+$owner@$domain$>.
+
diff --git a/listtexts/ru/list b/listtexts/ru/list
new file mode 100644
index 0000000..ee5cbdd
--- /dev/null
+++ b/listtexts/ru/list
@@ -0,0 +1,25 @@
+Subject: Подписчики $list$@$domain$
+
+%text prologue%
+
+%wrap%Список подписчиков
+%iftype all%
+  (на все версии рассылки):
+%else%
+  на
+  %iftype normal% нормальную %endif%
+  %iftype digest% дайджест %endif%
+  %iftype nomail% no-mail %endif%
+  версию рассылки:
+%endif%
+
+%iftype all normal%
+  %^%- %listsubs%
+%endif%
+%iftype all digest%
+  %^%- %digestsubs%
+%endif%
+%iftype all nomail%
+  %^%- %nomailsubs%
+%endif%
+
diff --git a/listtexts/ru/moderate-post b/listtexts/ru/moderate-post
new file mode 100644
index 0000000..503d2d3
--- /dev/null
+++ b/listtexts/ru/moderate-post
@@ -0,0 +1,51 @@
+Subject: Запрос на модерацию $list$@$domain$: $subject$
+MIME-Version: 1.0
+Content-Type: multipart/mixed;
+ boundary="=_$random0$$random1$_="
+Content-Transfer-Encoding: 8bit
+
+--=_$random0$$random1$_=
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+%text prologue%
+
+%wrap%Принято сообщение от <$posteraddr$> с темой "$subject$" для
+отправки в рассылку. Вас просят модерировать его,
+%ifreason modnonsubposts%
+  потому что отправитель не является подписчиком.
+%endif%
+%ifreason moderated%
+  потому что это модерируемая рассылка.
+%endif%
+%ifreason access%
+  из-за правила доступа.
+%endif%
+Сообщение ниже.
+
+%wrap%Для его приёма в рассылку, пожалуйста отправьте сообщение на
+<$releaseaddr$>, что обычно может быть сделано просто ответом
+на данное сообщение.
+
+%ifcontrol subonrelease%
+  %^%%wrap%Если хотите, то можете одновременно отправить сообщение
+  и подписать отравителя, отправкой сообщения на один из следующих
+  адресов:%nowrap%
+  %^%- %wrap%Нормальная версия: <$listsubreleaseaddr$>%nowrap%
+  %^%- %wrap%Дайджест версия: <$digestsubreleaseaddr$>%nowrap%
+  %^%- %wrap%No-mail версия: <$nomailsubreleaseaddr$>%nowrap%
+%endif%
+
+%wrap%Если вы не хотите этого делать, то либо отправьте сообщение на
+<$rejectaddr$>, либо просто проигнорируйте данное сообщение.
+
+Следующие модераторы получили это письмо:
+- %moderators%
+
+--=_$random0$$random1$_=
+Content-Type: message/rfc822
+Content-Transfer-Encoding: 8bit
+Content-Disposition: inline; filename="message.eml"
+
+%originalmail%
+--=_$random0$$random1$_=--
diff --git a/listtexts/ru/notify b/listtexts/ru/notify
new file mode 100644
index 0000000..ce50e27
--- /dev/null
+++ b/listtexts/ru/notify
@@ -0,0 +1,41 @@
+%ifaction sub%Subject: Подписан на $list$@$domain$: $subaddr$%endif%
+%ifaction unsub%Subject: Отписан от $list$@$domain$: $subaddr$%endif%
+
+%text prologue%
+
+%ifaction sub%
+  %^%%wrap%Адрес <$subaddr$> был подписан на
+  %iftype normal% нормальную %endif%
+  %iftype digest% дайджест %endif%
+  %iftype nomail% no-mail %endif%
+  версию рассылки,
+  %ifreason request%
+    потому что был получен запрос на подписку.
+  %endif%
+  %ifreason confirm%
+    потому что запрос на подписку был подтверждён.
+  %endif%
+  %ifreason admin%
+    потому что администратор так сказал.
+  %endif%
+  %ifreason permit%
+    потому что привратник разрешил.
+  %endif%
+%endif%
+
+%ifaction unsub%
+  %^%%wrap%Адрес <$subaddr$> был отписан от рассылки
+  %ifreason request%
+    потому что был получен запрос на отписку.
+  %endif%
+  %ifreason confirm%
+    потому что запрос на отписку был подтверждён.
+  %endif%
+  %ifreason admin%
+    потому что администратор так сказал.
+  %endif%
+  %ifreason bouncing%
+    потому что слишком долго письма возвращаются от адресата.
+  %endif%
+%endif%
+
diff --git a/listtexts/ru/probe b/listtexts/ru/probe
new file mode 100644
index 0000000..85dd32c
--- /dev/null
+++ b/listtexts/ru/probe
@@ -0,0 +1,11 @@
+Subject: Возвращённые письма от $list$@$domain$
+
+%text prologue%
+
+Некоторые сообщения вам не могли быть доставлены. Если вы видите это
+сообщение, то значит всё вернулось в норму и это просто для вашей
+информации.
+
+Список возвращённых писем:
+- %bouncenumbers%
+
diff --git a/listtexts/ru/prologue b/listtexts/ru/prologue
new file mode 100644
index 0000000..852b8a0
--- /dev/null
+++ b/listtexts/ru/prologue
@@ -0,0 +1 @@
+%wrap%Это Mlmmj программа, управляющая <$list$@$domain$> рассылкой.
diff --git a/listtexts/ru/wait-post b/listtexts/ru/wait-post
new file mode 100644
index 0000000..57cf95f
--- /dev/null
+++ b/listtexts/ru/wait-post
@@ -0,0 +1,34 @@
+Subject: Ожидание подтверждения в $list$@$domain$: $subject$
+MIME-Version: 1.0
+Content-Type: multipart/mixed;
+ boundary="=_$random0$$random1$_="
+Content-Transfer-Encoding: 8bit
+
+--=_$random0$$random1$_=
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+%text prologue%
+
+%wrap%Сообщение от <$posteraddr$> с темой "$subject$" принято для
+отправки в рассылку. Модераторов попросили рассмотреть его, перед
+приёмом в рассылку,
+%ifreason moderated%
+  потому что она модерируемая.
+%endif%
+%ifreason access%
+  из-за правила доступа.
+%endif%
+%ifreason modnonsubposts%
+  потому что вы не подписчик.
+%endif%
+
+(Сообщение ниже)
+
+--=_$random0$$random1$_=
+Content-Type: message/rfc822
+Content-Transfer-Encoding: 8bit
+Content-Disposition: inline; filename="message.eml"
+
+%originalmail%
+--=_$random0$$random1$_=--
diff --git a/listtexts/ru/wait-sub b/listtexts/ru/wait-sub
new file mode 100644
index 0000000..939be91
--- /dev/null
+++ b/listtexts/ru/wait-sub
@@ -0,0 +1,7 @@
+Subject: Ожидание разрешения на подписку к $list$@$domain$
+
+%text prologue%
+
+%wrap%Ваш запрос на подписку к рассылке получен. Привратники оповещены
+рассмотреть заявку перед тем, как разрешить подписаться.
+
-- 
2.56.0



