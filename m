Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336F77BA516
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Oct 2023 18:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbjJEQNj (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 5 Oct 2023 12:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239962AbjJEQMk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 5 Oct 2023 12:12:40 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057EA21A0A
        for <xdp-newbies@vger.kernel.org>; Thu,  5 Oct 2023 08:33:08 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-65d03071a07so1647376d6.0
        for <xdp-newbies@vger.kernel.org>; Thu, 05 Oct 2023 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696519987; x=1697124787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xlr804oLukfXmGG1YNyT7LuylmKXMkPFyDZF3k3fsM=;
        b=fFn2Lj6RY7PYBn97e7sJjJQZwkulRK1Rdpm2LVV4H3aFZARXdyBb57yjDzOKC7R7lz
         EFESFRwMMJ6i9sTTD0JdokSwYiYiQ3RqWemri942JstHMcTp7fd1pQgUW/Y5V/7oZfK1
         lIcQVtgkB6t4JM6Lm3M/70Rvkto7GJEaL7mjyMDG5dFl6ZBalRL/yVq+oQLxNBwleY4i
         XaZq4OM3VR2lyvTAPWMUoct3StY6OUYj/o10M4fm0x2Vr72bjv3BJq/JNSvENzYSrJZw
         rfhsOv55bNCs+xbNcTjSnXwx0a1zlhHNeTW8Phz3p0MSXhJt4rkKI2g73AqQP/dsGC58
         kSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696519987; x=1697124787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xlr804oLukfXmGG1YNyT7LuylmKXMkPFyDZF3k3fsM=;
        b=BkmyVCIiUphU5fgefrhALwZ7Ku8k2eiqZNXjIuEDBLtTXGaH5bGGH9jVWjVE6UqD7d
         OAxfYiYrtseOQ07NNbVEh7b//P1v8/MTEe1QKI8Kz8hURdZqTr2ko+uoMYCjxvwl7VNT
         s28WWStq+IjHn54a5eMiSNGawW9T4anG6Udm3l8cJj0jkbk+dBRdRxgHRsx+C0fXPO69
         QsPDn1xA37SzgbCP8etuAY/UpT1GOdOW020b0TwuLvPho5JnM11cEkBxMTX7DSSGz/qX
         43+5YLTJ5pt6MJg4OBTZB5NWyFMmhWmW04WijAdGX/deTPM7I3LENtOn5xaxpvez5oyO
         u7kQ==
X-Gm-Message-State: AOJu0Yy99H8cDrFRz4Nil9NhjGZdYXoj7VkeSfQ+MfBCBovl57vMA/oE
        QKWimD1EYyXlqbHEEroZuXNATv7h3mgSXTWjKTJEF9mnMS76wQ==
X-Google-Smtp-Source: AGHT+IEkidc8iXC1GT/ed55Z3T9aiSJTbuVEU2KpUdz02p5MWYcWfLyjs+HFB0pILdRnu7Y9AYgxtqTycB06W8/DbRo=
X-Received: by 2002:ad4:4f92:0:b0:66a:d12e:6f05 with SMTP id
 em18-20020ad44f92000000b0066ad12e6f05mr2075654qvb.6.1696519987023; Thu, 05
 Oct 2023 08:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com> <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
In-Reply-To: <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 5 Oct 2023 17:32:55 +0200
Message-ID: <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com>
Subject: Re: AF_XDP RX processing with NO rx-ring
To:     Srivats P <pstavirs@gmail.com>
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

On Thu, 5 Oct 2023 at 17:18, Srivats P <pstavirs@gmail.com> wrote:
>
> On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I want to clarify my AF_XDP understanding for a particular scenario.
> > >
> > > Consider a single UMEM with 1 Fill Ring and 1 Completion Ring and
> > > single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx Ring.
> > > Assume the NIC has only a single queue (to keep things simple for
> > > explaining this scenario).
> > >
> > > There is a XDP program attached to Queue 0 which does either a
> > > XDP_DROP or XDP_PASS for all Rx packets.
> > >
> > > We are running in Driver mode.
> > >
> > > What happens to RX packets received on Queue 0?
> > >
> > > Here's my understanding -
> > >
> > >  * Even though there is no AF_XDP Rx Ring, there will be a NIC Rx Rin=
g
> > > for queue 0
> > >  * The NIC Rx Ring for queue 0 is populated by the driver with UMEM
> > > buffers taken from the Fill ring
> >
> > In driver mode (i.e. not zero-copy mode) this will not happen. The
> > ring will be populated by kernel buffers.
>
> What is the behaviour in zero-copy mode?

Then the behaviour is according to what you wrote above. Just note
that nothing will be returned in the fill ring as you are not sending
anything to the AF_XDP socket.

> >
> > >  * A Rx packet will be received in the NIC Rx Ring for Queue 0 first
> > >  * The driver will run the XDP program on the Rx packet buffer (a UME=
M buffer)
> > >  * If the program results in XDP_DROP, the driver will "free" the Ume=
m
> > > buffer by putting it on the Completion Ring
> > >  * If the program results in XDP_PASS, the driver will allocate a
> > > standard Linux kernel SKB, copy the packet buffer contents into the
> > > SKB and queue it up for standard netdev processing; It will then
> > > "free" the RX Umem buffer by putting it on the Completion Ring (since
> > > we have already copied packet into the skb)
> >
> > As the buffers are kernel buffers, user-space will not be notified.
> > The completion ring is solely for the Tx path, saying that user space
> > can have the buffer back.
> >
> > The rest is correct.
> >
> > /Magnus
> >
> > > Is this understanding correct or am I mistaken anywhere?
> > >
> > > Thanks in advance,
> > > Srivats
