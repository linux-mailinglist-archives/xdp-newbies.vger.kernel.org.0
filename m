Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1E35FE87
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2019 01:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfGDXO0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jul 2019 19:14:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35109 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbfGDXO0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jul 2019 19:14:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so687358ljh.2
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2019 16:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bVDhPr1NYeKDnrMdcMHlybkPxVb9bTLFPQt8UIwuo9g=;
        b=Y2oAh8lvwJqXl1+6yeHQ/iXA9z4VaR8LEnUnmIAOpwP5SNCVLDSMIzrsWl/abPO2X4
         G9Sh4lSvLw0dpYZ68GsTpzVFmuij/tHS0rMJAo6G6hn7tbXDsjTzFgQ9SLGoyqvYs8tN
         onSKcrgq6/GjjogzlnAKi9a5wg2orPWPCKR91cft2pADiG9rqhWV4Nm7pyQDFLYCNvFo
         okyPW7k+sAB7pzXkyCVpMfeyj29nxKbyGDE1m6M/3jrUyHlFlNJ/m1WaLdTVYUopk5ox
         lsO9gsZZJMbAUxt4VPy9M+YKdPTUF9n8vXCP644dzTOSMya+t7a0m0j4MDBy/uFck7II
         NzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bVDhPr1NYeKDnrMdcMHlybkPxVb9bTLFPQt8UIwuo9g=;
        b=ZY5R9E3wNQjPXojTE3p8DNcsJEpJxCvD/Nctqgs2FbDdnt/faOjUP0hetJS+aRuCG+
         9BTDXGJrT3x2HvPgRbJQitoiO7ZkATV2xYFbAhK3e9VbfZS7WUGTwTd5EkwXRd8wN2rL
         5CU0BEgQcIPtg5/LPN9tQUOx1ECfDiClvX+vpfuFfOpopiSDxRxG61r0gdqFhag7E1se
         grfdXwYkdOp/uHViv8w5FMdVY32VoyhN9BzztiYdej1k5xtHaLT4TXTuwZxqVo0cX7ZC
         4X9ImA2f+C6JZ94NCE9OzpDzN6NN4osiIbvbq+8Nri54BGNTjwnmnUofTh4hXf02k2vP
         EN+g==
X-Gm-Message-State: APjAAAVD7KTSE9xXvakKtrcQBZ8f7L3WWfuCjbOj9oFYZHi3dPcykckL
        OQWR5BncObsE/HIlK7+bHEL4+w==
X-Google-Smtp-Source: APXvYqx6b8pMO3ob9Z9MsfHZZaYugwvubPmR0cqUGxRbp1KtNkJwzV66jFtpNj7shjptk/+JiMADqw==
X-Received: by 2002:a2e:864d:: with SMTP id i13mr302944ljj.92.1562282064462;
        Thu, 04 Jul 2019 16:14:24 -0700 (PDT)
Received: from localhost.localdomain ([46.211.39.135])
        by smtp.gmail.com with ESMTPSA id q6sm1407269lji.70.2019.07.04.16.14.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 16:14:23 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v7 net-next 0/5] net: ethernet: ti: cpsw: Add XDP support
Date:   Fri,  5 Jul 2019 02:14:01 +0300
Message-Id: <20190704231406.27083-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

This patchset adds XDP support for TI cpsw driver and base it on
page_pool allocator. It was verified on af_xdp socket drop,
af_xdp l2f, ebpf XDP_DROP, XDP_REDIRECT, XDP_PASS, XDP_TX.

It was verified with following configs enabled:
CONFIG_JIT=y
CONFIG_BPFILTER=y
CONFIG_BPF_SYSCALL=y
CONFIG_XDP_SOCKETS=y
CONFIG_BPF_EVENTS=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_BPF_JIT=y
CONFIG_CGROUP_BPF=y

Link on previous v6:
https://lkml.org/lkml/2019/7/3/243

Also regular tests with iperf2 were done in order to verify impact on
regular netstack performance, compared with base commit:
https://pastebin.com/JSMT0iZ4

v6..v7:
- rolled back to v4 solution but with small modification
- picked up patch:
  https://www.spinics.net/lists/netdev/msg583145.html
- added changes related to netsec fix and cpsw


v5..v6:
- do changes that is rx_dev while redirect/flush cycle is kept the same
- dropped net: ethernet: ti: davinci_cpdma: return handler status
- other changes desc in patches

v4..v5:
- added two plreliminary patches:
  net: ethernet: ti: davinci_cpdma: allow desc split while down
  net: ethernet: ti: cpsw_ethtool: allow res split while down
- added xdp alocator refcnt on xdp level, avoiding page pool refcnt
- moved flush status as separate argument for cpdma_chan_process
- reworked cpsw code according to last changes to allocator
- added missed statistic counter

v3..v4:
- added page pool user counter
- use same pool for ndevs in dual mac
- restructured page pool create/destroy according to the last changes in API

v2..v3:
- each rxq and ndev has its own page pool

v1..v2:
- combined xdp_xmit functions
- used page allocation w/o refcnt juggle
- unmapped page for skb netstack
- moved rxq/page pool allocation to open/close pair
- added several preliminary patches:
  net: page_pool: add helper function to retrieve dma addresses
  net: page_pool: add helper function to unmap dma addresses
  net: ethernet: ti: cpsw: use cpsw as drv data
  net: ethernet: ti: cpsw_ethtool: simplify slave loops

Ivan Khoronzhuk (5):
  net: core: page_pool: add user refcnt and reintroduce
    page_pool_destroy
  net: ethernet: ti: davinci_cpdma: add dma mapped submit
  net: ethernet: ti: davinci_cpdma: allow desc split while down
  net: ethernet: ti: cpsw_ethtool: allow res split while down
  net: ethernet: ti: cpsw: add XDP support

 .../net/ethernet/mellanox/mlx5/core/en_main.c |   4 +-
 drivers/net/ethernet/socionext/netsec.c       |   8 +-
 drivers/net/ethernet/ti/Kconfig               |   1 +
 drivers/net/ethernet/ti/cpsw.c                | 502 ++++++++++++++++--
 drivers/net/ethernet/ti/cpsw_ethtool.c        |  57 +-
 drivers/net/ethernet/ti/cpsw_priv.h           |   7 +
 drivers/net/ethernet/ti/davinci_cpdma.c       | 106 +++-
 drivers/net/ethernet/ti/davinci_cpdma.h       |   7 +-
 include/net/page_pool.h                       |  25 +
 net/core/page_pool.c                          |   8 +
 net/core/xdp.c                                |   3 +
 11 files changed, 640 insertions(+), 88 deletions(-)

-- 
2.17.1

