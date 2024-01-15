Return-Path: <xdp-newbies+bounces-28-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C213682D5BB
	for <lists+xdp-newbies@lfdr.de>; Mon, 15 Jan 2024 10:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25131C21111
	for <lists+xdp-newbies@lfdr.de>; Mon, 15 Jan 2024 09:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E271CC155;
	Mon, 15 Jan 2024 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRGF5L53"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286D18839
	for <xdp-newbies@vger.kernel.org>; Mon, 15 Jan 2024 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4b732e678cfso701592e0c.0
        for <xdp-newbies@vger.kernel.org>; Mon, 15 Jan 2024 01:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705310428; x=1705915228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEeD9x9eISHQ/pBtpZXpd001tVr+rK6JZPUHVqT4nXI=;
        b=WRGF5L53MC69T6N6YcbXpNx9prV6+UcKFkiz9G8iHvqxzmJXmtRMztesMmiIa9I8uT
         W0w/sgUDrenS+fVv8/QJ6lXSmzxU+SXLq0tVr40OoUf+ehIN14/VpCyjsLJjox+aQ2zM
         y/IsIzbgK5QaBJE3f4/GEwcdQ+rv4CXTtSmXcsT8wcv646anObEPe5ZDTo03ON8qQs2K
         +0zunmH3ls4S+5MHwKUGVsz4PQLvJQ0rHy4UHvuBwSTTaOlDiMHblPREVzYwiJmsGxVz
         uVdO3/IP4lOuNTmO89BYr9F3DY4e5H62ergg9OKAxYum+tscQAmZB+qpSpqDYF0qF16e
         KrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705310428; x=1705915228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEeD9x9eISHQ/pBtpZXpd001tVr+rK6JZPUHVqT4nXI=;
        b=LWKfajkxrw9xVdY1g8z0FlJz34jCsgqZDloV12kXQ/chg9aWow8FJWxLmkW9ioZZpE
         fcs6YRaNu8O9pmeQupqopbTHW5JNf20VdCEuGVKVP1oTpfhQif50mKfnN8W2y/fpw3Lg
         tl/obKYonya9Pi8LFxRzIrScLak7VgUv+8JuTpJ9luTsT7wXeh157cU9k6pHeedvirQE
         9Adwsq8gI34mz7k56VCBTdh0lfmOLXzQvT9nls8J81h/PPP7AOnHvnn3c1pZ2pBmpjgS
         sZSlLnx4iqC24we5ayXBe8wUk52nP4lvi9NDEB+eI4Q4MIhsCl+iGPWhVQP8+fF5YnDi
         X3RQ==
X-Gm-Message-State: AOJu0Ywa3lRjBkBn5C8Td2cyodhhwhZAedTangl6oHnmrVY9NhZoKJY2
	CB+OJhglKjIzuojt7bTY3z5Le76gXgIwBPj5ToeVMdNNf/Y=
X-Google-Smtp-Source: AGHT+IFQH2NE52GejNO5xg4Hpf5aJFI9oq/86ndc6/+KgmlL01WiOddrKBLFDdGNuz1EwjfeRhDwNvfsPWai6g+mrwg=
X-Received: by 2002:a05:6122:180e:b0:4b7:2dbf:c558 with SMTP id
 ay14-20020a056122180e00b004b72dbfc558mr3935561vkb.0.1705310427730; Mon, 15
 Jan 2024 01:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <52605D3E-4242-46D9-BFA8-50DDA0F6A84F@radware.com>
 <CAJ8uoz3GxW8bzrLhw8+=cbVVmYV3PXFEJNWt=Rbru0x8AR8UJw@mail.gmail.com>
 <4AD4E6DA-0949-4725-B87C-D51EC82C685E@radware.com> <CAJ8uoz3x4szq4hC7ue=QHo3cy1t-tWmEB6NkroJxQc3DnrLvHg@mail.gmail.com>
In-Reply-To: <CAJ8uoz3x4szq4hC7ue=QHo3cy1t-tWmEB6NkroJxQc3DnrLvHg@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 15 Jan 2024 10:20:16 +0100
Message-ID: <CAJ8uoz3+NtANVRVUpc+_-MVFM-J2ZrOdKXxvJccNR=ncrsv1eA@mail.gmail.com>
Subject: Re: Switching packets between queues in XDP program
To: Yuval El-Hanany <yuvale@radware.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, 
	"xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Jan 2024 at 10:12, Magnus Karlsson <magnus.karlsson@gmail.com> wr=
ote:
>
> On Tue, 2 Jan 2024 at 17:16, Yuval El-Hanany <yuvale@radware.com> wrote:
> >
> > Wow,
> > I did not expect to have the option of somebody else doing the work for=
 me ;-). I wanted to take a stab at it, but I see that coincidentally the s=
