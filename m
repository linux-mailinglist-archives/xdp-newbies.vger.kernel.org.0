Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450AE27B72
	for <lists+xdp-newbies@lfdr.de>; Thu, 23 May 2019 13:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbfEWLLY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 23 May 2019 07:11:24 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42160 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbfEWLLY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 23 May 2019 07:11:24 -0400
Received: by mail-ed1-f65.google.com with SMTP id l25so8640040eda.9
        for <xdp-newbies@vger.kernel.org>; Thu, 23 May 2019 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=TEcYx4e8I1IBeEOAlN0GMJ9nUk33G79fZt9bS9b3jQw=;
        b=kjUjM/c/kATKUkoc9ObUGzRm7XoJmd5CyA8ADbC/i67jd3QRJ/U3ZiQg6WvZCx5U5U
         eZZ5VEeiwOiAsNpNIm70OukG7VSgl4xBMeUnI40DsDwIVgwAMrVjKUC8ifUcvCWwKFSj
         MuIezEdwwUcLoxRYU6sd0HYjR8ire6l0PUoC2JklpA5SWu7YNz6DyVX/AL8KNfi45qrZ
         +vmSg6uGZ6oU3V52+4TkRKkRf2vaR2uQxyhPCni9deobM5RmwLWYLgLFVQOzP/1uulfp
         IG/4xECGYpVUeabXfTF0oZFb17SXaFwyTEzAu6AO2ahGkd87ATM801fHVE+PzNcXRZrE
         8xJQ==
X-Gm-Message-State: APjAAAUjnGaYHWrk2/b3GA7248H0LoVlDcOGyLVMpuh4OloQN+kJIJI+
        KOp0STkuR4rlXHUQk2n3DJN4ug==
X-Google-Smtp-Source: APXvYqzVQN2E/n7NMyN+o7d/FeA07G5C5giBp7Fy4y1Q2TrCQUrXc3jEJ0axiPSawB/9FYlrw10fug==
X-Received: by 2002:a50:a389:: with SMTP id s9mr95264723edb.113.1558609882589;
        Thu, 23 May 2019 04:11:22 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id 26sm4272690ejy.78.2019.05.23.04.11.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 04:11:21 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id E4AEC1800B1; Thu, 23 May 2019 13:11:20 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Cc:     Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>,
        netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/3] xdp: Add bulk XDP_TX queue
In-Reply-To: <1558609008-2590-2-git-send-email-makita.toshiaki@lab.ntt.co.jp>
References: <1558609008-2590-1-git-send-email-makita.toshiaki@lab.ntt.co.jp> <1558609008-2590-2-git-send-email-makita.toshiaki@lab.ntt.co.jp>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 23 May 2019 13:11:20 +0200
Message-ID: <8736l52zon.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp> writes:

> XDP_TX is similar to XDP_REDIRECT as it essentially redirects packets to
> the device itself. XDP_REDIRECT has bulk transmit mechanism to avoid the
> heavy cost of indirect call but it also reduces lock acquisition on the
> destination device that needs locks like veth and tun.
>
> XDP_TX does not use indirect calls but drivers which require locks can
> benefit from the bulk transmit for XDP_TX as well.

XDP_TX happens on the same device, so there's an implicit bulking
happening because of the NAPI cycle. So why is an additional mechanism
needed (in the general case)?

-Toke
