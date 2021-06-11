Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA613A4A5E
	for <lists+xdp-newbies@lfdr.de>; Fri, 11 Jun 2021 22:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFKUy6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 11 Jun 2021 16:54:58 -0400
Received: from mail-110-mta74.mxroute.com ([136.175.110.74]:46045 "EHLO
        mail-110-mta74.mxroute.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230040AbhFKUy6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 11 Jun 2021 16:54:58 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Jun 2021 16:54:58 EDT
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-110-mta74.mxroute.com (ZoneMTA) with ESMTPSA id 179fcd4b827000dea0.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 11 Jun 2021 20:47:49 +0000
X-Zone-Loop: ca7b5151e61f32fabddd041aa69f7e33ae0104a60a4e
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yoLRtIl70UuRQADFy9GXweLvDD5FnxkO5Bz0tT2brJE=; b=HMgfy9R61gYBcjYiF5kujD0Lax
        /8iK57NFVQ0U/UoRIIC2DmoE7olV+uiXXKVIQjrUg1GOt2dm4XBtzjH95q2sRJ7dTdCEMdgJW0ca2
        R5mVE9cSKhVophIgngPuVbXydB5HbbYFi2q0zVmTcZiV1x+kXxA1hVvClXYBpimO0y4g30EvD//Eo
        UbxwQSx9ImWrIMLsYZG0KfZoFGjRsl/Av2WEGyMZ47MqL08nxvh2Q38g20rMWCqhcrWdJ+bNPMGb3
        QDs/rCsA/AS+RdV9kH7+kX1O58TtPQO4ODzt/mKJpA0dLraPA6XbftDwElrFfuPJaq+4/nn41BxfI
        ex+rsh5w==;
Subject: Re: AF_XDP Sockets Not Receiving Packets In XDP DRV Mode
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
References: <705dc02f-9e53-4cea-f100-43145d6d8684@gflclan.com>
 <CAJ8uoz1GvzMTA6bDTpH2N3N1tyAUy8zsFYcz94FNw0M7L+_e_g@mail.gmail.com>
 <20210608120603.GA1550@ranger.igk.intel.com>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <924272ac-ad44-fd8c-1adc-c9c5776ba95b@gflclan.com>
Date:   Fri, 11 Jun 2021 15:47:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608120603.GA1550@ranger.igk.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 6/8/21 7:06 AM, Maciej Fijalkowski wrote:

> On Tue, Jun 08, 2021 at 01:26:06PM +0200, Magnus Karlsson wrote:
>> On Tue, Jun 8, 2021 at 12:29 AM Christian Deacon <gamemann@gflclan.com> wrote:
>>> Hey everyone,
>>>
>>>
>>> I believe I made a thread regarding this issue around a year ago or so,
>>> but I thought it was related to the `virtio_net` driver. This time,
>>> however, I am testing this on a dedicated server with a dedicated NIC
>>> (see information at bottom) and have the same issue.
>>>
>>>
>>> I am trying to create an AF_XDP program and in this program, I currently
>>> spin up n AF_XDP sockets where n represents the RX queue count. Each
>>> AF_XDP socket is bound to a specific RX queue. From what I've seen, most
>>> examples recommend binding the socket to one RX queue and using flow
>>> steering via `ethtool` to steer all packets destined for the AF_XDP
>>> socket to the RX queue the AF_XDP socket is bound to. The two problems I
>>> see here are:
>>>
>>>
>>> 1. To my understanding, this NIC only supports matching on layer 2/3/4
>>> headers and with my AF_XDP program, I want to redirect packets to the
>>> AF_XDP sockets depending on the first 4 - 5 bytes of the payload.
>> If your NIC does not support the packet steering you need, you can
>> always load your own XDP program to do the steering for you. This will
>> of course not be as fast as if you did it in HW, but any policy can be
>> implemented. See the example in samples/bpf/xdpsock_kern.c in the
>> Linux source code repo. But I now see that you have such an XDP
>> program written. So, your program does not work with this nor with HW
>> steering (spraying with RSS for example)?

I just wanted clarification on this if possible. Does this mean I can 
choose which specific AF_XDP socket/RX queue the packet redirects to via 
the `bpf_redirect_map()` call inside of XDP? I remember trying this a 
little over a year or so ago and I could not get it working. I then 
remember reading a thread stating this wasn't possible because the RX 
queue is decided inside of the NIC's hardware and cannot be changed 
inside of the XDP program. This was around the time I was getting into 
network programming, though. Therefore, it's possible I just wasn't 
understanding the thread correctly and I apologize if that is the case.

>> I see that the driver that Christian is using is the nfp which doesn't
>> even have XDP_REDIRECT support, so I'd say that using AF_XDP over there
>> won't be possible even in XDP_DRV mode. I think that I've been asking
>> explicitly Netronome guys if there are any plans on supporting it and if I
>> remember correctly there were not.

Thank you for pointing this out, Maciej! I didn't realize XDP_REDIRECT 
wasn't supported by Netronome and would explain why XDP DRV mode doesn't 
work while SKB mode does.


Do you know if this is documented anywhere by any chance? I wasn't able 
to find anything about XDP_REDIRECT besides it being introduced in 
kernel 4.14 below.


https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md#xdp


I should have taken a look at the NIC driver's code to see if 
XDP_REDIRECT support was added or contacted Netronome directly, though.


I'm not sure if it's possible, but it may be worth having the 
`bpf_redirect_map()` function return the two lower bits of the `flags` 
argument (to indicate an error/failure) if XDP_REDIRECT isn't supported 
in the NIC driver (it was returning XDP_REDIRECT, 4, in both DRV and SKB 
mode).

>>> 2. It would be better for performance to spread these packets out to
>>> individual RX queues, even if they're destined for the AF_XDP sockets
>>> (please correct me if I am wrong here).
>> Depends on the application as usual, but yes I would believe that
>> spreading load out is a good idea, unless you can process everything
>> on a single core.

Thank you for the information, Magnus! In my case, I am trying to 
process as many packets per second possible (preparing for (D)DoS 
attacks aimed to send as many packets as possible). I'm also expecting 
attackers to sometimes primarily use the packet types that'd be sent to 
AF_XDP sockets in their attacks. In this case, I'd imagine spreading the 
load out to all RX queues would be best.


One other thing I'm trying to figure out is whether it's best to use 
zero-copy mode or not with AF_XDP sockets. I read the following from the 
`xdp-tutorial` AF_XDP example.


 > Depending on your use-case, it can still make sense to use the 
“copy-mode” on a “zero-copy” capable driver. If for some-reason, not all 
traffic on a RX-queue is for the AF_XDP socket, and the XDP program 
multiplex between XDP_REDIRECT and XDP_PASS, then “copy-mode” can be 
relevant. As in “zero-copy” mode doing XDP_PASS have a fairly high cost, 
which involves allocating memory and copying over the frame.


The XDP program I am making is forwarding all traffic via XDP_TX besides 
traffic to the server itself (which should not be used in a (D)DoS 
attack for example). Although all load would be spread across all RX 
queues (unless if it'd be faster to steer all the specific AF_XDP 
traffic to a single RX queue), I'd think it may be worth using zero-copy 
mode in this case. I'll definitely have to mess around with it when the 
time comes and do pen-testing to see which approach processes more 
packets per core.

>>> In the program, I create a separate thread for each AF_XDP socket and
>>> this thread polls that specific AF_XDP socket.
>>>
>>>
>>> Here is the program's source code:
>>>
>>>
>>> https://github.com/gamemann/AF_XDP-Test
>>>
>>>
>>> When loading the XDP program in DRV mode, the packets destined for the
>>> AF_XDP sockets never reach the socket. However, when loaded in SKB mode,
>>> the packets do arrive. The return code of the `bpf_redirect_map()`
>>> function is the same for each mode (`4` which is successful I believe,
>>> XDP_REDIRECT). The AF_XDP sockets are also created successfully with
>>> each mode and I confirmed I receive a file descriptor (>0) from each
>>> AF_XDP socket.
>> Usually, this behavior happens if you load the XDP program on the
>> generic XDP (the skb based one) instead of on the driver. Have you
>> tried the xdpsock sample with the -M option? Does it work for you?
>> What you could do to pinpoint the problem is to little by little add
>> your logic to it and see when it breaks.
>>
>>> The AF_XDP sockets do not share the same UMEM as well. Individual UMEMs
>>> are assigned to each AF_XDP socket.
>>>
>>>
>>> Here is information regarding the Linux kernel and NIC.
>>>
>>>
>>> Kernel:
>>>
>>>
>>> ```
>>>
>>> cdeacon@xxxxxx:~/AF_XDP-Test$ uname -r
>>> 5.12.5-051205-generic
>>> ```
>>>
>>>
>>> Note - I've had this same issue on other Linux kernels from 5.4 to 5.10.
>>> Though, that was on a VM with the `virtio_net` driver.
>>>
>>>
>>> NIC information:
>>>
>>>
>>> ```
>>>
>>>     *-network
>>>          description: Ethernet interface
>>>          physical id: 1
>>>          bus info: pci@0000:04:00.0
>>>          logical name: yyyyyyyy
>>>          serial: xx:xx:xx:xx:xx
>>>          capabilities: ethernet physical fibre
>>>          configuration: autonegotiation=on broadcast=yes driver=nfp
>>> driverversion=5.12.5-051205-generic duplex=full firmware=0.0.3.5 0.22
>>> nic-2.1.16.1 nic ip=xxx.xxx.xxx.xxx link=yes multicast=yes port=fibre
>> What NIC HW is it?
>>
>>>
>>> NIC queues:
>>>
>>>
>>> ```
>>>
>>> cdeacon@xxxxxx:~/AF_XDP-Test$ sudo ethtool -l yyyyyyyy
>>> Channel parameters for yyyyyyyy:
>>> Pre-set maximums:
>>> RX:        16
>>> TX:        16
>>> Other:        2
>>> Combined:    16
>>> Current hardware settings:
>>> RX:        0
>>> TX:        8
>>> Other:        2
>>> Combined:    8
>>> ```
>>>
>>>
>>> NIC settings/features:
>>>
>>>
>>> ```
>>>
>>> cdeacon@xxxxxx:~/AF_XDP-Test$ sudo ethtool -k yyyyyyyy
>>> Features for yyyyyyyy:
>>> rx-checksumming: on
>>> tx-checksumming: on
>>>       tx-checksum-ipv4: on
>>>       tx-checksum-ip-generic: off [fixed]
>>>       tx-checksum-ipv6: on
>>>       tx-checksum-fcoe-crc: off [fixed]
>>>       tx-checksum-sctp: off [fixed]
>>> scatter-gather: on
>>>       tx-scatter-gather: on
>>>       tx-scatter-gather-fraglist: off [fixed]
>>> tcp-segmentation-offload: off
>>>       tx-tcp-segmentation: off
>>>       tx-tcp-ecn-segmentation: off [fixed]
>>>       tx-tcp-mangleid-segmentation: off
>>>       tx-tcp6-segmentation: off
>>> generic-segmentation-offload: on
>>> generic-receive-offload: on
>>> large-receive-offload: off [fixed]
>>> rx-vlan-offload: off [fixed]
>>> tx-vlan-offload: off [fixed]
>>> ntuple-filters: off [fixed]
>>> receive-hashing: on
>>> highdma: on
>>> rx-vlan-filter: off [fixed]
>>> vlan-challenged: off [fixed]
>>> tx-lockless: off [fixed]
>>> netns-local: off [fixed]
>>> tx-gso-robust: off [fixed]
>>> tx-fcoe-segmentation: off [fixed]
>>> tx-gre-segmentation: on
>>> tx-gre-csum-segmentation: off [fixed]
>>> tx-ipxip4-segmentation: off [fixed]
>>> tx-ipxip6-segmentation: off [fixed]
>>> tx-udp_tnl-segmentation: on
>>> tx-udp_tnl-csum-segmentation: off [fixed]
>>> tx-gso-partial: off [fixed]
>>> tx-tunnel-remcsum-segmentation: off [fixed]
>>> tx-sctp-segmentation: off [fixed]
>>> tx-esp-segmentation: off [fixed]
>>> tx-udp-segmentation: off [fixed]
>>> tx-gso-list: off [fixed]
>>> fcoe-mtu: off [fixed]
>>> tx-nocache-copy: off
>>> loopback: off [fixed]
>>> rx-fcs: off [fixed]
>>> rx-all: off [fixed]
>>> tx-vlan-stag-hw-insert: off [fixed]
>>> rx-vlan-stag-hw-parse: off [fixed]
>>> rx-vlan-stag-filter: off [fixed]
>>> l2-fwd-offload: off [fixed]
>>> hw-tc-offload: off [fixed]
>>> esp-hw-offload: off [fixed]
>>> esp-tx-csum-hw-offload: off [fixed]
>>> rx-udp_tunnel-port-offload: on
>>> tls-hw-tx-offload: off [fixed]
>>> tls-hw-rx-offload: off [fixed]
>>> rx-gro-hw: off [fixed]
>>> tls-hw-record: off [fixed]
>>> rx-gro-list: off
>>> macsec-hw-offload: off [fixed]
>>> rx-udp-gro-forwarding: off
>>> hsr-tag-ins-offload: off [fixed]
>>> hsr-tag-rm-offload: off [fixed]
>>> hsr-fwd-offload: off [fixed]
>>> hsr-dup-offload: off [fixed]
>>> ```
>>>
>>>
>>>   From what I've read below, setting up individual AF_XDP sockets on
>>> specific RX queues is supported, even with XDP DRV mode.
>>>
>>>
>>> https://github.com/xdp-project/xdp-tutorial/tree/master/advanced03-AF_XDP#gotcha-by-rx-queue-id-binding
>>>
>>>
>>> The AF_XDP test program I made is also based off of the AF_XDP lesson in
>>> the `xdp-tutorial` repository.
>>>
>>>
>>> One last note I want to add is I've tried adding the AF_XDP socket's FD
>>> to the XSK map inside the userspace via `bpf_map_update_elem(xskmapfd,
>>> &rxqueue, &fd, BPF_ANY)` with no luck (also confirmed the map updated
>>> successfully).
>>>
>>>
>>> Any help is highly appreciated and if you need any additional
>>> information, please let me know!
>>>
>>>
>>> Thank you for your time.
>>>
