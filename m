Return-Path: <xdp-newbies+bounces-80-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D8A8D2DB3
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2024 08:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E57F51F24C02
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 May 2024 06:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF7838DE8;
	Wed, 29 May 2024 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBDveunH"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F61607A0
	for <xdp-newbies@vger.kernel.org>; Wed, 29 May 2024 06:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965859; cv=none; b=mitq2rAsyUF8JZoL4JouvWgBlFiGGgv41XAE270T65FaM+MK/AVbg37gZ9yGAw4VRc5iqlgY8Bxs+GYteb45apUxuJUEjAIfhwW/3rB5W1Qc/RkE/2WxudikLHhYCof6EecYV1wHrfksq2ETW8CZNpIJLQ1uRmlaDP066ZN+x0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965859; c=relaxed/simple;
	bh=zExz9b1DQMwHrfFnq6feX3RjN4ODD8uN+V6StKTAZTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N52kbU1EZbtWLJNbauVX0VSjQdrOXa7UfEt/e5Y8KQKgj/Dp79TvJlEL++0jC99DVh2zMzaPN3mlYYo8P/5Omqo6ecokhqm8PND++aUu6s5hJ6pqsKZdeirt3MKqt/QU/OMyg9mHNqpoMtdrQ70WI0tTxmBPZ0fDMeOBDQ+qM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBDveunH; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ab84cd7360so1663926d6.0
        for <xdp-newbies@vger.kernel.org>; Tue, 28 May 2024 23:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716965856; x=1717570656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGEc6lUyRIASpGsQJeNuMIje9Zeu0+rw3kCHBWdJtuQ=;
        b=aBDveunHIsPgF/N0Io3YcqT6gEMIqGOZlQZz8bN2NQjaZHc1MuMc2G7UQIoF6R8djN
         ++dJP1PKnZz30zydzPLCRrhrKLkUZMSeW5Q3+9R1r4S5DAqRXUa2pqjuxpW6bsk9rSBK
         nkqHP9X85p7KuPW4JBnN8mPRscWUnAFxm76Z99pKRRoPus6hu/OrNalOJf/XgWOqkA79
         cTEgyZlxza4FtSoMuPrGSbSHXPGGB8yzAOhAJgDY+7afh1fMQBuUIPkXwo6BVi8hJW8a
         z42/EjPKjHlmqwBckDOZYOJk6JWdRY2IMgreuprWmtc6RQTijP4JadjqD5hJ4hEWYH2V
         0W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716965856; x=1717570656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGEc6lUyRIASpGsQJeNuMIje9Zeu0+rw3kCHBWdJtuQ=;
        b=HZM6HM2jkS9pWXIZviOpfN/BybkRysjC78pYCQCezB+jRhalxVXT2v3kMNUbbVnKsP
         klWIVzJXZi1O7uLmHYuDJQxqSNrVgWyEKozaW1M61UVdWaqkuC3jP8rzhU6OLvv8QDnS
         l/X+G6QP4PO3O3/CGD8x1XN4BNV3CcKe4iI3TuEv0JjxjVWaaM3+dhaNMSS/TZ2hur/F
         VtnchcQTRYlmMLdSH15p0VIECBD104clOD8ThQ8UY6jKA4QB+pdGJNWZOKCzNuUWDdO1
         nlYtXzchHWwAmCB71IBaBFYSxq4f1hfzx0m+1V0iumuxn/Hv0DYQELoWutx9o1TD0FxS
         NuGg==
X-Forwarded-Encrypted: i=1; AJvYcCV5b/G5o3LqadxYsXqKuvlwhUCIA43GD59S/tmrgtRfzigno3Lwr9dm++U9Krrxo4ps/ETXU6PejwBOd9CJJPMB4RYn2KR6MEhTBUs=
X-Gm-Message-State: AOJu0YwJxkMnnMo8JULYkLrdMXK3jOL7QFwcJK5a9PVlr8roKM66uD6C
	n1BdZaib/itG5FtnJyuRglwH8Wg0yKfgM9rIeVKLjC2sRny0Hw0KJzC4iJyjt7+FjiX31ovw8fB
	ZiOWIKlqSDFi9/h6VWXrcE6Na9ks=
X-Google-Smtp-Source: AGHT+IHzaqIOd9nCCRDMrU8ri8BA6TGuKEHGBgiy4ZHQBK8cdPiAez7yJ4IZHfkbzk+P3UINOVQ/9nXjOsDhBDPeflQ=
X-Received: by 2002:a05:6214:3012:b0:6ab:906b:4fa0 with SMTP id
 6a1803df08f44-6abe3022cfdmr166815786d6.5.1716965855961; Tue, 28 May 2024
 23:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3AF1B452-68BB-4720-87EF-90493AADD3B1@radware.com>
 <9728DE36-5871-465E-80E1-A6C5212E15F6@radware.com> <AF6F58D0-4222-466B-BCF8-7C1B3C469573@radware.com>
 <1672247E-4F8E-4941-B666-32F6DD6A175D@radware.com> <CAJ8uoz3M6TyYdjvpTOAQ-NyAsyRtj2LR_56NQmhOxyaRyiYRaQ@mail.gmail.com>
 <A859D6C5-8D4D-40CB-A3D6-E42D0D13A774@radware.com> <CAJ8uoz17afCcbCz1WpsJypKX+mCNsvSbm0C4K8R4Kv1N8mAQ-g@mail.gmail.com>
 <CAJ8uoz0uokxmUYWrFsxVSCUAdz5vGU8DP6Q7mX=Dq=SMu2-xKw@mail.gmail.com>
 <7D41F918-D9CC-4202-A38F-6D50224C913C@radware.com> <FDB91FAC-F613-4341-A5C1-CCED3E10CFE4@radware.com>
 <0B076F09-B163-482C-A3C6-7C40DF15A3FE@radware.com>
