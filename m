Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798D766503D
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Jan 2023 01:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbjAKALb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Jan 2023 19:11:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbjAKAL3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Jan 2023 19:11:29 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B44BC98
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 16:11:28 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 200so3997211pfx.7
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 16:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmUPxfuyLBKS+/4OoKv8MT/qnp+e4FLTwnQSmMaLuFg=;
        b=URrl0DW8P9h0zJY1kEGSMj8PmXrjDuKxTAwp/YeS32FRdhPZ0VA+UJxClfwovtm1OK
         Yc+LYpSsmG4sG7gY5b1jWorQRxKaiRwR2DXV2kTmQUDzY0ETZMhisBpaQrOPRPd9zxZN
         36K3tr+e8XIGxvudu9NOu0sEtRcVKtazjbwbAWzuxMpwFzptAQADumYEPScsaJ6IVMJc
         LFk+ufqUsEVtYOz2g4b1q7Id3DnmST2FikqhF5jbvsvKc+/CcyXkOfdm2PpkPukxAEmx
         PvdG0sp4MbIjD+XgGnkGfz1HmguuUZvWXf0Z1IHUxxOUfTv2Bz21CCJDLNdfd5/l96nT
         Jw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmUPxfuyLBKS+/4OoKv8MT/qnp+e4FLTwnQSmMaLuFg=;
        b=RmbW0edqblSzMpdWFK9mXOPUACtGP+AHMvNkCqMNOhk82Erqvdk09vtw4lohBgzn4X
         /5H94atRP5+JBb0ZV7TKp1db3Oz43aa1xqJaqmJBVTnsZ5vOh+NVt1akaI2MFzNrm//D
         4aq05ngcc9C8DPDLDeSytl4TjEeE3tXmQQEz+ebSvVvlI+YtHt1qbpxHrJWO78jBbgai
         +YYjv10nZqZMQlpW40kT33nUgb1S0VGEXtxQcPOreh3IkFs3MVK8afYJdzOi21KhNKUN
         8ciD43Ib5Cswca0LMxUD7gycTVLsnEZNhXT/qjBvpl+VSd59qYveH2OTKX1cxZg2rOc2
         g3cw==
X-Gm-Message-State: AFqh2kq4UIvFR1GOxRIkfrHgDxfHgQJV9CQdZxRduTPT1b1jqHcK+aof
        iNJbNAujhIK3tp5QMbna+6osZl1MaGwqVxvIyoNUbX/sDwE=
X-Google-Smtp-Source: AMrXdXsERcdSVoO7WkEGOm1rk7JL6Aqw5Ri0Bu5tPf1BDOJ1biPdNKfu43ZNwwcG/CgnHiOd4FKbteqzF9EEMiaHwko=
X-Received: by 2002:a63:115c:0:b0:487:621e:af5c with SMTP id
 28-20020a63115c000000b00487621eaf5cmr5464359pgr.102.1673395887471; Tue, 10
 Jan 2023 16:11:27 -0800 (PST)
MIME-Version: 1.0
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk> <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
 <87bknh5fxf.fsf@toke.dk> <CAK3+h2xVrKPCusUa3B2QT83Sjq0mNU8c31qXTOGid+UOhaQ7SQ@mail.gmail.com>
 <87tu0yh0r6.fsf@toke.dk> <CAK3+h2wQo2LUDqaqymTz=kJ08tBy_m4C6KieBsn-PLn_PbY6Og@mail.gmail.com>
 <87lemageby.fsf@toke.dk>
In-Reply-To: <87lemageby.fsf@toke.dk>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Tue, 10 Jan 2023 16:11:15 -0800
Message-ID: <CAK3+h2wwQnpy9+st=emN3NuVrmgJTrMrF79zN3cfOnFUMCPP0A@mail.gmail.com>
Subject: Re: Redirect packet back to host stack after AF_XDP?
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
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

On Tue, Jan 10, 2023 at 3:27 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Vincent Li <vincent.mc.li@gmail.com> writes:
>
> > On Tue, Jan 10, 2023 at 7:23 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com> wrote:
> >>
> >> Vincent Li <vincent.mc.li@gmail.com> writes:
> >>
> >> > On Mon, Jan 2, 2023 at 3:34 AM Toke H=C3=B8iland-J=C3=B8rgensen <tok=
e@redhat.com> wrote:
> >> >>
> >> >> Vincent Li <vincent.mc.li@gmail.com> writes:
> >> >>
> >> >> > On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@redhat.com> wrote:
> >> >> >>
> >> >> >> Vincent Li <vincent.mc.li@gmail.com> writes:
> >> >> >>
> >> >> >> > Hi,
> >> >> >> >
> >> >> >> > If I have an user space stack like mTCP works on top of AF_XDP=
 as tcp
