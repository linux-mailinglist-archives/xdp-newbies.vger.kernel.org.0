Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A1D5BEC20
	for <lists+xdp-newbies@lfdr.de>; Tue, 20 Sep 2022 19:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiITRhu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 20 Sep 2022 13:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiITRhs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 20 Sep 2022 13:37:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D1E46619
        for <xdp-newbies@vger.kernel.org>; Tue, 20 Sep 2022 10:37:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o2so4988097lfc.10
        for <xdp-newbies@vger.kernel.org>; Tue, 20 Sep 2022 10:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=KrlYRNCNXMxjfpqEa32eXH0NtzKSSwQTy7kYabDird0=;
        b=alDSydCKEmILCKa4Gu6qMtg/Ywo6mw8dyxJMuqZVtj5z9LYc1hF1O8g7fjyxoRspHp
         mMxuOk2ait0NxYx4NaW2PeZNlcb60wLcDtJ2/DcgEg55G/5R1QLOhBPyEF0NVXbCAlJp
         FSroHdTF7XJxTJO+zxd5XL2YUWfDWKhHQuA+q8IwIQKJUWrvlSDnMxMw+3gxaMUBRyc9
         mibXY8f2cVhIGPgPy4GxWtxmfKg6dm5jI5grLCM276k8qmpu8uEBofEm/GcDf7XDwyh2
         Lp16of00yJsDOZupB+IBwcy/uZIYlStPlKDBJff8rLXp4rw87n0k6izfjAl7gW3xkz9b
         AewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KrlYRNCNXMxjfpqEa32eXH0NtzKSSwQTy7kYabDird0=;
        b=FrO110pdCfPSB8WrjBW1z12bJ0zs7jRyRs5xsu0uBTzE65HTOrjH+IB6H4NWlZv8Pv
         dqxgIxqdkroIKcSHvHsMdt0Bs5g+lH0OBKodAau7pr7b/+3Y9MdSeCpXOT9RPA/s2Rpt
         iZX0URGYy8l33sX5tgSVgAZImwCaGwZ3GUSgWPrKwYvjp1JJ/PgQirVKZx59DBnKPtVn
         2UNlK5qB6AyvfJ8KzBvKO34y9dpbMfDAkPKN0C998m6K8aa32/Jsd3BuGsJ/Dgk5saOn
         Jbzzl1VzueWieDtdDPy5JNxiiXzCO4pyIn1kej7zBt0KBMVoTj0yxNco3syea71TOolo
         CkqQ==
X-Gm-Message-State: ACrzQf2oKakj1MbqwzDLRy4jIejBGhTIEf6vWBEbFceDMr+/H3FG0vjx
        EhQ+BA/YT69elqt/wbl1CnSIUG2m6dtZJHdsWU9+nfQfm7zXWg==
X-Google-Smtp-Source: AMsMyM7SRRJe2ksZqQOZRPV3cDKd4UXmukHSKhrGaYd9kgWepQN6C3U7GvuvlyOBzsSQrhP6BRwJIXR/L2B8MN27JY0=
X-Received: by 2002:a05:6512:3b20:b0:498:d7bc:28af with SMTP id
 f32-20020a0565123b2000b00498d7bc28afmr8151327lfv.65.1663695464581; Tue, 20
 Sep 2022 10:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <CADx6jH51gFXRvp2H76eePrz2oTw5-Av6nV4-N+CVVcgDKAuL2A@mail.gmail.com>
 <5287ae69-8263-6b53-ad69-adf1100342dd@redhat.com>
In-Reply-To: <5287ae69-8263-6b53-ad69-adf1100342dd@redhat.com>
From:   Adam Smith <hrotsvit@gmail.com>
Date:   Tue, 20 Sep 2022 12:37:33 -0500
Message-ID: <CADx6jH5iNLh7_zPhynBS4qwvvYj4DugLj5gBDdutUqX0UBK78g@mail.gmail.com>
Subject: Re: Questions about IRQ utilization and throughput with XDP_REDIRECT
 on Intel i40e
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com,
        Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
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

