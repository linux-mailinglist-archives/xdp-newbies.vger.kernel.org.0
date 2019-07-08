Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF3C62B27
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2019 23:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732780AbfGHVi0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Jul 2019 17:38:26 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37811 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730630AbfGHVi0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Jul 2019 17:38:26 -0400
Received: by mail-ed1-f66.google.com with SMTP id w13so15854754eds.4
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2019 14:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=TjVcw0CYIffzRyPjc/XD5ErMebw5Yl6RrE9jxk9zivw=;
        b=dQ7WurQXBPDSp3gDAJeMrd3sqclvqxP/Z3vxeIUW1UDzyE9Wur9llfDVLKibeJOvQM
         fpea+3+rzwYIqDmxi8PSdp0xEa0jqPg5qVPfvctne7J9dqi6IbcpoJUrhLDqlmIiC1li
         Ygkjo5ze4x6ekYJknYUU2UnyaxIIjXHJA33kL1EImbdsts43iJUtQz8G464g7r1K1EMl
         X1ZRLkPF5kiHri7NRH/NqOA1WQ2HyOey9RrFVVO2cebc9KMPoVr0YVAfR6L9VKjoG3ox
         IwPyBoxxOXtTcWQ64au4bqSp3DieI2AO6GZ0iBDMVgvhwmJo3I6mnbBodS5Vmbya0Gij
         TRMA==
X-Gm-Message-State: APjAAAVsMURCgNUxtGH1ZGAxW7F/KyIS+R4yGk03hEg9Yj1fogvvpZ6x
        PhVJTNDxb9QZMwLAAbsL4ZE1+JEkdEE=
X-Google-Smtp-Source: APXvYqyfurgOUuO63SlLOIhM7Pj22cby2RfqmjsdS61wKQ2tFA1kvRiqVyx0VlwR854oG6JQGpx2BQ==
X-Received: by 2002:a17:907:217b:: with SMTP id rl27mr13529125ejb.154.1562621904863;
        Mon, 08 Jul 2019 14:38:24 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id f36sm5910456ede.47.2019.07.08.14.38.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:38:24 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 82FB5181CE6; Mon,  8 Jul 2019 23:38:23 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     David Miller <davem@davemloft.net>, zeffron@riotgames.com
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org
Subject: Re: Should we remove xdp-newbies from kernel patch CC-list?
In-Reply-To: <20190708.143147.1283579050790858840.davem@davemloft.net>
References: <20190704161900.43cec3a7@carbon> <CAC1LvL2Rx4+9QCDPPFYhi3kZj_srEcfw9n6ODAM2yC5jgZvE5A@mail.gmail.com> <20190708.143147.1283579050790858840.davem@davemloft.net>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 08 Jul 2019 23:38:23 +0200
Message-ID: <87wogsxl4g.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

David Miller <davem@davemloft.net> writes:

> From: Zvi Effron <zeffron@riotgames.com>
> Date: Mon, 8 Jul 2019 12:28:52 -0500
>
>> On Thu, Jul 4, 2019 at 9:19 AM Jesper Dangaard Brouer <brouer@redhat.com> wrote:
>>>
>>>
>>> Question to people subscribed to xdp-newbies@vger.kernel.org mailing
>>> list.  As you likely have noticed, patches and kbuild-bot is sending
>>> XDP related kernel stuff to this mailing list.  This is caused by being
>>> listed in the kernel MAINTAINERS file[1].
>>>
>> 
>> I cast my vote for both. Having the named newbies channel send many,
>> many messages with kernel patches is intimidating to new people (and
>> somewhat spammy) which makes it harder to convince my team to sign up
>> for the list. At the same time, I've appreciated being able to see
>> what's happening on patches as well as questions and discussions.
>> 
>> Would it make sense/be possible to create a mailing list for the
>> maintainers file and discussions on patches that is separate from the
>> newbies channel? I have to say, the newbies channel is the only newbie
>> friendly kernel mailing list I've seen, and it's a big part of why I
>> pushed for my company to use XDP over DPDK.
>
> The bpf and netdev lists act as incubators for XDP discussion, so I don't
> know if it's worth making an xdp-devel or something like that.

I'd worry that it would fragment the discussion too much?

-Toke
