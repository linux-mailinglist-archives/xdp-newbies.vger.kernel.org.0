Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977956DC094
	for <lists+xdp-newbies@lfdr.de>; Sun,  9 Apr 2023 17:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjDIPp2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 9 Apr 2023 11:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIPp1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 9 Apr 2023 11:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1228E30F8
        for <xdp-newbies@vger.kernel.org>; Sun,  9 Apr 2023 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681055077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sx4mFme70E/W6QCHcJyWjUDQ4qrSrUIZoAT0U87T3hs=;
        b=KiiOgxT3BuCnMsbLpd1jSmaiRiBpxB4xNqbtq1KDQ1kgSyMYWk5ntdknqIb5T9apWz7LEq
        k6OCPznEJNqnQAA1nPi2rQ/hcmA8EOkS1Ji96DFgxVhTEzkuqKYgwOfWtiZGzkbP9zsvsH
        gfou4FJ9CgyAEiOUTx1fvVZFS2Tbd3M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-H6lRheY5OzeNqTwVXd6B5w-1; Sun, 09 Apr 2023 11:44:36 -0400
X-MC-Unique: H6lRheY5OzeNqTwVXd6B5w-1
Received: by mail-ed1-f71.google.com with SMTP id c64-20020a509fc6000000b004a26cc7f6cbso1942205edf.4
        for <xdp-newbies@vger.kernel.org>; Sun, 09 Apr 2023 08:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681055075; x=1683647075;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:cc:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx4mFme70E/W6QCHcJyWjUDQ4qrSrUIZoAT0U87T3hs=;
        b=uS3Dj8VA89cZQB6X6vt9rVfurG4RRDiqy/l8uqzJrQidZNRbQmN9rtvuutuTuNN8CK
         aktCec5VzkOI+NU6SRvenSSPwQW1PHIau4LoUmFFdKEyGcKR2JVbNaa0rhJsthbijT5Y
         dqYPNmcU8WtjHbAXjdLoCfNZwpunqpKO5ZhaMcNrPtHMC8ZakbAn5O/hhs0+LTToIdwK
         h/1pD9gnm631jBIzd9lPzprqLLNW8IPP771DWf2G3UOeoBR7INcaWY0gHDmnFFLnxLbN
         iCNfzji5sytX4njEYRwe0mpMWzinT3DJtyBhg73Z/ca7a/YdX45RVvi/gFLD7K42IYHL
         XUPA==
X-Gm-Message-State: AAQBX9dSHpVZrPGG17GEKqj6drb5JliAwygyMcuroG/a+xRolrHw7LTw
        sSqRxM5OSQN0X95kZeL0cfaado2YVDG0bdKqhgLY9QTo9ZbOfSofMfgW3Q5NQGZEsUToPlAIKdZ
        dFYLLzzqKhrbE4MeUv81DZ8La9K0If8s=
X-Received: by 2002:a17:906:8684:b0:947:80a4:5cce with SMTP id g4-20020a170906868400b0094780a45ccemr5062368ejx.65.1681055074883;
        Sun, 09 Apr 2023 08:44:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3ircOKiG5lFq07n13XA2QRPoGIyszdedv5/keDeWFQd+YR2pT4TQqi1ItKy13mi30UeHX/Q==
X-Received: by 2002:a17:906:8684:b0:947:80a4:5cce with SMTP id g4-20020a170906868400b0094780a45ccemr5062357ejx.65.1681055074541;
        Sun, 09 Apr 2023 08:44:34 -0700 (PDT)
Received: from [192.168.41.200] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906014700b00932fa67b48fsm4214266ejh.183.2023.04.09.08.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 08:44:33 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <b8fa06c4-1074-7b48-6868-4be6fecb4791@redhat.com>
Date:   Sun, 9 Apr 2023 17:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc:     brouer@redhat.com,
        Srinivas Narayana Ganapathy <sn624@cs.rutgers.edu>,
        Tariq Toukan <tariqt@nvidia.com>
