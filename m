Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42423C7236
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Jul 2021 16:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236721AbhGMOdy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Jul 2021 10:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44635 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236636AbhGMOdy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Jul 2021 10:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626186663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e6XEmfmWJnpPu3edq2MPFru0L8O3TX325sQrrNDJz8w=;
        b=Q984eN2wh7BsyCLi9AKKO+/jj2CtaOkpywqfOJD1ZwBs+uHt6ax4Gzk9ATlGgwktyyVNW4
        qhxEWhHIpjUN/1Hd/37qZMMS4F+TFWp9hQXZ58mcp+xE7wTBHuRX6np54y/PDY0Mzipdu5
        Ku1dPUCUsW1NFZPEvdj4RQQbp3NOsqg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-F-6BwbDjP9-tfm2Hrgp1UA-1; Tue, 13 Jul 2021 10:31:02 -0400
X-MC-Unique: F-6BwbDjP9-tfm2Hrgp1UA-1
Received: by mail-wr1-f70.google.com with SMTP id j6-20020adff5460000b029013c7749ad05so6505004wrp.8
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Jul 2021 07:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:cc:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e6XEmfmWJnpPu3edq2MPFru0L8O3TX325sQrrNDJz8w=;
        b=XzvexZPex0f1gKCgmB8D4qyIrhz2I36hoGkaPybrO5Zuu2atCXoxwYFuGBm81yYRtY
         QYQiwO9KOo8+hm3LiRxRGi/8nvLvKxdBkPo+0k/qHJisGpsRUV7iO6drbl0V9//D63rf
         GzRHntaBHIDws5AyMu93J2kY6qYRyC8L4oJ2UimTcRmynlpuUinwqTnld7Xq6u2I1jO/
         PlvyzVK0A9iUdjiCxSA0cHn7WekYWD3sZ87FWoCXUNadbNc9B+BT2o9IGYaqYmyYvdKK
         QGe8+fV5PgCMKsVGnf/LRhiv9W1Wg7aqzVpwvrOxZjadsLcB31o2trIKKsSiYfAVpZC+
         8DIg==
X-Gm-Message-State: AOAM533FAjDbmU6s41NHoz877X0AsSizShRVkQ7dHO0SijcrNW/Bgiat
        sbOq1eUZV92QCxHzQSB4k8Tf2LRF2BHQnI+YLmvFTej/0os8/6ZcBgJN/Wn10bQHIcF8yRwL/W1
        dOwK6VWCsk8NPgoERHAlJSHQ=
X-Received: by 2002:a05:600c:17c3:: with SMTP id y3mr5333134wmo.40.1626186660819;
        Tue, 13 Jul 2021 07:31:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybR/GfycVN0f6ae8cg3i7e3AsVnDi1Wj339Kww10CCT11MB3d6NLTC0vlYoUOC6QHlGgBgfw==
X-Received: by 2002:a05:600c:17c3:: with SMTP id y3mr5333101wmo.40.1626186660567;
        Tue, 13 Jul 2021 07:31:00 -0700 (PDT)
Received: from [192.168.42.238] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id d67sm634439wmd.9.2021.07.13.07.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jul 2021 07:31:00 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Yoel Caspersen <yoel@kviknet.dk>,
        Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        xdp-newbies@vger.kernel.org,
        "Ethy H. Brito" <ethy.brito@inexo.com.br>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: XDP-CPUMAP-TC Inquiry
To:     =?UTF-8?Q?Robert_Chac=c3=b3n?= 
        <robert.chacon@jackrabbitwireless.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>
References: <CAOZyJosVT=J0g7R+vPzCwotjs=zz4oYpEgErtVsGVrZ4SyXggg@mail.gmail.com>
 <20210608135337.167a2a59@carbon>
 <CAOZyJouV8Y1F0rMne9LyiypoZEXDmw0OjKWSE7Z745wXgx-iRw@mail.gmail.com>
 <47a8b3d5-8ca6-0db2-5089-5c6f7e534718@redhat.com>
Message-ID: <0bee06de-7a7f-b418-5807-c7f105ec5133@redhat.com>
Date:   Tue, 13 Jul 2021 16:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <47a8b3d5-8ca6-0db2-5089-5c6f7e534718@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Replying (without attachment and plain txt) to see if this is accepted 
by the xdp-newbies list.

As I've not seen the orig or my reply on: 
https://lore.kernel.org/xdp-newbies/