> >> >> >> > stateful packet filter to drop tcp packet like tcp syn/rst/ack=
 flood
> >> >> >> > or other tcp attack, and redirect good tcp packet back to linu=
x host
> >> >> >> > stack after mTCP filtering, is that possible?
> >> >> >>
> >> >> >> Not really, no. You can inject it using regular userspace method=
s (say,
> >> >> >> a TUN device), or using AF_XDP on a veth device. But in both cas=
es the
> >> >> >> packet will come in on a different interface, so it's not really
> >> >> >> transparent. And performance is not great either.
> >> >> >
> >> >> > I have thought about it more :) what about this scenario
> >> >> >
> >> >> >
> >> >> > good tcp rst/ack or bad flooding rst/ack -> NIC1 -> mTCP+AF_XDP -=
>NIC2
> >> >> >
> >> >> > NIC1 and NIC2 on the same host, drop flooding rst/ack by mTCP,
> >> >> > redirect good tcp rst/ack to NIC2, is that possible?
> >> >>
> >> >> You can do this if NIC2 is a veth device: you inject packets into t=
he
> >> >> veth on the TX side, they come out on the other side and from the k=
ernel
> >> >> PoV it looks like all packets come in on the peer veth. You'll need=
 to
> >> >> redirect packets the other way as well.
> >> >>
> >> >> > any performance impact?
> >> >>
> >> >> Yes, obviously :)
> >> >>
> >> >> >> In general, if you want to filter traffic before passing it on t=
o the
> >> >> >> kernel, the best bet is to implement your filtering in BPF and r=
un it as
> >> >> >> an XDP program.
> >> >> >
> >> >> > I am thinking for scenario like tcp rst/ack flood DDOS attack to =
NIC1
> >> >> > above, I can't simply drop every rst/ack because there could be
> >> >> > legitimate rst/ack, in this case since mTCP can validate legitima=
te
> >> >> > stateful tcp connection, drop flooding rst/ack packet, redirect g=
ood
> >> >> > rst/ack to NIC2. I am not sure a BPF XDP program attached to NIC1=
 is
> >> >> > able to do stateful TCP packet filtering, does that make sense to=
 you?
> >> >>
> >> >> It makes sense in the "it can probably be made to work" sense. Not =
in
> >> >> the "why would anyone want to do this" sense. If you're trying to
> >> >> protect against SYN flooding using XDP there are better solutions t=
han
> >> >> proxying things through a user space TCP stack. See for instance Ma=
xim's
> >> >> synproxy patches:
> >> >>
> >> >
> >> > SYN flooding is just one of the example, what I have in mind is an
> >> > user space TCP/IP stack runs on top of AF_XDP as middle box/proxy fo=
r
> >> > packet filtering or load balancing, like F5 BIG-IP runs an user spac=
e
> >> > TCP/IP stack on top of AF_XDP. I thought open source mTCP + AF_XDP
> >> > could be a similar use case as middle box.  user space TCP/IP stack =
+
> >> > AF_XDP as middle box/proxy,  the performance is not going to be good=
?
> >>
> >> Well, you can certainly build a proxy using AF_XDP by intercepting all
> >> the traffic and bridging it onto a veth device, say. I've certainly
> >> heard of people doing that. It'll have some non-trivial overhead,
> >> though; even if AF_XDP is fairly high performance, you're still making
> >> all traffic take an extra hop through userspace, and you'll lose
> >> features like hardware TSO, etc. Whether it can be done with "good"
> >> performance depends on your use case, I guess (i.e., how do you define
> >> "good performance"?).
> >>
> >> I guess I don't really see the utility in having a user-space TCP stac=
k
> >> be a middlebox? If you're doing packet-level filtering, you could just
> >> do that in regular XDP (and the same for load balancing, see e.g.,
> >> Katran), and if you want to do application-level filtering (say, a WAF=
),
> >> you could just use the kernel TCP stack?
> >>
> >
> > the reason I mention user-space TCP stack is user space stack appears
> > performs better than kernel TCP stack, and we see user-space stack +
> > DPDK for high speed packet processing applications out there, since
> > XDP/AF_XDP seems to be competing with DPDK, so I thought why not user
> > space stack + AF_XDP :)
>
> Well, there's a difference between running a user-level stack directly
> in the end application, or using it as a middlebox. The latter just adds
> overhead, and again, I really don't see why you'd want to do that?

