Return-Path: <xdp-newbies+bounces-77-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F288D1B01
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 May 2024 14:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36611B21047
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 May 2024 12:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B30816C848;
	Tue, 28 May 2024 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bebH0tfm"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D11D73465
	for <xdp-newbies@vger.kernel.org>; Tue, 28 May 2024 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898918; cv=none; b=nFiBGdEnYmzhbXKsT14S/MR/a4tZV7X/mJSiccxJFLhSQycqxRtg0f1qeXG56rxVlwMW1BM5pAzkT1Cm25gORPujc3/Ia5cpXdAx2Ytl7GZBC5+sOiNRF9TWi9FMzV2ghufSdECHwRVcZ4JjofPZTIv5TiPx4qntiRguX9NS8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898918; c=relaxed/simple;
	bh=Q3eMsG2LobUvDQSH1WtKKaA16ahA2rgihKm8tJNHV+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MexUn/dDpTEi3T6fBNCch7dLJry6M1O9ii88jvmknMAk9obVmesyYYpGxVCSqNv3MhAVyLu+RYaYDvHsoQZ8mA1oKq/ZblTpzluXwtOprv1FJNs4Te472qYi4y0X3lyBJAQzOew6GARRvj+379GFZkxRZzbvyNnvLcjyVDPdodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bebH0tfm; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ab8f69be57so627946d6.2
        for <xdp-newbies@vger.kernel.org>; Tue, 28 May 2024 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716898915; x=1717503715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMQ1UWWrUfMuBjz+cRpRDdHJXCcdXGnVCYaXGQnXKv8=;
        b=bebH0tfmkBiGcQ7LMj5cnrv1MtLqIe080lK2VKGaTOlrsKHgEB0Vcp5SLYhyoRujYs
         vi2G2U0VpL7DefaQlEPyk1RdCxI4oi11O5U88Z+kTIMPc4sa0J6VdkfVpf+mND3HmU++
         FoRDJH/BfqW1yhKAzgax96HgrOtrye0orGYU2rOr7jCFbDSARlWg/9DCP5+WJvgUTTyJ
         R1U/VG0N5VTo1d9XI86R8edms+9s7I8J8Ma/UDR3IDMU/gk3c02JucilPS/EDUtCsuBB
         tgeU+9Qk5YQYB+jc8UPXmg4CJqJd/V0Bpxc64fOfTnTgah+mwQe3IZHpt6GcEG0K+O+d
         Fkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716898915; x=1717503715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMQ1UWWrUfMuBjz+cRpRDdHJXCcdXGnVCYaXGQnXKv8=;
        b=uHY57aeYlVods49nBG2THvrdKinlX6WbUpyJsa7hXpEAT677prcbkMTvzHjlkma7/R
         SQ2dR97iH3bTnw60xc0ZP9g68tUbUGKNCqsGNbXl2PkJzoanwUmZ2m2pfbimoxNolxRL
         ujTjgSQlNgXL6fL0Q3qz8jbegHMuMS0zmuGOQ+o3r9c3NctK18cQKGTo/QYvfvR9qRNR
         iHTdjCvVkKAyHhmCZ52hYmQSf7UpyOZ6Wii6E/4FWw4aANoQO44Sp/6jKGU0AE7FvWYO
         1oN63lNbq9pLMhDqzobC9QGjtbyfUX4cNduQJcDNS6filFgxKXr5tsbZD90vh+4mUmnd
         qisw==
X-Gm-Message-State: AOJu0YyLP3c3AorVxaYSymcay4Ex3d+DS698QuVW5h/1/IsA+978nUMR
	VbMl3QNGjA9b1SI/90aXUMez3OPSoICL4FEZwR54zGEA7xPBwURK4PeTdgy1Tc+It3swTiyCnY3
	1uB7Q6saQCNQL1pvYDFrrc3xxbu4=
