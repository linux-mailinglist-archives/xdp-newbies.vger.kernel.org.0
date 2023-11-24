Return-Path: <xdp-newbies+bounces-2-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C77F7A5F
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 Nov 2023 18:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72A81C2087F
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 Nov 2023 17:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EFF364D5;
	Fri, 24 Nov 2023 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=novoserve.com header.i=@novoserve.com header.b="SZc0Ezwa"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6342DB0
	for <xdp-newbies@vger.kernel.org>; Fri, 24 Nov 2023 09:30:24 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5c8c8f731aaso21501117b3.0
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Nov 2023 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=novoserve.com; s=google; t=1700847023; x=1701451823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1CpCE790jfuIejibQy26GYUdt/xB/AnqQAPtjg14abw=;
        b=SZc0Ezwab7PYvlMLt+2SVPygRkTArkON4+STD5NJcgA3YUf1nFK1QtKNDmEnK4FYxK
         mzZ96WsN2AK4gIDuJSJ8EZyU5vroIBHY0KQCUkj71/3yaLXFRvtLNw+wosLSHNSQfP/+
         bwd1IyOPSmUKS/WUAAqi3e6WXJpWuRtTl5O9ee1nQDT3AahxQex+/4xv4CCMpeMHJgGw
         KNYFL4gul4WSuPG6NjroHmfhcwZ+ws8jG4ZmfT3mXAt/8WeaArphPnb3ieK7ylMSXVLb
         QB6bCAbnBJHPBajes9Qx0qcJ4Jx8a9mXiwBtPh3SxkAkXQlSgsjUA9R3/i9RF0NQiagD
         9rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700847023; x=1701451823;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CpCE790jfuIejibQy26GYUdt/xB/AnqQAPtjg14abw=;
        b=Z1E1420KkXJ/dE/0Ce+URsTbig0l+4SrDuQRw56/gTrKHS3uvvUr6kL2NNJ+qDAaGV
         HySEXfJKjzqU8GKzBd76u0VIs1vYENKsT3hasLTrZA2tGUibY8SSbfySmuXc00WJnsbZ
         R6voAuyJlC/p4UpMNJ7u4Mn0fwFP0374MACyGi+aK2fUUf/XkJ0HEXZfXV0HDt709uvf
         c0yDE1XtIuB7MrDTaXVSaDt0E73ug2uAGxqspBmY5kHIf7Kf7jW7Qp1H/lm9W3IKJFO1
         NaE4/HRevwQtSvcIgm1HjEPS9ayyOgEHOgOn69vBiebmeJu+oUnRXX3DvMEJLQhNSaTW
         w2ww==
X-Gm-Message-State: AOJu0Yy0vj6aUmUlTch0npIyitt3OXqI3tUf1AZcAMhrRZJnQAv6wAcb
	jQRA55SL9G4xD55mNUbbmNOZUkhnXyeIKLIwQSBIxscpuiRIo0cMas9/TA==
X-Google-Smtp-Source: AGHT+IHVz2BTiBJdVENKU/2hp8iflc6oOG9aSJR5efNTT6miQGQSbqIJh6z7ZZMZGeVrTM5fgEc5fI6jKP5mWjXI5Ms=
X-Received: by 2002:a25:bf85:0:b0:db3:5c00:ac28 with SMTP id
 l5-20020a25bf85000000b00db35c00ac28mr3246475ybk.40.1700847023012; Fri, 24 Nov
 2023 09:30:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Minh Le Hoang <minh.lehoang@novoserve.com>
Date: Fri, 24 Nov 2023 18:30:12 +0100
Message-ID: <CAAi1gX7owA+Tcxq-titC-h-KPM7Ri-6ZhTNMhrnPq5gmYYwKow@mail.gmail.com>
Subject: Bug in xdp synproxy kernel code
To: xdp-newbies@vger.kernel.org, maximmi@nvidia.com, tariqt@nvidia.com
Cc: Jeroen van Ingen Schenau <jeroen.vaningenschenau@novoserve.com>
Content-Type: text/plain; charset="UTF-8"

Hi everyone,
I am Minh, and currently I am testing the xdp synproxy code from the
linux kernel source code. To be more specific, I use the file
xdp_synproxy_kern.c under the directory
linux-6.5/tools/testing/selftests/bpf/progs .
I set up the environment testing like this:

    server                      router                     filter
+--------+                +------------+              +------------+
|        |                    |              |eth2            |            |
|        |           eth3 |               |                   |            |
|        +----------------+            +--------------+            |
|        |eth1              |               |                 |            |
|        |                     |               |          eth1|            |
+--------+                +------+-----+              +------------+
                                 | eth1                   198.51.100.10/29
 203.0.113.10/29       |
                                 |
                                 |
                                 |eth1 192.0.2.11/29
                           +-----+------+
                           |                |
                           |                |
                           |                |
                           |                |
                           |                |
                           |                |
                           +------------+

                               client
