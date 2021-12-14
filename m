Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C77474077
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 11:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhLNKcZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 05:32:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35075 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231273AbhLNKcZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 05:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639477943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3tE4oTwtj3FhE0xAWro2y4ny7A4UdHSJcgyvuVlcQWk=;
        b=bQmAy8t/KKjiOb5z5ATRWyJdmZ0SETuoSeBvgXNJ70DJkxK7sgcnlIjk8VsFppMqILW6mn
        RC0ZazXC0MnoctlfJ3SHN2KkD5iQktHgU/9uSPMg3JG1ZJPoMnvANKGWsM6INcrz8JrbMN
        z0yV/Pc/JeQia9vPx/zOYJ1chp79Wrw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-dNUQIfGDMdGKUqc9DbKc4w-1; Tue, 14 Dec 2021 05:32:22 -0500
X-MC-Unique: dNUQIfGDMdGKUqc9DbKc4w-1
Received: by mail-ed1-f71.google.com with SMTP id bx28-20020a0564020b5c00b003e7c42443dbso16528633edb.15
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Dec 2021 02:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=3tE4oTwtj3FhE0xAWro2y4ny7A4UdHSJcgyvuVlcQWk=;
        b=lEyAefZ3ua3AUXiXj05coDTkVqkPy5IpG0cAGJqC6R8W8A+V7T7RZmEMaSEIczUEgn
         hHZdZdvy61ebZIIgUe3CVVf9n6u6imPOFRsHvn+J/gAOo0u/ZvUB7tjL4zd3XFrRxXSS
         17PLHIke25Khu/oGPyruQHJs3HvLn5aHr7oWP3IemXrsTgNSXtXj9Qqz8yDUvIb6k7uQ
         PgS1TPjD+pSW2WsUiUfdnRwCLLm8VUOsY8DRldzdXdZegLOrVNuJrc5PAgSXjvrnYJMA
         wBjIf+zSLyv+5NJun+KQtMkRv2roYqr81nXZTxJUUOb10PGOs3U8qdWvhMg0DX1s5p18
         9c6w==
X-Gm-Message-State: AOAM531H0jND+PegkWQm42QE7MYjo0cAj3Q2UODn2XkAAwVO9TiTCijh
        DEvU944gr0vDsESJ39DKtHx62PQ96Cw9+T64/UIats+Ak22cU3hYWyI8ksmIObBanqPjVQYqsZs
        arDoDj2ofQHt2HyihMzuEQUg=
X-Received: by 2002:a17:907:9802:: with SMTP id ji2mr4776575ejc.400.1639477941448;
        Tue, 14 Dec 2021 02:32:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGh7ZayuJLMUX/s5W5I1Qu0NKW9ELg3EajkIh+68s8t9yknx4t9nCdnoah+0Ynx5ljfZGdug==
X-Received: by 2002:a17:907:9802:: with SMTP id ji2mr4776554ejc.400.1639477941153;
        Tue, 14 Dec 2021 02:32:21 -0800 (PST)
Received: from [192.168.2.15] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id sd28sm7430862ejc.37.2021.12.14.02.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 02:32:20 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
Date:   Tue, 14 Dec 2021 11:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com, Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: Re: AF_XDP not transmitting frames immediately
Content-Language: en-US
To:     "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 14/12/2021 09.07, Karlsson, Magnus wrote:
> 
> 
>> -----Original Message----- From: Jesper Dangaard Brouer
>> <jbrouer@redhat.com> Sent: Monday, December 13, 2021 10:04 PM To:
>> Karlsson, Magnus <magnus.karlsson@intel.com>; Björn Töpel 
>> <bjorn@kernel.org> Cc: Brouer, Jesper <brouer@redhat.com>; Xdp
>> <xdp- newbies@vger.kernel.org>; Ong, Boon Leong
>> <boon.leong.ong@intel.com>; Joao Pedro Barros Silva
>> <jopbs@vestas.com>; Diogo Alexandre Da Silva Lima 
>> <dioli@vestas.com> Subject: AF_XDP not transmitting frames
>> immediately
>> 
>> Hi Magnus and Bjørn,
>> 
>> I'm coding on an AF_XDP program[1] that need to send (a bulk of
>> packets) in a short time-window (related to Time-Triggered
>> Ethernet).
>> 
>> My observations are that AF_XDP doesn't send the frames
>> immediately. And yes, I do call sendto() to trigger a TX kick. In
>> zero-copy mode this is particular bad.  My program want to send 4
>> packets in a burst, but I'm observing 8 packets grouped together on
>> the receiving host.
>> 
>> Is the a known property of AF_XDP?
> 
> Nope! It is supposed to be able to send one packet at a time, though
> I have several times seen bugs in the drivers where the batching
> behavior shines through like this, and once a bug in the core code.
> There is even a test these days for just sending a single packet,

Where is that test in the kernel tree?

> since we have had issues with this in the past. That test does pass
> in bpf-next, but it is only run with the veth driver that does not
> support zero-copy so could still be an issue. What driver are you
> using in zero-copy mode and what kernel version are you on?

Driver: igc with Intel chip i225

Kernel version: 5.15.0-net-next+ #618 SMP PREEMPT
  - Devel branch at commit 6d3b1b069946 (v5.15-12802-g6d3b1b069946)

>> How can I get AF_XDP to "flush" TX packets when calling sendto()? 
>> Should we add another flag than the current MSG_DONTWAIT?
> 
> In zero-copy mode with softirq driver processing (not busy poll), a
> sendto will just trigger the xsk_wakeup ndo that schedules napi
> unless it is already executing. It is up to the driver to then get
> packets from the Tx ring and put them on the HW and make sure they
> are sent. Barring any HW quirks, sending one packets should be
> perfectly fine.

I will investigate driver level issues.

I have other (100G) NICs in my testlab, but I'm using these 1G NICs 
because they support hardware timestamping, which allows me to 
investigate these timing issues.
I'll find a way to see of other drivers behave differently.

>> Hint, I'm using tcpdump hardware timestamping on receiving hist via
>> cmdline:
>> 
>> tcpdump -vv -s0 -ni eth1 -j adapter_unsynced --time-stamp-precision=nano -w af_xdp_tx_cyclic.dump42
>> 
>> Notice[1] on specific branch: [1] 
>> https://github.com/xdp-project/bpf-examples/tree/vestas03_AF_XDP_example/AF_XDP-interaction
> 

Thanks for your feedback,
--Jesper