X-Google-Smtp-Source: AGHT+IFbKkgpaGNdBSHbV7b3avIapsVGEePTFRFsKDppg99lhq9XAKVyntcLWBKTs3tngNZdU2qVwKZfbi1idkmgw4E=
X-Received: by 2002:a05:6214:f25:b0:6ab:7ce8:820c with SMTP id
 6a1803df08f44-6abcd17ef97mr126262896d6.5.1716898914758; Tue, 28 May 2024
 05:21:54 -0700 (PDT)
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
In-Reply-To: <CAJ8uoz17afCcbCz1WpsJypKX+mCNsvSbm0C4K8R4Kv1N8mAQ-g@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 28 May 2024 14:21:43 +0200
Message-ID: <CAJ8uoz0uokxmUYWrFsxVSCUAdz5vGU8DP6Q7mX=Dq=SMu2-xKw@mail.gmail.com>
Subject: Re: XDP CPU maps & shared umem
To: Yuval El-Hanany <yuvale@radware.com>, 
	"Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 May 2024 at 10:11, Magnus Karlsson <magnus.karlsson@gmail.com> w=
rote:
>
> On Mon, 27 May 2024 at 09:34, Yuval El-Hanany <yuvale@radware.com> wrote:
> >
> > Yeah,
> >         as far down as I dug in the code, it seems it=E2=80=99s the onl=
y one that=E2=80=99s used. The other members are reg_state & napi_id. I=E2=
=80=99m unfamiliar with their exact purposes, but doesn=E2=80=99t sound lik=
e they=E2=80=99re necessary down the line. One other concern is txq IMO. It=
 is not initialised to any value in xdp_buff. While it may not be relevant =
considering it=E2=80=99s a received packet, it seems wrong to keep a dangli=
ng pointer both in terms of security (leaking previous values) and robustne=
ss. Maybe just set it to NULL?
> >
> >         I=E2=80=99ve been racking my brain as to what is the accepted m=
ethod to pass the receive queue. Passing it on the packet headroom seemed l=
ike a reasonable solution, but it would mean memory access to the packet me=
mory on packet arrival on the second CPU which may be harmful to performanc=
e. The queue itself is just a pointer queue so can=E2=80=99t piggyback on i=
t unless using a different kind of queue. Would be great to hear how it sho=
uld be done.
>
> Let me get into this piece of code and scratch my head for a while and
> I will get back to you. Do not have a solution on top of my head. Will
> loop in Maciej too.

Yuval,

Could you please send me the patch that you are using? I cannot
remember what I sent you :-).

> /Magnus
>
> >         Thanks,
> >                 Yuval.
> >
> > > On 27 May 2024, at 8:48, Magnus Karlsson <magnus.karlsson@gmail.com> =
wrote:
> > >
> > > CAUTION:External Email, Do not click on links or open attachments unl=
ess you recognize the sender and know the content is safe.
> > >
> > > On Sun, 26 May 2024 at 14:48, Yuval El-Hanany <yuvale@radware.com> wr=
ote:
> > >>
> > >> Correction,
> > >>        the rxq pointer is init=E2=80=99d globally for all frames bef=
ore the frame loops, but only the device and the memory information are set=
 from the XDP frame. So still an issue with the queue_index, but the tests =
on the device and memory info in xsk_rcv should be fine.
> > >>
> > >>        Cheers,
> > >>                Yuval.
> > >
> > > Hi Yuval,
> > >
> > > Now I am back. Yes, this seems to be a bug so thank you for spotting
> > > it. This is nothing I have ever tested since I thought you would do a=
n
> > > XSKMAP redirect to the "right" core first. But there is nothing
> > > hindering that someone would do a CPUMAP redirect first then an XSKMA=
P
> > > redirect, so should be supported. So in your analysis, is it only
> > > queue_index that needs to be populated at CPUMAP redirect time for
> > > this to work?
> > >
> > > Thanks: Magnus
> > >
> > >>> On 26 May 2024, at 12:02, Yuval El-Hanany <yuvale@radware.com> wrot=
e:
> > >>>
> > >>> Hi,
> > >>> so I=E2=80=99ve dug a bit deeper. It seems the receive queue is not=
 maintained across CPUs and this may make the whole practice of redirecting=
 to XSK unsafe if I read the code correctly. It also seems this persists to=
 kernel 6.6.8. Am I missing something?