(answered inline, below)

On Tue, Sep 20, 2022 at 3:17 AM Jesper Dangaard Brouer
<jbrouer@redhat.com> wrote:
>
>
> (answered inline, below)
>
> On 19/09/2022 22.55, Adam Smith wrote:
> > Hello,
> >
> > In trying to understand the differences in IRQ utilization and
> > throughput when performing XDP_REDIRECT in a simple netfilter bridge
> > on the Intel i40e, we have encountered behavior we are unable to
> > explain and we would like advice on where to investigate next.
> >
> > The two questions we are seeking guidance for are:
> > 1) Why does XDP in the i40e driver handle interrupts on multiple IRQs,
> > while the same flows are serviced by a single IRQ without XDP
> > (netfilter bridge)?
> >
>
> Remember IRQ smp affinity is configurable via /proc/irq/ files.
> Below bash code simply uses the queue number as the assigned CPU number.
>
> echo " --- Align IRQs: i40e ---"
> # i40e have driver name as starting prefix, making it easier to "catch"
> for F in /proc/irq/*/i40e*-TxRx-*/../smp_affinity_list; do
>     # Extract irqname e.g. "i40e-eth2-TxRx-1"
>     irqname=3D$(basename $(dirname $(dirname $F))) ;
>     # Substring pattern removal to extract Q-number
>     hwq_nr=3D${irqname#*-*-*-}
>     echo $hwq_nr > $F
>     #grep . -H $F;
> done
>
> Thus we get this one-to-one mapping of Q-to-CPU number:
>
>   $ grep -H . /proc/irq/*/i40e*-TxRx-*/../smp_affinity_list
>   /proc/irq/218/i40e-i40e1-TxRx-0/../smp_affinity_list:0
>   /proc/irq/219/i40e-i40e1-TxRx-1/../smp_affinity_list:1
>   /proc/irq/220/i40e-i40e1-TxRx-2/../smp_affinity_list:2
>   /proc/irq/221/i40e-i40e1-TxRx-3/../smp_affinity_list:3
>   /proc/irq/222/i40e-i40e1-TxRx-4/../smp_affinity_list:4
>   /proc/irq/223/i40e-i40e1-TxRx-5/../smp_affinity_list:5
>   /proc/irq/224/i40e-0000:04:00.0:fdir-TxRx-0/../smp_affinity_list:0

Apologies, I should have mentioned that IRQ affinity was already
pinned via the recommended set_irq_affinity script from Intel driver
tools.

> > 2) Why does the i40e driver with XDP under load seemingly get faster
> > when tracing is attached to functions inside the driver=E2=80=99s napi_=
poll
> > loop?
>
> My theory is: Because you keep the CPU from going into sleep states.
>
> > Our working theory is that the i40e driver is not as efficient in
> > interrupt handling when XDP is enabled. Something in napi_poll is
> > looping too aggressively, and, when artificially slowed by attaching
> > to various kprobes and tracepoints, the slightly delayed code becomes
> > more efficient.
> >
> > Testing setup:
> >
>
> So, the test setup is basically a forwarding scenario using bridging.
> (It reminds me, we should add BPF bridge FIB lookup helpers... Cc lorenzo=
)
>
> > Without XDP, our iperf3 test utilizes almost 100% CPU on a single core
> > to achieve approximately 9.42 Gbits/sec. Total hard IRQs over 10
> > seconds is as follows:
> > i40e-enp1s0f1-TxRx-1            127k
> > Iperf3 retransmissions are roughly 0.
>
> The key here is that your test utilizes almost 100% CPU on a single
> core.  From this info I know that the CPU isn't going into deep sleep
> states.
>
>
> > With simple XDP_REDIRECT programs installed on both interfaces, CPU
> > usage drops to ~43% on two different cores (one significantly higher
> > than the other), and hard IRQs over 10 seconds is as follows:
> > i40e-enp1s0f0-TxRx-1            169k
> > i40e-enp1s0f0-TxRx-2              82k
>
> To avoid the jumping between IRQs, you should configure the smp_affinity
> as described above, BUT it will not solve the drop issue.

