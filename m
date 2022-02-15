Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03784B68C9
	for <lists+xdp-newbies@lfdr.de>; Tue, 15 Feb 2022 11:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbiBOKE1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 15 Feb 2022 05:04:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236196AbiBOKE0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 15 Feb 2022 05:04:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ACFE92181
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 02:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644919455;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w2d53VM89TrF7HmocYkFEgRos2dQxvlCyPJMmCX0UVY=;
        b=Yem8uc4lBGlOhnwwD+fwWXdVLJ1Ij5/G33uNryIoYnbJic7OmvITBlJqIIJJeKoOxZqw3f
        TFWj1MLq3zz+1FmacY9pTSG5gtPrvoTIuATgcrMC+JzqXyHOF4olGo35W/+pknxuzWcUt2
        4m2/7ifh1qri82jqnLD57r7yB6qIFq8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-6EYxkIHrNaeSyUUZkrgRpg-1; Tue, 15 Feb 2022 05:04:14 -0500
X-MC-Unique: 6EYxkIHrNaeSyUUZkrgRpg-1
Received: by mail-lf1-f69.google.com with SMTP id h6-20020ac25966000000b00442b0158d70so5996812lfp.12
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 02:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=w2d53VM89TrF7HmocYkFEgRos2dQxvlCyPJMmCX0UVY=;
        b=4+jTsSi6MjGkn/KXLzMSgkb7XI1aR7uYRgv3JzIA9++uWRkJlkEwyEuB59Sj0d8vBB
         +kmPt+rEz4nwhjKxsocx8vkVE765qHvAKIthi9QP0815xZ8/1pmC9etTsgIZ0jXEBi3B
         kLx9uVtfFOpEURI/iW8A0h946sX+0ffEXuUVytxpHDxpMK8+nlLBaSggv1K3gFw/OOFf
         +x+3K2NldT+rJfTjlG7vqbYh3ZaCkZgqjYd9MC5mX0KRxtR4tbd4IIn0iMzreQAw6rtF
         HI01LceW3jS2+osYwYKPIbqj7za8nVekRAAqtzOpzd2xpMKLR+pHb+UKpK1gO0/9sHnQ
         tKFA==
X-Gm-Message-State: AOAM531fBWjqyxf50hXYRtvnwotL8x+gTuBUOW16UG4x2OdcMKIp5D+D
        KPZxuyGd1/5a6AA3PBzjjqfyhl0kfUY0EOaPqGhW7pZZYHRo/6pjGn9DO/UVj9PZp5m+NkHQW7i
        XAkizX51sTU8e2MkG90NyZ9g=
X-Received: by 2002:a05:6512:1154:: with SMTP id m20mr2590032lfg.682.1644919452604;
        Tue, 15 Feb 2022 02:04:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2eH4oO5wX6fX/ltYbOCX2a5hG1mLLL6YE6f5DgCcfDTPjDo2LP7Wa7lZ0z9m8GN5g3HK1PA==
X-Received: by 2002:a05:6512:1154:: with SMTP id m20mr2590022lfg.682.1644919452397;
        Tue, 15 Feb 2022 02:04:12 -0800 (PST)
Received: from [192.168.0.50] (87-59-106-155-cable.dk.customer.tdc.net. [87.59.106.155])
        by smtp.gmail.com with ESMTPSA id i20sm918969ljb.54.2022.02.15.02.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 02:04:10 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <ba38905b-04c2-5592-3804-60f8c7ba479e@redhat.com>
Date:   Tue, 15 Feb 2022 11:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
Content-Language: en-US
To:     Sophia Yoo <sy6@princeton.edu>, xdp-newbies@vger.kernel.org
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
In-Reply-To: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 14/02/2022 19.10, Sophia Yoo wrote:

> I am relatively new to BPF/XDP [...]

I see you come for academia, so I will recommend reading our XDP paper 
as a start:
  https://github.com/xdp-project/xdp-paper

Title: “The eXpress Data Path: Fast Programmable Packet Processing in 
the Operating System Kernel” which was presented at ACM CoNEXT 2018 on 
December 5th, 2018.


[...]
> My NIC driver is Intel xgbe. I am using bcc to attach and load my xdp
> and tc programs.

This "xgbe" driver doesn't exist in the kernel tree under Intel.
Are you sure this is the correct driver?

--Jesper

