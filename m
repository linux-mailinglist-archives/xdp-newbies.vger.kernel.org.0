Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072D25F2F2A
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Oct 2022 12:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJCK4k (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Oct 2022 06:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiJCK4j (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 Oct 2022 06:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390882FFCB
        for <xdp-newbies@vger.kernel.org>; Mon,  3 Oct 2022 03:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664794597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OMVkFT4x8jWNDeFLa8kUXRspdKdufP7yINpWL81y0Xs=;
        b=Bkwcgb34y3k+wP6z3fstBcbsG3GBWSPNCWEXxNiwffCcXe8/I8iS7YctlZsTcwrQLfK3vx
        AzrR31ERMtSYNd5cNqDyAquihHKste2LlB46LOtGnP4BkM/52Ihd0UXKZWT2UpO1cSseG4
        PfNE3de7PF0Hofuo4R1TC5MB/K1+bKc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-Dy-zHy8WPjmGRF-rljZQ2Q-1; Mon, 03 Oct 2022 06:56:35 -0400
X-MC-Unique: Dy-zHy8WPjmGRF-rljZQ2Q-1
Received: by mail-ed1-f69.google.com with SMTP id v11-20020a056402348b00b004516e0b7eedso8535949edc.8
        for <xdp-newbies@vger.kernel.org>; Mon, 03 Oct 2022 03:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:cc:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OMVkFT4x8jWNDeFLa8kUXRspdKdufP7yINpWL81y0Xs=;
        b=VXzHVBxBtQDqL2U96gDkVXgEfUFM/6vFTU2VsczmauQsKvtOqtL3+e5M8tssabrzuU
         xOL6h+oYDqda5CTP0Q09gYbIAVpHBkrpHbXRyJ8v+2EhpGr/0qD0fkniCxiOPoDFcUZm
         QL1Y/q8LeBHOUE3p4kBmXCXcyr9vJ2nifWlnB8eQ0KG58yzWGO719+skOv+jmQrku6Nc
         z3XI0vHuh3oZ0GsKGtkz57od1OZf2zJFKpoBEWZWiTq3TSrRl3T5Wmk462bTFCxXMMFD
         zAFPLQtyOsHDpx4iBuO4GJ1IBuTuMLwbpFpvQtrVlHpD9tuV1bcJTxWlfy7+IVOe4CKZ
         QXzg==
X-Gm-Message-State: ACrzQf2qJwv0sqv02TpEIRoJs6469jVz711PgUvB177S5ryLcDeApM5p
        gXg6xVbvBn3DoZNbM8oRc9mq048xaHfXz4nVOxv8joUodkXZAFcqgFyaaK7Eh89UbeEsWedd3O8
        njjIeQfXAn8anP7AjNZAEJNQ=
X-Received: by 2002:a17:906:8a74:b0:78b:9df5:f5c6 with SMTP id hy20-20020a1709068a7400b0078b9df5f5c6mr2907242ejc.63.1664794594732;
        Mon, 03 Oct 2022 03:56:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5F4xmqwxkSTaD6KvT5xd+xnjZWGwWn6/0UN9o2toH2uUSLY/4v+8cw6GHz8C77693EgZAzHQ==
X-Received: by 2002:a17:906:8a74:b0:78b:9df5:f5c6 with SMTP id hy20-20020a1709068a7400b0078b9df5f5c6mr2907223ejc.63.1664794594452;
        Mon, 03 Oct 2022 03:56:34 -0700 (PDT)
Received: from [192.168.41.81] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090632cb00b007030c97ae62sm5231839ejk.191.2022.10.03.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 03:56:33 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <df0da01e-904e-5272-8265-dc3857d92b63@redhat.com>
Date:   Mon, 3 Oct 2022 12:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        David Ahern <dsahern@kernel.org>,
        Anton Protopopov <aspsk@isovalent.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jason Wang <jasowang@redhat.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Subject: Re: [xdp-cloud] Re: Questions about Offloads and XDP-Hints regarding
 a Cloud-Provider Use-Case
To:     Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        xdp-newbies@vger.kernel.org, cloud@xdp-project.net
References: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
 <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
 <0b48f291-e957-9ef0-5870-4c0e6df1a8eb@hetzner-cloud.de>
Content-Language: en-US
In-Reply-To: <0b48f291-e957-9ef0-5870-4c0e6df1a8eb@hetzner-cloud.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


(Answered inline, below)

On 29/09/2022 15.16, Marcus Wichelmann wrote:
> Am 28.09.22 um 20:07 schrieb Jesper Dangaard Brouer:
>>
>> On 28/09/2022 15.54, Marcus Wichelmann wrote:
>>>
>>> I'm working for a cloud hosting provider and we're working on a new 
>>> XDP-based networking stack for our VM-Hosts that uses XDP to 
>>> accelerate the connectivity of our qemu/KVM VMs to the outside.
>>>
>>
>> Welcome to the community!
> 
> Thank you!
> 
>> Sounds like an excellent use-case and
>> opportunity for speeding up the RX packets from physical NIC into the
>> VM.  Good to hear someone (again) having this use-case. I've personally
>> not been focused on this use-case lately, mostly because community
>> members that I was interacting with changed jobs, away from cloud
>> hosting companies. Good to have a user back in this area!
> 
> Good to hear! Also, we'll probably not be the last ones coming up with 
> this use-case. ;)
> 

Yes, and remember to look at the effort done by people before...

I urge you to read David Ahern's slides:
 
https://legacy.netdevconf.info/0x14/pub/slides/24/netdev-0x14-XDP-and-the-cloud.pdf

It is a details step-by-step explanation of your use-case, along with
the pitfalls and gotchas.  If you hit an issue, do remember to bring it
to the attention of the community (e.g. xdp-newbies), then lurking
kernel engineers likely will get motivated to fix these issues upstream.
(Like slides explain improvements for redirects in kernel v5.4 + v5.6 + 
v5.8)

>>> For this, we use XDP_REDIRECT to forward packets between the physical 
>>> host NIC and the VM tap devices. The main issue we have now is, that 
>>> our VM guests have some virtio NIC offloads enabled: rx/tx 
>>> checksumming, TSO/GSO, GRO and Scatter-Gather.
>>
>> Supporting RX-checksumming is part of the plans for XDP-hints, although
>> virtio_net is not part of my initial patchset.
> 
> Great!

It should be trivial to add to virtio_net.

>> XDP-redirect with GRO and Scatter-Gather frames are part of the
>> multi-buff effort (Cc Lorenzo), but currently XDP_REDIRECT with
>> multi-buff is disabled (except for cpumap), because the lack of
>> XDP-feature bits, meaning we cannot determine (in kernel) if receiving
>> net_device supports multi-buff (Cc Kumar).
> 
> Can this also be solved with XDP-Hints or is this an unrelated issue?
> 

This is unrelated to XDP-hints.

>>> The XDP multi-buffer support needed for TSO/GSO seems to be mostly there 
>>
>> A subtle detail is that both XDP-hints and XDP multi-buff are needed to
>> get GRO/GSO kernel infra working.  For the kernel to construct GRO-SKB
>> based packets on XDP-redirected incoming xdp_frame's, the kernel code
>> requires both RX-csum and RX-hash before coalescing GRO frames.
>>
>>> already, but, to our understanding, the last missing part for full 
>>> TSO/GSO support is a way to tell the physical NIC to perform the 
>>> TSO/GSO offload.
>>>
>>
>> The TSO/GSO side is usually the TX side.  The VM should be able to send
>> out normal TSO/GSO (multi-buffer) packets.
> 
> Currently the VM sends out multi-buffer packets, but after redirecting 
> them, they are probably not getting segmented on the way out of the 
> physical NIC. Or, as you wrote earlier, the XDP multi-buffer support 
> isn't even used there and the packet just gets truncated on the way into 
> XDP.
> I've not exactly traced that down yet, but you probably know better than 
> me what's happening there.

XDP program on tap-device will likely cause drops of multi-buffer 
packets (send out by VM).

(1) First of all this XDP-tap program need to use the newer XDP program 
sub-type that known about multi-buffer packets.

(2) I'm not sure XDP-tap (virio_net) got multi-buffer support.
  Lorenzo or Jason do you know?

> Because of that, the TX side offloads are more critical to us because we 
> cannot easily disable them in the VMs. The RX side is less of an issue, 
> because we have control over the physical NIC configuration and could 
> temporarily disable all offloads there, until XDP supports them (which 
> would of course be better). So RX offloads are very nice to have, but 
> missing TX offloads are a show-stopper for this use-case, if we don't 
> find a way to disable the offloads on all customer VMs.
> 
>  > Or are you saying this also gets disabled when enabling XDP on the
>  > virtio_net RX side?
> 
> I'm not sure what you mean with that. What gets disabled?
> 

See Ahern's slide "Redirecting VM Egress Traffic".

The libvirt config (or Qemu/kvm params) currently need to disables many
of the offloads for XDP-on-tap to work.

IMHO this is something we kernel developers need to fix/improve.
(Cc Jason + Lorenzo)

>>> I've seen  the latest LPC 2022 talk from Jesper Dangaard Brouer 
>>> regarding the planned XDP-Hints feature. But this was mainly about 
>>> Checksum and VLAN offloads. Is supporting TSO/GSO also one of the 
>>> goals you have in mind with these XDP-Hints proposals?
>>>
>>
>> As mentioned TSO/GSO is TX side. We (Cc Magnus) also want to extend
>> XDP-hints to TX-side, to allow asking the HW to perform different
>> offloads. Lets land RX-side first.
> 
> Makes sense, thanks for clarifying your roadmap!
> 

For your own roadmap, waiting for "TX-XDP-hints" is likely problematic.

Thus, I would likely recommend NOT XDP-redirecting (TCP) traffic coming
from the VMs, which will hit the XDP-tap BPF program.  The XDP-tap
program could selectively XDP-redirect the UDP packets (if your
measurements show it to be faster).

Start with XDP redirecting from the physical NIC device into the VMs.
The XDP-hints coming from physical NIC device should be trivially to
convert into the format KVM needs.
Looking at kernel code we need to populate struct virtio_net_hdr (which
is inside struct tun_xdp_hdr).


>>> The "XDP Cloud-Provider" project page describes a very similar 
>>> use-case to what we plan to do. What's the goal of this project?
>>>
>>
>> Yes, this sounds VERY similar to your use-case.
>>
>> I think you are referring to this:
>>   [1] https://xdp-project.net/areas/xdp-cloud-provider.html
>>   [2] https://github.com/xdp-project/xdp-cloud
> 
> The GitHub Link is a 404. Maybe this repository is private-only?

Yes, sorry about that git repo is marked private, because the project 
didn't take off.


>> We had two Cloud Hosting companies interested in this use-case and
>> started a "sub" xdp-project, with the intent of working together on
>> code[2] that implements concrete BPF tools, that functions as building
>> blocks that the individual companies can integrate into their systems,
>> separating out customer provisioning to the companies.
>> (p.s. this approach have worked well for xdp-cpumap-tc[3] scaling tool)
> 
> I wonder what these common building blocks could be. I think this would 
> be mostly just a program that calls XDP-Redirect and also some XDP-Hints 
> handling in the future. This could also be demonstrated as an example 
> program.

Sure.
I recommend you start with coding an eBPF example program, and if you
want my help please base it on https://github.com/xdp-project/bpf-examples

> While looking at our current XDP-Stack design draft, I think everything 
> beyond that is highly specific to how the network infrastructure of the 
> cloud hosting environment is designed and will probably be hard to apply 
> to the requirements of other providers.
> 

Hmm... I kind of disagree, but that should not stop you.
I still encourage to decouple customer/VM provisioning in your design.

> But of course, having a simple reference implementation of a XDP 
> datapath that demonstrates how XDP can be used to connect VMs to the 
> outside, would still be very useful. For documentation purposes, maybe 
> not su much as a framework.

Great, lets start with PoC/MVP as sub-dir under:
  https://github.com/xdp-project/bpf-examples

If we can iterate over a public 'xdp-cloud' bpf-example, then the
community can easier reproduce the issues that devel process brings up.

--Jesper

