Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A53845F5FD
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2019 11:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfGDJtp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jul 2019 05:49:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40885 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbfGDJto (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jul 2019 05:49:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id p11so5892744wre.7
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2019 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1MIoOEOe3L5d36m+qCZDoY0pkUg2eAP10ETnUDXURVc=;
        b=iYkf0pBbjyD/sMU9ZtotVTX8Nj3cxIR2B5uXK1I26edqdDIxfXtqMM59ghJg2dKRJf
         5aUq/96A4mUDW94U1nSMqrDgpoVn6wHpHG4JeDahR0ZMZaUrHDM60OfM2ag/mOjBUISZ
         +SBU3xRW4w5b3mqiRLbRkDPrnnb76hXhE6Ws0ji6YEGq03He/KDmekfES9DVyOOanIY6
         uj0sXT+pBLWaO1l+JNM6YUPPc2/h2BEv8sS1W55F0ApXfa/KjiWU2f9pW3TC1OrPA2do
         Zv63DV6YqCF6lsGu2AOSHyYrxEMWGL/jgNvxIng+3iToCFCjiJxumk5HCrkaF3w1Iksw
         WhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1MIoOEOe3L5d36m+qCZDoY0pkUg2eAP10ETnUDXURVc=;
        b=tNhFImG3ZB6AxUa1uu5tImC2ZUPLFM6S/V4nxVgj1TrMWucqmovlSXBVySCacPVEEv
         QBZznsbQAZsiDl38ngcri7zeeowmfQTfeOXYH57Jx+WINIJOaGOCSXukgpUVCzIEoMU2
         w1vOZFnbR1DdUUATS1ldMcxA5/tdFjMlYAu8+0kNO8RE16cIEzIypgkXwMT9qZWiDnEo
         dL7nzvi+EKTWKKulUWVWaQJanPm2ijHI05ECE44YdRkArYwwAkkGPsKNbKXvlAM2Dhil
         ubvgH+I+CM9TBBKA2qvcWiLPf0LBeOyAGuIY6fN+iQforuxFAxVBvP+hGUXZXluc38/r
         0kYA==
X-Gm-Message-State: APjAAAX0jrgCtuoelFWxqT64o1OIPYSizXRaC/Ci9ZA0KgK4oseT2WSn
        WQ7cEwMYCg0BakrTZI3SPxrvQA==
X-Google-Smtp-Source: APXvYqxcLaXdXgLAL6JPh0AW/8TU+NXoREQxcAVjjr+ZeZjYaPbS9BIb6pMHKdkLw2iT6OLr+lLjIA==
X-Received: by 2002:adf:db12:: with SMTP id s18mr32305455wri.335.1562233782623;
        Thu, 04 Jul 2019 02:49:42 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
        by smtp.gmail.com with ESMTPSA id y16sm4796099wru.28.2019.07.04.02.49.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 02:49:41 -0700 (PDT)
Date:   Thu, 4 Jul 2019 12:49:38 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
Subject: Re: [PATCH v6 net-next 5/5] net: ethernet: ti: cpsw: add XDP support
Message-ID: <20190704094938.GA27382@apalos>
References: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
 <20190703101903.8411-6-ivan.khoronzhuk@linaro.org>
 <20190704111939.5d845071@carbon>
 <20190704093902.GA26927@apalos>
 <20190704094329.GA19839@khorivan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704094329.GA19839@khorivan>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jul 04, 2019 at 12:43:30PM +0300, Ivan Khoronzhuk wrote:
> On Thu, Jul 04, 2019 at 12:39:02PM +0300, Ilias Apalodimas wrote:
> >On Thu, Jul 04, 2019 at 11:19:39AM +0200, Jesper Dangaard Brouer wrote:
> >>On Wed,  3 Jul 2019 13:19:03 +0300
> >>Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
> >>
> >>> Add XDP support based on rx page_pool allocator, one frame per page.
> >>> Page pool allocator is used with assumption that only one rx_handler
> >>> is running simultaneously. DMA map/unmap is reused from page pool
> >>> despite there is no need to map whole page.
> >>>
> >>> Due to specific of cpsw, the same TX/RX handler can be used by 2
> >>> network devices, so special fields in buffer are added to identify
> >>> an interface the frame is destined to. Thus XDP works for both
> >>> interfaces, that allows to test xdp redirect between two interfaces
> >>> easily. Aslo, each rx queue have own page pools, but common for both
> >>> netdevs.
> >>>
> >>> XDP prog is common for all channels till appropriate changes are added
> >>> in XDP infrastructure. Also, once page_pool recycling becomes part of
> >>> skb netstack some simplifications can be added, like removing
> >>> page_pool_release_page() before skb receive.
> >>>
> >>> In order to keep rx_dev while redirect, that can be somehow used in
> >>> future, do flush in rx_handler, that allows to keep rx dev the same
> >>> while reidrect. It allows to conform with tracing rx_dev pointed
> >>> by Jesper.
> >>
> >>So, you simply call xdp_do_flush_map() after each xdp_do_redirect().
> >>It will kill RX-bulk and performance, but I guess it will work.
> >>
> >>I guess, we can optimized it later, by e.g. in function calling
> >>cpsw_run_xdp() have a variable that detect if net_device changed
> >>(priv->ndev) and then call xdp_do_flush_map() when needed.
> >I tried something similar on the netsec driver on my initial development.
> >On the 1gbit speed NICs i saw no difference between flushing per packet vs
> >flushing on the end of the NAPI handler.
> >The latter is obviously better but since the performance impact is negligible on
> >this particular NIC, i don't think this should be a blocker.
> >Please add a clear comment on this and why you do that on this driver,
> >so people won't go ahead and copy/paste this approach
> Sry, but I did this already, is it not enouph?
The flush *must* happen there to avoid messing the following layers. The comment
says something like 'just to be sure'. It's not something that might break, it's
something that *will* break the code and i don't think that's clear with the
current comment.

So i'd prefer something like 
'We must flush here, per packet, instead of doing it in bulk at the end of
the napi handler.The RX devices on this particular hardware is sharing a
common queue, so the incoming device might change per packet'


Thanks
/Ilias
> 
> -- 
> Regards,
> Ivan Khoronzhuk
