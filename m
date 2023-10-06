Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A627BB7CA
	for <lists+xdp-newbies@lfdr.de>; Fri,  6 Oct 2023 14:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjJFMgL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 6 Oct 2023 08:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbjJFMgK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 6 Oct 2023 08:36:10 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB8ACA
        for <xdp-newbies@vger.kernel.org>; Fri,  6 Oct 2023 05:36:05 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a21ea6baccso25452317b3.1
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Oct 2023 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696595765; x=1697200565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVWslHcO37vgJhreRZeMJSpTuYSFIUquw1DOHOmfJSA=;
        b=WEHzNWY0WjhRJhXuVxcb0TvxmiY1ry5+uVBYEj5cHjHcdGGqYSDxMScZT4DYZl5JCq
         poUREfVjbTvHGfHTgaBLqE1FzQVP0q887MTMy91zcmvfkUQq949H5pC5c5BX5/Egf24E
         i4IhYMk0yzDaVHqnwzAxO1gnwoixpABMlCWS1vuhPTb1qd16kWkd365U4gLVJScSMiz5
         PrX4q8Bu9435fx8nFPLNLdax8IN37AO0ZwpzfYTIPdW6HN0WqDpNTa0cVawACtfUCbaJ
         FgffJwcmEECk6MzWQcGn24Z6/IoREogQBxytvjaBVtMBAdy1NrcBaU8kZpt+c07TzSHK
         EGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696595765; x=1697200565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVWslHcO37vgJhreRZeMJSpTuYSFIUquw1DOHOmfJSA=;
        b=myqDDbkpOkLJEO6sDsyNtVKzNkMDtaZgWvBteUr0o/OH/gU0XWlEE0fOTie3J8vujM
         jl6ilkCdz3vAR9XsdW9C9X4L1KNGy26Y4lkE5ef10F3zA0Gt5P0HogIOK4Dxasvrnh5x
         rFoFiw+DIAkm5yVk8B+wT7h/ABbVzecVETA47pk02gMed+poazye34npAtCcp7Jmforp
         9MpRPr0F5d8YtMGtUFCwB13hwOqORRfUqSEgaOp/jJfOoCx1IaEQ1nppPiLnJ9e9eFQ6
         8unmknBvqMWxMbeV9B3ek0aU5sQCfJuefXtMCbB9XFho/NDummGfSKPeGBQmKSM5MtIH
         NcPg==
X-Gm-Message-State: AOJu0YyDEgXpgQwLVTV0daRUig+CGxU8Sdq7rb3AZu7mZYVMJJjmKUyO
        +4QqyH486V/mcek2pQkMOpKz3QMzzKONJm41ZqU=
X-Google-Smtp-Source: AGHT+IFG+9UFqMq+dpVxWSaYU5LNTrugrBQ5fDTDucPdYA8mXbKolUc3+0zr8r2tUx95JrF3Td4NbxyTibcJuLysD24=
X-Received: by 2002:a25:9c86:0:b0:d68:8a7f:127f with SMTP id
 y6-20020a259c86000000b00d688a7f127fmr7047482ybo.52.1696595764615; Fri, 06 Oct
 2023 05:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
 <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
 <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com>
 <CANzUK5-Xz5swtaTRqxWVvFx5LwEMu0u2wFdHtCxrNznpAVwXtA@mail.gmail.com> <CAJ8uoz3Hx4Kw6WzXCzS2LL=3sRuNZzToCv3d=dbGjj1iBPt-JA@mail.gmail.com>
In-Reply-To: <CAJ8uoz3Hx4Kw6WzXCzS2LL=3sRuNZzToCv3d=dbGjj1iBPt-JA@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Fri, 6 Oct 2023 18:05:28 +0530
Message-ID: <CANzUK5_6+2tTad63HrLCesJ5k0xji2=Y33MUMqgodPV-A+Ffcw@mail.gmail.com>
Subject: Re: AF_XDP RX processing with NO rx-ring
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
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

