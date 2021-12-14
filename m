Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364AA474471
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 15:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbhLNOFC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 09:05:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22414 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232598AbhLNOFC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 09:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639490701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TfobCrYYmiOTKJhE6xPzvjRR4O3nW9ZOgXXYL53gFlU=;
        b=PXEjzTnfPoR8i1XweVvYxdrl+bFBUAg1Ke2CKl3j+RbU1GYvvbtCwG63SNJ31SB78eLRrP
        RGeGINMAcOFJeKrPhsyzHiQOmcp7ntqw9W+Fh3oP9JqAsBzN9P/Ufdn0wv5SX6miS3BAaR
        MEbhUAYdL9NBazuA2+3mrgXCfxrMmFQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-5UG8fg79NiiHgwNAwtxw1A-1; Tue, 14 Dec 2021 09:04:59 -0500
X-MC-Unique: 5UG8fg79NiiHgwNAwtxw1A-1
Received: by mail-wm1-f71.google.com with SMTP id j20-20020a05600c1c1400b00343ad0c4c40so1287516wms.0
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Dec 2021 06:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=TfobCrYYmiOTKJhE6xPzvjRR4O3nW9ZOgXXYL53gFlU=;
        b=bgVGAdJLrE+w9/0O3ur6/3GHylw0g6A0TRHr1xLOrKJXH8SvE2xOM6VaVuBaEUny2X
         85wnEymeyNw1tiU1rCrXfFJ0v8WDOXaQSzcngbmM0PtECFZS/2PSd3JgTSklUHkTXQ/O
         4hQ1lkk7qHqARoo7tCHz7oWv3/8JWlp5OP9Kndo8fK2Vi8hjQjW7Jag9uSVZ3CFWyv7v
         cD4JKQn8apWvnwXYFGScuwMZx4+4dPQWCN6L0TgM33IG8H4SPa13N0k9yKeotnskOhQM
         fWPS5I7tYexbx3/vn1DW9ubfrtxaJkLsDrg1kag8S9wPU1D9z2Qqh5IftpYjmxKENESy
         AkZQ==
X-Gm-Message-State: AOAM532UufRMIUZcPE6j2Goo9soP8G1NdejVwGAampiOSYhkYgpCIMxT
        3eB0zk65DZu6VP7k+h/KdD0Se5IURca9o21WcA66+E1ewJazLi0MkXjFNjNZXiw6EEP4JjnhXUj
        hBK/k4mbaXQHVb83woMcZTYs=
X-Received: by 2002:adf:f40f:: with SMTP id g15mr6036472wro.536.1639490697962;
        Tue, 14 Dec 2021 06:04:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYCkgWsPLjYeoF+w9x5IIDRTmv/2oEW8UOVCEeb/DOVwQGRIB9Odial4R0dWaQs0TaqdHtpg==
X-Received: by 2002:adf:f40f:: with SMTP id g15mr6036430wro.536.1639490697655;
        Tue, 14 Dec 2021 06:04:57 -0800 (PST)
Received: from [192.168.2.15] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id t189sm2231662wma.8.2021.12.14.06.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 06:04:57 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <65b16496-1b4e-55d9-ea17-610cfd923792@redhat.com>
Date:   Tue, 14 Dec 2021 15:04:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com, Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        "Desouza, Ederson" <ederson.desouza@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: Re: AF_XDP not transmitting frames immediately
Content-Language: en-US
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
 <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <Ybh/LIiS8ZHSXRDw@boxer>
