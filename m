Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179197BA3E8
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Oct 2023 18:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbjJEQAG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 5 Oct 2023 12:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237631AbjJEP5r (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 5 Oct 2023 11:57:47 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F214C2E
        for <xdp-newbies@vger.kernel.org>; Thu,  5 Oct 2023 08:18:18 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d8a000f6a51so1258041276.3
        for <xdp-newbies@vger.kernel.org>; Thu, 05 Oct 2023 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696519097; x=1697123897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHrNl2tNlIDOclD1YV2dye4NLsU1SDPBJDDxXjctZSs=;
        b=TqBsAIFubKMgRUWq/a1PD2Hpkk/Ohhf3TUl+FIkXbNK60Z04uSg1V8Ad4T7vRqCdwC
         x0fHlPi6PJWThHBVcYpBTJbYSn0IcLxG4JxrENnf1S61Mjf89MJLLLkxUTZ7dqcrswn2
         Bd4jaQpMnnuIcj1H2vO1SdUyRmiHco7Va6EMMoTFZRiN1zPFBDSMzlqBarzTvAR8HryS
         giVViPW7dm2qp8kYrBCcx6Bi5hHE8he/T6tI2OUROKljVluHlzPa1E3tkbKCXzIXBSFI
         l2Elk092SCC/YmxceHqd95k2680gZGK0JwO+Icy7VsWiN4qKgG0qlCaM+rsn6fXmihQa
         Xwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696519097; x=1697123897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHrNl2tNlIDOclD1YV2dye4NLsU1SDPBJDDxXjctZSs=;
        b=fRyDskc8gk3nfmX2gC2PxRYmbE3FYYECOVngtvPW1NaEjTKWEsN+/uo6JjzGNV0rEx
         ENHsaXpIeaMTYHso+rr5OUjr0BmtYwW1uEgI4DojCMK52cojJ6F5zxbgY2dOLLOv+5x0
         pOCny98Mi9uxhZJf9VOY0TLKSsFCvBPWV8CmsJDc9wGt3lQJudpP8gt7Yv5w/bveYbpF
         2amWwQgIxChbjM7soymgdcev3rBbRH3Cs0c/q/kNhcz5aRF2VYu64wia16LR2g1FjtIt
         FQ3NNUngZ1ApNWyFPGaTTMn65hCCRtUjqme9YYV3NFFUCbcO3DcbyUmDee8P2y2MY9Bl
         xa+A==
X-Gm-Message-State: AOJu0YyvqQy0N8j/cYr6lgembLT0DKJ2Hk8icQGJeff3UkKlRkjQItrR
        S+joIkk1qTc+DJkXc5kLFg1UL2q1jiSGId5ukA3xo2eH
X-Google-Smtp-Source: AGHT+IG3f4RT388qJT2g3lvH2S4/xkofZU55fFS/4MrAGTolSSsFADpX/pIn/NzO29H/Bis8mnpSMxLJcQnaXByx/dw=
X-Received: by 2002:a05:6902:4ce:b0:d81:7798:4f31 with SMTP id
 v14-20020a05690204ce00b00d8177984f31mr5675400ybs.41.1696519097160; Thu, 05
 Oct 2023 08:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
In-Reply-To: <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Thu, 5 Oct 2023 20:47:40 +0530
Message-ID: <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
Subject: Re: AF_XDP RX processing with NO rx-ring
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> wrote:
> >
> > Hi,
> >
> > I want to clarify my AF_XDP understanding for a particular scenario.
> >
> > Consider a single UMEM with 1 Fill Ring and 1 Completion Ring and
> > single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx Ring.
> > Assume the NIC has only a single queue (to keep things simple for
> > explaining this scenario).
> >
> > There is a XDP program attached to Queue 0 which does either a
> > XDP_DROP or XDP_PASS for all Rx packets.
> >
> > We are running in Driver mode.
> >
> > What happens to RX packets received on Queue 0?
> >
> > Here's my understanding -
> >
> >  * Even though there is no AF_XDP Rx Ring, there will be a NIC Rx Ring
> > for queue 0
> >  * The NIC Rx Ring for queue 0 is populated by the driver with UMEM
> > buffers taken from the Fill ring
>
> In driver mode (i.e. not zero-copy mode) this will not happen. The
> ring will be populated by kernel buffers.

What is the behaviour in zero-copy mode?

>
> >  * A Rx packet will be received in the NIC Rx Ring for Queue 0 first
> >  * The driver will run the XDP program on the Rx packet buffer (a UMEM =
buffer)
> >  * If the program results in XDP_DROP, the driver will "free" the Umem
> > buffer by putting it on the Completion Ring
> >  * If the program results in XDP_PASS, the driver will allocate a
> > standard Linux kernel SKB, copy the packet buffer contents into the
> > SKB and queue it up for standard netdev processing; It will then
> > "free" the RX Umem buffer by putting it on the Completion Ring (since
> > we have already copied packet into the skb)
>
> As the buffers are kernel buffers, user-space will not be notified.
> The completion ring is solely for the Tx path, saying that user space
> can have the buffer back.
>
> The rest is correct.
>
> /Magnus
>
> > Is this understanding correct or am I mistaken anywhere?
> >
> > Thanks in advance,
> > Srivats
