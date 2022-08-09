Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B0F58DA79
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Aug 2022 16:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbiHIOno (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Aug 2022 10:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiHIOnn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 9 Aug 2022 10:43:43 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDB31B7AD
        for <xdp-newbies@vger.kernel.org>; Tue,  9 Aug 2022 07:43:42 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso17856157pjq.4
        for <xdp-newbies@vger.kernel.org>; Tue, 09 Aug 2022 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=arK4yPCZoreM+VS8EK6ZW9fv+q2MURJlOv92MXAL12k=;
        b=BVE1MaoFUGT1FdSC/G/KRg6zm7veFX8W0/33VXwFTLGo3oSxJvKUI4OqZIksVbeIK2
         MpwMuFLmBmKPpvGIup7m3g1lXQTShs76yFhVSjiFz6XuvBX7B4Pt+ZjmDxyAawwl/6Bs
         hGq4Snuu15vml9WHzQIn7B87OLP17ChmIH6tNK2kaj0esHLnDpUirGaQJKXEaFZSMI/U
         9Bpe2L9x3N38wwO3d0p5hgWPCWERMT09ofxkyMo5vlEP+u7WzL/KCzuf51qeVbsYeP9X
         ia8pBrvUV+H+vygj+y5bPtjeYFdvIa+CgfERM9ILLyKdSyP0Ka+E418ajT2MzzoczWaD
         BD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=arK4yPCZoreM+VS8EK6ZW9fv+q2MURJlOv92MXAL12k=;
        b=adLcVzwl9kG2B4OTMBsg3PSwGMyhTTBpdfa6kGtM9esaOFBICTLZK8/lqQO8DM1u2y
         QSP0rdEo3HFC25lGwpgIBd2UyTqOZW0nGN5tMp2dg3TW7xKAmItUBFgxKS4AUs7ECpWW
         XZ6eFpfSV8b73m2Vh7sGhfcC9K5XZ3h2KCQ/Cu2D2V3sjnieEMgRN5Y9gO2CjrLXAPW6
         B2LCkBlXv6903cCiq6DRaZPrHJ91U9DOgNjezq76x2AyaPLz9AUF/J9a92X1LYZlcFmW
         HEcgPpmGk5V/kzsYl0xKsfdYnt0rTLAv2ig6xbQqeao9fxnKfKVi9ro4EG+zEorzKeTy
         O+Pw==
X-Gm-Message-State: ACgBeo35F9/xSKjb5dRR69shkZ2+quZc8IrMLFXmcUZ1GIdxrLEDcBEo
        2Gba0NKekO5BUxyOoPmaTtMDWBtkj+pmuOqO3/4=
X-Google-Smtp-Source: AA6agR63tNPMh0nP1BB2VfceDaSFfhbUd00Ebee/jLS2y/Rude1KjyCCoN7ZShfUCH8k9yn/U80ckw/5Utqc4NGF57E=
X-Received: by 2002:a17:90b:4c52:b0:1f6:3a26:9f08 with SMTP id
 np18-20020a17090b4c5200b001f63a269f08mr20133818pjb.206.1660056222037; Tue, 09
 Aug 2022 07:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <6205E10C-292E-4995-9D10-409649354226@outlook.com>
In-Reply-To: <6205E10C-292E-4995-9D10-409649354226@outlook.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 9 Aug 2022 16:43:31 +0200
Message-ID: <CAJ8uoz0a_q8T99=rHny2L+wVUgCd0jNYQd1f=LLd-2WncrAiuw@mail.gmail.com>
Subject: Re: XSK + ZC, shared UMEM and multiple Fill/Completion queues - broken?
To:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Aug 9, 2022 at 4:27 PM Alasdair McWilliam
<alasdair.mcwilliam@outlook.com> wrote:
>
> Hi list. This is my first post so be gentle. :-)
>
> I=E2=80=99m developing a piece of software that uses XSK in zero copy mod=
e so we can pick up packets fast, do some work on them, then either transmi=
t them back to a network or drop them. For the sake of this mail, we can sa=
y this involves pulling all traffic up into user-space via XSK.
>
> The software sits directly on top of libbpf/libxdp, it does not use highe=
r level abstractions.
>
> Our current setup uses a multi-threaded user-space process. The process q=
ueries the system for the number of channels on a NIC (num_channels) and al=
locates enough UMEM to accommodate (num_channels * num_frames * frame_size)=
. The umem is divided into a number of buckets before it loads its eBPF pro=
gram into the kernel and creates its worker threads.
>
> There are an equal number of threads to channels, and each thread receive=
s a number of umem buckets as well as its own AF_XDP socket to work on. Str=
ucturally, each XSK has its own umem FQ/CQ as well as TXQ/RXQ by virtue of =
the xsk_socket__create_shared() API, and RSS facilitates a nice distributio=
n of packets over each NIC channel and worker thread.
>
> We=E2=80=99ve had a lot of success scaling across multi-core servers with=
 Intel E800 cards, with synthetic tests getting up to 20-30Mpps data rates.=
 Over the last few months we=E2=80=99ve also inserted the software into a p=
