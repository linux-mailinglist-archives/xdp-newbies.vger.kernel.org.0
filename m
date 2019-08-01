Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A31E7D80A
	for <lists+xdp-newbies@lfdr.de>; Thu,  1 Aug 2019 10:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbfHAIuV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 1 Aug 2019 04:50:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47068 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfHAIuU (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 1 Aug 2019 04:50:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id F39C0308FBA0;
        Thu,  1 Aug 2019 08:50:19 +0000 (UTC)
Received: from carbon (ovpn-200-29.brq.redhat.com [10.40.200.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B11415C207;
        Thu,  1 Aug 2019 08:50:14 +0000 (UTC)
Date:   Thu, 1 Aug 2019 10:18:49 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Brandon Cazander <brandon.cazander@multapplied.net>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        brouer@redhat.com, Stephen Hemminger <stephen@networkplumber.org>,
        David Miller <davem@davemloft.net>
Subject: Re: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation
 dropping packets
Message-ID: <20190801101746.702431fc@carbon>
In-Reply-To: <20190731211211.GA87084@multapplied.net>
References: <20190731211211.GA87084@multapplied.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 01 Aug 2019 08:50:20 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


First of all, thank you for this VERY excellent bug-report!
My comments inlined below.

Cc. Stephen as this might be related to:
  commit 458bf2f224f0 ("net: core: support XDP generic on stacked devices.") (Author: Stephen Hemminger).

On Wed, 31 Jul 2019 21:12:23 +0000 Brandon Cazander <brandon.cazander@multapplied.net> wrote:

> I am having an issue with xdpgeneric specifically when using XDP_PASS after
> bpf_xdp_adjust_head to pop some headers off. My test environment is qemu using
> virtio_net specifically, but it also happens with e1000 in qemu/physical devices.
> 
> On a real NIC (ixgbe), the same program is successfully passing decapsulated
> traffic, but fails in the same way when forcing xdpgeneric mode.

Are you sure you are using "xdpgeneric" mode?
As virtio_net do have "native" XDP mode.
 
> Here is the packet outside of my VM, with the IP+UDP+tun header.
> 
> # sudo tcpdump -ni ens5-outside -e udp -vvvXc1
> tcpdump: listening on ens5-outside, link-type EN10MB (Ethernet), capture size 262144 bytes
> 15:54:14.263306 06:54:00:00:00:01 > 06:54:01:00:00:01, ethertype IPv4 (0x0800), length 127: (tos 0x0, ttl 255, id 0, offset 0, flags [DF], proto UDP (17), length 113)
>     172.64.0.108.39999 > 172.64.0.101.7803: [no cksum] UDP, length 85
> 	0x0000:  4500 0071 0000 4000 ff11 222a ac40 006c  E..q..@..."*.@.l
                      ^^^^
iph->tot_len

$ echo $((0x71))
113

$ echo $((0x71+14))
127

> 	0x0010:  ac40 0065 9c3f 1e7b 005d 0000 0145 0000  .@.e.?.{.]...E..
                                                 ^^ ^^
Encapsulated packet starts at a funny offset, making it harder to follow.

> 	0x0020:  54e3 6b40 003f 01d5 e8c0 a800 02c0 a801  T.k@.?..........
                 ^^             ^^
Encapsulated iph->tot_len and ipproto=ICMP

> 	0x0030:  0208 002c b1b0 5eb8 f196 ca40 5d00 0000  ...,..^....@]...
> 	0x0040:  00c8 0304 0000 0000 0010 1112 1314 1516  ................
> 	0x0050:  1718 191a 1b1c 1d1e 1f20 2122 2324 2526  ..........!"#$%&
> 	0x0060:  2728 292a 2b2c 2d2e 2f30 3132 3334 3536  '()*+,-./0123456
> 	0x0070:  37                                       7
> 
> My XDP program copies the original ethhdr to the new offset and adjusts the head
> forward, and I can see the resulting ICMP packet is valid with tcpdump inside
> the VM:
> 
> # tcpdump -niens5 icmp -c1 -vXe
> tcpdump: listening on ens5, link-type EN10MB (Ethernet), capture size 262144 bytes
> 15:53:25.602109 06:54:00:00:00:01 > 06:54:01:00:00:01, ethertype IPv4 (0x0800), length 98: (tos 0x0, ttl 63, id 35986, offset 0, flags [DF], proto ICMP (1), length 84)
>     192.168.0.2 > 192.168.1.2: ICMP echo request, id 45150, seq 43683, length 64
> 	0x0000:  4500 0054 8c92 4000 3f01 2cc2 c0a8 0002  E..T..@.?.,.....
                        ^^             ^^ 
iph->tot_len and ipproto=ICMP

$ echo $((0x54))
84

$ echo $((0x54+14))
98

> 	0x0010:  c0a8 0102 0800 ed79 b05e aaa3 6dca 405d  .......y.^..m.@]
> 	0x0020:  0000 0000 3589 0d00 0000 0000 1011 1213  ....5...........
> 	0x0030:  1415 1617 1819 1a1b 1c1d 1e1f 2021 2223  .............!"#
> 	0x0040:  2425 2627 2829 2a2b 2c2d 2e2f 3031 3233  $%&'()*+,-./0123
> 	0x0050:  3435 3637                                4567
> 
> Unfortunately, at this point, the packet is dropped in ip_rcv_core. I added a
> perf probe on the specific drop line that I'm hitting, and printing the skb->len
> and len (from ntohs(iph->tot_len)) variables. You can see the obviously wrong
> len value below, while a packet capture in the VM does show the correct value
> for tot_len in the IP header.
 
The len from ntohs(iph->tot_len) is obviously wrong (len=4294931717),
but given it comes the packet data, it can easily be a mistake in your
adjustment of headers.  But from above packet dump, the iph->tot_len is
correct.  Thus, this indicate that how we find the IP-header offset is
likely broken...


> # perf probe -L ip_rcv_core:64+4 | cat
> <ip_rcv_core@/usr/src/debug/kernel-debug-5.2.2-1.2.x86_64/linux-5.2/linux-obj/../net/ipv4/ip_input.c:64>
>      64  	if (pskb_trim_rcsum(skb, len)) {
>      65  		__IP_INC_STATS(net, IPSTATS_MIB_INDISCARDS);
>      66  		goto drop;
>          	}
> 

Looking at the code, I think the packet will be dropped earlier than
the pskb_trim_rcsum() call, in the check if (skb->len < len).

	iph = ip_hdr(skb);
	[...]

	len = ntohs(iph->tot_len);
	if (skb->len < len) {
		__IP_INC_STATS(net, IPSTATS_MIB_INTRUNCATEDPKTS);
		goto drop;
	} else if (len < (iph->ihl*4))
		goto inhdr_error;

	/* Our transport medium may have padded the buffer out. Now we know it
	 * is IP we can trim to the true length of the frame.
	 * Note this now means skb->len holds ntohs(iph->tot_len).
	 */
	if (pskb_trim_rcsum(skb, len)) {
		__IP_INC_STATS(net, IPSTATS_MIB_INDISCARDS);
		goto drop;
	}

The bug might hide in iph=ip_hdr(skb) which is found via skb->network_header
(via helper ip_hdr => skb_network_header(skb)).


> # perf probe -a 'ip_rcv_core:66 skb=skb->len:u32 len=len:u32'
> 	swapper     0 [001] 84794.954487: probe:ip_rcv_core: (ffffffffbcbd5a7d) skb=84 len=4294931717
> 	swapper     0 [001] 84794.965473: probe:ip_rcv_core: (ffffffffbcbd5a7d) skb=84 len=4294936833
> 
> In contrast, here's what it looks like in XDP native mode (different line number
> but looking):
> 
> # perf probe -a 'ip_rcv_core:57 skb=skb->len:u32 len=len:u32'
> 	swapper     0 [000]   353.187439: probe:ip_rcv_core: (ffffffffac9dcca7) skb=84 len=84
> 	swapper     0 [003]   353.187577: probe:ip_rcv_core: (ffffffffac9dcca7) skb=84 len=84
> 
> Here's the relevant portion of my program where I decapsulate:
> 
> static __always_inline int handle_peer_data_ipv4(struct xdp_md *ctx)
> {
> 	void *data, *data_end;
> 	struct ethhdr *eth, *orig_eth;
> 	__u32 csum = 0;
> 
> 	data = (void *)(unsigned long)ctx->data;
> 	data_end = (void *)(unsigned long)ctx->data_end;
> 
> 	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr) + sizeof(struct tunnel_header) > data_end) {
> 		return XDP_DROP;
> 	}
> 
> 	orig_eth = data;
> 	eth = data + sizeof(struct iphdr) + sizeof(struct udphdr) + sizeof(struct tunnel_header);
> 	memcpy(&eth->h_source, &orig_eth->h_source, ETH_ALEN);
> 	memcpy(&eth->h_dest, &orig_eth->h_dest, ETH_ALEN);
> 	eth->h_proto = __constant_htons(ETH_P_IP);

