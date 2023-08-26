Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB14D7892BB
	for <lists+xdp-newbies@lfdr.de>; Sat, 26 Aug 2023 02:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjHZAbI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 25 Aug 2023 20:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjHZAat (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 25 Aug 2023 20:30:49 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838AB26AD
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Aug 2023 17:30:47 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4109c8ece5aso8746391cf.1
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Aug 2023 17:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693009846; x=1693614646;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X7KC03+GhIOBKk5KznfFsf2qtm4kY6zeqqxFABAbREY=;
        b=rcXJpvYionfN8Ky0IENeimG3U7yVZYrkTAC7BsCZ34OgVdNpN446+/KYeDaz6yEwm3
         rfVdNerQHnoV7gDmKAsxwwmqWQOPfU+u8uWgdWWnePp5WoylUQTGjK8mPR8p7ZokpilJ
         J6eOLFZuWfXqlUz7Xhjdw+z31houE7bwyc/g+MkitTTy6T8oqex9oMy8ODc25N17+uqv
         NDzoBNYWMINJN55tXa3C4Vgz/74bMmIqZJcoq9GCcLwO749GeMphNPjum45KDCZ+j0jk
         29uGj6Iv80kpZsyDkpcdus2bMWMXxLjYfaOpPARTkHJkKfRwT7ziwIGNn9a6z0dccQcR
         PyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693009846; x=1693614646;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7KC03+GhIOBKk5KznfFsf2qtm4kY6zeqqxFABAbREY=;
        b=dCeDGgQaZJSZAeqHM8tJ/kDfY7vQCmv9iOZdPK8jW9inf48VDZh40A1UwazjG0fQIX
         7hYocgVu7Xvy+wn/W57toaUGK3Qs21wb8eul+lQBa0URRF8a2UEdf9FBawbi1r/urUJk
         r++DAEYmzokfVN835z5KNnersA+RPDdbcd+SW0Gn7Di35PfRqqt7YIj3V6JT0GI9+tsv
         o7HWlWKF3I7zklqZYaNbmlQQnsRThlMlEHLDOssuMlYDnMbeIFVPYuOrhH22do9Nyb45
         PExZvngyfGddvEWwFIxBVTA//aSW1OYV+TSHPo5AbYU1x9s6F7lVaCcXvJWeVPrTlEiT
         QxRw==
X-Gm-Message-State: AOJu0Yy2unQsak+RWPS6+ZJtmrZFkRsGVVBvfbJABfNhVoHW6q/rEAgT
        usMUfiS4B/tV23bOreQS9rvPLmNCzwxnmP5kyAwUOFBXN2A=
X-Google-Smtp-Source: AGHT+IE67GoTQd8U8fm3oc8YWLKPBhDZkdkIN68JaMgYhAJ5TArEtBUHVA1uxY2JmdOJYxzmlXizt32P8njkY1P+DXU=
X-Received: by 2002:a05:622a:145:b0:410:adf6:c6da with SMTP id
 v5-20020a05622a014500b00410adf6c6damr12539718qtw.11.1693009846466; Fri, 25
 Aug 2023 17:30:46 -0700 (PDT)
MIME-Version: 1.0
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Fri, 25 Aug 2023 17:30:35 -0700
Message-ID: <CAK3+h2w6E1YXBHPX9wTqqoJo2B68akCmxb7C2rk-rAhJQptbCw@mail.gmail.com>
Subject: XDP syncookie not compatible with layer 2 Linux bridge middle box setup
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I have been experimenting with
https://elixir.bootlin.com/linux/latest/source/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
with suricata in AF_PACKET IPS inline bridge mode, my intention is to
attach the XDP syncookie program to the same network interface that
suricata inline mode runs on so the XDP syncookie could do SYN flood
protection, the packet path is like

client <-->xdp syncookie<-->suricata AF_PACKET bridge<-->server

What I found out is:

1, client send SYN,
2, XDP syncookie respond with SYN+ACK (with cookie), return XDP_TX
3, client send good ACK, XDP syncookie return XDP_PASS, ACK to AF_PACKET bridge

 The ACK from client is verified by XDP syncookie program and passed
on (XDP_PASS) to suricata AF_PACKET and bridged to server, but the
initial SYN from client is not passed on to suricata's AF_PACKET and
not bridged to server, so server send RST to the ACK.

My understanding is that XDP syncookie uses netfilter connection
tracking,  if the packet  destinationated to the host, it works fine.
But in layer 2 middle box bridge scenario, AF_PACKET bridge by
suricata or Linux bridge does not know  about the initial SYN (XDP
syncookie returns XDP_TX). I am wondering if there is any solution to
get this work.

If I run a firewall based on netfilter/iptables as a middle box, XDP
syncookie attached to the firewall network interface works to protect
the server, so my assumption is since XDP syncookie uses netfilter
connection tracking, layer 2 bridge has no visibility to the
connection tracking and initial SYN.

Thanks!
