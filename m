Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139513665C0
	for <lists+xdp-newbies@lfdr.de>; Wed, 21 Apr 2021 08:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhDUG5s (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 21 Apr 2021 02:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbhDUG5r (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 21 Apr 2021 02:57:47 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A90C06174A
        for <xdp-newbies@vger.kernel.org>; Tue, 20 Apr 2021 23:57:14 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g16so14509510pfq.5
        for <xdp-newbies@vger.kernel.org>; Tue, 20 Apr 2021 23:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ae/x/cyJrTcEHPxZB2U/PFhUVA4cWJFTj9SeLOaJNkw=;
        b=abwQNiBykGGi4ZWywf9TMJc0GWBDdtE6fwzEq9arvT4uNTvuYXxVRRZzbIWH0P+vMC
         H/UPZJooAtVy6DnbtbkzIxcXmyljOehq6wPRX7YQufcjyu0AtiTAvi1vqr6qassWyfzU
         iD1A0Ids+sSi5iokLFPIU51gAtHShjI3rDd/aYm6y+KFyeZFjXde/OOjCIAozvTigMg3
         YjD69iTZrodOAv5E+94Q6GTSZRgo3Ly6mfd104H7As8PbwRTtFusV4YOf1hgSxw6MGOJ
         NQuw0+fMNNjOS7a1rP1kXLasZIPu8Q4/ASK+UE+YEKSTjpnfa8BOPl7NBoIEmEQDAbSk
         7/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ae/x/cyJrTcEHPxZB2U/PFhUVA4cWJFTj9SeLOaJNkw=;
        b=HH/DDgdAjpL/ILnrV3J4Ak40J1HLWJE9Zlr3vWkP6Hf437g/VIqs775IuPlab/m4wa
         1w4+AAmpbjP0P7coEZwKbX1cyD+DWKCgNzNX4EIW64PdJCkmJTCGLkS8+pytphSh1Hvk
         K+uM76Y3YNB0Sfoe2fcqF6lgs8BAm9AUWrFeTxDKfa62Jd2XjFDCehvVSbxtPkcFx/rB
         dX/6Swrzw1kPDU+7tl54Hzp5DHFh2RzuxP1a/g8MAcsoaU0OQ0yCIbhxJa1++Kvpt5/+
         JoD0nGMOzvtyXfA9g3JwyhCa0Ch0gZu9M3qGx3fbrSPHvbylNQcY94M0aTtkNHsj1loF
         HoOA==
X-Gm-Message-State: AOAM533o7OKOXndwS25qdwue3lgFV9tx8qZOGfpw262hegoB/5WSspVA
        m3Lc6HeqFOULPZg4Daq7repYzbU1buSX2lkTrh4DGVXsmuU=
X-Google-Smtp-Source: ABdhPJxYVmQaC9BhMOgfoL8UrBAh/ZyiR4eChKH4tmGqF36se0IpF64BRtlNH1EyIPX+o67N6mJPefZeVUM9qpF/RQs=
X-Received: by 2002:aa7:828f:0:b029:200:6e27:8c8f with SMTP id
 s15-20020aa7828f0000b02902006e278c8fmr28002521pfm.44.1618988234201; Tue, 20
 Apr 2021 23:57:14 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Wed, 21 Apr 2021 12:27:01 +0530
Message-ID: <CANzUK5-QPBHuGBVvrdcXvsjo2BVcQcfeQrWmZV5__WuhgnpiDQ@mail.gmail.com>
Subject: IRQ assignment for queues
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

Not a XDP question, but more generic about IRQ assignment for queues.

For a NIC which has separate RX and TX queues (no COMBINED queues), I
see in /proc/interrupts that only 1 IRQ is assigned.

srivatsp@EXA8:~$ sudo ethtool -L enp5s0f1 rx 1 tx 1 combined 0
combined unmodified, ignoring
srivatsp@EXA8:~$ ethtool -l enp5s0f1
Channel parameters for enp5s0f1:
Pre-set maximums:
RX:             4
TX:             4
Other:          0
Combined:       0
Current hardware settings:
RX:             1
TX:             1
Other:          0
Combined:       0

srivatsp@EXA8:~$ cat /proc/interrupts | grep enp5s0f1
 73:          0          2          0          0   ITS-MSI 2623488
Edge      enp5s0f1-rxtx-0
 89:          0          0          0          0   ITS-MSI 2623504
Edge      enp5s0f1-rbdr-0
 92:          0          0          0          0   ITS-MSI 2623507
Edge      enp5s0f1-qset-err-0

Is the IRQ for the RX queue or TX queue or both? Does Tx need an IRQ?

Srivats
