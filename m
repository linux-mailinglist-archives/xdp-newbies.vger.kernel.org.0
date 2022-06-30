Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39C73561B93
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jun 2022 15:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbiF3NpB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Jun 2022 09:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiF3No7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Jun 2022 09:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 274A7C33
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Jun 2022 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656596698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hmiyqrALBK4w6YMjE9/PPjw+5KLdyggL+3cKN8iImGM=;
        b=TgZTmY65MDLOxFAp1EtrWNFz7Pbvy8J+RCgJHQr7UEhdBpX54zPRkrSA2qzIKVK/APCLUq
        FJSNGcquCpLGwFgyVhGyzK//IwEeQXTyfzhs6sG5NRr13E6rqA/34zSbwc1wjRdLA0OL9O
        WFBtkcukrADVOtPxD0IR4IX/+3Mfrjk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-Ybq_wopIMFObBJaAAp6nhg-1; Thu, 30 Jun 2022 09:44:57 -0400
X-MC-Unique: Ybq_wopIMFObBJaAAp6nhg-1
Received: by mail-lj1-f199.google.com with SMTP id t21-20020a2e8e75000000b0025aa8875fbeso3132111ljk.22
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Jun 2022 06:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=hmiyqrALBK4w6YMjE9/PPjw+5KLdyggL+3cKN8iImGM=;
        b=iCLtSwpzrldWzwmdrhWeiq0INQ1TOIwWgjlqhk+LZvqoQ9vJ/OMNQub6Z8tqH3Y6ew
         GN4WXnYBbl/NfvTqJmSbxfV7q+htyHwmGXv5YdOVt/LDZlrDTLU3DVRP4t20Q8lUfKvG
         KarSdCu4YX2XkMb7jPU1knfaJZvSeUlWXewoXzGbn40NyogbIBj3w+JpIfWVGRXQu/Lc
         u/pHOMjiqE+8bJLa9tEAazSn23MMwhq5y6vD89sMzBAuNU1GpuHHjUZpNiPWoQ4R7vSf
         G9E5je/EwP1wdyK1FBiFkqYPp/bDKBLltq+bzXYNZfQcXAHuZpn6vJZ3zBNGdpJRBY6I
         du1g==
X-Gm-Message-State: AJIora8gax5623mabh4k47VZFKJbmHZqhnHE9qRlTPcNSUvDNiLD3EYN
        8fMm1T88LmVeAd+ohPDMKjv9WERivSTwN8jfuUoSsST0WXT7wU9vwa1LqkhAUaYes1wfgjZEogy
        PxA58rpvJNmiHoFL6OlU2j6w=
X-Received: by 2002:a2e:83c6:0:b0:25a:d2c4:76c8 with SMTP id s6-20020a2e83c6000000b0025ad2c476c8mr5009233ljh.336.1656596695584;
        Thu, 30 Jun 2022 06:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vF59U2396jCMOcoH957hsj6kOjYeFktuehvWto7PorzaCjIxeQ4NPmAQLOvXE6DPG8b6KT5A==
X-Received: by 2002:a2e:83c6:0:b0:25a:d2c4:76c8 with SMTP id s6-20020a2e83c6000000b0025ad2c476c8mr5009218ljh.336.1656596695380;
        Thu, 30 Jun 2022 06:44:55 -0700 (PDT)
Received: from [192.168.0.50] (87-59-106-155-cable.dk.customer.tdc.net. [87.59.106.155])
        by smtp.gmail.com with ESMTPSA id j16-20020a056512109000b00477cc3fa475sm3098833lfg.204.2022.06.30.06.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 06:44:54 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <fa929729-6122-195f-aa4b-e5d3fedb1887@redhat.com>
Date:   Thu, 30 Jun 2022 15:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Cc:     brouer@redhat.com, bpf@vger.kernel.org,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests, bpf: remove AF_XDP samples
Content-Language: en-US
To:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        magnus.karlsson@intel.com, bjorn@kernel.org, ast@kernel.org,
        daniel@iogearbox.net, netdev@vger.kernel.org,
        maciej.fijalkowski@intel.com, jonathan.lemon@gmail.com,
        andrii@kernel.org, hawk@kernel.org, toke@redhat.com
References: <20220630093717.8664-1-magnus.karlsson@gmail.com>
In-Reply-To: <20220630093717.8664-1-magnus.karlsson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 30/06/2022 11.37, Magnus Karlsson wrote:
> From: Magnus Karlsson <magnus.karlsson@intel.com>
> 
> Remove the AF_XDP samples from samples/bpf as they are dependent on
> the AF_XDP support in libbpf. This support has now been removed in the
> 1.0 release, so these samples cannot be compiled anymore. Please start
> to use libxdp instead. It is backwards compatible with the AF_XDP
> support that was offered in libbpf. New samples can be found in the
> various xdp-project repositories connected to libxdp and by googling.
> 
> Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>

Will you (or Maciej) be submitting these samples to XDP-tools[1] which 
is the current home for libxdp or maybe BPF-examples[2] ?

  [1] https://github.com/xdp-project/xdp-tools
  [2] https://github.com/xdp-project/bpf-examples

I know Toke is ready to take over maintaining these, but we will 
appreciate someone to open a PR with this code...

> ---
>   MAINTAINERS                     |    2 -
>   samples/bpf/Makefile            |    9 -
>   samples/bpf/xdpsock.h           |   19 -
>   samples/bpf/xdpsock_ctrl_proc.c |  190 ---
>   samples/bpf/xdpsock_kern.c      |   24 -
>   samples/bpf/xdpsock_user.c      | 2019 -------------------------------
>   samples/bpf/xsk_fwd.c           | 1085 -----------------

The code in samples/bpf/xsk_fwd.c is interesting, because it contains a
buffer memory manager, something I've seen people struggle with getting
right and performant (at the same time).

You can get my ACK if someone commits to port this to [1] or [2], or a
3rd place that have someone what will maintain this in the future.

--Jesper

