Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F3A29F7E
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 May 2019 21:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391612AbfEXT7V (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 24 May 2019 15:59:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33696 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391762AbfEXT7P (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 24 May 2019 15:59:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so1919699wmh.0
        for <xdp-newbies@vger.kernel.org>; Fri, 24 May 2019 12:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98qLq1YzqvDS+bZlxBEFPwpmLRmsqB49UdX6CSq6WFg=;
        b=QpZPpgWA1ahMZVwKQCGsbR1vTC8Zh1qnwUO37X7roHSp4yVQbisxqCxwGQEqGngGEt
         +m5J0+0A6QvvvK6exn9gfDeLcziynDcDQgP/b4rWn6o2DaxQ+JEWZ52mKCg1DQu2e+2H
         eM8VSGnSd63b7Be0TMBP1eygyuEbQYfiNYLwxzwwUSpPwZ7IO15dCQNnIWssFHunoP4/
         6PvJgOmMUqsRH7b9kkgdVCJdm3zXw7zh18ldcqIGRZdrCQE5/q+ZBWLyQZ/UQW6dhdok
         DSoMcVdwI1KAZrDzZu/K/LY/BUB3wCC8fws0eK0EQw9G7OwQydVcZAevq/2imdMivwv4
         Dvjw==
X-Gm-Message-State: APjAAAUIDSHrmZE1ICQMjBWmimSO2xHYQmFaU+AYInObSsk6L2wRYjK7
        1vcAzgjPzLlV9UY04q5jWo63WDASj9knlQ==
X-Google-Smtp-Source: APXvYqyRh3OV8dYox0YJl0PBxmCKnOVq+8z+KmDG88Sc4V+O4CxoZp1+fYgDvmYHhZdzy2v+WUx83w==
X-Received: by 2002:a05:600c:230a:: with SMTP id 10mr16603602wmo.13.1558727954156;
        Fri, 24 May 2019 12:59:14 -0700 (PDT)
Received: from raver.teknoraver.net (net-47-53-225-211.cust.vodafonedsl.it. [47.53.225.211])
        by smtp.gmail.com with ESMTPSA id b2sm3237140wrt.20.2019.05.24.12.59.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 12:59:13 -0700 (PDT)
From:   Matteo Croce <mcroce@redhat.com>
To:     xdp-newbies@vger.kernel.org, bpf@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH bpf] samples: bpf: add ibumad sample to .gitignore
Date:   Fri, 24 May 2019 21:59:12 +0200
Message-Id: <20190524195912.4966-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

This commit adds ibumad to .gitignore which is
currently ommited from the ignore file.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 samples/bpf/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/samples/bpf/.gitignore b/samples/bpf/.gitignore
index c7498457595a..74d31fd3c99c 100644
--- a/samples/bpf/.gitignore
+++ b/samples/bpf/.gitignore
@@ -1,6 +1,7 @@
 cpustat
 fds_example
 hbm
+ibumad
 lathist
 lwt_len_hist
 map_perf_test
-- 
2.21.0

