Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A0C5BDFC8
	for <lists+xdp-newbies@lfdr.de>; Tue, 20 Sep 2022 10:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiITIU2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 20 Sep 2022 04:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbiITITz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 20 Sep 2022 04:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7B1BDE
        for <xdp-newbies@vger.kernel.org>; Tue, 20 Sep 2022 01:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663661840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vkxzPf1nJqU+Dvd4qXDk5l6deuMw7qpazcKC//kwHb4=;
        b=V334WQYwiK0bC+UDVUEMT4w28LRM+eBq6KWVNWeomaPSPd5/hqXiwdLKhnBCW5XrkwhNmm
        qw0pc0lXi7zG1wzO0HAQSFM52y4ujf0jtv+NXTCtuMfFHBrh+kcdOSc36yQXjblSUoEq5m
        EirvZ6Mf7APPkM3bl9Hl+Pfv/FznRus=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-4MRI4gx1PhaAKDMEOZbFuQ-1; Tue, 20 Sep 2022 04:17:17 -0400
X-MC-Unique: 4MRI4gx1PhaAKDMEOZbFuQ-1
Received: by mail-lf1-f71.google.com with SMTP id e8-20020a056512090800b0049e75e68d3eso613610lft.18
        for <xdp-newbies@vger.kernel.org>; Tue, 20 Sep 2022 01:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=vkxzPf1nJqU+Dvd4qXDk5l6deuMw7qpazcKC//kwHb4=;
        b=6glDTDglOT9xtI9HA6J7ZRx/K8lSygTqulUFw19gPkcnFzXRaVld+UxYi2gfpPI6Wc
         fhzg2z5APJNJDF5H0yPrBcIkq7kAdXmZTuSeYypFJobEO6gTB7Mv0Lc6gIRa5nB+27He
         VxjwGbkbkLAhdeorRIr+AeHDIIRapSvEXo4UTeJdqhjgj9Bb4p3wX1QCQhmaB/8bHdh3
         0Jy+v0Tv08Sqsq6GqKcj93mQVyJY0WHDAOu/YUkat4f0Ujcc3R21z//FemyX20EtkzMC
         8tiz6RjxeBsrAg2XGVBKjAOEjp6iULShkDzCVvoLsm36RNZ2/zwFnfe/1livIAzzZXzU
         bXTg==
X-Gm-Message-State: ACrzQf2uCiq7cGZniOHCX4EPmcsJpWwscR5EW7xlPrVDU+hW96gd8rJK
        nkhm1vhQFyrAg3tNut+RcvtyNXBmQqRGsyDirhFXOlKNCATL2ywSEeWFdn8i5KB4orgcwJbQg81
        tunkLvNOq/quev8eSTFAS1Qo=
X-Received: by 2002:a05:651c:1033:b0:26a:aa02:b0fa with SMTP id w19-20020a05651c103300b0026aaa02b0famr7036275ljm.82.1663661835877;
        Tue, 20 Sep 2022 01:17:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7lII9ebNJFn6FlpU2YI0ZSoOpj44fR+Fhvei+UK/hXWkHBq8o28m9R93cP6Tcrm1vTG+6pSA==
X-Received: by 2002:a05:651c:1033:b0:26a:aa02:b0fa with SMTP id w19-20020a05651c103300b0026aaa02b0famr7036266ljm.82.1663661835591;
        Tue, 20 Sep 2022 01:17:15 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id q20-20020a2e8754000000b00261beb471d1sm140182ljj.121.2022.09.20.01.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:17:15 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <5287ae69-8263-6b53-ad69-adf1100342dd@redhat.com>
Date:   Tue, 20 Sep 2022 10:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: Questions about IRQ utilization and throughput with XDP_REDIRECT
 on Intel i40e
Content-Language: en-US
To:     Adam Smith <hrotsvit@gmail.com>, xdp-newbies@vger.kernel.org
References: <CADx6jH51gFXRvp2H76eePrz2oTw5-Av6nV4-N+CVVcgDKAuL2A@mail.gmail.com>
In-Reply-To: <CADx6jH51gFXRvp2H76eePrz2oTw5-Av6nV4-N+CVVcgDKAuL2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


(answered inline, below)

On 19/09/2022 22.55, Adam Smith wrote:
> Hello,
> 
> In trying to understand the differences in IRQ utilization and
> throughput when performing XDP_REDIRECT in a simple netfilter bridge
> on the Intel i40e, we have encountered behavior we are unable to
> explain and we would like advice on where to investigate next.
> 
> The two questions we are seeking guidance for are:
> 1) Why does XDP in the i40e driver handle interrupts on multiple IRQs,
> while the same flows are serviced by a single IRQ without XDP
> (netfilter bridge)?
> 

Remember IRQ smp affinity is configurable via /proc/irq/ files.
Below bash code simply uses the queue number as the assigned CPU number.

