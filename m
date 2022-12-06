Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F30644D12
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Dec 2022 21:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiLFUNF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Dec 2022 15:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiLFUMr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Dec 2022 15:12:47 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E03A4B763
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Dec 2022 12:10:47 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id z144so6191036iof.3
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Dec 2022 12:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZSL3ZmSsDhyxRtvCTuSI8kb/iNHJVgIZyz690yUUPk=;
        b=nOHqAgcrqLNYMX7UAIRzmBuMvfniAIMjjuO+hgx6oAjlJ6KvnLnyx1gkBSC7y+bcal
         Nu+SC2hsnxvqUkFMKLa9gVsvub6ydxG/WO/6pOAX+gkAXmNNlfBHmiykCGD69l+JvTAS
         V5lsFbhSJgK6Cuul6pju/EWNNdRGTm8VEmvnaYQARv8Kram7YIqHLeRfseIeAx3Qk64+
         EYfyT30YfyOexksDzvYYiITjNcNrVnUn+BHBC69YRMpsgCn5AGP4CRfYGprz9F8cOw6H
         nOAh2KYpmYdfJd7qg9Md5G3/SJGChpnLadO55QELWPCRulEPm206W0bhuACx0X4htEWc
         4WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZSL3ZmSsDhyxRtvCTuSI8kb/iNHJVgIZyz690yUUPk=;
        b=p7X50gD7WawO9FZU/sIRO/YJSwqLL0pb4Vn1WbMXM8GL5Z+q/tL1eFz0TljqKpi64m
         +gOmEZisjLE9qYAFMl85Byi6ivqWi4ck689zPQ/D1zU4eGEZCfF/egDwDzVdzZjUB6++
         mVtJcbQW7FLazKEWN4FCn5k0r2rwWlxaBlGLXg37z7exlcbEusdJNnrvV12VCG9L9dnV
         Zpj4MgQWB0vwb4GNTqIMvkYE5wcHzqlBTTsDPL6WaUWoocqfKgNMui0/67Sf5LpoCI05
         KHkzoo/LqOSUtCV9vOdLzF+hclfunw9rHNCRWnaLDiivffdiodIcsqZIdU6bltmZrllt
         at3g==
X-Gm-Message-State: ANoB5pksvIRLR1PPMY1ArzqkUnMy4r3BF/gRT7bEGGnuAYEA7p5/hnCp
        tfl1NXi0zgJA3sXXB0/M8kDjlDjLQ08=
X-Google-Smtp-Source: AA0mqf5DqKrvHIng5Ab/R8QJSYzdkQQThFUdfMCNIN3b2gWY21QCs/w0OYsvlC3Z4t5VoZwWB4QBQQ==
X-Received: by 2002:a05:6602:8c7:b0:6d9:f871:7b20 with SMTP id h7-20020a05660208c700b006d9f8717b20mr32392902ioz.152.1670357414193;
        Tue, 06 Dec 2022 12:10:14 -0800 (PST)
Received: from [172.16.99.146] (c-73-14-130-18.hsd1.co.comcast.net. [73.14.130.18])
        by smtp.googlemail.com with ESMTPSA id e6-20020a056602158600b006c0cb1e1ea8sm7252064iow.12.2022.12.06.12.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 12:10:13 -0800 (PST)
Message-ID: <6da4a45e-07ce-7cc9-760a-9be317122eb0@gmail.com>
Date:   Tue, 6 Dec 2022 13:10:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: xdp forward issue
To:     team lnx <teamlnxi8@gmail.com>, xdp-newbies@vger.kernel.org
References: <CAOLRUnAmtz3yP=sD7zmDip1d79UOWeJmt96gVOUF_xvJy64T2w@mail.gmail.com>
Content-Language: en-US
From:   David Ahern <dsahern@gmail.com>
In-Reply-To: <CAOLRUnAmtz3yP=sD7zmDip1d79UOWeJmt96gVOUF_xvJy64T2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 12/6/22 9:43 AM, team lnx wrote:
> Hello,
> 
> I am a beginner for xdp and following is the setup
> 
> 3rd party Board - (64 bit arch):  This has 2 ethernet interfaces
> supporting XDP (v0 and v1)
> Host machine: Ubuntu
> 
> step 1: 3rd party Board <-----connected over ethernet (v0) ------> Host - Ubuntu
> step 2: echo "1" > /proc/sys/net/ipv4/ip_forward
> step 3: Assign static ip address for v0 and v1
> step 4: run:  xdp_fwd -D v0 v1  on 3rd party Board
> step 5: start ping from host to v0 of 3rd party Board with expectation
> of forwarding from v0 to v1
> 
> Observation : In the above experiment I see xdp_fwd has a return code
> always set to XDP_PASS and when I traced it found that below
> conditions is the reason
> in net/core/filter.c
> if (res.type != RTN_UNICAST) {
>  return BPF_FIB_LKUP_RET_NOT_FWDED;
> }
> 
> 1. Could you please help in understanding the reason behind this ?

RTN_LOCAL means delivery to a local process -- ie., nothing to forward
to another device / host.

RTN_MULTICAST and RTN_BROADCAST: broadcast is not supported. Multicast
... I forget how to use that. The fib lookup and xdp_fwd test predates
multicast support


> 2. Once #1 is resolved, do we need to add manually arp table/neighbor
> information as well ?
> 

the xdp_fwd app is a demo. In a production deployment, you will need to
have something manage the neighbor entries for hosts. e.g., look at `ip
neigh ... managed` if you have a new enough kernel.

