Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC3F4932CD
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Jan 2022 03:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350878AbiASCTC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 18 Jan 2022 21:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348177AbiASCTC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 18 Jan 2022 21:19:02 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDACCC061574
        for <xdp-newbies@vger.kernel.org>; Tue, 18 Jan 2022 18:19:01 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id t4-20020a05683022e400b00591aaf48277so1043614otc.13
        for <xdp-newbies@vger.kernel.org>; Tue, 18 Jan 2022 18:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=43xC2btpBPTglfsI64Xqvxwp1JK4OK8TDWuiDoQnfBk=;
        b=LfW7QfFTXHmwuUdzAMP8vLgCCMYvlKjSEPd8XZ8EfN7OGZz1h4dVbsGkHw0CCMqsum
         z5exG+eFeGkVS2gySoOoUx9rRb+Mc1YjUxLswolJLyCDUzjoZ4T8riYMdUxFIzShnyc1
         0uXxpgGgtniDsPLY4olWPTDM91LudGtNfGQJvxZ8L/FqNS29Qhibt0Bj6AUkAyCH4vI2
         aWHHJqoKxADtrjsfW/vIxwPFpH//Sfnl67vOkxoy6f33oIQg2iHb4p59tWe5ovmNYYDE
         Vwn2jCEW/I116nrsQhuqoTTdIXvBqz6Zn7Ko+ax2qcYomP4y3uFl38Dpedq5KdPJ5OGq
         3BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=43xC2btpBPTglfsI64Xqvxwp1JK4OK8TDWuiDoQnfBk=;
        b=C7FhQQiiGxgCJen/MYfnlfiFRI0nSaYNvq2aokDeUQIvykKjVVTRcPcHP5pIeIDaaY
         QNz4+4USoWVT8FpaB3jm3COhncMfLvrJPEyNUi1ioZeDZz4kdWt/zjm8A3XZrOu6VaUT
         XhJKuF4J9osOV4Lufk5iLgMyo3Hje1SJAba6pnuyZYgOQPuk6NmqobcJYgGxS+QU2Xu3
         4nzOUTZjnjaa8O+y74uI/6hUdpN9BQ0XzqW+R2p5nM1y3e7p0motYsedacDvbb6n/80t
         IML45vzJceU0iN2VkjYcivFcpW4+5mR6APOhBqC+1115JIneyceEaTtL10p8Y9UzMz5u
         Lb+g==
X-Gm-Message-State: AOAM533mdZqJ9eAG1c2jhnBlkYIVfpJd34C/U21nBkl5ZoEq98IetYR7
        p9eryJENbU2NUNMcpYYhAp0r4CPSOpj11W/6TSbKEregsNjSKg==
X-Google-Smtp-Source: ABdhPJydkMP01s1HxXDm41VksUINLwgGH6G9GKRu/s4AnmbsXXKAe9MgxI0553IaunSFgIiePBqITvVGv+70JuYbhP0=
X-Received: by 2002:a9d:6e83:: with SMTP id a3mr12102312otr.307.1642558741090;
 Tue, 18 Jan 2022 18:19:01 -0800 (PST)
MIME-Version: 1.0
From:   Roberts Tyrion <tyrion.roberts@gmail.com>
Date:   Wed, 19 Jan 2022 10:18:50 +0800
Message-ID: <CABJTkezEc99OmEBMbnOq901gpXmUfYXUzToJXTDZQSdTseTnmA@mail.gmail.com>
Subject: How to use AF_XDP in media connections
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi XDP experts,

Recently our team is trying to use AF_XDP to improve our socket
performance in media servers, which will spend 50%+ CPU resources in
socket send and recv functions. However, we still hear the different
voices that VPP/DPDK is one better option. I read many documents, and
found that if applications don=E2=80=99t attach packages, DPDK is better, a=
nd
if applications will process packages, XDP will approach the
performance of DPDK. For our applications, servers will create
hundreds of sockets to receive h264 streams, and send out these
streams into the different sockets. Based on the above descriptions,
do you think which solution is better one?

Another question is about AF_XDP usage: by this document,
https://www.kernel.org/doc/html/latest/networking/af_xdp.html

We need to use ethtool to map the ingress port and egress port, but
our application can create socket connections randomly, how to use
af_xdp to resolve this problem.
