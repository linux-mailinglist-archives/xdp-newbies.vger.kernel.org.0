Return-Path: <xdp-newbies+bounces-94-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE88FAFE7
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Jun 2024 12:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39E71F218FA
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Jun 2024 10:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBA41448E2;
	Tue,  4 Jun 2024 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ci+H6BMm"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58322566
	for <xdp-newbies@vger.kernel.org>; Tue,  4 Jun 2024 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717497375; cv=none; b=Er8r2y2WwxiE9FWceufTNj8jIo31u1tnpyuImElqGGxDmNBS2p34W/DecnQRWPMZZirzSIkGIgoRLr2TKtwBvXPAP4Vmg24y4fYPLTsMfboO6YXsBThjCYdD9WiRMGCxDncI4hjveogtp67l1p+FIWSNH33SOrPfdcEqsiyvLC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717497375; c=relaxed/simple;
	bh=8KTvAKnCT4kMYWS1tdC0tondOcZdZN4xRxrPxGKxyOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MpNG0JLv5LE5uWmO+wf59YuBmZLZbXyv3EnNehdxGdejGkn0rjRvqsTdKduqqWpCh19QT4sF5DYKz6KPvrlOWD5B0TxNfZHx2NwQ2UDgCoslHRwNFefKuPhoCyQcU1fCpBLcigdd+Kaop3Yg5RxcmyzQTokWsDLV/htOEIids6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ci+H6BMm; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ad8265e889so5343016d6.3
        for <xdp-newbies@vger.kernel.org>; Tue, 04 Jun 2024 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717497371; x=1718102171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q3sJt7+/r+czqgCQD9s0uetAbgCTQM9s1Y15OGiZcg=;
        b=Ci+H6BMm2OMR297UnC4ZPMKAYWn2rrm3/BEtFZ7aHQEDh46uwOE0Y1G8lHI3hfrjYJ
         m/Y5N6Tai0CEG4KOTb42eoWb9UFJdYeWkwr05tuk9Nj6SwA1WgvP1vRDEcw36SjdwUbn
         JU8IxcE0uTPhPfqS30QHrzIuzaJNMM9INIl0JwDgT23E/H7UVO/+T/uMk8XRISo4Kdl5
         WszoWnpivDSt7ObT1ZlRY1g6nxYj61UnGZt8m1/CrVxCOsGgNpots1NvzMxy7nJRs1Hc
         zMD8deO0IpFrzUiNYnjdLE3/4WbYxOqEJpbM3zhtC5B9gq2JijwxvQHz0vnsMtmtGA7D
         F5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717497371; x=1718102171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q3sJt7+/r+czqgCQD9s0uetAbgCTQM9s1Y15OGiZcg=;
        b=eOwxqGM1YIVWvxBn1tLILLWf1RT9UldqR49sO+J/OLEQZ2Hrbe49gpBCPDhiRS0JrZ
         s/H6y/S6NH1erOnR70W3Dw1iA5hS5UGAv08aMeYLmKeV8xn4jkUUYcOeP/ZYLY4IxFFa
         p2upZJ0ya2RrKpMpsGrur2TOVj4jT6sniH12FeyZLNREqbONeTDVMu3F66qF/Qjw7t7l
         5zVfHJBCus0M++5673yaP8J67RxjetjtpDn22n6E1+i8BXDKCvPs5+ab0zsPplDDJaQZ
         qgKzs0w13SPKr68cA0hznqEcbGNYGHJDatXdtJgu191dNMmSDgx1y/jVReh9iLbo9jrh
         oVIg==
X-Gm-Message-State: AOJu0Yyx34tRlG4F6Tm3X8wsqGL5AqxQ714KieSRxskS+1985YVTc2Qb
	1+ybAQPYpTYJvhU6cwwwpNpXi7VaCFT3C69AXgbk76k6s0qnnt62BBYBuz4SfUDahIQtfV263ug
	zVQNY1gD0Qjxwl4oTvRiFGf8p3N5lzdA9eBicxw==
X-Google-Smtp-Source: AGHT+IEPGlTgLFAhJ8XlK/EIeF7M36lqPNAj+QWuXRbjKYyequJfZ+s5XKyCklOTDrFgOrTYYkyY9DAC37n9qao7b/s=
X-Received: by 2002:a05:6214:c48:b0:6ab:8c3b:9032 with SMTP id
 6a1803df08f44-6aecd573592mr126265446d6.1.1717497370909; Tue, 04 Jun 2024
 03:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8100DBDC-0B7C-49DB-9995-6027F6E63147@radware.com>
 <CAJ8uoz26oYyYnSe92i2G7Ab0=s2xF+OG-kQmBTETvW6QtX_4RQ@mail.gmail.com>
 <CAJ8uoz3Qk=Nk54PbNGz++5mmOqEK6aaff47ndOz=vQ5EH9rWYQ@mail.gmail.com>
 <59491E4D-9694-4B16-8E39-CF71EC4D9BD0@radware.com> <72F73FCF-7D05-4C7B-B48A-711F4B49FA35@radware.com>
 <CAJ8uoz08Td7s+-eNJ6r-Cca2MiLPujHaJyJvrTcZXHvqFNWkLw@mail.gmail.com>
 <30BEB3C8-2DC4-42BE-A56F-48E16B3E1430@radware.com> <CAJ8uoz3LpwWEj2rzE=epDT_ntAVAumKSrDviJKByrEtDDrK04g@mail.gmail.com>
 <908B2C8A-B2C9-4BA7-B537-4C8A571A4573@radware.com> <CAJ8uoz0T9O+SG6hN9yicjUrk7dNTC_X8E9DE9BLER6WvBT_vPQ@mail.gmail.com>
 <1353EC14-F1F6-4465-9AEB-0FCDAE75077F@radware.com>
