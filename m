Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD2B46CEA
	for <lists+xdp-newbies@lfdr.de>; Sat, 15 Jun 2019 01:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfFNXYb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 14 Jun 2019 19:24:31 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:39895 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfFNXYa (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 14 Jun 2019 19:24:30 -0400
Received: by mail-qt1-f182.google.com with SMTP id i34so4435819qta.6
        for <xdp-newbies@vger.kernel.org>; Fri, 14 Jun 2019 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UkC9FYGSF2llwJZNJzUFQHwzavdVgiGJzNYSLlnsJ9w=;
        b=Hpg44ZJRfStZsJo6t05T9P4bGPunYeVziLoOu3aPBkY5GA1EAKEengBPXKFTtTl7+y
         e+LoOHu5toXkrrm3kX9wTc8csbCXBTWBsAdswAWcwVobxdWRGkO3s8fs2iGa4xiJ2Yas
         aVHA1k+VhaLnCBQw68IuG+J8R27pbBIsmCx6GRzU1N/R19lH5VJUQ02k41ZKO4XbBPWq
         P2bFEWOF2j1OJ/lBn+BdtRTd3SzI5yWj9HskbAocWg1u+gTBYGeTV0AnhBkjJ8t5bi7/
         YcGxSkKHUgR8UWAazUOvMsapr6BzrTjHsj5zd2K4N9hIY/O9DR0rYasI6W/eZrc/XwY6
         /Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UkC9FYGSF2llwJZNJzUFQHwzavdVgiGJzNYSLlnsJ9w=;
        b=PknJDY44R4oOJ8erRpeEcypki5t3pI+0hP23BSlDm2hqROQGhk+6ZnHSn9GIMGnWEJ
         oB0mBb/Ymcp0RXdrDU4H/xLgLkzZ8wqLXGI7L7yvu1IRDNM+izAg8WIoJ91wN851eHNJ
         6RRxd6fcEwUOYmlB9KrYpPnJcFD5x3Twv1XuxNzaq7wiu5Cz5v+2HvHzq9I++KTgA1CN
         4+DHHZLvjyifEVWXd0LcduVMX84D1rgJfc4BvLbrbSqutPk4BJyRvWPbDlcCnQLnIw1L
         cxrjw18eCBHkHh7MTv1ImdGzoP1q2uAoJ4qB8XzqpsvJnAtbuZQbZ/6q0PxmggSfBosm
         eHWw==
X-Gm-Message-State: APjAAAU6ZUfaMzCwa4PceqRpuD+26z3uRb9zTNNIy8xWhNiln/rMHY2o
        IDoqrpuGbZsdJPTjBI0I4+o2GBnDgjciGA2WfEHfyNdS
X-Google-Smtp-Source: APXvYqw9xVc462kghDw99ojfop+y3QrpOZxuVNyNPuKZfViIBud6FVfUCb7797EvJDSv57oN2lSij7yLe1No3BwuA28=
X-Received: by 2002:aed:2a43:: with SMTP id k3mr84128065qtf.301.1560554668839;
 Fri, 14 Jun 2019 16:24:28 -0700 (PDT)
MIME-Version: 1.0
From:   William Tu <u9012063@gmail.com>
Date:   Fri, 14 Jun 2019 16:23:52 -0700
Message-ID: <CALDO+SYgZ1ZJx31iU+ZNnd5v3-V0kWwT3nqk+X6NuD8VWk1Tnw@mail.gmail.com>
Subject: Question/Bug about AF_XDP idx_cq from xsk_ring_cons__peek?
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

In my implementation[1], I'm doing s.t like
    tx_done = xsk_ring_cons__peek(&xsk->umem->cq, BATCH_SIZE, &idx_cq);
    if (tx_done > 0) {
        xsk_ring_cons__release(&xsk->umem->cq, tx_done);
        xsk->outstanding_tx -= tx_done;
    }

I expect if tx_done returns 32, then after calling xsk_ring_cons__release,
the next time I call xsk_ring_cons__peek, I should get idx_cq + 32.
However, sometimes I see the same value of idx_cq is returned as previous, even
when tx_done > 0. Is this the expected behavior?

I experiment with xdpsock_user.c with the patch below and run
~/bpf-next/samples/bpf# ./xdpsock -l -N -z -i eth3
using bpf-next commit 5e2ac390fbd08b2a462db66cef2663e4db0d5191

--- a/samples/bpf/xdpsock_user.c
+++ b/samples/bpf/xdpsock_user.c
@@ -444,6 +443,8 @@ static void kick_tx(struct xsk_socket_info *xsk)
        exit_with_error(errno);
 }

+static int prev_idx_cq;
+
 static inline void complete_tx_l2fwd(struct xsk_socket_info *xsk)
 {
        u32 idx_cq = 0, idx_fq = 0;
@@ -463,6 +464,15 @@ static inline void complete_tx_l2fwd(struct
xsk_socket_info *xsk)
                unsigned int i;
                int ret;

+        if (idx_cq == prev_idx_cq) {
+            printf("\n\n ERROR \n\n");
+        }
+        if (idx_cq - prev_idx_cq != rcvd) {
+            printf("\n\n ERROR request %d return %d idx_cq %x prev_cq
%x diff %d\n",
+                   ndescs, rcvd, idx_cq, prev_idx_cq, idx_cq - prev_idx_cq);
+        }
+        prev_idx_cq = idx_cq;
+
                ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx_fq);
                while (ret != rcvd) {
                        if (ret < 0)
@@ -599,7 +609,7 @@ static void tx_only(struct xsk_socket_info *xsk)
        }
 }
Most of the time idx_cq - prev_idx_cq == rcvd, but sometimes I got:
 ERROR request 64 return 64 idx_cq 107f54 prev_cq 107f50 diff 4
 ERROR request 64 return 4 idx_cq 2df794 prev_cq 2df754 diff 64
 ERROR request 60 return 60 idx_cq 2df798 prev_cq 2df794 diff 4
 ERROR request 64 return 64 idx_cq 2df7d4 prev_cq 2df798 diff 60
I wonder if it is a bug?
[1]https://github.com/williamtu/ovs-ebpf/blob/afxdp-v11/lib/netdev-afxdp.c#L719

Thanks
William
