Return-Path: <xdp-newbies+bounces-76-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B78CFB0E
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 May 2024 10:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6AC1C20CEF
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 May 2024 08:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FD83D0D0;
	Mon, 27 May 2024 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWvaEb6X"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214E3BBE1
	for <xdp-newbies@vger.kernel.org>; Mon, 27 May 2024 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797499; cv=none; b=Z7e7qMriZ5ty5B26oBkqxPr725bavhcoFMLiCpU/QFDaCK1jxH2ypsHPSxDabXTkNLY6NJA9RLcY/GJye55+xmx4woUUyfdZ5L2Uz4V4D2e/6KDPcie9AJskkZrYw1vsDrxExh3U/fUH6uMCnjavGG9VcfGxi3a0/3La+OAPquI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797499; c=relaxed/simple;
	bh=e+/THoomEGDh75Arx7cNkLjlELVgwu+8chT/+III+Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MpCyJblgbvogYY1FAUIp0gnn3lqjSURQ8klVcG6g2st/C938EgisM6xI5ssZnL9Vcsem8pdHgnFDbbwfThEX0lB/pW4c9VP8Li+e93oEkaLKOtKJC7MoHgp5Nsa0MBn+VAGKfgRTfzoo1FDC5t4tS42dK7xusUC3KUhTAKHKYNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWvaEb6X; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ab9d3f5708so2091116d6.3
        for <xdp-newbies@vger.kernel.org>; Mon, 27 May 2024 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716797496; x=1717402296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cN4bqUETmBTcRMp34KFn1OjJfUww+7ZX9sUUNKyEVMg=;
        b=FWvaEb6XgRx9G9QSbrUP6wjgJVBBsCGGCiNePqkjqTruACxZoi//lqFvIWkK2rnYCO
         ZwEFVoWKkZGvhrardjKd6k1b4I/PPvvlmcUDRln+X/LgB6+Zx7+kXCvFSFkOGK4rXC57
         5bg8PTuCiXNPccGSJGYzP8vhPgFfrWvkZyjGVIm+DCscS/53mud568vvaOA1ytLmmMQZ
         sOFE0LRRDU2fd+p1wmgNmrICnC65pPUTl5nhoizcn0Wq7cNZjH1If2ryVkVA0PCgU9yQ
         GeOoOHd3eq3BxQXYa1nH17XqZIqAp18ykLyXLtYiYLAfAvR+5WY8Afv/P6wfm7SBnwt/
         6o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797496; x=1717402296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cN4bqUETmBTcRMp34KFn1OjJfUww+7ZX9sUUNKyEVMg=;
        b=m1FgL7hF6Jo/i8odNXTIpuZXoV1xwpmxvQu1MDZde4D+wykDk5Y6XjeCwVNHPVkWP6
         5tZveVZNEiOwYxCkwX8nBO/dcOIBH3gRZKp5QcVunNwlFGGEOD/MrTqeCcbY9q0cAOyP
         iq8vKBnnL+Rb2hYmXl+fywdQ0C+i9v5okzmJmWMCKZIWvz22G6AVfxBzSoXOQKyy3Uve
         czHfqoYw0Grcq9HhvsLCG1gHgUAGw6rrWlTP+xlsqLmJDimcehbrpcdatG0vtTalyiCt
         vgQNFwclyZWOqfAZnpdP3kLJwvec2N2ZHi+u0uo1pNwGkzsBRdPnQ6AidY9f8O7Pj0ve
         KBDQ==
X-Gm-Message-State: AOJu0Yy+V0AcNynH8RxM0bson2m2/jERBgbvSL9PD1S63X5Dfqa/Ho+z
	vxFFIUziXL7V1U3LcRq3SErAhTaaDDPe9v3/YovGDtPFsi3C3Q5/etr8vWSSd4xK0HFG3gGNt97
	A36P0/vTauaBlEM3z5Hnfix4fPwk=
