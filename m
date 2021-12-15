Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20F4475E41
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Dec 2021 18:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239770AbhLORLX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Dec 2021 12:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46462 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232113AbhLORLW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Dec 2021 12:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639588282;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=01yp6vII+lzdgFSIi3+D+9qDfBmkEL/y/eJg2pyBx9U=;
        b=CoF4+JbNSzaiToKN3cM0wEElDGAzjetG0QyDg/NcHpnWBhoU501bov+sxMZZQtwILIIhMt
        EO732EnqKrVCp0YJKK+A7N/8ortbC05LkVJxlKYaiu+4TTqxhOS2lg6sdJwhs2rsHK+Nkb
        ZwrvHBETmiM6N4JAICX+i4TQanSMysI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-Ue7hGEiJOPmo8pUg-zNXmA-1; Wed, 15 Dec 2021 12:11:21 -0500
X-MC-Unique: Ue7hGEiJOPmo8pUg-zNXmA-1
Received: by mail-ed1-f71.google.com with SMTP id w4-20020aa7cb44000000b003e7c0f7cfffso20793970edt.2
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Dec 2021 09:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=01yp6vII+lzdgFSIi3+D+9qDfBmkEL/y/eJg2pyBx9U=;
        b=0opG+MbAobp0C832pKxGvVyMG65XXgPbmqbq52OWK8zJpIcxxV9VhH0i90yVUT7fPk
         +W+tB4jFm15cKGacmF6tJChI9TEgFfd3MOGqR37b5zNlzPYCELVq34H4yHfLKZ/VilCr
         s05qzoBohzyAGaiVIU926/wwjU48uJWJgbBSOqgQBZtwv3Khw2u8ovWP90hHE58iKXhy
         z0L4Z9NRwKaTxzj0VCae47m61E/3Qt8uXfc3Ru/3Lxv8gY9FYLPNvQsFeC5x5vhUs2EE
         uEES5i1ATngJt0s3FSqmjusid1vpTtqvqmz5GVbELXb/ypUvV6PZf17jgQJRTKetmATr
         SJyQ==
X-Gm-Message-State: AOAM533OjVKxaQ106j8DhdNMTwtMjA/9VMx4KssZBuKp3qzFgbNsOJmA
        CW50S0Zbw5gvhvEOBO/u0KAwbYVkdL7CDUWbAqReTf0qUxi52nlgeUClwwqNNR2oIlhOyDEbTpg
        TjTa0g+4KGKLaGOaYPMdx4zg=
X-Received: by 2002:a05:6402:d09:: with SMTP id eb9mr15536086edb.216.1639588279532;
        Wed, 15 Dec 2021 09:11:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp4DA9IX48265qbjLMWzU0xKL8SUSOIbuNeOgu/t32lK7Ix+RKSQ4nG72omfjWO9+/Lj07Ew==
X-Received: by 2002:a05:6402:d09:: with SMTP id eb9mr15536060edb.216.1639588279319;
        Wed, 15 Dec 2021 09:11:19 -0800 (PST)
Received: from [192.168.2.15] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id hs20sm918024ejc.26.2021.12.15.09.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:11:18 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <2eeb6d48-09b6-993b-d324-d2fc14cbb12b@redhat.com>
Date:   Wed, 15 Dec 2021 18:11:17 +0100
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
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <9e18a444-e30f-4ae8-4e3b-af5e9393e971@redhat.com>
 <MW3PR11MB460208C3A86CF7D4B9B2E1C3F7769@MW3PR11MB4602.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB460208C3A86CF7D4B9B2E1C3F7769@MW3PR11MB4602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 15/12/2021 12.07, Karlsson, Magnus wrote:
> 
>> From: Jesper Dangaard Brouer <jbrouer@redhat.com> On 14/12/2021
>> 09.07, Karlsson, Magnus wrote:
>>> 
>>>> 
>>>> I'm coding on an AF_XDP program[1] that need to send (a bulk
>>>> of packets) in a short time-window (related to Time-Triggered
>>>> Ethernet).
>>>> 
>> [...]
>>> 
>>>> How can I get AF_XDP to "flush" TX packets when calling
>>>> sendto()? Should we add another flag than the current
>>>> MSG_DONTWAIT?
>>> 
>>> In zero-copy mode with softirq driver processing (not busy poll),
>>> a sendto will just trigger the xsk_wakeup ndo that schedules napi
>>> unless it is already executing. It is up to the driver to then
>>> get packets from the Tx ring and put them on the HW and make sure
>>> they are sent. Barring any HW quirks, sending one packets should
>>> be perfectly fine.
>> 
>> This actually doesn't sound so good from my customers use-case
>> PoV. That we only trigger a ndo_xsk_wakeup that schedules napi.
>> 
>> We want to trigger HW transmission immediately. Can we achieve this
>> via using busy-poll mode?
> 
> Yes, but not without napi. The napi context will in this case be
> executed in process context right away, unless it is already running
> somewhere else but that should not be the case. Will this be good
> enough?

"Time" will tell if it is good enough (pun intended).
Meaning I will implement and measure it.
The busy-poll mode does sound like a way forward.

Looking at kernel code, I can see that drivers TX NAPI usually does 
DMA-TX completion *before* transmitting new frames.  This usually makes 
sense, but for our use-case of hitting a narrow time-slot, I worry about 
the jitter this introduces.  I would like to see a mode/flag that would 
allow transmitting new frames (and afterwards invoking/scheduling 
TX-completion, e.g. via raising the softirq/NAPI).
Well this is future work, first I will measure current implementation.

--Jesper

