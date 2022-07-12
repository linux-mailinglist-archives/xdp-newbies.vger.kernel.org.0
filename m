Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC659572868
	for <lists+xdp-newbies@lfdr.de>; Tue, 12 Jul 2022 23:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiGLVTT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 12 Jul 2022 17:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiGLVTT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 12 Jul 2022 17:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D406113D3A
        for <xdp-newbies@vger.kernel.org>; Tue, 12 Jul 2022 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657660756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y0TZBKwHC1LA0l8itGidXgPps7CILHQvM/dlzuTr0/8=;
        b=F9PWnClS36fT5S3trAOxofdOGDS0aEZWda2ElCUAzzIJjOSN3bUbSon1td82aNJOdIUnig
        E5djWo/3tYl/h1qWo2AK+8Zxka92NfjpZQ5qBKd+PJ5gUwnIgjYV/WWNrgAVJNzlXwuGUq
        sfoWxIIiK0qOh9Qq9PIJgxIRnNVUts8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-JEaNbBR-OKK7ByIR5GzsLA-1; Tue, 12 Jul 2022 17:19:14 -0400
X-MC-Unique: JEaNbBR-OKK7ByIR5GzsLA-1
Received: by mail-ej1-f69.google.com with SMTP id hs16-20020a1709073e9000b0072b73a28465so1688171ejc.17
        for <xdp-newbies@vger.kernel.org>; Tue, 12 Jul 2022 14:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Y0TZBKwHC1LA0l8itGidXgPps7CILHQvM/dlzuTr0/8=;
        b=XptO0HIgH48aez3DsmcaWVErCEUIdb7SSCGy1/me2B5l4xSwPAQgzbIoecZOOyrO4m
         FsC05GBXFB+n8txkL3iE4dXR7L4/4Xk4tiR+LegkGO4cdDf2ZBKlXxbXD1yTAzed7rb7
         uuUUJEtY4B1pGp6QPS1AVHdDx8maeSYzL3fh1XamFJEpiltnoXlGKcsFTLOy6mtRFZZq
         MfclCAH/8kNJwLjFUoqC64bQurxzmSrTBRP0xu4yCEQX2K1tNn5HXgvg28lSqd52Vcil
         hm5tb69DXR5sDKosz/7UrfSfG3rLBXdTr4ZJ5c/kPorYPjW7ih9LpPJAmYsmEF4YfI1Y
         4gAw==
X-Gm-Message-State: AJIora/zOp7mRJ1hm/C9FO/fxRwB2KKZGivzXsthfL0UgS+iI0tF6KW+
        kOeg+EWcgQ3LqUb/5Y6h7KlwN5xKRQZRBlxm/LyYYyZG0kSnlsI9FjuTQ9JXeOfuakMRsXovFHy
        K+oL0UEd1L+HYA2TZ60cWLYk=
X-Received: by 2002:a17:907:60cb:b0:726:a69a:c7a with SMTP id hv11-20020a17090760cb00b00726a69a0c7amr111811ejc.156.1657660752849;
        Tue, 12 Jul 2022 14:19:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5AyzMQVG0PDPk9ZicDXRQFVTYk51L5+O0hDcaTa0CPgtQsJ024KCm+MfIceUAmSowPOYrVw==
X-Received: by 2002:a17:907:60cb:b0:726:a69a:c7a with SMTP id hv11-20020a17090760cb00b00726a69a0c7amr111786ejc.156.1657660752534;
        Tue, 12 Jul 2022 14:19:12 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ky6-20020a170907778600b0072b11cb485asm4161627ejc.208.2022.07.12.14.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 14:19:11 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 323744D9798; Tue, 12 Jul 2022 23:19:11 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Adam Smith <hrotsvit@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: XDP redirect throughput with multi-CPU i40e
In-Reply-To: <CADx6jH6nFOGjM1Q3Yj65Bh4fcT_qjf-k-d31vpGsxHbD-2=g=w@mail.gmail.com>
References: <CADx6jH6nFOGjM1Q3Yj65Bh4fcT_qjf-k-d31vpGsxHbD-2=g=w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 12 Jul 2022 23:19:11 +0200
Message-ID: <87o7xuowq8.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Adam Smith <hrotsvit@gmail.com> writes:

> Hello,
>
> I have a question regarding bpf_redirect/bpf_redirect_map and latency
> that we are seeing in a test. The environment is as follows:
>
> - Debian Bullseye, running 5.18.0-0.bpo.1-amd64 kernel from
> Bullseye-backports (Also tested on 5.16)
> - Intel Xeon X3430 @ 2.40GHz. 4 cores, no HT
> - Intel X710-DA2 using i40e driver included with the kernel.
> - Both interfaces (enp1s0f0 and enps0f1) in a simple netfilter bridge.
> - Ring parameters for rx/tx are both set to the max of 4096, with no
> other nic-specific parameters changed.
>
> Each interface has 4 combined IRQs, pinned per set_irq_affinity.
> `irqbalanced` is not installed.
>
> Traffic is generated by another directly attached machine via iperf3
> 3.9 (`iperf3 -c -t 0 192.168.1.3 --bidir`) to a directly attached
> server on the other side.
>
> The server in question does nothing more than forward packets as a
> transparent bridge.
>
> An XDP program is installed on f0 to redirect to f1, and f1 to
> redirect to f0. I have tried programs that simply call
> `bpf_redirect()`, as well as programs that share a device map and call
> `bpf_redirect_map()`, with idententical results.
>
> When channel parameters for each interface are reduced to a single IRQ
> via `ethtool -L enp1s0f0 combined 1`, and both interface IRQs are
> bound to the same CPU core via smp_affinity, XDP produces improved
> bitrate with reduced CPU utilization over non-XDP tests:
> - Stock netfilter bridge: 9.11 Gbps in both directions at 98%
> utilization of pinned core.
> - XDP: Approximately 9.18 Gbps in both directions at 50% utilization
> of pinned core.
>
> However, when multiple cores are engaged (combined 4, with
> set_irq_affinity), XDP processes markedly fewer packets per second
> (950,000 vs approximately 1.6 million). iperf3 also shows a large
> number of retransmissions in its output regardless of CPU engagement
> (approximately 6,500 with XDP over 2 minutes vs 850 with single core
> tests).
>
> This is a sample taken from linux/samples xdp_monitor showing
> redirection and transmission of packets with XDP engaged:
>
> Summary                              944,508 redir/s            0
> err,drop/s    944,506 xmit/s
>   kthread                                           0 pkt/s
>    0 drop/s                   0 sched
>   redirect total                        944,508 redir/s
>       cpu:0                               470,148 redir/s
>       cpu:2                                 15,078 redir/s
>       cpu:3                               459,282 redir/s
>   redirect_err                                    0 error/s
>   xdp_exception                                0 hit/s
>   devmap_xmit total               944,506 xmit/s               0
> drop/s         0 drv_err/s
>      cpu:0                                 470,148 xmit/s
>  0 drop/s         0 drv_err/s
>      cpu:2                                   15,078 xmit/s
>   0 drop/s         0 drv_err/s
>      cpu:3                                 459,280 xmit/s
>  0 drop/s         0 drv_err/s
>   xmit enp1s0f0->enp1s0f1    485,249 xmit/s                0 drop/s
>      0 drv_err/s
>      cpu:0                                 470,172 xmit/s
>   0 drop/s         0 drv_err/s
>      cpu:2                                   15,078 xmit/s
>    0 drop/s         0 drv_err/s
>   xmit enp1s0f1->enp1s0f0    459,263 xmit/s                0 drop/s
>      0 drv_err/s
>      cpu:3                                 459,263 xmit/s
>   0 drop/s         0 drv_err/s
>
> Our current hypothesis is that this is a CPU affinity issue. We
> believe a different core is being used for transmission. In efforts to
> prove this, how can we successfully measure if bpf_redirect() is
> causing packets to be transmitted by a different core than they were
> received by? We are still trying to understand how bpf_redirect()
> selects which core/IRQ to transmit on and would appreciate any insight
> or followup material to research.

There is no mechanism in bpf_redirect() to switch CPUs (outside of
cpumap). When you call XDP_REDIRECT, the frame will be added to a
per-device per-CPU flush list, which will be flushed (on that same CPU).
The i40e allocates separate rings for XDP, though, and not sure how it
does that, so maybe those are what's missing. You should be able to see
drops in the output if that's what's going on; and the packets should
still be processed by XDP.

So sounds more like the hardware configuration is causing packet loss
before it even hits XDP. Do you see anything in the ethtool stats that
might explain where packets are being dropped?

-Toke