In-Reply-To: <1353EC14-F1F6-4465-9AEB-0FCDAE75077F@radware.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 4 Jun 2024 12:35:59 +0200
Message-ID: <CAJ8uoz0Tf-D_pQ9w5Ng9=xU6e4xP-xZZFAR4rhiO3WHi50VbWw@mail.gmail.com>
Subject: Re: Kernel panic in XDP_REDIRECT
To: Yuval El-Hanany <yuvale@radware.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Jun 2024 at 14:35, Yuval El-Hanany <yuvale@radware.com> wrote:
>
> Hmmm=E2=80=A6
>         How would we know the CPU core =E2=80=9Cowning=E2=80=9D the socke=
t? Would it be correct to equate the queue_id with the CPU core? Otherwise,=
 the easiest is to block XDP_REDIRECT target completely from cpu_map_bpf_pr=
og_run_xdp. Other more complicated options are:
>  1. Track the first owner CPU core for the socket (first enqueued buffer?=
) and only allow redirect for the same CPU core.
>  2. Make the owner CPU core configurable.
> This would make better sense in CPUMAP. In the current fix all frames wil=
l have queue_id =3D 0, and assuming the queue_id is the basis for allowed C=
PU core it would only be possible to redirect buffers to an XSK socket from=
 core 0, which would make sense in very few scenarios.

IMO, just block the XSKMAP redirect from cpu_map_bpf_prog_run_xdp.
Simply drop the packet. This is a simple and good fix for now. If you
decide to implement and upstream the locking scheme, then we can
support the XSKMAP redirect case in cpu_map_bpf_prog_run_xdp(), if
that new feature is turned on. Then it would be safe to redirect to
the same socket from multiple threads.

>
>         Cheers,
>                 Yuval.
>
> > On 3 Jun 2024, at 15:03, Magnus Karlsson <magnus.karlsson@gmail.com> wr=
ote:
> >
> > CAUTION:External Email, Do not click on links or open attachments unles=
s you recognize the sender and know the content is safe.
> >
> > On Mon, 3 Jun 2024 at 13:21, Yuval El-Hanany <yuvale@radware.com> wrote=
:
> >>
> >> Thanks Magnus,
> >>        see inline=E2=80=A6
> >>
> >> P.S.
> >> For now setting the locks still results in a crash in the map flush. I=
 think I need to lock adding to the flush lists, but I=E2=80=99ll keep tryi=
ng. I=E2=80=99m setting locks only for the read and not send, as for send w=
e always send on the same queue as the current CPU I believe.
> >
> > Yes, you need to add locking to the flush too since it touches the
> > user-space rings.
> >
> >>
> >>> On 3 Jun 2024, at 11:35, Magnus Karlsson <magnus.karlsson@gmail.com> =
wrote:
> >>>
> >>> CAUTION:External Email, Do not click on links or open attachments unl=
ess you recognize the sender and know the content is safe.
> >>>
> >>> On Fri, 31 May 2024 at 23:29, Yuval El-Hanany <YuvalE@radware.com> wr=
ote:
> >>>>
> >>>> Hi Magnus,
> >>>>       thanks for the guidance, that=E2=80=99s extremely helpful. I=
=E2=80=99ll try to implement it soon with spin locks, and see later if I ca=
n add some low impact lockless mechanism. You don=E2=80=99t reckon, adding =
a configuration flag to the socket that would enable multi providers with s=
pin locks, is an acceptable solution? By default it would be lockless and b=
lock multi providers. Later it can be upgraded to a better solution if ther=
e=E2=80=99s a better multiproducer solution.
> >>>
> >>> That is a possible solution, though something that would have to be
> >>> sent to bpf-next as a new feature. Maybe static branches could be use=
d
> >>> to not hurt performance when it is turned off.
> >> Sounds good to me.
> >>>
> >>>>       I=E2=80=99m attaching my patch for adding the receive queue to=
 the xdp_frame so it is updated after cpumap. I=E2=80=99ve tested it and it=
 works as far as reconstructing the rx queue. I don=E2=80=99t know if you s=
till consider it necessary, but currently the rx queue is not set to any va=
lue, so its value is undefined after cpumap redirect. It is possible that t=
he undefined rx queue will match the one attached to the socket and then th=
e test for umem would be true I think. May be it should be set to -1 (and d=
efine -1 as CPUMAP receive queue) after reconstructing from xdp_frame? That=
 would block the test. I should probably use a different default value othe=