You only support IPv4 encapsulated packets?

Do you handle ARP requests separately?

> 	/* Decapsulate by removing IP + UDP + tunnel headers */
> 	if (bpf_xdp_adjust_head(ctx, (int)(sizeof(struct iphdr) + sizeof(struct udphdr) +
> 					   sizeof(struct tunnel_header)))) {
> 		return XDP_DROP;
> 	}
> 
> 	return XDP_PASS;
> }
> 
> struct tunnel_header {
> 	__u8 flags;
> };
> 
> Kernel is 5.2.2-1-debug, OS is openSUSE Tumbleweed 20190724.

Can you test an earlier kernel, specifically before: commit
458bf2f224f0 ("net: core: support XDP generic on stacked devices.")
(Author: Stephen Hemminger)

$ git describe --contains  458bf2f224f04
v5.2-rc3~26^2~11^2

I fear that this commit, which moved generic-XDP to a later call point,
might cause this.  Because it could be that the SKB network_header
update, is now done before calling XDP program (... still looking at
code details).

> For qemu I run with these arguments for the NICs:
> 
> # qemu (...) -netdev tap,br=vm-bridge,id=hostnet1,ifname=ens5-outside,queues=4,vhost=on \
> -device virtio-net-pci,mq=on,vectors=9,guest_tso4=off,guest_tso6=off,netdev=hostnet1,id=net1,mac=06:54:01:00:00:01
> 


-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
