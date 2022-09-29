Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86185EF63A
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Sep 2022 15:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbiI2NRW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 29 Sep 2022 09:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbiI2NRV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Sep 2022 09:17:21 -0400
Received: from dediextern.your-server.de (dediextern.your-server.de [85.10.215.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4132128A2F
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Sep 2022 06:17:19 -0700 (PDT)
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by dediextern.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <marcus.wichelmann@hetzner-cloud.de>)
        id 1odtP1-00051G-5M; Thu, 29 Sep 2022 15:16:35 +0200
Received: from [2a01:c23:8c9b:ff10:2d85:46c3:af80:a203]
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <marcus.wichelmann@hetzner-cloud.de>)
        id 1odtP1-000AnK-05; Thu, 29 Sep 2022 15:16:35 +0200
Message-ID: <0b48f291-e957-9ef0-5870-4c0e6df1a8eb@hetzner-cloud.de>
Date:   Thu, 29 Sep 2022 15:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        xdp-newbies@vger.kernel.org, cloud@xdp-project.net
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        David Ahern <dsahern@kernel.org>,
        Anton Protopopov <aspsk@isovalent.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Jason Wang <jasowang@redhat.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
References: <30dd392b-ff2f-1e25-175a-6666dde200ed@hetzner-cloud.de>
 <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
From:   Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>
Subject: Re: [xdp-cloud] Re: Questions about Offloads and XDP-Hints regarding
 a Cloud-Provider Use-Case
In-Reply-To: <b207f828-8ba2-7bdd-01e6-3354172531b5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: marcus.wichelmann@hetzner-cloud.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26673/Thu Sep 29 09:55:40 2022)
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Am 28.09.22 um 20:07 schrieb Jesper Dangaard Brouer:
> 
> On 28/09/2022 15.54, Marcus Wichelmann wrote:
>>
>> I'm working for a cloud hosting provider and we're working on a new 
>> XDP-based networking stack for our VM-Hosts that uses XDP to 
>> accelerate the connectivity of our qemu/KVM VMs to the outside.
>>
> 
> Welcome to the community!

Thank you!

> Sounds like an excellent use-case and
> opportunity for speeding up the RX packets from physical NIC into the
> VM.  Good to hear someone (again) having this use-case. I've personally
> not been focused on this use-case lately, mostly because community
> members that I was interacting with changed jobs, away from cloud
> hosting companies. Good to have a user back in this area!

Good to hear! Also, we'll probably not be the last ones coming up with 
this use-case. ;)


>> For this, we use XDP_REDIRECT to forward packets between the physical 
>> host NIC and the VM tap devices. The main issue we have now is, that 
>> our VM guests have some virtio NIC offloads enabled: rx/tx 
>> checksumming, TSO/GSO, GRO and Scatter-Gather.
> 
> Supporting RX-checksumming is part of the plans for XDP-hints, although
> virtio_net is not part of my initial patchset.

Great!

> XDP-redirect with GRO and Scatter-Gather frames are part of the
> multi-buff effort (Cc Lorenzo), but currently XDP_REDIRECT with
> multi-buff is disabled (except for cpumap), because the lack of
> XDP-feature bits, meaning we cannot determine (in kernel) if receiving
> net_device supports multi-buff (Cc Kumar).

Can this also be solved with XDP-Hints or is this an unrelated issue?

>> The XDP multi-buffer support needed for TSO/GSO seems to be mostly there 
> 
> A subtle detail is that both XDP-hints and XDP multi-buff are needed to
> get GRO/GSO kernel infra working.  For the kernel to construct GRO-SKB
> based packets on XDP-redirected incoming xdp_frame's, the kernel code
> requires both RX-csum and RX-hash before coalescing GRO frames.
> 
>> already, but, to our understanding, the last missing part for full 
>> TSO/GSO support is a way to tell the physical NIC to perform the 
>> TSO/GSO offload.
>>
> 
> The TSO/GSO side is usually the TX side.  The VM should be able to send
> out normal TSO/GSO (multi-buffer) packets.

Currently the VM sends out multi-buffer packets, but after redirecting 
them, they are probably not getting segmented on the way out of the 
physical NIC. Or, as you wrote earlier, the XDP multi-buffer support 
isn't even used there and the packet just gets truncated on the way into 
XDP.
I've not exactly traced that down yet, but you probably know better than 
me what's happening there.

Because of that, the TX side offloads are more critical to us because we 
cannot easily disable them in the VMs. The RX side is less of an issue, 
because we have control over the physical NIC configuration and could 
temporarily disable all offloads there, until XDP supports them (which 
would of course be better). So RX offloads are very nice to have, but 
missing TX offloads are a show-stopper for this use-case, if we don't 
find a way to disable the offloads on all customer VMs.

 > Or are you saying this also gets disabled when enabling XDP on the
 > virtio_net RX side?

I'm not sure what you mean with that. What gets disabled?

>> I've seen  the latest LPC 2022 talk from Jesper Dangaard Brouer 
>> regarding the planned XDP-Hints feature. But this was mainly about 
>> Checksum and VLAN offloads. Is supporting TSO/GSO also one of the 
>> goals you have in mind with these XDP-Hints proposals?
>>
> 
> As mentioned TSO/GSO is TX side. We (Cc Magnus) also want to extend
> XDP-hints to TX-side, to allow asking the HW to perform different
> offloads. Lets land RX-side first.

Makes sense, thanks for clarifying your roadmap!

>> The "XDP Cloud-Provider" project page describes a very similar 
>> use-case to what we plan to do. What's the goal of this project?
>>
> 
> Yes, this sounds VERY similar to your use-case.
> 
> I think you are referring to this:
>   [1] https://xdp-project.net/areas/xdp-cloud-provider.html
>   [2] https://github.com/xdp-project/xdp-cloud

The GitHub Link is a 404. Maybe this repository is private-only?

> We had two Cloud Hosting companies interested in this use-case and
> started a "sub" xdp-project, with the intent of working together on
> code[2] that implements concrete BPF tools, that functions as building
> blocks that the individual companies can integrate into their systems,
> separating out customer provisioning to the companies.
> (p.s. this approach have worked well for xdp-cpumap-tc[3] scaling tool)

I wonder what these common building blocks could be. I think this would 
be mostly just a program that calls XDP-Redirect and also some XDP-Hints 
handling in the future. This could also be demonstrated as an example 
program.
While looking at our current XDP-Stack design draft, I think everything 
beyond that is highly specific to how the network infrastructure of the 
cloud hosting environment is designed and will probably be hard to apply 
to the requirements of other providers.

But of course, having a simple reference implementation of a XDP 
datapath that demonstrates how XDP can be used to connect VMs to the 
outside, would still be very useful. For documentation purposes, maybe 
not su much as a framework.

>> We're very interested in the work on XDP-Hints and in the performance 
>> benefits that the offloading support could bring to XDP and I would be 
>> thankful if you could help us with some of our questions.
> 
> Thanks for showing interest in XDP-hints, this is very motivating for me
> personally to continue this work upstream.

Even though I'm not familar enough with the kernel networking code to 
comment on the related proposals, please let me know when there is 
something else we can do to help getting things upstreamed.

Marcus