Router1:
  eth1: 192.0.2.9/29
  eth2: 198.51.100.9/29
  eth3: 203.0.113.9/29

Address of
client: 192.0.2.11/29 (eth1)
server: 203.0.113.10/29 (eth1)
filter: 198.51.100.10/29 (eth1)

All of the virtual machines are Ubuntu 23.04 linux kernel 6.5. In this
network, all of the packets coming from client to server will be
routed to go through filter and vice versa. Here are the linux command
to configure routing table in the router:

# Create extra routing tables on router1 (used for policy-based routing)
## Route table with ID 1 and name "outside". This is for lookups on
the "simulated Internet" side, where the client lives.

echo 1  outside >> /etc/iproute2/rt_tables

## Route table with ID 2 and name "filter", unused but added to have a
consistent numbering and naming scheme - it's the interface to the
filter node or cluster.

echo 2  filter >> /etc/iproute2/rt_tables

## Route table with ID 3 and name "inside". This is for lookups on the
"inside" or protected side, where server lives.

echo 3  inside >> /etc/iproute2/rt_tables

# Create default routes in the routing tables on router1. These should
have the filter node (or cluster) as a nexthop.

ip route add default via 198.51.100.10 dev eth2 table inside
ip route add default via 198.51.100.10 dev eth2 table outside

For the filter node, here are the linux command to configure it:
# The filter node(s) need routing entries for the "outside" net and
the "inside" network via our router.
# If we don't do this, it would send traffic to the management network.

ip route add 192.0.2.0/29 via 198.51.100.1
ip route add 203.0.113.0/29 via 198.51.100.1

# And disable redirects

sysctl -w net.ipv4.conf.eth1.send_redirects=0

After that, I configure iptables in filter node to use the xdp synproxy code:

mount -t bpf bpf /sys/fs/bpf
sysctl -w net.ipv4.tcp_syncookies=2
sysctl -w net.ipv4.tcp_timestamps=1
sysctl -w net.netfilter.nf_conntrack_tcp_loose=0
iptables -t raw -I PREROUTING -i eth1 -p tcp -m tcp --syn --dport 80
-j CT --notrack
iptables -t filter -A FORWARD \
   -i eth1 -p tcp -m tcp --dport 80 -m state --state INVALID,UNTRACKED \
   -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
iptables -t filter -A FORWARD \
   -i eth1 -m state --state INVALID -j DROP

and then load the xdp synproxy code:
./xdp_synproxy --iface eth1 --ports 80 --single --mss4 1460 --mss6
1440 --wscale 7 --ttl 64

I use the curl command in the client to get the web page from the
server for testing. It is strange for me that after the synproxy code
completes the 3 way handshake tcp with the client, it sends the syn
packet to the server but it drops the SYNACK packet from the server.

My colleague Jeroen (jeroen.vaningenschenau@novoserve.com) and I had
found out that the BUG in this part of code in the function
tcp_lookup(), it does not pass the SYNACK tcp packet from the server:

unsigned long status = ct->status;
bpf_ct_release(ct);
if (status & IPS_CONFIRMED_BIT){
 return XDP_PASS;
 }

The value of status after the iptables established the tcp connection
with the client is 8. The value of status enum is defined in the file
nf_conntrack_common.h in the directory include/uapi/linux/netfilter.
Here is the part of enum definition:

/* Bitset representing status of connection. */
enum ip_conntrack_status {
/* It's an expected connection: bit 0 set.  This bit never changed */
IPS_EXPECTED_BIT = 0,
IPS_EXPECTED = (1 << IPS_EXPECTED_BIT),

/* We've seen packets both ways: bit 1 set.  Can be set, not unset. */
IPS_SEEN_REPLY_BIT = 1,
IPS_SEEN_REPLY = (1 << IPS_SEEN_REPLY_BIT),

/* Conntrack should never be early-expired. */
IPS_ASSURED_BIT = 2,
IPS_ASSURED = (1 << IPS_ASSURED_BIT),

/* Connection is confirmed: originating packet has left box */
IPS_CONFIRMED_BIT = 3,
IPS_CONFIRMED = (1 << IPS_CONFIRMED_BIT),

Thus, both my colleague Jeroen and I believe that this is a bug in the
xdp synproxy code because it is checking for the 3rd bit but the
condition checks the 1st bit and 2nd bit. This cause function
tcp_lookup() to return XDP_TX, and it returns back to the function
syncookie_part1() and the packet is dropped by this condition in the
function syncookie_part1():

/* Packet is TCP and doesn't belong to an established connection. */
if ((hdr->tcp->syn ^ hdr->tcp->ack) != 1){
return XDP_DROP;
}

For the solution, we change the checking condition to check for the
3rd bit in the tcp_lookup() function:

if (status & IPS_CONFIRMED){
return XDP_PASS;
}

Now the xdp synproxy kernel code does not drop the SYNACK tcp packet
from the server.
Kind regard,
Minh

