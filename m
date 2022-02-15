Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CAA4B731D
	for <lists+xdp-newbies@lfdr.de>; Tue, 15 Feb 2022 17:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241154AbiBOQ1o (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 15 Feb 2022 11:27:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241574AbiBOQ1j (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 15 Feb 2022 11:27:39 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDAF6C91F
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 08:27:16 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v8-20020a17090a634800b001bb78857ccdso1118749pjs.1
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 08:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=princeton-edu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P+0be/r6RP9bvazI1QDQsej432k6L+FhRZwUIN/yAS0=;
        b=bcoPZTQRJJnzB2KH34H8rnXI8J2OZmNBTKt0iMIUZtw/YHLKMWWqrZiS3wk32pD5yO
         e+2AokDa4ZqDovioRFnVH7CCYGFlujaZ20nfubImQSpSF6hoc+UtlAOKXA/DM8vZ5IGN
         bU4UzXSj3v56SjcLqiyha0x3qVs568fRAZ2zwvYWaNGOn3yrMGHLwoq0LWpUhNGgTDEA
         quAXl6ZbKoqSuvBuYxkSDxubxatYemTsKWFNRJ3IOp4yUjRdIAdKEE2+KKPHPwnPMN01
         GNjaUpXi1RdFQI3cgaZGbsztV4wUUui2UcmbpIuhybYrFjnzgl4ce8Db/lpdiPO3PKVG
         63/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P+0be/r6RP9bvazI1QDQsej432k6L+FhRZwUIN/yAS0=;
        b=h3Ic1vj9Mo+MwDysvmEm/OdBwz65aJEIh32ArYVMY42KGsX5ov2QO9O4pKpZQzdRVS
         mis1dr6G2w5JVME7nyHhNIOXbdSItHlQ0aXDQOSzldgX7dpHWNtu5ShoEsOoxNZmbXdj
         1+KlgvOeH8T+cwm5L8gtD/k+ChA2Ji9J3hzmLvraGFgEKVDD8N1Yo0djLW2ZPPtwZz3Z
         SlKFSWlAnoAv689d2VdZuV4Oli3N3NOaSSTu+v3vwM5NL+xaCLdz2/w6iBHMOMEw9NAg
         hfiTBaedCYxLbDUhZDnoDbm5xy6MuKwF1xyd5LKbkmwQAqMwGNMLtB0W/lpIAQyuTjgM
         +IKg==
X-Gm-Message-State: AOAM533XS+P8vjFab+OPMpF2aGFN3u2w6RZ6N2mVqLCZSYJI0/W2NH2N
        C5P/71T0Oln6pAANYQuWNlo1SPrRHjwUlVX4Es4ffPn2H4E=
X-Google-Smtp-Source: ABdhPJxoLD3mdMQR9+UfmZGEJ1hbpUFaw+dVpBVEGcnZ444K2Q7RnosbZpPdxbLe1D6mp12M/7ldQHVgrD5k9Mgwx4A=
X-Received: by 2002:a17:90b:3503:: with SMTP id ls3mr5243778pjb.76.1644942436026;
 Tue, 15 Feb 2022 08:27:16 -0800 (PST)
MIME-Version: 1.0
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
 <ba38905b-04c2-5592-3804-60f8c7ba479e@redhat.com>
In-Reply-To: <ba38905b-04c2-5592-3804-60f8c7ba479e@redhat.com>
From:   Sophia Yoo <sy6@princeton.edu>
Date:   Tue, 15 Feb 2022 11:27:04 -0500
Message-ID: <CANLN0e5_HtYC1XQ=Z=JRLe-+3bTqoEWdbHJEGhbF7ZT=gz=ynQ@mail.gmail.com>
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        xdp-newbies@vger.kernel.org
Cc:     brouer@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Feb 15, 2022 at 5:04 AM Jesper Dangaard Brouer
<jbrouer@redhat.com> wrote:

> On 14/02/2022 19.10, Sophia Yoo wrote:

> > I am relatively new to BPF/XDP [...]

> I see you come for academia, so I will recommend reading our XDP paper
> as a start:
>   https://github.com/xdp-project/xdp-paper

> Title: =E2=80=9CThe eXpress Data Path: Fast Programmable Packet Processin=
g in
> the Operating System Kernel=E2=80=9D which was presented at ACM CoNEXT 20=
18 on
> December 5th, 2018.

Cool! I had briefly read this paper before but didn't realize you and
Toke were authors of this work. Great to chat with you. I'll also take
a closer look at this paper again, it looks like a great resource.

> [...]
> > My NIC driver is Intel xgbe. I am using bcc to attach and load my xdp
> > and tc programs.

> This "xgbe" driver doesn't exist in the kernel tree under Intel.
> Are you sure this is the correct driver?

Whoops, I misspelled the driver name, the driver is actually "ixgbe"
(confirmed with the output of "lspci -v").

03:00.0 Ethernet controller: Intel Corporation Ethernet Connection
X552 10 GbE SFP+
Subsystem: Intel Corporation Ethernet Connection X552 10 GbE SFP+
Physical Slot: 0-2
Flags: bus master, fast devsel, latency 0, IRQ 35, NUMA node 0
Memory at 383fffc00000 (64-bit, prefetchable) [size=3D2M]
Memory at 383fffe04000 (64-bit, prefetchable) [size=3D16K]
Expansion ROM at fb980000 [disabled] [size=3D512K]
Capabilities: [40] Power Management version 3
Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable+ 64bit+
Capabilities: [70] MSI-X: Enable+ Count=3D64 Masked-
Capabilities: [a0] Express Endpoint, MSI 00
Capabilities: [100] Advanced Error Reporting
Capabilities: [140] Device Serial Number 00-00-c9-ff-ff-00-00-00
Capabilities: [150] Alternative Routing-ID Interpretation (ARI)
Capabilities: [160] Single Root I/O Virtualization (SR-IOV)
Capabilities: [1b0] Access Control Services
Capabilities: [1c0] Latency Tolerance Reporting
Kernel driver in use: ixgbe
Kernel modules: ixgbe


--Sophia
