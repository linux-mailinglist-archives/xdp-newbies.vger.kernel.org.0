Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 235BB182E72
	for <lists+xdp-newbies@lfdr.de>; Thu, 12 Mar 2020 12:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgCLLBD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 12 Mar 2020 07:01:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60690 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726817AbgCLLBC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 12 Mar 2020 07:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584010861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8/uHbsru5F4yx6/aR2rQCHNFxhFelklY4rpAa5ARukM=;
        b=LIrE5MAWL051U6idJxLJUc90VMCzcm8ndtxu85+yTenCLILv3lBbbJJjozcVcK2tMplQHn
        lKbpwVRaJvxNjfiR0hVhCuuF/0X3o3Z1dv3AQmmtd1LSLRyfSVb9X0V1G63V7/MxK0RqN9
        MPkvLGekBr0h9vIzpze+jSZrEcoVY3w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-hnsdQPYVOSOP93SVXaLGcQ-1; Thu, 12 Mar 2020 07:01:00 -0400
X-MC-Unique: hnsdQPYVOSOP93SVXaLGcQ-1
Received: by mail-wm1-f72.google.com with SMTP id i24so5206wml.1
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Mar 2020 04:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=8/uHbsru5F4yx6/aR2rQCHNFxhFelklY4rpAa5ARukM=;
        b=U/pkAUhG2XttZswv5rlP+OTVJ84pQuJHbyuHcfU/y255jSdQ0/L8QsoyLQMKRrGfpg
         fKkLPpsprrejhfuMyugBnqFLzvscIaRdU9owYhN5OBVLlGT/P8gNxT4k/OkxZanuWicu
         ZU0suPzbAi3rIZ+E10ikcDZf0P5jMcuC92v/cFlIcceBI9xeR+42rfM7ExUR9UicSNgo
         glID2yTBDU8ERaVak7T6PVLLhKID20cwA7wxZH4Dfi9H0SlOHQ7hgf9JTuawgaaO9Qc5
         54Y6uUEyYZ1jRT5o5628GXKYbE/Wr+FmBGAFL6mmUGWaPlEKQ0WHxc7SrGLYJnCRSNTF
         KQjw==
X-Gm-Message-State: ANhLgQ0QKQUbTlCtHa/tEg3a+xss6iBrkbZjGsl2a7FJB9mXA3pGaTFc
        i7OHs2SYStMeweYPUN2r1jhioIE8bYc0ded8NhenkwXkqjcQN/w6VYhCN7IliNN7W2DkwUIMXZZ
        8YWdygX64NJSzZR+ZxPwDB5U=
X-Received: by 2002:a1c:f319:: with SMTP id q25mr4239425wmq.142.1584010858634;
        Thu, 12 Mar 2020 04:00:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvw05pF9soYFlnqEDGtSinsEupiHZT3qcx4GgXxVBXfszI6nPdWu6+T1Q3QGCiKORum+SUruQ==
X-Received: by 2002:a1c:f319:: with SMTP id q25mr4239412wmq.142.1584010858479;
        Thu, 12 Mar 2020 04:00:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id p16sm10973986wmi.40.2020.03.12.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 04:00:57 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id E799518033D; Thu, 12 Mar 2020 12:00:56 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Gaul\, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Shared Umem between processes
In-Reply-To: <CAJ+HfNjNMhxzXTrwKjOZALO5=3UTgQz0ytyAMs5zoGB0HX29DA@mail.gmail.com>
References: <fd5e40efd5c1426cb4a5942682407ea2@hm.edu> <CAJ+HfNghFctg3L=3QdeoWyqDdj4wP4EKWjYyF01=SmCO5+=32g@mail.gmail.com> <a80ec2c07cb9493eafabb9decf479c60@hm.edu> <CAJ+HfNjiDCdaQm_PocHXC+gHABAO67b6H+f2pf+ZdHRu2uhMVA@mail.gmail.com> <69569dcbc4ce450eb5b2c1905bf11208@hm.edu> <CAJ+HfNi5sstcz20EGq2sak0RpYdBwVO5P+NLX8cALBuG_xsnHw@mail.gmail.com> <046ac5d67f6a447f98266eacaa2c25e5@hm.edu> <CAJ+HfNjNMhxzXTrwKjOZALO5=3UTgQz0ytyAMs5zoGB0HX29DA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 12 Mar 2020 12:00:56 +0100
Message-ID: <87sgidon13.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com> writes:

> On Thu, 12 Mar 2020 at 10:17, Gaul, Maximilian <maximilian.gaul@hm.edu> w=
rote:
>>
> [...]
>>
>> Thank you so much Bj=C3=B6rn!
>>
>> just to wrap things up:
>>
>> - if I want to distribute packet processing from a single RX-Queue to
>> multiple sockets I have to use shared umem because it is not possible
>> to bind multiple af-xdp sockets onto the same RX-Queue
>
> Correct! And you need a tailored XDP program that spreads over the
> shared umem sockets!

Could we lift this restriction? Not with zero-copy, obviously, but if
there's a copy involved it seems it should be possible to support
several sockets on the same RXQ? That would make it possible to use XDP
as a per-CPU load balancer for a single RXQ, like we can do with cpumap
for packets hitting the stack today?

-Toke

