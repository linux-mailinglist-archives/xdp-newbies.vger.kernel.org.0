Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1CD13B3D1
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Jan 2020 21:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgANUwj (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Jan 2020 15:52:39 -0500
Received: from mail-qk1-f176.google.com ([209.85.222.176]:42813 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbgANUwj (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Jan 2020 15:52:39 -0500
Received: by mail-qk1-f176.google.com with SMTP id z14so13536142qkg.9
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Jan 2020 12:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=OwwPbCeUfisztwKtkp1kwqjVh4Rn2TrKdhKRunw4qTg=;
        b=owA9TXev0ynoPY5/fs5P2NeieqwaxTBzdcCO0d0aOPkS/MsOmms4EnFHjGpdVtSd0c
         YdnZgi4gc2YCjdl+v/+nLVonhT7Uw6cLKYiiajFgViUpz0bEU0ypuI5bf1hhFgeEZxyc
         wqD3vzWESnhslO7fcNcakhhebFOCCMXiFNGZ4VFDvKAYgk4JYv2lH7xJkW06jyCh2f1O
         9KwDSwSmHEPgs5WWyRKWQvHeI3ccDLAJREJdjAza6gFfC/J4XdBqjIgtnivnv+7SR5lg
         sax3YYjzxQZM6fTTk6c+a0O2/O13SJ0E9uqN9E5lzZtN58oSJPnCgxdyrPI4D7Xg8XpL
         3xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=OwwPbCeUfisztwKtkp1kwqjVh4Rn2TrKdhKRunw4qTg=;
        b=JN+ZJ1127GR9mmt3LCV43OUJBJmWgrjZa/0VkEfL81uvQcUerRwnN8OHaWafwYQIpl
         eQBUQMZcfc47Fin+pTCt75n7Fd/iuVqrOVgW3gnnTo8Tq5ylBO8YzAReRZ6SveNvOPd1
         epyAk8jvwsZbiUvq0zv7uVXC2TXZ47d6l1BqEjxDEk3q3fwXo/2MWzBTrGjyaJ+4It1y
         4Vq8JNg3bj/6snmYZt5G8Ogwhvcri+gFA5F2yev5OERyP9JVdRNz3XtZz2ZbQjqjJ9f2
         WPT26pSD1ultaop0jdqdT88bg+b7IKs7psJEa+bQXg7x3un2Z28dZmmkblMV4TVGOZat
         i1kg==
X-Gm-Message-State: APjAAAXwNAUYW27BfATS5SH6sDJZEqHpRc7XzQes2Afx4KETavN4dz3i
        ixwRamJC5nxkspSb5uoAwsOm+N+mQYg=
X-Google-Smtp-Source: APXvYqynutnA+sbdE2SVyv8nrRu813yrJXVm7ZOhrpBcHreIYlVkEG1CmlHHbpZjYRl1IoG8YgSbfw==
X-Received: by 2002:a37:6451:: with SMTP id y78mr18838088qkb.499.1579035157171;
        Tue, 14 Jan 2020 12:52:37 -0800 (PST)
Received: from neptune.home ([206.174.180.53])
        by smtp.gmail.com with ESMTPSA id t38sm8314020qta.78.2020.01.14.12.52.36
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 12:52:36 -0800 (PST)
Message-ID: <242dfd7986c0d382f80462f5ce0cbe8a69fac2cd.camel@coverfire.com>
Subject: AF_XDP with Rust
From:   dan@coverfire.com
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Date:   Tue, 14 Jan 2020 15:52:35 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

https://github.com/aterlo/afxdp-rs

afxdp-rs provides a Rust interface to AF_XDP. The docs.rs build is
broken right now but at high level this provides:
- Mem mapped area
- Umem (completion queue and fill queue)
- AF_XDP sockets (Tx/Rx, Tx-only, Rx-only)
- Buf (to represent a packet). Templated to allow user customization.
- BufPool to manage Bufs (this doesn't do much in the sample programs
but is useful in more complicated scenarios)
- 1 link and 2 link forwarding examples

Performance

Test System:

* Intel(R) Xeon(R) CPU E5-2680 v4 @ 2.40GHz
* Single X710 (4 physical 10G ports) (i40e)
* Kernel: 5.4.2-300.fc31.x86_64
* Kernel boot args: skew_tick=1 mitigations=off selinux=0 isolcpus=4-27 
nohz_full=4-27 rcu_nobcs=4-27 default_hugepagesz=1G hugepagesz=1G
hugepages=4

Traffic Generator:

* Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz
* Single X710 (4 physical 10G ports) (i40e)
* Traffic goes from one port, through test system and to second port on
the same X710
* T-Rex traffic generator (https://trex-tgn.cisco.com/) (DPDK)
* 64-byte UDP packets

Scenario 1: l2fwd-2link on a single core running userspace and NAPI

Small amounts of packet loss start at about 6.5M packets-per-second
(PPS) unidirectional and 6.0M PPS bi-directional (3M each direction).

Little effort has been put into optimizing this so I expect there are
some easy performance wins still.