X-Google-Smtp-Source: AGHT+IHAwfiWRhF1dGj99UNyMucWxzQAi74/adNH/xcImMLWvTVahgEHQlNiNbbESelYOfdTkYywB1tfcQB52YltAkg=
X-Received: by 2002:ad4:5948:0:b0:6a0:87e5:210c with SMTP id
 6a1803df08f44-6abdfd2d442mr91848386d6.5.1716797495984; Mon, 27 May 2024
 01:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3AF1B452-68BB-4720-87EF-90493AADD3B1@radware.com>
 <9728DE36-5871-465E-80E1-A6C5212E15F6@radware.com> <AF6F58D0-4222-466B-BCF8-7C1B3C469573@radware.com>
 <1672247E-4F8E-4941-B666-32F6DD6A175D@radware.com> <CAJ8uoz3M6TyYdjvpTOAQ-NyAsyRtj2LR_56NQmhOxyaRyiYRaQ@mail.gmail.com>
 <A859D6C5-8D4D-40CB-A3D6-E42D0D13A774@radware.com>
In-Reply-To: <A859D6C5-8D4D-40CB-A3D6-E42D0D13A774@radware.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 27 May 2024 10:11:25 +0200
Message-ID: <CAJ8uoz17afCcbCz1WpsJypKX+mCNsvSbm0C4K8R4Kv1N8mAQ-g@mail.gmail.com>
Subject: Re: XDP CPU maps & shared umem
To: Yuval El-Hanany <yuvale@radware.com>, 
	"Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 May 2024 at 09:34, Yuval El-Hanany <yuvale@radware.com> wrote:
>
> Yeah,
>         as far down as I dug in the code, it seems it=E2=80=99s the only =
one that=E2=80=99s used. The other members are reg_state & napi_id. I=E2=80=
=99m unfamiliar with their exact purposes, but doesn=E2=80=99t sound like t=
hey=E2=80=99re necessary down the line. One other concern is txq IMO. It is=
 not initialised to any value in xdp_buff. While it may not be relevant con=
sidering it=E2=80=99s a received packet, it seems wrong to keep a dangling =
pointer both in terms of security (leaking previous values) and robustness.=
 Maybe just set it to NULL?
>
>         I=E2=80=99ve been racking my brain as to what is the accepted met=
hod to pass the receive queue. Passing it on the packet headroom seemed lik=
e a reasonable solution, but it would mean memory access to the packet memo=
ry on packet arrival on the second CPU which may be harmful to performance.=
 The queue itself is just a pointer queue so can=E2=80=99t piggyback on it =
unless using a different kind of queue. Would be great to hear how it shoul=
d be done.

Let me get into this piece of code and scratch my head for a while and
I will get back to you. Do not have a solution on top of my head. Will
loop in Maciej too.

/Magnus

>         Thanks,
>                 Yuval.
>
> > On 27 May 2024, at 8:48, Magnus Karlsson <magnus.karlsson@gmail.com> wr=
ote:
> >
> > CAUTION:External Email, Do not click on links or open attachments unles=
s you recognize the sender and know the content is safe.
> >
> > On Sun, 26 May 2024 at 14:48, Yuval El-Hanany <yuvale@radware.com> wrot=
e:
> >>
> >> Correction,
> >>        the rxq pointer is init=E2=80=99d globally for all frames befor=
e the frame loops, but only the device and the memory information are set f=
rom the XDP frame. So still an issue with the queue_index, but the tests on=
 the device and memory info in xsk_rcv should be fine.
