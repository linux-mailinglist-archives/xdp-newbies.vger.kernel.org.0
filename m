Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2C51185E3B
	for <lists+xdp-newbies@lfdr.de>; Sun, 15 Mar 2020 16:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgCOPgR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Sun, 15 Mar 2020 11:36:17 -0400
Received: from postout2.mail.lrz.de ([129.187.255.138]:49077 "EHLO
        postout2.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgCOPgR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 15 Mar 2020 11:36:17 -0400
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
        by postout2.mail.lrz.de (Postfix) with ESMTP id 48gNnV2x0VzyTR
        for <xdp-newbies@vger.kernel.org>; Sun, 15 Mar 2020 16:36:14 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -0.584
X-Spam-Level: 
X-Spam-Status: No, score=-0.584 tagged_above=-999 required=5
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, LRZ_CT_PLAIN_ISO8859_1=0.001,
        LRZ_DATE_TZ_0000=0.001, LRZ_DKIM_DESTROY_MTA=0.001,
        LRZ_DMARC_OVERWRITE=0.001, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
        LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_FROM_AP_PHRASE=0.001,
        LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
        LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
        LRZ_FROM_PHRASE=0.001, LRZ_FWD_MS_EX=0.001, LRZ_HAS_CLANG=0.001,
        LRZ_HAS_THREAD_INDEX=0.001, LRZ_HAS_URL_HTTP=0.001,
        LRZ_HAS_URL_HTTP_SINGLE=0.001, LRZ_HAS_X_ORIG_IP=0.001,
        LRZ_MSGID_HL32=0.001, LRZ_RCVD_BADWLRZ_EXCH=0.001,
        LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5, RDNS_NONE=0.793,
        SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
        by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id pYDze45UKane for <xdp-newbies@vger.kernel.org>;
        Sun, 15 Mar 2020 16:36:13 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (BADWLRZ-SWMBX03.ads.mwn.de [IPv6:2001:4ca0:0:108::159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX03", Issuer "BADWLRZ-SWMBX03" (not verified))
        by postout2.mail.lrz.de (Postfix) with ESMTPS id 48gNnT6yLjzyTN
        for <xdp-newbies@vger.kernel.org>; Sun, 15 Mar 2020 16:36:13 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sun, 15 Mar 2020 16:36:13 +0100
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1913.007; Sun, 15 Mar 2020 16:36:13 +0100
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Why does my AF-XDP Socket lose packets whereas a generic linux socket
 doesn't?
Thread-Topic: Why does my AF-XDP Socket lose packets whereas a generic linux
 socket doesn't?
Thread-Index: AQHV+t9JHNkA4/KZDEuYHjwHshnQ1Q==
Date:   Sun, 15 Mar 2020 15:36:13 +0000
Message-ID: <27adfa9b069242a3a0d8e9ccd64e308a@hm.edu>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX03.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.149.13.152]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I am comparing AF-XDP sockets vs Linux Sockets in terms of how many packets they can process without packet-loss (packet-loss is defined as the RTP-sequence number of the current packet is not equal to the RTP-sequence number of the previous packet `+ 1`).

I noticed that my AF-XDP socket program (I can't determine if this problem is related to the kernel program or the user-space program) is losing around `~25` packets per second at around `390.000` packets per second whereas an equivalent program with generic linux sockets doesn't lose any packets.

I implemented a so-called `distributor`-program which loads the XDP-kernel program once, sets up a generic linux socket and adds `setsockopt(IP_ADD_MEMBERSHIP)` to this generic socket for every multicast-address I pass to the program via command line.
After this, the `distributor` loads the filedescriptor of a `BPF_MAP_TYPE_HASH` placed in the XDP-kernel program and inserts routes for the traffic in case a single AF-XDP socket needs to share its umem later on.

The XDP-kernel program then checks for each IPv4/UDP packet if there is an entry in that hash-map. This basically looks like this:

    const struct pckt_idntfy_raw raw = {
        .src_ip = 0, /* not used at the moment */
        .dst_ip = iph->daddr,
        .dst_port = udh->dest,
        .pad = 0
    };
    
    const int *idx = bpf_map_lookup_elem(&xdp_packet_mapping, &raw);

    if(idx != NULL) {
        if (bpf_map_lookup_elem(&xsks_map, idx)) {
            bpf_printk("Found socket @ index: %d!\n", *idx);
            return bpf_redirect_map(&xsks_map, *idx, 0);
        } else {
            bpf_printk("Didn't find connected socket for index %d!\n", *idx);
        }
    }

In case `idx` exists this means that there is a socket sitting behind that index in the `BPF_MAP_TYPE_XSKMAP`.

After doing all that the `distributor` spawns a new process via `fork()` passing all multicast-addresses (including destination port) which should be processed by that process (one process handles one RX-Queue). In case there are not enough RX-Queues, some processes may receive multiple multicast-addresses. This then means that they are going to use `SHARED UMEM`.

I basically oriented my AF-XDP user-space program on this example code: https://github.com/torvalds/linux/blob/master/samples/bpf/xdpsock_user.c

I am using the same `xsk_configure_umem`, `xsk_populate_fill_ring` and `xsk_configure_socket` functions.

Because I figured I don't need maximum latency for this application, I send the process to sleep for a specified time (around `1 - 2ms`) after which it loops through every AF-XDP socket (most of the time it is only one socket) and processes every received packet for that socket, verifying that no packets have been missed:

	while(!global_exit) {
	    nanosleep(&spec, &remaining);

		for(int i = 0; i < cfg.ip_addrs_len; i++) {
			struct xsk_socket_info *socket = xsk_sockets[i];
			if(atomic_exchange(&socket->stats_sync.lock, 1) == 0) {
				handle_receive_packets(socket);
				atomic_fetch_xor(&socket->stats_sync.lock, 1); /* release socket-lock */
			}
		}
	}

In my opinion there is nothing too fancy about this but somehow I lose `~25` packets at around `390.000` packets even though my UMEM is close to 1GB of RAM.

In comparison, my generic linux socket program looks like this (in short):

    int fd = socket(AF_INET, SOCK_RAW, IPPROTO_UDP);

    /* setting some socket options */

    struct sockaddr_in sin;
    memset(&sin, 0, sizeof(struct sockaddr_in));
    sin.sin_family = AF_INET;
    sin.sin_port = cfg->ip_addrs[0]->pckt.dst_port;
    inet_aton(cfg->ip_addrs[0]->pckt.dst_ip, &sin.sin_addr);
    
    if(bind(fd, (struct sockaddr*)&sin, sizeof(struct sockaddr)) < 0) {
        fprintf(stderr, "Error on binding socket: %s\n", strerror(errno));
        return - 1;
    }
    
    ioctl(fd, SIOCGIFADDR, &intf);

The `distributor`-program creates a new process for every given multicast-ip in case generic linux sockets are used (because there are no sophisticated methods such as SHARED-UMEM in generic sockets I don't bother with multiple multicast-streams per process).
Later on I of course join the multicast membership:

    struct ip_mreqn mreq;
    memset(&mreq, 0, sizeof(struct ip_mreqn));
    
    const char *multicast_ip = cfg->ip_addrs[0]->pckt.dst_ip;

    if(inet_pton(AF_INET, multicast_ip, &mreq.imr_multiaddr.s_addr)) {
        /* Local interface address */
        memcpy(&mreq.imr_address, &cfg->ifaddr, sizeof(struct in_addr));
        mreq.imr_ifindex = cfg->ifindex;
        
        if(setsockopt(igmp_socket_fd, IPPROTO_IP, IP_ADD_MEMBERSHIP, &mreq, sizeof(struct ip_mreqn)) < 0) {
            fprintf(stderr, "Failed to set `IP_ADD_MEMBERSHIP`: %s\n", strerror(errno));
            return;
        } else {
            printf("Successfully added Membership for IP: %s\n", multicast_ip);
        }
    }

and start processing packets (not sleeping but in a `busy-loop` like fashion):

    void read_packets_recvmsg_with_latency(struct config *cfg, struct statistic *st, void *buff, const int igmp_socket_fd) {
        char ctrl[CMSG_SPACE(sizeof(struct timeval))];
    
        struct msghdr msg;
        struct iovec iov;
        msg.msg_control = (char*)ctrl;
        msg.msg_controllen = sizeof(ctrl);
        msg.msg_name = &cfg->ifaddr;
        msg.msg_namelen = sizeof(cfg->ifaddr);
    
        msg.msg_iov = &iov;
        msg.msg_iovlen = 1;
        iov.iov_base = buff;
        iov.iov_len = BUFFER_SIZE;
        
        struct timeval time_user, time_kernel;
        struct cmsghdr *cmsg = (struct cmsghdr*)&ctrl;
    
        const int64_t read_bytes = recvmsg(igmp_socket_fd, &msg, 0);
        if(read_bytes == -1) {
            return;
        }
        
        gettimeofday(&time_user, NULL);
        
        if(cmsg->cmsg_level == SOL_SOCKET && cmsg->cmsg_type == SCM_TIMESTAMP) {
            memcpy(&time_kernel, CMSG_DATA(cmsg), sizeof(struct timeval));
        }
        
        if(verify_rtp(cfg, st, read_bytes, buff)) {
            const double timediff = (time_user.tv_sec - time_kernel.tv_sec) * 1000000 + (time_user.tv_usec - time_kernel.tv_usec);
            if(timediff > st->stats.latency_us) {
                st->stats.latency_us = timediff;
            }
        }
    }



    int main(...) {
        ....
        while(!is_global_exit) {
            read_packets_recvmsg_with_latency(&cfg, &st, buffer, igmp_socket_fd);
        }
    }

That's pretty much it.

Please note that in the described use case where I start to lose packets I don't use `SHARED UMEM`, it's just a single RX-Queue receiving a single multicast-stream. In case I process a smaller multicast-stream of around `150.000 pps` - the AF-XDP solution doesn't lose any packets. But it is also the other way around - for around `520.000 pps` on the same RX-Queue (using `SHARED UMEM`) I get a loss of `12.000 pps`.

Any ideas what I am missing?
