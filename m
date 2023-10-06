Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DFC7BB88D
	for <lists+xdp-newbies@lfdr.de>; Fri,  6 Oct 2023 15:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjJFNFD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 6 Oct 2023 09:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232282AbjJFNE7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 6 Oct 2023 09:04:59 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB6EEB
        for <xdp-newbies@vger.kernel.org>; Fri,  6 Oct 2023 06:04:57 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-76cf9cf65feso9317885a.0
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Oct 2023 06:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696597496; x=1697202296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKP5tTCRjRuf/17BAunhO4CgvCKDa8DsfbyQis52qys=;
        b=Mbq2JtwAREUkcJrJRM9PEW5xEuUtw6fMWcFfyGEnhKqcAxFKcphuUxA95d5QDV4SS9
         plnV62/28TEy9uAmR3Y7R0TXJj7Xs4kdasTtF7BEVtTK1ylHfumhvpFD1IjaBqgRjdrN
         Zk1FHeDpH3WBcPtNH7vu/B3WvWsLvqsZyBCGtMkfpgk8rb9SjjJF2QXhCv1Yx/WDRufA
         q7NO/9T3z3PPwv0XFokl1eEFppWDV08qa8u0BgFNivz5kOG1K0QbfCW+jyMtG3JYp8yI
         MQ3Jfo91TZoaZNMbzYIevnouq/ICyFBMLIup5VNWIm7sLW9Rnxia/7HzYNkwUilBp7kZ
         gUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696597496; x=1697202296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKP5tTCRjRuf/17BAunhO4CgvCKDa8DsfbyQis52qys=;
        b=T8VhfO+dfRAkQqFKU5iTBdA/38tJ9I5xowVS2cmxaY+gx+wYHMSUeOHbUyzNrdapo1
         b0bb+BTRWDjcw7hJlFOBYN8loz/OlyRhWkZXLYIoVZp/jv3YnlX6dZBfxWNM+KdTq9kp
         lbL7Lbslb7gzxlZtMrdf6mXX+qWM/fGRLZjH6dbFIPHe/t9GN6f4eWG4GPmJS3xdvjVG
         TO9fYjXV8MYv2ZgA6Fy4yD1pPfpnC0foeoMkNnoI8GGWIAVyt7xA2kHQ4OR/I6msUuNR
         VQL7F0DXMndsO81vdVybLePRHhel52Eu4CSwv00mPMOCYBrcbiwti9rBKrqhBs2M9htU
         SazQ==
X-Gm-Message-State: AOJu0YyZMQ6tKT9KnezOZUzyJr1GFS77G258BUAjrwafaFlR434IxFfE
        4j1O1kls433+JvcMrV8Z8/qXE7Upicj47YDtZgngjblicVEgOA==
X-Google-Smtp-Source: AGHT+IGGdYYCkHs8aN7Kocmm/tht7QHrLG3wSszZ5EMgF9LMrH/LNBJA4Inm4oM9CUfHTFnC2KsMe7tJeOkQCpUrCc8=
X-Received: by 2002:a05:6214:301b:b0:668:defa:84ea with SMTP id
 ke27-20020a056214301b00b00668defa84eamr8401145qvb.1.1696597496033; Fri, 06
 Oct 2023 06:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
 <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
 <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com>
 <CANzUK5-Xz5swtaTRqxWVvFx5LwEMu0u2wFdHtCxrNznpAVwXtA@mail.gmail.com>
 <CAJ8uoz3Hx4Kw6WzXCzS2LL=3sRuNZzToCv3d=dbGjj1iBPt-JA@mail.gmail.com> <CANzUK5_6+2tTad63HrLCesJ5k0xji2=Y33MUMqgodPV-A+Ffcw@mail.gmail.com>
In-Reply-To: <CANzUK5_6+2tTad63HrLCesJ5k0xji2=Y33MUMqgodPV-A+Ffcw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 6 Oct 2023 15:04:44 +0200
Message-ID: <CAJ8uoz2ZFFyg3VgTfE5SkEJ7rCO4PHNrgb9AkPxR2L-a2FkNZQ@mail.gmail.com>
Subject: Re: AF_XDP RX processing with NO rx-ring
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 6 Oct 2023 at 14:36, Srivats P <pstavirs@gmail.com> wrote:
>
> On Fri, Oct 6, 2023 at 5:23=E2=80=AFPM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Fri, 6 Oct 2023 at 13:41, Srivats P <pstavirs@gmail.com> wrote:
> > >
> > > On Thu, Oct 5, 2023 at 9:03=E2=80=AFPM Magnus Karlsson
> > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > On Thu, 5 Oct 2023 at 17:18, Srivats P <pstavirs@gmail.com> wrote:
> > > > >
> > > > > On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
> > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> wro=
te:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > I want to clarify my AF_XDP understanding for a particular sc=
enario.
> > > > > > >
> > > > > > > Consider a single UMEM with 1 Fill Ring and 1 Completion Ring=
 and
