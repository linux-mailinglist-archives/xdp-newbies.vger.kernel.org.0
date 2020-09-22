Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BBB2740CB
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Sep 2020 13:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgIVL2R (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 22 Sep 2020 07:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25447 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726454AbgIVL2R (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 22 Sep 2020 07:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600774095;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ELNDqsHaEnnMd6daVabrNKHCgeitBykR38gWb5vAGas=;
        b=WdLE/hJ4DLnLKWP1Ct3uFjzz6RZQOtLBxRxbcpFLNwEyfpF4xgXEIS5yK/wEFMGE2kKoIR
        PLnhiCeOUaG3Z8+uFyx+INI9/cE73v8//ateiJow2iJbJH5MmF+6qH2CYSOJdFGV/x4+EP
        tbuW2WOFDmPqPA7sSwpr/Amc8f2wjGM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-4JoOhFNhOkWoazqX8OkJFQ-1; Tue, 22 Sep 2020 07:28:13 -0400
X-MC-Unique: 4JoOhFNhOkWoazqX8OkJFQ-1
Received: by mail-wr1-f70.google.com with SMTP id g6so7296283wrv.3
        for <xdp-newbies@vger.kernel.org>; Tue, 22 Sep 2020 04:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ELNDqsHaEnnMd6daVabrNKHCgeitBykR38gWb5vAGas=;
        b=eE9DVmx5Aj22dngB941dlelhsNBz2KZJZ98bnDLnprw+Qc0p3lWREd6+2DvlzDcplC
         dLzYF+tqDja6Jzmo2cEUYLJrH0wnVjB6dg7dXFoGYSJdkcx9AHBETQeA0Q30muyIWCY7
         DjjLE4Xei1eyFOcek7PXeIOZ2RQfp+iwYCIRsXfOfvH1mefPRy/fqj0VqU6XnCBLrJU2
         qH0WUeTH6duwEoxIFQyzXQGr5pEBbzBZlySK9XUER+85CaxKwPI58UHM5QJrmjs6Cr9I
         uAanSYmsWrA+CFavSmSihOcHr/zsCwioOYB8sFCg4CWxGgGa4SXvbCHldfh4De7T0SgN
         9q/Q==
X-Gm-Message-State: AOAM530sULHBAwzuAwbZS353MRyWmaGYsXQP9muua/gZ58wiEbnBMgUx
        3jge+uG3Wuu8DXqrJ6B5c9lNNbnr3C6cGPoV2CZVUFp6yixbW0lJ5npTlQVc7ZFDHTvTer7AoNJ
        JHolsa9QLHZwGHEbg2pypuyc=
X-Received: by 2002:adf:cd0e:: with SMTP id w14mr5298610wrm.0.1600774092796;
        Tue, 22 Sep 2020 04:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaXwVoJY21MDdCz8358Tz9d/3e5nKGaFD05r2abHrPj7beTjxaXhEEtaB5F8I+Q4B+WurQuw==
X-Received: by 2002:adf:cd0e:: with SMTP id w14mr5298601wrm.0.1600774092656;
        Tue, 22 Sep 2020 04:28:12 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id i6sm28764599wra.1.2020.09.22.04.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 04:28:12 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id A8C17183A99; Tue, 22 Sep 2020 13:28:11 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Topi Wala <walatopi@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: NDv6 and xdp-filter
In-Reply-To: <CAOfgOftdYJF7yc8HQWCPvfLkuBcd3VRjgNK6vwV7ampuW+TKTw@mail.gmail.com>
References: <CAOfgOftdYJF7yc8HQWCPvfLkuBcd3VRjgNK6vwV7ampuW+TKTw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 22 Sep 2020 13:28:11 +0200
Message-ID: <874knqoxtg.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Topi Wala <walatopi@gmail.com> writes:

> Hi,
>
> I've installed an xdp-filter (dny_all) on my tap interface (and am
> only letting through L2 packets that match my src/dst mac), and it
> still lets through NDv6 traffic. Do L2 multicast packets not get
> "received" by the xdp filter? Running tcpdump inside Qemu linux
> connected to this tap interface shows me NDv6 multicast packets from
> the ToR switch.

All packets should be received by the XDP program; but only in the
ingress direction. So what do mean "running tcpdump inside the qemu
instance"? That sounds like you're talking about packets going *out* of
the TAP interface from the host PoV? XDP won't see those (you'll have to
run the program on the physical interface).

-Toke

