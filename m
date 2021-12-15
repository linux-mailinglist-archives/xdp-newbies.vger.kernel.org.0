Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB2C475613
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Dec 2021 11:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236747AbhLOKSJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Dec 2021 05:18:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55074 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229757AbhLOKSJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Dec 2021 05:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639563488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZjcTB54bHjZAM2S1NAVjI+//EcewlfHT8LrrD3PNIE4=;
        b=BnjW+hZ8IdkKEHhnPff9PAe9GA07r1Ifn1EBVPQOnMfos8lSzndS4k8kp37/UsOawOttDP
        vQ9HpgNhbNeGHjm4aCdNW+tdTTumdab9nVqKQm/1jpkeySc9zm4DOJ8EtI+vwk7eSdq21X
        3+aFEueXT1/a8SU35CdoFLJ9FdIWTxM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-OdfSVdEJPq63MiwM-LVR0g-1; Wed, 15 Dec 2021 05:17:57 -0500
X-MC-Unique: OdfSVdEJPq63MiwM-LVR0g-1
Received: by mail-ed1-f72.google.com with SMTP id v19-20020a056402349300b003f7eba50675so971677edc.12
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Dec 2021 02:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=ZjcTB54bHjZAM2S1NAVjI+//EcewlfHT8LrrD3PNIE4=;
        b=50vJLenNjY/7IcRnkCeD5d4ywVS7yCx52iwhDKaNOAWh4kKvpAYeWWH4Y84WamjeBG
         3C29RY1DB41ohfokY+XKz+DoFsHqiFu1rjXLha7XKr/vDO/8SJcrMkEPAO8Npvp88Gyb
         eqo42u0PDw+s4qm1n5TIqFNCVORJlIZ+E8hYYTZieKmGISQNWVssSGBWoB4ve52bVZBy
         rHmHUD+q+63L2FLY3Y3UjVg0A/LVXPfP3becslmAd5cZmSD2K+chkUIPcyTsY4GBCW5O
         bx4lO9U1ouSuKhrXsNMFHPY70zcCD7gQTKh0decEkBjmutFJ9cbLeudGUh06AUw5InFT
         2qdw==
X-Gm-Message-State: AOAM532UbAzrq0c5xerBWC2MRMQk5njMPosQcvh+wWvp1RragErg0ZyS
        8r7Z8mx3ilKq+J0A6SfJ1ucA8HmdRtPaBf0BeKtdYrkHI2qU22haB8wzwzfeXJKR0ZkBvp1fY5G
        qotWD6WpsX0jxytcdWaFJLuw=
X-Received: by 2002:a05:6402:6cd:: with SMTP id n13mr542708edy.248.1639563476256;
        Wed, 15 Dec 2021 02:17:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypjOidOFYJlFjqyy6XmFx6KA7Yo58LyiuRLkDUATqbY1gn36SPNnMXB1d8DlAymy5ioTKKrg==
X-Received: by 2002:a05:6402:6cd:: with SMTP id n13mr542690edy.248.1639563476000;
        Wed, 15 Dec 2021 02:17:56 -0800 (PST)
Received: from [192.168.2.15] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id t5sm768339edd.68.2021.12.15.02.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 02:17:55 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <9e18a444-e30f-4ae8-4e3b-af5e9393e971@redhat.com>
Date:   Wed, 15 Dec 2021 11:17:54 +0100
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
In-Reply-To: <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 14/12/2021 09.07, Karlsson, Magnus wrote:
> 
>> 
>> I'm coding on an AF_XDP program[1] that need to send (a bulk of
>> packets) in a short time-window (related to Time-Triggered
>> Ethernet).
>> 
[...]
> 
>> How can I get AF_XDP to "flush" TX packets when calling sendto()? 
>> Should we add another flag than the current MSG_DONTWAIT?
> 
> In zero-copy mode with softirq driver processing (not busy poll), a
> sendto will just trigger the xsk_wakeup ndo that schedules napi
> unless it is already executing. It is up to the driver to then get
> packets from the Tx ring and put them on the HW and make sure they
> are sent. Barring any HW quirks, sending one packets should be
> perfectly fine.

This actually doesn't sound so good from my customers use-case PoV.
That we only trigger a ndo_xsk_wakeup that schedules napi.

We want to trigger HW transmission immediately.
Can we achieve this via using busy-poll mode?


>> Hint, I'm using tcpdump hardware timestamping on receiving hist via
>> cmdline:
>> 
>> tcpdump -vv -s0 -ni eth1 -j adapter_unsynced --time-stamp-precision=nano -w af_xdp_tx_cyclic.dump42
>> 
>> Notice[1] on specific branch: [1] 
>> https://github.com/xdp-project/bpf-examples/tree/vestas03_AF_XDP_example/AF_XDP-interaction

