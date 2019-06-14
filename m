Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A3D45B16
	for <lists+xdp-newbies@lfdr.de>; Fri, 14 Jun 2019 13:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfFNLE4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 14 Jun 2019 07:04:56 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39000 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfFNLE4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 14 Jun 2019 07:04:56 -0400
Received: by mail-ed1-f67.google.com with SMTP id m10so2923281edv.6
        for <xdp-newbies@vger.kernel.org>; Fri, 14 Jun 2019 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=gDQHdoJkjMyWAWD6F86RlCqtG6jM6BlmY2sdnAminyQ=;
        b=osDsXL2qro0pvUpzNjsTlPB6IHXnQQEakaWcYhlA8kYdKcjj9XIYqEkqVHhKUIFCzk
         HouZWLdlzFYsx0HbrwE3MktLdczRsAvq261m0CSNUeMjPZr9CACs7QtuM+sfQyWZmqkf
         /9ya45sXR+whwbXrGH6VsQ/nOIWaqC1LF3b0vVjmQEi2yuF1PRr4cuxzBLXTX8SuOKwb
         uRaOFu5gtGKke52WaQrOqHthxRlQD3Fgpg217J+OkfrPKF4R/ojZ9VJ7jESlCSP7/W7n
         fk9mdjB6B+000/cy0fAsrYXSWDJ16xEDOnibiKSFwqQfYnyyQs8O7vECSI5PeSZYHjCp
         sCTw==
X-Gm-Message-State: APjAAAUlXLxf0lKygfSxbLPClA5htYKFX1iAT4mDwKPd4SySH8p5QZS7
        5nI9Uc6kiaF1S/qIGg9m412Ajg==
X-Google-Smtp-Source: APXvYqwcvUZZvnmPYJu0xr+xVEs3aP1mvppxJWYLXCIQnzHZQ1D15PovB5fBDPlCB74snV6Ng/xtsA==
X-Received: by 2002:a50:f982:: with SMTP id q2mr31569019edn.270.1560510294552;
        Fri, 14 Jun 2019 04:04:54 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id o93sm790721edd.46.2019.06.14.04.04.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 04:04:53 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 3AF921804AF; Fri, 14 Jun 2019 13:04:53 +0200 (CEST)
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
Subject: Re: [PATCH bpf 1/3] devmap: Fix premature entry free on destroying map
In-Reply-To: <20190614082015.23336-2-toshiaki.makita1@gmail.com>
References: <20190614082015.23336-1-toshiaki.makita1@gmail.com> <20190614082015.23336-2-toshiaki.makita1@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 14 Jun 2019 13:04:53 +0200
Message-ID: <877e9octre.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Toshiaki Makita <toshiaki.makita1@gmail.com> writes:

> dev_map_free() waits for flush_needed bitmap to be empty in order to
> ensure all flush operations have completed before freeing its entries.
> However the corresponding clear_bit() was called before using the
> entries, so the entries could be used after free.
>
> All access to the entries needs to be done before clearing the bit.
> It seems commit a5e2da6e9787 ("bpf: netdev is never null in
> __dev_map_flush") accidentally changed the clear_bit() and memory access
> order.
>
> Note that the problem happens only in __dev_map_flush(), not in
> dev_map_flush_old(). dev_map_flush_old() is called only after nulling
> out the corresponding netdev_map entry, so dev_map_free() never frees
> the entry thus no such race happens there.
>
> Fixes: a5e2da6e9787 ("bpf: netdev is never null in __dev_map_flush")
> Signed-off-by: Toshiaki Makita <toshiaki.makita1@gmail.com>

I recently posted a patch[0] that gets rid of the bitmap entirely, so I
think you can drop this one...

-Toke

[0] https://lore.kernel.org/netdev/156042464148.25684.11881534392137955942.stgit@alrua-x1/
