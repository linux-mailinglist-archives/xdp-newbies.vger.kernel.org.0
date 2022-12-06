Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D2E644E1D
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Dec 2022 22:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiLFVmZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Dec 2022 16:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiLFVmY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Dec 2022 16:42:24 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF76648770
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Dec 2022 13:42:22 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id n188so10643477iof.8
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Dec 2022 13:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPYCQNpWBPt8qmRsHiCAI55kpfUv1oz7CFmo+B7+tJU=;
        b=lr8JC2SgT2v7NMfD52mlw3BrOXeMq2JrcSVwz4uyuc4n2r0x4Ai3vSUp19mqzpPNPB
         z0MiIGLk2WngGpA1CYic2wHDMw7rtN0ajrJk7/0t2sXDxdeCdIx3rSAOg+mcYfut4XZ7
         4BQa6GqVWvKooJd9hfX+NTZjKmybPKjkLUwsTiURjz0BBD1Rm9l7Ta3w1uZagwxOLgsM
         QyNzbwDQuB79uU2uO4dkKgs0Uc8JfBtPif/FCKfAlAwLs4bjQRRsf8iOT9whjMjbVgEg
         SMLzt6UtJEz1j0DaYL2kr+X/Zfz66AKuWxTVh5TahRB8h3rKC3mT1X17k6L+l/iu3Lcl
         NY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPYCQNpWBPt8qmRsHiCAI55kpfUv1oz7CFmo+B7+tJU=;
        b=UA5jOZBlh/KbtPXorufMWLtkGdDDBBMc51o0P3ORS8ucxDBTWNLlWxrvLpEKZprh6W
         W96b1D5pBhp4r89BEAzBv4MdC0/qeAJqcqGxSVlvXSvo/1lqkppeEuWaUNrCMtSFzWOo
         SjGgDuocBDX6hfEF3kr4gNphcH2tWkzKh0WWquOOvi3Ttd59xvQGywp92SMsP05lQpJL
         Ho2/gLZ+XyagrXv/KF39z3Nwlz/BMi5do/msq9nhMStEBmk2qR1DMm13/5ixXiZ9LScX
         1ypGg6r41L35Zv5cQobYK/l3cuRTnxB3t0nsZ+SS2pP1FbCFQw++yLK96Bt5XmupIhI7
         EWuQ==
X-Gm-Message-State: ANoB5pkl46Xwhamjx1ayUmpM3lYWzJfP/xbiXG+vH+whcRcSW1SUoLbd
        FCIG8/wWaI37sYTFWYfhvmmOdkFko9M=
X-Google-Smtp-Source: AA0mqf60dUo1JUr8UifvAZXHHDzmNemzpOHxsReGhc7jQD7yNnz/wXy5lPAANei++tHt0okpDk7vrw==
X-Received: by 2002:a05:6638:4122:b0:38a:5e91:5d49 with SMTP id ay34-20020a056638412200b0038a5e915d49mr2132418jab.147.1670362942118;
        Tue, 06 Dec 2022 13:42:22 -0800 (PST)
Received: from [172.16.99.146] (c-73-14-130-18.hsd1.co.comcast.net. [73.14.130.18])
        by smtp.googlemail.com with ESMTPSA id y14-20020a056602048e00b006dfb7d199dasm7337977iov.7.2022.12.06.13.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 13:42:21 -0800 (PST)
Message-ID: <212bab83-455a-b6b4-7398-a61a6cca2615@gmail.com>
Date:   Tue, 6 Dec 2022 14:42:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: xdp forward issue
Content-Language: en-US
To:     team lnx <teamlnxi8@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
References: <CAOLRUnAmtz3yP=sD7zmDip1d79UOWeJmt96gVOUF_xvJy64T2w@mail.gmail.com>
 <6da4a45e-07ce-7cc9-760a-9be317122eb0@gmail.com>
 <CAOLRUnAfh5_MWo+1HeWSZbOeVjscMCaaW37V5b2jGh-sOvg5gA@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
In-Reply-To: <CAOLRUnAfh5_MWo+1HeWSZbOeVjscMCaaW37V5b2jGh-sOvg5gA@mail.gmail.com>
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

On 12/6/22 1:36 PM, team lnx wrote:
> On Tue, Dec 6, 2022 at 12:10 PM David Ahern <dsahern@gmail.com> wrote:
>>
>> On 12/6/22 9:43 AM, team lnx wrote:
>>> Hello,
>>>
>>> I am a beginner for xdp and following is the setup
>>>
>>> 3rd party Board - (64 bit arch):  This has 2 ethernet interfaces
>>> supporting XDP (v0 and v1)
>>> Host machine: Ubuntu
>>>
>>> step 1: 3rd party Board <-----connected over ethernet (v0) ------> Host - Ubuntu
>>> step 2: echo "1" > /proc/sys/net/ipv4/ip_forward
>>> step 3: Assign static ip address for v0 and v1
>>> step 4: run:  xdp_fwd -D v0 v1  on 3rd party Board
>>> step 5: start ping from host to v0 of 3rd party Board with expectation
>>> of forwarding from v0 to v1
>>>
>>> Observation : In the above experiment I see xdp_fwd has a return code
>>> always set to XDP_PASS and when I traced it found that below
>>> conditions is the reason
>>> in net/core/filter.c
>>> if (res.type != RTN_UNICAST) {
>>>  return BPF_FIB_LKUP_RET_NOT_FWDED;
>>> }
>>>
>>> 1. Could you please help in understanding the reason behind this ?
>>
>> RTN_LOCAL means delivery to a local process -- ie., nothing to forward
>> to another device / host.
>>
>> RTN_MULTICAST and RTN_BROADCAST: broadcast is not supported. Multicast
>> ... I forget how to use that. The fib lookup and xdp_fwd test predates
>> multicast support
>>
>>
>>> 2. Once #1 is resolved, do we need to add manually arp table/neighbor
>>> information as well ?
>>>
>>
>> the xdp_fwd app is a demo. In a production deployment, you will need to
>> have something manage the neighbor entries for hosts. e.g., look at `ip
>> neigh ... managed` if you have a new enough kernel.
>>
> 
> Thanks for the response,
> Understood #2, but for #1
> I have initiated ping from Host (ubuntu) -> V0 (ethernet) of 3rd party
> board with intention of forwarding/redirecting to V1 on the same board
> 
> But I see XDP_PASS being returned instead of XDP_REDIRECT, anything
> missing/wrong in steps ?
> 

look at the return code from the fib_lookup. It indicates why the lookup
failed if it does not return BPF_FIB_LKUP_RET_SUCCESS:

enum {
        BPF_FIB_LKUP_RET_SUCCESS,      /* lookup successful */
        BPF_FIB_LKUP_RET_BLACKHOLE,    /* dest is blackholed; can be
dropped */
        BPF_FIB_LKUP_RET_UNREACHABLE,  /* dest is unreachable; can be
dropped */
        BPF_FIB_LKUP_RET_PROHIBIT,     /* dest not allowed; can be
dropped */
        BPF_FIB_LKUP_RET_NOT_FWDED,    /* packet is not forwarded */
        BPF_FIB_LKUP_RET_FWD_DISABLED, /* fwding is not enabled on
ingress */
        BPF_FIB_LKUP_RET_UNSUPP_LWT,   /* fwd requires encapsulation */
        BPF_FIB_LKUP_RET_NO_NEIGH,     /* no neighbor entry for nh */
        BPF_FIB_LKUP_RET_FRAG_NEEDED,  /* fragmentation required to fwd */
};


