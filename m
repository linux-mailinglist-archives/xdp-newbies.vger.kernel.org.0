Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBE840370F
	for <lists+xdp-newbies@lfdr.de>; Wed,  8 Sep 2021 11:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351274AbhIHJje (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 8 Sep 2021 05:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24176 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351167AbhIHJj3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 8 Sep 2021 05:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631093902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mRF5v6QU9jEtiFGtfqAg+R+CJefRTeqFLL5kusrJnMM=;
        b=a3A7KKw679L616piWDGJ3oRxrwPhijDmuhj2F2Fr/Lv7Oa5nAYBtWDw4EnSMEe3Ln3Fl9U
        eBJijrqawFoi0TSSwniv6+kVmNsZRn/PM96h2Sh8kJEJkPzS8a0ASzxsWiYNDZsOzpD4dS
        AxbMegdTnjHpYxpp69VT9nG6jdykJyg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-cceT3KR5Obyk6UMzz2gY-A-1; Wed, 08 Sep 2021 05:38:21 -0400
X-MC-Unique: cceT3KR5Obyk6UMzz2gY-A-1
Received: by mail-wr1-f72.google.com with SMTP id v6-20020adfe4c6000000b001574f9d8336so325369wrm.15
        for <xdp-newbies@vger.kernel.org>; Wed, 08 Sep 2021 02:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:cc:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mRF5v6QU9jEtiFGtfqAg+R+CJefRTeqFLL5kusrJnMM=;
        b=FJFXIyWoi0YMf8NVJk8jyE6CDsPZt1PjjO72ybMHahxcKaMaLVRtXUqZqrO1hG+/QJ
         5tmF2Pz7pPX2cWYAB3Z9Hb8v8HZ/FsQjgwJ7uVtD+UmOVCfT2PPicACXC1j8hSYziFoT
         8NLd2r/fpjWiDIZ8e/CaEfaBcSTFPAZDrGRP078svuUCEPyKNH9lKsPByYY6TGrVIqIn
         DfBUn8Zo7sc+IZAe4lZNVxcYL/Lsc81NhWdMpcBDhG+EOY+GD8EjNyqPKzloo9BJWf4e
         Xoc9fJ8zV3Rvx4LEQ5+31DnihQCc+x6pcCcLGO/pwPCevXMOn2xgxwnso5ZxYL0j36gU
         bxuQ==
X-Gm-Message-State: AOAM531o1NYl7dZids9L7P5OwbYAghNEptJ43CQH9H0VW7/PsiFbyX15
        i1ArJ1GrADL/DNM1Y1dbVxD5ZVrwFoevZlL+giyuJiFrFC6OpXhQW5CP9ItItsE6hK4qaEQAuKR
        +4p2AQRypbK82jGXd0ojirVEailetClreWGyBIjZhxgkwbAjtRCvDYb8Fl9lRT4LuWdm8EiH1Xg
        ==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr2991794wrn.18.1631093899726;
        Wed, 08 Sep 2021 02:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgb83z8hlQhiYIXrq9jfHf3CqcRTWGNn3xr5tuKQ3t/VmcSiY75eEUf27UnlCGG46W/iwU1Q==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr2991764wrn.18.1631093899429;
        Wed, 08 Sep 2021 02:38:19 -0700 (PDT)
Received: from [192.168.42.238] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id l2sm1624758wmi.1.2021.09.08.02.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 02:38:18 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     brouer@redhat.com,
        =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Zvi Effron <zeffron@riotgames.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Linux laptop with native XDP support
To:     Willy Tarreau <w@1wt.eu>, Jose Fernandez <me@jrfernandez.com>
References: <CAPwzzmsGdMqa9PnOQvtDOcwdByi8CzVEmLHpCmvdVfa4Rnkjeg@mail.gmail.com>
 <CAC1LvL1x4Y9BJPtLncy=uFyq-0LdjpM45a=hRtf8gGVQevD-qQ@mail.gmail.com>
 <87k0jsp5se.fsf@toke.dk>
 <CAPwzzmu_YGhSjQvyx23enetF_5DTdeAa49jh73CvSQoAK766ug@mail.gmail.com>
 <20210908063807.GA14966@1wt.eu>
Message-ID: <9608a3e7-35e3-29bd-a414-1a73ffde26b9@redhat.com>
Date:   Wed, 8 Sep 2021 11:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908063807.GA14966@1wt.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 08/09/2021 08.38, Willy Tarreau wrote:
> On Tue, Sep 07, 2021 at 06:50:49PM -0700, Jose Fernandez wrote:
>>> Nope, no XDP support for WiFi. There was some exploratory discussion
>>> about that some years ago, but XDP has Ethernet as a pretty fundamental
>>> assumption so it's not an obvious fit to the Linux WiFi stack...
>>>
>>> -Toke
>>>
>>
>> I came to the realization about that a few hours after sending this
>> email. I found this link useful to identity which drivers support XDP:
>> https://elixir.bootlin.com/linux/latest/A/ident/bpf_prog_run_xdp
>>
>> I had my eyes on the latest gen "slim" Linux notebooks (Lenovo XC1,
>> Dell XPS), but these don't have built-in Ethernet anymore. So I'm back
>> to the drawing board. Thanks for the tip on ixgbe and Broadcom.
> 
> Note that e1000e remains quite popular among notebooks (my last HP one
> and the two following thinkpads including the T480s I'm typing on have
> this), and there is common ancestry between e1000e and igb. When I
> implemented the NDIV framework (which basically does pretty similar
> things as XDP does in the drivers), I managed to implement e1000,
> e1000e, igb and ixgbe without too many difficulties. Maybe it could
> be a good opportunity for you to try to port XDP to e1000e using such
> a machine, by looking at the work from igb ?

The igb + igc drivers support native XDP, and I assume they must be in 
some laptops.

You can deduce that hardware support / Intel marketing names via e.g. 
the igb driver via looking at the pci_device_id table (igb_pci_tbl[1]):

  [1] 
https://elixir.bootlin.com/linux/v5.14/source/drivers/net/ethernet/intel/igb/igb_main.c#L63

I agree that it would be beneficial to add native XDP to e1000e.

AFAIK John Fastabend implemented XDP for e1000, but the patch had some 
bug (report-ably for some old hardware) that we never identified. Thus, 
the patch was dropped.

--Jesper

