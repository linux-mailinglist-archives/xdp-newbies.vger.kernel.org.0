Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8A47BC516
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Oct 2023 08:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343579AbjJGGkK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 7 Oct 2023 02:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343561AbjJGGkJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 7 Oct 2023 02:40:09 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5005B9
        for <xdp-newbies@vger.kernel.org>; Fri,  6 Oct 2023 23:40:07 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-637aaaf27f1so2726226d6.0
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Oct 2023 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696660807; x=1697265607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6df0QiM0gr5xYwEtyqoXlC982FpUUKqCAjrULpZGZ0=;
        b=ftmZv2i/RBncOLhki3ghEwfvXjyVBodSAqExSyDN/3nx70obWFApJ2rYcKtvuZu9GV
         YP+L65c9UQmbjgGnbWML3BnA8HHG/sQhaYiY+QyNSkzTol9j9n3lpSbcMOlTz3pnz6RC
         MHMVuIwlZT8+hZsKA9YfdV20beFz/P7mzJinlIdEx+rmz1UF4l2bYoZfQpWMU9aye68M
         NWENHyC7VeFWM/FW3u04F+tmZNiDDb9byk4OLTzY2TT2kDyB8SHKnwXNsV7kbIXrHIk9
         18axoI05tmocEoE4Q4h1hrzUk8pLsReD6kvdKvcNkSQYcjb1qZu8O0mLygbA62nZz1dC
         DoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696660807; x=1697265607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6df0QiM0gr5xYwEtyqoXlC982FpUUKqCAjrULpZGZ0=;
        b=S05u1IKba3lvMXT9AsQIxYgBsAZUKo+NGnxtiWGs33zL+kLFXhP8/swHbDLhN5TKZh
         9UjZwE70lSKjwKYueyihQPjh4va0Mtc86+kocBQ+zEcdLrszOEz1bSqBJmKqEMbJmLQF
         8nB8tat8Z/N9P0HuZn6waJhQZLZbA3nIxthBwvQEstVGDVuSCYiYDielcnlkxeiko4dt
         3X+ON3C3CxFSV3mLR4V8V20g5mmKkuVqoNCRTz/l0+routAMCIeYKHMZurvLVjuyMPcE
         kXwy3Q9+fCQVaBTbWRR3OQRmyBXBLOvO2TAXXd1m1xzlwC36mpHfuQpLeMkJUvYwqu1q
         y5uA==
X-Gm-Message-State: AOJu0YyQtoDMvymswdefYHU8U2Xa9CQXAkGHv6cJZm0K2z+kAHgzJ4Zj
        tXDqgD40UuTu4uRQCo2AxXQZJXAS2PZkCTSTlvGnlAvqQbS3cQ==
X-Google-Smtp-Source: AGHT+IFchFdhng8gdwcDhfQgFGv/Jx85ao4POuDRnOx6B5dAFqNFWJo0TqWEBRZK+CeFBydpkk3zCGIRiVBCFGuB6Nw=
X-Received: by 2002:ad4:5741:0:b0:63d:2a0b:3f91 with SMTP id
 q1-20020ad45741000000b0063d2a0b3f91mr10943753qvx.2.1696660806848; Fri, 06 Oct
 2023 23:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
 <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
 <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com>
 <CANzUK5-Xz5swtaTRqxWVvFx5LwEMu0u2wFdHtCxrNznpAVwXtA@mail.gmail.com>
 <CAJ8uoz3Hx4Kw6WzXCzS2LL=3sRuNZzToCv3d=dbGjj1iBPt-JA@mail.gmail.com>
 <CANzUK5_6+2tTad63HrLCesJ5k0xji2=Y33MUMqgodPV-A+Ffcw@mail.gmail.com>
 <CAJ8uoz2ZFFyg3VgTfE5SkEJ7rCO4PHNrgb9AkPxR2L-a2FkNZQ@mail.gmail.com> <CANzUK5-ew8h-Cn23zj88sCVXNFy7yDZsS1NnCk57Z8g4KHh8-A@mail.gmail.com>
In-Reply-To: <CANzUK5-ew8h-Cn23zj88sCVXNFy7yDZsS1NnCk57Z8g4KHh8-A@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Sat, 7 Oct 2023 08:39:55 +0200
Message-ID: <CAJ8uoz1kDqq4Pj2SeYEJRn6jOGQeJFBw7oKq9anwXHzoAGneOQ@mail.gmail.com>
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

On Sat, 7 Oct 2023 at 01:07, Srivats P <pstavirs@gmail.com> wrote:
>
> On Fri, Oct 6, 2023 at 6:34=E2=80=AFPM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Fri, 6 Oct 2023 at 14:36, Srivats P <pstavirs@gmail.com> wrote:
> > >
> > > On Fri, Oct 6, 2023 at 5:23=E2=80=AFPM Magnus Karlsson
> > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > On Fri, 6 Oct 2023 at 13:41, Srivats P <pstavirs@gmail.com> wrote:
> > > > >
> > > > > On Thu, Oct 5, 2023 at 9:03=E2=80=AFPM Magnus Karlsson
> > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, 5 Oct 2023 at 17:18, Srivats P <pstavirs@gmail.com> wro=
te:
> > > > > > >
> > > > > > > On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
> > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com>=
 wrote:
> > > > > > > > >
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > I want to clarify my AF_XDP understanding for a particula=
r scenario.
> > > > > > > > >
> > > > > > > > > Consider a single UMEM with 1 Fill Ring and 1 Completion =
Ring and
> > > > > > > > > single XDP socket  bound to queue 0 with 1 Tx Ring but NO=
 Rx Ring.
> > > > > > > > > Assume the NIC has only a single queue (to keep things si=
mple for
> > > > > > > > > explaining this scenario).
> > > > > > > > >
> > > > > > > > > There is a XDP program attached to Queue 0 which does eit=
her a
> > > > > > > > > XDP_DROP or XDP_PASS for all Rx packets.
> > > > > > > > >
> > > > > > > > > We are running in Driver mode.
> > > > > > > > >
> > > > > > > > > What happens to RX packets received on Queue 0?
> > > > > > > > >
> > > > > > > > > Here's my understanding -
> > > > > > > > >
> > > > > > > > >  * Even though there is no AF_XDP Rx Ring, there will be =
a NIC Rx Ring
> > > > > > > > > for queue 0
> > > > > > > > >  * The NIC Rx Ring for queue 0 is populated by the driver=
 with UMEM
> > > > > > > > > buffers taken from the Fill ring
> > > > > > > >
> > > > > > > > In driver mode (i.e. not zero-copy mode) this will not happ=
en. The
> > > > > > > > ring will be populated by kernel buffers.
> > > > > > >
> > > > > > > What is the behaviour in zero-copy mode?
> > > > > >
> > > > > > Then the behaviour is according to what you wrote above. Just n=
ote
> > > > > > that nothing will be returned in the fill ring as you are not s=
ending
> > > > > > anything to the AF_XDP socket.
> > > > >
> > > > > I assume you meant "Rx Ring" and not "Fill ring" above?
> > > >
> > > > Yes, sorry. Nothing will arrive in the Rx ring, and the Fill ring w=
ill
> > > > not be used apart from the initial burst of buffers that will be
> > > > grabbed by the system. Note though that you have to provide some
> > > > buffers in the fill ring as these are the ones that are used by the
> > > > NIC in zero-copy mode. They are just never returned to user-space
> > > > through the Rx ring. They are just recycled in the driver so the
> > > > system never needs to grab more in your scenario.
> > > >
> > >
> > > After a XDP_DROP or XDP_PASS at RX, will the driver recycle the umem
> > > buffer back into the NIC's RX-ring or will it put it on the CQ? In
> > > case of the latter, the FQ will eventually run out of buffers.
> >
> > It will recycle it back to the Rx ring of the NIC. The kernel will
> > never take a buffer used for Rx and reuse it for Tx, or the opposite.
> > A buffer put on the fill ring can only return on the Rx ring and a
> > buffer put on the Tx ring can only return on the Completion ring.
>
> Ah! So what I wrote in my original email was incorrect - a Rx buffer
> will never be put on the Completion Ring.
>
> I'm debugging a problem where after sending 'n' packets on the TX
> ring, the app expects 'n' packets to be freed from the completion ring
> - but sometimes it gets less than n (in a busy loop) or worse even
> more than n packets from the completion ring - how is this possible?
> Any pointers or leads are appreciated.
>
> This is ixgbe. Not able to reproduce on an i40e.

Sounds like a bug. Maybe in the driver as you cannot reproduce it on i40e.

> Please note that the app may put the same umem buffer into multiple Tx
> descriptors, so the same umem buffer could be in multiple descriptors
> of Tx ring and completion ring. The packet buffers are prebuilt before
> transmit begins and read only during transmit, so I presume this
> should not cause any problem, but would like to confirm anyway.

That should be fine.

> > > Is this behaviour driver specific (recycle to NIC RX-Ring or CQ) or
> > > same for all drivers in ZC mode?
> >
> > This is core AF_XDP code, so all drivers will do the same thing.
> >
> > >
> > > > > >
> > > > > > > >
> > > > > > > > >  * A Rx packet will be received in the NIC Rx Ring for Qu=
eue 0 first
> > > > > > > > >  * The driver will run the XDP program on the Rx packet b=
uffer (a UMEM buffer)
> > > > > > > > >  * If the program results in XDP_DROP, the driver will "f=
ree" the Umem
> > > > > > > > > buffer by putting it on the Completion Ring
> > > > > > > > >  * If the program results in XDP_PASS, the driver will al=
locate a
> > > > > > > > > standard Linux kernel SKB, copy the packet buffer content=
s into the
> > > > > > > > > SKB and queue it up for standard netdev processing; It wi=
ll then
> > > > > > > > > "free" the RX Umem buffer by putting it on the Completion=
 Ring (since
> > > > > > > > > we have already copied packet into the skb)
> > > > > > > >
> > > > > > > > As the buffers are kernel buffers, user-space will not be n=
otified.
> > > > > > > > The completion ring is solely for the Tx path, saying that =
user space
> > > > > > > > can have the buffer back.
> > > > > > > >
> > > > > > > > The rest is correct.
> > > > > > > >
> > > > > > > > /Magnus
> > > > > > > >
> > > > > > > > > Is this understanding correct or am I mistaken anywhere?
> > > > > > > > >
> > > > > > > > > Thanks in advance,
> > > > > > > > > Srivats