The middle box indeed adds overhead in the packet path, but commercial
products like BIG-IP  is a middle box with a well tuned  user-space
stack that runs on DPDK successfully, and could potentially run on
AF_XDP if AF_XDP performs well as DPDK.  I think there's no reason
open source user-space stack can't do this :).

Suricata also added AF_XDP support, no TX support though
https://github.com/OISF/suricata/pull/8210/commits/2cf0b3616c668c0d3fda4de4=
7a6b93630dcc366d,
 Suricata could work as inline middle box in IPS mode, but seems not
supported so far for AF_XDP. so I am  thinking of an user-space stack
+ AF_XDP that works as a stealth inline middle box to do the advanced
packet processing/filtering/proxying to protect application servers,
maybe AF_XDP is not designed for such use cases?

>
> Also, the mTCP web site cites tests against a 3.10 kernel, and the code
> doesn't look like it's been touched for years. So I'd suggest running
> some up-to-date tests against a modern kernel (and trying things like
> io_uring if your concern is syscall overhead for small flows) before
> drawing any conclusions about performance :)
>

I cloned https://github.com/mcabranches/mtcp that added AF_XDP
support, I could run the example epserver app  fine on Ubuntu 20.04
5.4 kernel, and yes, it appears performance worse from CPU usage wise
than kernel stack when under hping3 RST flood. perf top example when
under hping3 RST flood:

Samples: 120K of event 'cycles', 4000 Hz, Event count (approx.):
6522491740 lost: 0/0 drop: 0/0

Overhead  Shared Object                            Symbol

  21.42%  epserver                                 [.] ProcessPacket

  10.89%  epserver                                 [.] StreamHTSearch

   7.07%  [kernel]                                 [k] native_write_msr

   5.75%  epserver                                 [.] HashFlow

   5.69%  [kernel]                                 [k] native_read_msr

   3.62%  epserver                                 [.] xsk_ring_prod__fill_=
addr

   2.20%  [kernel]                                 [k] xsk_poll

   2.05%  epserver                                 [.] afxdp_get_rptr

   1.87%  [kernel]                                 [k]
native_queued_spin_lock_slowpath

   1.57%  epserver                                 [.] ProcessIPv4Packet

   1.55%  [kernel]                                 [k] _raw_spin_lock_irqsa=
ve

   1.38%  [kernel]                                 [k] do_sys_poll

   1.34%  epserver                                 [.] TCPCalcChecksum

   1.22%  [kernel]                                 [k] vmxnet3_poll_rx_only

   1.21%  libpthread-2.31.so                       [.] pthread_mutex_unlock

   1.21%  epserver                                 [.] xsk_alloc_umem_frame

   1.04%  [kernel]                                 [k] psi_task_change

   0.99%  [kernel]                                 [k] cpuacct_charge

   0.91%  epserver                                 [.] ProcessTCPPacket

   0.90%  [kernel]                                 [k] vmware_sched_clock

   0.80%  [kernel]                                 [k]
poll_schedule_timeout.constprop.0

   0.72%  epserver                                 [.] MTCPRunThread

   0.69%  epserver                                 [.] xsk_prod_nb_free

   0.64%  epserver                                 [.] afxdp_recv_pkts

   0.64%  [kernel]                                 [k] read_tsc

   0.56%  [kernel]                                 [k] xsk_generic_rcv

   0.55%  [kernel]                                 [k] memcpy

   0.53%  [kernel]                                 [k] x86_pmu_disable_all

   0.51%  [kernel]                                 [k] native_apic_msr_eoi_=
write

   0.50%  [kernel]                                 [k] fput_many

   0.49%  [kernel]                                 [k]
__perf_event_task_sched_in

   0.48%  [kernel]                                 [k] __fget_light

   0.48%  [kernel]                                 [k] __schedule

   0.47%  epserver                                 [.] xsk_cons_nb_avail

   0.46%  [kernel]                                 [k] memset

   0.41%  [kernel]                                 [k] irq_entries_start

if I run hping3 RST flood a ngnix web server runs on Linux kernel, no
visible CPU usage overhead

> That being said, it's certainly *possible* to do what you're suggesting;
> there's even a PMD driver in DPDK for AF_XDP, so in that sense it's
> pluggable. So, like, feel free to try it out? I'm just cautioning
> against thinking it some kind of magic bullet; packet processing at high
> speeds in software is *hard*, so the details matter a lot, and it's
> really easy to throw away any performance gains by inefficiencies
> elsewhere in the stack (which goes for both the kernel stack, XDP, and
> AF_XDP).

I agree there is no magic bullet, I am just thinking if there is
potential for AF_XDP  as a middle box senario.
Thank you for your patience, feel free to drop the discussion :)

>
> -Toke
>