On Fri, Oct 6, 2023 at 5:23=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Fri, 6 Oct 2023 at 13:41, Srivats P <pstavirs@gmail.com> wrote:
> >
> > On Thu, Oct 5, 2023 at 9:03=E2=80=AFPM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Thu, 5 Oct 2023 at 17:18, Srivats P <pstavirs@gmail.com> wrote:
> > > >
> > > > On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
> > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> wrote=
:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > I want to clarify my AF_XDP understanding for a particular scen=
ario.
> > > > > >
> > > > > > Consider a single UMEM with 1 Fill Ring and 1 Completion Ring a=
nd
> > > > > > single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx Ri=
ng.
> > > > > > Assume the NIC has only a single queue (to keep things simple f=
or
> > > > > > explaining this scenario).
> > > > > >
> > > > > > There is a XDP program attached to Queue 0 which does either a
> > > > > > XDP_DROP or XDP_PASS for all Rx packets.
> > > > > >
> > > > > > We are running in Driver mode.
> > > > > >
> > > > > > What happens to RX packets received on Queue 0?
> > > > > >
> > > > > > Here's my understanding -
> > > > > >
> > > > > >  * Even though there is no AF_XDP Rx Ring, there will be a NIC =
Rx Ring
> > > > > > for queue 0
> > > > > >  * The NIC Rx Ring for queue 0 is populated by the driver with =
UMEM
> > > > > > buffers taken from the Fill ring
> > > > >
> > > > > In driver mode (i.e. not zero-copy mode) this will not happen. Th=
e
> > > > > ring will be populated by kernel buffers.
> > > >
> > > > What is the behaviour in zero-copy mode?
> > >
> > > Then the behaviour is according to what you wrote above. Just note
> > > that nothing will be returned in the fill ring as you are not sending
> > > anything to the AF_XDP socket.
> >
> > I assume you meant "Rx Ring" and not "Fill ring" above?
>
> Yes, sorry. Nothing will arrive in the Rx ring, and the Fill ring will
> not be used apart from the initial burst of buffers that will be
> grabbed by the system. Note though that you have to provide some
> buffers in the fill ring as these are the ones that are used by the
> NIC in zero-copy mode. They are just never returned to user-space
> through the Rx ring. They are just recycled in the driver so the
> system never needs to grab more in your scenario.
>

After a XDP_DROP or XDP_PASS at RX, will the driver recycle the umem
buffer back into the NIC's RX-ring or will it put it on the CQ? In
case of the latter, the FQ will eventually run out of buffers.

Is this behaviour driver specific (recycle to NIC RX-Ring or CQ) or
same for all drivers in ZC mode?


> > >
> > > > >
> > > > > >  * A Rx packet will be received in the NIC Rx Ring for Queue 0 =
first
> > > > > >  * The driver will run the XDP program on the Rx packet buffer =
(a UMEM buffer)
> > > > > >  * If the program results in XDP_DROP, the driver will "free" t=
he Umem
> > > > > > buffer by putting it on the Completion Ring
> > > > > >  * If the program results in XDP_PASS, the driver will allocate=
 a
> > > > > > standard Linux kernel SKB, copy the packet buffer contents into=
 the
> > > > > > SKB and queue it up for standard netdev processing; It will the=
n
> > > > > > "free" the RX Umem buffer by putting it on the Completion Ring =
(since
> > > > > > we have already copied packet into the skb)
> > > > >
> > > > > As the buffers are kernel buffers, user-space will not be notifie=
d.
> > > > > The completion ring is solely for the Tx path, saying that user s=
pace
> > > > > can have the buffer back.
> > > > >
> > > > > The rest is correct.
> > > > >
> > > > > /Magnus
> > > > >
> > > > > > Is this understanding correct or am I mistaken anywhere?
> > > > > >
> > > > > > Thanks in advance,
> > > > > > Srivats
