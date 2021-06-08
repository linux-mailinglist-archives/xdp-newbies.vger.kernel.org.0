Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1495239F63E
	for <lists+xdp-newbies@lfdr.de>; Tue,  8 Jun 2021 14:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhFHMUV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 8 Jun 2021 08:20:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:41807 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232312AbhFHMUU (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 8 Jun 2021 08:20:20 -0400
IronPort-SDR: huE0xcHGTqLIp4CnH4otquKlb0nARZ6n3jUSBUSSJgXZYsIXiEg1009/vBe2Koem6N8KnIF8di
 O2RU/Ugc60ng==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="184517465"
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
   d="scan'208";a="184517465"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 05:18:24 -0700
IronPort-SDR: 3bmXKgftDFTTphVDq1OIbhtcP428E4hhqr9Nt/rpKWYD7Sqks6h9407S1R3HX1sMMN65TLDexn
 nBlFi/+b0Jtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
   d="scan'208";a="635047922"
Received: from ranger.igk.intel.com ([10.102.21.164])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2021 05:18:23 -0700
Date:   Tue, 8 Jun 2021 14:06:03 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Christian Deacon <gamemann@gflclan.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: AF_XDP Sockets Not Receiving Packets In XDP DRV Mode
Message-ID: <20210608120603.GA1550@ranger.igk.intel.com>
References: <705dc02f-9e53-4cea-f100-43145d6d8684@gflclan.com>
 <CAJ8uoz1GvzMTA6bDTpH2N3N1tyAUy8zsFYcz94FNw0M7L+_e_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8uoz1GvzMTA6bDTpH2N3N1tyAUy8zsFYcz94FNw0M7L+_e_g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jun 08, 2021 at 01:26:06PM +0200, Magnus Karlsson wrote:
> On Tue, Jun 8, 2021 at 12:29 AM Christian Deacon <gamemann@gflclan.com> wrote:
> >
> > Hey everyone,
> >
> >
> > I believe I made a thread regarding this issue around a year ago or so,
> > but I thought it was related to the `virtio_net` driver. This time,
> > however, I am testing this on a dedicated server with a dedicated NIC
> > (see information at bottom) and have the same issue.
> >
> >
> > I am trying to create an AF_XDP program and in this program, I currently
> > spin up n AF_XDP sockets where n represents the RX queue count. Each
> > AF_XDP socket is bound to a specific RX queue. From what I've seen, most
> > examples recommend binding the socket to one RX queue and using flow
> > steering via `ethtool` to steer all packets destined for the AF_XDP
> > socket to the RX queue the AF_XDP socket is bound to. The two problems I
> > see here are:
> >
> >
> > 1. To my understanding, this NIC only supports matching on layer 2/3/4
> > headers and with my AF_XDP program, I want to redirect packets to the
> > AF_XDP sockets depending on the first 4 - 5 bytes of the payload.
> 
> If your NIC does not support the packet steering you need, you can
> always load your own XDP program to do the steering for you. This will
> of course not be as fast as if you did it in HW, but any policy can be
> implemented. See the example in samples/bpf/xdpsock_kern.c in the
> Linux source code repo. But I now see that you have such an XDP
> program written. So, your program does not work with this nor with HW
> steering (spraying with RSS for example)?

I see that the driver that Christian is using is the nfp which doesn't
even have XDP_REDIRECT support, so I'd say that using AF_XDP over there
won't be possible even in XDP_DRV mode. I think that I've been asking
explicitly Netronome guys if there are any plans on supporting it and if I
remember correctly there were not.

> 
> >
> > 2. It would be better for performance to spread these packets out to
> > individual RX queues, even if they're destined for the AF_XDP sockets
> > (please correct me if I am wrong here).
> 
> Depends on the application as usual, but yes I would believe that
> spreading load out is a good idea, unless you can process everything
> on a single core.
> 
> >
> > In the program, I create a separate thread for each AF_XDP socket and
> > this thread polls that specific AF_XDP socket.
> >
> >
> > Here is the program's source code:
> >
> >
> > https://github.com/gamemann/AF_XDP-Test
> >
> >
> > When loading the XDP program in DRV mode, the packets destined for the
> > AF_XDP sockets never reach the socket. However, when loaded in SKB mode,
> > the packets do arrive. The return code of the `bpf_redirect_map()`
> > function is the same for each mode (`4` which is successful I believe,
> > XDP_REDIRECT). The AF_XDP sockets are also created successfully with
> > each mode and I confirmed I receive a file descriptor (>0) from each
> > AF_XDP socket.
> 
> Usually, this behavior happens if you load the XDP program on the
> generic XDP (the skb based one) instead of on the driver. Have you
> tried the xdpsock sample with the -M option? Does it work for you?
> What you could do to pinpoint the problem is to little by little add
> your logic to it and see when it breaks.
> 
> >
> > The AF_XDP sockets do not share the same UMEM as well. Individual UMEMs
> > are assigned to each AF_XDP socket.
> >
> >
> > Here is information regarding the Linux kernel and NIC.
> >
> >
> > Kernel:
> >
> >
> > ```
> >
> > cdeacon@xxxxxx:~/AF_XDP-Test$ uname -r
> > 5.12.5-051205-generic
> > ```
> >
> >
> > Note - I've had this same issue on other Linux kernels from 5.4 to 5.10.
> > Though, that was on a VM with the `virtio_net` driver.
> >
> >
> > NIC information:
> >
> >
> > ```
> >
> >    *-network
> >         description: Ethernet interface
> >         physical id: 1
> >         bus info: pci@0000:04:00.0
> >         logical name: yyyyyyyy
> >         serial: xx:xx:xx:xx:xx
> >         capabilities: ethernet physical fibre
> >         configuration: autonegotiation=on broadcast=yes driver=nfp
> > driverversion=5.12.5-051205-generic duplex=full firmware=0.0.3.5 0.22
> > nic-2.1.16.1 nic ip=xxx.xxx.xxx.xxx link=yes multicast=yes port=fibre
> 
> What NIC HW is it?
> 
> >
> >
> > NIC queues:
> >
> >
> > ```
> >
> > cdeacon@xxxxxx:~/AF_XDP-Test$ sudo ethtool -l yyyyyyyy
> > Channel parameters for yyyyyyyy:
> > Pre-set maximums:
> > RX:        16
> > TX:        16
> > Other:        2
> > Combined:    16
> > Current hardware settings:
> > RX:        0
> > TX:        8
> > Other:        2
> > Combined:    8
> > ```
> >
> >
> > NIC settings/features:
> >
> >
> > ```
> >
> > cdeacon@xxxxxx:~/AF_XDP-Test$ sudo ethtool -k yyyyyyyy
> > Features for yyyyyyyy:
> > rx-checksumming: on
> > tx-checksumming: on
> >      tx-checksum-ipv4: on
> >      tx-checksum-ip-generic: off [fixed]
> >      tx-checksum-ipv6: on
> >      tx-checksum-fcoe-crc: off [fixed]
> >      tx-checksum-sctp: off [fixed]
> > scatter-gather: on
> >      tx-scatter-gather: on
> >      tx-scatter-gather-fraglist: off [fixed]
> > tcp-segmentation-offload: off
> >      tx-tcp-segmentation: off
> >      tx-tcp-ecn-segmentation: off [fixed]
> >      tx-tcp-mangleid-segmentation: off
> >      tx-tcp6-segmentation: off
> > generic-segmentation-offload: on
> > generic-receive-offload: on
> > large-receive-offload: off [fixed]
> > rx-vlan-offload: off [fixed]
> > tx-vlan-offload: off [fixed]
> > ntuple-filters: off [fixed]
> > receive-hashing: on
> > highdma: on
> > rx-vlan-filter: off [fixed]
> > vlan-challenged: off [fixed]
> > tx-lockless: off [fixed]
> > netns-local: off [fixed]
> > tx-gso-robust: off [fixed]
> > tx-fcoe-segmentation: off [fixed]
> > tx-gre-segmentation: on
> > tx-gre-csum-segmentation: off [fixed]
> > tx-ipxip4-segmentation: off [fixed]
> > tx-ipxip6-segmentation: off [fixed]
> > tx-udp_tnl-segmentation: on
> > tx-udp_tnl-csum-segmentation: off [fixed]
> > tx-gso-partial: off [fixed]
> > tx-tunnel-remcsum-segmentation: off [fixed]
> > tx-sctp-segmentation: off [fixed]
> > tx-esp-segmentation: off [fixed]
> > tx-udp-segmentation: off [fixed]
> > tx-gso-list: off [fixed]
> > fcoe-mtu: off [fixed]
> > tx-nocache-copy: off
> > loopback: off [fixed]
> > rx-fcs: off [fixed]
> > rx-all: off [fixed]
> > tx-vlan-stag-hw-insert: off [fixed]
> > rx-vlan-stag-hw-parse: off [fixed]
> > rx-vlan-stag-filter: off [fixed]
> > l2-fwd-offload: off [fixed]
> > hw-tc-offload: off [fixed]
> > esp-hw-offload: off [fixed]
> > esp-tx-csum-hw-offload: off [fixed]
> > rx-udp_tunnel-port-offload: on
> > tls-hw-tx-offload: off [fixed]
> > tls-hw-rx-offload: off [fixed]
> > rx-gro-hw: off [fixed]
> > tls-hw-record: off [fixed]
> > rx-gro-list: off
> > macsec-hw-offload: off [fixed]
> > rx-udp-gro-forwarding: off
> > hsr-tag-ins-offload: off [fixed]
> > hsr-tag-rm-offload: off [fixed]
> > hsr-fwd-offload: off [fixed]
> > hsr-dup-offload: off [fixed]
> > ```
> >
> >
> >  From what I've read below, setting up individual AF_XDP sockets on
> > specific RX queues is supported, even with XDP DRV mode.
> >
> >
> > https://github.com/xdp-project/xdp-tutorial/tree/master/advanced03-AF_XDP#gotcha-by-rx-queue-id-binding
> >
> >
> > The AF_XDP test program I made is also based off of the AF_XDP lesson in
> > the `xdp-tutorial` repository.
> >
> >
> > One last note I want to add is I've tried adding the AF_XDP socket's FD
> > to the XSK map inside the userspace via `bpf_map_update_elem(xskmapfd,
> > &rxqueue, &fd, BPF_ANY)` with no luck (also confirmed the map updated
> > successfully).
> >
> >
> > Any help is highly appreciated and if you need any additional
> > information, please let me know!
> >
> >
> > Thank you for your time.
> >
