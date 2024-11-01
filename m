Return-Path: <xdp-newbies+bounces-159-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D599B8DC7
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Nov 2024 10:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8B01C228CC
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Nov 2024 09:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240CB15A86A;
	Fri,  1 Nov 2024 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRmLeEZh"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A5158868
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Nov 2024 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453038; cv=none; b=rM83T9P5TZlHT6xsSIltDCVisdNcW8KgShzL36jCG5/Wf2qVfy29t9H5jbkcIvLDm955kE9hyGnq8KcUmtQ8/VKw5GOA46itHptYRgK46+P3D2LP058zI3RvFkfmPPNJaUAJEvsNdfUB4fHn4dbYR+z/YBlmLyL8YV9mMIvFrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453038; c=relaxed/simple;
	bh=cVRZCVTAwmL1Nl88zpgDu/cxanX0ouGrolzZ/crP4UE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CnpUX/im83MVENzTMl+MkJJ72+GWzM0MehEPJb+b5HIbJyRNli9L2wVwVpRUuoq8GnNbvltiiCOsX+4pQpC6yG8cSM/+EGodlSJPezmqbiMpTTc3LHGVYS9OjvqD/b7PDWLBWOuEogn2jba957edZwNSiUS2LsgEPtwZ5wQESA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRmLeEZh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so2209965a12.0
        for <xdp-newbies@vger.kernel.org>; Fri, 01 Nov 2024 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730453033; x=1731057833; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s197JfehcUUCJsPe1glA+JTP1d81oQ7iJEBpyKS4Rik=;
        b=mRmLeEZhw4ZDZiMlYQG9CgaB4zTfMmZRfYNYX6f39lN+Kdf0llgfFElzWClRgWGPuC
         UDObRJu3xRe4oBbC7FG+w0n1WWv7l55aGt0Jk9sJQu2LhQogqbtkOeBp6zaIwFS7NbA6
         VjpB2qjoMbXt24xb0THUtcJVKIU3tumBCXTLM9jZHMrhvNBx4gSUk6OiDXAF9FOVf/AU
         W21bV6vft2zOUrInN2j6h0YrMe9i/PSFZ6msZtgjul7T+gnihUxnVgHvhbMNCtDY1lWr
         YdkG43JcvVKUvkXee7lAjIv/5TzNtRf4JxoNA2F3OAKNxYlgqTfpXP2/LFs/eS5KtMJ7
         W0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730453033; x=1731057833;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s197JfehcUUCJsPe1glA+JTP1d81oQ7iJEBpyKS4Rik=;
        b=EgbVmG4KPp0c7Q9cQ6a3HXHqVMC1uAJJbWZmc8hk/g+zuO2UUrCvf2RDOyh7+I0T5/
         fB8u3oWlkiZoxJY2/klow4fKW31gKLGB8s8bd0F81g59i4cgt/QJPpfS0I0/ADnHTyxh
         l80b+ZF3XDwh8reX9cpVRzFdpK3F0lnNr0PC5PGqaic5InwGkDXSpGcmvbbwToC2U9zs
         qC+dx4AjT+FuKgEoaN4CnlkM7VUs9TDD4RKeUdL3ImjfNKQlEGItOAKmuNHDSTOSfXl7
         +xHP8a/ZHWpWoFSZazRHax8vxLYEsHXQi4nQs4hPo2uYoFb/anvmm99hiv52PaHPPLod
         IfJg==
X-Gm-Message-State: AOJu0YzkjSyROe3YcqZVBLwEGAaYpehPpQBQfoYamHgs2i5tWFAmbxtp
	UQeB2wFHSo60ULK6fdfcquW6wDSyBCf3zPNQuJmjfaxsUaIzMVyqbSMANQ==
X-Google-Smtp-Source: AGHT+IFimvvjafSsN1Xk37waPTLlQeBHCWRPCRYGMTc/HepZgtFI55PUMQSAu9FPXTw0o8R0AnnZJA==
X-Received: by 2002:a05:6402:1d4f:b0:5c8:9548:f28b with SMTP id 4fb4d7f45d1cf-5ceb9263fb0mr1825421a12.11.1730453033102;
        Fri, 01 Nov 2024 02:23:53 -0700 (PDT)
