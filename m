Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF08182A04
	for <lists+xdp-newbies@lfdr.de>; Thu, 12 Mar 2020 08:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388027AbgCLHzg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 12 Mar 2020 03:55:36 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:41309 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387869AbgCLHzg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 12 Mar 2020 03:55:36 -0400
Received: by mail-qt1-f178.google.com with SMTP id l21so3596801qtr.8;
        Thu, 12 Mar 2020 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jTPknnZFfz0o2CDVsnM4U6p2gE2XygTRUY02QqvfMRs=;
        b=tUXMkgSCd8V+goDH0wMgwWcFYHzzRPDfShVV2KqQUyyoWCffPP+4FCI1DbotZ43Pll
         D0XHL8Q75gpmm1dRf3fsUhzuRo77qQYZPJ2ms9bQFqL35GJ9ioZ1sJ/1epSeTGd7Hah+
         idPEP2TYg/r4WLtLHCkElii8DPvMJ/6ndGttGMgkL9XpUju5bJtrpDnezqcBIKXuiowC
         8R5GRCCpTh3880Diu1Sklq6wgHMylddH/UED8l3mgzygx+T6tn1bWkkAW7l8Gbw4J8CZ
         MgTmx9HkTBbPcBpls2lbmvNuDO+b6kHybPTLtAM15SXHhZ2g4P3Sr0/Z/hnT06vuz1JB
         QBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jTPknnZFfz0o2CDVsnM4U6p2gE2XygTRUY02QqvfMRs=;
        b=kg6w1xk99F+30SLGobJHgHjuUl+83VHrtPw3VmF0cUqCJTrPfqrtN2wtasCWoV+hGm
         9EC0PkwDkn3BqoKbsY6ptONyy/kBvDqnXuubRHKpU20xwEq9wuU3adgYDow1AxHxMiCR
         uuoXFo64qdxvhIOKMsaGnMOj4DHTpomrIB8H+KH9mhFrzOUsrx3k6AKEorwUmON2kPOH
         2izuaAWrCkbThdTWN2R5jDf8VG9YpUonCo4REHSnXJWy2ZQMT3K4UKZATfEOMU+jj2gz
         JJWd000tsMpkH2wrTs6Hb0m8pH+qLP/AFcAFFdGhsMtr5k+Hd6gPlP7otQH5Pbnj+Exf
         XY+w==
X-Gm-Message-State: ANhLgQ06sFE+e/6j+mZvfWIQx60OmF77twKbLTLdlpXVvgy2G5Kamxfb
        AgVN32wUmCv4uzOPXwIS0tSToGcJF3GeHvnIk6w=
X-Google-Smtp-Source: ADFU+vt7s8lgm/ppUC3tNeS6SvAUm+Y7zCMyndrf2tXH9nTrr7Wy6cW13B+M01bq29Ddpn285wF5NCUs8+ORRG9PW3w=
X-Received: by 2002:ac8:1762:: with SMTP id u31mr1315939qtk.359.1583999733488;
 Thu, 12 Mar 2020 00:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <fd5e40efd5c1426cb4a5942682407ea2@hm.edu>
In-Reply-To: <fd5e40efd5c1426cb4a5942682407ea2@hm.edu>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Thu, 12 Mar 2020 08:55:22 +0100
Message-ID: <CAJ+HfNghFctg3L=3QdeoWyqDdj4wP4EKWjYyF01=SmCO5+=32g@mail.gmail.com>
Subject: Re: Shared Umem between processes
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>,
        Xdp <xdp-newbies@vger.kernel.org>
Cc:     "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 11 Mar 2020 at 16:59, Gaul, Maximilian <maximilian.gaul@hm.edu> wro=
te:
>
> Hello everyone,
>

Hi! I'm moving this to the XDP newbies list, which is a more proper
place for these kind of discussions!

>
> I am not sure if this is the correct address for my question / problem bu=
t I was forwarded to this e-mail from the libbpf github-issue section, so t=
his is my excuse.
>
>
> Just a few information at the start of this e-mail: My program is largely=
 based on: https://github.com/xdp-project/xdp-tutorial/tree/master/advanced=
03-AF_XDP and I am using libbpf: https://github.com/libbpf/libbpf
>
>
> I am currently trying to build an application that enables me to process =
multiple udp-multicast streams at once in parallel (each with up to several=
 ten-thousands of packets per second).
>
>
> My first solution was to steer each multicast-stream on a separate RX-Que=
ue on my NIC via `ethtool -N <if> flow-type udp4 ...` and to spawn as much =
user-space processes (each with a separate AF-XDP socket connected to one o=
f the RX-Queues) as there are streams to process.
>
>
> But because this solution is limited to the amount of RX-Queues the NIC h=
as and I wanted to build something hardware-independent, I looked around a =
bit and found a feature called `XDP_SHARED_UMEM`.
>

Let's start with defining what shared-umem is: The idea is to share
the same umem, fill ring, and completion ring for multiple
sockets. The sockets sharing that umem/fr/cr are tied (bound) to one
hardware ring. It's a mechanism to load-balance a HW queue over
multiple sockets.

If I'm reading you correctly, you'd like a solution:

           hw_q0,
xsk_q0_0, xsk_q0_1, xsk_q0_2,

instead of:

hw_q0,    hw_q1,    hw_q2,
xsk_q0_0, xsk_q1_0, xsk_q2_0,

In the first case you'll need to mux the flows in the XDP program
using an XSKMAP.

Is this what you're trying to do?

>
>
> As far as I understand (please correct me if I am wrong), at the moment l=
ibbpf only supports shared umem between threads of a process but not betwee=
n processes - right?
>

