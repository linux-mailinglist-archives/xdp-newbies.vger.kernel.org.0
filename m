Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021A47BC2CA
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Oct 2023 01:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbjJFXHS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 6 Oct 2023 19:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233737AbjJFXHS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 6 Oct 2023 19:07:18 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86E19F
        for <xdp-newbies@vger.kernel.org>; Fri,  6 Oct 2023 16:07:16 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d86a0c97ae6so3007524276.2
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Oct 2023 16:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696633636; x=1697238436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLpvx+RIRGt9dWpaQ3GfbbBUh5tsUeWDudbNEdxMnSE=;
        b=VHdzwcxvLI2evsO+qYFH5PIGZRVRW8RQcD9dJkJa8zIK1k2sogHk+Q5fTdvUnDXmF3
         3i+1qUo+Pp5+p8ERONUP3m9u6jbLJEkD1FT9A39hfzdXq2r+SO3qtGc0Ivx5Gv/j3tZw
         /dVAo0gamQUFwYOd/1NHqpyCpJVwoyxvTFGN268KefJyKSjqgpPbHzoWHVSqkCGbSadW
         2s34eZEN+BXbjaIn7NocAPg0xSTMLjw0Q6lhuZeuTSKwvJjTN40a7ChD1lZV6CoyBNmf
         jKfair4MkjS4cnvuuma8PXeFGxaZsCsNEz3ZmgqarF0dGQq/p4ravFVZ8FKSxTsfgmDo
         F/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696633636; x=1697238436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLpvx+RIRGt9dWpaQ3GfbbBUh5tsUeWDudbNEdxMnSE=;
        b=HukyN5+2GSuBZPVl7Sn66J2xW5N9Jkddt2VAjGSf6XTCuHTeEhZllQ7hugAb+YMNvZ
         Y6MoAfxSSRPrvUp8zohrxHWAL1ypZYMlk6Ct/9jLzEifKAi8CEdVvKkiTT2V7v8Wkbmj
         G1ikstCjLQ+3EgQaDkLZRnNGgJ3KyxMvCn34LOCKmXjZe59jMiSy1M8SBNG2GTiYlB25
         yUK4QEh7HuLi0jxtNnhvLry2+urmFneYqS0zkR0UIzotj/mZS8zFRvfOsxjFTU4kSXVg
         5UzkV/z/adb6G+01y18PR1BZXYG2vI2nStcLnRn4mjFYRtOOZBqiMJ8Td9HPpdHht9a+
         5NZQ==
X-Gm-Message-State: AOJu0YxEBSHIC3LzmtHujI233VXCFcFk7vJIeOly0jv2KAlbVTrFsqsv
        mpefwYlOrkxyOoU7Sanx9f8x7GP2EbK/svv7hUpkUC4F
X-Google-Smtp-Source: AGHT+IFcEaVz4q9zOmoFQzcd/Jpcp9sGZdnOI9XV61/GqRrkWEJpHN+KN+Sbzkj/ShKBVfeoIreS7PyRZf9BlH0NR/M=
X-Received: by 2002:a25:9e83:0:b0:d86:57cc:aa74 with SMTP id
 p3-20020a259e83000000b00d8657ccaa74mr8556775ybq.35.1696633635729; Fri, 06 Oct
 2023 16:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
 <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
 <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com>
 <CANzUK5-Xz5swtaTRqxWVvFx5LwEMu0u2wFdHtCxrNznpAVwXtA@mail.gmail.com>
 <CAJ8uoz3Hx4Kw6WzXCzS2LL=3sRuNZzToCv3d=dbGjj1iBPt-JA@mail.gmail.com>
 <CANzUK5_6+2tTad63HrLCesJ5k0xji2=Y33MUMqgodPV-A+Ffcw@mail.gmail.com> <CAJ8uoz2ZFFyg3VgTfE5SkEJ7rCO4PHNrgb9AkPxR2L-a2FkNZQ@mail.gmail.com>
In-Reply-To: <CAJ8uoz2ZFFyg3VgTfE5SkEJ7rCO4PHNrgb9AkPxR2L-a2FkNZQ@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Sat, 7 Oct 2023 04:36:39 +0530
Message-ID: <CANzUK5-ew8h-Cn23zj88sCVXNFy7yDZsS1NnCk57Z8g4KHh8-A@mail.gmail.com>
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

