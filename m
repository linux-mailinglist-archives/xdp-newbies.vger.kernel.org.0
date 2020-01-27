Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7745914A445
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 Jan 2020 13:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgA0M4D (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Jan 2020 07:56:03 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42406 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgA0M4C (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Jan 2020 07:56:02 -0500
Received: by mail-oi1-f195.google.com with SMTP id j132so5425744oih.9
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Jan 2020 04:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UuOJwSH/36PvHQ8QPUHtQUU5Vb0wzYYN+joTysH7f9I=;
        b=cNvxcWgrrbacP1G9g1FfOoxznUEessievNjk8ssgZoQxYEhCaVeeFv1IwE7yIaYT3m
         n8umbUBBEGpSKacl7pmDrxOTU7ZFipsY7jW0FWj+VYCbgi1XAd6XBqo086fTKcGtyg57
         w/qh5HgBSFv0p3I4jCuL9RMO49PrA+to89ahS8R8EfUkCqRDeSgzELx4wuC1ORm17MyN
         tfcb0S7bwG6/yNVsFU9WBv1eLzYU4e5bgGlktueyDf2SfcdDxaLKi9AMsQ1/ZtlyVZKA
         v9e/Ziey0P5062TDMj6/BQjExrEEkzUYV06RzqeCSB183LH7++wD9PDvHCcVNaVXl2FJ
         9nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UuOJwSH/36PvHQ8QPUHtQUU5Vb0wzYYN+joTysH7f9I=;
        b=le+fVPkAGDRTFXoQW939I2bHaVKrbv1LIWzPXyFlDPan/dft+VOB68EXIRh3+Wmlg2
         dAhEEUisiIn3LvSrE5LwrekWwySmj4e6+mTU7/SiEoI/vtu2eW9U6REQtJsDcYIycfMZ
         BVbFsSiyGOqXWqVHiehpSuqyi1zRuF9O+ulrDvcD9c2dlBB/mvdFJQg8956tx0BEAdUu
         SR1Nc/EvtyOe+cDe+a4YCtdpKKa82uj66BXvb14wOswJcI/Dtd6y45OMJA3hyi7YUfvE
         x7/0xkA5bpcHMcGGCJKnsjYdyb4AF/gA2Q1gqU7KGF4GrM3xu7molNFU5x1Blqd0qR+W
         uKjA==
X-Gm-Message-State: APjAAAXWfyL91sawWMdSGPRquu/aDygSQgl9RoX+eoHHlHWuTnTU1EhK
        Dq59kfukFL73xzxNKzVu+1hlWY++kpkdaX4s7admOYjh
X-Google-Smtp-Source: APXvYqw99uoev/3S+a049aHz10VoMOS+KmrLuLMa4oJ1l+Hls1QXKA/Bs3CLiBDh2v37ss2djCIvKgmpYBYlQuoH4Tc=
X-Received: by 2002:aca:54cc:: with SMTP id i195mr7112626oib.126.1580129761636;
 Mon, 27 Jan 2020 04:56:01 -0800 (PST)
MIME-Version: 1.0
References: <CAMyc9bWnDuwDx_i=NjoAS1cDd5Fuy6T05ukSQZpjQv2Ji36jGg@mail.gmail.com>
In-Reply-To: <CAMyc9bWnDuwDx_i=NjoAS1cDd5Fuy6T05ukSQZpjQv2Ji36jGg@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 27 Jan 2020 13:55:50 +0100
Message-ID: <CAJ8uoz1=Se+-hYWO6E11_LM9kS2Z1Eqeq17pB=oQC1tDR75WiA@mail.gmail.com>
Subject: Re: Maximum xdpsock txpush rate with AF_XDP ??
To:     Cameron Elliott <cameron@cameronelliott.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 27, 2020 at 1:37 PM Cameron Elliott
<cameron@cameronelliott.com> wrote:
>
> I am trying see what the highest rate I can push out of a single
> x710/QDA2 port is.
>
> I have seen numbers like 50+ mpps in a  Magnus and Bj=C3=B6rn youtube vid=
eo,
> but granted, I know very little as I am really new to the x710 and XDP/AF=
_XDP.
>
> But I am only able to get about 2.2 mpps,  nothing like Magnus and
> Bj=C3=B6rn have been able to achieve.

You are using the SKB mode, not the zero-copy mode that will give you
higher numbers. Somewhere around 20 Mpps if you run a new kernel.

> One big issue is this command "sudo ./xdpsock -t  -i enp1s0f0 -N -z"
> Fails with:
> samples/bpf/xdpsock_user.c:xsk_configure_socket:322: errno:
> 95/"Operation not supported"

What driver are you using? It seems it does not support zero copy. The
virtual function (vf) driver of x710/i40e does not but the physical
function driver does.

> Is there a guide or README I should read on how to try to achieve
> numbers like theirs?
>
> If there is not a guide, would it be helpful if I wrote one? (a small
> guide on maxing rxdrop/tspush/l2fwd)
> (it would seem like a good trade to get some help from others here,
> and write a simple guide from a newbies
> perspective like mine, if someone wants to give me some help)

A guide published on the net would always be helpful.

Thanks: Magnus

>
> --------------
> Kernel/os:     Linux lumen 5.3.0-26-generic #28~18.04.1-Ubuntu
> Intel NIC:      version: 2.10.19.30 / firmware-version: 7.10 0x80006456 1=
.2527.0
> Xeon 1225 V6 with 4 cores
>
>
> Thank you
