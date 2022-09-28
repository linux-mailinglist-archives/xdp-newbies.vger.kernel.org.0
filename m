Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 214545EE3E5
	for <lists+xdp-newbies@lfdr.de>; Wed, 28 Sep 2022 20:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbiI1SHu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 28 Sep 2022 14:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbiI1SHt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 28 Sep 2022 14:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5693A102502
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664388466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FJaPMfpCrGDpiycGoz0pomfOi4m0+whE14wtCZi31dQ=;
        b=HV0M5+T68PCP9NrPUuotuToLEkFdCkDjgrtc7yehaYTooDeQTK+ExVzkfhPny9Fx/D8zFJ
        7vbzx63AnD78y8kWwOG6alQqXjeLjqqPq7F61V32lDvW/6dpgBseyd9YRknbq5+TA5DN84
        Ae/VAHheu5UUEDxZlMGW/MUQ23JlzuQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-pjoa4q5kPjWqI1SP7ywapA-1; Wed, 28 Sep 2022 14:07:45 -0400
X-MC-Unique: pjoa4q5kPjWqI1SP7ywapA-1
Received: by mail-ed1-f70.google.com with SMTP id h13-20020a056402280d00b004581108ba90so114375ede.2
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Sep 2022 11:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=FJaPMfpCrGDpiycGoz0pomfOi4m0+whE14wtCZi31dQ=;
        b=4yN3Yc1711rgQHsLcXsFNjKNV2EDlXC4iPZY+0wDhpUDvwAVZkhVsv3wzGxHVxJA9T
         z5RIjiuTZ6ezIm7wF3MSVUZ3dYOkwL7Zo+U3IDYFOJx8wQQOot33FOhasIUV3ytw8zPU
         KoBj0WmJxTbi0nEwALBCqu836Gl2vncW0Iif7wb8O5NqBiZRgwUduECj8Z5/YyWBHZbc
         K8ns3Zq26NvlbUAgEklZK0cPsMjROi1UJ80G5oTYjriCB6NFbH3Bj6TK3a5xhi0ydkIf
         mX13SavxsG7YBRGNAeWC0iQnSzOJTwOTX6pPv/jo2eu2y+C6y0/8Ab9ZWWI57j6FuPPv
         q6Fg==
X-Gm-Message-State: ACrzQf0vGbgz07PyVYltnxFye/OrIDDB8YjYHanPmEv41c0M7d33BUZT
        ZOtAXVaLyLYb+AmO2uhaSvDVA5iQPlybbOSP39cvo/iOJTv+cWEhPbIYY4E1Dqlv/5xJDFJVZXo
        C6UQ73EunHvSX3zQxsggysU4=
X-Received: by 2002:a17:907:2d90:b0:787:9e9a:7426 with SMTP id gt16-20020a1709072d9000b007879e9a7426mr2253941ejc.568.1664388463829;
        Wed, 28 Sep 2022 11:07:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6N4tKfiqnNoeIWCR4jG8uoA5plEHTlZn7Zb7H6zvIAJo250dLcVW1Ic29E2Nc3Roh9LX+jhw==
X-Received: by 2002:a17:907:2d90:b0:787:9e9a:7426 with SMTP id gt16-20020a1709072d9000b007879e9a7426mr2253924ejc.568.1664388463564;
        Wed, 28 Sep 2022 11:07:43 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906504e00b00730df07629fsm2743934ejk.174.2022.09.28.11.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 11:07:42 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
Date:   Wed, 28 Sep 2022 20:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        David Ahern <dsahern@kernel.org>,
        Anton Protopopov <aspsk@isovalent.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jason Wang <jasowang@redhat.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Subject: Re: [xdp-cloud] Questions about Offloads and XDP-Hints regarding a
 Cloud-Provider Use-Case
Content-Language: en-US
To:     Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
        xdp-newbies@vger.kernel.org, cloud@xdp-project.net
References: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
In-Reply-To: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 28/09/2022 15.54, Marcus Wichelmann wrote:
> 
> I'm working for a cloud hosting provider and we're working on a new 
> XDP-based networking stack for our VM-Hosts that uses XDP to accelerate 
> the connectivity of our qemu/KVM VMs to the outside.
> 

