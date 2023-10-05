Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 431A27BA305
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Oct 2023 17:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbjJEPvR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 5 Oct 2023 11:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234821AbjJEPuc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 5 Oct 2023 11:50:32 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973BB60AF
        for <xdp-newbies@vger.kernel.org>; Thu,  5 Oct 2023 08:10:51 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-65afc29277bso970996d6.1
        for <xdp-newbies@vger.kernel.org>; Thu, 05 Oct 2023 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696518650; x=1697123450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YFTDBsg6I0dSgJIIwPGkn5CGto1EkRExdcLxt/VShA4=;
        b=bT9sI1d6C/cLv31BEiP/kYMV7ap5s/WHlvKvnDZmVrkf1Ugc33CIMRzvkNymen0Sr3
         gdq9ZvmOt90iA6UGeYacdK5vcoIMLFJDs+aBd+Sg3M+kb0IDq1BUQ5u2toGYCloS0g/4
         XMsvLjYRvD+CV0qt2vIiftJvZzAuH/fi7TQfuTs8G9vWJ7w9azK/1bfrYSk074Iyxu3Z
         ZP6Gj3eP7fuK5Aompsh7cUGm79WuXBLHMQ0jwpTwPIPOYGLNf/HGxxVMWh9f5kmQ8XXM
         0vQapIBYHJfU6+EFAOhJ2xzlvUkZQ/s+6WNmiYWWMG95v/RuQUrcRMBXI0fSzfSuIjYg
         5lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696518650; x=1697123450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFTDBsg6I0dSgJIIwPGkn5CGto1EkRExdcLxt/VShA4=;
        b=q0EGdkA2LVCZb2gFINSC2WNHEKO99NsjP/h+FpMlb2hmrhZ5IZ818JYQDytuD3R+0M
         cjZIGMY2y5WzBUTLRsyxIWZzjtvp7m306tmPL+6Px30m1uLYnVVnFj+zIEIWP8yV1Gc+
         0EvdtfHkP+Hgb0Y35RfOPa925Sn7ywiILj5KAr9BmbiZrouITA0Z43LqebpfScTwYWAZ
         +K2h4Db0p1BXlyh8uGG2sn5MVFEZR1NDeNRG69oBJY7BYcTponTqAOFtSosvh7558dsi
         3/agM4TKOYy3RMEFZ2CBCDUB+M2D5QwYIVRDrGEow8BjBJ+INqXrd8xdA/PvPBDtXvsf
         HF7g==
X-Gm-Message-State: AOJu0Yy2G4CuAJG7cKtAKjpzT74NaOk4qiJZR2aFwBQXk/21q+Y3VzRx
        krXrV+Q/q24rn8P8N+8I0y4f+Z4L//EM8RTMxgORiOKn2k4/2Q==
X-Google-Smtp-Source: AGHT+IGLxNCijSwB0AFHXspHyubyAi4lb+KtBGxZZfj+SUu+tXpLKLrws5cjsqZByO06IFvDG4yH7JnP7TQaj+pB/wg=
X-Received: by 2002:a05:6214:2303:b0:658:30c4:206 with SMTP id
 gc3-20020a056214230300b0065830c40206mr5717564qvb.0.1696518650579; Thu, 05 Oct
 2023 08:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
In-Reply-To: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 5 Oct 2023 17:10:39 +0200
Message-ID: <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
Subject: Re: AF_XDP RX processing with NO rx-ring
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> wrote:
>
> Hi,
>
> I want to clarify my AF_XDP understanding for a particular scenario.
>
> Consider a single UMEM with 1 Fill Ring and 1 Completion Ring and
> single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx Ring.
> Assume the NIC has only a single queue (to keep things simple for
> explaining this scenario).
>
> There is a XDP program attached to Queue 0 which does either a
> XDP_DROP or XDP_PASS for all Rx packets.
>
> We are running in Driver mode.
>
> What happens to RX packets received on Queue 0?
>
> Here's my understanding -
>
>  * Even though there is no AF_XDP Rx Ring, there will be a NIC Rx Ring
> for queue 0
>  * The NIC Rx Ring for queue 0 is populated by the driver with UMEM
> buffers taken from the Fill ring

In driver mode (i.e. not zero-copy mode) this will not happen. The
ring will be populated by kernel buffers.

>  * A Rx packet will be received in the NIC Rx Ring for Queue 0 first
>  * The driver will run the XDP program on the Rx packet buffer (a UMEM buffer)
>  * If the program results in XDP_DROP, the driver will "free" the Umem
> buffer by putting it on the Completion Ring
>  * If the program results in XDP_PASS, the driver will allocate a
> standard Linux kernel SKB, copy the packet buffer contents into the
> SKB and queue it up for standard netdev processing; It will then
> "free" the RX Umem buffer by putting it on the Completion Ring (since
> we have already copied packet into the skb)

As the buffers are kernel buffers, user-space will not be notified.
The completion ring is solely for the Tx path, saying that user space
can have the buffer back.

The rest is correct.

/Magnus

> Is this understanding correct or am I mistaken anywhere?
>
> Thanks in advance,
> Srivats
