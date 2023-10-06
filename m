Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1930A7BB6AF
	for <lists+xdp-newbies@lfdr.de>; Fri,  6 Oct 2023 13:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjJFLl6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 6 Oct 2023 07:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjJFLl5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 6 Oct 2023 07:41:57 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F19CE
        for <xdp-newbies@vger.kernel.org>; Fri,  6 Oct 2023 04:41:55 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d81afd5273eso2144855276.3
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Oct 2023 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696592514; x=1697197314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ73yVPiQMzndQP7YtRcGP78K2NI+LX+xOo7skscTlQ=;
        b=B/asaJ5hDaKG0jV2O7oCqly/OHxwy8MMRrplFINZ+5Z60Ngrsy64SE9RKhzwP1enxq
         FN/9UqxNF4VPSUz2Kl69hgruyC4NoIMPDvGkBZEqSTbFZgdEJUuZbpjiDn5ZhhF5NsIo
         inBqTek1gGX7HClwGuGOoxrVVKc2kwqnFbHe0WdUyjBT4ZpaCX9hWC8L8NAKWpSzb7TS
         YDtjz/p2j4wCTRCDyjnd288zjFgRGBthUcOxBuMg8eD0NIlmRD1DJhJ3G+GXwEXdGYoV
         h194a9F+rcFbQMdBlbfr7zWxnr35vYWBaFYF8nI27thOTo1yxpBINAvnaOUdcOOWJIrG
         RdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696592514; x=1697197314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ73yVPiQMzndQP7YtRcGP78K2NI+LX+xOo7skscTlQ=;
        b=jLbAgtd3b4arcHJzzYmPxqVFPx5gv9Zx9wiIM3OVop/ZSG/A2oxIfriAJ6eorBr/Yr
         Ctf+ZcgpX0hzHMwW00YYuV9sS2VLJyEWr81WMx6D0xCdKzIHirXe0pCCbYdGN4LwJgJZ
         wdWSNTo0SAK6aYDJ0CGGvFZm7+UaypS8BSxJsRFmDHNNDupSRea6Fcsd3dTrAjS417dk
         2AUb54/cIpXB5He65Bh3ZKjlFW6jehXTTgk17Sx8iFlQWRNGhyxdGkQvM6GamlS0+sX9
         +OAzhJm8scMz7UHKYP/SYFFVEmjh3/cb/iAg1SqyMbDblT5GgTFiNAGoLxH22rPCDiyW
         Rlnw==
X-Gm-Message-State: AOJu0YyKP1T3HLZbyD66rPNj2li8bF+TuoB/yHyL6F3SaQGAOR0v/9zy
        EJn7oIwua/aE1rvbvrM129TGzviTZ9oTAJercpt0GCJ/
X-Google-Smtp-Source: AGHT+IGUOn/RlaBHVu/a3CY2We+4lKLo6jkX04wO0Aly1VuzgMoVsTb28T5oDjujZQSOaDWE6DRfqM5FlTFhjy5Fg3I=
X-Received: by 2002:a05:6902:4cf:b0:d81:70b6:c24b with SMTP id
 v15-20020a05690204cf00b00d8170b6c24bmr7692021ybs.19.1696592514099; Fri, 06
 Oct 2023 04:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
 <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com> <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com>
In-Reply-To: <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Fri, 6 Oct 2023 17:11:18 +0530
Message-ID: <CANzUK5-Xz5swtaTRqxWVvFx5LwEMu0u2wFdHtCxrNznpAVwXtA@mail.gmail.com>
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

On Thu, Oct 5, 2023 at 9:03=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Thu, 5 Oct 2023 at 17:18, Srivats P <pstavirs@gmail.com> wrote:
> >
> > On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I want to clarify my AF_XDP understanding for a particular scenario=
.
> > > >
> > > > Consider a single UMEM with 1 Fill Ring and 1 Completion Ring and
> > > > single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx Ring.
> > > > Assume the NIC has only a single queue (to keep things simple for
> > > > explaining this scenario).
> > > >
> > > > There is a XDP program attached to Queue 0 which does either a
> > > > XDP_DROP or XDP_PASS for all Rx packets.
> > > >
> > > > We are running in Driver mode.
> > > >
> > > > What happens to RX packets received on Queue 0?
> > > >
> > > > Here's my understanding -
> > > >
> > > >  * Even though there is no AF_XDP Rx Ring, there will be a NIC Rx R=
ing
> > > > for queue 0
> > > >  * The NIC Rx Ring for queue 0 is populated by the driver with UMEM
> > > > buffers taken from the Fill ring
> > >
> > > In driver mode (i.e. not zero-copy mode) this will not happen. The
> > > ring will be populated by kernel buffers.
> >
> > What is the behaviour in zero-copy mode?
>
> Then the behaviour is according to what you wrote above. Just note
> that nothing will be returned in the fill ring as you are not sending
> anything to the AF_XDP socket.

I assume you meant "Rx Ring" and not "Fill ring" above?

>
> > >
> > > >  * A Rx packet will be received in the NIC Rx Ring for Queue 0 firs=
t
> > > >  * The driver will run the XDP program on the Rx packet buffer (a U=
MEM buffer)
> > > >  * If the program results in XDP_DROP, the driver will "free" the U=
mem
> > > > buffer by putting it on the Completion Ring
> > > >  * If the program results in XDP_PASS, the driver will allocate a
> > > > standard Linux kernel SKB, copy the packet buffer contents into the
> > > > SKB and queue it up for standard netdev processing; It will then
> > > > "free" the RX Umem buffer by putting it on the Completion Ring (sin=
ce
> > > > we have already copied packet into the skb)
> > >
> > > As the buffers are kernel buffers, user-space will not be notified.
> > > The completion ring is solely for the Tx path, saying that user space
> > > can have the buffer back.
> > >
> > > The rest is correct.
> > >
> > > /Magnus
> > >
> > > > Is this understanding correct or am I mistaken anywhere?
> > > >
> > > > Thanks in advance,
> > > > Srivats