In-Reply-To: <Ybh/LIiS8ZHSXRDw@boxer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 14/12/2021 12.25, Maciej Fijalkowski wrote:
> On Tue, Dec 14, 2021 at 10:40:05AM +0000, Karlsson, Magnus wrote:
>> Adding Ederson and Maciej.
>>
>>> On 14/12/2021 09.07, Karlsson, Magnus wrote:
>>>>
>>>>
>>>>> -----Original Message----- From: Jesper Dangaard Brouer
>>>>> <jbrouer@redhat.com> Sent: Monday, December 13, 2021 10:04 PM To:
>>>>> Karlsson, Magnus <magnus.karlsson@intel.com>; Björn Töpel
>>>>> <bjorn@kernel.org> Cc: Brouer, Jesper <brouer@redhat.com>; Xdp
>>>>> <xdp- newbies@vger.kernel.org>; Ong, Boon Leong
>>>>> <boon.leong.ong@intel.com>; Joao Pedro Barros Silva
>>>>> <jopbs@vestas.com>; Diogo Alexandre Da Silva Lima <dioli@vestas.com>
>>>>> Subject: AF_XDP not transmitting frames immediately
>>>>>
>>>>> Hi Magnus and Bjørn,
>>>>>
>>>>> I'm coding on an AF_XDP program[1] that need to send (a bulk of
>>>>> packets) in a short time-window (related to Time-Triggered Ethernet).
>>>>>
>>>>> My observations are that AF_XDP doesn't send the frames immediately.
>>>>> And yes, I do call sendto() to trigger a TX kick. In zero-copy mode
>>>>> this is particular bad.  My program want to send 4 packets in a
>>>>> burst, but I'm observing 8 packets grouped together on the receiving
>>>>> host.
>>>>>
>>>>> Is the a known property of AF_XDP?
>>>>
>>>> Nope! It is supposed to be able to send one packet at a time, though I
>>>> have several times seen bugs in the drivers where the batching
>>>> behavior shines through like this, and once a bug in the core code.
>>>> There is even a test these days for just sending a single packet,
>>>
>>> Where is that test in the kernel tree?
>>
>> In tools/testing/selftests/bpf/xdpxceiver.c. It is the RUN_TO_COMPLETION_SINGLE_PKT test. But the framework only operates on veth currently.
> 
> I'd say it's driver's fault. Magnus fixed something similar for i40e:
> https://lore.kernel.org/netdev/20210401172107.1191618-3-anthony.l.nguyen@intel.com/

Thanks for that hint.

> 
> We don't have currently igc HW on our side to dig this :<

I suspected Boon Leong (cc) would have this hardware.

>>
>>>> since we have had issues with this in the past. That test does pass in
>>>> bpf-next, but it is only run with the veth driver that does not
>>>> support zero-copy so could still be an issue. What driver are you
>>>> using in zero-copy mode and what kernel version are you on?
>>>
>>> Driver: igc with Intel chip i225
>>
>> Have never tried this one personally. Do not know if I have one in the lab but let me check.
>>
>> Ederson, do you have any experience with this card and if so, have you seen something similar?
>>
>>> Kernel version: 5.15.0-net-next+ #618 SMP PREEMPT
>>>    - Devel branch at commit 6d3b1b069946 (v5.15-12802-g6d3b1b069946)
>>>
>>>>> How can I get AF_XDP to "flush" TX packets when calling sendto()?
>>>>> Should we add another flag than the current MSG_DONTWAIT?
>>>>
>>>> In zero-copy mode with softirq driver processing (not busy poll), a
>>>> sendto will just trigger the xsk_wakeup ndo that schedules napi unless
>>>> it is already executing. It is up to the driver to then get packets
>>>> from the Tx ring and put them on the HW and make sure they are sent.
>>>> Barring any HW quirks, sending one packets should be perfectly fine.
>>>
>>> I will investigate driver level issues.
>>>
>>> I have other (100G) NICs in my testlab, but I'm using these 1G NICs because
>>> they support hardware timestamping, which allows me to investigate these
>>> timing issues.
>>> I'll find a way to see of other drivers behave differently.
>>
>> Would be great if you could check if the problem also exists on e.g. ice.
>>

Having issues getting my ICE hardware to link up.

I tested that driver i40e works as expected. Thus, this is likely an 
issue with the driver.  I will digg some more.


>>>>> Hint, I'm using tcpdump hardware timestamping on receiving hist via
>>>>> cmdline:
>>>>>
>>>>> tcpdump -vv -s0 -ni eth1 -j adapter_unsynced
>>>>> --time-stamp-precision=nano -w af_xdp_tx_cyclic.dump42
>>>>>
>>>>> Notice[1] on specific branch: 

[1] 
https://github.com/xdp-project/bpf-examples/tree/vestas03_AF_XDP_example/AF_XDP-interaction

In [1] I tried to play with SO_PREFER_BUSY_POLL, but it didn't make a 
difference.

[2] https://github.com/xdp-project/bpf-examples/commit/3685d5ea93fced

--Jesper

