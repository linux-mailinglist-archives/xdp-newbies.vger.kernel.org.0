Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672B52B9EA
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 May 2019 20:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfE0SKv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 May 2019 14:10:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42651 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfE0SKu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 May 2019 14:10:50 -0400
Received: by mail-lf1-f66.google.com with SMTP id y13so12649401lfh.9
        for <xdp-newbies@vger.kernel.org>; Mon, 27 May 2019 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OPxJbzxj8XRuMP1HaHwQ8HvvmExLWsTd5Jne2FrvM2s=;
        b=ukaGmu7nRGCEMmSYCwuppXI41vUKroOyV3rNIbjLFxOrrlI04GeRpz3vt0TXj9V74r
         NyReSdiC79Bv2WZRleICXZBo7O73fqXldrUjyv/IsqTvpngs+4vnc3AAJzw2IHE+NNih
         Bbd9zNJhxOZX5bNRILoh/FHs+mIHyXpl7iaBAMq3sZIREjkXfOxWaDaRTkjQvj5n/+WV
         3BUZB1PrqP91qroqJIFTk3jTDCBNJ4WjJWs+qlZ95ljylT7z5Znvgv4zks0k1FFJE6c3
         cm6C01KxRr3GcZ8PODwWByX5GLvDvwA25ANlbWXqP4un7p5+BSrvhOr6GMMT1RzuMs4F
         2Q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=OPxJbzxj8XRuMP1HaHwQ8HvvmExLWsTd5Jne2FrvM2s=;
        b=jRkCue6LnLmmx2r6+3j5wqUkv027dcYoVqN3gok+6nI2YLDX+2Vgc40/Wu0O9+0aDf
         6z7Lad2Eijgj/FHLVXVzGHSIvScU+y4yeY/Ia/u8bn5pTu+7B/7EHMJq4HpLfHnOy8aZ
         4GA9cB+bRGPl/CnAyL1SHMEsEz1v1nq2IgqEU/XLbPcxzydo4ddT9nN6AysGn3F8ueC1
         d6tBWd9yZO0LvtxJ+L2RB5znI6uYrEy/Nue9OZXvChgIa02oPvu/ohErAPRC2zqndQbm
         n4tqJxfi0FwHAsW5WLamb/ODn9vWgh0pHeDPeJyP6lfdLYtb+fcHJYJ10QXs1CeivdK3
         xatg==
X-Gm-Message-State: APjAAAWYK61uFkL+nJUEnbIBNbc3ezkOB9COQebKRqjiFr3iGUJXWubv
        qQZlOyn21zeFN0Lj+eVKx/ujyQ==
X-Google-Smtp-Source: APXvYqywGJl2Jp2yjPTg63st1m9dDHZIJnOXy42Wj4rMaR29DgHDpduAOQ8x/hDJDfH9zdIKUOs3Ag==
X-Received: by 2002:a05:6512:144:: with SMTP id m4mr1975972lfo.114.1558980648865;
        Mon, 27 May 2019 11:10:48 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id d18sm2432493lfl.95.2019.05.27.11.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 11:10:48 -0700 (PDT)
Date:   Mon, 27 May 2019 21:10:46 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     grygorii.strashko@ti.com, davem@davemloft.net, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com,
        Tariq Toukan <tariqt@mellanox.com>
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: cpsw: add XDP support
Message-ID: <20190527181043.GA4246@khorivan>
Mail-Followup-To: Jesper Dangaard Brouer <brouer@redhat.com>,
        grygorii.strashko@ti.com, davem@davemloft.net, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com,
        Tariq Toukan <tariqt@mellanox.com>
References: <20190523182035.9283-1-ivan.khoronzhuk@linaro.org>
 <20190523182035.9283-4-ivan.khoronzhuk@linaro.org>
 <20190524135418.5408591e@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190524135418.5408591e@carbon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, May 24, 2019 at 01:54:18PM +0200, Jesper Dangaard Brouer wrote:
>On Thu, 23 May 2019 21:20:35 +0300
>Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
>
>> Add XDP support based on rx page_pool allocator, one frame per page.
>> Page pool allocator is used with assumption that only one rx_handler
>> is running simultaneously. DMA map/unmap is reused from page pool
>> despite there is no need to map whole page.
>
>When using page_pool for DMA-mapping, your XDP-memory model must use
>1-page per packet, which you state you do.  This is because
>__page_pool_put_page() fallback mode does a __page_pool_clean_page()
>unmapping the DMA.  Ilias and I are looking at options for removing this
>restriction as Mlx5 would need it (when we extend the SKB to return
>pages to page_pool).
Thank for what you do, it can simplify a lot...

>
>Unfortunately, I've found another blocker for drivers using the DMA
>mapping feature of page_pool.  We don't properly handle the case, where
>a remote TX-driver have xdp_frame's in-flight, and simultaneously the
>sending driver is unloaded and take down the page_pool.  Nothing crash,
>but we end-up calling put_page() on a page that is still DMA-mapped.

Seems so, ... for generic solution, but looks like in case of cpsw there
is no issue due to "like direct" dma map by adding offset, so whether page_pool
dma map or dma map/unmap per rx/xmit, shouldn't be big difference.  Not sure
about all SoCs thought...

Despite of it, for cpsw I keep page_pool while down/up that I'm going to change
in v2.

>
>I'm working on different solutions for fixing this, see here:
> https://github.com/xdp-project/xdp-project/blob/master/areas/mem/page_pool03_shutdown_inflight.org
Hope there will be no changes in page_pool API.

>-- Best regards,
>  Jesper Dangaard Brouer
>  MSc.CS, Principal Kernel Engineer at Red Hat
>  LinkedIn: http://www.linkedin.com/in/brouer

-- 
Regards,
Ivan Khoronzhuk
