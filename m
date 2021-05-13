Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5290E37FB45
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 May 2021 18:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbhEMQLa (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 May 2021 12:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbhEMQLZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 May 2021 12:11:25 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E582C06175F
        for <xdp-newbies@vger.kernel.org>; Thu, 13 May 2021 09:10:13 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id k15so9098212pgb.10
        for <xdp-newbies@vger.kernel.org>; Thu, 13 May 2021 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=5FW1wQltAIq23EheQxEt/QDiTTrAz48usGlhLDmjw8c=;
        b=nk08tJcooAtGJ93U6iipQVhwv8Fw3uc3GLz6n+YJdhF5Rnn5PUyRxrLajT7CrgXKI5
         hx5i0VJ1RpVY0ccZjWTjBco/eFMRt3EZez4/8dR14kuZ8a7ki2YwyiF2Y48Zv2sdnn6P
         tKsTik/Yb5Wfea3EzpSauWqpWLdoTmfd2cgyAjo7s3IzbXcCQtnOv9A/Fah7R9xXoHNy
         YBLzTs0y7aMGJKL2Y7jHxvjHFcHVM/pDElm/1vB7f19PQGlZEquY0bFYddmZqLIYpHq6
         msO/hOreVgMhbky2S02X8t11kl784No9bia5IcPoV+EiDyI3MXLepDONoZ70YjZu9jnc
         Jvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5FW1wQltAIq23EheQxEt/QDiTTrAz48usGlhLDmjw8c=;
        b=pDPye/qOsL7MR6UWCNKUDKGq3KBfY3eaqF3t3bEF6M3Ir4k2y8Bt+cMVZ5d/dR6YaL
         of7o5BYb4xfsBtjkYPJtzGqUSarQlHXAjcaujP81dEa1rAOFMhpj6bxJKIkxE0fVqfiV
         Ny4qtwzjsUUVhGhJBjtdxFzSTQCKTE0/555KDXB4Am6TFtGwrRmfZskLQfCSPsYwmHnk
         l+b62Buytqql6+M7ZT+iDJVJslLY6nmlJL9aTg7yvCc7I99b+xg8StXZ1s8DQrL2jEWH
         1CFc62sJ6fYmc2s1Kwl4PDQSU18cuykO5/1ZipmiFZsKBUoR6ih841+llVg4Vf9+bukb
         gT1g==
X-Gm-Message-State: AOAM533Zr2IJFsM3JK8GpPJFAQFh3lQDKQcXx0NtY+QiSocMBpmieP+v
        6qJMkyg7skuREBoNlkBXeqGjE+ZeEHu2bdHc+ujG/G2RxwI=
X-Google-Smtp-Source: ABdhPJz2gX338sOFe5tf3LKmrEXCbbXPkJpe97IbmLGMxzD9pZnAg5UJTyqBbxwpyAlTcoGrhGWkQxm3wyTjlwrPOjQ=
X-Received: by 2002:a62:ddd0:0:b029:28e:653c:6b6e with SMTP id
 w199-20020a62ddd00000b029028e653c6b6emr40983747pff.12.1620922212445; Thu, 13
 May 2021 09:10:12 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Thu, 13 May 2021 21:40:01 +0530
Message-ID: <CANzUK5-vaz4_WtFbwdYoGJOjdh0c4p+bEZhpV2Pfuni5JKghrA@mail.gmail.com>
Subject: Max MTU with XDP
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I'm aware that different drivers have different max MTU that they can
support with XDP.

Is there a way to programmatically retrieve what is the max MTU
supported on a particular driver/interface with XDP/AF_XDP?

Or is setting a MTU value and trying to attach a eBPF program in a
binary search fashion wrt to MTU value between 1500 and 4096 is the
only way?

Srivats
