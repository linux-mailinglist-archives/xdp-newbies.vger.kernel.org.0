Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A57D56B304
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Jul 2022 09:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237049AbiGHHAc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 8 Jul 2022 03:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237378AbiGHHAW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 8 Jul 2022 03:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CBA057478D
        for <xdp-newbies@vger.kernel.org>; Fri,  8 Jul 2022 00:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657263620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2UDSJOrzjkP1xJhn9ewHzP+5HWa2b/wjbrG2J/UB9Nw=;
        b=XI10iWKOdoEQihFiE6OxKfk54fKW9VIh8lF820eOKYc8LCkr2xu61Jkg6mKrWHQWVHGJEv
        ALqI3viYiMaOAILPQ2vl3wo4tOXN6cIxVqLmns7izeU0akzlXydZWFbdfpXZUfQSDnO9Op
        fXiP5RcReWfdiHqtdrJGMUq18HyBG58=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-DDVFXZSUNE2JD1MHojsbcQ-1; Fri, 08 Jul 2022 03:00:12 -0400
X-MC-Unique: DDVFXZSUNE2JD1MHojsbcQ-1
Received: by mail-lf1-f71.google.com with SMTP id cf10-20020a056512280a00b0047f5a295656so7433255lfb.15
        for <xdp-newbies@vger.kernel.org>; Fri, 08 Jul 2022 00:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=2UDSJOrzjkP1xJhn9ewHzP+5HWa2b/wjbrG2J/UB9Nw=;
        b=Q2lnC2N4RMHo6GeieB9U74h4fHhWc8UZrn629FK9zXNdxsGBgf4CkcI5XULJZ5euqa
         0QimEWLZ3vi5SJdhiXS+1LAYvh+wfTU8tdrieSoUAEAjdtLy5uZDmRc7RtrciZoUhYct
         EItnSxL99u6mwUTOyMPGqIIvt/H19Bat11m+xwoHGiMbXJiag8L8O7AQU+7J+rhlJLwQ
         aVXoiuqT50+Bu5v4e80qMAffTzMLbIZcITZg0IKK74QbECD2f1uSiUk5smvnefTBQTB8
         BrhSpJMXB1mNIlmH7Dsy2pNv+rFQ8s6/cDrJq0xbcgDWoOuDDJL13zkfnSqIcyGbUL+K
         ajjA==
X-Gm-Message-State: AJIora++gcbOttUAwqXfZ3yykovCS+3dxiB2Cktz/F83aKfpHZyT9/Nf
        BrgT/NQ/BFMjPFYkpa8sLfQDJEz7647fAzpjkQw2FztPf4QtVul7fi7o1B8NMjL8VbqZ5afhg+l
        ++CR/XC5PaWvxd4KrbvrMEIs=
X-Received: by 2002:a05:6512:12d3:b0:483:4a93:8b3 with SMTP id p19-20020a05651212d300b004834a9308b3mr1336530lfg.402.1657263611253;
        Fri, 08 Jul 2022 00:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWQ/NGmYK2r3YIilwM4mOvqDVl0fdNjnwNjCNp0vG3uKF8p94q4lC37sTDvmaQysRQrNb71A==
X-Received: by 2002:a05:6512:12d3:b0:483:4a93:8b3 with SMTP id p19-20020a05651212d300b004834a9308b3mr1336523lfg.402.1657263610957;
        Fri, 08 Jul 2022 00:00:10 -0700 (PDT)
Received: from [192.168.0.50] (87-59-106-155-cable.dk.customer.tdc.net. [87.59.106.155])
        by smtp.gmail.com with ESMTPSA id t6-20020a056512208600b0047f79487758sm7243922lfr.133.2022.07.08.00.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 00:00:10 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <58e538d6-d1cd-4689-694e-e14d91c47d41@redhat.com>
Date:   Fri, 8 Jul 2022 09:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        David Ahern <dsahern@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: netdev stats for AF_XDP traffic
Content-Language: en-US
To:     Srivats P <pstavirs@gmail.com>, Xdp <xdp-newbies@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>
References: <CANzUK5_qwaRm=9c46yH8d_J54PAcNhZB-R5M=wYgXGGaJJaFAA@mail.gmail.com>
In-Reply-To: <CANzUK5_qwaRm=9c46yH8d_J54PAcNhZB-R5M=wYgXGGaJJaFAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 08/07/2022 08.19, Srivats P wrote:
> Hi,
> 
> Is there any update on the "consistency for XDP statistics" [1]
> high-prio work item from the xdp-project.net project management page?

Lorenzo (cc) have done cleanups in several drivers, both mvneta and
veth, but not mlx5. Ahern (cc) also had an interest earlier.


> More specifically the fact that the mlx driver (are there others too?)
> don't update netdev/ifconfig stats for XDP/AF_XDP traffic? 

IMHO the drivers MUST update the netdev/ifconfig RX stats, even when an
XDP action is taken.  XDP-progs are user installed software, and not
updating netdev RX-stats (for some XDP actions) is very confusing for
all existing stats collector tools.
The mlx drivers are (sadly) the most inconsistent if I remember correctly.

> The email thread started for that item dates from 2018 and hasn't
> seen any updates after that.
I think nobody have really had the time to fix up this inconsistent
stats mess.

Are you interested in working on this?


> I see some recent patch/commit activity about XDP specific stats via
> netlink but I believe this is different from the standard
> netdev/ifconfig stats.

Yes, if taking this "task", I recommend focusing on standardizing
netdev/ifconfig stats behavior for XDP.  Solving the other XDP specific
stats is a much larger task with much upstream discussions required.

> Srivats
> 
> [1] https://xdp-project.net/#Consistency-for-statistics-with-XDP
> 

--Jesper

