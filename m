Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 463C062643
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2019 18:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391265AbfGHQcA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Jul 2019 12:32:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54391 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389821AbfGHQb6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Jul 2019 12:31:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so146065wme.4
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2019 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kinvolk.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=85UmCqjB/2q4FemAi0uqOHeKcTywLVBMQcPg1IVAqAM=;
        b=Dfct8cMtJ3z8OuDpeDpsjRAF6WXSTiaH+K294/muggipqhmBYGNxaI8Of4vzfovnWd
         araJpc0PBcJ2t3N22S6Ai2IPrId9rxQmWqKV1zBEiXjqowqjmg/g1mcNqux1teEWW98B
         jNJCpOG+OC0EloVzoloxZiHXdRx1tzoJis7HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85UmCqjB/2q4FemAi0uqOHeKcTywLVBMQcPg1IVAqAM=;
        b=hAFbNNp7pH55y2iWuhZJVAZy168OdCjthOx/CM79305wMd3nntFmnWv7uogckDZoCb
         DYToqW8N9KkbaIu8XgMX5+CwXPJTlo1eBNfTq9Mp8uZOAqtdAyh/p5VXTLPtMJpwFd3j
         /RTUznyUpMvhqfG/7M5c5yXkHr5MImPvU1OWkHdTjrGyi3zTWJWVwLuJczs2p0laKrHB
         aALLCX9AYoodojLqwStX0tx1ACLcXeToRCNPlgGJdSCcPNWB22n9kJBI8IrdQj8tRg8R
         AxbAAfUnjoN8w9l0mzWPiPymN1XcJwTeUpGn+ZtSP2wt9KHdAQjqogiBT9G3qgXAKzGi
         mviw==
X-Gm-Message-State: APjAAAW68/oOKbM8EWIXekrubNnSV72dvIY6pHHONsJhEjnOUmYLsPZN
        EgN5USYPM2/18W4NK1GrBPNGtQ==
X-Google-Smtp-Source: APXvYqyj4c3lEISNKOfADRNSxJClIv1MsBpCK5ZQjZI88b+WTlVEnLoE4ff4qUL/ArYdaGtzNigjjg==
X-Received: by 2002:a1c:305:: with SMTP id 5mr18180038wmd.101.1562603516202;
        Mon, 08 Jul 2019 09:31:56 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aedbe.dynamic.kabel-deutschland.de. [95.90.237.190])
        by smtp.gmail.com with ESMTPSA id e6sm18255086wrw.23.2019.07.08.09.31.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 09:31:55 -0700 (PDT)
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
Subject: [bpf-next v3 08/12] tools headers: Sync struct bpf_perf_event_data
Date:   Mon,  8 Jul 2019 18:31:17 +0200
Message-Id: <20190708163121.18477-9-krzesimir@kinvolk.io>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708163121.18477-1-krzesimir@kinvolk.io>
References: <20190708163121.18477-1-krzesimir@kinvolk.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

struct bpf_perf_event_data in kernel headers has the addr field, which
is missing in the tools version of the struct. This will be important
for the bpf prog test run implementation for perf events as it will
expect data to be an instance of struct bpf_perf_event_data, so the
size of the data needs to match sizeof(bpf_perf_event_data).

Signed-off-by: Krzesimir Nowak <krzesimir@kinvolk.io>
---
 tools/include/uapi/linux/bpf_perf_event.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/include/uapi/linux/bpf_perf_event.h b/tools/include/uapi/linux/bpf_perf_event.h
index 8f95303f9d80..eb1b9d21250c 100644
--- a/tools/include/uapi/linux/bpf_perf_event.h
+++ b/tools/include/uapi/linux/bpf_perf_event.h
@@ -13,6 +13,7 @@
 struct bpf_perf_event_data {
 	bpf_user_pt_regs_t regs;
 	__u64 sample_period;
+	__u64 addr;
 };
 
 #endif /* _UAPI__LINUX_BPF_PERF_EVENT_H__ */
-- 
2.20.1

