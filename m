Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19BB369658
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Apr 2021 17:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhDWPo4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Apr 2021 11:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbhDWPo4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Apr 2021 11:44:56 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969C7C061574
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Apr 2021 08:44:19 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id y32so35447592pga.11
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Apr 2021 08:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=giEh9eOq7DHfbie5PDBvCoHhgaudbtzBlJ4CJSyghwo=;
        b=LGYEyXkOPNDvXtgg04HOxASnoScGlDTJyc40nwdGT4kMl5MKa9vZJi+UMlkoNxJErs
         Mtk+UMkQaS2Yp2uc4CtdbXfY+KjahvwZBmmJP4gRau7thPgtDvJggAgYO4Ov0I5CLUEm
         0OEpmsEjGyZMMkSVFFQi2y7uHaUdS2LGivBkEVbbDaStJlJFclikU8u8ehxW5DoTqjFA
         77yZNr9p4DMZTxV1WXrkJWLV5arqro7MZ14z2ojsMnCINmS5rca9xqvCD4B0Qr//YsG/
         08ZbYntS540EgYZ2dRzr4U8Jb18SRgccPG0pDsaNsPma9DEt5z1Ms/REn4V9Ah33Xk9C
         sSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=giEh9eOq7DHfbie5PDBvCoHhgaudbtzBlJ4CJSyghwo=;
        b=BfmTeZLZMgwWXf+x/ltdBRYSRQ9eDFXhUuLNQtwyNW9iZxNjZO6FsjdZZaOd32FaNg
         TBRKBB3XrwGxIO/ZYssbnp/AaikW0vsZrrI6sG/lqWH9u0IcuZNWjdK5VyeyixN0l39y
         ZPbD4qndWHNEoVuPaNxSR3f8VKPv+2MhQS6bfjBwohMIvwBh5NiAcyaSQndpjsIqbgg5
         IobqKc6PiHkCJn8lfpLQxvEw2sPFWGVEf2aYrH8vdTgBMyjKHulSwGrDjA23h036IqtD
         3+1ubwdVTr18kWqISmPjFoL5SoeKIGB5lRM2cBMfrzcA58QLwCMbhy0mJQRxf5SeLfiX
         y1BQ==
X-Gm-Message-State: AOAM5324/MUvavf6yjA/VGmkKMrnU1Ms2DUlZgcWnjM/PZsV3aMuZEg+
        RcEC5KM8JEdpWoFCuzeHppDT/QOO+a2awh215j5+msv2Luk=
X-Google-Smtp-Source: ABdhPJwwpjxcULG7TxoeDoCE9lR/+ACmk1jNThTMlmMiOKniJna7d8rII1DUpGXBwKL43/vMpu/zyDx11gA7G8rVnM4=
X-Received: by 2002:aa7:9af8:0:b029:25b:7027:9992 with SMTP id
 y24-20020aa79af80000b029025b70279992mr4389035pfp.12.1619192658876; Fri, 23
 Apr 2021 08:44:18 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Fri, 23 Apr 2021 21:14:05 +0530
Message-ID: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
Subject: AF_XDP sendto kick returning EPERM
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I'm using sendto() to kick tx in my AF_XDP program after I submit
descriptors to the tx ring -

ret = sendto(xsk_socket__fd(xsk_), NULL, 0, MSG_DONTWAIT, NULL, 0);

However, I'm receiving EPERM as the return value every time. AFAIK
this is not an expected return value. Since this is with i40e, I
checked i40e_xsk_wakeup() - but that also doesn't return EPERM. I am
running as root and I don't see any problems with creating the xsk,
configuring umem etc.

Also, no packets seem to go out either.

# uname -a
Linux Ostinato-1 5.11.15-1-default #1 SMP Fri Apr 16 16:47:34 UTC 2021
(64fb5bf) x86_64 x86_64 x86_64 GNU/Linux

I don't see the problem on another machine with i40e but older kernel 5.4 series

Any suggestions on what to look for or how to proceed?

Srivats
