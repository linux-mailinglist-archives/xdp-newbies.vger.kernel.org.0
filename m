Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB3862A62
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2019 22:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731895AbfGHUdC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Jul 2019 16:33:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45565 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729370AbfGHUc7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Jul 2019 16:32:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so17261705lje.12
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2019 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QmhLmLZUpQw51TcWj6xz/UWa7Fe+O+3V90DXK/aEFco=;
        b=guiXzaD+Q8k8J8Y2zzy+eGlckI4Qfj/1ia32W8QPEpVyDxD+5hgsVF1EBjtMcdA2s/
         5R6J5f6GgfGC+nFAbBkYPeDw/XfsFDCoboRXhsd0sXhsudSf3059LbepmLdXf+bGovGT
         qc6zCll9qpQztznsNGoUo1/z6sIst7IWs3z+Pv7nR02bMmC5DCviI65aoqFu1kzeunE8
         sJFWmex7qjLe3ziuuenXDF2zBUBKL8qpBXz1MQYcrJEwVtkCqsinEygD57Y8dbRhrT+j
         eNRMf0cE5rKvU5kEP5hfxK9mWRVAK1SjUcuMmd409q26ptgM28q5w2oyc86eWpf2IN5O
         UeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=QmhLmLZUpQw51TcWj6xz/UWa7Fe+O+3V90DXK/aEFco=;
        b=DwgZQdaqZrZ/A5vMMKYBSk03el7vhQaa+MHz4i0Lz1rDogNc3FrKTS5tYI3JUqnmXq
         Kx2XNzU1vMkkctE9mrylAMJoDAdcxjCw0cFCxGrLHnhVdXbH2nu5fF8pDv1QONJxFPig
         cvT8g1WrkSqexKwWo1nyvB0t108GYkB3p+Ntn5N9yOLngYX25SkWmWP1Bwi0dN9uXrW6
         Of7srziplRT/XIF5FMleDamLA9WAClXYrAz43CZ3HATTssIfT1LlNaIHMbc/0pAx/puK
         VqKvIMF3Tj0xjQ9tx/wpfcso1nnhwnAwQ6F4KVSErd98wpZUlYig6JJ4F/ZLWRlwD5Pt
         1luw==
X-Gm-Message-State: APjAAAVc18i8ky0VzsDEUWn8Te/ypAYEjDfTXYjbCO4uJNDNFJkotY4l
        GirA3arx940lTUY7TQm+XWsLZg==
X-Google-Smtp-Source: APXvYqwVRisXI+W1yDsrFdBvfB5lZcfxm6xx+YU6rvWYruaiHxMRpCBIx1t+9hogA9dGSL6dnfZZgQ==
X-Received: by 2002:a2e:981:: with SMTP id 123mr11792658ljj.66.1562617977232;
        Mon, 08 Jul 2019 13:32:57 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id z23sm2925562lfq.77.2019.07.08.13.32.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 13:32:56 -0700 (PDT)
Date:   Mon, 8 Jul 2019 23:32:54 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     David Miller <davem@davemloft.net>
Cc:     grygorii.strashko@ti.com, hawk@kernel.org, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
Subject: Re: [PATCH v8 net-next 0/5] net: ethernet: ti: cpsw: Add XDP support
Message-ID: <20190708203252.GA12580@khorivan>
Mail-Followup-To: David Miller <davem@davemloft.net>,
        grygorii.strashko@ti.com, hawk@kernel.org, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
References: <20190705150502.6600-1-ivan.khoronzhuk@linaro.org>
 <20190707.183146.1123763637704790378.davem@davemloft.net>
 <20190707.183511.503486832061897586.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190707.183511.503486832061897586.davem@davemloft.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, Jul 07, 2019 at 06:35:11PM -0700, David Miller wrote:
>From: David Miller <davem@davemloft.net>
>Date: Sun, 07 Jul 2019 18:31:46 -0700 (PDT)
>
>> From: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>> Date: Fri,  5 Jul 2019 18:04:57 +0300
>>
>>> This patchset adds XDP support for TI cpsw driver and base it on
>>> page_pool allocator. It was verified on af_xdp socket drop,
>>> af_xdp l2f, ebpf XDP_DROP, XDP_REDIRECT, XDP_PASS, XDP_TX.
>>>
>>> It was verified with following configs enabled:
>>  ...
>>
>> I'm applying this to net-next, please deal with whatever follow-ups are
>> necessary.
>
>Nevermind, you really have to fix this:
>
>drivers/net/ethernet/ti/davinci_cpdma.c: In function ‘cpdma_chan_submit_si’:
>drivers/net/ethernet/ti/davinci_cpdma.c:1047:12: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   buffer = (u32)si->data;
>            ^
>drivers/net/ethernet/ti/davinci_cpdma.c: In function ‘cpdma_chan_idle_submit_mapped’:
>drivers/net/ethernet/ti/davinci_cpdma.c:1114:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  si.data = (void *)(u32)data;
>            ^
>drivers/net/ethernet/ti/davinci_cpdma.c: In function ‘cpdma_chan_submit_mapped’:
>drivers/net/ethernet/ti/davinci_cpdma.c:1164:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  si.data = (void *)(u32)data;
>            ^
Actrually that's fixed in reply v9 patch.
But, nevermind, i will send v9 for whole series.

-- 
Regards,
Ivan Khoronzhuk
