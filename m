Return-Path: <xdp-newbies+bounces-64-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB38B39BC
	for <lists+xdp-newbies@lfdr.de>; Fri, 26 Apr 2024 16:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5411C23F32
	for <lists+xdp-newbies@lfdr.de>; Fri, 26 Apr 2024 14:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE651487CD;
	Fri, 26 Apr 2024 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=std.iyte.edu.tr header.i=@std.iyte.edu.tr header.b="sDMCrAzO"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from spam-gw3.iyte.edu.tr (spam-gw3.iyte.edu.tr [193.140.248.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211B42A99
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.140.248.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714141347; cv=none; b=YdXc+WRBDH0GV9UX1biYwreVbWL6Jam5/WBUxWcHElvwSQrmkPvcI6mvaFvWlWSvEKjydMDmP8dVXcDKTaFV8bkDJhCzX6S4I7XcMOG5nsHpWZPLumIy0vGZZtz+caVhV8NZkficHX0uAllfZIWXPZmgU8ai0LLAPVENzWkmWdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714141347; c=relaxed/simple;
	bh=S11xcxGekLae2W8I8Be/TEZLV7EeFrs4ZqJCraKAbok=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=avtKm9OUJBA+vyytTe85aekFQl6EAskHcMnPvsOPNPZ3BhG1CMkiUYGVV2r6K52Es58FlaEFG0ESFUiwKfLlPvr1u0mi9TgsOLEvRDxxR3OJRTmAQdp8I+JizNpoVwFmXxT9NKPeEIGdRp8vis8UB7uigoBmZnUeRf9a0S6+f4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=std.iyte.edu.tr; spf=pass smtp.mailfrom=std.iyte.edu.tr; dkim=pass (1024-bit key) header.d=std.iyte.edu.tr header.i=@std.iyte.edu.tr header.b=sDMCrAzO; arc=none smtp.client-ip=193.140.248.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=std.iyte.edu.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=std.iyte.edu.tr
Received: from spam-gw.iyte.edu.tr (localhost [127.0.0.1])
	by spam-gw.iyte.edu.tr (Postfix) with ESMTP id 19AC29A4E32
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 17:22:18 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=std.iyte.edu.tr;
	s=rsa; t=1714141338;
	bh=S11xcxGekLae2W8I8Be/TEZLV7EeFrs4ZqJCraKAbok=;
	h=Date:From:To:Subject;
	b=sDMCrAzOsLU18AnnJvDGa0TGzCU4iLnAfCMdty2k525eh9AUnhCPKKG8wq+siUWbz
	 LIRmzhZm58ihlf/l/mtp2BVeR4JrauTjCHJ1nKfh19dMFZUNVAXTvX/TKCjR/1Go8A
	 ZMdQ3PMjt3TBh7Vx1mHkXcNOsHoXRD7Dk6EmppZs=
Received: from localhost (localhost [127.0.0.1])
	by spam-gw.iyte.edu.tr (Postfix) with ESMTP id 15B2D9A4E23
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 17:22:18 +0300 (+03)
X-Virus-Scanned: by SpamTitan at iyte.edu.tr
Received: from spam-gw.iyte.edu.tr (localhost [127.0.0.1])
	by spam-gw.iyte.edu.tr (Postfix) with ESMTP id BE1C49A4E01
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 17:22:17 +0300 (+03)
Authentication-Results: spam-gw.iyte.edu.tr;
        x-trusted-ip=pass
Received: from mail.iyte.edu.tr (mail.iyte.edu.tr [193.140.248.4])
	by spam-gw.iyte.edu.tr (Postfix) with ESMTPS id B48C89A4E28
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 17:22:17 +0300 (+03)
Received: from localhost (localhost [127.0.0.1])
	by mail.iyte.edu.tr (Postfix) with ESMTP id A3B3E6623001
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 17:22:17 +0300 (+03)
Received: from mail.iyte.edu.tr ([127.0.0.1])
 by localhost (mail.iyte.edu.tr [127.0.0.1]) (amavis, port 10032) with ESMTP
 id 1n68vPIlYa8e for <xdp-newbies@vger.kernel.org>;
 Fri, 26 Apr 2024 17:22:17 +0300 (+03)
Received: from mail.iyte.edu.tr (localhost [127.0.0.1])
	by mail.iyte.edu.tr (Postfix) with ESMTPS id 827E76623006
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 17:22:17 +0300 (+03)
Received: from mail.iyte.edu.tr (mail.iyte.edu.tr [193.140.248.4])
	by mail.iyte.edu.tr (Postfix) with ESMTP id 79B966623005
	for <xdp-newbies@vger.kernel.org>; Fri, 26 Apr 2024 17:22:17 +0300 (+03)
Date: Fri, 26 Apr 2024 17:22:17 +0300 (TRT)
From: HAKAN SARIMAN <hakansariman@std.iyte.edu.tr>
To: xdp-newbies <xdp-newbies@vger.kernel.org>
Message-ID: <1920889031.78418857.1714141337441.JavaMail.zimbra@std.iyte.edu.tr>
Subject: Packet Filtering with AF_XDP in Forwarded Traffic
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4562 (ZimbraWebClient - GC123 (Mac)/8.8.15_GA_4562)
Thread-Index: RdBwLbTbf1ssmXMPnJKM2MGVJwZkfg==
Thread-Topic: Packet Filtering with AF_XDP in Forwarded Traffic

Hi folks,

I'm currently working on setting up a packet filter using AF_XDP on my Linux server to manage network traffic  in userspace.
I tried to work with xdp-tutorial/AF_XDP example,
I've attached a simple XDP program that redirects to the traffic by using xsks_map on enp8s0.
You can find the XDP code below. 
To test my setup, I'm trying to block a specific IPv4 address.
Although I can see the traffic on userspace, I couldn't block any traffic. 
You can find the userspace code below.

I think there is something I am missing, can you help me what I am doing wrong?

Here's a brief overview of my current setup:

Network Interfaces: enp1s0 (Egress Interface),  ens8s0 (Local Network Interface)

Current iptables Rules:
-A FORWARD -i enp1s0 -o ens8s0 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i ens8s0 -o enp1s0 -j ACCEPT

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
23461 1790K MASQUERADE  0    --  *      enp1s0  0.0.0.0/0            0.0.0.0/0



XDP Code:
-----
/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/bpf.h>

#include <bpf/bpf_helpers.h>

struct {
 __uint(type, BPF_MAP_TYPE_XSKMAP);
 __type(key, __u32);
 __type(value, __u32);
 __uint(max_entries, 64);
} xsks_map SEC(".maps");

struct {
 __uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
 __type(key, __u32);
 __type(value, __u32);
 __uint(max_entries, 64);
} xdp_stats_map SEC(".maps");

SEC("xdp")
int xdp_sock_prog(struct xdp_md *ctx)
{
    int index = ctx->rx_queue_index;
    __u32 *pkt_count;

    pkt_count = bpf_map_lookup_elem(&xdp_stats_map, &index);
    if (pkt_count) {

        /* We pass every other packet */
        if ((*pkt_count)++ & 1)
            return XDP_PASS;
    }

    /* A set entry here means that the correspnding queue_id
     * has an active AF_XDP socket bound to it. */
    if (bpf_map_lookup_elem(&xsks_map, &index))
        return bpf_redirect_map(&xsks_map, index, 0);

    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";


----
Userspace code (rest of the code is identical with xdp-tutorial/AF_XDP [https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/af_xdp_user.c]):

static bool process_packet(struct xsk_socket_info *xsk,
			   uint64_t addr, uint32_t len)
{
	uint8_t *pkt = xsk_umem__get_data(xsk->umem->buffer, addr);

		struct ethhdr *eth = (struct ethhdr *) pkt;
		struct iphdr *ip = (struct iphdr *) (eth + 1);
		struct in_addr tmp_ip;

		tmp_ip.s_addr = ip->saddr;
		char src_ip_str[INET_ADDRSTRLEN];
		inet_ntop(AF_INET, &tmp_ip, src_ip_str, INET_ADDRSTRLEN);

		tmp_ip.s_addr = ip->daddr;
		char dest_ip_str[INET_ADDRSTRLEN];
		inet_ntop(AF_INET, &tmp_ip, dest_ip_str, INET_ADDRSTRLEN);

		printf("saddr: %s, daddr: %s\n", src_ip_str, dest_ip_str);

                // trying to block an ip 
		if (strcmp(src_ip_str, "x.y.z.t") == 0 || strcmp(dest_ip_str, "x.y.z.t") == 0) {
			return false;
    	}

	int ret;
	uint32_t tx_idx = 0;
	ret = xsk_ring_prod__reserve(&xsk->tx, 1, &tx_idx);
	if (ret != 1) {
		/* No more transmit slots, drop the packet */
		return false;
	}

	xsk_ring_prod__tx_desc(&xsk->tx, tx_idx)->addr = addr;
	xsk_ring_prod__tx_desc(&xsk->tx, tx_idx)->len = len;
	xsk_ring_prod__submit(&xsk->tx, 1);
	xsk->outstanding_tx++;

	return true;
}

...

/* Process received packets */
	for (i = 0; i < rcvd; i++) {
		uint64_t addr = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx)->addr;
		uint32_t len = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx++)->len;

		if (!process_packet(xsk, addr, len))
			xsk_free_umem_frame(xsk, addr);
        }

