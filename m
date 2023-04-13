Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0306E0D2B
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Apr 2023 14:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDMMAg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 Apr 2023 08:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjDMMAf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 Apr 2023 08:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2012E0
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Apr 2023 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681387189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=beD4cTHf0DshdU5CW8tWIiHqjzF8jM0m0aSDibqEAgw=;
        b=VQNmX14UTyB9ywegw0De9uvHbTgEF8VHusjnIvo2DLaTLuoGoq/G4p/qSqOL/t1fMLCiWK
        tiBi8/xp+hCSEACly9TESutgyRYbSYV5SbJI4bbO8SXh6BZa+AVD8plPBqwlv5sNgmxP/T
        2AXjv2IEt0Fa/WrcioBnmotVL3RutRI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-ttBu3yYbME29piGt4lOM6w-1; Thu, 13 Apr 2023 07:59:47 -0400
X-MC-Unique: ttBu3yYbME29piGt4lOM6w-1
Received: by mail-ej1-f69.google.com with SMTP id vt6-20020a170907a60600b009217998c8e3so5274012ejc.14
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Apr 2023 04:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681387186; x=1683979186;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=beD4cTHf0DshdU5CW8tWIiHqjzF8jM0m0aSDibqEAgw=;
        b=lMhXNwH5h0Rd7GVZ8BszrcppUe4DIgk1i+WKTPYMFkvi4PFOq/NeegM2LJOJgm1Zvq
         YNu8x1eRCWqzSKvPeMUxloYXIOD8ciDD6n1peA8CvGvnv1j1XZk1TkbGbdTdRTMO5Qup
         oqINAcThxAAeJofeMpUB5w4yme6xy3MKaTwUEOD96QoAfmeZ1japlG97xOQzBzNh8Ynd
         9K/p9bWZ8LgRrixtJoJcDx9Uqjm6cOhySNMOvNKAEONIk7K7joWwROAiO42zz8T/Qx7v
         fECGSBIwulp31iYHhlf2Gzc2m6t5ae7BXLl5rd4rLlSO+UypyljmC6RJRwSiZsNh3wW5
         Qwsw==
X-Gm-Message-State: AAQBX9dDaY0AAzKLjY/sC0TvMe9M1J0Hn07rqiBr9mm2eR1L+QKa2Sph
        oDOTefE7Hdrr3rTOZqfUqNew/mcxS1AfnRMlrPuHSNGegrilP8OzsZ4vNVXS9+gJmS6eeCurGeY
        dRSx6tMgPwT2CII5bt6N64dRP6EmIVps=
X-Received: by 2002:a17:906:2295:b0:947:ebd5:c798 with SMTP id p21-20020a170906229500b00947ebd5c798mr2311708eja.54.1681387186523;
        Thu, 13 Apr 2023 04:59:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3aYxaVtCxUUCzK/T/6pridAz34yV8XTvDDYvLuc9Gx47mtN2aIm+ed/ZWnx9tqQ8sYdQsPQ==
X-Received: by 2002:a17:906:2295:b0:947:ebd5:c798 with SMTP id p21-20020a170906229500b00947ebd5c798mr2311686eja.54.1681387186143;
        Thu, 13 Apr 2023 04:59:46 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net. [194.45.78.10])
        by smtp.gmail.com with ESMTPSA id mf12-20020a170906cb8c00b00947a40ded80sm875797ejb.104.2023.04.13.04.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 04:59:45 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <a3e3d310-e234-d3d8-acf4-4ff98fceb593@redhat.com>
Date:   Thu, 13 Apr 2023 13:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc:     brouer@redhat.com,
        Srinivas Narayana Ganapathy <sn624@cs.rutgers.edu>,
        Tariq Toukan <tariqt@nvidia.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Qiongwen Xu <qx51@cs.rutgers.edu>, Jiri Olsa <jolsa@kernel.org>
Subject: Re: Question about xdp: how to figure out the throughput is limited
 by pcie
Content-Language: en-US
To:     Arnaldo Carvalho de Melo <acme@redhat.com>,
        Andi Kleen <andi@firstfloor.org>
References: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
 <b8fa06c4-1074-7b48-6868-4be6fecb4791@redhat.com>
 <CH2PR14MB3657EF09F9A2BE7C08E4C9DBE3989@CH2PR14MB3657.namprd14.prod.outlook.com>
 <7C8EC844-D2DF-4980-A178-30E2719E3575@cs.rutgers.edu>
In-Reply-To: <7C8EC844-D2DF-4980-A178-30E2719E3575@cs.rutgers.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Andi and Acme,

Regarding below discussion and subj (top-posting as you don't need to
read discussion to answer my perf questions).

Can we somehow use perf to profile things happening in PCIe ?
E.g. Are there any PMU counters "uncore" events for PCIe ?

   Hint, we can list more PMU counter via Andi's ocperf tool[42].
   # sudo ./ocperf list

Could we use the TopDown [toplev] model, to indicate/detect that the
PCIe device (or PCIe root complex) is the bottleneck?

   Hint, try out the [toplev] tool looking at specific core under-load
   # sudo ./toplev.py -I 3000 -l3 -a --show-sample --core C2

