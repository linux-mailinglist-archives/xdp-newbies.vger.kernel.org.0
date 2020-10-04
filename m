Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FA4282DBE
	for <lists+xdp-newbies@lfdr.de>; Sun,  4 Oct 2020 23:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgJDVUz (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 4 Oct 2020 17:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39474 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726345AbgJDVUz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 4 Oct 2020 17:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601846454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=29GRPc8ifdQvoVRIKbj2pxKmkpIesKyWbb7tYrUEDTM=;
        b=Hzn1zzWHy8t4QwAYMmAEj2gT28kQT7gE0RETKvbxNxwPOZCW9XXID0u5C8DrmOZ3JjlM2B
        wO0Bc3vwQ2jrxcsmL5mdA0veLuqCEsa6u4I0/QZI+I1gw0GTVV2+Thl6K3jWF3IwZfecYk
        xz5cjcieXRPWRiVZkx5erCyb7k91dbU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-YvNtY4E0McS6PkT9BJc-Cw-1; Sun, 04 Oct 2020 17:20:52 -0400
X-MC-Unique: YvNtY4E0McS6PkT9BJc-Cw-1
Received: by mail-wr1-f72.google.com with SMTP id 33so3194694wrk.12
        for <xdp-newbies@vger.kernel.org>; Sun, 04 Oct 2020 14:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=29GRPc8ifdQvoVRIKbj2pxKmkpIesKyWbb7tYrUEDTM=;
        b=SPvRQoFRWXi4rxgyOEFW8hNZeanjxiVug9uXLlXJo4h3Ncs3rnYNme1oecL25SXZNG
         6w7R3Ymzmh5nAe9U0Mpy07XQeiQYQ7TPpeIxs8fv4y/6mw82BztUtipZzNYjoZ1D+gGW
         BFKaHNZo3OWdl/mAu6lAiClJJNziRHuWCCHTGmPmG4yPZQxvo7Tgj1ks4FZIrjvf0lpk
         UoAA1oZDg9WSPauCaTtfCmCW/bQvgTRCVYbaIS5S08Huu//G0Yd3SLmTkH+zfiOrjgAJ
         cdmO3p5OQUjyIXrkPSaymewJV8Ed4GRViA2ALcJeAu5BhQio5n74CBGtVZ1VMnaAPGgd
         1p4g==
X-Gm-Message-State: AOAM531qfVOmAK4Y/AKqHzzGmjZPESblJaZRI1DHl2OvaMtS8+Bjov46
        pCLLXhYp4JVFNxNPGjSAEARkVYmEtskfawd2mnmj/rkI4yboiacFO7sM4N73GLIR6W+Bdlgpqu7
        rJh62dKAggD2KFa3hl4miRQQ=
X-Received: by 2002:a1c:e1c2:: with SMTP id y185mr7496054wmg.81.1601846451534;
        Sun, 04 Oct 2020 14:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn4Hd6TtyhT0p+xPbZI3meAJKC/HVsWYslEuv4MEGUg9KkhDr7hrgd8rnUMelVtkpcHdUbtg==
X-Received: by 2002:a1c:e1c2:: with SMTP id y185mr7496032wmg.81.1601846451079;
        Sun, 04 Oct 2020 14:20:51 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a81sm10635433wmf.32.2020.10.04.14.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 14:20:50 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D8205183A1F; Sun,  4 Oct 2020 23:20:49 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br>,
        xdp-newbies@vger.kernel.org
Subject: Re: Create copy of packate given to BPF
In-Reply-To: <CAPyJoHk74hN6roX+-66fU1H03ZRsO5qtpGiH9mwiXzdzqqYpQw@mail.gmail.com>
References: <CAPyJoHk74hN6roX+-66fU1H03ZRsO5qtpGiH9mwiXzdzqqYpQw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sun, 04 Oct 2020 23:20:49 +0200
Message-ID: <87sgatpu1a.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br> writes:

> Hi,
>
> I'd like to create a copy of a packet inside a BPF program, alter some
> of its headers and redirect it and the original packet to different
> interfaces, either on XDP or TC layers.
>
> By taking a look at the helpers list, I have the impression this is
> not currently supported, but as things evolve rapidly in the BPF area,
> I want to make sure I'm not overlooking anything.
>
> So, is there a way to do this today?

You're quite right, there isn't. There's work in progress, though, which
will eventually allow this (for XDP):

https://lore.kernel.org/bpf/20200907082724.1721685-1-liuhangbin@gmail.com/

-Toke