Subject: Re: Question about xdp: how to figure out the throughput is limited
 by pcie
To:     Qiongwen Xu <qx51@cs.rutgers.edu>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

(answered inline below)

On 07/04/2023 03.46, Qiongwen Xu wrote:
> Dear XDP experts,
> 
> I am a PhD student at Rutgers. Recently, I have been reading the XDP
> paper "The eXpress Data Path: Fast Programmable Packet Processing
> in the Operating System Kernel". In section 4.1 and 4.3, you mention 
> the throughputs of xdp programs (packet drop and packet forwarding) 
> are limited by the PCIe (e.g., "Both scale their performance linearly
> until they approach the global performance limit of the PCI bus").

Most of the article[1][2] authors are likely this mailing list,
including me. (Sad to see we called it "PCI *bus*" and not just PCIe).

> I am curious about how you figured out it was the PCIe limitation. 

It is worth noting that the PCIe limitation shown in article is related
to number of PCIe transactions with small packets (Ethernet minimum
frame size 64 Bytes). (Thus meaning NOT bandwidth related).

The observations that lead to the PCIe limitation conclusion:
A single CPU doing XDP_DROP (25Mpps) was using 100% CPU time (runtime
attributed to ksoftirqd).  When we scaled up XDP_DROP to run on more
CPUs we saw something strange[3].  It scaled linear to 3 CPUs, and at 4
CPUs each CPU started to process less packets per sec (pps) and total
(86Mpps) stayed the same.  Even more strange the CPUs wasn't using 100%
CPU any-longer, CPUs had "time" to idle.  Looking at ethtool stats, we
noticed the counter "rx_discards_phy", which (we were told) happens when
PCIe causes backpressure.

What confirmed the PCIe (transactions) bottleneck was[4] when we
discovered enabling the mlx5 priv-flags rx_cqe_compress=on (and
rx_striding_rq=off) changed the total limit (86Mpps to 108Mpps),
as rx_cqe_compress reduce the transactions on PCIe by compressing the RX
descriptors.  Thus, confirming this was related to PCIe.


 > Is there any tool or method to check this?

I *highly* recommend that you read this article [pci1][pci2]:
  - Title: "Understanding PCIe performance for end host networking"

I wish we had read and referenced this article in ours (but both
happened in 2018).  They give a theoretical model for PCIe, both
bandwidth and latency.  That could be used to explain our PCIe
observations. They also released their [pcie-bench] tool.

I wish more (kernel) performance people understood, that PCIe is a
protocol (3-layers: physical, data link layer (DLL) and Transaction
Layer Packets (TLP)), that is used between the device and host
OS-driver.  In networking usually ignores this PCIe protocol step, with
associated protocol overheads, which actually causes a network packet to
be split into smaller PCIe TLP "packets" with their own PCIe level
headers. Besides the packet data itself, the PCIe protocol is used for
reading TX desc (seen from device) and writing RX desc (seen from
device), and read/update queue pointers.

It might surprise people that article [pci1] shows, that PCIe (128B
payload) introduces a latency around 600ns (nanosec), which is
significantly larger than the inter-packet gap needed for wirespeed
networking.  Thus, latency hiding happens "behind our back", via the
device and DMA engine have to keep many transactions in-flight to
utilize the NIC (yet another hidden queue in the system).

--Jesper

Links:

  [1] https://dl.acm.org/doi/10.1145/3281411.3281443
  [2] https://github.com/xdp-project/xdp-paper
  [3] 
https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench02_xdp_drop.org#possible-pcie-limit
  [4] 
https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench01_baseline.org#initial-data-from-jespers-runs

Read this article:
  [pci0] https://dl.acm.org/doi/10.1145/3230543.3230560
  [pci1] 
https://www.cl.cam.ac.uk/research/srg/netos/projects/pcie-bench/neugebauer2018understanding.pdf
  [pci2] https://www.cl.cam.ac.uk/research/srg/netos/projects/pcie-bench/
  [pcie-bench] https://github.com/pcie-bench/pcie-model

