Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84BB23467E
	for <lists+xdp-newbies@lfdr.de>; Fri, 31 Jul 2020 15:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731417AbgGaNEJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 31 Jul 2020 09:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731099AbgGaNEI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 31 Jul 2020 09:04:08 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1EEC061574
        for <xdp-newbies@vger.kernel.org>; Fri, 31 Jul 2020 06:04:08 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id y17so16177521ybm.12
        for <xdp-newbies@vger.kernel.org>; Fri, 31 Jul 2020 06:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qDk04ZlRV0fvHBfv2aGsTM/Rs417stTicA/iFv1eduI=;
        b=TbPLKTsLopqPZTIGbM6Mu3pGJl7xMLeteHX2zJPN0DNvK3kyWyXb1VMMhM9XmasbAA
         +d7joWrL7Oq9bq/ywK1DSCxsDsA3Bmx/p62sx+fjCVDpqvW9z2BFV8KO98kWG0z6nZ46
         xcbEV900BmBm3GaJC8NicFtbZYprJ2nQpaiwYLQhYLm4LmzM3VtO/C5dRxSa0NvqBnvp
         mJYWGqogTL/lmtoL864BGs5lPRAkI5cSBAIb7B9znAZyqWD9SRhwdvweQ0pBgacgrF6y
         wQyoo/1zRfzyS7PLX5ijvF1Jv5o2n0Vfw/EGXgh0mJ2OMPSXMTPsIaJnaoBo1gQTFFUn
         1eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qDk04ZlRV0fvHBfv2aGsTM/Rs417stTicA/iFv1eduI=;
        b=L4t0cF2DN7ngE4fu3O1mZyl1BRm8V6rqQtB0JyCGDYtVW2Pzjno6XqqESKqAZcfW6E
         Y6Q7SNOnt/1OmG/JosYkFqJ3i2PEgS+LWEKfJ+b1mCRbl5ttn6jfR0U+Vdc6vMuBHA6N
         RbGD2Ul32/GWRdcP1CDQi++ocjoTMKrBFNZH1hIOE1aeyXQ0yZHoo6BBiqaAPV1BnZZM
         VB8DZciiprgQ060JWdVqmZORVzQaTYSvNzUibXsRfK/AmaRRfb3DVD07X65aLbW95mIR
         Y3gFl/UQF6TYf7j8t0Bg7ezoRC/9yR8UvKHR4LwN+1v3wxcDaFUk9Zy2rxfGTcd98ysI
         kNZQ==
X-Gm-Message-State: AOAM530Q4NXtYovSkGhiC1tBInCW6cH/9Bui9YHBVgPEk1E1CkhWmOOF
        b9vnsOx1Wf/Ea1bIRLJub/kXw7zOhjvi+cV/IMUzDqUw
X-Google-Smtp-Source: ABdhPJy0+GTVIna091mDxzgErVjV8cGPor3e+bQXg0PGUFbFIB1+GdCriP1DDzQ6Ze5sJEl9A3U+NMJIAGcWF8C82R8=
X-Received: by 2002:a5b:544:: with SMTP id r4mr5715794ybp.312.1596200647204;
 Fri, 31 Jul 2020 06:04:07 -0700 (PDT)
MIME-Version: 1.0
From:   David Gohberg <gohberg@gmail.com>
Date:   Fri, 31 Jul 2020 16:03:56 +0300
Message-ID: <CAE2Pf893-Y7svSxm68LPE3MbLrzxPqRDOuRuhJraYi564YWm6g@mail.gmail.com>
Subject: taking first steps with XDP
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everyone,

My goal is to build a simple program that schedules sending an
heartbeat packet (sort of like an ICMP reply-response) to a list of IP
addresses (a few million of them) on regular intervals, and update
alive/dead software state for each address. I have a pcap
implementation but performance is subpar.

I understand that for the rx part, a simple xdp program that
intercepts the heartbeat reply and writes to some bpf map will be
sufficient. However, from what I read, in order to send packets in the
same path, I will need to use AF_XDP sockets and write a user-space
application that will have to deal with cpu cores, rings, queues,
umems and everything related. Since I don't really need to redirect
the heartbeat reply packet to user-space, just acknowledge that a
reply was received (that can happen in the XDP program) is there a
layer or library over AF_XDP that allows for a simpler tx API which
abstracts the underlying mechanisms I mentioned?