Welcome to the community! Sounds like an excellent use-case and
opportunity for speeding up the RX packets from physical NIC into the
VM.  Good to hear someone (again) having this use-case. I've personally
not been focused on this use-case lately, mostly because community
members that I was interacting with changed jobs, away from cloud
hosting companies. Good to have a user back in this area!


> For this, we use XDP_REDIRECT to forward packets between the physical 
> host NIC and the VM tap devices. The main issue we have now is, that our 
> VM guests have some virtio NIC offloads enabled: rx/tx checksumming, 
> TSO/GSO, GRO and Scatter-Gather.

Supporting RX-checksumming is part of the plans for XDP-hints, although
virtio_net is not part of my initial patchset.

XDP-redirect with GRO and Scatter-Gather frames are part of the
multi-buff effort (Cc Lorenzo), but currently XDP_REDIRECT with
multi-buff is disabled (except for cpumap), because the lack of
XDP-feature bits, meaning we cannot determine (in kernel) if receiving
net_device supports multi-buff (Cc Kumar).

> Currently, these offloads (especially TSO/GSO) are incompatible with 
> XDP_REDIRECT and result in packets being dropped. Because disabling 
> these offloads in all our customer VMs is not a good option, we're 
> searching for ways to support these offloads with XDP.
> 

To David Ahern, didn't the kernel recently loosen up on having to
disable these offloads for KVM virtio_net?

My (long term) goal is to improve the situation and allow more offloads
to get enabled for KVM/virtio_net. But my current focus is on veth.


> The XDP multi-buffer support needed for TSO/GSO seems to be mostly there 

A subtle detail is that both XDP-hints and XDP multi-buff are needed to
get GRO/GSO kernel infra working.  For the kernel to construct GRO-SKB
based packets on XDP-redirected incoming xdp_frame's, the kernel code
requires both RX-csum and RX-hash before coalescing GRO frames.

> already, but, to our understanding, the last missing part for full 
> TSO/GSO support is a way to tell the physical NIC to perform the TSO/GSO 
> offload.
> 

The TSO/GSO side is usually the TX side.  The VM should be able to send
out normal TSO/GSO (multi-buffer) packets.  Or are you saying this also
gets disabled when enabling XDP on the virtio_net RX side?


> I've seen  the latest LPC 2022 talk from Jesper Dangaard Brouer 
> regarding the planned XDP-Hints feature. But this was mainly about 
> Checksum and VLAN offloads. Is supporting TSO/GSO also one of the goals 
> you have in mind with these XDP-Hints proposals?
> 

As mentioned TSO/GSO is TX side. We (Cc Magnus) also want to extend
XDP-hints to TX-side, to allow asking the HW to perform different
offloads. Lets land RX-side first.

> Will the multi-buffer and hints patches be all what's needed to make 
> XDP_REDIRECT between a VM (without disabled offloads) and the host NIC 
> possible, or are there more things missing in XDP that will become an 
> issue in that use-case?
> 

As hinted above, we also need net_device XDP-features to enable
redirecting XDP multi-buff frames.


> The "XDP Cloud-Provider" project page describes a very similar use-case 
> to what we plan to do. What's the goal of this project?
> 

Yes, this sounds VERY similar to your use-case.

I think you are referring to this:
  [1] https://xdp-project.net/areas/xdp-cloud-provider.html
  [2] https://github.com/xdp-project/xdp-cloud

We had two Cloud Hosting companies interested in this use-case and
started a "sub" xdp-project, with the intent of working together on
code[2] that implements concrete BPF tools, that functions as building
blocks that the individual companies can integrate into their systems,
separating out customer provisioning to the companies.
(p.s. this approach have worked well for xdp-cpumap-tc[3] scaling tool)

Unfortunately the Cloud-Provider project "died", because the engineers
from the Cloud Hosting companies got better job offers.  And other
engineers at these companies were apparently not motivated to takeover.


[3] https://github.com/xdp-project/xdp-cpumap-tc

> We're very interested in the work on XDP-Hints and in the performance 
> benefits that the offloading support could bring to XDP and I would be 
> thankful if you could help us with some of our questions.

Thanks for showing interest in XDP-hints, this is very motivating for me
personally to continue this work upstream.

--Jesper

