Return-Path: <xdp-newbies+bounces-26-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F468229FD
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jan 2024 10:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C16C2851D8
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jan 2024 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0256A182B3;
	Wed,  3 Jan 2024 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FH4Glv0B"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52086182A9
	for <xdp-newbies@vger.kernel.org>; Wed,  3 Jan 2024 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-680b90a7a08so3488036d6.1
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Jan 2024 01:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704273145; x=1704877945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCUzxgpNgZhhpCzrsK0rWJlBiICA8A4/smSXWRKXaTQ=;
        b=FH4Glv0BuMSfk2HbcToE/DrtEm12Gm4XjM7zcLB+pVEYjDg+EEvjPz4jtHLJmXc13y
         MwR/t3WL74hFTr8zrplZoGHn9TgK9sHI3S9Sxg8Eydm6C0ck1CWMjX6CaVHCtGZVTv0X
         zONL4uJyRiRqEA4p73Tnt/d3j4F71X4S26tvz3C7LzUUZUlRzJFYLolcreCX2WXsyY0v
         sdTPK2HPeEysdo5OJ15u3k226e42X5vwFKrWrzfrSrsH0SUmPpOqSj8ibCjfe6cxVT0I
         ywfG3ImLZ7wyRx6qbZ9fxBIdWkGrzUijk6kA1eIw+Y9I/NSvHGx9uVh3PHMMarDddNUE
         DuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704273145; x=1704877945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCUzxgpNgZhhpCzrsK0rWJlBiICA8A4/smSXWRKXaTQ=;
        b=URHz559nFIlaaFbzIVgueaLaLqjWMmpujqgZVcXFrXlqOkiOPnI/CZLrHC5KeQNYDi
         nyKICK+kLz0cp0Z7DYWAbGs+JxYGJPMTm28dDw6AYPyK1mINkKCnrYSXF6GIiHFxOlgq
         R6GiFNaA5YPMtt8HtNtZlz8BGIzTGK4soF7osqe5r38KKecOoQF+LTprrQDrNmUELFq4
         l8VYK89XPgwDrOLXxcSVCDIcZ6QUqVg0zi7KkLsh2ssUYcUVC7M/vkwsccL1pq6dXbKp
         x2giHpGMthE8pSYyRlNuXMHqZW8FGH3QbHVH7O8n5xGs8JrDm7PE6hqyYIa0bEkLvtXI
         4rCg==
X-Gm-Message-State: AOJu0YxFj+EdghZC/CUni0M1Y8G5J9BnirkU8rzpkRnlsuAiHqWziwl1
	Vf04Wrr6g3s96iSx3GVQRF8v/8u8+/QQZE8JJoI=
X-Google-Smtp-Source: AGHT+IF5Y8ZvrcXPctPB0wbfhaC7E7+BTOz4K9rgAHgHwfUHyi6+mwZRb9q3OuXn59TDJUbeQpdNWS3ZgPotYg6VqsE=
X-Received: by 2002:a05:6214:258a:b0:67f:5366:4d26 with SMTP id
 fq10-20020a056214258a00b0067f53664d26mr37783032qvb.0.1704273145073; Wed, 03
 Jan 2024 01:12:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <52605D3E-4242-46D9-BFA8-50DDA0F6A84F@radware.com>
 <CAJ8uoz3GxW8bzrLhw8+=cbVVmYV3PXFEJNWt=Rbru0x8AR8UJw@mail.gmail.com> <4AD4E6DA-0949-4725-B87C-D51EC82C685E@radware.com>
In-Reply-To: <4AD4E6DA-0949-4725-B87C-D51EC82C685E@radware.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 3 Jan 2024 10:12:13 +0100
Message-ID: <CAJ8uoz3x4szq4hC7ue=QHo3cy1t-tWmEB6NkroJxQc3DnrLvHg@mail.gmail.com>
Subject: Re: Switching packets between queues in XDP program
To: Yuval El-Hanany <yuvale@radware.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, 
	"xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Jan 2024 at 17:16, Yuval El-Hanany <yuvale@radware.com> wrote:
>
> Wow,
> I did not expect to have the option of somebody else doing the work for m=
e ;-). I wanted to take a stab at it, but I see that coincidentally the sam=
e root cause applies to another thread (Redirect to AF_XDP socket not worki=
ng with bond interface in native mode). The same fix would apply to both I =
think, and I=E2=80=99m on vacation so I can't I work it until mid January. =
Unless it takes longer, I guess I=E2=80=99ll take that stab at my next targ=
et, which will be getting TSO to work. However, I will be able to test the =
patch on our platform once it=E2=80=99s out.

