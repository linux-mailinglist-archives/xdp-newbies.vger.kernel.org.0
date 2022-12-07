Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF6F645262
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 Dec 2022 04:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiLGDFc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Dec 2022 22:05:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiLGDFb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Dec 2022 22:05:31 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484B9537D1
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Dec 2022 19:05:29 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id q190so5931907iod.10
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Dec 2022 19:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jk/Jl9pVwoMFsoSQY/lAV2PhsvNm9RubaSEzDuhL7SA=;
        b=YJ7YYrbf7qgY8Rlskwp0uf2UipOwkh9g4RiT+X144lbtfTkZ4xpWlEaZCthGUHXF6j
         YP89b0HRRIEFdbFr/zbT6URcFXpPFiK8i/yBO5LRABOZgaXX4Ni+pcvZDwMjnfwQw7fL
         Bx4e5qSUddnK8091nNrSh8eJzKliTRpdOMrufmNe7pNfOPEm3IZngqLJVgFZmAxZKtYo
         HjILlRyIvIKdZ0Ab4TYaW1GAAvJTVEmMToNU6TJvWMgA9rxuyYj3G6fOdzoQWN019g+D
         y5usAV6ujs9XUxZJbc388OGxnrzp9dcHT/yEtciK8XpFdgZ8lIeTutz4cZgbM7XVBBFC
         eIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk/Jl9pVwoMFsoSQY/lAV2PhsvNm9RubaSEzDuhL7SA=;
        b=2+5Un6vLXOGver5ZXidJvno2jq8oDQk2GidIXqpb9e+UQGpYfFeY0ZiwBFgaSa6LKi
         Nthd873NGlfwFuMpqkX7FGcAehRIX9qgFzzsXX88yri8oNlUwcUpH7Udr3EsyoY0sbit
         NLy0r2H59QSM3gy1Ldgg5ceVZR7hi00NIMxTQD/keV9qL4mex2dw4VDVwShB2vevWS1D
         kKoQyvQI+gginn6pRg1qGuysv8YYPJsoCMIeEsgUhUepPr3bE7+/X5hvsnCljGivKoq5
         n4rGB2iP3GqwleyfXG1etZ6LwUa4ehDEi3lIwplJByJevaU8kUcepa3OKWT/RWmQJKzL
         +oTw==
X-Gm-Message-State: ANoB5pnD5i05JuJB32MD6lBpeYtuZ4nYEZUHr92+6twChDikXw1wdAQk
        bsawCWCa3LcJ2nD/2lInFPI=
X-Google-Smtp-Source: AA0mqf54nbdzuz7ib+O/r5U3kubtSoZVzbMPeSXK9Oba5/fxYDe5NRhtMVjCgBKxsue0XrR8vzqM/w==
X-Received: by 2002:a6b:3c0b:0:b0:6df:f58c:6932 with SMTP id k11-20020a6b3c0b000000b006dff58c6932mr8149096iob.137.1670382328632;
        Tue, 06 Dec 2022 19:05:28 -0800 (PST)
Received: from [172.16.99.146] (c-73-14-130-18.hsd1.co.comcast.net. [73.14.130.18])
        by smtp.googlemail.com with ESMTPSA id d4-20020a026204000000b00389c2fe0f9dsm7334906jac.85.2022.12.06.19.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 19:05:28 -0800 (PST)
Message-ID: <37d5bcac-4b63-c9f1-280a-caf7d303c309@gmail.com>
Date:   Tue, 6 Dec 2022 20:05:27 -0700
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
 <212bab83-455a-b6b4-7398-a61a6cca2615@gmail.com>
 <CAOLRUnDhZQ0fNJuexPE=B5s=fzS29y74029rPAg0XwgY_bfySw@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
In-Reply-To: <CAOLRUnDhZQ0fNJuexPE=B5s=fzS29y74029rPAg0XwgY_bfySw@mail.gmail.com>
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

On 12/6/22 5:26 PM, team lnx wrote:
> 
> Sure, I did search for it and read some article but found that
> BPF_FIB_LKUP_RET_NOT_FWDED means packets
> are not forwarded and only unicast are forwarded. Verified prog id and
> map id using bpftool to confirm if it has any issue

ok, so this one:

	if (res.type != RTN_UNICAST)
                return BPF_FIB_LKUP_RET_NOT_FWDED;

and the discussion about local return. If this is really supposed to be
forwarding and not local delivery, the next step is verifying the
routing tables and fib lookup parameters:
    perf record -e fib:* -a
    <run test>
    ctrl-c
    perf script

the tracepoints will show you input variables, table ids and result.

> 
> interface details:
> prog/xdp id: 4
> map_ids: 1
> btf_id: 7
> 
> ./bpftool map show id 1
> 1: devmap  name xdp_tx_ports  flags 0x80
> 
> Any hints or suggestions on debugging this issue would be helpful !
> 
> Thanks

