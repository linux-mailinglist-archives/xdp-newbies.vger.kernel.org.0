Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2DB0301D3
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 May 2019 20:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfE3SVr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 May 2019 14:21:47 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34747 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfE3SUv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 May 2019 14:20:51 -0400
Received: by mail-lf1-f67.google.com with SMTP id v18so5804372lfi.1
        for <xdp-newbies@vger.kernel.org>; Thu, 30 May 2019 11:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8x97jd39TwyBk8v0q4IVmayr713NLQSBbX6u/ZPdPME=;
        b=qUINiA4ttbzBtbe1hlkF3Nw+walwKPKkCWoqKpBx5LsOqYa9O8VkD3su5CoY7cmEpv
         sgoUuAMAqL7oUQ3pq0y/mNdHF0vxBxthSplDF5bOmjYiTbcfaiyDm8+FCeCgCD89vMFs
         o5bCIcAltuCh7c/TMagy62EwPDHKdf6NP4tU/AhF73C7sSCTKXiF6Q0XmE7DmrkjVaql
         6Ts21LwqV/nGuAiyDjT6jtRHz4x+vB/83M6hUPrIvD0djrh4cya/WOQG+zb1YvjXmhtc
         DKM4aJZJhuxlWhYQ41SmVt5mxZSowZxZwn35scDT3sVdR5H7FJtheqvfkmJ2xLUaXJXZ
         6aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8x97jd39TwyBk8v0q4IVmayr713NLQSBbX6u/ZPdPME=;
        b=I/i0TTjiSk4LxeSYyw/yLY5wdhsmxkAkzR+V3gXby00isArdpsObS1McHAeEt++IR3
         3OsGKCb3/3CmT6ThxbV1NCVZBsR7BcU1e+29DpLRemsOQz0u9v+zEYDlJ1a3v5rj2nZC
         Id0MBbFt2mb3L49LgGI3IOgz6SPptA7zEApBYrH5MBPpaj+H/k7KrsItYbR+WQtT/PuB
         HNpswYDMvr8wVftegidIfJsS5sFh7WZ6dCOEL6AwXAKW2XglnOMJxHTeyCJvBMC64hmr
         8Kdh/AiMRypqdiqEbw032YCqfqB6hCpzdsItq/qZ2TAsT7NeVFpxZtFC8wZyLIv386Jv
         nI2A==
X-Gm-Message-State: APjAAAUePvkFY/yFOHka6ummNOLyGX2juVZXegGZNWJLgSZ8WtbwEI5c
        VYtgH+wB1VPV6K0rnm+DJZKdSQ==
X-Google-Smtp-Source: APXvYqwkzz3vxranwYdEP7uuv1JNKx8JMvIdv7IdoppufWr3JFhZFcY716iTa5IT+G6Bn2TcmtwUTw==
X-Received: by 2002:ac2:5922:: with SMTP id v2mr2926685lfi.180.1559240449769;
        Thu, 30 May 2019 11:20:49 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id v7sm388946lfe.11.2019.05.30.11.20.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 11:20:49 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 0/7] net: ethernet: ti: cpsw: Add XDP support
Date:   Thu, 30 May 2019 21:20:32 +0300
Message-Id: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
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

Link on previous v1:
https://lkml.org/lkml/2019/5/23/795

Also regular tests with iperf2 were done in order to verify impact on
regular netstack performance, compared with base commit:
https://pastebin.com/JSMT0iZ4

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


Based on net-next/master

Ilias Apalodimas (2):
  net: page_pool: add helper function to retrieve dma addresses
  net: page_pool: add helper function to unmap dma addresses

Ivan Khoronzhuk (5):
  net: ethernet: ti: cpsw: use cpsw as drv data
  net: ethernet: ti: cpsw_ethtool: simplify slave loops
  net: ethernet: ti: davinci_cpdma: add dma mapped submit
  net: ethernet: ti: davinci_cpdma: return handler status
  net: ethernet: ti: cpsw: add XDP support

 drivers/net/ethernet/ti/Kconfig         |   1 +
 drivers/net/ethernet/ti/cpsw.c          | 537 ++++++++++++++++++++----
 drivers/net/ethernet/ti/cpsw_ethtool.c  | 136 +++++-
 drivers/net/ethernet/ti/cpsw_priv.h     |  12 +-
 drivers/net/ethernet/ti/davinci_cpdma.c | 122 ++++--
 drivers/net/ethernet/ti/davinci_cpdma.h |   6 +-
 drivers/net/ethernet/ti/davinci_emac.c  |  18 +-
 include/net/page_pool.h                 |   6 +
 net/core/page_pool.c                    |   7 +
 9 files changed, 710 insertions(+), 135 deletions(-)

-- 
2.17.1

