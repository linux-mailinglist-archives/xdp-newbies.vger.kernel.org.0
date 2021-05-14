Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FD0380D4A
	for <lists+xdp-newbies@lfdr.de>; Fri, 14 May 2021 17:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbhENPhD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 14 May 2021 11:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbhENPhC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 14 May 2021 11:37:02 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A74C061574
        for <xdp-newbies@vger.kernel.org>; Fri, 14 May 2021 08:35:51 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id p8so28378378iol.11
        for <xdp-newbies@vger.kernel.org>; Fri, 14 May 2021 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=h9yPKH6H7vDsOiFVe/XjgaoXbEbiwKsPehVM4KnxEHg=;
        b=qRliOnEKlihnGMKV/PiFJgs8hGXM2XsrbP3ZI6Ld/oqeW2pzSnGmeqkpRQPBEceESF
         BIBHxqzkghXeDksCt/G7sIcSyU6KsMxQ90rL4dQoFUIpzejG4w7OqgnQekfeA5++Udb9
         o+rVIndEX6DQFW4H363GYYY5Snsd7L9Of8vQXjwIzl43Ia4ePe7Z4NRJkGPe+HralDNx
         Rtt8GKPTkPqkKa3ibU8Lq2km8hjZObDeyNrGIqsiSpXbEyDxxl9IRIjyBvr5xOHfvhZL
         wJzrRJ5JqNtmfoid87BLc4bnhvWQQC20rm5P29s3nV6lGrUDg6lq1kBjKxMmpGj9Dqmc
         Swuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=h9yPKH6H7vDsOiFVe/XjgaoXbEbiwKsPehVM4KnxEHg=;
        b=VnEXev+8pq16k9vVFWHGJ1PZj9dEW21vxNG2djg6gPueC7kdrpWXTrI6SU5tatfnK4
         wWME4JBawt5+9vPKxG9qUU2xrz0p+RlcuLQfEYZXBsQS0Hi6RZFvzihwH4z4R6CSutNz
         l2YoST6kJEGJiljKbdNRX8I1kWV9gcpjaBU3JcaszllT15ZpAT64lUpKn1GFSL1wLnNf
         wW8sBpaPZi7wY8TBwoyp0zWysZzy1pFpE+K7k+3Ea49V8ofTHui3YcWhoxFCdBAzjmYc
         uSWK6KylMoNS7B6JqZuLGYpcJQNH7+Zgjt70JzkgltlRwl82C4EQxmYC0cUbFy5J94p5
         dqWw==
X-Gm-Message-State: AOAM533z//3jsI16OZ2WjLgY5h1frrauX+8kLUvcUblIKN/p2c2zwvpA
        Esaq9BjlD45V4TU0sxFcZjWOUuBxtDY/I12OsRaEfR+q9K4=
X-Google-Smtp-Source: ABdhPJwpUbgNT0uISqz7b8Z+XlC/5pOX/Dz8QhADD7lbXmyFUqG2Yd79QPr6hzUDpnLdaY2vhP9iSd4oK1bgoGxPysg=
X-Received: by 2002:a02:ca0d:: with SMTP id i13mr43156897jak.98.1621006550492;
 Fri, 14 May 2021 08:35:50 -0700 (PDT)
MIME-Version: 1.0
From:   Alexander Petrovsky <askjuise@gmail.com>
Date:   Fri, 14 May 2021 18:35:39 +0300
Message-ID: <CAH57y_Q9-cDpG1GwPoXEe7W1uDYqV=uUWQi-zuxbLWgfBv11kg@mail.gmail.com>
Subject: CPU utili incr on kernel migration 4.19 -> 5.4
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello!

Recently, we tried to migrate from the kernel 4.19.125 to 5.4.17.
During stress tests we observe that on the same hardware (we are using
virtual machines in our on-prem cloud on VMWare) and using the same
XDP application, on the 4.19.125 softirq CPU utilization is 23% vs.
the 35% on 5.4.17. Please, note, we are using the FIPS on 5.4.17
kernel.

At the first glance, using linux perf I see some difference, but can't
understand them:

5.4.17 perf top -a

   11.90%  [kernel]                                [k] lookup_nulls_elem_raw
    8.79%  [kernel]                                [k] __do_softirq
    4.97%  [kernel]                                [k]
_raw_spin_unlock_irqrestore
    3.62%  [kernel]                                [k] memcpy_orig
    3.39%  bpf_prog_2e039a5b937c8960               [k] bpf_prog_2e039a5b937c8960
    2.66%  [kernel]                                [k] native_write_msr
    2.34%  [kernel]                                [k] vmxnet3_rq_rx_complete
    1.87%  [kernel]                                [k] arch_local_irq_restore
    1.71%  [kernel]                                [k] __htab_map_lookup_elem
    1.33%  [kernel]                                [k] page_frag_free
    1.31%  [kernel]                                [k] kmem_cache_free
    1.28%  [kernel]                                [k] vmxnet3_poll_rx_only
    1.13%  [kernel]                                [k] finish_task_switch

4.19.125 perf top -a

   12.90%  [kernel]                                [k] lookup_nulls_elem_raw
    9.11%  [kernel]                                [k] __softirqentry_text_start
    4.36%  [kernel]                                [k]
_raw_spin_unlock_irqrestore
    3.66%  [kernel]                                [k] memcpy_orig
    3.03%  [kernel]                                [k] native_write_msr
    2.69%  [kernel]                                [k] vmxnet3_rq_rx_complete
    2.34%  [kernel]                                [k] _lock+0x800000005cc2
    1.91%  [kernel]                                [k] arch_local_irq_restore
    1.53%  [kernel]                                [k] __htab_map_lookup_elem
    1.36%  [kernel]                                [k] __slab_free
    1.31%  [kernel]                                [k] vmxnet3_poll_rx_only
    1.24%  [kernel]                                [k] page_frag_free
    1.14%  [kernel]                                [k] finish_task_switch

Could you help me please to identify softirq CPU utilization increase?

-- 
Alexander Petrovsky
