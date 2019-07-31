Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF677CFB3
	for <lists+xdp-newbies@lfdr.de>; Wed, 31 Jul 2019 23:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbfGaVM1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 31 Jul 2019 17:12:27 -0400
Received: from mail-eopbgr670062.outbound.protection.outlook.com ([40.107.67.62]:30752
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729053AbfGaVM0 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 31 Jul 2019 17:12:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwOqKn+DehJwNKpbsKmrOtXq3lm8EeuXws+Y71KiT4TVaonJr56ShhDa9zTKNKZUEbMxbVEgflXN4zfx3U71UG7a1z0MzA0whbCL76g6hjpd15ugbfMiS+61cGpMNRSFnKAAy4Yr798RjVsy55FfgiXmk4HpDy+TmVczhQ7x/ONlQHH0XpiX5xgYm/ACH1T8rI71ImMi4m+Vm3q7/RkvdUMuweQI9HxprvQ8qJFTLsFnPFR0kwhqAYpzsrHrg3i9Auhg3i4tKKsDFkDxiiju0OAH1r1y4X1Y0uqAMLMmnc3Ex35get+pcca8TEfgvcouC3hjKIPOZPvZ/B9iAeBPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG+xwIzTf5V4HoyjnEtmxHO11WYgTxwfoEQt/2GMl/4=;
 b=AUqCgch4q8lF7hW4v0deOkY+DVKnUE0RMcXQWKpqumBs5mOJugpWJY4frb4WoPXD4viGDTNKAIBBkdRIutryCoDF3aGGKAX69yEZ9AQMLcWCL83Igj3QfreSjys2TpCE4T2dqiGpGYUZlqMBUzgMQJGIR7W+hByFnN/dgTKkFuzZDBCRX9nd7VxTR1iO+jdKoDTO9W3msiQltwnhEuWGV3GDKbRDtPjwXpHa2XlIvBbT/P6qvFJNj9+6CuPJj/yzmjGDTy9nZOftNUkiCMCoONV8vBU/3+6dDpXBZfbzG2rMmZk+HLT3h/kN6ilw3pDsz1GMnrDUwQpF/FaMm+3Yhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=multapplied.net;dmarc=pass action=none
 header.from=multapplied.net;dkim=pass header.d=multapplied.net;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multapplied.onmicrosoft.com; s=selector2-multapplied-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG+xwIzTf5V4HoyjnEtmxHO11WYgTxwfoEQt/2GMl/4=;
 b=bJxiVa7YOUfXeJPLlC5xM+LYJMMa9lfPgVDgijuTIJtQtSs4kMq3jA7fCR8map6nVSuw+NBq1b72XbkJqCw1b1NZG1elzHVx9pdjL8AbZdNwV4DvyZ7YKNLPA7r2JdbJOqcv/h83JzCGPFZ1AXvR7eU+8pxEBiFUKcaDNYX7H4o=
Received: from YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM (52.132.66.146) by
 YQBPR0101MB2242.CANPRD01.PROD.OUTLOOK.COM (52.132.67.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Wed, 31 Jul 2019 21:12:24 +0000
Received: from YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bc75:7089:c0da:8fe6]) by YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bc75:7089:c0da:8fe6%3]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 21:12:24 +0000
From:   Brandon Cazander <brandon.cazander@multapplied.net>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation dropping
 packets
Thread-Topic: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation
 dropping packets
Thread-Index: AQHVR+SlYhMACPAu30WCCcWvViK8wA==
Date:   Wed, 31 Jul 2019 21:12:23 +0000
Message-ID: <20190731211211.GA87084@multapplied.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR21CA0057.namprd21.prod.outlook.com
 (2603:10b6:300:db::19) To YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:5::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brandon.cazander@multapplied.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2602:ff93:11ff:120:44d7:d0ff:fe6d:d20f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aca540c8-83f8-461d-6a38-08d715fbc862
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:YQBPR0101MB2242;
x-ms-traffictypediagnostic: YQBPR0101MB2242:
x-microsoft-antispam-prvs: <YQBPR0101MB224220D6E019D840210CC5A69EDF0@YQBPR0101MB2242.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39840400004)(136003)(396003)(366004)(346002)(376002)(199004)(189003)(102836004)(508600001)(46003)(52116002)(186003)(1076003)(2501003)(66446008)(6506007)(386003)(71200400001)(71190400001)(14454004)(486006)(6916009)(86362001)(2616005)(66476007)(66556008)(64756008)(66946007)(476003)(99286004)(5660300002)(44832011)(6116002)(25786009)(81166006)(81156014)(53936002)(7736002)(36756003)(316002)(305945005)(2351001)(33656002)(6512007)(6486002)(8676002)(8936002)(6436002)(2906002)(14444005)(5640700003)(256004)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:YQBPR0101MB2242;H:YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: multapplied.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +4eMollOWmVUGNi1RSs4I/V0WQFxsTnS7LgVhJl1UTpOtRGaYPTHmCgYkHHxvqtpwkto4ShCz3vkWtRk3YPENRmJ31Kz/wxyloqJC1+DHi1A5TgjUpx6WyZkeNSu2NYal9kbjzgZArkDkSRNIdX+YGbr2o501lIPpC/vhglMUyG0VuJeBzIQrt2HHdvXvuo3aEuKAfTmhz9YQk4lH1kW26hUvyYCDP/jc/Ar9FMY3ANqsNRIvazl//H8zS7SygBYrwAGeCT/4QqDsyar1bsBOG4rK5WDCfO4mcGEb8ZCTs39SmdD4Qic5nt/+W9Nl4GyjYYtG7Hh1Zsz2hD7iJpaFuseeEk+6dk6GD8B3pYkFcEb8O1snOiZuo5iru4PcNs3BDC+gAf6rGVIi2xXIahCbE4Ik/RqR/tagV6VVqrrczs=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF71F0F10D0DF045AC9D883445D48440@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: multapplied.net
X-MS-Exchange-CrossTenant-Network-Message-Id: aca540c8-83f8-461d-6a38-08d715fbc862
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 21:12:23.9751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 10c26ea1-9e95-414d-91d0-c44adf533c85
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brandon.cazander@multapplied.net
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB2242
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


I am having an issue with xdpgeneric specifically when using XDP_PASS after
bpf_xdp_adjust_head to pop some headers off. My test environment is qemu us=
ing
virtio_net specifically, but it also happens with e1000 in qemu/physical de=
vices.

On a real NIC (ixgbe), the same program is successfully passing decapsulate=
d
traffic, but fails in the same way when forcing xdpgeneric mode.

Here is the packet outside of my VM, with the IP+UDP+tun header.

# sudo tcpdump -ni ens5-outside -e udp -vvvXc1
tcpdump: listening on ens5-outside, link-type EN10MB (Ethernet), capture si=
ze 262144 bytes
15:54:14.263306 06:54:00:00:00:01 > 06:54:01:00:00:01, ethertype IPv4 (0x08=
00), length 127: (tos 0x0, ttl 255, id 0, offset 0, flags [DF], proto UDP (=
17), length 113)
    172.64.0.108.39999 > 172.64.0.101.7803: [no cksum] UDP, length 85
	0x0000:  4500 0071 0000 4000 ff11 222a ac40 006c  E..q..@..."*.@.l
	0x0010:  ac40 0065 9c3f 1e7b 005d 0000 0145 0000  .@.e.?.{.]...E..
	0x0020:  54e3 6b40 003f 01d5 e8c0 a800 02c0 a801  T.k@.?..........
	0x0030:  0208 002c b1b0 5eb8 f196 ca40 5d00 0000  ...,..^....@]...
	0x0040:  00c8 0304 0000 0000 0010 1112 1314 1516  ................
	0x0050:  1718 191a 1b1c 1d1e 1f20 2122 2324 2526  ..........!"#$%&
	0x0060:  2728 292a 2b2c 2d2e 2f30 3132 3334 3536  '()*+,-./0123456
	0x0070:  37                                       7

My XDP program copies the original ethhdr to the new offset and adjusts the=
 head
forward, and I can see the resulting ICMP packet is valid with tcpdump insi=
de
the VM:

# tcpdump -niens5 icmp -c1 -vXe
tcpdump: listening on ens5, link-type EN10MB (Ethernet), capture size 26214=
4 bytes
15:53:25.602109 06:54:00:00:00:01 > 06:54:01:00:00:01, ethertype IPv4 (0x08=
00), length 98: (tos 0x0, ttl 63, id 35986, offset 0, flags [DF], proto ICM=
P (1), length 84)
    192.168.0.2 > 192.168.1.2: ICMP echo request, id 45150, seq 43683, leng=
