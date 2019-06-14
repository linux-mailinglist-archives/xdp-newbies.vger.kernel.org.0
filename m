Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E94C45D83
	for <lists+xdp-newbies@lfdr.de>; Fri, 14 Jun 2019 15:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbfFNNJt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Fri, 14 Jun 2019 09:09:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44024 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbfFNNJs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 14 Jun 2019 09:09:48 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so2320826ljv.10
        for <xdp-newbies@vger.kernel.org>; Fri, 14 Jun 2019 06:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=Is2zt4xuPWFEApbl5ORBmK+IPfz3ajAdFURJMG4yxiY=;
        b=GAMF6oG1qJTDZWu2mkadoiPDnrycZASrhABO8SP9qaOiT/7E3LwbX4Yqwb/YHR7Djk
         R24aZDHoqfqMFbeEp950AGHx0sYCInNCP9zBxffPD47w15S/HkCkYGDTChvxMTshzBmF
         BWenfO2W6juakgmOpxJ6q6C62osmrP+yLjyLFuZMGoXPGwsRfy9voo/EVQCNfwNomTTQ
         /hglRPctyvzUztNjBk4bwVb3qL8zxFY68PtSlRI+LRW2tMd2aMgoOcISaXjL40PqPH1m
         n1RTqP0L0llUaLbPvXfOb+9K87ruBm0X+CUPRoj5kaNau2ry1qyo37AcYdE2lvVtRjZp
         wNeQ==
X-Gm-Message-State: APjAAAWUGzcA6rVzrStx0rYggH9Mkdng4JGmDnMbw8wILEhu2wFI9ODM
        MkJ7pKWHZTQYmk5ELkXpOTTEfw==
X-Google-Smtp-Source: APXvYqy72eIYPlb2FmXUPnqstUqE4swr4j71twVWOCQULDu7nh6B1rq+hQAZn+NfTS9xe6oOaOf67A==
X-Received: by 2002:a2e:9198:: with SMTP id f24mr4297835ljg.221.1560517786638;
        Fri, 14 Jun 2019 06:09:46 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id 25sm587526ljn.62.2019.06.14.06.09.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 06:09:45 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D6EC31804AF; Fri, 14 Jun 2019 15:09:44 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Toshiaki Makita <toshiaki.makita1@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Cc:     netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        bpf@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        David Ahern <dsahern@gmail.com>
Subject: Re: [PATCH bpf 1/3] devmap: Fix premature entry free on destroying map
In-Reply-To: <fb895684-c863-e580-f36a-30722c480b41@gmail.com>
References: <20190614082015.23336-1-toshiaki.makita1@gmail.com> <20190614082015.23336-2-toshiaki.makita1@gmail.com> <877e9octre.fsf@toke.dk> <87sgscbc5d.fsf@toke.dk> <fb895684-c863-e580-f36a-30722c480b41@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 14 Jun 2019 15:09:44 +0200
Message-ID: <87muikb9ev.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Toshiaki Makita <toshiaki.makita1@gmail.com> writes:

> On 19/06/14 (金) 21:10:38, Toke Høiland-Jørgensen wrote:
>> Toke Høiland-Jørgensen <toke@redhat.com> writes:
>> 
>>> Toshiaki Makita <toshiaki.makita1@gmail.com> writes:
>>>
>>>> dev_map_free() waits for flush_needed bitmap to be empty in order to
>>>> ensure all flush operations have completed before freeing its entries.
>>>> However the corresponding clear_bit() was called before using the
>>>> entries, so the entries could be used after free.
>>>>
>>>> All access to the entries needs to be done before clearing the bit.
>>>> It seems commit a5e2da6e9787 ("bpf: netdev is never null in
>>>> __dev_map_flush") accidentally changed the clear_bit() and memory access
>>>> order.
>>>>
>>>> Note that the problem happens only in __dev_map_flush(), not in
>>>> dev_map_flush_old(). dev_map_flush_old() is called only after nulling
>>>> out the corresponding netdev_map entry, so dev_map_free() never frees
>>>> the entry thus no such race happens there.
>>>>
>>>> Fixes: a5e2da6e9787 ("bpf: netdev is never null in __dev_map_flush")
>>>> Signed-off-by: Toshiaki Makita <toshiaki.makita1@gmail.com>
>>>
>>> I recently posted a patch[0] that gets rid of the bitmap entirely, so I
>>> think you can drop this one...
>> 
>> Alternatively, since this entire series should probably go to stable, I
>> can respin mine on top of it?
>
> Indeed conflict will happen, as this is for 'bpf' not 'bpf-next'.
> Sorry for disturbing your work.

Oh, no worries!

> I'm also not sure how to proceed in this case.

I guess we'll leave that up to the maintainers :)

-Toke
