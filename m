Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB70D45B1F
	for <lists+xdp-newbies@lfdr.de>; Fri, 14 Jun 2019 13:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfFNLHp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 14 Jun 2019 07:07:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37398 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbfFNLHp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 14 Jun 2019 07:07:45 -0400
Received: by mail-lj1-f196.google.com with SMTP id 131so1981357ljf.4
        for <xdp-newbies@vger.kernel.org>; Fri, 14 Jun 2019 04:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=3VuI/ARgBvHW+hRNPoKYYqvTrzb3zzgYFggaO8Tlsxg=;
        b=qaGr/GuMH4jcaHyL1qVRf1ORhK5XFI6+4pvPTU4/GGQ3wrqo1DgT/xM+T4946z7i3B
         eTfTSg3UTvuSaewdHxTRnHbjhD0uGTL5WnBeULaPVHxIVduKU6acxwg3RvwuC89rV5wM
         roZoKQ1SWW08YxqjPWQGuBhBjQPpdR6tNfs6AcPhotka4BA/AafV/doBj8b5Yq+yk/1P
         lT7YyxYddPy+egDR1ls0t+zIAkfTQnpp/06hF6swGCIF+fz2A6xXVo4LESZyUX1sn646
         OEIrBDHnXL/48HkCQ9CmVc3yzNTlwC4QSJLCkGvpoR6bGz/8OoaLZY8R8Qfk9FGs5+m2
         B57Q==
X-Gm-Message-State: APjAAAV/DxHIsczXJ0Y/8Lb94rB151EO/pLUwUH6AY6dsk4u0mgt/WVl
        NqcHXS01LSUvCnj8gLGbkjDp+Q==
X-Google-Smtp-Source: APXvYqywJtw6aSaN0OG9Qqe+rCRaZUDaVXIDDZIoFUX2H+0ODNlrFkK7wX/+s7uKRKpppxfOJcYlaw==
X-Received: by 2002:a2e:5341:: with SMTP id t1mr40303992ljd.170.1560510463983;
        Fri, 14 Jun 2019 04:07:43 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id b25sm427666lff.42.2019.06.14.04.07.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 04:07:43 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 6399D1804AF; Fri, 14 Jun 2019 13:07:42 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Toshiaki Makita <toshiaki.makita1@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Cc:     Toshiaki Makita <toshiaki.makita1@gmail.com>,
        netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        bpf@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        David Ahern <dsahern@gmail.com>
Subject: Re: [PATCH bpf 3/3] devmap: Add missing RCU read lock on flush
In-Reply-To: <20190614082015.23336-4-toshiaki.makita1@gmail.com>
References: <20190614082015.23336-1-toshiaki.makita1@gmail.com> <20190614082015.23336-4-toshiaki.makita1@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 14 Jun 2019 13:07:42 +0200
Message-ID: <874l4sctmp.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Toshiaki Makita <toshiaki.makita1@gmail.com> writes:

> .ndo_xdp_xmit() assumes it is called under RCU. For example virtio_net
> uses RCU to detect it has setup the resources for tx. The assumption
> accidentally broke when introducing bulk queue in devmap.
>
> Fixes: 5d053f9da431 ("bpf: devmap prepare xdp frames for bulking")
> Reported-by: David Ahern <dsahern@gmail.com>
> Signed-off-by: Toshiaki Makita <toshiaki.makita1@gmail.com>
> ---

I think this is still needed, but the patch context is going to conflict
with the patch I linked above... I guess it's up to the maintainers to
decide which order to merge them in :)

-Toke