echo " --- Align IRQs: i40e ---"
# i40e have driver name as starting prefix, making it easier to "catch"
for F in /proc/irq/*/i40e*-TxRx-*/../smp_affinity_list; do
    # Extract irqname e.g. "i40e-eth2-TxRx-1"
    irqname=$(basename $(dirname $(dirname $F))) ;
    # Substring pattern removal to extract Q-number
    hwq_nr=${irqname#*-*-*-}
    echo $hwq_nr > $F
    #grep . -H $F;
done

Thus we get this one-to-one mapping of Q-to-CPU number:

  $ grep -H . /proc/irq/*/i40e*-TxRx-*/../smp_affinity_list
  /proc/irq/218/i40e-i40e1-TxRx-0/../smp_affinity_list:0
  /proc/irq/219/i40e-i40e1-TxRx-1/../smp_affinity_list:1
  /proc/irq/220/i40e-i40e1-TxRx-2/../smp_affinity_list:2
  /proc/irq/221/i40e-i40e1-TxRx-3/../smp_affinity_list:3
  /proc/irq/222/i40e-i40e1-TxRx-4/../smp_affinity_list:4
  /proc/irq/223/i40e-i40e1-TxRx-5/../smp_affinity_list:5
  /proc/irq/224/i40e-0000:04:00.0:fdir-TxRx-0/../smp_affinity_list:0


> 2) Why does the i40e driver with XDP under load seemingly get faster
> when tracing is attached to functions inside the driver’s napi_poll
> loop?

My theory is: Because you keep the CPU from going into sleep states.

> Our working theory is that the i40e driver is not as efficient in
> interrupt handling when XDP is enabled. Something in napi_poll is
> looping too aggressively, and, when artificially slowed by attaching
> to various kprobes and tracepoints, the slightly delayed code becomes
> more efficient.
> 
> Testing setup:
> 

So, the test setup is basically a forwarding scenario using bridging.
(It reminds me, we should add BPF bridge FIB lookup helpers... Cc lorenzo)

> Without XDP, our iperf3 test utilizes almost 100% CPU on a single core
> to achieve approximately 9.42 Gbits/sec. Total hard IRQs over 10
> seconds is as follows:
> i40e-enp1s0f1-TxRx-1            127k
> Iperf3 retransmissions are roughly 0.

The key here is that your test utilizes almost 100% CPU on a single 
core.  From this info I know that the CPU isn't going into deep sleep 
states.


> With simple XDP_REDIRECT programs installed on both interfaces, CPU
> usage drops to ~43% on two different cores (one significantly higher
> than the other), and hard IRQs over 10 seconds is as follows:
> i40e-enp1s0f0-TxRx-1            169k
> i40e-enp1s0f0-TxRx-2              82k

To avoid the jumping between IRQs, you should configure the smp_affinity
as described above, BUT it will not solve the drop issue.

> i40e-enp1s0f1-TxRx-1            147k
> i40e-enp1s0f1-TxRx-2            235k
> Throughput in this case is only ~8.75 Gbits/sec, and iperf3
> retransmissions number between 1k and 3k consistently.

The XDP redirect is so fast that the CPU is bored and decides to dive
into deep sleep state levels.  If the time it takes to wakeup again +
overhead of starting NAPI (hardirq->softirq) is too long, then packets
will be dropped due to overflowing hardware RX-queue.

You can directly see the time/latency it takes to wake up from these
sleep states on your hardware from this grep command:

  $ grep -H . /sys/devices/system/cpu/cpu0/cpuidle/state*/latency
  /sys/devices/system/cpu/cpu0/cpuidle/state0/latency:0
  /sys/devices/system/cpu/cpu0/cpuidle/state1/latency:2
  /sys/devices/system/cpu/cpu0/cpuidle/state2/latency:10
  /sys/devices/system/cpu/cpu0/cpuidle/state3/latency:40
  /sys/devices/system/cpu/cpu0/cpuidle/state4/latency:133

As explained in[1] you can calculate back how many bytes are able to
arrive at a given link speed when sleeping e.g. 133 usec, and then based
on the expected packet size figure out if the default 512 slots RX-queue
for i40e is large enough.

[1] 
https://github.com/torvalds/linux/blob/v6.0-rc6/samples/bpf/xdp_redirect_cpu_user.c#L331-L346

> When we use bpftrace to attach multiple BPF programs to i40e functions
> involved in XDP (e.g., `bpftrace -e ‘tracepoint:i40e:i40e_clean_rx_irq
> {} kprobe:i40e_xmit_xdp_ring {}’), retransmissions drop to 0,
> throughput increases to 9.4 Gbits/sec, and CPU utilization on the
> busier CPU increases to ~73%. Hard IRQs are similar to the
> XDP_REDIRECT IRQs above.
> 
> Attaching traces should not logically result in a throughput increase.
> 
> Any insight or guidance would be greatly appreciated!

Solution#1: Sysadm can configured system to avoid deep-sleep via:

  # tuned-adm profile network-latency

Solution#2: Can be combined with increasing RX-queue size via:

  # ethtool -G i40e1 rx 2048

--Jesper

