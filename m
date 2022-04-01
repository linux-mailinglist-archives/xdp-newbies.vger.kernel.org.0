Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31EBB4EEDEC
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Apr 2022 15:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346263AbiDANPY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 1 Apr 2022 09:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346259AbiDANPW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 1 Apr 2022 09:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2F0163F8AC
        for <xdp-newbies@vger.kernel.org>; Fri,  1 Apr 2022 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648818811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XDx0pyyKjEBrLjPfC53Ym4NEjM8qaYzxuqueKU6X3GE=;
        b=MX31F91hnH9hbAZweYVGUtWEWPXSoPhDBV3CW5QB1DUni96cXXvc/95DruOXPdRFlnly1w
        wsJmizEsmbrdGRWMxyjgSYEDYX5PwEoI+fjzLnoeOkepazneeVihLgxpEDqrHY2CUN5wP9
        jzN2DTjgwhCt8zyJyKkaD+RdQLcZ7Dw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-KyqynMwfNOmHtNx4J4tTwQ-1; Fri, 01 Apr 2022 09:13:30 -0400
X-MC-Unique: KyqynMwfNOmHtNx4J4tTwQ-1
Received: by mail-ed1-f71.google.com with SMTP id f2-20020a50d542000000b00418ed3d95d8so1515921edj.11
        for <xdp-newbies@vger.kernel.org>; Fri, 01 Apr 2022 06:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=XDx0pyyKjEBrLjPfC53Ym4NEjM8qaYzxuqueKU6X3GE=;
        b=7pppuFM4f1+u7zyQ1ZWxsdDCdEUFuZuCP5hlYXZ5M47x1qXmDoAyhf9t+QdipRG9zL
         f1JC6vQbESg9wvrWWDeQD/47b7h9/3qgDZpTY1xUQ9pwKWPN1Ueu4Q8xT2J13VPKG1P7
         q6QxrPnrowQcJatIf7VamClaKEfMV5xTAB7BcLn8F4NoMBr3sIdpbHeGt9jD0y68XEXo
         kWa+qo5Cv2GpGYpwOXppexAyJmYQKB+GAIPYvOWwZGo72HeHVZptxLYxLkp1BNLlKf9I
         cB2bBidARlwC4lcXkcU25LUdmj9SApV65nS/MYSPejGWgkOibuDnG4ibrHRSu/hXcA9I
         UpwA==
X-Gm-Message-State: AOAM532Wd9+mHssYaWy+mpW7bHtPBNymtmFs9flkSJ7LZECMWOieaFM/
        +tR4990haiH4+/953/lZdrI3gwUcmmpPElmqe71DT2qQPUyqvoRnV2/ZxO3yQIur+kkU3YmMBpM
        8TD0q0V8tDzdmpONJxX/1tn0=
X-Received: by 2002:a17:907:3f86:b0:6df:ad43:583 with SMTP id hr6-20020a1709073f8600b006dfad430583mr9572782ejc.535.1648818809554;
        Fri, 01 Apr 2022 06:13:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxNYNSeR3EsiKzlyVuY0pY70Q1hpcHVBtuwdmxWBGIjdSARTONnFHWAM2hzNR0KWh3nY0PWQ==
X-Received: by 2002:a17:907:3f86:b0:6df:ad43:583 with SMTP id hr6-20020a1709073f8600b006dfad430583mr9572763ejc.535.1648818809289;
        Fri, 01 Apr 2022 06:13:29 -0700 (PDT)
Received: from [192.168.2.20] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id gb29-20020a170907961d00b006e00c7b0f5asm1011754ejc.0.2022.04.01.06.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 06:13:28 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
Date:   Fri, 1 Apr 2022 15:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        eric.david.sage@gmail.com
Subject: Re: XDP multi-buffer and AF_XDP
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Kal Cutter Conley <kal.conley@dectris.com>,
        Xdp <xdp-newbies@vger.kernel.org>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk>
In-Reply-To: <87wng9f2y3.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 01/04/2022 13.39, Toke Høiland-Jørgensen wrote:
> Kal Cutter Conley <kal.conley@dectris.com> writes:
> 
>>>
>>> Hi,
>>> We are very interested in receiving jumbo frames (> 8000 bytes) over
>>> AF_XDP. Does XDP multi-buffer support XDP_REDIRECT with AF_XDP? What
>>> about in zero-copy mode?
>>>
>>> Cheers,
>>> Kal
>>
>> Looking into this more I found this comment in the mlx5 driver:
>>
>> /* Don't enable multi buffer on XDP_REDIRECT SQ, as it's not yet
>> * supported by upstream, and there is no defined trigger to allow
>> * transmitting redirected multi-buffer frames.
>> */
>>
>> So at least mlx5 does not yet support XDP multi-buffer with
>> XDP_REDIRECT. What "upstream" support is required to get XDP_REDIRECT
>> to work with XSKs?
> 
> Well, the initial patch set for multibuf explicitly blocked XDP_REDIRECT
> between interfaces, which is what that comment is referring to (the TX
> side).
> 
> For AF_XDP we'd also need to define the UAPI, and maybe add a socket
> flag so the userspace program can signal to the kernel that it
> understands it? Not sure about the details.
> 
> You're definitely not the only person who wants this, though; adding in
> some people who may have a better idea of the exact steps needed.

Cc. Eric Sage, as he also expressed interest in implementing this...

--Jesper