> > > > > > > single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx =
Ring.
> > > > > > > Assume the NIC has only a single queue (to keep things simple=
 for
> > > > > > > explaining this scenario).
> > > > > > >
> > > > > > > There is a XDP program attached to Queue 0 which does either =
a
> > > > > > > XDP_DROP or XDP_PASS for all Rx packets.
> > > > > > >
> > > > > > > We are running in Driver mode.
> > > > > > >
> > > > > > > What happens to RX packets received on Queue 0?
> > > > > > >
> > > > > > > Here's my understanding -
> > > > > > >
> > > > > > >  * Even though there is no AF_XDP Rx Ring, there will be a NI=
C Rx Ring
> > > > > > > for queue 0
> > > > > > >  * The NIC Rx Ring for queue 0 is populated by the driver wit=
h UMEM
> > > > > > > buffers taken from the Fill ring
> > > > > >
> > > > > > In driver mode (i.e. not zero-copy mode) this will not happen. =
The
> > > > > > ring will be populated by kernel buffers.
> > > > >
> > > > > What is the behaviour in zero-copy mode?
> > > >
> > > > Then the behaviour is according to what you wrote above. Just note
> > > > that nothing will be returned in the fill ring as you are not sendi=
ng
> > > > anything to the AF_XDP socket.
> > >
> > > I assume you meant "Rx Ring" and not "Fill ring" above?
> >
> > Yes, sorry. Nothing will arrive in the Rx ring, and the Fill ring will
> > not be used apart from the initial burst of buffers that will be
> > grabbed by the system. Note though that you have to provide some
> > buffers in the fill ring as these are the ones that are used by the
> > NIC in zero-copy mode. They are just never returned to user-space
> > through the Rx ring. They are just recycled in the driver so the
> > system never needs to grab more in your scenario.
> >
>
> After a XDP_DROP or XDP_PASS at RX, will the driver recycle the umem
> buffer back into the NIC's RX-ring or will it put it on the CQ? In
> case of the latter, the FQ will eventually run out of buffers.

It will recycle it back to the Rx ring of the NIC. The kernel will
never take a buffer used for Rx and reuse it for Tx, or the opposite.
A buffer put on the fill ring can only return on the Rx ring and a
buffer put on the Tx ring can only return on the Completion ring.

> Is this behaviour driver specific (recycle to NIC RX-Ring or CQ) or
> same for all drivers in ZC mode?

This is core AF_XDP code, so all drivers will do the same thing.

>
> > > >
> > > > > >
> > > > > > >  * A Rx packet will be received in the NIC Rx Ring for Queue =
0 first
> > > > > > >  * The driver will run the XDP program on the Rx packet buffe=
r (a UMEM buffer)
> > > > > > >  * If the program results in XDP_DROP, the driver will "free"=
 the Umem
> > > > > > > buffer by putting it on the Completion Ring
> > > > > > >  * If the program results in XDP_PASS, the driver will alloca=
te a
> > > > > > > standard Linux kernel SKB, copy the packet buffer contents in=
to the
> > > > > > > SKB and queue it up for standard netdev processing; It will t=
hen
> > > > > > > "free" the RX Umem buffer by putting it on the Completion Rin=
g (since
> > > > > > > we have already copied packet into the skb)
> > > > > >
> > > > > > As the buffers are kernel buffers, user-space will not be notif=
ied.
> > > > > > The completion ring is solely for the Tx path, saying that user=
 space
> > > > > > can have the buffer back.
> > > > > >
> > > > > > The rest is correct.
> > > > > >
> > > > > > /Magnus
> > > > > >
> > > > > > > Is this understanding correct or am I mistaken anywhere?
> > > > > > >
> > > > > > > Thanks in advance,
> > > > > > > Srivats
