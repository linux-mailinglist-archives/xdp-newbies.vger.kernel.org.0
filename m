Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D576265C
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2019 18:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730392AbfGHQcm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Jul 2019 12:32:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35290 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389250AbfGHQbz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Jul 2019 12:31:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id y4so9256960wrm.2
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2019 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kinvolk.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lzYpaDtUNAMchDHQ5mVavWSVxemrZT4NQs1IRkRW66Q=;
        b=ZyD5dW8nuNYNP+nX4Td3kyXt1a5K3nWXeOqKr8xVZP9rEglO8POBabo0xUar/gJ9Ty
         gfFpaGdGJEGTen/crmSnq/idDmP+4qdZ+MAnsH2SrX1GQPIozuLlLUyiZ7lSuxmjqo30
         oRB6kpJ1lWc7VsBn8xN7GZDGTm7uJLG7pWxoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lzYpaDtUNAMchDHQ5mVavWSVxemrZT4NQs1IRkRW66Q=;
        b=bkS/Q8xJ3GikvPRUQnNOBfohKmPSfgvTmWCjA1jJfDa3r1wTFPutS5j9OMIxrCUwbq
         lR0+9GA5RhTlLOklxtDQGWuOxdBgv6ut5RFvY4skAeEP/4iXCzAKtspILRfjqA7iETxi
         Mztg74nh8l+/fK6wS43DRZtg1M/NiTJz7detNrPyzEvP5hfEl55AfFsol+YXaRN9NaI/
         pZ2tt4LoBouuWOzy1m0MVRHA3Qd+HoZrDDCT5NH2yQUZXNYWXFST9slZrZXuKtFi7+LB
         bp6UQVUl8AVHnq5KsJxbcqeeYkPWWYwxzfXr1M8lz6tiEDxXQHS++7R8Qyc+WBQNGCkG
         8Few==
X-Gm-Message-State: APjAAAU2BEGMXAeEAR087iaWgTsmW2KKTIYk4YE3p/aXbl/gv2S5A68W
        06IvfQU6l/TEWfj2OsYhqksd0Q==
X-Google-Smtp-Source: APXvYqzDVSViY5HVVYRgFb8v3N1wc1MFi5lzXRopegl9JYz0+mT8xKR31nPz40eySxSRzlooFazs6A==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr19075288wrn.197.1562603513828;
        Mon, 08 Jul 2019 09:31:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aedbe.dynamic.kabel-deutschland.de. [95.90.237.190])
        by smtp.gmail.com with ESMTPSA id e6sm18255086wrw.23.2019.07.08.09.31.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 09:31:53 -0700 (PDT)
From:   Krzesimir Nowak <krzesimir@kinvolk.io>
To:     linux-kernel@vger.kernel.org
Cc:     Alban Crequy <alban@kinvolk.io>,
        =?UTF-8?q?Iago=20L=C3=B3pez=20Galeiras?= <iago@kinvolk.io>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@google.com>, netdev@vger.kernel.org,
        bpf@vger.kernel.org, xdp-newbies@vger.kernel.org,
        Krzesimir Nowak <krzesimir@kinvolk.io>
Subject: [bpf-next v3 06/12] selftests/bpf: Make sure that preexisting tests for perf event work
Date:   Mon,  8 Jul 2019 18:31:15 +0200
Message-Id: <20190708163121.18477-7-krzesimir@kinvolk.io>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708163121.18477-1-krzesimir@kinvolk.io>
References: <20190708163121.18477-1-krzesimir@kinvolk.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

We are going to introduce a test run implementation for perf event in
a later commit and it will not allow passing any data out or ctx out
to it, and requires their sizes to be specified to zero. To avoid test
failures when the feature is introduced, override the data out size to
zero. That will also cause NULL buffer to be sent to the kernel.

Signed-off-by: Krzesimir Nowak <krzesimir@kinvolk.io>
---
 .../testing/selftests/bpf/verifier/perf_event_sample_period.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/bpf/verifier/perf_event_sample_period.c b/tools/testing/selftests/bpf/verifier/perf_event_sample_period.c
index 471c1a5950d8..19f5d824b275 100644
--- a/tools/testing/selftests/bpf/verifier/perf_event_sample_period.c
+++ b/tools/testing/selftests/bpf/verifier/perf_event_sample_period.c
@@ -13,6 +13,7 @@
 	},
 	.result = ACCEPT,
 	.prog_type = BPF_PROG_TYPE_PERF_EVENT,
+	.override_data_out_len = true,
 },
 {
 	"check bpf_perf_event_data->sample_period half load permitted",
@@ -29,6 +30,7 @@
 	},
 	.result = ACCEPT,
 	.prog_type = BPF_PROG_TYPE_PERF_EVENT,
+	.override_data_out_len = true,
 },
 {
 	"check bpf_perf_event_data->sample_period word load permitted",
@@ -45,6 +47,7 @@
 	},
 	.result = ACCEPT,
 	.prog_type = BPF_PROG_TYPE_PERF_EVENT,
+	.override_data_out_len = true,
 },
 {
 	"check bpf_perf_event_data->sample_period dword load permitted",
@@ -56,4 +59,5 @@
 	},
 	.result = ACCEPT,
 	.prog_type = BPF_PROG_TYPE_PERF_EVENT,
+	.override_data_out_len = true,
 },
-- 
2.20.1

