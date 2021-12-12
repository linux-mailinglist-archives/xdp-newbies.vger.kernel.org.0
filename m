Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E02471B0F
	for <lists+xdp-newbies@lfdr.de>; Sun, 12 Dec 2021 16:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhLLPGp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 12 Dec 2021 10:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhLLPGp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 12 Dec 2021 10:06:45 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2022C061714
        for <xdp-newbies@vger.kernel.org>; Sun, 12 Dec 2021 07:06:44 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id np3so10136246pjb.4
        for <xdp-newbies@vger.kernel.org>; Sun, 12 Dec 2021 07:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=P3LiVYWBTN98ZaN5+SaV9g1f0WRmk+tmJHaOsz6c7iU=;
        b=lpVf8OqtdsuKyKV04qriucak7qijpzCa9zd5ayDzC5sJob11pv7Yt2cTyRRoBLl/tf
         FPn0BLlHPFuGwLsxbYB7EDjRZnwif0ANTqPsl/5z6w4XLhMzOFOwUMZTT9Bsb5jxVwDz
         JphDtcnJHhf3egzMaw2/zJrAn+A7mteqwICVPPCCvQLKWfGzzARAfljM3qZ97YQ9jxAI
         /K8wQjreA8vBKg7dTOmvV9GHwz2xHrxQXUd4OZCyuEGvLZvIW2/PxVB+0LeYQOxjPAMQ
         iBRRXQnUXwL6hF3Do4o3IQhCd2kJUwqT+FWD5waG8lhDe3xUNDssUG5vDRRD2VESGB/p
         h0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=P3LiVYWBTN98ZaN5+SaV9g1f0WRmk+tmJHaOsz6c7iU=;
        b=yD9OcWsmwhVKG5J48NSieC7G9prvDZlJtnDSVhXnTNLp1rtFICMWo75BGbFwyQDCN5
         tu2oerWWTVWJ9Gs79sxU7FpHj1PSbZW28UlilrR9ZwF0OEyw++RI8S9NtobJkoR66NWQ
         K1l4GjDN1l6pD3y2Gzs9/IMyrYboKtm6irWvNmn+/Sd+0Dtvzwg1CEWldjrgNZIDhf3f
         QE8iTwxjEBCMg/419YgPB/nk6zj8qtKvmD98dhSPKft9O+rD3qZSzPG/2yHZKhOUuaPQ
         YviqhtbCZ2o7EVW8f+1I64k/eNgAqJoCDVvZzUs2nZc09tFFblgqQZkrPGoZ4MO5rCFa
         H8vA==
X-Gm-Message-State: AOAM532HgzU/SR+NUklm3Qib57wKvAhVEg49cyGro48W+P5lsBRAHpcG
        hqDs7U9PIyFM5O7/goYeuA8oRhhQbPh4Ba/X6p6YEo17P6I=
X-Google-Smtp-Source: ABdhPJwM128/PRBnS4TiNrewOZQCYPc77OXrEoF5nWPgQlFttKY/cgY8w2mH0rEFa0yCvk5AiJBCe3zwt63xYwrh3B0=
X-Received: by 2002:a17:902:e749:b0:141:edaa:fde1 with SMTP id
 p9-20020a170902e74900b00141edaafde1mr89865680plf.72.1639321604120; Sun, 12
 Dec 2021 07:06:44 -0800 (PST)
MIME-Version: 1.0
From:   Lorenzo Mainardi <lormayna@gmail.com>
Date:   Sun, 12 Dec 2021 16:06:33 +0100
Message-ID: <CACLEbghzZw=cxAZGxU4fYqfUeojw1yt9RF0cHBiDOux0K0=LaQ@mail.gmail.com>
Subject: Newbie help
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everyone,
I am trying to follow this tutorial
(https://developers.redhat.com/blog/2021/04/01/get-started-with-xdp)
to learn XDP.

So I compiled my XDP program and then attached it to an interface:

lorenzo@kwaremont:~/progetti/xdp_test$ ip addr show eno1
2: eno1: <NO-CARRIER,BROADCAST,MULTICAST,DYNAMIC,UP> mtu 1500
xdpgeneric/id:37 qdisc pfifo_fast state DOWN group default qlen 1000
    link/ether 8c:dc:d4:8e:38:c7 brd ff:ff:ff:ff:ff:ff
    altname enp9s0
    inet 10.0.8.1/24 scope global eno1
       valid_lft forever preferred_lft forever
lorenzo@kwaremont:~/progetti/xdp_test$ ping 10.0.8.1
PING 10.0.8.1 (10.0.8.1) 56(84) bytes of data.
64 bytes from 10.0.8.1: icmp_seq=1 ttl=64 time=0.047 ms
64 bytes from 10.0.8.1: icmp_seq=2 ttl=64 time=0.033 ms
^C
--- 10.0.8.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1018ms
rtt min/avg/max/mdev = 0.033/0.040/0.047/0.007 ms

Anyway, it seems that the program is not dropping packets. Is there
any way to troubleshoot it? Where am I wrong?

Thank you

-- 
LORENZO MAINARDI
