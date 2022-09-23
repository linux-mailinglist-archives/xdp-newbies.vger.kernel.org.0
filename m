Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19F225E84DB
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Sep 2022 23:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiIWV2s (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Sep 2022 17:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiIWV2r (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Sep 2022 17:28:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E61132FE3
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Sep 2022 14:28:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a3so2158139lfk.9
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Sep 2022 14:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=MT2fU886pH5eIU4npgkip6OMiHA1yZo4C51wO+07/kU=;
        b=e6l92N9oGZFkwNwKLjvua7yXNsk4A5cITT/a9B5O+uMY1Wczp5rmnvXObglf2e5ojk
         D9zHJ8QHThHP6xjCqy/+//hq+YeufDuLw2ij9KUGZxC5SidscpccLV3C41awZ3GjHEpV
         bZP1Gp0vNnJ22HLUE1GdhxmEH1MQuvsbEzWMwgqxHMVk9KUQJsY5of/M7h646iWK4/9B
         WT2b3XwLh12+4N5fnnlbYZ5tqYDROhWscuE9bMU80Cs3slwVR6ILr9bFNAbEgT1scdS0
         PyK3gDR7RA7psd3/s/P3+LzichQS1gf2fDNtf/T1k6h5XgWabW9W5adJ2ueqO9Zj03Kw
         42hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MT2fU886pH5eIU4npgkip6OMiHA1yZo4C51wO+07/kU=;
        b=HDwll/zGmD4WYPu5yJR6ulbVUxK7p6NvNT4yYQnNjvwiP4WH7W/4WkHWLvgR8z54Fo
         ppfXESAqWIl5ijT/kR+oIFwHm5bcjypQqzEqa3WLOXx8iGzXcv2pQzJII/WuGWnLmgus
         cwM+S7Uc4gv8hLRZgXXz3LZE9M9FVJo/NNN7DlLBa8MmMnZeommwoiFPEgl0D7uO3cLY
         CpYkCf0gIMzUvuVr5fIqX/+/nxJdHmaWYXSejVZzDSYdWycpbLf2HYvcISXD+6iAqS93
         cjr2vspFtqUW+4BS6/alsS7gyQ1krrXQqb0FpwKuGkeq5ENuPLUwoyg+JuYwtKZ/ivV9
         D4Vg==
X-Gm-Message-State: ACrzQf0ACclxrRzGaBacQpW9CREKaNVaqiwYTt5+LkFRZJGViAR+zct5
        uJIKzHvrFnLU1I7ESofbIxzkd2Hd3A72OZseXj0=
X-Google-Smtp-Source: AMsMyM7zsoF+7nrXz55mtPJ9DNXMANsSaLAK7XrtqLVLtJNaSYlbTeY1uNYB0aZ7dvv2/Oge0k4stbjojT/JlpX3XMw=
X-Received: by 2002:a05:6512:3084:b0:49e:2275:fbb8 with SMTP id
 z4-20020a056512308400b0049e2275fbb8mr3821140lfd.40.1663968523610; Fri, 23 Sep
 2022 14:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADx6jH51gFXRvp2H76eePrz2oTw5-Av6nV4-N+CVVcgDKAuL2A@mail.gmail.com>
 <5287ae69-8263-6b53-ad69-adf1100342dd@redhat.com> <CADx6jH5iNLh7_zPhynBS4qwvvYj4DugLj5gBDdutUqX0UBK78g@mail.gmail.com>
 <4400b817-582a-842a-282b-4dd6d8a22f11@redhat.com>
In-Reply-To: <4400b817-582a-842a-282b-4dd6d8a22f11@redhat.com>
From:   Adam Smith <hrotsvit@gmail.com>
Date:   Fri, 23 Sep 2022 16:28:31 -0500
Message-ID: <CADx6jH7pxdvFsx2=DC=etkpUgjFe8rEPVvSQpHdWE09nvkxeyA@mail.gmail.com>
Subject: Re: Questions about IRQ utilization and throughput with XDP_REDIRECT
 on Intel i40e
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Federico Parola <federico.parola@polito.it>
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

On Fri, Sep 23, 2022 at 11:55 AM Jesper Dangaard Brouer
<jbrouer@redhat.com> wrote:
>
>
> On 20/09/2022 19.37, Adam Smith wrote:
> > (answered inline, below)
> >
> > On Tue, Sep 20, 2022 at 3:17 AM Jesper Dangaard Brouer
> > <jbrouer@redhat.com> wrote:
> >>
> >> (answered inline, below)
> >>
> >> On 19/09/2022 22.55, Adam Smith wrote:
> >>> Hello,
> >>>
> >>> In trying to understand the differences in IRQ utilization and
> >>> throughput when performing XDP_REDIRECT in a simple netfilter bridge
> >>> on the Intel i40e, we have encountered behavior we are unable to
> >>> explain and we would like advice on where to investigate next.
> >>>
> >>> The two questions we are seeking guidance for are:
> >>> 1) Why does XDP in the i40e driver handle interrupts on multiple IRQs=
,
> >>> while the same flows are serviced by a single IRQ without XDP
> >>> (netfilter bridge)?
> >>>
> >>
> >> Remember IRQ smp affinity is configurable via /proc/irq/ files.
> >> Below bash code simply uses the queue number as the assigned CPU numbe=
r.
> >>
> >> echo " --- Align IRQs: i40e ---"
> >> # i40e have driver name as starting prefix, making it easier to "catch=
"
> >> for F in /proc/irq/*/i40e*-TxRx-*/../smp_affinity_list; do
> >>      # Extract irqname e.g. "i40e-eth2-TxRx-1"
> >>      irqname=3D$(basename $(dirname $(dirname $F))) ;
> >>      # Substring pattern removal to extract Q-number
> >>      hwq_nr=3D${irqname#*-*-*-}
> >>      echo $hwq_nr > $F
> >>      #grep . -H $F;
> >> done
> >>
> >> Thus we get this one-to-one mapping of Q-to-CPU number:
> >>
> >>    $ grep -H . /proc/irq/*/i40e*-TxRx-*/../smp_affinity_list
> >>    /proc/irq/218/i40e-i40e1-TxRx-0/../smp_affinity_list:0
> >>    /proc/irq/219/i40e-i40e1-TxRx-1/../smp_affinity_list:1
> >>    /proc/irq/220/i40e-i40e1-TxRx-2/../smp_affinity_list:2
> >>    /proc/irq/221/i40e-i40e1-TxRx-3/../smp_affinity_list:3
> >>    /proc/irq/222/i40e-i40e1-TxRx-4/../smp_affinity_list:4
> >>    /proc/irq/223/i40e-i40e1-TxRx-5/../smp_affinity_list:5
> >>    /proc/irq/224/i40e-0000:04:00.0:fdir-TxRx-0/../smp_affinity_list:0
> >
> > Apologies, I should have mentioned that IRQ affinity was already
> > pinned via the recommended set_irq_affinity script from Intel driver
> > tools.
>
> It sounds like a bug (Cc Magnus) if you had pinned the IRQ affinity and
> then traffic migrates around anyway.
>
> There can be two possible setup issue that cause this:
>
> (#1) When loading XDP some drivers reset too much of the link
>       config (like ixgbe), which could lead to smp_affinity getting reset
>       to defaults. (Check setting with above grep -H . )

Verified that smp_affinity is not being reset.

> (#2) The i40e NICs hardware ATR/Flow-Director could be the one that
>       moves traffic in unexpected ways.  You can disable it via ethtool
>       running this command:
>
>     ethtool -K i40e1 ntuple-filters off
>
> (Cc Federico as they mention ATR/Flow-Director in their paper)

Disabling ntuple-filters did not change the behavior.

> >>> 2) Why does the i40e driver with XDP under load seemingly get faster
> >>> when tracing is attached to functions inside the driver=E2=80=99s nap=
i_poll
> >>> loop?
> >>
> >> My theory is: Because you keep the CPU from going into sleep states.
> >>
> >>> Our working theory is that the i40e driver is not as efficient in
> >>> interrupt handling when XDP is enabled. Something in napi_poll is
> >>> looping too aggressively, and, when artificially slowed by attaching
> >>> to various kprobes and tracepoints, the slightly delayed code becomes
> >>> more efficient.
> >>>
> >>> Testing setup:
> >>>
> >>
> >> So, the test setup is basically a forwarding scenario using bridging.
> >> (It reminds me, we should add BPF bridge FIB lookup helpers... Cc lore=
nzo)
> >>
> >>> Without XDP, our iperf3 test utilizes almost 100% CPU on a single cor=
e
> >>> to achieve approximately 9.42 Gbits/sec. Total hard IRQs over 10
> >>> seconds is as follows:
> >>> i40e-enp1s0f1-TxRx-1            127k
> >>> Iperf3 retransmissions are roughly 0.
> >>
> >> The key here is that your test utilizes almost 100% CPU on a single
> >> core.  From this info I know that the CPU isn't going into deep sleep
> >> states.
> >>
> >>
> >>> With simple XDP_REDIRECT programs installed on both interfaces, CPU
> >>> usage drops to ~43% on two different cores (one significantly higher
> >>> than the other), and hard IRQs over 10 seconds is as follows:
> >>> i40e-enp1s0f0-TxRx-1            169k
> >>> i40e-enp1s0f0-TxRx-2              82k
> >>
> >> To avoid the jumping between IRQs, you should configure the smp_affini=
ty
> >> as described above, BUT it will not solve the drop issue.
> >
> > As stated above, IRQs were pinned, which is what led us to question
> > the difference between XDP & Linux bridge.
> >
> >>> i40e-enp1s0f1-TxRx-1            147k
> >>> i40e-enp1s0f1-TxRx-2            235k
> >>> Throughput in this case is only ~8.75 Gbits/sec, and iperf3
> >>> retransmissions number between 1k and 3k consistently.
> >>
> >> The XDP redirect is so fast that the CPU is bored and decides to dive
> >> into deep sleep state levels.  If the time it takes to wakeup again +
> >> overhead of starting NAPI (hardirq->softirq) is too long, then packets
> >> will be dropped due to overflowing hardware RX-queue.
> >>
> >> You can directly see the time/latency it takes to wake up from these
> >> sleep states on your hardware from this grep command:
> >>
> >>    $ grep -H . /sys/devices/system/cpu/cpu0/cpuidle/state*/latency
> >>    /sys/devices/system/cpu/cpu0/cpuidle/state0/latency:0
> >>    /sys/devices/system/cpu/cpu0/cpuidle/state1/latency:2
> >>    /sys/devices/system/cpu/cpu0/cpuidle/state2/latency:10
> >>    /sys/devices/system/cpu/cpu0/cpuidle/state3/latency:40
> >>    /sys/devices/system/cpu/cpu0/cpuidle/state4/latency:133
> >>
> >> As explained in[1] you can calculate back how many bytes are able to
> >> arrive at a given link speed when sleeping e.g. 133 usec, and then bas=
ed
> >> on the expected packet size figure out if the default 512 slots RX-que=
ue
> >> for i40e is large enough.
> >>
> >> [1]
> >> https://github.com/torvalds/linux/blob/v6.0-rc6/samples/bpf/xdp_redire=
ct_cpu_user.c#L331-L346
> >
> > RX-queue size was set to 4096 for our tests, which is the maximum
> > available on the X710.
> >
> >>> When we use bpftrace to attach multiple BPF programs to i40e function=
s
> >>> involved in XDP (e.g., `bpftrace -e =E2=80=98tracepoint:i40e:i40e_cle=
an_rx_irq
> >>> {} kprobe:i40e_xmit_xdp_ring {}=E2=80=99), retransmissions drop to 0,
> >>> throughput increases to 9.4 Gbits/sec, and CPU utilization on the
> >>> busier CPU increases to ~73%. Hard IRQs are similar to the
> >>> XDP_REDIRECT IRQs above.
> >>>
> >>> Attaching traces should not logically result in a throughput increase=
.
> >>>
> >>> Any insight or guidance would be greatly appreciated!
> >>
> >> Solution#1: Sysadm can configured system to avoid deep-sleep via:
> >>
> >>    # tuned-adm profile network-latency
> >>
> >> Solution#2: Can be combined with increasing RX-queue size via:
> >>
> >>    # ethtool -G i40e1 rx 2048
> >>
> >> --Jesper
> >
> > Thank you very much! Changing CPU sleep behaviors explained our 2nd
> > issue from above with retransmissions and slower speeds without
> > profiling attached.
> >
> > We are still at a loss as to the differences in number of IRQs used
> > between XDP & bridge mode, but performance is now aligned with our
> > expectations. In rechecking these numbers after tuning the CPU with
> > tuned-adm, we did notice that XDP generates roughly 10x the number of
> > hard irqs compared to non-XDP bridge mode, but only on one
> > interrupt/core. See:
> >
>
> Good to hear the tuned-adm trick worked for you.
>
> > Non-XDP Bridge
> > $ sudo hardirqs -C 10 1
>
> Assume this is 1 sec sampling.

This is a 10 second sample window printed 1 time.

> > Tracing hard irq events... Hit Ctrl-C to end.
> > HARDIRQ                    TOTAL_count
> > [...]
> > i40e-enp1s0f1-TxRx-1     118820
> >
>
> Kind weird enp1s0f0 doesn't show up.

It is worth mentioning that enp1s0f1 is the egress interface,
suggesting that these interrupts occur on transmit. I agree that it
seems odd that enp1s0f0 doesn't at least show similar transmit for the
returning ACKs.

> Processing 10Gbit/s with MTU 1500 bytes packets means 833,333 packet per
> sec will be arriving (10*10^9/8/1500).
>
> Thus, NAPI pool must be doing some bulk processing, as your hardirq's
> are 118.820/sec.

Correcting for time factor, it's 11882/sec.

> I have a number of "napi_monitor" tools (I've implemented myself) to see
> what level of bulking you get.
> The @napi_bulk output from this bpftrace script shows you bulking:
>
> https://github.com/xdp-project/xdp-project/blob/master/areas/latency/napi=
_monitor.bt
>
> Script do much more (latency measurements) so you likely just want to
> use this oneliner:
>
>   bpftrace -e 'tracepoint:napi:napi_poll { @napi_bulk=3Dlhist(args->work,
> 0, 64, 4); }'
>
>
>
> > XDP (same network flow)
> > $ sudo hardirqs -C 10 1
> > Tracing hard irq events... Hit Ctrl-C to end.
> > HARDIRQ                    TOTAL_count
> > [...]
> > i40e-enp1s0f0-TxRx-2       79071
> > i40e-enp1s0f0-TxRx-1     106929
> > i40e-enp1s0f1-TxRx-2     993162
> > i40e-enp1s0f1-TxRx-1     108362
> >
>
> Ignoring the weird RX-queue spread.
>
> Only looking at i40e-enp1s0f1-TxRx-2 with 993,162 IRQ/sec.
> This is way too high, as we just learned 833Kpps should be the packet
> numbers.  As this is a TCP flow going though the bridging box, then we
> likely also need to account for the ACK packets flowing in the other
> direction, thus we can get above the 833Kpps.
>
> This could indicate that NAPI loop only process a single packet at the
> time, which is weird.
>
> Could you check what NAPI is doing, again with oneliner:
>
>   bpftrace -e 'tracepoint:napi:napi_poll { @napi_bulk=3Dlhist(args->work,
> 0, 64, 4); }'
>
>
> > Is it possible that we are seeing hard interrupts from both the RX &
> > TX packets under XDP?
>
> NIC drivers often tries to do the work of the TX DMA completion
> interrupts while processing RX packets anyhow, thus often the TX IRQ are
> significant lower if this happens.

As mentioned above, enp1s0f1 is the egress interface. We see
approximately a 10 to 1 ratio of transmitted packets to return ACK
packets, which seems to line up with the interrupt counters we are
seeing.

Repeated from above for clarity, with added annotations:

XDP (same network flow)
$ sudo hardirqs -C 10 1
Tracing hard irq events... Hit Ctrl-C to end.
HARDIRQ                    TOTAL_count
[...]
i40e-enp1s0f0-TxRx-2       79071  *[should be data receive if XDP is
respecting CPU affinity for transmit]
i40e-enp1s0f0-TxRx-1     106929  *[should be ACK transmitting if XDP
is respecting CPU affinity for transmit]
i40e-enp1s0f1-TxRx-2     993162  *[assumed iperf data transmit]
i40e-enp1s0f1-TxRx-1     108362  *[assumed ACK responses]

TSO & GSO are both disabled, so we are unsure why there's asymmetry on
TxRx-2 between the 2 interfaces.

> > In non-XDP, we notice that we are only seeing
> > one network interface producing hard interrupts and we are assuming
> > that the other interface must be serviced fully by polling.
>
> That is kind of weird, not seeing any IRQs for enp1s0f0.
>
> You should use this improved version of the oneline to also get ifnames:
>
>   sudo bpftrace -e 'tracepoint:napi:napi_poll {
> @napi_bulk[str(args->dev_name)]=3Dlhist(args->work, 0, 64, 4); }'
>
> --Jesper

We ran the above bpftrace command both with and without XDP enabled:

(bar charts removed)

XDP
------------------------------
@napi_bulk[enp1s0f0]:
[0, 4)             91335
[4, 8)                90
[8, 12)            43776
[12, 16)              31
[16, 20)           47939
[20, 24)              23
[24, 28)           10105
[28, 32)              28
[32, 36)            2350
[36, 40)              14
[40, 44)            1021
[44, 48)              12
[48, 52)             586
[52, 56)              24
[56, 60)            2285
[60, 64)              16
[64, 68)          110876

@napi_bulk[enp1s0f1]:
[0, 4)           1177723
[4, 8)                82
[8, 12)                7
[12, 16)               1
[16, 20)               3
[20, 24)               2
[24, 28)               1
[28, 32)               1
[32, 36)               0
[36, 40)               0
[40, 44)               0
[44, 48)               0
[48, 52)               1
[52, 56)               0
[56, 60)               0
[60, 64)               0
[64, 68)              41

No XDP (Linux bridge only)
-----------------------------
@napi_bulk[enp1s0f0]:
[64, 68)          122992

@napi_bulk[enp1s0f1]:
[0, 4)                  2800
[4, 8)                  1565
[8, 12)              91207
[12, 16)                820
[16, 20)            26599

*As a side note, @napi_bulk[str(args->dev_name)] wasn't recognized as
a valid arg by bpftrace, despite showing up in the format for the
tracepoint, so we used args->napi->dev->name for the key. I'm not sure
what I'm missing there, but it seemed worth mentioning.

Thanks!

Adam Smith