Yes, you are correct that they are related, though there needs to be
one more patch for the bonding case to work. The current thinking is
that something like this would solve your case (and be the base for
the bonding problem fix):

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 9f13aa3353e3..f626bf1284de 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -309,10 +309,13 @@ static bool xsk_is_bound(struct xdp_sock *xs)

 static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff *xdp, u32 le=
n)
 {
+       struct net_device *dev =3D xdp->rxq->dev;
+       u32 qid =3D xdp->rxq->queue_index;
+
        if (!xsk_is_bound(xs))
                return -ENXIO;

-       if (xs->dev !=3D xdp->rxq->dev || xs->queue_id !=3D xdp->rxq->queue=
_index)
+       if (xs->umem !=3D dev->_rx[qid].pool->umem)
                return -EINVAL;

        if (len > xsk_pool_get_rx_frame_size(xs->pool) && !xs->sg) {

The only thing that matters is if the socket that is found in the
xskmap is bound to the same umem as the packet was received in. I
think this should do the trick and solve your problem, but need to try
it out first.

Unfortunately, this is not enough for the bonding case as xs->dev
points to the bonding device and xdp->rxq->dev points to the real NIC
device but only _rx of the bonding device is populated with the pool
pointer (xdp->rxq->dev->_rx is empty above) as the AF_XDP core code
has no idea that the bonding device really consists of multiple
devices. So some code is needed in the bonding driver to transfer this
state from the bonding device to the active real device. But would be
nice if I could come up with a better solution for that case, so need
to think some more.

Enjoy you vacation. I can submit this in a couple of days. Just need
to verify that it is a good solution.

Thanks: Magnus

> Happy New Year, though this year, I=E2=80=99ll settle for a year better t=
han the last to all people and nationalities,
> Yuval.
>
> On 2 Jan 2024, at 11:15, Magnus Karlsson <magnus.karlsson@gmail.com> wrot=
e:
>
> CAUTION:External Email, Do not click on links or open attachments unless =
you recognize the sender and know the content is safe.
>
> On Sat, 23 Dec 2023 at 23:25, Yuval El-Hanany <yuvale@radware.com> wrote:
>
>
> Hi,
>        I=E2=80=99m designing a POC to port a large application from DPDK =
to XDP. Switching ingressing packets between different processes is part of=
 the core concept of the POC. I saw a question in the Q&A of AF_XDP but the=
 question and answer seem a bit mismatched. The question is about switching=
 umems in copy mode and the answer is generic about switching queues.
>
> Q: Can I use the XSKMAP to implement a switch between different umems in =
copy mode?
> A: The short answer is no, that is not supported at the moment. The XSKMA=
P can only be used to switch traffic coming in on queue id X to sockets bou=
nd to the same queue id X. The XSKMAP can contain sockets bound to differen=
t queue ids, for example X and Y, but only traffic goming in from queue id =
Y can be directed to sockets bound to the same queue id Y. In zero-copy mod=
e, you should use the switch, or other distribution mechanism, in your NIC =
to direct traffic to the correct queue id and socket.
>
>        My follow up question is whether this applies if I use a shared um=
em to all queues and devices. Obviously, it does not apply in user mode, as=
 it=E2=80=99s possible to send the packets to any device and queue sharing =
the umem. Is it impossible to send packets to different queues even if they=
 share umem in the XDP program using the XSKMAP? Is this a hard limit or a =
safety measure, that may be lifted using some kernel patch? For the POC, th=
e limitation may fail the whole port. I've tried to switch packets between =
queues in a simple single process application in skb mode with a shared ume=
m and indeed it seems the packets did not reach their destination.
>
>
> Sorry for the delay, but now I am finally back from the holidays.
>
> In zero-copy mode, it should be possible to lift this restriction when
> the umem is shared between different netdevs and queue ids. My guess
> is that this restriction in the code is there from before the time the
> shared umem concept was introduced and it was not lifted when I
> introduced that. The only complication I can see is that in
> user-space, you do not know from what fill ring the buffer came from.
> So a simple scheme such as: "after processing a buffer from the Rx
> ring, return the buffer to the corresponding fill ring" does not work
> anymore. But that is easy to solve, so should not be a problem.
>
> Do you want to take a stab at a patch or do you prefer me to do it?
>
> There is also the case of copy-mode that we should support, but we
> might get that for free as it amounts to the same thing when the umem
> is shared. However, it is also possible to support your use case (in
> copy-mode) when the umem is not shared as we are copying the packet
> anyway in copy-mode. Just have to pick the correct umem as the
> destination.
>
>
>        Thanks,
>                Yuval.
>
>

