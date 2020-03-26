Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CB3193EE5
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Mar 2020 13:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgCZMav convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 26 Mar 2020 08:30:51 -0400
Received: from postout2.mail.lrz.de ([129.187.255.138]:46041 "EHLO
        postout2.mail.lrz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgCZMav (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Mar 2020 08:30:51 -0400
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
        by postout2.mail.lrz.de (Postfix) with ESMTP id 48p48Q6y0Zzyfn;
        Thu, 26 Mar 2020 13:30:46 +0100 (CET)
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
        LRZ_HAS_SPF=0.001, LRZ_HAS_THREAD_INDEX=0.001, LRZ_HAS_URL_HTTP=0.001,
        LRZ_HAS_X_ORIG_IP=0.001, LRZ_MSGID_HL32=0.001,
        LRZ_RCVD_BADWLRZ_EXCH=0.001, LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5,
        RDNS_NONE=0.793, SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
        by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
        with LMTP id s_vVujrX_UzC; Thu, 26 Mar 2020 13:30:46 +0100 (CET)
Received: from BADWLRZ-SWMBX06.ads.mwn.de (BADWLRZ-SWMBX06.ads.mwn.de [IPv6:2001:4ca0:0:108::162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "BADWLRZ-SWMBX06", Issuer "BADWLRZ-SWMBX06" (not verified))
        by postout2.mail.lrz.de (Postfix) with ESMTPS id 48p48Q4DbGzyfP;
        Thu, 26 Mar 2020 13:30:46 +0100 (CET)
Received: from BADWLRZ-SWMBX03.ads.mwn.de (2001:4ca0:0:108::159) by
 BADWLRZ-SWMBX06.ads.mwn.de (2001:4ca0:0:108::162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 26 Mar 2020 13:30:45 +0100
Received: from BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e]) by
 BADWLRZ-SWMBX03.ads.mwn.de ([fe80::b83a:fd44:92bb:7e5e%13]) with mapi id
 15.01.1913.010; Thu, 26 Mar 2020 13:30:46 +0100
From:   "Gaul, Maximilian" <maximilian.gaul@hm.edu>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
CC:     Xdp <xdp-newbies@vger.kernel.org>
Subject: AW: Shared Umem and reducing ksoftirqd-Load
Thread-Topic: Shared Umem and reducing ksoftirqd-Load
Thread-Index: AQHWAoMHgnpBMyiXt0+Jhmcs5uRxxahY/T4AgAAUqzj///d8AIAAFEi2///2woCAACkRq4AAAWsAgAGMLdI=
Date:   Thu, 26 Mar 2020 12:30:46 +0000
Message-ID: <b4e8bdfd96d8484d904b6b91ece81324@hm.edu>
References: <018e8071725b48399141cc46b63641e1@hm.edu>
 <CAJ8uoz1Vh+zj6msumTNWgtZY6jdOeYgoyDBoizfna1dzhC465A@mail.gmail.com>
 <9616cd5986c74058b51ffd1eb3311b85@hm.edu>
 <CAJ8uoz1-Nub4RKembg5maQ4Cj1J+O90eR_PcP41yNHuq7pShaQ@mail.gmail.com>
 <35eed7a7481a44bc93e8e5f7e59d9e5a@hm.edu>
 <CAJ8uoz3D=nw_aD0+Kj9Mh_DivRBvse0+G0Mtfw+eR8UJdDT0jw@mail.gmail.com>
 <883111619d9e429fb5f1fb239afdb478@hm.edu>,<CAJ8uoz2OZOrERz3D+L9fe-WhYAHOZOd_ZOzYjUTKwyZ1ic7AaA@mail.gmail.com>
In-Reply-To: <CAJ8uoz2OZOrERz3D+L9fe-WhYAHOZOd_ZOzYjUTKwyZ1ic7AaA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX03.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2003:c6:4f25:4be0:801c:6db5:405:327c]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Mar 25, 2020 at 14:36 AM Karlsson, Magnus
magnus.karlsson@gmail.com> wrote:

> On Wed, Mar 25, 2020 at 1:40 PM Gaul, Maximilian <maximilian.gaul@hm.edu> wrote:
> >
> > On Wed, Mar 25, 2020 at 12:04 AM Karlsson, Magnus
> > magnus.karlsson@gmail.com> wrote:
> >
> > > On Wed, Mar 25, 2020 at 11:45 AM Gaul, Maximilian
> > > <maximilian.gaul@hm.edu> wrote:
> > > >
> > > > On Wed, Mar 25, 2020 at 11:24 AM Karlsson, Magnus
> > > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > > On Wed, Mar 25, 2020 at 11:02 AM Gaul, Maximilian
> > > > > <maximilian.gaul@hm.edu> wrote:
> > > > > >
> > > > > > On Wed, Mar 25, 2020 at 10:41 AM Karlsson, Magnus
> > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > >
> > > > > > > On Wed, Mar 25, 2020 at 10:04 AM Gaul, Maximilian
> > > > > > > <maximilian.gaul@hm.edu> wrote:
> > > > > > > >
> > > > > > > > I am running a Multi-AF-XDP-Socket approach per RX-Queue (using Shared Umem).
> > > > > > > >
> > > > > > > > Unfortunately I am noticing, that at around 650k pps, the *ksoftirqd*-thread of that RX-Queue ramps up to 100% thus leading to packet loss.
> > > > > > > > I tried setting *XDP_USE_NEED_WAKEUP* on *xsk_socket_cfg.bind_flags* but those bind_flags are only taken into account if *umem->refcount > 1* (libbpf/xsk.c - xsk_socket__create()).
> > > > > > > > As far as I understand this correctly, only the first socket is able to set *XDP_USE_NEED_WAKEUP* because for all sockets after, *umem->refcount* is going to be at least 2.
> > > > > > >
> > > > > > > Yes, the other sockets just inherit the settings of the first one.
> > > > > > >
> > > > > > > Are you using the SKB mode? What is your packet size? Sounds like a
> > > > > > > low number unless you have large packets and are using the SKB mode.
> > > > > > >
> > > > > >
> > > > > > These are the flags I set right before calling `xsk_socket__create`:
> > > > > >
> > > > > >         xsk_socket_cfg.xdp_flags = cfg->xdp_flags | XDP_FLAGS_DRV_MODE | XDP_ZEROCOPY;
> > > > > >         xsk_socket_cfg.bind_flags = cfg->xsk_bind_flags | XDP_USE_NEED_WAKEUP;
> > > > >
> > > > > XDP_ZEROCOPY is a bind flag not an XDP flag, so please move it there.
> > > > > If you get an error when you have it set, it means that your setup
> > > > > does not support zero-copy for some reason. Check what kernel version
> > > > > you are using and the the driver you are using supports zero-copy. I
> > > > > believe you need to use a queue id>=32 in the Mellanox driver for it
> > > > > to work in zero-copy mode. Below 32, you will get copy mode.
> > > > >
> > > > > > Packet size is around 1492 bytes.
> > > > >
> > > > > Seems that you are using SKB mode then, not zero-copy.
> > > > >
> > > > > /Magnus
> > > > >
> > > >
> > > > Thank you for the hint. As you correctly said, I get an error if I use *XDP_ZEROCOPY*. But as far as I understand, packet rates should be higher in Driver-Mode even without zero-copy?
> > >
> > > Yes, I would expect that too.
> > >
> > > > I just updated to the latest driver- and firmware version:
> > > >
> > > >         $ sudo ethtool -i <if>
> > > >         driver: mlx5_core
> > > >         version: 5.0-0
> > > >         firmware-version: 16.27.1016 (MT_0000000012)
> > >
> > > What kernel version are you using? And you should use the driver from
> > > that same kernel.
> > >
> >
> > I am using
> >
> >         $ uname -a
> >         Linux 5.4.0-4-amd64 #1 SMP Debian 5.4.19-1 (2020-02-13) x86_64 GNU/Linux
> >
> > At the moment, Mellanox only supports Debian until version 10.0 (https://www.mellanox.com/products/infiniband-drivers/linux/mlnx_ofed) which is Kernel 4.19.
> > But because in Kernel 4.19, not all AF-XDP features are available, I had to upgrade. I was not sure which Kernel-Version would be the minimum in order to be able to use AF-XDP completely so I went with 5.4.
> > Installation was successfull  (with *--skip-distro-check*) so I thought this should work?
> 
> You better contact somebody from Mellanox for this info. I do not
> know. But Mellanox has zero-copy support in kernel 5.4.
> 
> > > > I actually have to correct myself: Incomming packets are 1442 bytes.
> > > > Can you give me the link between packet size and whether the NIC is running in SKB or DRV mode?
> > >
> > > Sorry, do not understand this. Could you please elaborate?
> > >
> >
> > You answered to my reply that packets are 1492 bytes "Seems that you are using SKB mode then, not zero-copy." so because of this I thought there is a relation between packet size and SKB mode?
> 
> There is no relationship between SKB mode and packet size. They are
> orthogonal. Though there is a relationship between packet size and
> performance and of course SKB mode vs zero-copy mode and performance.
> 
> > > > Mr. Brouer held a talk about (https://people.netfilter.org/hawk/presentations/driving-IT2017/driving-IT-2017_XDP_eBPF_technology_Jesper_Brouer.pdf)   about XDP, mentioning in slide 11/27 that *mlx5 (v4.9)* has native XDP support.
> > >
> > > Yes, but only if you use queue id>= 32. What queue id are you binding to?
> > >
> >
> > Usually it is queue 0 but I also tried queue 32 and queue 36 - but that didn't change anything on the behavior.
> 
> It should make a difference, if I remember correctly, but somebody
> from Mellanox certainly knows better. Try sending a mail to Maxim who
> wrote the Mellanox driver support. Maxim Mikityanskiy
> <maximmi@mellanox.com>.
> 
> /Magnus
> 

Thank you!
Just one more question regarding *ksoftirqd*-load. This paper seems to talk about the mentioned issue: http://vger.kernel.org/lpc_net2018_talks/lpc18_paper_af_xdp_perf-v2.pdf that *ksoftirqd* is producing high load. A stated solution to this problem would be *busy polling*. I am not sure if *busy polling* is something I have to assign via *setsockopt* in my userspace program or if this already taken care of by libbpf?
Nevertheless, I tried it like this:

		$ cat /boot/config-5.4.0-4-amd64 | grep "CONFIG_NET_RX_BUSY_POLL"
		CONFIG_NET_RX_BUSY_POLL=y

		$ sysctl net.core.busy_poll=50
		
and in my user-space program:

		int busy_poll_usec = 50;
		if(setsockopt(xsk_socket__fd(xsk_sockets[i]->xsk), SOL_SOCKET, SO_BUSY_POLL, (char *)&busy_poll_usec, sizeof(busy_poll_usec)) < 0) {
			fprintf(stderr, "Failed to set `SO_BUSY_POLL`: %s\n", strerror(errno));
			break;
		}
		
		/* some code inbetween */

		while(!global_exit) {
			const int ret = poll(fds, fd_count, 2);
			if (ret <= 0) {
				continue;
			}

			for(int i = 0; i < fd_count; i++) {
				struct xsk_socket_info *socket = xsk_sockets[i];
				if(atomic_exchange(&socket->stats_sync.lock, 1) == 0) {
					handle_receive_packets(socket);
					atomic_fetch_xor(&socket->stats_sync.lock, 1); /* release socket-lock */
				}
			}
		}

but this only has the effect that my userspace program is now at 50% load (previously around 13%) with *ksoftirqd* still running at 100% (and even worse pps).
Is this the expected effect on what I did?

> > > /Magnus
> > >
> > > >
> > > > > > Just to make sure: Those 650k packets are arriving on the same RX-Queue (even though this NIC has multiple RX-Queues I want to test maximum bandwith for a single RX-Queue).
> > > > > >
> > > > > > > > I didn't observe a dramatic change as I've hoped to. Are there some other ways to reduce interrupt load (user-space application and ksoftirq are already running on different CPUs)?
> > > > > > >
> > > > > > > The need_wakeup flag has a big impact when you run the softirq and the
> > > > > > > application thread on the same core. When using two cores for this, it
> > > > > > > has less of an impact.
> > > > > > >
> > > > > > > /Magnus
> > > > > > >
> > > > > > > > NIC: Mellanox Technologies MT27800
> > > > > > > >
> > > > > > > > Best regards
> > > > > > > >
> > > > > > > > Max
> > > > > > > >
> > > > > >
> > > >