In-Reply-To: <0B076F09-B163-482C-A3C6-7C40DF15A3FE@radware.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 29 May 2024 08:57:24 +0200
Message-ID: <CAJ8uoz3qvvO3wEdAOBad79T2WzdSkWmkp=rBBn=1gFvZaWM=kw@mail.gmail.com>
Subject: Re: XDP CPU maps & shared umem
To: Yuval El-Hanany <yuvale@radware.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, 
	"xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 28 May 2024 at 18:03, Yuval El-Hanany <yuvale@radware.com> wrote:
>
> Hi,
>         this is my temporary patch to get the receive queue across the CP=
U-s. I=E2=80=99m not sure I recommend it. I avoided increasing the frame si=
ze by piggy backing on the memory model type which places data in non relev=
ant structures. It also limits the receive queue index to u16 (24 bits woul=
d also be possible). It does work and traffic is running (I=E2=80=99ll prob=
ably have a followup question on performance I expected better but I'll do =
some more testing). Another issue - it updates the rxq in xdp_buff. In the =
context of cpumap it=E2=80=99s okay as rxq is only used immediately in the =
loop and discarded after the loop. I haven=E2=80=99t found anywhere it=E2=
=80=99s wrong. But theoretically rxq may have a longer timespan, and may be=
 shared across multiple buffers. Modifying it, may affect other buffers tha=
t belong to different receive queue index.
>
>         (Sorry for the double message, previous one was not plaintext so =
it was rejected by group server)
>
>         Cheers,
>                 Yuval.
>
> diff -urN a/include/net/xdp.h b/include/net/xdp.h
> --- a/include/net/xdp.h 2023-06-05 07:21:27.000000000 +0000
> +++ b/include/net/xdp.h 2024-05-28 07:04:00.549507316 +0000
> @@ -48,7 +48,8 @@
>  #define XDP_XMIT_FLAGS_MASK    XDP_XMIT_FLUSH
>
>  struct xdp_mem_info {
> -       u32 type; /* enum xdp_mem_type, but known size type */
> +       u32 type : 16; /* enum xdp_mem_type, but known size type */
> +    u32 rx_queue_index : 16;

How about just sticking an u32 queue_index in the struct xdp_frame?
The xdp_frame is stored at the start of the 256 byte XDP metadata
section in front of the packet. I believe there is room for an extra 4
bytes there without spilling over to a new cache line. Then in the
xdp_frame from xdp_buff creation function, you always copy over the
queue_index to the xdp_frame. But when converting the xdp_frame to an
xdp_buff, you only do this for the "XDP program on a CPUMAP" case when
the action is XDP_REDIRECT. There is even a /* TODO */ in this
function for copying over the queue_index.

What do you think? Want to take a stab at it and submit a patch?

BTW, bitfields are slow so you do not want to use that. And
queue_index has nothing to do with memory type so is not a logical
place for it.

>         u32 id;
>  };
>
> @@ -180,6 +181,10 @@
>         xdp->data_end =3D frame->data + frame->len;
>         xdp->data_meta =3D frame->data - frame->metasize;
>         xdp->frame_sz =3D frame->frame_sz;
> +       if (xdp->rxq !=3D NULL)
> +       {
> +               xdp->rxq->queue_index =3D frame->mem.rx_queue_index;
> +       }
>  }
>
>  static inline
> @@ -206,6 +211,8 @@
>         xdp_frame->headroom =3D headroom - sizeof(*xdp_frame);
>         xdp_frame->metasize =3D metasize;
>         xdp_frame->frame_sz =3D xdp->frame_sz;
> +       xdp_frame->mem.rx_queue_index =3D
> +               (xdp->rxq !=3D NULL) ? xdp->rxq->queue_index : 0;
>
>         return 0;
>  }
> @@ -226,6 +233,7 @@
>
>         /* rxq only valid until napi_schedule ends, convert to xdp_mem_in=
fo */
>         xdp_frame->mem =3D xdp->rxq->mem;
> +       xdp_frame->mem.rx_queue_index =3D xdp->rxq->queue_index;
>
>         return xdp_frame;
>  }
> diff -urN a/net/core/xdp.c b/net/core/xdp.c
> --- a/net/core/xdp.c    2023-06-05 07:21:27.000000000 +0000
> +++ b/net/core/xdp.c    2024-05-28 14:05:24.531617279 +0000
> @@ -536,6 +536,7 @@
>         xdpf->metasize =3D metasize;
>         xdpf->frame_sz =3D PAGE_SIZE;
>         xdpf->mem.type =3D MEM_TYPE_PAGE_ORDER0;
> +    xdpf->mem.rx_queue_index =3D (xdp->rxq !=3D NULL) ? xdp->rxq->queue_=
index : 0;
>
>         xsk_buff_free(xdp);
>         return xdpf;
>
> > On 28 May 2024, at 15:38, Yuval El-Hanany <yuvale@radware.com> wrote:
> >
> > CAUTION:External Email, Do not click on links or open attachments unles=
s you recognize the sender and know the content is safe.
> >
> > Sure. The two patches (the second is just documentation) are below.
> >
> >        I=E2=80=99m trying to add the rx queue from xdp_buff to the xdp_=
frame and extract it back. Is the size or alignment of xdp_frame critical? =
Is it okay to add the rx queue as an extra field, or should I try to add it=
 as a bit field on an existing field like the memory type that takes 32 bit=