> > >>>
> > >>> The code in cpumap runs XDP programs BUT doesn=E2=80=99t fill the r=
xq (see also the TODO comment in the code). The XDP frame is converted to X=
DP buffer but the rxq and txq are not filled. It seems they remain as dangl=
ing pointers. When __xsk_map_redirect is called and in turn xsk_rcv the rxq=
 is consulted both to check if the umem is shared (in the new patch) as wel=
l as decide whether zero copy is used or not. Since rxq is not valid, I=E2=
=80=99m not certain what the outcome is. Once I bypassed umem check, I no l=
onger crash the kernel but I'm definitely not seeing traffic running.
> > >>>
> > >>> Thanks,
> > >>> Yuval.
> > >>>
> > >>> Here are the excerpts from the code (5.15.117):
> > >>>
> > >>> cpumap.c:212 <cpu_map_bpf_prog_run_xdp> =3D=3D=3D=3D=3D Note the co=
mment in the code. =3D=3D=3D=3D=3D
> > >>>   for (i =3D 0; i < n; i++) {
> > >>>       struct xdp_frame *xdpf =3D frames[i];
> > >>>       u32 act;
> > >>>       int err;
> > >>>
> > >>> rxq.dev =3D xdpf->dev_rx;
> > >>>       rxq.mem =3D xdpf->mem;
> > >>>       /* TODO: report queue_index to xdp_rxq_info */
> > >>>
> > >>>       xdp_convert_frame_to_buff(xdpf, &xdp);
> > >>>
> > >>>       act =3D bpf_prog_run_xdp(rcpu->prog, &xdp);
> > >>>
> > >>> xdp.h:175 =3D=3D=3D=3D=3D rxq & txq in the xdp_buff are not filled =
or even reset. =3D=3D=3D=3D=3D
> > >>> static inline
> > >>> void xdp_convert_frame_to_buff(struct xdp_frame *frame, struct xdp_=
buff *xdp)
> > >>> {
> > >>>   xdp->data_hard_start =3D frame->data - frame->headroom - sizeof(*=
frame);
> > >>>   xdp->data =3D frame->data;
> > >>>   xdp->data_end =3D frame->data + frame->len;
> > >>>   xdp->data_meta =3D frame->data - frame->metasize;
> > >>>   xdp->frame_sz =3D frame->frame_sz;
> > >>> }
> > >>>
> > >>> xsk.c:269 =3D=3D=3D=3D=3D xsk_rcv consults rxq in xdp_buff which is=
 not filled! =3D=3D=3D=3D=3D
> > >>> static int xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
> > >>> {
> > >>>   int err;
> > >>>   u32 len;
> > >>>
> > >>>   err =3D xsk_rcv_check(xs, xdp);
> > >>>   if (err)
> > >>>       return err;
> > >>>
> > >>>   if (xdp->rxq->mem.type =3D=3D MEM_TYPE_XSK_BUFF_POOL) {
> > >>> len =3D xdp->data_end - xdp->data;
> > >>>       return __xsk_rcv_zc(xs, xdp, len);
> > >>>   }
> > >>>
> > >>>   err =3D __xsk_rcv(xs, xdp);
> > >>>   if (!err)
> > >>> xdp_return_buff(xdp);
> > >>>   return err;
> > >>> }
> > >>>
> > >>> int __xsk_map_redirect(struct xdp_sock *xs, struct xdp_buff *xdp)
> > >>> {
> > >>>   struct list_head *flush_list =3D this_cpu_ptr(&xskmap_flush_list)=
;
> > >>>   int err;
> > >>>
> > >>>   err =3D xsk_rcv(xs, xdp);
> > >>>   if (err)
> > >>> return err;
> > >>>
> > >>>   if (!xs->flush_node.prev)
> > >>>       list_add(&xs->flush_node, flush_list);
> > >>>
> > >>>   return 0;
> > >>> }
> > >>>
> > >>>> On 24 May 2024, at 18:49, Yuval El-Hanany <YuvalE@Radware.com> wro=
te:
> > >>>>
> > >>>> CAUTION:External Email, Do not click on links or open attachments =
unless you recognize the sender and know the content is safe.
> > >>>>
> > >>>> Hi All,
> > >>>>      I would really appreciate some guidance here. As this issue s=
pans both network XDP and CPU map, it=E2=80=99s a bit more difficult for me=
 to follow in the kernel code. I attempted to trace the issue in the source=
, but it=E2=80=99s a bit complex to enter existing code base.
> > >>>>
> > >>>>      It will be easier if you can tell me the following:
> > >>>> 1. Is the receive queue metadata maintained correctly through the =
CPU switch in CPU map? In the description of CPU map in XDP (https://develo=
pers.redhat.com/blog/2021/05/13/receive-side-scaling-rss-with-ebpf-and-cpum=
ap), it is mentioned that some metadata is not maintained across the CPU sw=
itch, but that would make the umem test problematic. Should I assume the re=
ceive queue is maintained?
> > >>>> 2. Does XSK umem user code have access to the receive queue metada=
ta memory? It seems to be in a different pointer, but it could be that it p=
oints to the packet headroom in the umem accessible memory.
> > >>>>
> > >>>>      If the receive queue is not maintained across CPU switch then=
 I think the shared umem test should run along the lines of using some defa=
ult receive queue after switching CPUs. Otherwise, it should probably drop =
packets with invalid receive queues.
> > >>>>
> > >>>>      Thanks,
> > >>>>              Yuval.
> > >>>>
> > >>>>> On 20 May 2024, at 18:24, Yuval El-Hanany <YuvalE@Radware.com> wr=
ote:
> > >>>>>
> > >>>>> Hi,
> > >>>>>
> > >>>>> Short Version
> > >>>>> I=E2=80=99ve encountered an issue redirecting traffic to another =
CPU while using shared UMEM. The frame arrived at the redirected CPU with i=
nvalid receive queue. This caused a kernel crash on the patch that supports=
 redirecting to packets to any queue with the same umem due to a test based=
 on the receive queue.
> > >>>>>
> > >>>>> Long Version
> > >>>>> I=E2=80=99ve created a test program that redirects traffic betwee=
n two interfaces (replacing the MAC address). See the code below. It starts=
 two separate processes on two different cores. When directing traffic dire=
ctly to an XSK socket all works well. I=E2=80=99m running on kernel 5.15.11=
7 with Magnus patch for shared umem.
> > >>>>>
> > >>>>> The next step was an XDP program that redirects each packet to th=
e other CPU, and the xdp CPU program redirect the packets to an XDP socket.=
 Initially this resulted in a kernel crash. The reason is that the receive =
queue is not received correctly once the packet switches CPU.
> > >>>>>
> > >>>>> I=E2=80=99ve patched the kernel so it does sanity check and does =
not crash but defaults to queue 0 just for the umem test.
> > >>>>>
> > >>>>> The kernel no longer crashes but I don=E2=80=99t get the traffic =
to the XSK sockets, and I log the receive queues and they do not seem rando=
m:
> > >>>>> On first interface:
> > >>>>> 0xC1323D50
> > >>>>> 0xC1343D19
> > >>>>> 0xC1343D50
> > >>>>>
> > >>>>> On second interface:
> > >>>>> 0xC134BD50
> > >>>>> 0xC135BD50
> > >>>>>
> > >>>>> Very few bits differences between each of the =E2=80=9Creceive qu=
eues=E2=80=9D. I couldn=E2=80=99t really find something in my program with =
those or similar values, or in the packets so it makes it less likely it co=
mes from something I do in userspace. Seems to suggest some flags field? Th=
e values are not always the same across reboots but pretty close.
> > >>>>>
> > >>>>> Am I doing something wrong? It seems pretty basic. Most of the co=
de in the XDP program was just added for debugging. The only oddity perhaps=
 is using the shared umem.
> > >>>>>
> > >>>>> Thanks,
> > >>>>> Yuval.
> > >>>>>
> > >>>>> I=E2=80=99m attaching the program and values from my "debug map=
=E2=80=9D. In the debug map:
> > >>>>> 0. Values 0/1 - Which type of program ran (with/without CPU redir=
ection).
> > >>>>> 1. Values 2XY - packet redirected from core X to core Y (1st stag=
e).
> > >>>>> 2. Values 4XY - packet on core X returns action Y (1st stage).
> > >>>>> (These suggest that 1st stage worked correctly).
> > >>>>> 3. Values 1XXYY - packet receive queue XX on core YY (XX =3D 10 i=
s invalid receive queue outside 2..5).
> > >>>>> 4. 2XXXX - packet receive queue on any core (XXXX - 4999 imeans q=
ueue greater than 5000).
> > >>>>> 5. Random entry - a receive queue.
> > >>>>>
> > >>>>> Debug map values without CPU redirection:
> > >>>>> +------+------+--------------+
> > >>>>> | Port | Key  |     Received |
> > >>>>> +------+------+--------------+
> > >>>>> |    0 | 1032 |          504 |
> > >>>>> |    0 | 1024 |     37005992 |
> > >>>>> |    0 | 1034 |     37544052 |
> > >>>>> |    0 |    0 |     74546875 |
> > >>>>> |    1 | 1034 |     35765961 |
> > >>>>> |    1 |    0 |     71492773 |
> > >>>>> |    1 | 1024 |     35729107 |
> > >>>>> |    1 | 1032 |          277 |
> > >>>>> +------+------+--------------+
> > >>>>>
> > >>>>> Debug map value with CPU redirection (no other change):
> > >>>>> +------+------+--------------+
> > >>>>> | Port | Key  |     Received |
> > >>>>> +------+------+--------------+
> > >>>>> |    0 |    1 |         3400 |
> > >>>>> |    0 |  223 |         2947 |
> > >>>>> |    0 |  232 |          454 |
> > >>>>> |    0 |  424 |          454 |
> > >>>>> |    0 |  434 |         2947 |
> > >>>>> |    0 | 11002 |          454 |
> > >>>>> |    0 | 11003 |         2947 |
> > >>>>> |    0 | 20000 |          106 |
> > >>>>> |    0 | 20016 |            7 |
> > >>>>> |    0 | 20024 |         1058 |
> > >>>>> |    0 | 20582 |            2 |
> > >>>>> |    0 | 24999 |         2231 |
> > >>>>> |    0 | 3241295184 |          339 |
> > >>>>> |    0 | 3241426201 |            3 |
> > >>>>> |    0 | 3241426256 |         1891 |
> > >>>>> |    1 |    1 |         1013 |
> > >>>>> |    1 |  223 |          610 |
> > >>>>> |    1 |  232 |          404 |
> > >>>>> |    1 |  424 |          404 |
> > >>>>> |    1 |  434 |          610 |
> > >>>>> |    1 | 11002 |          404 |
> > >>>>> |    1 | 11003 |          610 |
> > >>>>> |    1 | 20000 |           17 |
> > >>>>> |    1 | 20024 |          309 |
> > >>>>> |    1 | 24999 |          689 |
> > >>>>> |    1 | 3241459024 |          309 |
> > >>>>> |    1 | 3241524560 |          381 |
> > >>>>> +------+------+--------------+
> > >>>>>
> > >>>>> The XDP code (#if 0 is for the no CPU redirection):
> > >>>>> /* SPDX-License-Identifier: GPL-2.0 */
> > >>>>>
> > >>>>> #include <linux/if_ether.h>
> > >>>>> #include <linux/bpf.h>
> > >>>>> #include <linux/in.h>
> > >>>>>
> > >>>>> #include <bpf/bpf_helpers.h>
> > >>>>> #include <bpf/bpf_endian.h>
> > >>>>>
> > >>>>> #include "xdp/parsing_helpers.h"
> > >>>>>
> > >>>>> /* Redirect to SP queues map. */
> > >>>>> struct
> > >>>>> {
> > >>>>>  __uint (type, BPF_MAP_TYPE_XSKMAP);
> > >>>>>  __type (key, __u32);
> > >>>>>  __type (value, __u32);
> > >>>>>  __uint (max_entries, 128);
> > >>>>> } xsks_map SEC(".maps");
> > >>>>>
> > >>>>> /* Redirect to CPUs map. */
> > >>>>> struct
> > >>>>> {
> > >>>>>  __uint (type, BPF_MAP_TYPE_CPUMAP);
> > >>>>>  __uint (key_size, sizeof (__u32));
> > >>>>>  __uint (value_size, sizeof (struct bpf_cpumap_val));
> > >>>>>  __uint (max_entries, 32);
> > >>>>> } cpu_map SEC(".maps");
> > >>>>>
> > >>>>> /* Statistics and debug maps. */
> > >>>>> struct
> > >>>>> {
> > >>>>>  __uint (type, BPF_MAP_TYPE_PERCPU_ARRAY);
> > >>>>>  __type (key, __u32);
> > >>>>>  __type (value, __u32);
> > >>>>>  __uint (max_entries, 64);
> > >>>>> } xdp_stats_map SEC(".maps");
> > >>>>>
> > >>>>> struct
> > >>>>> {
> > >>>>>  __uint (type, BPF_MAP_TYPE_HASH);
> > >>>>>  __type (key, __u32);
> > >>>>>  __type (value, __u32);
> > >>>>>  __uint (max_entries, 64);
> > >>>>> } xdp_debug_proto SEC(".maps");
> > >>>>>
> > >>>>> static __u32 oneval =3D 1;
> > >>>>>
> > >>>>> int my_parse_ethhdr (struct hdr_cursor* nh, void* dataend, struct=
 ethhdr** eth)
> > >>>>> {
> > >>>>>  __u16 ethtype;
> > >>>>>  *eth =3D nh->pos;
> > >>>>>  if ((void*) &(*eth) [1] > dataend)
> > >>>>>  {
> > >>>>>   return (-1);
> > >>>>>  }
> > >>>>>
> > >>>>>  ethtype =3D (*eth)->h_proto;
> > >>>>>  nh->pos =3D &(*eth) [1];
> > >>>>>  if (ethtype =3D=3D bpf_ntohs (ETH_P_8021Q))
> > >>>>>  {
> > >>>>>   struct vlan_hdr* vlan =3D (struct vlan_hdr*) &(*eth) [1];
> > >>>>> if ((void*) &vlan [1] > dataend)
> > >>>>> {
> > >>>>>          return (-1);
> > >>>>> }
> > >>>>>      ethtype =3D vlan->h_vlan_encapsulated_proto;
> > >>>>> /* inc_debug_map (10000+(bpf_ntohs (vlan->h_vlan_TCI) & 0x0FFF));=
 */
> > >>>>> /* inc_debug_map (vlan->h_vlan_TCI); */
> > >>>>> nh->pos =3D &vlan [1];
> > >>>>>  }
> > >>>>>
> > >>>>>  return (ethtype);
> > >>>>> }
> > >>>>>
> > >>>>> static void inc_debug_map (__u32 key)
> > >>>>> {
> > >>>>> #ifdef WITH_STATS
> > >>>>>  bpf_map_update_elem (&xdp_debug_proto,
> > >>>>>                       &key, (__u32*) &oneval, BPF_NOEXIST);
> > >>>>>  __u32* rec =3D bpf_map_lookup_elem (&xdp_debug_proto, (__u32*) &=
key);
> > >>>>>  if (rec !=3D NULL)
> > >>>>>  {
> > >>>>>   ++(*rec);
> > >>>>>  }
> > >>>>> #endif
> > >>>>> }
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>> SEC ("xdp")
> > >>>>> int rdwr_xsk_prog (struct xdp_md *ctx)
> > >>>>> {
> > >>>>>  enum xdp_action action;
> > >>>>>  int index =3D ctx->rx_queue_index;
> > >>>>>  void* dataend =3D (void *)(long)ctx->data_end;
> > >>>>>  void* data =3D (void *)(long)ctx->data;
> > >>>>>  int stage =3D 0;
> > >>>>>
> > >>>>>  struct hdr_cursor nh;
> > >>>>>
> > >>>>>  __u32 *pkt_count;
> > >>>>>  struct ethhdr* eth;
> > >>>>>
> > >>>>> #ifdef WITH_STATS
> > >>>>>  pkt_count =3D bpf_map_lookup_elem(&xdp_stats_map, &index);
> > >>>>>  if (pkt_count !=3D NULL)
> > >>>>>  {
> > >>>>>   ++*pkt_count;
> > >>>>>  }
> > >>>>> #endif
> > >>>>>
> > >>>>>  /* Parse Ethernet & VLAN */
> > >>>>>  nh.pos =3D data;
> > >>>>>  int ethtype =3D my_parse_ethhdr (&nh, dataend, &eth);
> > >>>>>  if (ethtype !=3D bpf_ntohs (0x0800))
> > >>>>>  {
> > >>>>>   return (XDP_PASS);
> > >>>>>  }
> > >>>>>
> > >>>>>  /* Direct XSK redirect. */
> > >>>>> #if 0
> > >>>>>  inc_debug_map (stage);
> > >>>>>  action =3D  bpf_redirect_map (&xsks_map, index, XDP_PASS);
> > >>>>>  inc_debug_map (1000 + index*10 + action);
> > >>>>> #endif
> > >>>>>  /* CPU map redirect. */
> > >>>>>  __u32 cpuid =3D bpf_get_smp_processor_id ();
> > >>>>>  __u32 targetcpu =3D cpuid ^ 0x01;
> > >>>>>  ++stage;
> > >>>>>  inc_debug_map (stage);
> > >>>>>  inc_debug_map (200 + cpuid * 10 + targetcpu);
> > >>>>>  action =3D  bpf_redirect_map (&cpu_map, targetcpu, XDP_PASS);
> > >>>>>  inc_debug_map (400 + targetcpu * 10 + action);
> > >>>>>  return (action);
> > >>>>> }
> > >>>>>
> > >>>>> SEC ("xdp/cpumap")
> > >>>>> int rdwr_cpu_prog(struct xdp_md *ctx)
> > >>>>> {
> > >>>>>  __u64* dataend64 =3D (__u64*) (long) ctx->data_end;
> > >>>>>  __u64* data64 =3D (__u64*) (long) ctx->data;
> > >>>>>  __u32 rxqueue =3D ctx->rx_queue_index;
> > >>>>>  if (rxqueue < 5000)
> > >>>>>  {
> > >>>>>   inc_debug_map (20000 + rxqueue);
> > >>>>>  }
> > >>>>>  else
> > >>>>>  {
> > >>>>>   inc_debug_map (rxqueue);
> > >>>>> inc_debug_map (24999);
> > >>>>>  }
> > >>>>>
> > >>>>>  rxqueue =3D (rxqueue >=3D 2 && rxqueue < 6) ? rxqueue : 10;
> > >>>>>  __u32 cpuid =3D bpf_get_smp_processor_id ();
> > >>>>>  cpuid =3D (cpuid < 12) ? cpuid : 20;
> > >>>>>  inc_debug_map (10000 + 100*rxqueue + cpuid);
> > >>>>>
> > >>>>>  return bpf_redirect_map (&xsks_map, bpf_get_smp_processor_id (),=
 0);
> > >>>>> }
> > >>>>>
> > >>>>
> > >>>
> > >>
> >