ame root cause applies to another thread (Redirect to AF_XDP socket not wor=
king with bond interface in native mode). The same fix would apply to both =
I think, and I=E2=80=99m on vacation so I can't I work it until mid January=
. Unless it takes longer, I guess I=E2=80=99ll take that stab at my next ta=
rget, which will be getting TSO to work. However, I will be able to test th=
e patch on our platform once it=E2=80=99s out.
>
> Yes, you are correct that they are related, though there needs to be
> one more patch for the bonding case to work. The current thinking is
> that something like this would solve your case (and be the base for
> the bonding problem fix):
>
> diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> index 9f13aa3353e3..f626bf1284de 100644
> --- a/net/xdp/xsk.c
> +++ b/net/xdp/xsk.c
> @@ -309,10 +309,13 @@ static bool xsk_is_bound(struct xdp_sock *xs)
>
>  static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff *xdp, u32 =
len)
>  {
> +       struct net_device *dev =3D xdp->rxq->dev;
> +       u32 qid =3D xdp->rxq->queue_index;
> +
>         if (!xsk_is_bound(xs))
>                 return -ENXIO;
>
> -       if (xs->dev !=3D xdp->rxq->dev || xs->queue_id !=3D xdp->rxq->que=
ue_index)
> +       if (xs->umem !=3D dev->_rx[qid].pool->umem)
>                 return -EINVAL;
>
>         if (len > xsk_pool_get_rx_frame_size(xs->pool) && !xs->sg) {
>
> The only thing that matters is if the socket that is found in the
> xskmap is bound to the same umem as the packet was received in. I
> think this should do the trick and solve your problem, but need to try
> it out first.
>
> Unfortunately, this is not enough for the bonding case as xs->dev
> points to the bonding device and xdp->rxq->dev points to the real NIC
> device but only _rx of the bonding device is populated with the pool
> pointer (xdp->rxq->dev->_rx is empty above) as the AF_XDP core code
> has no idea that the bonding device really consists of multiple
> devices. So some code is needed in the bonding driver to transfer this
> state from the bonding device to the active real device. But would be
> nice if I could come up with a better solution for that case, so need
> to think some more.
>
> Enjoy you vacation. I can submit this in a couple of days. Just need
> to verify that it is a good solution.

Just to let you know that the solution above works except for the
bonding driver. It will crash the system as dev->_rx[qid].pool is NULL
for the bonded device. I have been trying to find a good solution for
the bonding driver, but the one I have is rather complicated and I
would prefer something simpler. I probably should just post something
on the mailing list and ask for help as I might need some new ideas.
Anyway, it would be nice to solve the bonding problem first so that we
end up with this simple solution for this piece of functionality. That
is why this is taking its time, sorry.

> Thanks: Magnus
>
> > Happy New Year, though this year, I=E2=80=99ll settle for a year better=
 than the last to all people and nationalities,
> > Yuval.
> >
> > On 2 Jan 2024, at 11:15, Magnus Karlsson <magnus.karlsson@gmail.com> wr=
ote:
> >
> > CAUTION:External Email, Do not click on links or open attachments unles=
s you recognize the sender and know the content is safe.
> >
> > On Sat, 23 Dec 2023 at 23:25, Yuval El-Hanany <yuvale@radware.com> wrot=
e:
> >
> >
> > Hi,
> >        I=E2=80=99m designing a POC to port a large application from DPD=
K to XDP. Switching ingressing packets between different processes is part =
of the core concept of the POC. I saw a question in the Q&A of AF_XDP but t=
he question and answer seem a bit mismatched. The question is about switchi=
ng umems in copy mode and the answer is generic about switching queues.
> >
> > Q: Can I use the XSKMAP to implement a switch between different umems i=
n copy mode?
> > A: The short answer is no, that is not supported at the moment. The XSK=
MAP can only be used to switch traffic coming in on queue id X to sockets b=
ound to the same queue id X. The XSKMAP can contain sockets bound to differ=
ent queue ids, for example X and Y, but only traffic goming in from queue i=
d Y can be directed to sockets bound to the same queue id Y. In zero-copy m=
ode, you should use the switch, or other distribution mechanism, in your NI=
C to direct traffic to the correct queue id and socket.
> >
> >        My follow up question is whether this applies if I use a shared =
umem to all queues and devices. Obviously, it does not apply in user mode, =
as it=E2=80=99s possible to send the packets to any device and queue sharin=
g the umem. Is it impossible to send packets to different queues even if th=
ey share umem in the XDP program using the XSKMAP? Is this a hard limit or =
a safety measure, that may be lifted using some kernel patch? For the POC, =
the limitation may fail the whole port. I've tried to switch packets betwee=
n queues in a simple single process application in skb mode with a shared u=
mem and indeed it seems the packets did not reach their destination.
> >
> >
> > Sorry for the delay, but now I am finally back from the holidays.
> >
> > In zero-copy mode, it should be possible to lift this restriction when
> > the umem is shared between different netdevs and queue ids. My guess
> > is that this restriction in the code is there from before the time the
> > shared umem concept was introduced and it was not lifted when I
> > introduced that. The only complication I can see is that in
> > user-space, you do not know from what fill ring the buffer came from.
> > So a simple scheme such as: "after processing a buffer from the Rx
> > ring, return the buffer to the corresponding fill ring" does not work
> > anymore. But that is easy to solve, so should not be a problem.
> >
> > Do you want to take a stab at a patch or do you prefer me to do it?
> >
> > There is also the case of copy-mode that we should support, but we
> > might get that for free as it amounts to the same thing when the umem
> > is shared. However, it is also possible to support your use case (in
> > copy-mode) when the umem is not shared as we are copying the packet
> > anyway in copy-mode. Just have to pick the correct umem as the
> > destination.
> >
> >
> >        Thanks,
> >                Yuval.
> >
> >