> >>
> >>        Cheers,
> >>                Yuval.
> >
> > Hi Yuval,
> >
> > Now I am back. Yes, this seems to be a bug so thank you for spotting
> > it. This is nothing I have ever tested since I thought you would do an
> > XSKMAP redirect to the "right" core first. But there is nothing
> > hindering that someone would do a CPUMAP redirect first then an XSKMAP
> > redirect, so should be supported. So in your analysis, is it only
> > queue_index that needs to be populated at CPUMAP redirect time for
> > this to work?
> >
> > Thanks: Magnus
> >
> >>> On 26 May 2024, at 12:02, Yuval El-Hanany <yuvale@radware.com> wrote:
> >>>
> >>> Hi,
> >>> so I=E2=80=99ve dug a bit deeper. It seems the receive queue is not m=
aintained across CPUs and this may make the whole practice of redirecting t=
o XSK unsafe if I read the code correctly. It also seems this persists to k=
ernel 6.6.8. Am I missing something?
> >>>
> >>> The code in cpumap runs XDP programs BUT doesn=E2=80=99t fill the rxq=
 (see also the TODO comment in the code). The XDP frame is converted to XDP=
 buffer but the rxq and txq are not filled. It seems they remain as danglin=
g pointers. When __xsk_map_redirect is called and in turn xsk_rcv the rxq i=
s consulted both to check if the umem is shared (in the new patch) as well =
as decide whether zero copy is used or not. Since rxq is not valid, I=E2=80=
=99m not certain what the outcome is. Once I bypassed umem check, I no long=
er crash the kernel but I'm definitely not seeing traffic running.
> >>>
> >>> Thanks,
> >>> Yuval.
> >>>
> >>> Here are the excerpts from the code (5.15.117):
> >>>
> >>> cpumap.c:212 <cpu_map_bpf_prog_run_xdp> =3D=3D=3D=3D=3D Note the comm=
ent in the code. =3D=3D=3D=3D=3D
> >>>   for (i =3D 0; i < n; i++) {
> >>>       struct xdp_frame *xdpf =3D frames[i];
> >>>       u32 act;
> >>>       int err;
> >>>
> >>> rxq.dev =3D xdpf->dev_rx;
> >>>       rxq.mem =3D xdpf->mem;
> >>>       /* TODO: report queue_index to xdp_rxq_info */
> >>>
> >>>       xdp_convert_frame_to_buff(xdpf, &xdp);
> >>>
> >>>       act =3D bpf_prog_run_xdp(rcpu->prog, &xdp);
> >>>
> >>> xdp.h:175 =3D=3D=3D=3D=3D rxq & txq in the xdp_buff are not filled or=
 even reset. =3D=3D=3D=3D=3D
> >>> static inline
> >>> void xdp_convert_frame_to_buff(struct xdp_frame *frame, struct xdp_bu=
ff *xdp)
> >>> {
> >>>   xdp->data_hard_start =3D frame->data - frame->headroom - sizeof(*fr=
ame);
> >>>   xdp->data =3D frame->data;
> >>>   xdp->data_end =3D frame->data + frame->len;
> >>>   xdp->data_meta =3D frame->data - frame->metasize;
> >>>   xdp->frame_sz =3D frame->frame_sz;
> >>> }
> >>>
> >>> xsk.c:269 =3D=3D=3D=3D=3D xsk_rcv consults rxq in xdp_buff which is n=
ot filled! =3D=3D=3D=3D=3D
> >>> static int xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
> >>> {
> >>>   int err;
> >>>   u32 len;
> >>>
> >>>   err =3D xsk_rcv_check(xs, xdp);
> >>>   if (err)
> >>>       return err;
> >>>
> >>>   if (xdp->rxq->mem.type =3D=3D MEM_TYPE_XSK_BUFF_POOL) {
> >>> len =3D xdp->data_end - xdp->data;
> >>>       return __xsk_rcv_zc(xs, xdp, len);
> >>>   }
> >>>
> >>>   err =3D __xsk_rcv(xs, xdp);
> >>>   if (!err)
> >>> xdp_return_buff(xdp);
> >>>   return err;
> >>> }
> >>>
> >>> int __xsk_map_redirect(struct xdp_sock *xs, struct xdp_buff *xdp)
> >>> {
> >>>   struct list_head *flush_list =3D this_cpu_ptr(&xskmap_flush_list);
> >>>   int err;
> >>>
> >>>   err =3D xsk_rcv(xs, xdp);
> >>>   if (err)
> >>> return err;
> >>>
> >>>   if (!xs->flush_node.prev)
> >>>       list_add(&xs->flush_node, flush_list);
> >>>
> >>>   return 0;
> >>> }
> >>>
> >>>> On 24 May 2024, at 18:49, Yuval El-Hanany <YuvalE@Radware.com> wrote=
:
> >>>>
> >>>> CAUTION:External Email, Do not click on links or open attachments un=
less you recognize the sender and know the content is safe.
> >>>>
> >>>> Hi All,
> >>>>      I would really appreciate some guidance here. As this issue spa=
ns both network XDP and CPU map, it=E2=80=99s a bit more difficult for me t=
o follow in the kernel code. I attempted to trace the issue in the source, =
but it=E2=80=99s a bit complex to enter existing code base.
> >>>>
> >>>>      It will be easier if you can tell me the following:
> >>>> 1. Is the receive queue metadata maintained correctly through the CP=
U switch in CPU map? In the description of CPU map in XDP (https://develope=
rs.redhat.com/blog/2021/05/13/receive-side-scaling-rss-with-ebpf-and-cpumap=
), it is mentioned that some metadata is not maintained across the CPU swit=
ch, but that would make the umem test problematic. Should I assume the rece=
ive queue is maintained?
> >>>> 2. Does XSK umem user code have access to the receive queue metadata=
 memory? It seems to be in a different pointer, but it could be that it poi=
nts to the packet headroom in the umem accessible memory.
> >>>>
> >>>>      If the receive queue is not maintained across CPU switch then I=
 think the shared umem test should run along the lines of using some defaul=
t receive queue after switching CPUs. Otherwise, it should probably drop pa=
ckets with invalid receive queues.
> >>>>
> >>>>      Thanks,
> >>>>              Yuval.
> >>>>
> >>>>> On 20 May 2024, at 18:24, Yuval El-Hanany <YuvalE@Radware.com> wrot=
e:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> Short Version
> >>>>> I=E2=80=99ve encountered an issue redirecting traffic to another CP=
U while using shared UMEM. The frame arrived at the redirected CPU with inv=
alid receive queue. This caused a kernel crash on the patch that supports r=
edirecting to packets to any queue with the same umem due to a test based o=
n the receive queue.
> >>>>>
> >>>>> Long Version
> >>>>> I=E2=80=99ve created a test program that redirects traffic between =
two interfaces (replacing the MAC address). See the code below. It starts t=
wo separate processes on two different cores. When directing traffic direct=
ly to an XSK socket all works well. I=E2=80=99m running on kernel 5.15.117 =
with Magnus patch for shared umem.
> >>>>>
> >>>>> The next step was an XDP program that redirects each packet to the =
other CPU, and the xdp CPU program redirect the packets to an XDP socket. I=
nitially this resulted in a kernel crash. The reason is that the receive qu=
eue is not received correctly once the packet switches CPU.
> >>>>>
> >>>>> I=E2=80=99ve patched the kernel so it does sanity check and does no=
t crash but defaults to queue 0 just for the umem test.
> >>>>>
> >>>>> The kernel no longer crashes but I don=E2=80=99t get the traffic to=
 the XSK sockets, and I log the receive queues and they do not seem random:
> >>>>> On first interface:
> >>>>> 0xC1323D50
> >>>>> 0xC1343D19
> >>>>> 0xC1343D50
> >>>>>
> >>>>> On second interface:
> >>>>> 0xC134BD50
> >>>>> 0xC135BD50
> >>>>>
> >>>>> Very few bits differences between each of the =E2=80=9Creceive queu=
es=E2=80=9D. I couldn=E2=80=99t really find something in my program with th=
ose or similar values, or in the packets so it makes it less likely it come=
s from something I do in userspace. Seems to suggest some flags field? The =
values are not always the same across reboots but pretty close.
> >>>>>
> >>>>> Am I doing something wrong? It seems pretty basic. Most of the code=
 in the XDP program was just added for debugging. The only oddity perhaps i=
s using the shared umem.
> >>>>>
> >>>>> Thanks,
> >>>>> Yuval.
> >>>>>
> >>>>> I=E2=80=99m attaching the program and values from my "debug map=E2=
=80=9D. In the debug map:
> >>>>> 0. Values 0/1 - Which type of program ran (with/without CPU redirec=
tion).
> >>>>> 1. Values 2XY - packet redirected from core X to core Y (1st stage)=
.
> >>>>> 2. Values 4XY - packet on core X returns action Y (1st stage).
> >>>>> (These suggest that 1st stage worked correctly).
> >>>>> 3. Values 1XXYY - packet receive queue XX on core YY (XX =3D 10 is =
invalid receive queue outside 2..5).
> >>>>> 4. 2XXXX - packet receive queue on any core (XXXX - 4999 imeans que=
ue greater than 5000).
> >>>>> 5. Random entry - a receive queue.
> >>>>>
> >>>>> Debug map values without CPU redirection:
> >>>>> +------+------+--------------+
> >>>>> | Port | Key  |     Received |
> >>>>> +------+------+--------------+
> >>>>> |    0 | 1032 |          504 |
> >>>>> |    0 | 1024 |     37005992 |
> >>>>> |    0 | 1034 |     37544052 |
> >>>>> |    0 |    0 |     74546875 |
> >>>>> |    1 | 1034 |     35765961 |
> >>>>> |    1 |    0 |     71492773 |
> >>>>> |    1 | 1024 |     35729107 |
> >>>>> |    1 | 1032 |          277 |
> >>>>> +------+------+--------------+
> >>>>>
> >>>>> Debug map value with CPU redirection (no other change):
> >>>>> +------+------+--------------+
> >>>>> | Port | Key  |     Received |
> >>>>> +------+------+--------------+
> >>>>> |    0 |    1 |         3400 |
> >>>>> |    0 |  223 |         2947 |
> >>>>> |    0 |  232 |          454 |
> >>>>> |    0 |  424 |          454 |
> >>>>> |    0 |  434 |         2947 |
> >>>>> |    0 | 11002 |          454 |
> >>>>> |    0 | 11003 |         2947 |
> >>>>> |    0 | 20000 |          106 |
> >>>>> |    0 | 20016 |            7 |
> >>>>> |    0 | 20024 |         1058 |
> >>>>> |    0 | 20582 |            2 |
> >>>>> |    0 | 24999 |         2231 |
> >>>>> |    0 | 3241295184 |          339 |
> >>>>> |    0 | 3241426201 |            3 |
> >>>>> |    0 | 3241426256 |         1891 |
> >>>>> |    1 |    1 |         1013 |
> >>>>> |    1 |  223 |          610 |
> >>>>> |    1 |  232 |          404 |
> >>>>> |    1 |  424 |          404 |
> >>>>> |    1 |  434 |          610 |
> >>>>> |    1 | 11002 |          404 |
> >>>>> |    1 | 11003 |          610 |
> >>>>> |    1 | 20000 |           17 |
> >>>>> |    1 | 20024 |          309 |
> >>>>> |    1 | 24999 |          689 |
> >>>>> |    1 | 3241459024 |          309 |
> >>>>> |    1 | 3241524560 |          381 |
> >>>>> +------+------+--------------+
> >>>>>
> >>>>> The XDP code (#if 0 is for the no CPU redirection):
> >>>>> /* SPDX-License-Identifier: GPL-2.0 */
> >>>>>
> >>>>> #include <linux/if_ether.h>
> >>>>> #include <linux/bpf.h>
> >>>>> #include <linux/in.h>
> >>>>>
> >>>>> #include <bpf/bpf_helpers.h>
> >>>>> #include <bpf/bpf_endian.h>
> >>>>>
> >>>>> #include "xdp/parsing_helpers.h"
> >>>>>
> >>>>> /* Redirect to SP queues map. */
> >>>>> struct
> >>>>> {
> >>>>>  __uint (type, BPF_MAP_TYPE_XSKMAP);
> >>>>>  __type (key, __u32);
> >>>>>  __type (value, __u32);
> >>>>>  __uint (max_entries, 128);
> >>>>> } xsks_map SEC(".maps");
> >>>>>
> >>>>> /* Redirect to CPUs map. */
> >>>>> struct
> >>>>> {
> >>>>>  __uint (type, BPF_MAP_TYPE_CPUMAP);
> >>>>>  __uint (key_size, sizeof (__u32));
> >>>>>  __uint (value_size, sizeof (struct bpf_cpumap_val));
> >>>>>  __uint (max_entries, 32);
> >>>>> } cpu_map SEC(".maps");
> >>>>>
> >>>>> /* Statistics and debug maps. */
> >>>>> struct
> >>>>> {
> >>>>>  __uint (type, BPF_MAP_TYPE_PERCPU_ARRAY);
> >>>>>  __type (key, __u32);
> >>>>>  __type (value, __u32);
> >>>>>  __uint (max_entries, 64);
> >>>>> } xdp_stats_map SEC(".maps");
> >>>>>
> >>>>> struct
> >>>>> {
> >>>>>  __uint (type, BPF_MAP_TYPE_HASH);
> >>>>>  __type (key, __u32);
> >>>>>  __type (value, __u32);
> >>>>>  __uint (max_entries, 64);
> >>>>> } xdp_debug_proto SEC(".maps");
> >>>>>
> >>>>> static __u32 oneval =3D 1;
> >>>>>
> >>>>> int my_parse_ethhdr (struct hdr_cursor* nh, void* dataend, struct e=
thhdr** eth)
> >>>>> {
> >>>>>  __u16 ethtype;
> >>>>>  *eth =3D nh->pos;
> >>>>>  if ((void*) &(*eth) [1] > dataend)
> >>>>>  {
> >>>>>   return (-1);
> >>>>>  }
> >>>>>
> >>>>>  ethtype =3D (*eth)->h_proto;
> >>>>>  nh->pos =3D &(*eth) [1];
> >>>>>  if (ethtype =3D=3D bpf_ntohs (ETH_P_8021Q))
> >>>>>  {
> >>>>>   struct vlan_hdr* vlan =3D (struct vlan_hdr*) &(*eth) [1];
> >>>>> if ((void*) &vlan [1] > dataend)
> >>>>> {
> >>>>>          return (-1);
> >>>>> }
> >>>>>      ethtype =3D vlan->h_vlan_encapsulated_proto;
> >>>>> /* inc_debug_map (10000+(bpf_ntohs (vlan->h_vlan_TCI) & 0x0FFF)); *=
/
> >>>>> /* inc_debug_map (vlan->h_vlan_TCI); */
> >>>>> nh->pos =3D &vlan [1];
> >>>>>  }
> >>>>>
> >>>>>  return (ethtype);
> >>>>> }
> >>>>>
> >>>>> static void inc_debug_map (__u32 key)
> >>>>> {
> >>>>> #ifdef WITH_STATS
> >>>>>  bpf_map_update_elem (&xdp_debug_proto,
> >>>>>                       &key, (__u32*) &oneval, BPF_NOEXIST);
> >>>>>  __u32* rec =3D bpf_map_lookup_elem (&xdp_debug_proto, (__u32*) &ke=
y);
> >>>>>  if (rec !=3D NULL)
> >>>>>  {
> >>>>>   ++(*rec);
> >>>>>  }
> >>>>> #endif
> >>>>> }
> >>>>>
> >>>>>
> >>>>>
> >>>>> SEC ("xdp")
> >>>>> int rdwr_xsk_prog (struct xdp_md *ctx)
> >>>>> {
> >>>>>  enum xdp_action action;
> >>>>>  int index =3D ctx->rx_queue_index;
> >>>>>  void* dataend =3D (void *)(long)ctx->data_end;
> >>>>>  void* data =3D (void *)(long)ctx->data;
> >>>>>  int stage =3D 0;
> >>>>>
> >>>>>  struct hdr_cursor nh;
> >>>>>
> >>>>>  __u32 *pkt_count;
> >>>>>  struct ethhdr* eth;
> >>>>>
> >>>>> #ifdef WITH_STATS
> >>>>>  pkt_count =3D bpf_map_lookup_elem(&xdp_stats_map, &index);
> >>>>>  if (pkt_count !=3D NULL)
> >>>>>  {
> >>>>>   ++*pkt_count;
> >>>>>  }
> >>>>> #endif
> >>>>>
> >>>>>  /* Parse Ethernet & VLAN */
> >>>>>  nh.pos =3D data;
> >>>>>  int ethtype =3D my_parse_ethhdr (&nh, dataend, &eth);
> >>>>>  if (ethtype !=3D bpf_ntohs (0x0800))
> >>>>>  {
> >>>>>   return (XDP_PASS);
> >>>>>  }
> >>>>>
> >>>>>  /* Direct XSK redirect. */
> >>>>> #if 0
> >>>>>  inc_debug_map (stage);
> >>>>>  action =3D  bpf_redirect_map (&xsks_map, index, XDP_PASS);
> >>>>>  inc_debug_map (1000 + index*10 + action);
> >>>>> #endif
> >>>>>  /* CPU map redirect. */
> >>>>>  __u32 cpuid =3D bpf_get_smp_processor_id ();
> >>>>>  __u32 targetcpu =3D cpuid ^ 0x01;
> >>>>>  ++stage;
> >>>>>  inc_debug_map (stage);
> >>>>>  inc_debug_map (200 + cpuid * 10 + targetcpu);
> >>>>>  action =3D  bpf_redirect_map (&cpu_map, targetcpu, XDP_PASS);
> >>>>>  inc_debug_map (400 + targetcpu * 10 + action);
> >>>>>  return (action);
> >>>>> }
> >>>>>
> >>>>> SEC ("xdp/cpumap")
> >>>>> int rdwr_cpu_prog(struct xdp_md *ctx)
> >>>>> {
> >>>>>  __u64* dataend64 =3D (__u64*) (long) ctx->data_end;
> >>>>>  __u64* data64 =3D (__u64*) (long) ctx->data;
> >>>>>  __u32 rxqueue =3D ctx->rx_queue_index;
> >>>>>  if (rxqueue < 5000)
> >>>>>  {
> >>>>>   inc_debug_map (20000 + rxqueue);
> >>>>>  }
> >>>>>  else
> >>>>>  {
> >>>>>   inc_debug_map (rxqueue);
> >>>>> inc_debug_map (24999);
> >>>>>  }
> >>>>>
> >>>>>  rxqueue =3D (rxqueue >=3D 2 && rxqueue < 6) ? rxqueue : 10;
> >>>>>  __u32 cpuid =3D bpf_get_smp_processor_id ();
> >>>>>  cpuid =3D (cpuid < 12) ? cpuid : 20;
> >>>>>  inc_debug_map (10000 + 100*rxqueue + cpuid);
> >>>>>
> >>>>>  return bpf_redirect_map (&xsks_map, bpf_get_smp_processor_id (), 0=
);
> >>>>> }
> >>>>>
> >>>>
> >>>
> >>
>