As stated above, IRQs were pinned, which is what led us to question
the difference between XDP & Linux bridge.

> > i40e-enp1s0f1-TxRx-1            147k
> > i40e-enp1s0f1-TxRx-2            235k
> > Throughput in this case is only ~8.75 Gbits/sec, and iperf3
> > retransmissions number between 1k and 3k consistently.
>
> The XDP redirect is so fast that the CPU is bored and decides to dive
> into deep sleep state levels.  If the time it takes to wakeup again +
> overhead of starting NAPI (hardirq->softirq) is too long, then packets
> will be dropped due to overflowing hardware RX-queue.
>
> You can directly see the time/latency it takes to wake up from these
> sleep states on your hardware from this grep command:
>
>   $ grep -H . /sys/devices/system/cpu/cpu0/cpuidle/state*/latency
>   /sys/devices/system/cpu/cpu0/cpuidle/state0/latency:0
>   /sys/devices/system/cpu/cpu0/cpuidle/state1/latency:2
>   /sys/devices/system/cpu/cpu0/cpuidle/state2/latency:10
>   /sys/devices/system/cpu/cpu0/cpuidle/state3/latency:40
>   /sys/devices/system/cpu/cpu0/cpuidle/state4/latency:133
>
> As explained in[1] you can calculate back how many bytes are able to
> arrive at a given link speed when sleeping e.g. 133 usec, and then based
> on the expected packet size figure out if the default 512 slots RX-queue
> for i40e is large enough.
>
> [1]
> https://github.com/torvalds/linux/blob/v6.0-rc6/samples/bpf/xdp_redirect_=
cpu_user.c#L331-L346

RX-queue size was set to 4096 for our tests, which is the maximum
available on the X710.

> > When we use bpftrace to attach multiple BPF programs to i40e functions
> > involved in XDP (e.g., `bpftrace -e =E2=80=98tracepoint:i40e:i40e_clean=
_rx_irq
> > {} kprobe:i40e_xmit_xdp_ring {}=E2=80=99), retransmissions drop to 0,
> > throughput increases to 9.4 Gbits/sec, and CPU utilization on the
> > busier CPU increases to ~73%. Hard IRQs are similar to the
> > XDP_REDIRECT IRQs above.
> >
> > Attaching traces should not logically result in a throughput increase.
> >
> > Any insight or guidance would be greatly appreciated!
>
> Solution#1: Sysadm can configured system to avoid deep-sleep via:
>
>   # tuned-adm profile network-latency
>
> Solution#2: Can be combined with increasing RX-queue size via:
>
>   # ethtool -G i40e1 rx 2048
>
> --Jesper

Thank you very much! Changing CPU sleep behaviors explained our 2nd
issue from above with retransmissions and slower speeds without
profiling attached.

We are still at a loss as to the differences in number of IRQs used
between XDP & bridge mode, but performance is now aligned with our
expectations. In rechecking these numbers after tuning the CPU with
tuned-adm, we did notice that XDP generates roughly 10x the number of
hard irqs compared to non-XDP bridge mode, but only on one
interrupt/core. See:

Non-XDP Bridge
$ sudo hardirqs -C 10 1
Tracing hard irq events... Hit Ctrl-C to end.
HARDIRQ                    TOTAL_count
[...]
i40e-enp1s0f1-TxRx-1     118820

XDP (same network flow)
$ sudo hardirqs -C 10 1
Tracing hard irq events... Hit Ctrl-C to end.
HARDIRQ                    TOTAL_count
[...]
i40e-enp1s0f0-TxRx-2       79071
i40e-enp1s0f0-TxRx-1     106929
i40e-enp1s0f1-TxRx-2     993162
i40e-enp1s0f1-TxRx-1     108362

Is it possible that we are seeing hard interrupts from both the RX &
TX packets under XDP? In non-XDP, we notice that we are only seeing
one network interface producing hard interrupts and we are assuming
that the other interface must be serviced fully by polling.

Thank you again!

Adam Smith
