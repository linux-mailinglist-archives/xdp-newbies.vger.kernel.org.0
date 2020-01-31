Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B8614F3D1
	for <lists+xdp-newbies@lfdr.de>; Fri, 31 Jan 2020 22:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgAaVdl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 31 Jan 2020 16:33:41 -0500
Received: from mail-vs1-f41.google.com ([209.85.217.41]:46243 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgAaVdk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 31 Jan 2020 16:33:40 -0500
Received: by mail-vs1-f41.google.com with SMTP id t12so5281866vso.13
        for <xdp-newbies@vger.kernel.org>; Fri, 31 Jan 2020 13:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=M/Eo190S9PJ9KkbqJwsmHtw+piNIWXjN0EFnTUhIt74=;
        b=HKNXkKlDIDVwwvnjFFOsdIyU3KYPkILpZX2IFOucLHKcTIlZeB4dWhWwjF1KFPqAt6
         PAfWxcoGGw/tMDlG4yKcHyhX+LRii5xCJX44tXHsNIegDjMevZff/ZaN2roSuJfRevOf
         YI/vyzou15Lyv7TXpLOVpz5wtF2S6hxKOMWMWeywScdVi7nFKTZzvfmvx2VAk/iaWdjD
         nyzux2oLgKJSHWdIDu9AVho/5tI4RpTHKfXRzetDKH3NND2Ftk2Zh2ag/POT6ztLqyN5
         A0Wnepz/bSG6SBvhU7AfokPhJkz87tE18Kd3smZB9sdLt5Y3QIYLLilJ+ZRbKWI8tNMe
         KcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=M/Eo190S9PJ9KkbqJwsmHtw+piNIWXjN0EFnTUhIt74=;
        b=jnGFsVi/HuaRPfU1j+uBbsfundKOYoCtgDdQdXJp4o7D5N5CIC19VWBXT7SVyBCMOk
         m5xBOOMLNYbnGEFfHBbbY6LdYwBgmnfviefXpTUR53rKW8GMXNiHhbkBczvNpA5APrbj
         8kUHSKsl4699x+kA6ZgDczSWiY658mrrQYXEcldEIx3L1TI/QoqcQmeg54NzEd+RKf/w
         sJZv80aw0U7t1v67NGFuHH5sA3itovar3utgcRA4U7JO1IukxmZk0JHkd/o2AGVqEuwQ
         86GsP96jPNeoATHRtrW9RszKqkdvF8BHtJwIjPcxLVJ8Yzd04L9jF1bUhaSUIxQAI76c
         JsUQ==
X-Gm-Message-State: APjAAAUDe0na3MOtZkKAt6yG7s/a97CGzrcqk5G8yPgbyebtL3XlKOue
        Xij5WEtn1C76NN8tJZ+X1SIUCOTmzFWFImDDyT703pC5Lxs=
X-Google-Smtp-Source: APXvYqyHjfDcrzHjiXwPyUaqansB082BJjPIroSfBrDzVFDpGImMBJSbNafGvUk76g9PfE31oFhBG267KD+EUrzz2/o=
X-Received: by 2002:a67:f6c8:: with SMTP id v8mr8165785vso.147.1580506419481;
 Fri, 31 Jan 2020 13:33:39 -0800 (PST)
MIME-Version: 1.0
From:   Elerion <elerion1000@gmail.com>
Date:   Fri, 31 Jan 2020 13:33:28 -0800
Message-ID: <CAMDScm=w_B-tqTaoUCQiYiUEye4WO_sVfAA741XRLzAQEdwxKg@mail.gmail.com>
Subject: Packets randomly dropped with virtio-net with xdp loaded in native mode
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Not sure if this is a known issue or if I'm doing something wrong, but
when I tried to load an xdp program in native mode, my server starts
randomly dropping packets while there are no issues with generic mode.

bpf_set_link_xdp_fd(ifindex, fd, XDP_FLAGS_DRV_MODE); // drops packets
bpf_set_link_xdp_fd(ifindex, fd, XDP_FLAGS_SKB_MODE); // doesn't drop packets

Guest
5.0.0-16-generic #17~18.04.1-Ubuntu SMP Mon May 20 14:00:27 UTC 2019
x86_64 x86_64 x86_64 GNU/Linux

00:03.0 Ethernet controller: Red Hat, Inc. Virtio network device
        Subsystem: Red Hat, Inc. Virtio network device
        Physical Slot: 3
        Flags: bus master, fast devsel, latency 0, IRQ 10
        I/O ports at c000 [size=64]
        Memory at febf1000 (32-bit, non-prefetchable) [size=4K]
        Memory at fe000000 (64-bit, prefetchable) [size=16K]
        Capabilities: [98] MSI-X: Enable+ Count=18 Masked-
        Capabilities: [84] Vendor Specific Information: VirtIO: <unknown>
        Capabilities: [70] Vendor Specific Information: VirtIO: Notify
        Capabilities: [60] Vendor Specific Information: VirtIO: DeviceCfg
        Capabilities: [50] Vendor Specific Information: VirtIO: ISR
        Capabilities: [40] Vendor Specific Information: VirtIO: CommonCfg
        Kernel driver in use: virtio-pci

Host
Unknown. It is a server from vultr.com
