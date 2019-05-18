Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A76A220EC
	for <lists+xdp-newbies@lfdr.de>; Sat, 18 May 2019 02:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfERAqp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 May 2019 20:46:45 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40044 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbfERAqp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 May 2019 20:46:45 -0400
Received: by mail-wm1-f66.google.com with SMTP id 15so4155543wmg.5
        for <xdp-newbies@vger.kernel.org>; Fri, 17 May 2019 17:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4J/wt/1bRO1VqR+N0Z8RIgw8kt+l268hnuB5sJUEyrg=;
        b=HMjpwTV+RE1KR9s1RKKJXhJSSSp/z27gJUJkElw/aX3FDJED2s5Bl16GX/s4DgL0fb
         YyoPdBYIDq4SfV2ztcY0AoRVb9qhy+mZ8y/L1+b5OD9X3IDFUf8KMsFo10Jqf2eOMgex
         iVTCZaA7KtaZg0ll3wbLYeh1ZF9vOjeblNAmEHGr4t9je6UnFGc5/YJX7gEPcXu2AGhG
         /3ThsjHrRAN9vggmkpjVcCslFeCmmgtSZI728Gk0D8opf7eYO2KncLAFxW6SSPwZG1aW
         i31jzVZ8JaatGEtMLLHba+T4nnt/p5fb7Rn7ubGrZHqQ+bIDrtw7vbv+Go0qfB0zg228
         SKRA==
X-Gm-Message-State: APjAAAWgktnrk0Le7p2+MACvTGG+TFNSeQfKRUOHtcP6qCQbbIGNj5vj
        tbZBgNJvuL/j0V55q1LZeQWUpDS2Qgk=
X-Google-Smtp-Source: APXvYqzF+1psvAoQ+dDw6U4q+Nc7IUoQS/9RUXg8csMpLyunTejTk8ztforCi8fMevmiVwXj3qTkpA==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr4094317wmg.18.1558140403006;
        Fri, 17 May 2019 17:46:43 -0700 (PDT)
Received: from raver.teknoraver.net (net-47-53-225-211.cust.vodafonedsl.it. [47.53.225.211])
        by smtp.gmail.com with ESMTPSA id f2sm11037959wme.12.2019.05.17.17.46.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 May 2019 17:46:42 -0700 (PDT)
From:   Matteo Croce <mcroce@redhat.com>
To:     xdp-newbies@vger.kernel.org, bpf@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 1/5] samples/bpf: fix test_lru_dist build
Date:   Sat, 18 May 2019 02:46:35 +0200
Message-Id: <20190518004639.20648-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Fix the following error by removing a duplicate struct definition:

samples/bpf/test_lru_dist.c:39:8: error: redefinition of ‘struct list_head’
   39 | struct list_head {
      |        ^~~~~~~~~
In file included from samples/bpf/test_lru_dist.c:9:
./tools/include/linux/types.h:69:8: note: originally defined here
   69 | struct list_head {
      |        ^~~~~~~~~
make[2]: *** [scripts/Makefile.host:92: samples/bpf/test_lru_dist] Error 1
make[1]: *** [Makefile:1763: samples/bpf/] Error 2

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 samples/bpf/test_lru_dist.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/samples/bpf/test_lru_dist.c b/samples/bpf/test_lru_dist.c
index eec3e2509ce8..f532b894654b 100644
--- a/samples/bpf/test_lru_dist.c
+++ b/samples/bpf/test_lru_dist.c
@@ -36,10 +36,6 @@ static int nr_cpus;
 static unsigned long long *dist_keys;
 static unsigned int dist_key_counts;
 
-struct list_head {
-	struct list_head *next, *prev;
-};
-
 static inline void INIT_LIST_HEAD(struct list_head *list)
 {
 	list->next = list;
-- 
2.21.0