s but has only 4 values?
> >
> >        Cheers,
> >                Yuval.
> >
> > From: Magnus Karlsson <magnus.karlsson@gmail.com>
> > Subject: [PATCH bpf-next 1/2] xsk: support redirect to any socket bound=
 to the same umem
> > Date: 5 February 2024 at 14:35:50 GMT+2
> > To: magnus.karlsson@intel.com, bjorn@kernel.org, ast@kernel.org, daniel=
@iogearbox.net, netdev@vger.kernel.org, maciej.fijalkowski@intel.com, yuval=
e@radware.com
> > Cc: bpf@vger.kernel.org
> >
> > CAUTION:External Email, Do not click on links or open attachments unles=
s you recognize the sender and know the content is safe.
> >
> > From: Magnus Karlsson <magnus.karlsson@intel.com>
> >
> > Add support for directing a packet to any socket bound to the same
> > umem. This makes it possible to use the XDP program to select what
> > socket the packet should be received on. The user can populate the
> > XSKMAP with various sockets and as long as they share the same umem,
> > the XDP program can pick any one of them.
> >
> > Suggested-by: Yuval El-Hanany <yuvale@radware.com>
> > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> > ---
> > net/xdp/xsk.c | 5 ++++-
> > 1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 1eadfac03cc4..a339e9a1b557 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -313,10 +313,13 @@ static bool xsk_is_bound(struct xdp_sock *xs)
> >
> > static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff *xdp, u32=
 len)
