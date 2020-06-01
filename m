Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B0C1E9F7D
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Jun 2020 09:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgFAHuf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 1 Jun 2020 03:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgFAHue (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 1 Jun 2020 03:50:34 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A292C061A0E
        for <xdp-newbies@vger.kernel.org>; Mon,  1 Jun 2020 00:50:34 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id z5so8357760ejb.3
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Jun 2020 00:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=YZMsgDmN8EbUZIBgphev8M/Av8Fo3XM81aNC26/Opno=;
        b=L+p2LurdSIkz+Zfnkkx5T+TQVWhjUpL0skva98wg5WeQADOQKPgL5z8+SzGuGU1hcM
         aMwMPwmui+PNMF38C8CHU9Hyr7AOUR29OJydRMM2OhLUt3WUkgez63YYs+aNzC5CpH7W
         pEccFgZogJf6rjvDUoodA1x++oxWJ0Z/pfZ7zO07CUZcrNmiMB+8TwgK1yziAJNSZvYT
         yd8zvY8chfLMYB8z/deJrcoMZ25tO7DYFqewcLv/+xfuQMUcEPCT3EX6Dvewe2UqiRt5
         QEc73PLthLmUox8wCeRSx3526f0nOgc6QvwcqopuTI3dM1fWvDgFmFtm0ssU8hR85rmw
         brIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YZMsgDmN8EbUZIBgphev8M/Av8Fo3XM81aNC26/Opno=;
        b=kuBu6DyMYf1ot5Q42f1NMY4hWIvZRSv5znT1l/bkFmlYKeojZ+zkHUNnGzjxvmihpn
         Kbb58WfOTYT2LErkRtqeMfJ+F3QeI9KbGgyr7jxcE8zn9S+U0axdu8koC3z5Gzvh0jWU
         YcthIfamDfgWDJCkJ3SRgNBQRKMn8rm2tCBX8S9dpAQxCrYjNUM3aOW7edUUSgu5Czp4
         hzU2UylAQxFBjC7MbTq/+Ns3PC5i2SLS3KgbYIoSWTJQtGpuIbcKrxd39D3Xb6/LeylE
         48XffKJC5YA2CpNHVsq7+4Vf219eN1g+3NYEU10/mpQscUcMptdNW//m+HskZjV5VEE/
         t3yQ==
X-Gm-Message-State: AOAM5319lYfSELllQ3o5ygge9f9r7RslmNADjcAdV7HLeyNlp5GPqILF
        h05CdqRnxms3pBJbaV7+OYShxilk5wEnCMqLydOfy1Kv
X-Google-Smtp-Source: ABdhPJzbCfS89T5brphDk1TgTsbdF+c+tGNAm/OJ/1azO8WuTTDVN+u0KzRGwWeZc9p00F7o1tP99ldgoHbqMq3ZgZU=
X-Received: by 2002:a17:906:784c:: with SMTP id p12mr9920390ejm.123.1590997832523;
 Mon, 01 Jun 2020 00:50:32 -0700 (PDT)
MIME-Version: 1.0
From:   maharishi bhargava <bhargavamaharishi@gmail.com>
Date:   Mon, 1 Jun 2020 13:20:20 +0530
Message-ID: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
Subject: XDP_REDIRECT with xsks_map and dev_map
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi, in my XDP program, I want to redirect some packets using AF_XDP
and redirect other packets directly from driver space.
Redirection through AF_XDP works fine, but redirection through dev map
stops after some packets are processed.
What can be the possible issues and solutions?

Thanks,
Maharishi Bhargava
