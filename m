Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1949858C490
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Aug 2022 10:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237058AbiHHIEN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Aug 2022 04:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiHHIEN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Aug 2022 04:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70BCE13D42
        for <xdp-newbies@vger.kernel.org>; Mon,  8 Aug 2022 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659945851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=afO3wT68oBP+5UDnjLFF+85Pe+M1pf6dmmkw9memUI8=;
        b=DZq49aXR6FTRdzmjLX36oO0kmtqnlNSJP1MpsGjx4CVXUEz/fFJGgKZyjJg/wkfYHErDeq
        I47E5Ipe7kZ5CBvRRuMPRcm4GZ5ohbjTajnCkNcMloESlCEgFXgPNpr/tq5adoTjs10XhU
        ZMxJRhLW2QW0vHWihxwUy/A/nCITUzE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-0Xctgf4JO9qPMILmkwkKeA-1; Mon, 08 Aug 2022 04:04:05 -0400
X-MC-Unique: 0Xctgf4JO9qPMILmkwkKeA-1
Received: by mail-lf1-f69.google.com with SMTP id n17-20020ac242d1000000b0048af11cb0f4so1968306lfl.19
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Aug 2022 01:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=afO3wT68oBP+5UDnjLFF+85Pe+M1pf6dmmkw9memUI8=;
        b=AwJ8GRx8AuOL82GVIoPAadzW+HNtCQ0OY0SjpXiNhrKNtW8SIY7xrRt5ABvfZag1N9
         dYmxJcSK4Kgwm6AqiBG6mZKS7YU/9tzGUwyqHalpDYIOCsT0enmbXwfoaemiUbohxfDO
         dO2uThWlKguabVWTzCGYogdv6wz685LrqyAZcoBGw5n/xbCoroS0NcbxIbgQDhyLnSjP
         4nwd/hPsWxjZvNJkS1B/MW+Nunn6IpJj+ImcCYUomsEATFNYcTby0f7eKk4aHXCRq+0g
         7tMb3Ha/ihsULNc5rQyD0InkjheRE3VMKjfD0ByD5QExivcq+zkM3nxEMVJhxdENchfx
         zQ4w==
X-Gm-Message-State: ACgBeo1+SIy8DzbICQAIZTW3CpHgfvWN/8sHGUgv8/h5qNi21LTcnb9y
        0pVJQjte/nYDjuzObBjKKJ2mG0ThsVq4Hi8WWnoOpDRrqBDDEl5fla0BdxpT27LMxWmCYzo2Wfy
        n2fA+Ir2B84QrOoFhrBSFTRs=
X-Received: by 2002:a2e:a37b:0:b0:25e:7267:4ab9 with SMTP id i27-20020a2ea37b000000b0025e72674ab9mr5123456ljn.29.1659945843993;
        Mon, 08 Aug 2022 01:04:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41W+Ry6SZWF39xKZPL3qMCUk1YyJ9D3yZvkU9h+LJIRuOsFU5yUAe6mq+FO5Q7bSX9ATXRNQ==
X-Received: by 2002:a2e:a37b:0:b0:25e:7267:4ab9 with SMTP id i27-20020a2ea37b000000b0025e72674ab9mr5123451ljn.29.1659945843758;
        Mon, 08 Aug 2022 01:04:03 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id c23-20020a2e9d97000000b0025e4e7c016dsm1282094ljj.16.2022.08.08.01.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 01:04:03 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <ab2802b3-6de5-1ae7-cdcb-1204e2fac8e7@redhat.com>
Date:   Mon, 8 Aug 2022 10:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Cc:     brouer@redhat.com
Subject: Re: How to benchmark packet throughput for submitting patches?
Content-Language: en-US
To:     Zvi Effron <zeffron@riotgames.com>,
        Xdp <xdp-newbies@vger.kernel.org>
References: <CAC1LvL1E9wC8GS=x+yoAmA02iAgWRvRFu14pqHwLDzxod5RLJg@mail.gmail.com>
In-Reply-To: <CAC1LvL1E9wC8GS=x+yoAmA02iAgWRvRFu14pqHwLDzxod5RLJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 01/08/2022 23.11, Zvi Effron wrote:
> I see that many XDP patchset submissions to the bpf mailing list
> include benchmark numbers for packet throughput to show how much the
> change improves (or worsens) performance. 

It is very important to show the *change* in performance.
Meaning baseline numbers for comparison is more important than the
absolute performance numbers.

> They frequently show numbers for a single core test.
> 

The single core or actually single RX-queue test is important to XDP.
For reasons that might surprise you(?).

The intuitive reason is that it's easier to reason about and do
calculations on as we know the CPU is kept 100% busy.

The non-intuitive reason is that when scaling up with more CPUs, then
XDP is so fast that hardware becomes the bottleneck and CPUs will start
to have idle cycles.  This is MUCH harder to reason about and
understand, and is often misinterpreted.  The xdp-paper benchmarks[2]
doc examples where the HW is the bottleneck and how we identify counter
via ethtool_stats.pl [3].



> I was wondering what methodology people are using to generate these
> benchmark results?

On the packet *generator*, I usually use the kernels pktgen via the 
scripts in kernel tree under samples/pktgen/[1]

  [1] https://github.com/torvalds/linux/tree/master/samples/pktgen

  Example command:
   $ ./samples/pktgen/pktgen_sample03_burst_single_flow.sh -vi mlx5p2 -d 
10.40.40.2 -m 3c:fd:fe:b3:31:49 -t 12

As the script name "pktgen_sample03_burst_single_flow" indicate this is
generating a single flow, which will cause the RSS-hash in the NIC hit a
single RX-queue.  The '-t 12' means 12 CPU cores will be generating this
traffic.

Our xdp-paper have detailed records of the benchmarking we did:
  [2] https://github.com/xdp-project/xdp-paper/tree/master/benchmarks


On the Device Under Test (DUT) I usually run sample "xdp_rxq_info", that
report stats on a RX-queue + CPU basis.


I'm interested in hearing what other do?

--Jesper

[3] 
https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl

