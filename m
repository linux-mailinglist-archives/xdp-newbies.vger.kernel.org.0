Return-Path: <xdp-newbies+bounces-4-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2D8002AC
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 05:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98331C20D46
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Dec 2023 04:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381C279EA;
	Fri,  1 Dec 2023 04:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwgDqjWy"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB851729
	for <xdp-newbies@vger.kernel.org>; Thu, 30 Nov 2023 20:51:30 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-423e7836b75so10539031cf.0
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Nov 2023 20:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701406290; x=1702011090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGiFQQPKOzrGhgMfqulmMByqYbc6VW9Q0UpCW3ocXvc=;
        b=MwgDqjWyao8zmJ/5feHWxl/ih0+TKc9R+gq/oub7yhU4NoY1zCKgubhF7lWwkUN3vV
         uvzVN4J/D+0FOapOd1DcEORU2s35bBacJp5rU+JQqhAgpHbconiqAiuMrkXIp1P8TKJK
         sNokynFRsfhFxRXoo+2h3YXyy1Fx2tJjweI7lE3nWu6Hqg9edqFbnxBnVYJsDT9hsYAr
         D4k0YDTLKMsKkSfNSfUjp7QjMG/MDL3899ctxiXheqPBLaauR5X9qpnnRvzFWjrIElVv
         4nb3ZWTUC9Gbs5G3go/hYgpyyHzVUcevWzYt0JfEcgHituDedcv1CBc6EaCWkRPmXbXF
         N48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701406290; x=1702011090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGiFQQPKOzrGhgMfqulmMByqYbc6VW9Q0UpCW3ocXvc=;
        b=hIwvs2yTnHuLjwTvGCJWxn+SF94CoiwqcQHmkx6+5KUPpONJzKklCZdAkaOVKHVLYr
         wFcFx7meGiXpkF3lzIqpZ7+2JE6O3LHn/6YwCh8XLcn+c8HSx8knjTHqQbNZh7l3J9dK
         G2KO5/DKSYrvToPWxTJIIMsRewTl+6jc7VoJ/vh99rIZyW6IxqQZb5B317aI26IssciU
         E8X+3+sjqn8+JgDhL0DvI8Te6H4sIQPDKjoLwMhicFEslyXH4Cp9gaQlpLkHV0aba6ID
         slzeosazBVh5quRotkbonSV3XJfxmqKYKRnX+IQJ96Ug+LRSWn0fmv7DR4rssS8KO9YD
         xH/A==
X-Gm-Message-State: AOJu0YyltIh7FrDVsCer4oRV6aPp+hMNeotu4ssxFH9VAbEbMmaloYiG
	Q9/uzRsUfL5MoaGnveMy4uCtIEwHV5nBlAe8IAT6RRrQcy0=
X-Google-Smtp-Source: AGHT+IFXx/MwfO+x2buaO6dJyB0k5p3sEApA3SLmQYtR3BYn+8jZcKmDvBEodfS8hh1mQPlV5mPrPQpfkzQBVrmaPmk=
X-Received: by 2002:ac8:5143:0:b0:423:ec7b:e628 with SMTP id
 h3-20020ac85143000000b00423ec7be628mr5644025qtn.49.1701406289879; Thu, 30 Nov
 2023 20:51:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAi1gX7owA+Tcxq-titC-h-KPM7Ri-6ZhTNMhrnPq5gmYYwKow@mail.gmail.com>
In-Reply-To: <CAAi1gX7owA+Tcxq-titC-h-KPM7Ri-6ZhTNMhrnPq5gmYYwKow@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 30 Nov 2023 20:51:19 -0800
Message-ID: <CAK3+h2w-k4xYmLWtcmrit1kfWQiSCOY4Zp2--w-iMVqH3zVopQ@mail.gmail.com>
Subject: Re: Bug in xdp synproxy kernel code
To: Minh Le Hoang <minh.lehoang@novoserve.com>
Cc: xdp-newbies@vger.kernel.org, maximmi@nvidia.com, tariqt@nvidia.com, 
	Jeroen van Ingen Schenau <jeroen.vaningenschenau@novoserve.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 9:30=E2=80=AFAM Minh Le Hoang
<minh.lehoang@novoserve.com> wrote:
>
> Hi everyone,
> I am Minh, and currently I am testing the xdp synproxy code from the
> linux kernel source code. To be more specific, I use the file
> xdp_synproxy_kern.c under the directory
> linux-6.5/tools/testing/selftests/bpf/progs .
> I set up the environment testing like this:
>
>     server                      router                     filter
> +--------+                +------------+              +------------+
> |        |                    |              |eth2            |          =
  |
> |        |           eth3 |               |                   |          =
  |
> |        +----------------+            +--------------+            |
> |        |eth1              |               |                 |          =
  |
> |        |                     |               |          eth1|          =
  |
> +--------+                +------+-----+              +------------+
>                                  | eth1                   198.51.100.10/2=
9
>  203.0.113.10/29       |
>                                  |
>                                  |
>                                  |eth1 192.0.2.11/29
>                            +-----+------+
>                            |                |
>                            |                |
>                            |                |
>                            |                |
>                            |                |
>                            |                |
>                            +------------+
>
>                                client
> Router1:
>   eth1: 192.0.2.9/29
>   eth2: 198.51.100.9/29
>   eth3: 203.0.113.9/29
>
> Address of
> client: 192.0.2.11/29 (eth1)
> server: 203.0.113.10/29 (eth1)
> filter: 198.51.100.10/29 (eth1)
>
> All of the virtual machines are Ubuntu 23.04 linux kernel 6.5. In this
> network, all of the packets coming from client to server will be
> routed to go through filter and vice versa. Here are the linux command
> to configure routing table in the router:
>
> # Create extra routing tables on router1 (used for policy-based routing)
> ## Route table with ID 1 and name "outside". This is for lookups on
> the "simulated Internet" side, where the client lives.
>
> echo 1  outside >> /etc/iproute2/rt_tables
>
> ## Route table with ID 2 and name "filter", unused but added to have a
> consistent numbering and naming scheme - it's the interface to the
> filter node or cluster.
>
> echo 2  filter >> /etc/iproute2/rt_tables
>
> ## Route table with ID 3 and name "inside". This is for lookups on the
> "inside" or protected side, where server lives.
>
> echo 3  inside >> /etc/iproute2/rt_tables
>
> # Create default routes in the routing tables on router1. These should
> have the filter node (or cluster) as a nexthop.
>
> ip route add default via 198.51.100.10 dev eth2 table inside
> ip route add default via 198.51.100.10 dev eth2 table outside
>
> For the filter node, here are the linux command to configure it:
> # The filter node(s) need routing entries for the "outside" net and
> the "inside" network via our router.
> # If we don't do this, it would send traffic to the management network.
>
> ip route add 192.0.2.0/29 via 198.51.100.1
> ip route add 203.0.113.0/29 via 198.51.100.1
>
> # And disable redirects
>
> sysctl -w net.ipv4.conf.eth1.send_redirects=3D0
>
> After that, I configure iptables in filter node to use the xdp synproxy c=
ode:
>
> mount -t bpf bpf /sys/fs/bpf
> sysctl -w net.ipv4.tcp_syncookies=3D2
> sysctl -w net.ipv4.tcp_timestamps=3D1
> sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0
> iptables -t raw -I PREROUTING -i eth1 -p tcp -m tcp --syn --dport 80
> -j CT --notrack
> iptables -t filter -A FORWARD \
>    -i eth1 -p tcp -m tcp --dport 80 -m state --state INVALID,UNTRACKED \
>    -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
> iptables -t filter -A FORWARD \
>    -i eth1 -m state --state INVALID -j DROP
>
> and then load the xdp synproxy code:
> ./xdp_synproxy --iface eth1 --ports 80 --single --mss4 1460 --mss6
> 1440 --wscale 7 --ttl 64
>

I have been unable to get it working by attaching  xdp synproxy to
firewall/router without having target/protected destination IP on
firewall/router by adding rules in filter table INPUT chain, your idea
of adding  rules in filter FORWARD  chain solves my puzzle :)

> I use the curl command in the client to get the web page from the
> server for testing. It is strange for me that after the synproxy code
> completes the 3 way handshake tcp with the client, it sends the syn
> packet to the server but it drops the SYNACK packet from the server.
>
I guess maybe originally the synproxy code is not expected to handle
SYNACK from the backend server?

> My colleague Jeroen (jeroen.vaningenschenau@novoserve.com) and I had
> found out that the BUG in this part of code in the function
> tcp_lookup(), it does not pass the SYNACK tcp packet from the server:
>
> unsigned long status =3D ct->status;
> bpf_ct_release(ct);
> if (status & IPS_CONFIRMED_BIT){
>  return XDP_PASS;
>  }
>
> The value of status after the iptables established the tcp connection
> with the client is 8. The value of status enum is defined in the file
> nf_conntrack_common.h in the directory include/uapi/linux/netfilter.
> Here is the part of enum definition:
>
> /* Bitset representing status of connection. */
> enum ip_conntrack_status {
> /* It's an expected connection: bit 0 set.  This bit never changed */
> IPS_EXPECTED_BIT =3D 0,
> IPS_EXPECTED =3D (1 << IPS_EXPECTED_BIT),
>
> /* We've seen packets both ways: bit 1 set.  Can be set, not unset. */
> IPS_SEEN_REPLY_BIT =3D 1,
> IPS_SEEN_REPLY =3D (1 << IPS_SEEN_REPLY_BIT),
>
> /* Conntrack should never be early-expired. */
> IPS_ASSURED_BIT =3D 2,
> IPS_ASSURED =3D (1 << IPS_ASSURED_BIT),
>
> /* Connection is confirmed: originating packet has left box */
> IPS_CONFIRMED_BIT =3D 3,
> IPS_CONFIRMED =3D (1 << IPS_CONFIRMED_BIT),
>
> Thus, both my colleague Jeroen and I believe that this is a bug in the
> xdp synproxy code because it is checking for the 3rd bit but the
> condition checks the 1st bit and 2nd bit. This cause function
> tcp_lookup() to return XDP_TX, and it returns back to the function
> syncookie_part1() and the packet is dropped by this condition in the
> function syncookie_part1():
>
> /* Packet is TCP and doesn't belong to an established connection. */
> if ((hdr->tcp->syn ^ hdr->tcp->ack) !=3D 1){
> return XDP_DROP;
> }
>
> For the solution, we change the checking condition to check for the
> 3rd bit in the tcp_lookup() function:
>
> if (status & IPS_CONFIRMED){
> return XDP_PASS;
> }
>
> Now the xdp synproxy kernel code does not drop the SYNACK tcp packet
> from the server.

Thanks for the analysis, if this is right and confirmed by other
expert, I guess I should also fix it up in the xdp synproxy  code I
ported to bpf-samples repo
https://github.com/xdp-project/bpf-examples/tree/master/xdp-synproxy.

> Kind regard,
> Minh
>