roduction network for test runs with customer workloads, whereby the softwa=
re is forwarding gigabits of legitimate traffic across an array of differen=
t workloads, with no impact to the U/X of customer traffic flows. Ultimatel=
y, to date, we've been quite confident as to the mechanics of the packet fo=
rwarding pipeline implemented with XSK.
>
> But we=E2=80=99ve hit a snag. Everything=E2=80=99s worked great up to Lin=
ux 5.15, and from 5.16 onwards, it=E2=80=99s quite broken. If I could summa=
rise the behaviour of this on kernel 5.16 onwards, I would say the main iss=
ues are:
>
> * Channel 0 receives traffic but channel 1+ may not. (In this case, chann=
el 0 tends to receive the right amount of traffic, e.g. 4 channels with RSS=
 means channel 0 sees 1/4th the total ingress).
>
> * Channels can stall. Superficially it looks like they only process frame=
s up to the number of descriptors initially pushed onto the FQ, and then st=
ops.
>
> * eBPF programs running for frames via channel 0 work as expected. That i=
s, if one is parsing layer 3 and 4 headers to identify certain traffic type=
s, headers are where you would expect them to be in memory. However, this i=
sn=E2=80=99t true for frames via channel 1+; headers don=E2=80=99t seem to =
be at the right position relative to the data pointer in the eBPF program. =
It could be there=E2=80=99s actually nothing in the descriptor, but this is=
 experienced by the software as parser errors, because we can=E2=80=99t dec=
ode the IP frames properly.
>
> We=E2=80=99ve been debugging this for some time and concluded the best wa=
y was to take our software out the equation, and use xdpsock from the kerne=
l tree. In doing so, we realised that while xdpsock does test shared umem, =
it=E2=80=99s still a single thread, and maintains a single FQ/CQ despite op=
ening 8x XSK sockets.
>
> To move forward and validate with multiple FQ/CQ via the xsk_socket__crea=
te_shared() API, we=E2=80=99ve tweaked the xdpsock app to scale out umem al=
location by num_channels, then split it into num_channels regions (by virtu=
e of an offset), open multiple XSK sockets bound to num_channels NIC channe=
ls, insert the XSK FD=E2=80=99s into an XSK map indexed by channel number, =
and tweak xdpsock_kern to lookup rx_channel for redirect, vs. the RR approa=
ch in the original sample. And, on the whole, surprisingly, we *think* we c=
an reproduce the issues.
>
> We need to be a bit more scientific about our testing but I wanted to kno=
w if anyone else has had odd behaviour/experiences with XSK using shared um=
em, with multiple fill/completion queues, on kernel 5.16 and above?
>
> We were under the impression that multi-FQ/CQ is a supported configuratio=
n - it worked perfectly in 5.15. Is this something that is actually going a=
way, and we need to re-think our approach?

It is not supposed to go away ever, so this is most likely a bug.
Thank you for reporting it and posting a program I can use to
reproduce it. I will get back when I have reproduced it, or failed to.
But let us hope it is the former.

BTW, there is one more person/company that has reported a similar
issue as you are stating, so it is likely real. But in that case, we
were not able to reproduce it on our end.

/Magnus

> In all test cases we=E2=80=99ve been on x86_64 (Xeon E5=E2=80=99s or Xeon=
 Platinum), on E810 or MLX Connect-X 4 cards. Tested on a range of differen=
t kernels, up to 5.19-rc4. In all cases we=E2=80=99re using aligned memory =
mode and the L2fwd behaviour of xdpsock.
>
> In tracing back kernel commits we have actually found where the problems =
start to occur. ICE breaks from commit 57f7f8b6bc0bc80d94443f94fe5f21f26649=
9a2b ("ice: Use xdp_buf instead of rx_buf for xsk zero-copy=E2=80=9D) [1], =
and testing suggests MLX5 is broken from commit 94033cd8e73b8632bab7c8b7bb5=
4caa4f5616db7 ("xsk: Optimize for aligned case=E2=80=9D) [2]. I appreciate =
MLX5 don=E2=80=99t support XSK Z/C + RSS, but there are ways we can test mu=
ltiple queues with some flow steering, and we see the same behaviour.
>
> We=E2=80=99ve actually just published our modified xdpsock code at our op=
en source repository [3] because we noticed the xdpsock code got removed fr=
om the tree a while ago. Our modifications are compile-time enabled/disable=
d because we wanted to be explicit in where we=E2=80=99ve changed logic in =
xdpsock. But the repo is available for peer review to see if there=E2=80=99=
s issues in how we=E2=80=99ve approached testing the logic.
>
> Any and all feedback welcomed/appreciated - we=E2=80=99re a bit stumped!
>
> Thanks
> Alasdair
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D57f7f8b6bc0bc80d94443f94fe5f21f266499a2b
>
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D94033cd8e73b8632bab7c8b7bb54caa4f5616db7
>
> [3] https://github.com/OpenSource-THG/xdpsock-sample
>
