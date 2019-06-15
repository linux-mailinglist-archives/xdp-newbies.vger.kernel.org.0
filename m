Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC0346F74
	for <lists+xdp-newbies@lfdr.de>; Sat, 15 Jun 2019 12:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfFOKKE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Sat, 15 Jun 2019 06:10:04 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39637 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfFOKKE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 15 Jun 2019 06:10:04 -0400
Received: by mail-ed1-f66.google.com with SMTP id m10so7424342edv.6
        for <xdp-newbies@vger.kernel.org>; Sat, 15 Jun 2019 03:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=E5g/m2oNw0FmOnRwBHRfp/fjjyfTq1G4GJO9NWyBiak=;
        b=L5IGD133uhGTiKMY7NVTumt/UCYHlFefLh55YThTCWpcuQTEYEW5+0stNLuLz/7cBt
         gJ/cTcZoTPH+mhG3yLtSAbrm8H5a9Vjc0yl0eTav68KDd5a0m8Am570BbZ8g1Lc1EvnY
         T7rx2FYVlZwDCCY6/l0T4MYmeobY0wT+jRlYjnzrQB0cA5RgMTMTzCHt3zIJE3gJgGSO
         uQRGFBZrB/TqfvrP3xzAQkF0wW/jzeoauHTUzNSSaPuop+NdA2JgiKKZEf4tzm8bksuI
         noxeeoXfuDVf9/thugqEDWMlr95zCZF+ZASQ5slrJ/7vn/6pYMAaeSR3UY8B6yFjmdx2
         612w==
X-Gm-Message-State: APjAAAWb6KGVYRMHoYMbUjB3a7a6bmIMuKYRhA48dh09Hf9aXVaMeh58
        4DddCtpxVp2EdC70QwttUvQw6g==
X-Google-Smtp-Source: APXvYqzCPAU0G5SPBb3xNUalstBRFbSLtXj+BEgB2SaVj0rv4Pog5MGdF0GDUelBpwAAa2JHfqQ8Qg==
X-Received: by 2002:a50:8974:: with SMTP id f49mr52230644edf.95.1560593402393;
        Sat, 15 Jun 2019 03:10:02 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (borgediget.toke.dk. [85.204.121.218])
        by smtp.gmail.com with ESMTPSA id k51sm1753562edb.7.2019.06.15.03.10.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 03:10:01 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 013981804AF; Sat, 15 Jun 2019 12:10:00 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Daniel Borkmann <daniel@iogearbox.net>,
        Toshiaki Makita <toshiaki.makita1@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Cc:     netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        bpf@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        David Ahern <dsahern@gmail.com>
Subject: Re: [PATCH bpf 1/3] devmap: Fix premature entry free on destroying map
In-Reply-To: <5f6efec8-87f8-4ac5-46ee-47788dbf1d44@iogearbox.net>
References: <20190614082015.23336-1-toshiaki.makita1@gmail.com> <20190614082015.23336-2-toshiaki.makita1@gmail.com> <877e9octre.fsf@toke.dk> <87sgscbc5d.fsf@toke.dk> <fb895684-c863-e580-f36a-30722c480b41@gmail.com> <87muikb9ev.fsf@toke.dk> <5f6efec8-87f8-4ac5-46ee-47788dbf1d44@iogearbox.net>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 15 Jun 2019 12:10:00 +0200
Message-ID: <87r27v9n2f.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Daniel Borkmann <daniel@iogearbox.net> writes:

> On 06/14/2019 03:09 PM, Toke Høiland-Jørgensen wrote:
>> Toshiaki Makita <toshiaki.makita1@gmail.com> writes:
> [...]
>>>> Alternatively, since this entire series should probably go to stable, I
>>>> can respin mine on top of it?
>>>
>>> Indeed conflict will happen, as this is for 'bpf' not 'bpf-next'.
>>> Sorry for disturbing your work.
>> 
>> Oh, no worries!
>> 
>>> I'm also not sure how to proceed in this case.
>> 
>> I guess we'll leave that up to the maintainers :)
>
> So all three look good to me, I've applied them to bpf tree. Fixes to
> bpf do have precedence over patches to bpf-next given they need to
> land in the current release. I'll get bpf out later tonight and ask
> David to merge net into net-next after that since rebase is also
> needed for Stanislav's cgroup series. We'll then flush out bpf-next so
> we can fast-fwd to net-next to pull in all the dependencies.

Right, I'll wait for that, then rebase my series and resubmit

-Toke