r than 0 (which is an acceptable rx queue), though I=E2=80=99m not sure the=
re=E2=80=99s a code flow that doesn=E2=80=99t set rxq, so it may be just a =
robustness condition.
> >>>
> >>> Is it not set to 0 by the following code?
> >>>
> >>> static int cpu_map_bpf_prog_run_xdp(struct bpf_cpu_map_entry *rcpu,
> >>>  void **frames, int n,
> >>>  struct xdp_cpumap_stats *stats)
> >>> {
> >>> struct xdp_rxq_info rxq =3D {};
> >>>
> >>> Looks good in general. Some comments and questions below.
> >> The init is not in 5.15.115 and 6.6.8. I=E2=80=99ll need to check the =
latest. However, it will set the receive queue to 0. So wouldn=E2=80=99t yo=
u still be able to send from any CPU to the 0 queue?
> >
> > You are correct. If we have bound queue_index 0 to a process running
> > on core 4 it could run at the same time as this CPUMAP thread on for
> > example core 2 and then we would be in the same trouble again. So we
> > need to disallow it. Could we introduce a test in
> > cpu_map_bpf_prog_run_xdp() to check if it is a XSKMAP redirect and in
> > that case throw an error? If that is possible, then we do not need to
> > pass the queue_index to fix the bug at least. Would make it a simpler
> > fix.
> >
> >>>
> >>>>       Cheers,
> >>>>               Yuval.
> >>>>
> >>>> diff -urN a/include/net/xdp.h b/include/net/xdp.h
> >>>> --- a/include/net/xdp.h 2023-06-05 07:21:27.000000000 +0000
> >>>> +++ b/include/net/xdp.h 2024-05-29 13:07:09.671697479 +0000
> >>>> @@ -117,6 +117,7 @@
> >>>>       u16 headroom;
> >>>>       u32 metasize:8;
> >>>>       u32 frame_sz:24;
> >>>> +       u32 rx_queue_index; /* Use when unpacking to xdp_buff in cpu=
map. */
> >>>>       /* Lifetime of xdp_rxq_info is limited to NAPI/enqueue time,
> >>>>        * while mem info is valid on remote CPU.
> >>>>        */
> >>>> @@ -180,6 +181,10 @@
> >>>>       xdp->data_end =3D frame->data + frame->len;
> >>>>       xdp->data_meta =3D frame->data - frame->metasize;
> >>>>       xdp->frame_sz =3D frame->frame_sz;
> >>>> +       if (xdp->rxq !=3D NULL)
> >>>
> >>> When can the rxq be NULL?
> >> I added it for robustness, I couldn=E2=80=99t find a code flow where i=
t could be NULL (theoretically rxq for CPUMAP redirect is a hack which resu=
lts in these issues, but that=E2=80=99s sort of the point).
> >
> > Then I would skip it. Somebody out there like Toke or Jesper that
> > knows this code well could probably enlight us if this will ever
> > happen. And if it crashes, someone will tell us quickly :-).
> >
> >>>
> >>>> +       {
> >>>> +               xdp->rxq->queue_index =3D frame->rx_queue_index;
> >>>> +       }
> >>>> }
> >>>>
> >>>> static inline
> >>>> @@ -206,6 +211,7 @@
> >>>>       xdp_frame->headroom =3D headroom - sizeof(*xdp_frame);
> >>>>       xdp_frame->metasize =3D metasize;
> >>>>       xdp_frame->frame_sz =3D xdp->frame_sz;
> >>>> +       xdp_frame->rx_queue_index =3D (xdp->rxq !=3D NULL) ? xdp->rx=
q->queue_index : 0;
> >>>>
> >>>>       return 0;
> >>>> }
> >>>> @@ -226,6 +232,7 @@
> >>>>
> >>>>       /* rxq only valid until napi_schedule ends, convert to xdp_mem=
_info */
> >>>>       xdp_frame->mem =3D xdp->rxq->mem;
> >>>> +       xdp_frame->rx_queue_index =3D xdp->rxq->queue_index;
> >>>
> >>> Is it enough just to put this assignment in the function above?
> >> Looking at current usage, xdp_update_frame_from_buff is only called af=
ter running a BPF program. I guess a BPF program is not supposed to update =
the queue index, so the first update is really redundant.
> >>>
> >>>>       return xdp_frame;
> >>>> }
> >>>> diff -urN a/net/core/xdp.c b/net/core/xdp.c
> >>>> --- a/net/core/xdp.c    2023-06-05 07:21:27.000000000 +0000
> >>>> +++ b/net/core/xdp.c    2024-05-29 13:08:08.880456973 +0000
> >>>> @@ -536,6 +536,7 @@
> >>>>       xdpf->metasize =3D metasize;
> >>>>       xdpf->frame_sz =3D PAGE_SIZE;
> >>>>       xdpf->mem.type =3D MEM_TYPE_PAGE_ORDER0;
> >>>> +       xdpf->rx_queue_index =3D (xdp->rxq !=3D NULL) ? xdp->rxq->qu=
eue_index : 0;
> >>>>
> >>>>       xsk_buff_free(xdp);
> >>>>       return xdpf;
> >>>>
> >>>>> On 30 May 2024, at 10:55, Magnus Karlsson <magnus.karlsson@gmail.co=
m> wrote:
> >>>>>
> >>>>> CAUTION:External Email, Do not click on links or open attachments u=
nless you recognize the sender and know the content is safe.
> >>>>>
> >>>>> On Wed, 29 May 2024 at 17:18, Yuval El-Hanany <yuvale@radware.com> =
wrote:
> >>>>>>
> >>>>>> Ouch,
> >>>>>>      not what I was hoping for :-(. I=E2=80=99m gonna think about =
it myself. You would still need to disable XSK redirect from a CPUMAP XDP p=
rogram. The rx_queue_index would be of the originating CPU (if we still fix=
 the rx_queue_index but it can=E2=80=99t be left as is anyhow), and XSK red=
irect would be able to feed to the same queue from different CPUs, if I und=
erstand the architecture correctly.
> >>>>>>
> >>>>>>      I=E2=80=99ll try to add locking and see the performance hit. =
It=E2=80=99s only the XSK redirect target that would need a lock? May be ad=
d a flag to the socket or umem that allows multicpu access and introduces a=
 lock? I really wanna get this working. For my use case, it would be the op=
timal solution. I might even go for a private kernel if there=E2=80=99s no =
way to get it in production kernel.
> >>>>>
> >>>>> You would need to add a spinlock in __xsk_rcv_zc(), __xsk_rcv() (fo=
r
> >>>>> skb mode), and xsk_flush(). Basically to all functions that access =
the
> >>>>> ring, i.e. uses functions that start with xskq_ that need to be
> >>>>> protected. To get anything like this into the standard kernel, the
> >>>>> spinlocks would have to be disabled (since they are costly) when on=
ly
> >>>>> one kthread/napi id is using the socket, but enabled when two or mo=
re
> >>>>> kthreads decide to redirect to the same socket. Since sockets can b=
e
> >>>>> added dynamically to the XSKMAP and the presence of multiple socket=
s
> >>>>> in the XSKMAP does not mean that they will all be accessed by a nap=
i
> >>>>> instance, this complicates the implementation a lot. I really do no=
t
> >>>>> want to hurt the performance of the common case that we have today.
> >>>>> But a private patch seems doable.
> >>>>>
> >>>>> Another option would be to find a way to do a lock-less multi-produ=
cer
> >>>>> / single-consumer queue using the current interface on the consumer=
 /
> >>>>> user-space side. Do not know if this is possible though. It was tri=
cky
> >>>>> enough to get the current SPSC ring correct on all architectures. A
> >>>>> MPSC ring will be harder. Adding spin-locks would be a lot simpler.
> >>>>>
> >>>>>>
> >>>>>>      Thanks,
> >>>>>>              Yuval.
> >>>>>>
> >>>>>>> On 29 May 2024, at 16:25, Magnus Karlsson <magnus.karlsson@gmail.=
com> wrote:
> >>>>>>>
> >>>>>>> CAUTION:External Email, Do not click on links or open attachments=
 unless you recognize the sender and know the content is safe.
> >>>>>>>
> >>>>>>> On Wed, 29 May 2024 at 13:07, Magnus Karlsson <magnus.karlsson@gm=
ail.com> wrote:
> >>>>>>>>
> >>>>>>>> On Wed, 29 May 2024 at 11:08, Yuval El-Hanany <YuvalE@radware.co=
m> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi,
> >>>>>>>>>     I got kernel panic on Kernel 5.15.117 (with the shared umem=
 kernel patch). The scenario was simple. Instead of redirecting to a differ=
ent cpu using CPUMAP, I=E2=80=99ve tried redirecting traffic from a CPU cor=
e to a different CPU core using XSK sockets. I used 2 cores. When each redi=
rected to the other, all worked well. When redirecting traffic from both co=
res to one core, I got a kernel panic almost immediately under load. The fl=
ush_list seems to be per cpu, but somehow it=E2=80=99s messed up when two c=
ores access the it?
> >>>>>>>>>
> >>>>>>>>>     Thanks,
> >>>>>>>>>             Yuval.
> >>>>>>>>
> >>>>>>>> Thanks Yuval. Will take a look at it.
> >>>>>>>
> >>>>>>> I think the sad conclusion here is that I need to revert the patc=
h
> >>>>>>> that I sent to you. The problem is that the rings between user-sp=
ace
> >>>>>>> and kernel-space are single producer / single consumer and allowi=
ng
> >>>>>>> two or more NAPI threads to access the same ring by performing a
> >>>>>>> redirect to the same socket at the same time will break this. The
> >>>>>>> flush is likely solvable, but the addition of entries to the same=
 ring
> >>>>>>> would require introducing locking (or a completely new ring type)
> >>>>>>> which is going to be way too expensive. With the old code, checki=
ng
> >>>>>>> that the queue_index of the queue it got the packet on being equa=
l to
> >>>>>>> the socket's queue_index would disallow this and not trigger this
> >>>>>>> problem.
> >>>>>>>
> >>>>>>> I have no idea why I did not think about this earlier. My sincere
> >>>>>>> apologies for that. I will scratch my head for a while more, but =
I am
> >>>>>>> not hopeful that I will come up with a good solution for this.
> >>>>>>>
> >>>>>>>>> Two different dumps.
> >>>>>>>>>
> >>>>>>>>> Dump 1:
> >>>>>>>>>
> >>>>>>>>> 2024-05-29T01:[  306.997548] BUG: kernel NULL pointer dereferen=
ce, address: 0000000000000008
> >>>>>>>>> [  307.088372] #PF: supervisor read access in kernel mode
> >>>>>>>>> [  307.149079] #PF: error_code(0x0000) - not-present page
> >>>>>>>>> [  307.209774] PGD 10f131067 P4D 10f131067 PUD 102642067 PMD 0
> >>>>>>>>> [  307.276608] Oops: 0000 [#1] SMP
> >>>>>>>>> [  307.313712] CPU: 3 PID: 1919 Comm: sp1 Tainted: P           =
OE     5.15.117-1-ULP-NG #1
> >>>>>>>>> [  307.408219] Hardware name: Radware Radware/Default string, B=
IOS 5.25 (785A.015) 05/11/2023
> >>>>>>>>> [  307.505779] RIP: 0010:xsk_flush+0xb/0x40
> >>>>>>>>> [  307.552099] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 =
85 a0 03 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 =
48 89 e5 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 0=
0
> >>>>>>>>> [  307.773694] RSP: 0000:ffffb7ae01037c80 EFLAGS: 00010287
> >>>>>>>>> [  307.835401] RAX: 0000000000000000 RBX: ffffa0a88f8ab768 RCX:=
 ffffa0a88f8abac0
> >>>>>>>>> [  307.919670] RDX: ffffa0a88f8abac0 RSI: 0000000000000004 RDI:=
 ffffa0a88f8ab768
> >>>>>>>>> [  308.003922] RBP: ffffb7ae01037c80 R08: ffffa0a10b3e0000 R09:=
 000000000000769f
> >>>>>>>>> [  308.088172] R10: ffffa0a1035ca000 R11: 000000000d7f9180 R12:=
 ffffa0a88f8ab768
> >>>>>>>>> [  308.172405] R13: ffffa0a88f8ebac0 R14: ffffa0a2ef135300 R15:=
 0000000000000155
> >>>>>>>>> [  308.256635] FS:  00007ffff7e97a80(0000) GS:ffffa0a88f8c0000(=
0000) knlGS:0000000000000000
> >>>>>>>>> [  308.352186] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
> >>>>>>>>> [  308.420043] CR2: 0000000000000008 CR3: 000000010cf6e000 CR4:=
 0000000000750ee0
> >>>>>>>>> [  308.504309] PKRU: 55555554
> >>>>>>>>> [  308.536296] Call Trace:
> >>>>>>>>> [  308.565209]  <TASK>
> >>>>>>>>> [  308.590026]  ? show_regs+0x56/0x60
> >>>>>>>>> [  308.630218]  ? __die_body+0x1a/0x60
> >>>>>>>>> [  308.671433]  ? __die+0x25/0x30
> >>>>>>>>> [  308.707529]  ? page_fault_oops+0xc0/0x440
> >>>>>>>>> [  308.754897]  ? do_sys_poll+0x47c/0x5e0
> >>>>>>>>> [  308.799188]  ? do_user_addr_fault+0x319/0x6e0
> >>>>>>>>> [  308.850659]  ? exc_page_fault+0x6c/0x130
> >>>>>>>>> [  308.896992]  ? asm_exc_page_fault+0x27/0x30
> >>>>>>>>> [  308.946398]  ? xsk_flush+0xb/0x40
> >>>>>>>>> [  308.985546]  __xsk_map_flush+0x3a/0x80
> >>>>>>>>> [  309.029824]  xdp_do_flush+0x13/0x20
> >>>>>>>>> [  309.071043]  i40e_finalize_xdp_rx+0x44/0x50 [i40e]
> >>>>>>>>> 56:07-08:00 NOTI[  309.127653]  i40e_clean_rx_irq_zc+0x132/0x50=
0 [i40e]
> >>>>>>>>> [  309.202736]  i40e_napi_poll+0x119/0x1270 [i40e]
> >>>>>>>>> CE  slb: real se[  309.256285]  ? xsk_sendmsg+0xf4/0x100
> >>>>>>>>> [  309.315969]  ? sock_sendmsg+0x2e/0x40
> >>>>>>>>> [  309.359244]  __napi_poll+0x23/0x160
> >>>>>>>>> [  309.400482]  net_rx_action+0x232/0x290
> >>>>>>>>> [  309.444778]  __do_softirq+0xd0/0x270
> >>>>>>>>> [  309.487012]  irq_exit_rcu+0x74/0xa0
> >>>>>>>>> [  309.528241]  common_interrupt+0x83/0xa0
> >>>>>>>>> [  309.573577]  asm_common_interrupt+0x27/0x40
> >>>>>>>>> [  309.623017] RIP: 0033:0x5cb685
> >>>>>>>>> [  309.659115] Code: b0 fb ff ff 48 8b 8d b8 fb ff ff 44 89 f8 =
23 44 91 08 74 09 31 d2 89 d1 e9 22 fe ff ff 83 85 88 fb ff ff 01 8b 95 88 =
fb ff ff <39> 15 79 31 1d 04 0f 87 c3 fd ff ff 4c 8b 9d b8 fb ff ff e9 a2 f=
8
> >>>>>>>>> [  309.880853] RSP: 002b:00007fffffffd820 EFLAGS: 00000206
> >>>>>>>>> [  309.942608] RAX: 0000000000000000 RBX: 0000000000000047 RCX:=
 00000000050912bc
> >>>>>>>>> [  310.026922] RDX: 0000000000000033 RSI: 0000000000000000 RDI:=
 0000000000000001
> >>>>>>>>> [  310.111228] RBP: 00007fffffffdd50 R08: 0000000000000001 R09:=
 0000000000000008
> >>>>>>>>> [  310.195548] R10: 0000000002f68e00 R11: 00000000050912bc R12:=
 0000000000000047
> >>>>>>>>> [  310.279877] R13: 0000000000000022 R14: 0000000004f08560 R15:=
 00000000ff55557f
> >>>>>>>>> [  310.364168]  </TASK>
> >>>>>>>>> [  310.390014] Modules linked in: uio i40e ec(PO) evdev ncs_acp=
i(O) bonding sr_mod cdrom usb_storage dwmac_intel stmmac i2c_i801 pcs_xpcs =
phylink i2c_smbus [last unloaded: i40e]
> >>>>>>>>> rvice r5, IP 4.4[  310.573779] CR2: 0000000000000008
> >>>>>>>>> [  310.629359] ---[ end trace 78cf9f96f477759d ]---
> >>>>>>>>> .4.5:80 operational, affected virt 2.2.2.10
> >>>>>>>>>
> >>>>>>>>> Dump 2:
> >>>>>>>>>
> >>>>>>>>> 2024-05-29T01:56:07-08:00 NOTICE  slb: real serve[  311.250217]=
 RIP: 0010:xsk_flush+0xb/0x40
> >>>>>>>>> [  311.300334] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 =
85 a0 03 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 =
48 89 e5 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 0=
0
> >>>>>>>>> [  311.522070] RSP: 0000:ffffb7ae01037c80 EFLAGS: 00010287
> >>>>>>>>> [  311.583811] RAX: 0000000000000000 RBX: ffffa0a88f8ab768 RCX:=
 ffffa0a88f8abac0
> >>>>>>>>> [  311.668118] RDX: ffffa0a88f8abac0 RSI: 0000000000000004 RDI:=
 ffffa0a88f8ab768
> >>>>>>>>> [  311.752405] RBP: ffffb7ae01037c80 R08: ffffa0a10b3e0000 R09:=
 000000000000769f
> >>>>>>>>> [  311.836716] R10: ffffa0a1035ca000 R11: 000000000d7f9180 R12:=
 ffffa0a88f8ab768
> >>>>>>>>> [  311.921040] R13: ffffa0a88f8ebac0 R14: ffffa0a2ef135300 R15:=
 0000000000000155
> >>>>>>>>> [  312.005358] FS:  00007ffff7e97a80(0000) GS:ffffa0a88f8c0000(=
0000) knlGS:0000000000000000
> >>>>>>>>> [  312.100975] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
> >>>>>>>>> [  312.168886] CR2: 0000000000000008 CR3: 000000010cf6e000 CR4:=
 0000000000750ee0
> >>>>>>>>> [  312.253232] PKRU: 55555554
> >>>>>>>>> [  312.285245] Kernel panic - not syncing: Fatal exception in i=
nterrupt
> >>>>>>>>> [  312.360323] Kernel Offset: 0x3a000000 from 0xffffffff8100000=
0 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> >>>>>>>>> [  312.570739] ---[ end Kernel panic - not syncing: Fatal excep=
tion in interrupt ]---
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> 2024-05-29T01:00:47-08:00 NOTICE  slb: real service r16, IP 4.4=
.4.16:80 operational, affected [  390.602501] BUG: kernel NULL pointer dere=
ference, address: 0000000000000008
> >>>>>>>>> [  390.699875] #PF: supervisor read access in kernel mode
> >>>>>>>>> [  390.760620] #PF: error_code(0x0000) - not-present page
> >>>>>>>>> [  390.821361] PGD 10d319067 P4D 10d319067 PUD 10df94067 PMD 0
> >>>>>>>>> [  390.888266] Oops: 0000 [#1] SMP
> >>>>>>>>> [  390.925409] CPU: 3 PID: 1922 Comm: sp1 Tainted: P           =
OE     5.15.117-1-ULP-NG #1
> >>>>>>>>> [  391.020040] Hardware name: Radware Radware/Default string, B=
IOS 5.25 (785A.015) 05/11/2023
> >>>>>>>>> [  391.117759] RIP: 0010:xsk_flush+0xb/0x40
> >>>>>>>>> [  391.164147] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 =
85 a0 03 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 =
48 89 e5 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 0=
0
> >>>>>>>>> [  391.386008] RSP: 0018:ffffae5c80244d48 EFLAGS: 00010287
> >>>>>>>>> [  391.447793] RAX: 0000000000000000 RBX: ffff8bb80f8ab768 RCX:=
 ffff8bb80f8abac0
> >>>>>>>>> [  391.532161] RDX: ffff8bb80f8abac0 RSI: 0000000000000004 RDI:=
 ffff8bb80f8ab768
> >>>>>>>>> [  391.616518] RBP: ffffae5c80244d48 R08: ffff8bb0845f0000 R09:=
 000000000000967a
> >>>>>>>>> [  391.700883] R10: ffff8bb0833fdc00 R11: 000000000ca5a180 R12:=
 ffff8bb80f8ab768
> >>>>>>>>> [  391.785233] R13: ffff8bb80f8ebac0 R14: ffff8bb081571b00 R15:=
 0000000000000132
> >>>>>>>>> [  391.869615] FS:  00007ffff7e97a80(0000) GS:ffff8bb80f8c0000(=
0000) knlGS:0000000000000000
> >>>>>>>>> [  391.965273] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
> >>>>>>>>> [  392.033224] CR2: 0000000000000008 CR3: 000000010d84b000 CR4:=
 0000000000750ee0
> >>>>>>>>> [  392.117580] PKRU: 55555554
> >>>>>>>>> [  392.149594] Call Trace:
> >>>>>>>>> [  392.178536]  <IRQ>
> >>>>>>>>> [  392.202345]  ? show_regs+0x56/0x60
> >>>>>>>>> [  392.242571]  ? __die_body+0x1a/0x60
> >>>>>>>>> [  392.283806]  ? __die+0x25/0x30
> >>>>>>>>> [  392.319919]  ? page_fault_oops+0xc0/0x440
> >>>>>>>>> [  392.367315]  ? i40e_msix_clean_rings+0x27/0x40 [i40e]
> >>>>>>>>> [  392.427035]  ? do_user_addr_fault+0x319/0x6e0
> >>>>>>>>> [  392.478538]  ? handle_irq_event+0x41/0x60
> >>>>>>>>> [  392.525934]  ? exc_page_fault+0x6c/0x130
> >>>>>>>>> [  392.572304]  ? asm_exc_page_fault+0x27/0x30
> >>>>>>>>> [  392.621771]  ? xsk_flush+0xb/0x40
> >>>>>>>>> [  392.660954]  ? xsk_flush+0x34/0x40
> >>>>>>>>> [  392.701174]  __xsk_map_flush+0x3a/0x80
> >>>>>>>>> [  392.745497]  xdp_do_flush+0x13/0x20
> >>>>>>>>> [  392.786749]  i40e_finalize_xdp_rx+0x44/0x50 [i40e]
> >>>>>>>>> virt 2.2.2.10
> >>>>>>>>> [  392.843370]  i40e_clean_rx_irq_zc+0x132/0x500 [i40e]
> >>>>>>>>> [  392.918465]  i40e_napi_poll+0x119/0x1270 [i40e]
> >>>>>>>>>
> >>>>>>>>> 2024-05-29T01:0[  392.972027]  ? scheduler_tick+0x9f/0xd0
> >>>>>>>>> [  393.033806]  ? tick_sched_do_timer+0x40/0x40
> >>>>>>>>> [  393.084300]  __napi_poll+0x23/0x160
> >>>>>>>>> [  393.125556]  net_rx_action+0x232/0x290
> >>>>>>>>> [  393.169869]  __do_softirq+0xd0/0x270
> >>>>>>>>> [  393.212141]  irq_exit_rcu+0x74/0xa0
> >>>>>>>>> [  393.253387]  common_interrupt+0x62/0xa0
> >>>>>>>>> [  393.298734]  </IRQ>
> >>>>>>>>> [  393.323571]  <TASK>
> >>>>>>>>> [  393.348409]  asm_common_interrupt+0x27/0x40
> >>>>>>>>> [  393.397871] RIP: 0010:__fget_light+0x43/0x100
> >>>>>>>>> [  393.449396] Code: b0 0b 00 00 8b 08 83 f9 01 75 36 48 8b 40 =
20 8b 18 39 df 73 1f 89 fa 48 39 da 48 19 db 48 8b 40 08 21 df 48 8d 04 f8 =
48 8b 00 <48> 85 c0 74 05 85 70 44 74 02 31 c0 5b 41 5c 41 5d 41 5e 41 5f 5=
d
> >>>>>>>>> [  393.671279] RSP: 0018:ffffae5c81057a98 EFLAGS: 00000202
> >>>>>>>>> [  393.733054] RAX: ffff8bb083541100 RBX: ffffffffffffffff RCX:=
 0000000000000001
> >>>>>>>>> [  393.817413] RDX: 000000000000002f RSI: 0000000000004000 RDI:=
 000000000000002f
> >>>>>>>>> [  393.901777] RBP: ffffae5c81057ac0 R08: 000000010000002f R09:=
 0000000000000000
> >>>>>>>>> [  393.986133] R10: ffffae5c81057f08 R11: 0000000000000000 R12:=
 0000000000000000
> >>>>>>>>> [  394.070506] R13: ffffae5c81057b54 R14: ffffae5c81057b4c R15:=
 ffffae5c81057b4c
> >>>>>>>>> [  394.154884]  __fdget+0xe/0x10
> >>>>>>>>> [  394.189993]  do_sys_poll+0x1fd/0x5e0
> >>>>>>>>> [  394.232287]  ? step_into+0x11f/0x750
> >>>>>>>>> [  394.274570]  ? common_interrupt+0x8e/0xa0
> >>>>>>>>> [  394.321987]  ? common_interrupt+0x8e/0xa0
> >>>>>>>>> [  394.369406]  ? asm_common_interrupt+0x27/0x40
> >>>>>>>>> [  394.420929]  ? xsk_flush+0x34/0x40
> >>>>>>>>> [  394.461166]  ? xsk_tx_peek_release_desc_batch+0x24c/0x2e0
> >>>>>>>>> [  394.525014]  ? i40e_clean_rx_irq_zc+0x342/0x500 [i40e]
> >>>>>>>>> [  394.585763]  ? i40e_xsk_wakeup+0xa2/0xc0 [i40e]
> >>>>>>>>> [  394.639332]  ? xsk_xmit+0x6d/0x6c0
> >>>>>>>>> [  394.679569]  ? i40e_napi_poll+0xc39/0x1270 [i40e]
> >>>>>>>>> [  394.735202]  ? xsk_sendmsg+0xf4/0x100
> >>>>>>>>> [  394.778498]  ? sock_sendmsg+0x2e/0x40
> >>>>>>>>> [  394.821808]  ? __sys_sendto+0x13a/0x170
> >>>>>>>>> [  394.867166]  ? __snd_timer_user_ioctl+0x9e0/0xaa0
> >>>>>>>>> [  394.922812]  ? net_rx_action+0x232/0x290
> >>>>>>>>> [  394.969206]  __x64_sys_poll+0xa0/0x130
> >>>>>>>>> [  395.013534]  ? __x64_sys_poll+0xa0/0x130
> >>>>>>>>> [  395.059930]  do_syscall_64+0x34/0xb0
> >>>>>>>>> [  395.102213]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >>>>>>>>> [  395.161948] RIP: 0033:0x7ffff76f0d47
> >>>>>>>>> [  395.204222] Code: 00 00 00 5b 49 8b 45 10 5d 41 5c 41 5d 41 =
5e c3 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 07 00 00 =
00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 1=
0
> >>>>>>>>> [  395.426119] RSP: 002b:00007fffffffe6c8 EFLAGS: 00000246 ORIG=
_RAX: 0000000000000007
> >>>>>>>>> [  395.515625] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:=
 00007ffff76f0d47
> >>>>>>>>> [  395.599996] RDX: 0000000000000000 RSI: 0000000000000001 RDI:=
 00007fffffffe6f8
> >>>>>>>>> [  395.684371] RBP: 00007ffff7e85f80 R08: 00000000173eed80 R09:=
 0000000000000051
> >>>>>>>>> [  395.768741] R10: 000001193c2583df R11: 0000000000000246 R12:=
 0000000000000000
> >>>>>>>>> [  395.853108] R13: 00007ffff7e85fb0 R14: 0000000000000000 R15:=
 0000000000000000
> >>>>>>>>> [  395.937488]  </TASK>
> >>>>>>>>> [  395.963347] Modules linked in: uio i40e ec(PO) evdev ncs_acp=
i(O) bonding sr_mod cdrom usb_storage dwmac_intel stmmac i2c_i801 pcs_xpcs =
phylink i2c_smbus [last unloaded: i40e]
> >>>>>>>>> 0:47-08:00 NOTIC[  396.147236] CR2: 0000000000000008
> >>>>>>>>> [  396.202839] ---[ end trace 9b309a97c006510f ]---
> >>>>>>>>> E  slb: real server r16, IP 4.4.4.16 operational
> >>>>>>>>>
> >>>>>>>>> 2024-05-29T01:00:47-08:00 NOTICE  slb: real [  396.344228] RIP:=
 0010:xsk_flush+0xb/0x40
> >>>>>>>>> [  396.406975] Code: a0 03 00 00 01 b8 e4 ff ff ff eb dc 49 83 =
85 a0 03 00 00 01 b8 e4 ff ff ff eb cd 0f 1f 40 00 48 8b 87 40 03 00 00 55 =
48 89 e5 <8b> 50 08 48 8b 40 10 89 10 48 8b 87 68 03 00 00 48 8b 80 80 00 0=
0
> >>>>>>>>> [  396.628859] RSP: 0018:ffffae5c80244d48 EFLAGS: 00010287
> >>>>>>>>> [  396.690632] RAX: 0000000000000000 RBX: ffff8bb80f8ab768 RCX:=
 ffff8bb80f8abac0
> >>>>>>>>> [  396.774985] RDX: ffff8bb80f8abac0 RSI: 0000000000000004 RDI:=
 ffff8bb80f8ab768
> >>>>>>>>> [  396.859346] RBP: ffffae5c80244d48 R08: ffff8bb0845f0000 R09:=
 000000000000967a
> >>>>>>>>> [  396.943694] R10: ffff8bb0833fdc00 R11: 000000000ca5a180 R12:=
 ffff8bb80f8ab768
> >>>>>>>>> [  397.028064] R13: ffff8bb80f8ebac0 R14: ffff8bb081571b00 R15:=
 0000000000000132
> >>>>>>>>> [  397.112433] FS:  00007ffff7e97a80(0000) GS:ffff8bb80f8c0000(=
0000) knlGS:0000000000000000
> >>>>>>>>> [  397.208103] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
> >>>>>>>>> [  397.276061] CR2: 0000000000000008 CR3: 000000010d84b000 CR4:=
 0000000000750ee0
> >>>>>>>>> [  397.360414] PKRU: 55555554
> >>>>>>>>> [  397.392419] Kernel panic - not syncing: Fatal exception in i=
nterrupt
> >>>>>>>>> [  397.467554] Kernel Offset: 0x34600000 from 0xffffffff8100000=
0 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> >>>>>>>>> [  397.678387] ---[ end Kernel panic - not syncing: Fatal excep=
tion in interrupt ]---
> >>
> >>
>