Yes, that is correct, and for a reason! :-) Note that if you'd like to
do a multi-*process* setup with shared umem, you: need to have a
control process that manages the fill/completion rings, and
synchronize between the processes, OR re-mmap the fill/completetion
ring from the socket owning the umem in multiple processes *and*
synchronize the access to them. Neither is pleasant.

Honestly, not a setup I'd recommend.

> I ran unto the problem, that `struct xsk_umem` is hidden in `xsk.c`. This=
 prevents me from copying the content from the original socket / umem into =
shared memory. I am not sure, what information the sub-process (the one whi=
ch is using the umem from another process) needs so I figured the simplest =
solution would be to just copy the whole umem struct.
>

Just for completeness; To setup shared umem:

1. create socket 0 and register the umem to this.
2. mmap the fr/cr using socket 0
3. create socket 1, 2, n and refer to socket 0 for the umem.

So, in a multiprocess solution step 3 would be done in separate
processes, and step 2 depending on your application. You'd need to
pass socket 0 to the other processes *and* share the umem memory from
the process where socket 0 was created. This is pretty much a threaded
solution, given all the shared state.

I advice not taking this path.

>
>
> So I went with the "quick-fix" to just move the definition of `struct xsk=
_umem` into `xsk.h` and to copy the umem-information from the original proc=
ess into a shared memory. This process then calls `fork()` thus spawning a =
sub-process. This sub-process then reads the previously written umem-inform=
ation from shared memory and passes it into `xsk_configure_socket` (af_xdp_=
user.c) which then eventually calls `xsk_socket__create` in `xsk.c`. This f=
unction then checks for `umem->refcount` and sets the flags for shared umem=
 accordingly.
>
>
>
> After returning from `xsk_socket__create` (we are still in `xsk_configure=
_socket` in af_xdp_user.c), `bpf_get_link_xdp_id` is called (I don't know i=
f that's necessary). But after that call I exit the function `xsk_socket__c=
reate` in the sub-process because I figured it is probably bad to configure=
 the umem a second time by calling `xsk_ring_prod__reserve` after that:
>
>
>
>
> static struct xsk_socket_info *xsk_configure_socket(struct config *cfg, s=
truct xsk_umem_info *umem) {
>
> struct xsk_socket_config xsk_cfg;
> struct xsk_socket_info *xsk_info;
> uint32_t idx;
> uint32_t prog_id =3D 0;
> int i;
> int ret;
>
> xsk_info =3D calloc(1, sizeof(*xsk_info));
> if (!xsk_info)
> return NULL;
>
> xsk_info->umem =3D umem;
> xsk_cfg.rx_size =3D XSK_RING_CONS__DEFAULT_NUM_DESCS;
> xsk_cfg.tx_size =3D XSK_RING_PROD__DEFAULT_NUM_DESCS;
> xsk_cfg.libbpf_flags =3D 0;
> xsk_cfg.xdp_flags =3D cfg->xdp_flags;
> xsk_cfg.bind_flags =3D cfg->xsk_bind_flags;
> ret =3D xsk_socket__create(&xsk_info->xsk, cfg->ifname, cfg->xsk_if_queue=
, umem->umem, &xsk_info->rx, &xsk_info->tx, &xsk_cfg);
>
> if (ret) {
> fprintf(stderr, "FAIL 1\n");
> goto error_exit;
> }
>
> ret =3D bpf_get_link_xdp_id(cfg->ifindex, &prog_id, cfg->xdp_flags);
> if (ret) {
> fprintf(stderr, "FAIL 2\n");
> goto error_exit;
> }
>
> /* Initialize umem frame allocation */
> for (i =3D 0; i < NUM_FRAMES; i++)
> xsk_info->umem_frame_addr[i] =3D i * FRAME_SIZE;
>
> xsk_info->umem_frame_free =3D NUM_FRAMES;
>
> if(cfg->use_shrd_umem) {
> return xsk_info;
> }
>         ...
> }
>
> Somehow what I am doing doesn't work because my sub-process dies in `xsk_=
configure_socket`. I am not able to debug it properly with GDB though. Anot=
her point I don't understand is the statement:
>
> However, note that you need to supply the XSK_LIBBPF_FLAGS__INHIBIT_PROG_=
LOAD libbpf_flag with the xsk_socket__create calls and load your own XDP pr=
ogram as there is no built in one in libbpf that will route the traffic for=
 you.
>
> from https://www.kernel.org/doc/html/latest/networking/af_xdp.html#xdp-sh=
ared-umem-bind-flag
>
> I didn't know that libbpf loads a XDP-program? Why would it do that? I am=
 using my own af-xdp program which filters for udp-packets. If I set `xsk_c=
fg.libbpf_flags =3D XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD;` in `xsk_configure=
_socket`, the af-xdp-socket fd is not put into the kernel `xsks-map` which =
basically means that I don't receive any packets.
>
> As you probably already noticed, I am overstrained with the concept of Sh=
ared Umem and I have to say, there is no documentation about it besides the=
 two sentences in https://www.kernel.org/doc/html/latest/networking/af_xdp.=
html#xdp-shared-umem-bind-flag and a mail in a linux mailbox from Nov. 2019=
 stating that this feature is now implemented.
>
> Can you please help?
>

XDP sockets always use an XDP program, it just that a default one is
provided if the use doesn't explicitly add one. Have a look at
tools/lib/bpf/xsk.c:xsk_load_xdp_prog. So, for shared umem you need to
explicitly have a program that muxes over the sockets. A na=C3=AFve variant
can be found in samples/bpf/xdpsock_kern.c


Cheers,
Bj=C3=B6rn

> Best regards
>
> Max