th 64
	0x0000:  4500 0054 8c92 4000 3f01 2cc2 c0a8 0002  E..T..@.?.,.....
	0x0010:  c0a8 0102 0800 ed79 b05e aaa3 6dca 405d  .......y.^..m.@]
	0x0020:  0000 0000 3589 0d00 0000 0000 1011 1213  ....5...........
	0x0030:  1415 1617 1819 1a1b 1c1d 1e1f 2021 2223  .............!"#
	0x0040:  2425 2627 2829 2a2b 2c2d 2e2f 3031 3233  $%&'()*+,-./0123
	0x0050:  3435 3637                                4567

Unfortunately, at this point, the packet is dropped in ip_rcv_core. I added=
 a
perf probe on the specific drop line that I'm hitting, and printing the skb=
->len
and len (from ntohs(iph->tot_len)) variables. You can see the obviously wro=
ng
len value below, while a packet capture in the VM does show the correct val=
ue
for tot_len in the IP header.

# perf probe -L ip_rcv_core:64+4 | cat
<ip_rcv_core@/usr/src/debug/kernel-debug-5.2.2-1.2.x86_64/linux-5.2/linux-o=
bj/../net/ipv4/ip_input.c:64>
     64  	if (pskb_trim_rcsum(skb, len)) {
     65  		__IP_INC_STATS(net, IPSTATS_MIB_INDISCARDS);
     66  		goto drop;
         	}

# perf probe -a 'ip_rcv_core:66 skb=3Dskb->len:u32 len=3Dlen:u32'
	swapper     0 [001] 84794.954487: probe:ip_rcv_core: (ffffffffbcbd5a7d) sk=
b=3D84 len=3D4294931717
	swapper     0 [001] 84794.965473: probe:ip_rcv_core: (ffffffffbcbd5a7d) sk=
b=3D84 len=3D4294936833

In contrast, here's what it looks like in XDP native mode (different line n=
umber
but looking):

# perf probe -a 'ip_rcv_core:57 skb=3Dskb->len:u32 len=3Dlen:u32'
	swapper     0 [000]   353.187439: probe:ip_rcv_core: (ffffffffac9dcca7) sk=
b=3D84 len=3D84
	swapper     0 [003]   353.187577: probe:ip_rcv_core: (ffffffffac9dcca7) sk=
b=3D84 len=3D84

Here's the relevant portion of my program where I decapsulate:

static __always_inline int handle_peer_data_ipv4(struct xdp_md *ctx)
{
	void *data, *data_end;
	struct ethhdr *eth, *orig_eth;
	__u32 csum =3D 0;

	data =3D (void *)(unsigned long)ctx->data;
	data_end =3D (void *)(unsigned long)ctx->data_end;

	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct ud=
phdr) + sizeof(struct tunnel_header) > data_end) {
		return XDP_DROP;
	}

	orig_eth =3D data;
	eth =3D data + sizeof(struct iphdr) + sizeof(struct udphdr) + sizeof(struc=
t tunnel_header);
	memcpy(&eth->h_source, &orig_eth->h_source, ETH_ALEN);
	memcpy(&eth->h_dest, &orig_eth->h_dest, ETH_ALEN);
	eth->h_proto =3D __constant_htons(ETH_P_IP);

	/* Decapsulate by removing IP + UDP + tunnel headers */
	if (bpf_xdp_adjust_head(ctx, (int)(sizeof(struct iphdr) + sizeof(struct ud=
phdr) +
					   sizeof(struct tunnel_header)))) {
		return XDP_DROP;
	}

	return XDP_PASS;
}

struct tunnel_header {
	__u8 flags;
};

Kernel is 5.2.2-1-debug, OS is openSUSE Tumbleweed 20190724. For qemu I run=
 with
these arguments for the NICs:

# qemu (...) -netdev tap,br=3Dvm-bridge,id=3Dhostnet1,ifname=3Dens5-outside=
,queues=3D4,vhost=3Don \
-device virtio-net-pci,mq=3Don,vectors=3D9,guest_tso4=3Doff,guest_tso6=3Dof=
f,netdev=3Dhostnet1,id=3Dnet1,mac=3D06:54:01:00:00:01