On Fri, Oct 6, 2023 at 6:34=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Fri, 6 Oct 2023 at 14:36, Srivats P <pstavirs@gmail.com> wrote:
> >
> > On Fri, Oct 6, 2023 at 5:23=E2=80=AFPM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Fri, 6 Oct 2023 at 13:41, Srivats P <pstavirs@gmail.com> wrote:
> > > >
> > > > On Thu, Oct 5, 2023 at 9:03=E2=80=AFPM Magnus Karlsson
> > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > On Thu, 5 Oct 2023 at 17:18, Srivats P <pstavirs@gmail.com> wrote=
:
> > > > > >
> > > > > > On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
> > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> w=
rote:
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > I want to clarify my AF_XDP understanding for a particular =
scenario.
> > > > > > > >
> > > > > > > > Consider a single UMEM with 1 Fill Ring and 1 Completion Ri=
ng and
> > > > > > > > single XDP socket  bound to queue 0 with 1 Tx Ring but NO R=
x Ring.
> > > > > > > > Assume the NIC has only a single queue (to keep things simp=
le for
> > > > > > > > explaining this scenario).
> > > > > > > >
> > > > > > > > There is a XDP program attached to Queue 0 which does eithe=
r a
> > > > > > > > XDP_DROP or XDP_PASS for all Rx packets.
> > > > > > > >
> > > > > > > > We are running in Driver mode.
> > > > > > > >
> > > > > > > > What happens to RX packets received on Queue 0?
> > > > > > > >
> > > > > > > > Here's my understanding -
> > > > > > > >
> > > > > > > >  * Even though there is no AF_XDP Rx Ring, there will be a =
NIC Rx Ring
> > > > > > > > for queue 0
> > > > > > > >  * The NIC Rx Ring for queue 0 is populated by the driver w=
ith UMEM
> > > > > > > > buffers taken from the Fill ring
> > > > > > >
> > > > > > > In driver mode (i.e. not zero-copy mode) this will not happen=
. The
> > > > > > > ring will be populated by kernel buffers.
> > > > > >
> > > > > > What is the behaviour in zero-copy mode?
> > > > >
> > > > > Then the behaviour is according to what you wrote above. Just not=
e
> > > > > that nothing will be returned in the fill ring as you are not sen=
ding
> > > > > anything to the AF_XDP socket.
> > > >
> > > > I assume you meant "Rx Ring" and not "Fill ring" above?
> > >
> > > Yes, sorry. Nothing will arrive in the Rx ring, and the Fill ring wil=
l
> > > not be used apart from the initial burst of buffers that will be
> > > grabbed by the system. Note though that you have to provide some
> > > buffers in the fill ring as these are the ones that are used by the
> > > NIC in zero-copy mode. They are just never returned to user-space
> > > through the Rx ring. They are just recycled in the driver so the
> > > system never needs to grab more in your scenario.
> > >
> >
> > After a XDP_DROP or XDP_PASS at RX, will the driver recycle the umem
> > buffer back into the NIC's RX-ring or will it put it on the CQ? In
> > case of the latter, the FQ will eventually run out of buffers.
>
> It will recycle it back to the Rx ring of the NIC. The kernel will
> never take a buffer used for Rx and reuse it for Tx, or the opposite.
> A buffer put on the fill ring can only return on the Rx ring and a
> buffer put on the Tx ring can only return on the Completion ring.

Ah! So what I wrote in my original email was incorrect - a Rx buffer
will never be put on the Completion Ring.

I'm debugging a problem where after sending 'n' packets on the TX
ring, the app expects 'n' packets to be freed from the completion ring
- but sometimes it gets less than n (in a busy loop) or worse even
more than n packets from the completion ring - how is this possible?
Any pointers or leads are appreciated.

This is ixgbe. Not able to reproduce on an i40e.

Please note that the app may put the same umem buffer into multiple Tx
descriptors, so the same umem buffer could be in multiple descriptors
of Tx ring and completion ring. The packet buffers are prebuilt before
transmit begins and read only during transmit, so I presume this
should not cause any problem, but would like to confirm anyway.

> > Is this behaviour driver specific (recycle to NIC RX-Ring or CQ) or
> > same for all drivers in ZC mode?
>
> This is core AF_XDP code, so all drivers will do the same thing.
>
> >
> > > > >
> > > > > > >
> > > > > > > >  * A Rx packet will be received in the NIC Rx Ring for Queu=
e 0 first
> > > > > > > >  * The driver will run the XDP program on the Rx packet buf=
fer (a UMEM buffer)
> > > > > > > >  * If the program results in XDP_DROP, the driver will "fre=
e" the Umem
> > > > > > > > buffer by putting it on the Completion Ring
> > > > > > > >  * If the program results in XDP_PASS, the driver will allo=
cate a
> > > > > > > > standard Linux kernel SKB, copy the packet buffer contents =
into the
> > > > > > > > SKB and queue it up for standard netdev processing; It will=
 then
> > > > > > > > "free" the RX Umem buffer by putting it on the Completion R=
ing (since
> > > > > > > > we have already copied packet into the skb)
> > > > > > >
> > > > > > > As the buffers are kernel buffers, user-space will not be not=
ified.
> > > > > > > The completion ring is solely for the Tx path, saying that us=
er space
> > > > > > > can have the buffer back.
> > > > > > >
> > > > > > > The rest is correct.
> > > > > > >
> > > > > > > /Magnus
> > > > > > >
> > > > > > > > Is this understanding correct or am I mistaken anywhere?
> > > > > > > >
> > > > > > > > Thanks in advance,
> > > > > > > > Srivats
