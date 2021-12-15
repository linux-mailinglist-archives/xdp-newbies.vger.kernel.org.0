Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B98475469
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Dec 2021 09:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240903AbhLOIl4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Dec 2021 03:41:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20339 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238534AbhLOIlx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Dec 2021 03:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639557712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dgBCiYkPmtxqIhZ3zaK2+pFD16Gl9xl7h6LSxf7U5EQ=;
        b=JnezpMpwY3GvVwFWd+DuLOyFMVTxr7PW3EkLz7fQNf7Hfq3vCZ/Be1ModJRHQuDbjXO0Fy
        xFsTwL5wi0aL38Kv631TgzkJbCMGMdrAJnwbYwTVlwRI/zp6f472eSsYfaGqmjsW9RzbV9
        UoOjte3+GKh/MHaGHzhy1E7hxPga/qY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-c1bKzZBwMQ-ehBIZLdPX1A-1; Wed, 15 Dec 2021 03:41:51 -0500
X-MC-Unique: c1bKzZBwMQ-ehBIZLdPX1A-1
Received: by mail-wm1-f72.google.com with SMTP id z199-20020a1c7ed0000000b003456affcffaso234383wmc.2
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Dec 2021 00:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=dgBCiYkPmtxqIhZ3zaK2+pFD16Gl9xl7h6LSxf7U5EQ=;
        b=tzJOYIdq7XBsxydpsjoOytE6aPYB1G1YfsjK1kbYoFpP+jiZqIxvgK75Druri17VAB
         uSJDHh0f8STfP8XEGNJ10QS9EphY7B3l1UJyY1ohUKEJ/KBKidMIC+UiugNbKeNqy8+w
         kJdSE7OxDMugsjLU+gFoH5R8EXauunhLYx8Rouvbo0yJw4sOm2KtRS4oJZQQu0XusIze
         ho+rMQk+camLvo+8FXAhEK0ePpBefwErjUS0YTfWEmfZhW4+FqP6J48AU/s4U6UFYZMH
         Qs2teoaEjK9w8rzJuefvXjgIlIe2FfNoig5gB9poD06nj8n4Q46W3ej9sxBfP+454H2B
         ClTA==
X-Gm-Message-State: AOAM5305jb45SMQ4WSUu1c6WfssaBRD6V8Ca2euVczvWhpZUtynUoabq
        G8KMBgccUXBgNAE4O59mpXIBtB1FUDze5YOHfFJ2qEOBm+94oxse8oKGxkol7QqMhp8bbWc6Wsb
        R/R2bw6t32TjtUgzLZaPwl90=
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr3409532wri.568.1639557709925;
        Wed, 15 Dec 2021 00:41:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX7K/E9rIr2yeWCxnTsoI8frM2wVjk5lzAO3TvDG1i/OjdAqS3pTFxXai4Xn7d2VnsxyYuPg==
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr3409510wri.568.1639557709621;
        Wed, 15 Dec 2021 00:41:49 -0800 (PST)
Received: from [192.168.2.15] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id g18sm5257571wmq.4.2021.12.15.00.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 00:41:48 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <f45b13b3-c69d-92b3-6278-b673739ab766@redhat.com>
Date:   Wed, 15 Dec 2021 09:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com, "jopbs@vestas.com" <jopbs@vestas.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "dioli@vestas.com" <dioli@vestas.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "Gomes, Vinicius" <vinicius.gomes@intel.com>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>
Subject: Re: AF_XDP not transmitting frames immediately
Content-Language: en-US
To:     "Desouza, Ederson" <ederson.desouza@intel.com>,
        "bjorn@kernel.org" <bjorn@kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        "jbrouer@redhat.com" <jbrouer@redhat.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
 <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <006e9428370706633aec10e2d438b4354008cdb2.camel@intel.com>
In-Reply-To: <006e9428370706633aec10e2d438b4354008cdb2.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 15/12/2021 02.08, Desouza, Ederson wrote:
> +Vinicius
> 
> On Tue, 2021-12-14 at 10:40 +0000, Karlsson, Magnus wrote:
>> Adding Ederson and Maciej.
>> 
>>> On 14/12/2021 09.07, Karlsson, Magnus wrote:
>>>> 
>>>> 
>>>>> From: Jesper Dangaard Brouer 
>>>>> 
>>>>> Hi Magnus and Bjørn,
>>>>> 
>>>>> I'm coding on an AF_XDP program[1] that need to send (a bulk
>>>>> of packets) in a short time-window (related to
>>>>> Time-Triggered Ethernet).
>>>>> 
>>>>> My observations are that AF_XDP doesn't send the frames 
>>>>> immediately. And yes, I do call sendto() to trigger a TX
>>>>> kick. In zero-copy mode this is particular bad.  My program
>>>>> want to send 4 packets in a burst, but I'm observing 8
>>>>> packets grouped together on the receiving host.
>>>>> 
>>>>> Is the a known property of AF_XDP?
>>>> 
>>>> Nope! It is supposed to be able to send one packet at a time, 
>>>> though I have several times seen bugs in the drivers where the
>>>> batching behavior shines through like this, and once a bug in
>>>> the core code. There is even a test these days for just sending
>>>> a single packet,
>>> 
>>> Where is that test in the kernel tree?
>> 
>> In tools/testing/selftests/bpf/xdpxceiver.c. It is the 
>> RUN_TO_COMPLETION_SINGLE_PKT test. But the framework only operates
>> on veth currently.
>> 
>>>> since we have had issues with this in the past. That test does 
>>>> pass in bpf-next, but it is only run with the veth driver that
>>>> does not support zero-copy so could still be an issue. What
>>>> driver are you using in zero-copy mode and what kernel version
>>>> are you on?
>>> 
>>> Driver: igc with Intel chip i225
>> 
>> Have never tried this one personally. Do not know if I have one in 
>> the lab but let me check.
>> 
>> Ederson, do you have any experience with this card and if so, have 
>> you seen something similar?
> 
> Not sure. I wonder how small is the interval Jesper is using. I
> imagine that if it's too small, the interrupt generated to trigger
> the tx could end up serving more than one packet.

The interval is currently 1 second (code here[0]), thus the TX interrupt 
should have plenty of time to trigger.

[0] 
https://github.com/xdp-project/bpf-examples/blob/vestas03_AF_XDP_example/AF_XDP-interaction/af_xdp_user.c#L1129


> Vinicius should have more prompt access to i225 - could you please
> help on this?

My reproducer[1] need option --zero-copy to enable the error case, as it 
defaults to 'copy-mode'.
It is only in zero-copy mode for igc/i225 that I see the behavior of 8 
packet bulking, when expecting/sending bulks of 4 packets ever second.


[1] 
https://github.com/xdp-project/bpf-example/tree/vestas03_AF_XDP_example/AF_XDP-interaction

--Jesper

