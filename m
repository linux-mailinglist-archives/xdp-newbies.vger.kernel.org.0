Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5F84B5967
	for <lists+xdp-newbies@lfdr.de>; Mon, 14 Feb 2022 19:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiBNSLC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 14 Feb 2022 13:11:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357357AbiBNSLB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 14 Feb 2022 13:11:01 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F5465407
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 10:10:53 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b8so3436745pjb.4
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 10:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=princeton-edu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=CAalxiL6Q1xNT896dzOW3JB79yEczdSh65/dmQQYbeI=;
        b=gpb+Yo3d8tFLJSShhidgvloI8c1BhFlgosDOOoBjSBQBBj2M7CEjd3hOor/3onDpRX
         keBebMEvA/AzfktV3k+XhxZtknTvSCuYl2HEmschv9fLXyq9O8ctAXxMM3Q7XmiAAY3v
         /3uOmop7TQRWtyaVJk2qlpFvBSfP0yMRVGDPEq/tHbvTi80ijiY3FiUN/LPqsXmDvqyZ
         Wy0EcyTpJ8eAd2mhvkuTs8tVbh2nb8EmeGf1qFMjJ0F6wwmRTPGt9gvGB0pkYOiW2nY4
         cdCGdJUNVcHT4NzJTm4vqL18tEzVtiBOy3Zs39sBz7JSr7N1tUjMTUm5Blth5oNiwNM2
         C2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=CAalxiL6Q1xNT896dzOW3JB79yEczdSh65/dmQQYbeI=;
        b=qMmoCYxBnHDTxmH4w7yl/rkSOC/DSO5tlI1SW6SWmUT3iqtiGvGt8cYSjV9fBjkPmq
         TsBvIBH/6pGZ08DxS11W2bJOTy57oPhpVq+uNIcuA5mcQWfvGzzdLB9RWirSS4wA8sJd
         qc5IaZHThjE6EstSEwzimPitHCELgGS7V6cfeLGcE2+LmSsR6OW/5KQVdKnwdo9C4NyH
         utsoDl+oVb4Urm356uSFjNFWlXHN1LhtIW2mZwwppo0FLjFhziTxY/Q6PdTrvNY3I26W
         BMUX835ZluwNPuX956CiKQ3whrTMR0jvJhDZKYZFSLHoYb0vBXqlqsrwvGzRhhyb606J
         mibQ==
X-Gm-Message-State: AOAM533m0DIqpj1uMTxUqJyVkHSp79EiDkJhMQa5QNLVieAgZV14CqT/
        pAg3SAKhm5w4DsTlY+UN/KTPZx/LA2FUIguwcot83lCXkQhYuA==
X-Google-Smtp-Source: ABdhPJzV4qKNYbQ0lcW2lBXklPSAtV6teLi42B7sdMuOurNLeNpfclWuYZ7Y+rkD8lXaGoh6+eIo5lY5AOSRKTuvb5Q=
X-Received: by 2002:a17:902:dccd:: with SMTP id t13mr2126pll.65.1644862252798;
 Mon, 14 Feb 2022 10:10:52 -0800 (PST)
MIME-Version: 1.0
From:   Sophia Yoo <sy6@princeton.edu>
Date:   Mon, 14 Feb 2022 13:10:43 -0500
Message-ID: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
Subject: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
To:     xdp-newbies@vger.kernel.org
Cc:     Sophia Yoo <sy6@princeton.edu>
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

Hello,

I am relatively new to BPF/XDP, and I=E2=80=99m currently trying to use a T=
C
egress program to redirect a packet back to ingress, where I have an
XDP program attached. When the XDP program is attached in generic mode
(XDP_SKB_MODE), the redirect occurs properly and the packet is seen on
the ingress of the interface, but when the program is attached in
native mode (XDP_DRV_MODE), the packet never redirects and is just
seen exiting the interface, even though the return code of the
redirect function is =E2=80=9Csuccess=E2=80=9D.

I've read previous threads that seemed related to this issue, but
could not find the answer to my question. I=E2=80=99m trying to understand =
the
difference in behavior between generic versus driver mode, and how to
properly redirect the packet in driver mode (if this is possible). I
would really appreciate any insight. Here are more details on my
setup. When my TC program sees an outgoing packet, it should grab it,
make a clone, and redirect the clone to the ingress direction XDP
program using bpf_clone_redirect(skb, IFINDEX, BPF_F_INGRESS); When
the XDP program is attached in generic mode the packets get redirected
successfully and can be seen on the XDP ingress interface (and on
tcpdump etc.). However, when the XDP program is attached in xdp native
mode (with the NIC provided driver), the packet does not get
redirected and simply exits (in this case since I am using the
bpf_clone_redirect() helper, two packets are seen exiting). I
understand that XDP native mode occurs sooner in the packet processing
pipeline than XDP generic mode, and that in native mode there is no
skb, but I=E2=80=99m having some trouble understanding exactly what is
happening under the hood and how to =E2=80=9Cfix=E2=80=9D it, if possible. =
My NIC
driver is Intel xgbe. I am using bcc to attach and load my xdp and tc
programs.

I read in this thread
https://marc.info/?l=3Dxdp-newbies&m=3D162344478620095&w=3D2 that Netronome
NICs do not support XDP_REDIRECT, but it seems from this Feb=E2=80=9921 thr=
ead
https://marc.info/?l=3Dxdp-newbies&m=3D161362777730255&w=3D2 that Intel xgb=
e
drivers should support it, although there is additional discussion
about potential buggy behavior in a May=E2=80=9921 thread
https://marc.info/?l=3Dxdp-newbies&m=3D162024487722215&w=3D2.

These threads regarding XDP_REDIRECT support in relation to xdp frags
also seemed relevant, but since I am new to this area I had some
trouble understanding the significance for solving the issue I=E2=80=99m
working on. https://marc.info/?l=3Dlinux-netdev&m=3D164275984217304&w=3D2

https://lore.kernel.org/bpf/YgeUFb4LIP7VfeL9@lore-desk/T/

I would appreciate any insight or advice on understanding

the difference between what is happening in xdp generic versus xdp
driver modes during a packet redirect from TC egress to XDP ingress

whether it is possible to perform a redirect in xdp driver mode with
an Intel xgbe driver

if yes to 2, how to successfully redirect a packet from TC egress
program to XDP ingress program attached in xdp driver mode

Thank you very much for your time.

Best,

Sophia Yoo