Received: from ?IPV6:2001:4c3c:4205:4000:3145:1cae:1f54:c8f5? ([2001:4c3c:4205:4000:3145:1cae:1f54:c8f5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7e95f7sm1321571a12.90.2024.11.01.02.23.51
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 02:23:51 -0700 (PDT)
Message-ID: <c195fc7c-58c1-45e1-9b18-8d858095cb1a@gmail.com>
Date: Fri, 1 Nov 2024 10:23:51 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xdp-newbies@vger.kernel.org
Content-Language: en-US
From: Thom Veldhuis <thomveldhuis03@gmail.com>
Subject: XDP not working as expected when using AF_XDP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

I'm having an issue with my XDP program where the filtering isn't 
working as expected when loaded through my user-space program.

I'm working on a project to optimize UDP traffic using AF_XDP. My goal 
is to filter the traffic using an XDP program and redirect it to my 
user-space application (using BPF_MAP_TYPE_XSKMAP) where I then can 
process the packets. However I'm running into the problem that my filter 
isn't working when loading it with my user-space application, which 
leads to receiving all traffic instead of only the UDP packets that I 
want. But when I tried loading it using xdp-loader it does work and 
filter out the correct traffic.

The setup I'm using is in virtualbox, OS: Debian GNU/Linux 12 
(bookworm), kernel: 6.1.0-25-amd64, and using the virtio-net driver for 
my network interface. To test it I'm using a different VM to send ping 
requests and the UDP packets that I want to filter for in my XDP program.

I've tried many different things from the examples (like those from the 
XDP-tutorial, basic03-04 and advanced03 in particular) that I could 
find, but none of those options seem to work for my implementation. 
Changing the XDP_MODE isn't an option because the other modes made it 
fall back to the SKB mode.

I'm wondering if anyone has an idea on what I'm doing wrong or what I 
can do differently to make it work. Here are some relevant snippets, 
with some of it coming directly from the xdpsock.c example in the 
bpf-examples repo. For the creation of the UMEM, sockets and such I'm 
using libbpf and libxdp by recommendation of the documentation on 
kernel.org.

Has anyone encountered similar issues or have any ideas on how to fix 
the problem that I'm having?

The XDP program:
```
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <xdp/xdp_helpers.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <linux/udp.h>
#include <bpf/bpf_endian.h>
#include <linux/in.h>

#define TARGET_PORT 42795

struct {
     __uint(type, BPF_MAP_TYPE_XSKMAP);
     __type(key, int);
     __type(value, int);
     __uint(max_entries, 1);
} xsks_map SEC(".maps");

struct {
     __uint(priority, 10);
     __uint(XDP_PASS, 1);
     __uint(XDP_DROP, 1);
} XDP_RUN_CONFIG(xdp_sock_prog);

SEC("xdp")
int xdp_sock_prog(struct xdp_md *ctx)
{
     void *data_end = (void *)(long)ctx->data_end;
     void *data = (void *)(long)ctx->data;
     bpf_printk("Processing packet, size: %d\n", data_end - data);

     struct ethhdr *eth = data;
     if ((void *)(eth + 1) > data_end) {
         bpf_printk("invalid size of packet");
         return XDP_PASS;
     }

     if (eth->h_proto != __bpf_htons(ETH_P_IP)) {
         bpf_printk("no IP packet");
         return XDP_PASS;
     }

     struct iphdr *ip = (void *)(eth + 1);
     if ((void *)(ip + 1) > data_end) {
         bpf_printk("invalid IP packet");
         return XDP_PASS;
     }
     bpf_printk("Protocol: %d\n", ip->protocol);

     if (ip->protocol != IPPROTO_UDP) {
         bpf_printk("No UDP packet");
         return XDP_PASS;
     }

     struct udphdr *udp = (void *)(ip + 1);
     if ((void *)(udp + 1) > data_end) {
         bpf_printk("invalid UDP packet");
         return XDP_PASS;
     }

     if (ip->protocol == IPPROTO_UDP && __bpf_ntohs(udp->dest) == 
TARGET_PORT) {
         int index = ctx->rx_queue_index;
         bpf_printk("found UDP packet with correct port!");

         if (bpf_map_lookup_elem(&xsks_map, &index)) {
             bpf_printk("Redirecting to map");
             long ret = bpf_redirect_map(&xsks_map, index, 0);
             bpf_printk("redirect return val: %lu", ret);
             return ret;
         }
     }

     bpf_printk("Passing to the kernel");
     return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
```
The code that loads the XDP program:
```
#include <bpf/libbpf.h>
#include <xdp/xsk.h>
#include <xdp/libxdp.h>
#include <net/if.h>
#include <errno.h>
#include <unistd.h>

int attach_program(struct xdp_program **prog, struct xsk_socket_info 
*socket_info, const char *ifname) {
     struct bpf_object *bpf_obj;
     int err, map_fd;
     int queue_id = 0;

     *prog = xdp_program__open_file("bin/xdp_prog.o", "xdp", NULL);
     err = libxdp_get_error(*prog);
     if (err) {
         perror("Failed to open XDP program");
         return -1;
     }

     int ifindex = if_nametoindex(ifname);
     if (ifindex == 0) {
         perror("Interface index");
         return -1;
     }

     err = xdp_program__attach(*prog, ifindex, XDP_MODE_SKB, 0);
     if (err) {
         perror("Failed to attach XDP program");
         xdp_program__close(*prog);
         return err;
     }

     bpf_obj = xdp_program__bpf_obj(*prog);
     map_fd = bpf_object__find_map_fd_by_name(bpf_obj, "xsks_map");
     printf("found map fd, %d\n", map_fd);
     if (map_fd < 0) {
         perror("Failed to get map fd from bpf object");
         xdp_program__close(*prog);
         return map_fd;
     }
     socket_info->xdp_map_fd = map_fd;

     int xsk_fd = xsk_socket__fd(socket_info->xsk);
     int ret = bpf_map_update_elem(map_fd, &queue_id, &xsk_fd, BPF_ANY);
     if (ret < 0) {
         perror("Error updating BPF map element");
         return ret;
     }

     return 0;
}

void detach_program(struct xdp_program *prog, const char *ifname) {
     int ifindex = if_nametoindex(ifname);
     if (ifindex == 0) {
         perror("Interface index");
     }

     int err = xdp_program__detach(prog, ifindex, XDP_MODE_SKB, 0);
     if (err == -ENOENT) {
         perror("No XDP program attached");
     } else if (err) {
         perror("Failed to detach XDP program");
     }
     xdp_program__close(prog);
}
```
The code I'm using for receiving packets:
```
static void xsk_receive_packet(struct xsk_socket_info *socket_info) {
     uint32_t idx_rx, idx_fq, recvd = 0;
     int ret;

     recvd = xsk_ring_cons__peek(&socket_info->rx, 64, &idx_rx);
     if (!recvd) {
         if (xsk_ring_prod__needs_wakeup(&socket_info->umem->fq)) {
             recvfrom(xsk_socket__fd(socket_info->xsk), NULL, 0, 
MSG_DONTWAIT, NULL, NULL);
         }
         return;
     }

     ret = xsk_ring_prod__reserve(&socket_info->umem->fq, recvd, &idx_fq);
     while (ret != recvd) {
         if (ret < 0)
             return;
         if (xsk_ring_prod__needs_wakeup(&socket_info->umem->fq)) {
             recvfrom(xsk_socket__fd(socket_info->xsk), NULL, 0, 
MSG_DONTWAIT, NULL, NULL);
         }
         ret = xsk_ring_prod__reserve(&socket_info->umem->fq, recvd, 
&idx_fq);
     }

     for (size_t i = 0; i < recvd; i++) {
         const struct xdp_desc *desc = 
xsk_ring_cons__rx_desc(&socket_info->rx, idx_rx++);
         uint64_t addr = desc->addr;
         uint32_t len = desc->len;
         uint64_t orig = xsk_umem__extract_addr(addr);

         addr = xsk_umem__add_offset_to_addr(addr);
         char *pkt = xsk_umem__get_data(socket_info->umem->buffer, addr);
         print_hex(pkt, len);
         *xsk_ring_prod__fill_addr(&socket_info->umem->fq, idx_fq++) = orig;
     }
     xsk_ring_prod__submit(&socket_info->umem->fq, recvd);
     xsk_ring_cons__release(&socket_info->rx, recvd);
}

void xsk_receive_packets(struct xsk_socket_info *socket_info) {
     int ret;
     struct pollfd fds = {};
     fds.fd = xsk_socket__fd(socket_info->xsk);
     fds.events = POLLIN;
     unsigned int timeout_seconds = 100;
     time_t start = time(NULL);
     while(1) {
         time_t current = time(NULL);
         if (difftime(current, start) >= timeout_seconds) {
             printf("Timed out\n");
             break;
         }
         ret = poll(&fds, 1, 0);
         if (ret <= 0)
             continue;
         xsk_receive_packet(socket_info, and_send);
     }
}

```
Which are called in my main like this:
```
int main(void) {
     struct xsk_umem_info *umem_info;
     struct xsk_socket_info *socket_info;
     struct xdp_program *program = NULL;
     struct bpf_object *bpf_obj;
     int res;

     res = xsk_configure_umem(&umem_info, BUFFER_SIZE);
     if (res != 0) {
         perror("Configure UMEM");
         exit(EXIT_FAILURE);
     }

     res = xsk_create_socket(&socket_info, UP_INTERFACE, umem_info);
     if (res != 0) {
         perror("Configure XDP socket");
         exit(EXIT_FAILURE);
     }

     res = attach_program(&program, socket_info, UP_INTERFACE);
     if (res != 0) {
         perror("Attaching XDP program");
         exit(EXIT_FAILURE);
     }

     xsk_fill_ring(socket_info);
     xsk_receive_packets(socket_info, 1);

     detach_program(program, UP_INTERFACE);


     return 0;
}
```
This is the output I'm getting from the bpf_printk and my program
```
         upstream-4960    [000] ..s11 16329.727555: bpf_trace_printk: 
Processing packet, size: 98

         upstream-4960    [000] ..s11 16329.727655: bpf_trace_printk: 
Protocol: 1

         upstream-4960    [000] ..s11 16329.727656: bpf_trace_printk: No 
UDP packet
         upstream-4960    [000] ..s11 16329.727997: bpf_trace_printk: 
Processing packet, size: 98

         upstream-4960    [000] ..s11 16329.727997: bpf_trace_printk: 
Protocol: 1

         upstream-4960    [000] ..s11 16329.727997: bpf_trace_printk: No 
UDP packet
         upstream-4960    [000] ..s11 16329.785383: bpf_trace_printk: 
Processing packet, size: 980

         upstream-4960    [000] ..s11 16329.785498: bpf_trace_printk: 
Protocol: 17

         upstream-4960    [000] ..s11 16329.785499: bpf_trace_printk: 
found UDP packet with correct port!
         upstream-4960    [000] ..s11 16329.785499: bpf_trace_printk: 
Redirecting to map
         upstream-4960    [000] ..s11 16329.785500: bpf_trace_printk: 
redirect return val: 4
         upstream-4960    [000] ..s11 16329.785505: bpf_trace_printk: 
Processing packet, size: 590

         upstream-4960    [000] ..s11 16329.785506: bpf_trace_printk: 
Protocol: 1

         upstream-4960    [000] ..s11 16329.785506: bpf_trace_printk: No 
UDP packet
         upstream-4960    [000] ..s11 16329.891559: bpf_trace_printk: 
Processing packet, size: 60

         upstream-4960    [000] ..s11 16329.891658: bpf_trace_printk: no 
IP packet
         upstream-4960    [000] ..s11 16329.891959: bpf_trace_printk: 
Processing packet, size: 42

         upstream-4960    [000] ..s11 16329.891959: bpf_trace_printk: no 
IP packet
         upstream-4960    [000] ..s11 16330.286560: bpf_trace_printk: 
Processing packet, size: 980

         upstream-4960    [000] ..s11 16330.286656: bpf_trace_printk: 
Protocol: 17

         upstream-4960    [000] ..s11 16330.286657: bpf_trace_printk: 
found UDP packet with correct port!
         upstream-4960    [000] ..s11 16330.286657: bpf_trace_printk: 
Redirecting to map
         upstream-4960    [000] ..s11 16330.286658: bpf_trace_printk: 
redirect return val: 4
         upstream-4960    [000] ..s11 16330.286822: bpf_trace_printk: 
Processing packet, size: 590

         upstream-4960    [000] ..s11 16330.286822: bpf_trace_printk: 
Protocol: 1

         upstream-4960    [000] ..s11 16330.286822: bpf_trace_printk: No 
UDP packet
         upstream-4960    [000] ..s11 16330.728671: bpf_trace_printk: 
Processing packet, size: 98

         upstream-4960    [000] ..s11 16330.728758: bpf_trace_printk: 
Protocol: 1

         upstream-4960    [000] ..s11 16330.728758: bpf_trace_printk: No 
UDP packet
         upstream-4960    [000] ..s11 16330.729036: bpf_trace_printk: 
Processing packet, size: 98

         upstream-4960    [000] ..s11 16330.729036: bpf_trace_printk: 
Protocol: 1

         upstream-4960    [000] ..s11 16330.729037: bpf_trace_printk: No 
UDP packet
         upstream-4960    [000] ..s11 16330.787123: bpf_trace_printk: 
Processing packet, size: 980

         upstream-4960    [000] ..s11 16330.787234: bpf_trace_printk: 
Protocol: 17

         upstream-4960    [000] ..s11 16330.787235: bpf_trace_printk: 
found UDP packet with correct port!
         upstream-4960    [000] ..s11 16330.787235: bpf_trace_printk: 
Redirecting to map
         upstream-4960    [000] ..s11 16330.787236: bpf_trace_printk: 
redirect return val: 4
         upstream-4960    [000] ..s11 16330.787633: bpf_trace_printk: 
Processing packet, size: 590

         upstream-4960    [000] ..s11 16330.787712: bpf_trace_printk: 
Protocol: 1

         upstream-4960    [000] ..s11 16330.787712: bpf_trace_printk: No 
UDP packet
      ksoftirqd/0-14      [000] ..s11 16330.946334: bpf_trace_printk: 
Processing packet, size: 42

      ksoftirqd/0-14      [000] ..s11 16330.946598: bpf_trace_printk: no 
IP packet
      ksoftirqd/0-14      [000] ..s11 16330.946606: bpf_trace_printk: 
Processing packet, size: 60

      ksoftirqd/0-14      [000] ..s11 16330.946606: bpf_trace_printk: no 
IP packet
         upstream-4960    [000] ..s11 16331.289930: bpf_trace_printk: 
Processing packet, size: 980

         upstream-4960    [000] ..s11 16331.290022: bpf_trace_printk: 
Protocol: 17

         upstream-4960    [000] ..s11 16331.290023: bpf_trace_printk: 
found UDP packet with correct port!
         upstream-4960    [000] ..s11 16331.290024: bpf_trace_printk: 
Redirecting to map
         upstream-4960    [000] ..s11 16331.290024: bpf_trace_printk: 
redirect return val: 4
```
And the user-space program (with most of the bytes removed for brevity):
```
data [len: 98]: 0x080x000x270x2d0....
data [len: 98]: 0x080x000x270xfffffff40.....
data [len: 980]: 0x080x000x270x2d0xfffff....
data [len: 590]: 0x080x000x270xfff....
data [len: 980]: 0x080x000x270x2d0xff....
data [len: 98]: 0x080x000x270x2d0xffffffeb...
data [len: 98]: 0x080x000x270xfffffff40xf....
data [len: 980]: 0x080x000x270x2d0xffffffe....
```

I was thinking of posting it on StackOverflow but this seemed a more 
appropriate place to ask for advice.

Thanks in advance for any advice,
Thom

