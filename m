Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 153385F5DB
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2019 11:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfGDJnf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jul 2019 05:43:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35390 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbfGDJnf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jul 2019 05:43:35 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so5537351ljh.2
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2019 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=koT6i9zkCkIo6qKGz2zw75s1Vsff/1W7yEqpGG8W2Po=;
        b=OQAI3tiuqOb9JH7CbOmrpLo7PfqVy3+jVC2UkjObgS3fr85TsXWabMo6+5re4GEore
         MtD7kDo5H5ez9Vczp7QZgdSaKz7DEZRTZg2cAkJBh/q5mXu3lRtM7DjNgTFzZxNwILCZ
         fGV9k9JNSUjA1SBWcvZ9ABkFC2C+ZXUJMgqGxeyrzWmsQArC7itTRELQVMeupYBYSs1Q
         SMG9DTyFlxm30ZsYxAThEe2LHTIWXMAA8pCq3zeaWy9yyneYvtLWAo1Ox804lyDcue0l
         zz0BWMBhd3iNGx5MskrEUkYc8CkdfKIXZebjS02mwZax7j94Z5bXz7aTNcGbdsECU/B9
         PVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=koT6i9zkCkIo6qKGz2zw75s1Vsff/1W7yEqpGG8W2Po=;
        b=Cyra68a82Xx7C4l7m/nBu/ENlKABtlNBO/bseid8y1TRBxNxLFvqJd+/GaqEjHN1VF
         JtcL3y3+pqkKDUb4n+sBRXTeYhQEWhzhnyxVcuXCUOkSojY6O6Kw+Y6ctZHJbu7tF/oB
         o+QK0cbYQs9f8MIi4k89+NrZwOTiYeKs002QHSdE3s31gm9Y8OZQ0ojjv6zFPGs+WZ1B
         cfqmG5d6HPkt30TuxWPNz1llruoNfk05n09ARL75LM6MQEdRbq1sVZe+qhHmLGQWHDAv
         BwvyGF4NctsfLr3FKolK8Eom7YkO91x0YnsOuYTWC9Wu7c7kdFifHGFc/uMMIbaTKcQF
         qpCw==
X-Gm-Message-State: APjAAAV+uD+oPuM29Ze44f2AYxlGqdtZC8YZJDrfr0z4YmxbZ1qD2cv9
        nv8NyNiNNdWLp1lph2eS6XlGUQ==
X-Google-Smtp-Source: APXvYqwx7Hus3ievaXb+Pf9821bsqan58KqOXM0/Ck7e2FhzASA+Cunl4Hhga0U7uWJ99y5CrUNDig==
X-Received: by 2002:a2e:995a:: with SMTP id r26mr9110870ljj.107.1562233413260;
        Thu, 04 Jul 2019 02:43:33 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id l15sm1016292lji.11.2019.07.04.02.43.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 02:43:32 -0700 (PDT)
Date:   Thu, 4 Jul 2019 12:43:30 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
Subject: Re: [PATCH v6 net-next 5/5] net: ethernet: ti: cpsw: add XDP support
Message-ID: <20190704094329.GA19839@khorivan>
Mail-Followup-To: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net,
        ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
References: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
 <20190703101903.8411-6-ivan.khoronzhuk@linaro.org>
 <20190704111939.5d845071@carbon>
 <20190704093902.GA26927@apalos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190704093902.GA26927@apalos>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jul 04, 2019 at 12:39:02PM +0300, Ilias Apalodimas wrote:
>On Thu, Jul 04, 2019 at 11:19:39AM +0200, Jesper Dangaard Brouer wrote:
>> On Wed,  3 Jul 2019 13:19:03 +0300
>> Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> wrote:
>>
>> > Add XDP support based on rx page_pool allocator, one frame per page.
>> > Page pool allocator is used with assumption that only one rx_handler
>> > is running simultaneously. DMA map/unmap is reused from page pool
>> > despite there is no need to map whole page.
>> >
>> > Due to specific of cpsw, the same TX/RX handler can be used by 2
>> > network devices, so special fields in buffer are added to identify
>> > an interface the frame is destined to. Thus XDP works for both
>> > interfaces, that allows to test xdp redirect between two interfaces
>> > easily. Aslo, each rx queue have own page pools, but common for both
>> > netdevs.
>> >
>> > XDP prog is common for all channels till appropriate changes are added
>> > in XDP infrastructure. Also, once page_pool recycling becomes part of
>> > skb netstack some simplifications can be added, like removing
>> > page_pool_release_page() before skb receive.
>> >
>> > In order to keep rx_dev while redirect, that can be somehow used in
>> > future, do flush in rx_handler, that allows to keep rx dev the same
>> > while reidrect. It allows to conform with tracing rx_dev pointed
>> > by Jesper.
>>
>> So, you simply call xdp_do_flush_map() after each xdp_do_redirect().
>> It will kill RX-bulk and performance, but I guess it will work.
>>
>> I guess, we can optimized it later, by e.g. in function calling
>> cpsw_run_xdp() have a variable that detect if net_device changed
>> (priv->ndev) and then call xdp_do_flush_map() when needed.
>I tried something similar on the netsec driver on my initial development.
>On the 1gbit speed NICs i saw no difference between flushing per packet vs
>flushing on the end of the NAPI handler.
>The latter is obviously better but since the performance impact is negligible on
>this particular NIC, i don't think this should be a blocker.
>Please add a clear comment on this and why you do that on this driver,
>so people won't go ahead and copy/paste this approach
Sry, but I did this already, is it not enouph?

-- 
Regards,
Ivan Khoronzhuk