--Jesper

  [toplev] https://github.com/andikleen/pmu-tools/wiki/toplev-manual
  [42] https://github.com/andikleen/pmu-tools

On 13/04/2023 04.54, Qiongwen Xu wrote:
> Hi Jesper,
> 
> Thanks for the detailed reply and sharing these helpful materials/papers with us!
> 
> After enabling rx_cqe_compress, the throughput in our experiment increases from
> 70+Mpps to 85 Mpps. We also tried to use the counter "rx_discards_phy". The counter
> increases in both cpu-limited and pcie-limited experiments, i.e., in the experiment
> which is only cpu-limited can also increase the counter. We are looking for any
> counter that can separate cpu- and pcie-limited cases. Regarding the [pcie-bench] tool,
> unfortunately, we are not able to use it, as it requires fpga hardware.
> 
> Thanks,
> Qiongwen
> 
> From: Jesper Dangaard Brouer <jbrouer@redhat.com>
> Date: Sunday, April 9, 2023 at 11:46 AM
> Subject: Re: Question about xdp: how to figure out the throughput is limited by pcie
> (answered inline below)
> 
> On 07/04/2023 03.46, Qiongwen Xu wrote:
>> Dear XDP experts,
>>
>> I am a PhD student at Rutgers. Recently, I have been reading the XDP
>> paper "The eXpress Data Path: Fast Programmable Packet Processing
>> in the Operating System Kernel". In section 4.1 and 4.3, you mention
>> the throughputs of xdp programs (packet drop and packet forwarding)
>> are limited by the PCIe (e.g., "Both scale their performance linearly
>> until they approach the global performance limit of the PCI bus").
> 
> Most of the article[1][2] authors are likely this mailing list,
> including me. (Sad to see we called it "PCI *bus*" and not just PCIe).
> 
>> I am curious about how you figured out it was the PCIe limitation.
> 
> It is worth noting that the PCIe limitation shown in article is related
> to number of PCIe transactions with small packets (Ethernet minimum
> frame size 64 Bytes). (Thus meaning NOT bandwidth related).
> 
> The observations that lead to the PCIe limitation conclusion:
> A single CPU doing XDP_DROP (25Mpps) was using 100% CPU time (runtime
> attributed to ksoftirqd).  When we scaled up XDP_DROP to run on more
> CPUs we saw something strange[3].  It scaled linear to 3 CPUs, and at 4
> CPUs each CPU started to process less packets per sec (pps) and total
> (86Mpps) stayed the same.  Even more strange the CPUs wasn't using 100%
> CPU any-longer, CPUs had "time" to idle.  Looking at ethtool stats, we
> noticed the counter "rx_discards_phy", which (we were told) happens when
> PCIe causes backpressure.
> 
> What confirmed the PCIe (transactions) bottleneck was[4] when we
> discovered enabling the mlx5 priv-flags rx_cqe_compress=on (and
> rx_striding_rq=off) changed the total limit (86Mpps to 108Mpps),
> as rx_cqe_compress reduce the transactions on PCIe by compressing the RX
> descriptors.  Thus, confirming this was related to PCIe.
> 
> 
>   > Is there any tool or method to check this?
> 
> I *highly* recommend that you read this article [pci1][pci2]:
>    - Title: "Understanding PCIe performance for end host networking"
> 
> I wish we had read and referenced this article in ours (but both
> happened in 2018).  They give a theoretical model for PCIe, both
> bandwidth and latency.  That could be used to explain our PCIe
> observations. They also released their [pcie-bench] tool.
> 
> I wish more (kernel) performance people understood, that PCIe is a
> protocol (3-layers: physical, data link layer (DLL) and Transaction
> Layer Packets (TLP)), that is used between the device and host
> OS-driver.  In networking usually ignores this PCIe protocol step, with
> associated protocol overheads, which actually causes a network packet to
> be split into smaller PCIe TLP "packets" with their own PCIe level
> headers. Besides the packet data itself, the PCIe protocol is used for
> reading TX desc (seen from device) and writing RX desc (seen from
> device), and read/update queue pointers.
> 
> It might surprise people that article [pci1] shows, that PCIe (128B
> payload) introduces a latency around 600ns (nanosec), which is
> significantly larger than the inter-packet gap needed for wirespeed
> networking.  Thus, latency hiding happens "behind our back", via the
> device and DMA engine have to keep many transactions in-flight to
> utilize the NIC (yet another hidden queue in the system).
> 
> --Jesper
> 
> Links:
> 
>    [1] https://dl.acm.org/doi/10.1145/3281411.3281443
>    [2] https://github.com/xdp-project/xdp-paper
>    [3]
> https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench02_xdp_drop.org
>    [4]
> https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench01_baseline.org
> 
> Read this article:
>    [pci0] https://dl.acm.org/doi/10.1145/3230543.3230560
>    [pci1]
> https://www.cl.cam.ac.uk/research/srg/netos/projects/pcie-bench/neugebauer2018understanding.pdf
>    [pci2] https://www.cl.cam.ac.uk/research/srg/netos/projects/pcie-bench/
>    [pcie-bench] https://github.com/pcie-bench/pcie-model
> 

