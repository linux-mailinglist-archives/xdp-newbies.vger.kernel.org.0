Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D394746B7
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 16:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhLNPm0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 10:42:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41672 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229752AbhLNPm0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 10:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639496545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5luFEjvSumj9TaC8BY7NjCcBhxlYJ56T8DEE9CFJjlM=;
        b=E7vhDjY7aTcFqdnnkCXpZ6f6EOLus1zYZird1yWLx+lQc1mfRlc0leYoCwjaDlew3hXkfk
        krg55qQs+BDVFAQATUHW/8zymeS1KaQat9Y5RQmzuP2O7QEgMNcDne8WN/67du/7EKIxYo
        tEqO30sjq5YfJb/PA6M6ERmDxWMBISs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-cCtbBCQ-MqyY5x4rawCBkA-1; Tue, 14 Dec 2021 10:42:24 -0500
X-MC-Unique: cCtbBCQ-MqyY5x4rawCBkA-1
Received: by mail-wr1-f70.google.com with SMTP id y4-20020adfd084000000b00186b16950f3so4804391wrh.14
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Dec 2021 07:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=5luFEjvSumj9TaC8BY7NjCcBhxlYJ56T8DEE9CFJjlM=;
        b=xJnv+/08rEYJanAGvolnjjle25MN+B//zCvv+/I5XVvsUb+QSAWjLV48I4aTjfXbHM
         bJi5MuRcKwA2DutOv4YDKYUnCU+cRctoK3E/s/SyXZU616VF2GU5yZdv6/1o4IImJy+O
         MluxENlQdRYjAfLaN1Vd7QJ4xrNib93iavY9kpzQ46EawVWOd0EJUqpw3nTSuRuInUvT
         oDoIgaeLJy7tTCN9n6LzYGGUPnZCcsHd2EXQyHur8WGlYrNsK4fOknLQOPb6niNYKi5j
         An1coBVkRkisChIc4nUPziIugI9LnNwgua6vFjQH7AlobBqnt8SGXIEyYU2I75Nuoe+1
         RinQ==
X-Gm-Message-State: AOAM532Qgpm4TSpxoidhPWOZaxY8EoPp65/xIN2eVZBoatebwFaRfcjF
        AycAhDmkocUs/HUb7vMovfY/J8eEzldozwsQiHaF7e7tGqgPZWsHGyko+oAhHgdCuYac0SP1qQI
        nfXfQmY9PplJI01ZV6YlUkus=
X-Received: by 2002:a05:6000:110a:: with SMTP id z10mr6896019wrw.396.1639496543603;
        Tue, 14 Dec 2021 07:42:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdcK/y9CV1kasnRLvPKzCJcVCuy/M4BVnsVd2oZd7gsEpeKs5d015BYZ5Dx6aemFy/0KBuVA==
X-Received: by 2002:a05:6000:110a:: with SMTP id z10mr6895985wrw.396.1639496543378;
        Tue, 14 Dec 2021 07:42:23 -0800 (PST)
Received: from [192.168.2.15] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id o3sm243201wri.103.2021.12.14.07.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 07:42:22 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <7a888c6c-1f54-6e82-a4d0-794465cf17c3@redhat.com>
Date:   Tue, 14 Dec 2021 16:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        "Desouza, Ederson" <ederson.desouza@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: Re: AF_XDP not transmitting frames immediately
Content-Language: en-US
To:     "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
 <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <Ybh/LIiS8ZHSXRDw@boxer> <65b16496-1b4e-55d9-ea17-610cfd923792@redhat.com>
 <DM6PR11MB2780612AEAC3C18A3ED4F653CA759@DM6PR11MB2780.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB2780612AEAC3C18A3ED4F653CA759@DM6PR11MB2780.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 14/12/2021 15.57, Ong, Boon Leong wrote:
>> I suspected Boon Leong (cc) would have this hardware.
 >
> Unfortunately, my current setup in lab does not have I225 hooked-up
> and I am working remotely due to control access to intel facility.
> Perhaps, Ederson may have ready system to test?
> 
> For ZC mode, the igc driver (also true to stmmac) depends on the XSK wakeup
> to trigger the NAPI poll (igc_poll) to first clean-up Tx ring and eventually call
> igc_xdp_xmit_zc() to start submitting Tx frame into DMA engine. We have
> used busy-poll to ensure in smaller Tx frame latency/jitter.
> 
> There was another issue in stmmac that was patched [1] recently to ensure
> the driver does not perform MAC reset whenever XDP program is added
> so that between XDP socket creation, the Tx transmit does not take extra
> 2-3s due to link down/up. Jesper, are you seeing something similar in your
> app?

Yes, and it is quite annoying.

In my setup, if I AF_XDP transmit packets too early they are simply 
lost... that confused me a bit.

I wanted to ask AF_XDP maintainers:
  - What is the best way to know when AF_XDP is ready to Tx packets?

E.g. what API should I call, e.g. that blocks, until XSK socket is ready 
to transmit on?


> If yes, then it is likely because of the implementation of igc driver in mainline
> that is doing igc_down(), a little bit too aggressive in reseting MAC completely.
> 

It would be good to fix igc too, like[1].
BUT afaik it will only make the window smaller when XSK is not ready for 
TX packets.


> [1]https://patchwork.kernel.org/project/netdevbpf/patch/20211111143949.2806049-1-boon.leong.ong@intel.com/  
> 

Thanks for the link
--Jesper

