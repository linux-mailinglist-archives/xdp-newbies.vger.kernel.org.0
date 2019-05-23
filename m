Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1036E27C92
	for <lists+xdp-newbies@lfdr.de>; Thu, 23 May 2019 14:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729902AbfEWMS3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Thu, 23 May 2019 08:18:29 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36426 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbfEWMS3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 23 May 2019 08:18:29 -0400
Received: by mail-ed1-f66.google.com with SMTP id a8so8955482edx.3
        for <xdp-newbies@vger.kernel.org>; Thu, 23 May 2019 05:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=rxZARgzyKwvZhDguBljxBhZmaZ0ydLiz2MNhp2FjDYk=;
        b=WsMk0DCr4TlKOQYXUjKnPXM9DYb8spqvFbFTKndI7yUwRPWLBOoJBHCE+yETDhHuii
         P1yJ+/E8wE9GhFI8ERoTj/YiCKm0OoeahStQ4xkKkSscUTwwlvQ2F9zCcncZUm2i9RSH
         Qel+eR/1D5NyCwHVas2BsTcMseCU6GAok/AVwSjUdhxr2M3sr+VAORJLw710LvZsIVoo
         NYUhkUrKWFMiCPcjx8X3D1ZZ6jX4n7fE1Z7F1xfUY9YDQYr5IqUuYsyzwsVSipjWo7OW
         CspGD7ML+ijwlFwUlOHK78SYVdNd0Z+YZm+eyMuHPrzmrSy6sk6BOif60A/w52kIGwL6
         MMlw==
X-Gm-Message-State: APjAAAWXNOpm5ud90UB6D8R+quscQk+d06kVXwLgLI+fNoaAdRWoiHV/
        yD+HSXvbH0zsSCFWoyy/CvtLkA==
X-Google-Smtp-Source: APXvYqyTF7KNLpdOMrkV3L1clEepiBJZdg9h5zWlcFGTYRVw+Kx24+mH8rqcRJqJdNDp7dLPB9GMIQ==
X-Received: by 2002:a50:ab1d:: with SMTP id s29mr97141900edc.56.1558613907938;
        Thu, 23 May 2019 05:18:27 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id s23sm1127982edb.12.2019.05.23.05.18.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 05:18:27 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 7E4671800B1; Thu, 23 May 2019 14:18:25 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Cc:     netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 3/3] veth: Support bulk XDP_TX
In-Reply-To: <599302b2-96d2-b571-01ee-f4914acaf765@lab.ntt.co.jp>
References: <1558609008-2590-1-git-send-email-makita.toshiaki@lab.ntt.co.jp> <1558609008-2590-4-git-send-email-makita.toshiaki@lab.ntt.co.jp> <87zhnd1kg9.fsf@toke.dk> <599302b2-96d2-b571-01ee-f4914acaf765@lab.ntt.co.jp>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 23 May 2019 14:18:25 +0200
Message-ID: <87sgt51i0e.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp> writes:

> On 2019/05/23 20:25, Toke Høiland-Jørgensen wrote:
>> Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp> writes:
>> 
>>> This improves XDP_TX performance by about 8%.
>>>
>>> Here are single core XDP_TX test results. CPU consumptions are taken
>>> from "perf report --no-child".
>>>
>>> - Before:
>>>
>>>   7.26 Mpps
>>>
>>>   _raw_spin_lock  7.83%
>>>   veth_xdp_xmit  12.23%
>>>
>>> - After:
>>>
>>>   7.84 Mpps
>>>
>>>   _raw_spin_lock  1.17%
>>>   veth_xdp_xmit   6.45%
>>>
>>> Signed-off-by: Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>
>>> ---
>>>  drivers/net/veth.c | 26 +++++++++++++++++++++++++-
>>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
>>> index 52110e5..4edc75f 100644
>>> --- a/drivers/net/veth.c
>>> +++ b/drivers/net/veth.c
>>> @@ -442,6 +442,23 @@ static int veth_xdp_xmit(struct net_device *dev, int n,
>>>  	return ret;
>>>  }
>>>  
>>> +static void veth_xdp_flush_bq(struct net_device *dev)
>>> +{
>>> +	struct xdp_tx_bulk_queue *bq = this_cpu_ptr(&xdp_tx_bq);
>>> +	int sent, i, err = 0;
>>> +
>>> +	sent = veth_xdp_xmit(dev, bq->count, bq->q, 0);
>> 
>> Wait, veth_xdp_xmit() is just putting frames on a pointer ring. So
>> you're introducing an additional per-cpu bulk queue, only to avoid lock
>> contention around the existing pointer ring. But the pointer ring is
>> per-rq, so if you have lock contention, this means you must have
>> multiple CPUs servicing the same rq, no?
>
> Yes, it's possible. Not recommended though.
>
>> So why not just fix that instead?
>
> The queues are shared with packets from stack sent from peer. That's
> because I needed the lock. I have tried to separate the queues, one for
> redirect and one for stack, but receiver side got too complicated and it
> ended up with worse performance.

I meant fix it with configuration. Now many receive queues are you
running on the veth device in your benchmarks, and how have you
configured the RPS?

-Toke
