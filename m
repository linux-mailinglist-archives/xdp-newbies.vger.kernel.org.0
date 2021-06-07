Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCB439E998
	for <lists+xdp-newbies@lfdr.de>; Tue,  8 Jun 2021 00:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhFGWaG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 7 Jun 2021 18:30:06 -0400
Received: from mail-108-mta132.mxroute.com ([136.175.108.132]:46883 "EHLO
        mail-108-mta132.mxroute.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230264AbhFGWaG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 7 Jun 2021 18:30:06 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Jun 2021 18:30:06 EDT
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta132.mxroute.com (ZoneMTA) with ESMTPSA id 179e89289e2000774e.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 07 Jun 2021 22:23:08 +0000
X-Zone-Loop: f137cec2fc3c9380d37b045a1cc3600eb063a502750a
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=7rFgmluh/vMKF98rlUjiustvme3V/BEoQdbfk0oihs8=; b=Y0j4xJEr/lZinCH6JNj8wn4FkK
        oxE43aTv12aWA6wK2RudlUbal2wzfxG5jnSPgVKi7L3i94JfEkt/WmtleHfDYuIngan2xu7L8/D7i
        HZ+uVXwgRhsXsezcJ8VPYInah3XM9UHc/YRfETcyLFG6auc1Ku+/iRnqWi2He7Cyt59xbIcvamCZn
        V4utv14vpX6uOxIEyCYXxY2Ygd6+pkXo7Iz1jTbWQXlla053e8BYcfuVbgPS37oETE5LDbPcG9GCh
        fVFHexSbpH6qaMcn1x58c68bNgpDJqEWoLKDA/EKAiIszJCAcflDHHGgK6j5tuGewNDq/1f0d2OwK
        qo4XHUBw==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: AF_XDP Sockets Not Receiving Packets In XDP DRV Mode
Message-ID: <705dc02f-9e53-4cea-f100-43145d6d8684@gflclan.com>
Date:   Mon, 7 Jun 2021 17:23:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,


I believe I made a thread regarding this issue around a year ago or so, 
but I thought it was related to the `virtio_net` driver. This time, 
however, I am testing this on a dedicated server with a dedicated NIC 
(see information at bottom) and have the same issue.


I am trying to create an AF_XDP program and in this program, I currently 
spin up n AF_XDP sockets where n represents the RX queue count. Each 
AF_XDP socket is bound to a specific RX queue. From what I've seen, most 
examples recommend binding the socket to one RX queue and using flow 
steering via `ethtool` to steer all packets destined for the AF_XDP 
socket to the RX queue the AF_XDP socket is bound to. The two problems I 
see here are:


1. To my understanding, this NIC only supports matching on layer 2/3/4 
headers and with my AF_XDP program, I want to redirect packets to the 
AF_XDP sockets depending on the first 4 - 5 bytes of the payload.


2. It would be better for performance to spread these packets out to 
individual RX queues, even if they're destined for the AF_XDP sockets 
(please correct me if I am wrong here).


In the program, I create a separate thread for each AF_XDP socket and 
this thread polls that specific AF_XDP socket.


Here is the program's source code:


https://github.com/gamemann/AF_XDP-Test


When loading the XDP program in DRV mode, the packets destined for the 
AF_XDP sockets never reach the socket. However, when loaded in SKB mode, 
the packets do arrive. The return code of the `bpf_redirect_map()` 
function is the same for each mode (`4` which is successful I believe, 
XDP_REDIRECT). The AF_XDP sockets are also created successfully with 
each mode and I confirmed I receive a file descriptor (>0) from each 
AF_XDP socket.


The AF_XDP sockets do not share the same UMEM as well. Individual UMEMs 
are assigned to each AF_XDP socket.


Here is information regarding the Linux kernel and NIC.


Kernel:


```

cdeacon@xxxxxx:~/AF_XDP-Test$ uname -r
5.12.5-051205-generic
```


Note - I've had this same issue on other Linux kernels from 5.4 to 5.10. 
Though, that was on a VM with the `virtio_net` driver.


NIC information:


```

   *-network
        description: Ethernet interface
        physical id: 1
        bus info: pci@0000:04:00.0
        logical name: yyyyyyyy
        serial: xx:xx:xx:xx:xx
        capabilities: ethernet physical fibre
        configuration: autonegotiation=on broadcast=yes driver=nfp 
driverversion=5.12.5-051205-generic duplex=full firmware=0.0.3.5 0.22 
nic-2.1.16.1 nic ip=xxx.xxx.xxx.xxx link=yes multicast=yes port=fibre
```


NIC queues:


```

cdeacon@xxxxxx:~/AF_XDP-Test$ sudo ethtool -l yyyyyyyy
Channel parameters for yyyyyyyy:
Pre-set maximums:
RX:        16
TX:        16
Other:        2
Combined:    16
Current hardware settings:
RX:        0
TX:        8
Other:        2
Combined:    8
```


NIC settings/features:


```

cdeacon@xxxxxx:~/AF_XDP-Test$ sudo ethtool -k yyyyyyyy
Features for yyyyyyyy:
rx-checksumming: on
tx-checksumming: on
     tx-checksum-ipv4: on
     tx-checksum-ip-generic: off [fixed]
     tx-checksum-ipv6: on
     tx-checksum-fcoe-crc: off [fixed]
     tx-checksum-sctp: off [fixed]
scatter-gather: on
     tx-scatter-gather: on
     tx-scatter-gather-fraglist: off [fixed]
tcp-segmentation-offload: off
     tx-tcp-segmentation: off
     tx-tcp-ecn-segmentation: off [fixed]
     tx-tcp-mangleid-segmentation: off
     tx-tcp6-segmentation: off
generic-segmentation-offload: on
generic-receive-offload: on
large-receive-offload: off [fixed]
rx-vlan-offload: off [fixed]
tx-vlan-offload: off [fixed]
ntuple-filters: off [fixed]
receive-hashing: on
highdma: on
rx-vlan-filter: off [fixed]
vlan-challenged: off [fixed]
tx-lockless: off [fixed]
netns-local: off [fixed]
tx-gso-robust: off [fixed]
tx-fcoe-segmentation: off [fixed]
tx-gre-segmentation: on
tx-gre-csum-segmentation: off [fixed]
tx-ipxip4-segmentation: off [fixed]
tx-ipxip6-segmentation: off [fixed]
tx-udp_tnl-segmentation: on
tx-udp_tnl-csum-segmentation: off [fixed]
tx-gso-partial: off [fixed]
tx-tunnel-remcsum-segmentation: off [fixed]
tx-sctp-segmentation: off [fixed]
tx-esp-segmentation: off [fixed]
tx-udp-segmentation: off [fixed]
tx-gso-list: off [fixed]
fcoe-mtu: off [fixed]
tx-nocache-copy: off
loopback: off [fixed]
rx-fcs: off [fixed]
rx-all: off [fixed]
tx-vlan-stag-hw-insert: off [fixed]
rx-vlan-stag-hw-parse: off [fixed]
rx-vlan-stag-filter: off [fixed]
l2-fwd-offload: off [fixed]
hw-tc-offload: off [fixed]
esp-hw-offload: off [fixed]
esp-tx-csum-hw-offload: off [fixed]
rx-udp_tunnel-port-offload: on
tls-hw-tx-offload: off [fixed]
tls-hw-rx-offload: off [fixed]
rx-gro-hw: off [fixed]
tls-hw-record: off [fixed]
rx-gro-list: off
macsec-hw-offload: off [fixed]
rx-udp-gro-forwarding: off
hsr-tag-ins-offload: off [fixed]
hsr-tag-rm-offload: off [fixed]
hsr-fwd-offload: off [fixed]
hsr-dup-offload: off [fixed]
```


 From what I've read below, setting up individual AF_XDP sockets on 
specific RX queues is supported, even with XDP DRV mode.


https://github.com/xdp-project/xdp-tutorial/tree/master/advanced03-AF_XDP#gotcha-by-rx-queue-id-binding


The AF_XDP test program I made is also based off of the AF_XDP lesson in 
the `xdp-tutorial` repository.


One last note I want to add is I've tried adding the AF_XDP socket's FD 
to the XSK map inside the userspace via `bpf_map_update_elem(xskmapfd, 
&rxqueue, &fd, BPF_ANY)` with no luck (also confirmed the map updated 
successfully).


Any help is highly appreciated and if you need any additional 
information, please let me know!


Thank you for your time.