> > {
> > +       struct net_device *dev =3D xdp->rxq->dev;
> > +       u32 qid =3D xdp->rxq->queue_index;
> > +
> >       if (!xsk_is_bound(xs))
> >               return -ENXIO;
> >
> > -       if (xs->dev !=3D xdp->rxq->dev || xs->queue_id !=3D xdp->rxq->q=
ueue_index)
> > +       if (!dev->_rx[qid].pool || xs->umem !=3D dev->_rx[qid].pool->um=
em)
> >               return -EINVAL;
> >
> >       if (len > xsk_pool_get_rx_frame_size(xs->pool) && !xs->sg) {
> > --
> > 2.42.0
> >
> > From: Magnus Karlsson <magnus.karlsson@intel.com>
> >
> > Document the ability to redirect to any socket bound to the same umem.
> >
> > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> > ---
> > Documentation/networking/af_xdp.rst | 33 +++++++++++++++++------------
> > 1 file changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/networking/af_xdp.rst b/Documentation/networ=
king/af_xdp.rst
> > index dceeb0d763aa..72da7057e4cf 100644
> > --- a/Documentation/networking/af_xdp.rst
> > +++ b/Documentation/networking/af_xdp.rst
> > @@ -329,23 +329,24 @@ XDP_SHARED_UMEM option and provide the initial so=
cket's fd in the
> > sxdp_shared_umem_fd field as you registered the UMEM on that
> > socket. These two sockets will now share one and the same UMEM.
> >
> > -There is no need to supply an XDP program like the one in the previous
> > -case where sockets were bound to the same queue id and
> > -device. Instead, use the NIC's packet steering capabilities to steer
> > -the packets to the right queue. In the previous example, there is only
> > -one queue shared among sockets, so the NIC cannot do this steering. It
> > -can only steer between queues.
> > -
> > -In libbpf, you need to use the xsk_socket__create_shared() API as it
> > -takes a reference to a FILL ring and a COMPLETION ring that will be
> > -created for you and bound to the shared UMEM. You can use this
> > -function for all the sockets you create, or you can use it for the
> > -second and following ones and use xsk_socket__create() for the first
> > -one. Both methods yield the same result.
> > +In this case, it is possible to use the NIC's packet steering
> > +capabilities to steer the packets to the right queue. This is not
> > +possible in the previous example as there is only one queue shared
> > +among sockets, so the NIC cannot do this steering as it can only steer
> > +between queues.
> > +
> > +In libxdp (or libbpf prior to version 1.0), you need to use the
> > +xsk_socket__create_shared() API as it takes a reference to a FILL ring
> > +and a COMPLETION ring that will be created for you and bound to the
> > +shared UMEM. You can use this function for all the sockets you create,
> > +or you can use it for the second and following ones and use
> > +xsk_socket__create() for the first one. Both methods yield the same
> > +result.
> >
> > Note that a UMEM can be shared between sockets on the same queue id
> > and device, as well as between queues on the same device and between
> > -devices at the same time.
> > +devices at the same time. It is also possible to redirect to any
> > +socket as long as it is bound to the same umem with XDP_SHARED_UMEM.
> >
> > XDP_USE_NEED_WAKEUP bind flag
> > -----------------------------
> > @@ -822,6 +823,10 @@ A: The short answer is no, that is not supported a=
t the moment. The
> >   switch, or other distribution mechanism, in your NIC to direct
> >   traffic to the correct queue id and socket.
> >
> > +   Note that if you are using the XDP_SHARED_UMEM option, it is
> > +   possible to switch traffic between any socket bound to the same
> > +   umem.
> > +
> > Q: My packets are sometimes corrupted. What is wrong?
> >
> > A: Care has to be taken not to feed the same buffer in the UMEM into
> > --
> > 2.42.0
> >
> >> On 28 May 2024, at 15:21, Magnus Karlsson <magnus.karlsson@gmail.com> =
wrote:
> >>
> >> CAUTION:External Email, Do not click on links or open attachments unle=
ss you recognize the sender and know the content is safe.
> >>
> >> On Mon, 27 May 2024 at 10:11, Magnus Karlsson <magnus.karlsson@gmail.c=
om> wrote:
> >>>
> >>> On Mon, 27 May 2024 at 09:34, Yuval El-Hanany <yuvale@radware.com> wr=
ote:
> >>>>
> >>>> Yeah,
> >>>>       as far down as I dug in the code, it seems it=E2=80=99s the on=
ly one that=E2=80=99s used. The other members are reg_state & napi_id. I=E2=
=80=99m unfamiliar with their exact purposes, but doesn=E2=80=99t sound lik=
e they=E2=80=99re necessary down the line. One other concern is txq IMO. It=
 is not initialised to any value in xdp_buff. While it may not be relevant =
considering it=E2=80=99s a received packet, it seems wrong to keep a dangli=
ng pointer both in terms of security (leaking previous values) and robustne=
ss. Maybe just set it to NULL?
> >>>>
> >>>>       I=E2=80=99ve been racking my brain as to what is the accepted =
method to pass the receive queue. Passing it on the packet headroom seemed =
like a reasonable solution, but it would mean memory access to the packet m=
emory on packet arrival on the second CPU which may be harmful to performan=
ce. The queue itself is just a pointer queue so can=E2=80=99t piggyback on =
it unless using a different kind of queue. Would be great to hear how it sh=
ould be done.
> >>>
> >>> Let me get into this piece of code and scratch my head for a while an=
d
> >>> I will get back to you. Do not have a solution on top of my head. Wil=
l
> >>> loop in Maciej too.
> >>
> >> Yuval,
> >>
> >> Could you please send me the patch that you are using? I cannot
> >> remember what I sent you :-).
> >>
> >>> /Magnus
> >>>
> >>>>       Thanks,
> >>>>               Yuval.
> >>>>
> >>>>> On 27 May 2024, at 8:48, Magnus Karlsson <magnus.karlsson@gmail.com=
> wrote:
> >>>>>
> >>>>> CAUTION:External Email, Do not click on links or open attachments u=
nless you recognize the sender and know the content is safe.
> >>>>>
> >>>>> On Sun, 26 May 2024 at 14:48, Yuval El-Hanany <yuvale@radware.com> =
wrote:
> >>>>>>
> >>>>>> Correction,
> >>>>>>      the rxq pointer is init=E2=80=99d globally for all frames bef=
ore the frame loops, but only the device and the memory information are set=
 from the XDP frame. So still an issue with the queue_index, but the tests =
on the device and memory info in xsk_rcv should be fine.
> >>>>>>
> >>>>>>      Cheers,
> >>>>>>              Yuval.
> >>>>>
> >>>>> Hi Yuval,
> >>>>>
> >>>>> Now I am back. Yes, this seems to be a bug so thank you for spottin=
g
> >>>>> it. This is nothing I have ever tested since I thought you would do=
 an
> >>>>> XSKMAP redirect to the "right" core first. But there is nothing
> >>>>> hindering that someone would do a CPUMAP redirect first then an XSK=
MAP
> >>>>> redirect, so should be supported. So in your analysis, is it only
> >>>>> queue_index that needs to be populated at CPUMAP redirect time for
> >>>>> this to work?
> >>>>>
> >>>>> Thanks: Magnus
> >>>>>
> >>>>>>> On 26 May 2024, at 12:02, Yuval El-Hanany <yuvale@radware.com> wr=
ote:
> >>>>>>>
> >>>>>>> Hi,
> >>>>>>> so I=E2=80=99ve dug a bit deeper. It seems the receive queue is n=
ot maintained across CPUs and this may make the whole practice of redirecti=
ng to XSK unsafe if I read the code correctly. It also seems this persists =
to kernel 6.6.8. Am I missing something?
> >>>>>>>
> >>>>>>> The code in cpumap runs XDP programs BUT doesn=E2=80=99t fill the=
 rxq (see also the TODO comment in the code). The XDP frame is converted to=
 XDP buffer but the rxq and txq are not filled. It seems they remain as dan=
gling pointers. When __xsk_map_redirect is called and in turn xsk_rcv the r=
xq is consulted both to check if the umem is shared (in the new patch) as w=
ell as decide whether zero copy is used or not. Since rxq is not valid, I=
=E2=80=99m not certain what the outcome is. Once I bypassed umem check, I n=
o longer crash the kernel but I'm definitely not seeing traffic running.
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Yuval.
> >>>>>>>
> >>>>>>> Here are the excerpts from the code (5.15.117):
> >>>>>>>
> >>>>>>> cpumap.c:212 <cpu_map_bpf_prog_run_xdp> =3D=3D=3D=3D=3D Note the =
comment in the code. =3D=3D=3D=3D=3D
> >>>>>>> for (i =3D 0; i < n; i++) {
> >>>>>>>     struct xdp_frame *xdpf =3D frames[i];
> >>>>>>>     u32 act;
> >>>>>>>     int err;
> >>>>>>>
> >>>>>>> rxq.dev =3D xdpf->dev_rx;
> >>>>>>>     rxq.mem =3D xdpf->mem;
> >>>>>>>     /* TODO: report queue_index to xdp_rxq_info */
> >>>>>>>
> >>>>>>>     xdp_convert_frame_to_buff(xdpf, &xdp);
> >>>>>>>
> >>>>>>>     act =3D bpf_prog_run_xdp(rcpu->prog, &xdp);
> >>>>>>>
> >>>>>>> xdp.h:175 =3D=3D=3D=3D=3D rxq & txq in the xdp_buff are not fille=
d or even reset. =3D=3D=3D=3D=3D
> >>>>>>> static inline
> >>>>>>> void xdp_convert_frame_to_buff(struct xdp_frame *frame, struct xd=
p_buff *xdp)
> >>>>>>> {
> >>>>>>> xdp->data_hard_start =3D frame->data - frame->headroom - sizeof(*=
frame);
> >>>>>>> xdp->data =3D frame->data;
> >>>>>>> xdp->data_end =3D frame->data + frame->len;
> >>>>>>> xdp->data_meta =3D frame->data - frame->metasize;
> >>>>>>> xdp->frame_sz =3D frame->frame_sz;
> >>>>>>> }
> >>>>>>>
> >>>>>>> xsk.c:269 =3D=3D=3D=3D=3D xsk_rcv consults rxq in xdp_buff which =
is not filled! =3D=3D=3D=3D=3D
> >>>>>>> static int xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
> >>>>>>> {
> >>>>>>> int err;
> >>>>>>> u32 len;
> >>>>>>>
> >>>>>>> err =3D xsk_rcv_check(xs, xdp);
> >>>>>>> if (err)
> >>>>>>>     return err;
> >>>>>>>
> >>>>>>> if (xdp->rxq->mem.type =3D=3D MEM_TYPE_XSK_BUFF_POOL) {
> >>>>>>> len =3D xdp->data_end - xdp->data;
> >>>>>>>     return __xsk_rcv_zc(xs, xdp, len);
> >>>>>>> }
> >>>>>>>
> >>>>>>> err =3D __xsk_rcv(xs, xdp);
> >>>>>>> if (!err)
> >>>>>>> xdp_return_buff(xdp);
> >>>>>>> return err;
> >>>>>>> }
> >>>>>>>
> >>>>>>> int __xsk_map_redirect(struct xdp_sock *xs, struct xdp_buff *xdp)
> >>>>>>> {
> >>>>>>> struct list_head *flush_list =3D this_cpu_ptr(&xskmap_flush_list)=
;
> >>>>>>> int err;
> >>>>>>>
> >>>>>>> err =3D xsk_rcv(xs, xdp);
> >>>>>>> if (err)
> >>>>>>> return err;
> >>>>>>>
> >>>>>>> if (!xs->flush_node.prev)
> >>>>>>>     list_add(&xs->flush_node, flush_list);
> >>>>>>>
> >>>>>>> return 0;
> >>>>>>> }
> >>>>>>>
> >>>>>>>> On 24 May 2024, at 18:49, Yuval El-Hanany <YuvalE@Radware.com> w=
rote:
> >>>>>>>>
> >>>>>>>> CAUTION:External Email, Do not click on links or open attachment=
s unless you recognize the sender and know the content is safe.
> >>>>>>>>
> >>>>>>>> Hi All,
> >>>>>>>>    I would really appreciate some guidance here. As this issue s=
pans both network XDP and CPU map, it=E2=80=99s a bit more difficult for me=
 to follow in the kernel code. I attempted to trace the issue in the source=
, but it=E2=80=99s a bit complex to enter existing code base.
> >>>>>>>>
> >>>>>>>>    It will be easier if you can tell me the following:
> >>>>>>>> 1. Is the receive queue metadata maintained correctly through th=
e CPU switch in CPU map? In the description of CPU map in XDP (https://deve=
lopers.redhat.com/blog/2021/05/13/receive-side-scaling-rss-with-ebpf-and-cp=
umap), it is mentioned that some metadata is not maintained across the CPU =
switch, but that would make the umem test problematic. Should I assume the =
receive queue is maintained?
> >>>>>>>> 2. Does XSK umem user code have access to the receive queue meta=
data memory? It seems to be in a different pointer, but it could be that it=
 points to the packet headroom in the umem accessible memory.
> >>>>>>>>
> >>>>>>>>    If the receive queue is not maintained across CPU switch then=
 I think the shared umem test should run along the lines of using some defa=
ult receive queue after switching CPUs. Otherwise, it should probably drop =
packets with invalid receive queues.
> >>>>>>>>
> >>>>>>>>    Thanks,
> >>>>>>>>            Yuval.
> >>>>>>>>
> >>>>>>>>> On 20 May 2024, at 18:24, Yuval El-Hanany <YuvalE@Radware.com> =
wrote:
> >>>>>>>>>
> >>>>>>>>> Hi,
> >>>>>>>>>
> >>>>>>>>> Short Version
> >>>>>>>>> I=E2=80=99ve encountered an issue redirecting traffic to anothe=
r CPU while using shared UMEM. The frame arrived at the redirected CPU with=
 invalid receive queue. This caused a kernel crash on the patch that suppor=
ts redirecting to packets to any queue with the same umem due to a test bas=
ed on the receive queue.
> >>>>>>>>>
> >>>>>>>>> Long Version
> >>>>>>>>> I=E2=80=99ve created a test program that redirects traffic betw=
een two interfaces (replacing the MAC address). See the code below. It star=
ts two separate processes on two different cores. When directing traffic di=
rectly to an XSK socket all works well. I=E2=80=99m running on kernel 5.15.=
117 with Magnus patch for shared umem.
> >>>>>>>>>
> >>>>>>>>> The next step was an XDP program that redirects each packet to =
the other CPU, and the xdp CPU program redirect the packets to an XDP socke=
t. Initially this resulted in a kernel crash. The reason is that the receiv=
e queue is not received correctly once the packet switches CPU.
> >>>>>>>>>
> >>>>>>>>> I=E2=80=99ve patched the kernel so it does sanity check and doe=
s not crash but defaults to queue 0 just for the umem test.
> >>>>>>>>>
> >>>>>>>>> The kernel no longer crashes but I don=E2=80=99t get the traffi=
c to the XSK sockets, and I log the receive queues and they do not seem ran=
dom:
> >>>>>>>>> On first interface:
> >>>>>>>>> 0xC1323D50
> >>>>>>>>> 0xC1343D19
> >>>>>>>>> 0xC1343D50
> >>>>>>>>>
> >>>>>>>>> On second interface:
> >>>>>>>>> 0xC134BD50
> >>>>>>>>> 0xC135BD50
> >>>>>>>>>
> >>>>>>>>> Very few bits differences between each of the =E2=80=9Creceive =
queues=E2=80=9D. I couldn=E2=80=99t really find something in my program wit=
h those or similar values, or in the packets so it makes it less likely it =
comes from something I do in userspace. Seems to suggest some flags field? =
The values are not always the same across reboots but pretty close.
> >>>>>>>>>
> >>>>>>>>> Am I doing something wrong? It seems pretty basic. Most of the =
code in the XDP program was just added for debugging. The only oddity perha=
ps is using the shared umem.
> >>>>>>>>>
> >>>>>>>>> Thanks,
> >>>>>>>>> Yuval.
> >>>>>>>>>
> >>>>>>>>> I=E2=80=99m attaching the program and values from my "debug map=
=E2=80=9D. In the debug map:
> >>>>>>>>> 0. Values 0/1 - Which type of program ran (with/without CPU red=
irection).
> >>>>>>>>> 1. Values 2XY - packet redirected from core X to core Y (1st st=
age).
> >>>>>>>>> 2. Values 4XY - packet on core X returns action Y (1st stage).
> >>>>>>>>> (These suggest that 1st stage worked correctly).
> >>>>>>>>> 3. Values 1XXYY - packet receive queue XX on core YY (XX =3D 10=
 is invalid receive queue outside 2..5).
> >>>>>>>>> 4. 2XXXX - packet receive queue on any core (XXXX - 4999 imeans=
 queue greater than 5000).
> >>>>>>>>> 5. Random entry - a receive queue.
> >>>>>>>>>
> >>>>>>>>> Debug map values without CPU redirection:
> >>>>>>>>> +------+------+--------------+
> >>>>>>>>> | Port | Key  |     Received |
> >>>>>>>>> +------+------+--------------+
> >>>>>>>>> |    0 | 1032 |          504 |
> >>>>>>>>> |    0 | 1024 |     37005992 |
> >>>>>>>>> |    0 | 1034 |     37544052 |
> >>>>>>>>> |    0 |    0 |     74546875 |
> >>>>>>>>> |    1 | 1034 |     35765961 |
> >>>>>>>>> |    1 |    0 |     71492773 |
> >>>>>>>>> |    1 | 1024 |     35729107 |
> >>>>>>>>> |    1 | 1032 |          277 |
> >>>>>>>>> +------+------+--------------+
> >>>>>>>>>
> >>>>>>>>> Debug map value with CPU redirection (no other change):
> >>>>>>>>> +------+------+--------------+
> >>>>>>>>> | Port | Key  |     Received |
> >>>>>>>>> +------+------+--------------+
> >>>>>>>>> |    0 |    1 |         3400 |
> >>>>>>>>> |    0 |  223 |         2947 |
> >>>>>>>>> |    0 |  232 |          454 |
> >>>>>>>>> |    0 |  424 |          454 |
> >>>>>>>>> |    0 |  434 |         2947 |
> >>>>>>>>> |    0 | 11002 |          454 |
> >>>>>>>>> |    0 | 11003 |         2947 |
> >>>>>>>>> |    0 | 20000 |          106 |
> >>>>>>>>> |    0 | 20016 |            7 |
> >>>>>>>>> |    0 | 20024 |         1058 |
> >>>>>>>>> |    0 | 20582 |            2 |
> >>>>>>>>> |    0 | 24999 |         2231 |
> >>>>>>>>> |    0 | 3241295184 |          339 |
> >>>>>>>>> |    0 | 3241426201 |            3 |
> >>>>>>>>> |    0 | 3241426256 |         1891 |
> >>>>>>>>> |    1 |    1 |         1013 |
> >>>>>>>>> |    1 |  223 |          610 |
> >>>>>>>>> |    1 |  232 |          404 |
> >>>>>>>>> |    1 |  424 |          404 |
> >>>>>>>>> |    1 |  434 |          610 |
> >>>>>>>>> |    1 | 11002 |          404 |
> >>>>>>>>> |    1 | 11003 |          610 |
> >>>>>>>>> |    1 | 20000 |           17 |
> >>>>>>>>> |    1 | 20024 |          309 |
> >>>>>>>>> |    1 | 24999 |          689 |
> >>>>>>>>> |    1 | 3241459024 |          309 |
> >>>>>>>>> |    1 | 3241524560 |          381 |
> >>>>>>>>> +------+------+--------------+
> >>>>>>>>>
> >>>>>>>>> The XDP code (#if 0 is for the no CPU redirection):
> >>>>>>>>> /* SPDX-License-Identifier: GPL-2.0 */
> >>>>>>>>>
> >>>>>>>>> #include <linux/if_ether.h>
> >>>>>>>>> #include <linux/bpf.h>
> >>>>>>>>> #include <linux/in.h>
> >>>>>>>>>
> >>>>>>>>> #include <bpf/bpf_helpers.h>
> >>>>>>>>> #include <bpf/bpf_endian.h>
> >>>>>>>>>
> >>>>>>>>> #include "xdp/parsing_helpers.h"
> >>>>>>>>>
> >>>>>>>>> /* Redirect to SP queues map. */
> >>>>>>>>> struct
> >>>>>>>>> {
> >>>>>>>>> __uint (type, BPF_MAP_TYPE_XSKMAP);
> >>>>>>>>> __type (key, __u32);
> >>>>>>>>> __type (value, __u32);
> >>>>>>>>> __uint (max_entries, 128);
> >>>>>>>>> } xsks_map SEC(".maps");
> >>>>>>>>>
> >>>>>>>>> /* Redirect to CPUs map. */
> >>>>>>>>> struct
> >>>>>>>>> {
> >>>>>>>>> __uint (type, BPF_MAP_TYPE_CPUMAP);
> >>>>>>>>> __uint (key_size, sizeof (__u32));
> >>>>>>>>> __uint (value_size, sizeof (struct bpf_cpumap_val));
> >>>>>>>>> __uint (max_entries, 32);
> >>>>>>>>> } cpu_map SEC(".maps");
> >>>>>>>>>
> >>>>>>>>> /* Statistics and debug maps. */
> >>>>>>>>> struct
> >>>>>>>>> {
> >>>>>>>>> __uint (type, BPF_MAP_TYPE_PERCPU_ARRAY);
> >>>>>>>>> __type (key, __u32);
> >>>>>>>>> __type (value, __u32);
> >>>>>>>>> __uint (max_entries, 64);
> >>>>>>>>> } xdp_stats_map SEC(".maps");
> >>>>>>>>>
> >>>>>>>>> struct
> >>>>>>>>> {
> >>>>>>>>> __uint (type, BPF_MAP_TYPE_HASH);
> >>>>>>>>> __type (key, __u32);
> >>>>>>>>> __type (value, __u32);
> >>>>>>>>> __uint (max_entries, 64);
> >>>>>>>>> } xdp_debug_proto SEC(".maps");
> >>>>>>>>>
> >>>>>>>>> static __u32 oneval =3D 1;
> >>>>>>>>>
> >>>>>>>>> int my_parse_ethhdr (struct hdr_cursor* nh, void* dataend, stru=
ct ethhdr** eth)
> >>>>>>>>> {
> >>>>>>>>> __u16 ethtype;
> >>>>>>>>> *eth =3D nh->pos;
> >>>>>>>>> if ((void*) &(*eth) [1] > dataend)
> >>>>>>>>> {
> >>>>>>>>> return (-1);
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>> ethtype =3D (*eth)->h_proto;
> >>>>>>>>> nh->pos =3D &(*eth) [1];
> >>>>>>>>> if (ethtype =3D=3D bpf_ntohs (ETH_P_8021Q))
> >>>>>>>>> {
> >>>>>>>>> struct vlan_hdr* vlan =3D (struct vlan_hdr*) &(*eth) [1];
> >>>>>>>>> if ((void*) &vlan [1] > dataend)
> >>>>>>>>> {
> >>>>>>>>>        return (-1);
> >>>>>>>>> }
> >>>>>>>>>    ethtype =3D vlan->h_vlan_encapsulated_proto;
> >>>>>>>>> /* inc_debug_map (10000+(bpf_ntohs (vlan->h_vlan_TCI) & 0x0FFF)=
); */
> >>>>>>>>> /* inc_debug_map (vlan->h_vlan_TCI); */
> >>>>>>>>> nh->pos =3D &vlan [1];
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>> return (ethtype);
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>> static void inc_debug_map (__u32 key)
> >>>>>>>>> {
> >>>>>>>>> #ifdef WITH_STATS
> >>>>>>>>> bpf_map_update_elem (&xdp_debug_proto,
> >>>>>>>>>                     &key, (__u32*) &oneval, BPF_NOEXIST);
> >>>>>>>>> __u32* rec =3D bpf_map_lookup_elem (&xdp_debug_proto, (__u32*) =
&key);
> >>>>>>>>> if (rec !=3D NULL)
> >>>>>>>>> {
> >>>>>>>>> ++(*rec);
> >>>>>>>>> }
> >>>>>>>>> #endif
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> SEC ("xdp")
> >>>>>>>>> int rdwr_xsk_prog (struct xdp_md *ctx)
> >>>>>>>>> {
> >>>>>>>>> enum xdp_action action;
> >>>>>>>>> int index =3D ctx->rx_queue_index;
> >>>>>>>>> void* dataend =3D (void *)(long)ctx->data_end;
> >>>>>>>>> void* data =3D (void *)(long)ctx->data;
> >>>>>>>>> int stage =3D 0;
> >>>>>>>>>
> >>>>>>>>> struct hdr_cursor nh;
> >>>>>>>>>
> >>>>>>>>> __u32 *pkt_count;
> >>>>>>>>> struct ethhdr* eth;
> >>>>>>>>>
> >>>>>>>>> #ifdef WITH_STATS
> >>>>>>>>> pkt_count =3D bpf_map_lookup_elem(&xdp_stats_map, &index);
> >>>>>>>>> if (pkt_count !=3D NULL)
> >>>>>>>>> {
> >>>>>>>>> ++*pkt_count;
> >>>>>>>>> }
> >>>>>>>>> #endif
> >>>>>>>>>
> >>>>>>>>> /* Parse Ethernet & VLAN */
> >>>>>>>>> nh.pos =3D data;
> >>>>>>>>> int ethtype =3D my_parse_ethhdr (&nh, dataend, &eth);
> >>>>>>>>> if (ethtype !=3D bpf_ntohs (0x0800))
> >>>>>>>>> {
> >>>>>>>>> return (XDP_PASS);
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>> /* Direct XSK redirect. */
> >>>>>>>>> #if 0
> >>>>>>>>> inc_debug_map (stage);
> >>>>>>>>> action =3D  bpf_redirect_map (&xsks_map, index, XDP_PASS);
> >>>>>>>>> inc_debug_map (1000 + index*10 + action);
> >>>>>>>>> #endif
> >>>>>>>>> /* CPU map redirect. */
> >>>>>>>>> __u32 cpuid =3D bpf_get_smp_processor_id ();
> >>>>>>>>> __u32 targetcpu =3D cpuid ^ 0x01;
> >>>>>>>>> ++stage;
> >>>>>>>>> inc_debug_map (stage);
> >>>>>>>>> inc_debug_map (200 + cpuid * 10 + targetcpu);
> >>>>>>>>> action =3D  bpf_redirect_map (&cpu_map, targetcpu, XDP_PASS);
> >>>>>>>>> inc_debug_map (400 + targetcpu * 10 + action);
> >>>>>>>>> return (action);
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>> SEC ("xdp/cpumap")
> >>>>>>>>> int rdwr_cpu_prog(struct xdp_md *ctx)
> >>>>>>>>> {
> >>>>>>>>> __u64* dataend64 =3D (__u64*) (long) ctx->data_end;
> >>>>>>>>> __u64* data64 =3D (__u64*) (long) ctx->data;
> >>>>>>>>> __u32 rxqueue =3D ctx->rx_queue_index;
> >>>>>>>>> if (rxqueue < 5000)
> >>>>>>>>> {
> >>>>>>>>> inc_debug_map (20000 + rxqueue);
> >>>>>>>>> }
> >>>>>>>>> else
> >>>>>>>>> {
> >>>>>>>>> inc_debug_map (rxqueue);
> >>>>>>>>> inc_debug_map (24999);
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>> rxqueue =3D (rxqueue >=3D 2 && rxqueue < 6) ? rxqueue : 10;
> >>>>>>>>> __u32 cpuid =3D bpf_get_smp_processor_id ();
> >>>>>>>>> cpuid =3D (cpuid < 12) ? cpuid : 20;
> >>>>>>>>> inc_debug_map (10000 + 100*rxqueue + cpuid);
> >>>>>>>>>
> >>>>>>>>> return bpf_redirect_map (&xsks_map, bpf_get_smp_processor_id ()=
, 0);
> >>>>>>>>> }
>
>

