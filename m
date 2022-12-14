Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC8864C567
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 10:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiLNJAg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 04:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236910AbiLNJAf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 04:00:35 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E43B62C1
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 01:00:34 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id u19so24384227ejm.8
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 01:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KgG3y1bLeSjGBGopdwZVeQR3siOMyZnzyCb6dXOY5o8=;
        b=cwfzqQsQJLP0itj+PJKRzeVFz5rXG/F8eFVCf28wrpGc1CXqxOASsbXTTgSETYlhJp
         oqKoJ21tTqqbqv59elG7eyoyo/bCftknthJ/rFR4INjitYgCS0Q8x+UW9l9taw2Mch2k
         mUB7dj/8I2E6xKPLm2hA4KQHouo3O/7FWUxGqzlIDKbRK5i5RBX14iRSCuGscvMI2W+G
         xcs+zsY+tx0PqdTSlE7T5ES731ymXytarLBlP/DQ+8yjtbYKDSiEYUf5E0F1SHzbVIr5
         kdd6bpph7e+2QLP47Rq2oeOQyup8GCy3el70HRm2rJHBlJxkTlEQB4y+s8xBLHBwLaXX
         LilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgG3y1bLeSjGBGopdwZVeQR3siOMyZnzyCb6dXOY5o8=;
        b=y5Nt3eAb/APW2ET+cdhCg1GKyFKT/oJgq5qB96NUOf0JzembE6BljVKMa10el0WH32
         Dq4632SGz1WDWoS4VOCy/AePfO4g8i3BvgtJtenHcTQupGKx0UtTk50KHxKdrc9RC9mw
         4stak1cLj71/419Hcj8Jnu85vEG8pjaeFq5bcHgcAcADo7uTMgpT+usgt6a3q4BBWO+0
         OQByfipHLJsaAu7ABSyyPwjYYzMngQqiv1y5RbdkkX7/dPrTw9BvaF5bUnb46rLa0dLy
         Qy8nbssuiPtu4o6P4uXrAXaPMtBMQmQaEp3OboG4EZ1rsj0QjLl5JHwHhowPEYYDYBXR
         wvGg==
X-Gm-Message-State: ANoB5pl0wwyZvxqavE85GpPu8uoVaIzn3a8fKCVd0F61CQAKg2YRHe32
        k7YrVDrHtloT7U4kqmkhIlGROEN/R0ypUZs7aym8JLlx/cgUNw==
X-Google-Smtp-Source: AA0mqf7fpg0PxWU8QEaJf4iIJbEqcASPSRGmFL/iBoc+sH5ciSOhd25PzwSDBnHRqmq0edvsbEuQN/roizxZ3MQ9KYU=
X-Received: by 2002:a17:907:8e09:b0:7bc:420d:709f with SMTP id
 th9-20020a1709078e0900b007bc420d709fmr54735104ejc.658.1671008432901; Wed, 14
 Dec 2022 01:00:32 -0800 (PST)
MIME-Version: 1.0
References: <4c094424-4ace-86a3-ffc9-0142b62b7d27@polito.it>
In-Reply-To: <4c094424-4ace-86a3-ffc9-0142b62b7d27@polito.it>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 14 Dec 2022 10:00:21 +0100
Message-ID: <CAJ8uoz3bgtUGBAW7f7vcA7=mvg8fAz8PXvjbmoEuMKaoURkw+w@mail.gmail.com>
Subject: Re: Why choosing AF_XDP (busy polling) over DPDK
To:     Federico Parola <federico.parola@polito.it>
Cc:     xdp-newbies@vger.kernel.org
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

On Wed, Dec 14, 2022 at 9:16 AM Federico Parola
<federico.parola@polito.it> wrote:
>
> Hello everyone,
> in a context in which all traffic is sent to user space, and the main
> concern is performance (so AF_XDP busy polling is the best candidate),
> is there a reason to choose AF_XDP instead of DPDK for packet I/O, given
> that the latter is still much faster?

The choice is not AF_XDP vs DPDK, since DPDK can run on top of AF_XDP.
The choice is do you want to use user-space drivers or kernel space
drivers. There are many pros and cons with both approaches. The two
main advantages of user-space drivers in DPDK are that they are faster
than their kernel counterparts and you get access to many NIC features
that are not available right now from user-space if you are using a
kernel driver. Kernel drivers, on the other hand, enables you to
deploy your application on any Linux system (from a certain version)
and does not force you into the strict execution model of DPDK (which
is what most people use with user-space drivers). Everything in Linux
is still usable and it is easy to have a system that mixes data-plane
processing with other types of workloads. If the only thing you care
about is max performance of a pure packet processing workload on a
system you have complete control over, the choice is easy: go with a
user-space driver and DPDK. If this is not your ultimate goal, then
XDP and AF_XDP might be something to consider.

There are likely some good write-ups on the Internet about this.

/Magnus

> Best regards,
> Federico Parola
