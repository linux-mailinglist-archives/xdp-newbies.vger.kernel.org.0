Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04412185E2D
	for <lists+xdp-newbies@lfdr.de>; Sun, 15 Mar 2020 16:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgCOP3z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Sun, 15 Mar 2020 11:29:55 -0400
Received: from postout2.mail.lrz.de ([129.187.255.138]:51585 "EHLO
        postout2.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728681AbgCOP3y (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 15 Mar 2020 11:29:54 -0400
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
        by postout2.mail.lrz.de (Postfix) with ESMTP id 48gNf65gvWzyY6
        for <xdp-newbies@vger.kernel.org>; Sun, 15 Mar 2020 16:29:50 +0100 (CET)
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
        with LMTP id 4kl8mXh4Q5fL for <xdp-newbies@vger.kernel.org>;
        Sun, 15 Mar 2020 16:29:50 +0100 (CET)
Received: from BADWLRZ-SWMBB04.ads.mwn.de (BADWLRZ-SWMBB04.ads.mwn.de [IPv6:2001:4ca0:0:108::155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBB04", Issuer "BADWLRZ-SWMBB04" (not verified))
        by postout2.mail.lrz.de (Postfix) with ESMTPS id 48gNf62CVzzyXm
        for <xdp-newbies@vger.kernel.org>; Sun, 15 Mar 2020 16:29:50 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBB04.ads.mwn.de (2001:4ca0:0:108::155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sun, 15 Mar 2020 16:29:49 +0100
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1913.007; Sun, 15 Mar 2020 16:29:49 +0100
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: AW: Shared Umem between processes
Thread-Topic: Shared Umem between processes
Thread-Index: AQHV973HYXLoSjdqpUaKyJTfUanHqKhEhuoAgAATn7z///hnAIAAEfwr///26oCAABGslv//9tqAAALM5wAAAPy6AAAKRuCEAJbscZY=
Date:   Sun, 15 Mar 2020 15:29:49 +0000
Message-ID: <918ba455fdd2445a93fbec3b92bcc204@hm.edu>
References: <fd5e40efd5c1426cb4a5942682407ea2@hm.edu>
 <CAJ+HfNghFctg3L=3QdeoWyqDdj4wP4EKWjYyF01=SmCO5+=32g@mail.gmail.com>
 <a80ec2c07cb9493eafabb9decf479c60@hm.edu>
 <CAJ+HfNjiDCdaQm_PocHXC+gHABAO67b6H+f2pf+ZdHRu2uhMVA@mail.gmail.com>
 <69569dcbc4ce450eb5b2c1905bf11208@hm.edu>
 <CAJ+HfNi5sstcz20EGq2sak0RpYdBwVO5P+NLX8cALBuG_xsnHw@mail.gmail.com>
 <046ac5d67f6a447f98266eacaa2c25e5@hm.edu>
 <CAJ+HfNjNMhxzXTrwKjOZALO5=3UTgQz0ytyAMs5zoGB0HX29DA@mail.gmail.com>
 <87sgidon13.fsf@toke.dk>,<CAJ+HfNgRahagXKiiUCwZMO46cPL--OxXcE3HwpbWAyph9Cjy3Q@mail.gmail.com>,<1f9eeee0897f4cf9951374ae605b03a4@hm.edu>
In-Reply-To: <1f9eeee0897f4cf9951374ae605b03a4@hm.edu>
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

I figured out that this was because I didn't synchronize the access to the umem between the AF-XDP sockets.
I am doing that now in a Round-Robin like fashion as described in `xdpsock_user.c`.

>On Thu, 12 Mar 2020 at 16:48, Gaul, Maximilian <maximilian.gaul@hm.edu>  wrote:

>I don't know if it is appropriate to ask a new question on the same topic in the same thread? In case it is not I will start a new one but I thought it would fit "my story on how to get shared umem working".
>
>I followed  https://github.com/xdp-project/bpf-next/blob/master/samples/bpf/xdpsock_user.c on how to implement shared umem and I think I got it working to some extend.
>
>There are some problems though:
>
>I am processing two multicast streams arriving on the same RX-Queue on two sockets (using shared umem) - each socket is running in its own thread (same process).
>What I noticed: Everything seems to work fine for about 1min or so (even though I am noticing some packet-loss for 530.000 pps) but after that, datarate drops to only half and after one more minute to a fourth.
>
>My first thought on this was that the reserved umem frames by calling `xsk_ring_prod__reserve` are not freed properly (similiar to a memory leak) because of that I decreased the size of the umem to a tenth hoping to see a decrease in packet rate even sooner  - and indeed I did!
>
>Basically what I do is to create a new thread for each socket and pass the `xsk_socket_info`-struct accordingly. I then call `nanosleep` for 2.5ms in a while-loop and process every frame that arrived:
>
>static void* rx_and_process(void *a) {
>
>        struct pthread_arg *arg = (struct pthread_arg*)a;
>        struct config *cfg = arg->cfg;
>        struct pckt_idntfy_stats *pckt = arg->pckt_idntfy;
>        struct xsk_socket_info *xsk_socket = arg->xsk_socket;
>
>        struct timespec spec;
>        spec.tv_sec = 0;
>        spec.tv_nsec = 2500 * 1000;
>
>        struct timespec remaining;
>
>        while(!global_exit) {
>                if(nanosleep(&spec, &remaining) < 0) {
>                        nanosleep(&spec, &remaining);
>                }
>                handle_receive_packets(xsk_socket, fds);
>        }
>
>        return NULL;
>}
>
>`pckt_idntfy_stats` contains information about where the statistics about this multicast-stream should be placed in shared memory.
>
>Processing then happens like this:
>
>static void handle_receive_packets(struct xsk_socket_info *xsk_socket, struct pollfd *fds) {
>        unsigned int rcvd, i;
>        uint32_t idx_rx = 0, idx_fq = 0;
>        int ret;
>
>        rcvd = xsk_ring_cons__peek(&xsk_socket->rx, INT32_MAX, &idx_rx);
>        if (!rcvd) {
>        /* no packets received, go to sleep */
>                return;
>        }
>
>        ret = xsk_ring_prod__reserve(&xsk_socket->umem->fq, rcvd, &idx_fq);
>        if (ret < 0) {
>                fprintf(stderr, "Error: %s\n", strerror(-ret));
>                return;
>        } else if(ret == 0) {
>                printf("NO SPACE LEFT!\n");
>                return;
>        } else if(ret != rcvd) {
>                printf("RET != RCVD\n");
>                return;
>        }
>
>        for (i = 0; i < rcvd; i++) {
>                uint64_t addr = xsk_ring_cons__rx_desc(&xsk_socket->rx, idx_rx)->addr;
>                uint32_t len = xsk_ring_cons__rx_desc(&xsk_socket->rx, idx_rx++)->len;
>                uint64_t orig = xsk_umem__extract_addr(addr);
>
>                addr = xsk_umem__add_offset_to_addr(addr);
>
>                process_packet(xsk_socket, addr, len);
>                *xsk_ring_prod__fill_addr(&xsk_socket->umem->fq, idx_fq++) = orig;
>                
>                xsk_socket->stats.rx_bytes += len;
>        }
>
>        xsk_ring_prod__submit(&xsk_socket->umem->fq, rcvd);
>        xsk_ring_cons__release(&xsk_socket->rx, rcvd);
>        xsk_socket->stats.rx_packets += rcvd;
>}
>
>I am sorry to post all this code here but maybe it helps?
>
>This is how I configured the umem (basically a 1:1 copy from `xdpsock_user.c`:
>
>static struct xsk_umem_info *configure_xsk_umem(void *buffer, uint64_t size) {
>
>        struct xsk_umem_info *umem;
>        struct xsk_umem_config cfg = {
>                .fill_size = XSK_RING_PROD__DEFAULT_NUM_DESCS,
>                .comp_size = XSK_RING_CONS__DEFAULT_NUM_DESCS,
>                .frame_size = FRAME_SIZE,
>                .frame_headroom = XSK_UMEM__DEFAULT_FRAME_HEADROOM,
>                .flags = 0
>        };
>        int ret;
>
>        umem = calloc(1, sizeof(*umem));
>        if (!umem) {
>                fprintf(stderr, "Error while allocating umem: %s\n", strerror(errno));
>                exit(1);
>        }
>
>        ret = xsk_umem__create(&umem->umem, buffer, size, &umem->fq, &umem->cq, &cfg);
>        if (ret) {
>                fprintf(stderr, "`xsk_umem__create` returned: %s\n", strerror(-ret));
>                exit(1);
>        }
>
>        umem->buffer = buffer;
>        return umem;
>}
>
>and after that I call:
>
>static void xsk_populate_fill_ring(struct xsk_umem_info *umem) {
>        int ret, i;
>        uint32_t idx;
>
>        ret = xsk_ring_prod__reserve(&umem->fq, XSK_RING_PROD__DEFAULT_NUM_DESCS, &idx);
>        if (ret != XSK_RING_PROD__DEFAULT_NUM_DESCS) {
>                fprintf(stderr, "Failed to reserve prod ring: %s\n", strerror(errno));
>                exit(1);
>        }
>        for (i = 0; i < XSK_RING_PROD__DEFAULT_NUM_DESCS; i++) {
>                *xsk_ring_prod__fill_addr(&umem->fq, idx++) = i * FRAME_SIZE;
>        }
>        xsk_ring_prod__submit(&umem->fq, XSK_RING_PROD__DEFAULT_NUM_DESCS);
>}
>
>And sockets are created this way:
>
>static struct xsk_socket_info *xsk_configure_socket(struct xsk_umem_info *umem, struct config *cfg, bool rx, bool tx) {
>        struct xsk_socket_config xsk_socket_cfg;
>         struct xsk_socket_info *xsk;
>        struct xsk_ring_cons *rxr;
>        struct xsk_ring_prod *txr;
>        int ret;
>
>        xsk = calloc(1, sizeof(*xsk));
>        if (!xsk) {
>                fprintf(stderr, "xsk `calloc` failed: %s\n", strerror(errno));
>                exit(1);
>        }
>
>        xsk->umem = umem;
>        xsk_socket_cfg.rx_size = XSK_RING_CONS__DEFAULT_NUM_DESCS;
>        xsk_socket_cfg.tx_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
>        if (cfg->ip_addrs_len > 1) {
>                xsk_socket_cfg.libbpf_flags = XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD;
>        } else {
>                xsk_socket_cfg.libbpf_flags = 0;
>        }
>        xsk_socket_cfg.xdp_flags = cfg->xdp_flags;
>        xsk_socket_cfg.bind_flags = cfg->xsk_bind_flags;
>
>        rxr = rx ? &xsk->rx : NULL;
>        txr = tx ? &xsk->tx : NULL;
>        ret = xsk_socket__create(&xsk->xsk, cfg->ifname_buf, cfg->xsk_if_queue, umem->umem, rxr, txr, &xsk_socket_cfg);
>        if (ret) {
>                fprintf(stderr, "`xsk_socket__create` returned error: %s\n", strerror(errno));
>                exit(-ret);
>        }
>
>        return xsk;
>}
>
>As far as I've seen from `xdpsock_user.c` there is no special handling required by the sockets who are using shared umem? What am I missing?
>
>Best regards
>
>Max    
