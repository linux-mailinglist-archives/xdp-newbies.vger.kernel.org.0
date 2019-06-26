Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7385567F2
	for <lists+xdp-newbies@lfdr.de>; Wed, 26 Jun 2019 13:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZLwV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Wed, 26 Jun 2019 07:52:21 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39807 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfFZLwU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 26 Jun 2019 07:52:20 -0400
Received: by mail-ed1-f66.google.com with SMTP id m10so2923160edv.6
        for <xdp-newbies@vger.kernel.org>; Wed, 26 Jun 2019 04:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=8G561BLNQLGaDTYbHCNH2H2OpaNjhGWxCsDpZi5dL3U=;
        b=galthT5c20HV47CEwI1QPi0yI7eDmj7Xm6U49Vb25+vOe4POg6WaXx7v+ld9/biqpr
         mbuyqBeRwKu47t8V4imGKH/FEq2QQL+XorM+EwMzLW818YIWhwwSiIkW4GqWn9NZw3wd
         4LAqUjcGgm1dZO0EJQdXRMaYG4RE+KFAxtOnKFYo/5Rb1hIBdUGdjwxbsc5uUrU2qyQc
         v+0z3yBOS3k9uX5d9uqOTy5d2lqCiVrCPLS3scaiDwL0imdggoqTUbXsawucHB4n4Uw2
         0+pykTeOfc8/cIctmSA6IytXIV0xZBf08ZsnQh4kol//KoKr9nzOAjYhPr33ke0RbVbD
         nHag==
X-Gm-Message-State: APjAAAUUZZ7EOJZdeuMCe/Y09RfwrtoCIDIu5L81gFztk9oP/MtFW/FV
        j/h6OvI3TRWf47Y6QqntTO3/Eg==
X-Google-Smtp-Source: APXvYqwKIr+l07YlcItaF1u709UX90xK2Tc7WXRIYF/W13Pw1h+FWXdppcXjDpU3LyQa5Pkme2ZV9Q==
X-Received: by 2002:a17:906:e282:: with SMTP id gg2mr3759266ejb.38.1561549938709;
        Wed, 26 Jun 2019 04:52:18 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id q56sm5689322eda.28.2019.06.26.04.52.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 04:52:18 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id C9CB2181CA7; Wed, 26 Jun 2019 13:52:16 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        "Machulsky\, Zorik" <zorik@amazon.com>
Cc:     "Jubran\, Samih" <sameehj@amazon.com>,
        "davem\@davemloft.net" <davem@davemloft.net>,
        "netdev\@vger.kernel.org" <netdev@vger.kernel.org>,
        "Woodhouse\, David" <dwmw@amazon.co.uk>,
        "Matushevsky\, Alexander" <matua@amazon.com>,
        "Bshara\, Saeed" <saeedb@amazon.com>,
        "Wilson\, Matt" <msw@amazon.com>,
        "Liguori\, Anthony" <aliguori@amazon.com>,
        "Bshara\, Nafea" <nafea@amazon.com>,
        "Tzalik\, Guy" <gtzalik@amazon.com>,
        "Belgazal\, Netanel" <netanel@amazon.com>,
        "Saidi\, Ali" <alisaidi@amazon.com>,
        "Herrenschmidt\, Benjamin" <benh@amazon.com>,
        "Kiyanovski\, Arthur" <akiyano@amazon.com>,
        Daniel Borkmann <borkmann@iogearbox.net>, brouer@redhat.com,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: XDP multi-buffer incl. jumbo-frames (Was: [RFC V1 net-next 1/1] net: ena: implement XDP drop support)
In-Reply-To: <20190626103829.5360ef2d@carbon>
References: <20190623070649.18447-1-sameehj@amazon.com> <20190623070649.18447-2-sameehj@amazon.com> <20190623162133.6b7f24e1@carbon> <A658E65E-93D2-4F10-823D-CC25B081C1B7@amazon.com> <20190626103829.5360ef2d@carbon>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 26 Jun 2019 13:52:16 +0200
Message-ID: <87a7e4d0nj.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Jesper Dangaard Brouer <brouer@redhat.com> writes:

> On Tue, 25 Jun 2019 03:19:22 +0000
> "Machulsky, Zorik" <zorik@amazon.com> wrote:
>
>> ﻿On 6/23/19, 7:21 AM, "Jesper Dangaard Brouer" <brouer@redhat.com> wrote:
>> 
>>     On Sun, 23 Jun 2019 10:06:49 +0300 <sameehj@amazon.com> wrote:
>>     
>>     > This commit implements the basic functionality of drop/pass logic in the
>>     > ena driver.  
>>     
>>     Usually we require a driver to implement all the XDP return codes,
>>     before we accept it.  But as Daniel and I discussed with Zorik during
>>     NetConf[1], we are going to make an exception and accept the driver
>>     if you also implement XDP_TX.
>>     
>>     As we trust that Zorik/Amazon will follow and implement XDP_REDIRECT
>>     later, given he/you wants AF_XDP support which requires XDP_REDIRECT.
>> 
>> Jesper, thanks for your comments and very helpful discussion during
>> NetConf! That's the plan, as we agreed. From our side I would like to
>> reiterate again the importance of multi-buffer support by xdp frame.
>> We would really prefer not to see our MTU shrinking because of xdp
>> support.   
>
> Okay we really need to make a serious attempt to find a way to support
> multi-buffer packets with XDP. With the important criteria of not
> hurting performance of the single-buffer per packet design.
>
> I've created a design document[2], that I will update based on our
> discussions: [2] https://github.com/xdp-project/xdp-project/blob/master/areas/core/xdp-multi-buffer01-design.org
>
> The use-case that really convinced me was Eric's packet header-split.
>
>
> Lets refresh: Why XDP don't have multi-buffer support:
>
> XDP is designed for maximum performance, which is why certain driver-level
> use-cases were not supported, like multi-buffer packets (like jumbo-frames).
> As it e.g. complicated the driver RX-loop and memory model handling.
>
> The single buffer per packet design, is also tied into eBPF Direct-Access
> (DA) to packet data, which can only be allowed if the packet memory is in
> contiguous memory.  This DA feature is essential for XDP performance.
>
>
> One way forward is to define that XDP only get access to the first
> packet buffer, and it cannot see subsequent buffers. For XDP_TX and
> XDP_REDIRECT to work then XDP still need to carry pointers (plus
> len+offset) to the other buffers, which is 16 bytes per extra buffer.

Yeah, I think this would be reasonable. As long as we can have a
metadata field with the full length + still give XDP programs the
ability to truncate the packet (i.e., discard the subsequent pages) I
think many (most?) use cases will work fine without having access to the
full packet data...

-Toke