On 05/07/2021 17.48, Jesper Dangaard Brouer wrote:
> Hi Robert,
> 
> 
> Thanks for Cc'ing the xdp-newbies list, but I suspect that your message 
> was dropped due to HTML formatting.
> 
> Great to hear that Kumar's changes to make cpumap work for generic-XDP, 
> had such a positive effect.
> 
> You clearly solved your TC qdisc lock-contention.
> 
> 
> I can see you run XDP-RX and CPUMAP kthreads on the same CPU. This will 
> cause more context-switches. I usually configure the system with a set 
> of RX-CPUs and a larger number of CPUMAP kthread CPUs.  I'm working on 
> improving some scripts to easier do this IRQ setup.
> 
> I've found that the default cpumap qsize were too small. Under low 
> utilization with network spikes, an unfortunate situation can happen, 
> described in commit[1], when system is too slow to wakeup. You should 
> update to latest xdp-cpumap-tc git tree or change qsize in code.
> 
> [1] https://github.com/xdp-project/xdp-cpumap-tc/pull/2/commits/582edcb7026f7
> 
> You also want commit[2]:
> 
>   [2] https://github.com/xdp-project/xdp-cpumap-tc/commit/1407c8235e9cf0f6
> 
> -Jesper
> 
> On 05/07/2021 16.00, Robert Chacón wrote:
>> Hey Jesper,
>>
>> My apologies for my misunderstandings around the nature of XDP and 
>> eBPF. I did not have any prior experience with C or XDP, but it's 
>> starting to make much more sense.
>> Thank you very much for taking the time to explain this, it helped a lot.
>> I was able to get xdp-cpumap-tc and MQ+HTB integrated into LibreQoS 
>> v0.9-beta <https://github.com/rchac/LibreQoS>, and the results have 
>> been very encouraging.
>>
>> Below is a smokeping graph showing one of the remote sites on our 
>> network - before and after integrating xdp-cpumap-tc, MQ+HTB, and 
>> generic xdp.
>> After deployment at 3AM, latency spikes and variance decreased 
>> substantially. Users report faster page rendering and faster downloads.
>> CPU use went from 100% on just one core (queue locking contention) to 
>> being evenly distributed among all cores.
>> These improvements are despite the added overhead of traffic being 
>> passed through two linux bridges (Proxmox, non-passthrough NIC).
>> (see attached graph)
>>
>> Xdp-cpumap-tc works incredibly well. Thank you for creating it! No 
>> matter how many IPv4 rules I threw at it, the xdp-cpumap-tc hash map 
>> showed incredible efficiency and throughput was unimpacted.
>> Our network is humming along better than ever. I am sure many other 
>> ISPs will be able to benefit from xdp-cpumap-tc.
>> Can't wait to test it out on a dedicated server.
>>
>> From what I understand, xdp-cpumap-tc only supports parsing IPv4 
>> headers for now, but hopefully IPv6 support can be added eventually.
>> For now I am just grateful for the performance gains, IPv6 or not. 
>> Thanks!
>>
>> Also special thanks to Kumar, your generic xdp cpumap-redirect code 
>> worked perfectly using a daily build of Ubuntu 21.10, and allowed us 
>> to deploy this in a VM at our main site (where we could not deploy a 
>> new server with NIC passthrough quite yet).
>>
>> Thanks!
>> Robert
>>
>> On Tue, Jun 8, 2021 at 5:53 AM Jesper Dangaard Brouer 
>> <brouer@redhat.com <mailto:brouer@redhat.com>> wrote:
>>
>>     On Tue, 8 Jun 2021 03:42:59 -0600
>>     Robert Chacon <robert.chacon@jackrabbitwireless.com
>>     <mailto:robert.chacon@jackrabbitwireless.com>> wrote:
>>
>>     > Hello Jesper,
>>
>>     I would prefer if we can have this thread in public on mailing list:
>>     xdp-newbies@vger.kernel.org <mailto:xdp-newbies@vger.kernel.org>
>>
>>     > My name is Robert. Firstly - I want to thank you for the huge amount of
>>     > work you've contributed to the linux kernel and tc projects. Your work has
>>     > been very helpful and informative.
>>     >
>>     > I wrote an open-source traffic shaper for small ISPs called LibreQoS
>>     > <https://github.com/rchac/LibreQoS
>>     <https://github.com/rchac/LibreQoS>>. It essentially creates one
>>     big HTB and
>>     > hundreds of sub HTBs for each unique customer - using fq_codel to rate
>>     > limit their bandwidth. Ideally it will handle anywhere up to 2000
>>     > customers. My main objective in developing the software is to help small
>>     > ISPs around the world to control bufferbloat and compete against larger
>>     > ISPs.
>>
>>     Cc, Yoel he is a smaller ISP.
>>     And Toke and I are helping him out or smaller projects.
>>
>>     And we are trying to find other small ISPs, to boostrap a project under
>>     xdp-project called BNG-router.  Broadband Network Gateway (BNG) that
>>     contains tools for creating a Linux based router solutions for 
>>     smaller DIY ISPs.
>>
>>     You project seems to have similar goals.
>>     https://github.com/rchac/LibreQoS <https://github.com/rchac/LibreQoS>
>>
>>     > I'm working on integrating your project XDP-CPUMAP-TC so that LibreQoS can
>>     > work around lock congestion, which starts to compromise performance past
>>     > 4Gbps or so.
>>
>>     This one: [1] https://github.com/xdp-project/xdp-cpumap-tc
>>     <https://github.com/xdp-project/xdp-cpumap-tc>
>>
>>     Yes, the problem is the TC-root qdisc lock, that is why your system us
>>     performance limited.
>>
>>     > In testing XDP-CPUMAP-TC, I am able to create the HTBs for each CPU, as
>>     > well as sub-HTBs, but I am stuck on how to redirect IP traffic to the
>>     > desired CPU (in an efficient way).
>>
>>     So, MQ+HTB.
>>
>>     > I noticed "tc_mq_htb_setup_example.sh" mentions the following:
>>     >
>>     > "For solving the TX-queue locking congestion, the traffic needs to be
>>     > redirected to the appropriate CPUs. This can either be done with RSS
>>     > (Receive Side Scaling) and RPS (Receive Packet Steering), or with XDP
>>     > cpumap redirect."
>>
>>     The cpumap redirect code in [1] does the redirect to another CPU.
>>
>>     Do your hardware have native XDP?
>>
>>     The problem is that cpumap-redirect only works for native-XDP, where
>>     the NIC driver have XDP support.  For generic-XDP, it doesn't work.  I
>>     think Kumar (Cc) is working on code.
>>
>>     As mentioned, if you can tune your hardware RSS hashing, you might
>>     also be able to find a solution.
>>
>>
>>     > In the case of LibreQoS, and most ISP networks - any given customer will
>>     > have 1 IPv4 address, and 1 IPv6 /56 prefix, with the IPv4/IPv6 pairs having
>>     > no predictable similarities (suggesting we cannot use efficient hash
>>     > tables). I assume we will need thousands of unique iptables or xdp redirect
>>     > rules to make this work. From what I understand, if iptables were used in
>>     > such a way, throughput may be compromised considerably due to the
>>     > inefficiency of so many rules.
>>
>>     Yes, iptables with too many rules will also slow system down.
>>     Nftables have a "set" infrastructure for this kind of matching.
>>     BPF have hash-maps (and full programmability).
>>
>>     > I'm hoping to use a more efficient XDP based
>>     > IP filter to send traffic matching an IPv4/IPv6 address pair to a
>>     > particular CPU (via XDP redirect?).
>>     >
>>     > Do you have any recommendations for an XDP tool that would allow
>>     > me to direct traffic matching a source or destination IPv4/IPv6
>>     > address toward a particular CPU?
>>
>>     XDP/BPF not a "tool" like iptables.  You have to code (in restricted-C)
>>     your own filter to match the packets you like, and do lookup matching
>>     via BPF-maps.
>>
>>     Example:
>>     
>> https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/xdp_iphash_to_cpu_kern.c 
>>
>>     
>> <https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/xdp_iphash_to_cpu_kern.c> 
>>
>>
>>     You you have any experience coding BPF?
>>
>>
>>     > I am using kernel version 5.8 if it is relevant. Thanks!
>>
>>     The cpumap code was introduced from Linux kernel version 5.9:
>>     
>> https://developers.redhat.com/blog/2021/05/13/receive-side-scaling-rss-with-ebpf-and-cpumap# 
>>
>>     
>> <https://developers.redhat.com/blog/2021/05/13/receive-side-scaling-rss-with-ebpf-and-cpumap#> 
>>
>>
>>     --     Best regards,
>>       Jesper Dangaard Brouer
>>       MSc.CS, Principal Kernel Engineer at Red Hat
>>       LinkedIn: http://www.linkedin.com/in/brouer
>>     <http://www.linkedin.com/in/brouer>

