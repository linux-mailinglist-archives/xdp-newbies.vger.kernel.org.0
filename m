Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34355308FA
	for <lists+xdp-newbies@lfdr.de>; Fri, 31 May 2019 08:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbfEaGvs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 31 May 2019 02:51:48 -0400
Received: from smtp-3.sys.kth.se ([130.237.48.192]:40480 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfEaGvs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 31 May 2019 02:51:48 -0400
Received: from smtp-3.sys.kth.se (localhost.localdomain [127.0.0.1])
        by smtp-3.sys.kth.se (Postfix) with ESMTP id 9DA62A163;
        Fri, 31 May 2019 08:51:45 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at kth.se
Received: from smtp-3.sys.kth.se ([127.0.0.1])
        by smtp-3.sys.kth.se (smtp-3.sys.kth.se [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id I-dIDmAokOpj; Fri, 31 May 2019 08:51:44 +0200 (CEST)
X-KTH-Auth: barbette [130.237.20.142]
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kth.se; s=default;
        t=1559285504; bh=Ztri33+sVkHQpD3ZDEDpszrhj55Gzb9C2G6k7XAsgr0=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To;
        b=AkjtzCPDRrLKx+865jsSfFeJ5w7fQiDPtT6Un4dcy2D3NVYIYo/HVVdpR9m9MJ+HL
         z6PLPnn8wwtk+UW51xjdV/HKdKWsxC/nfeqAgewwqdXBdxxm5iYfpdFHlVePRG/CtV
         hGa6WZwGnKRpfSpDcL/G5Tt53XxQVzRwcjuSKw6E=
X-KTH-mail-from: barbette@kth.se
Received: from [130.237.20.142] (s2587.it.kth.se [130.237.20.142])
        by smtp-3.sys.kth.se (Postfix) with ESMTPSA id AC941A0A7;
        Fri, 31 May 2019 08:51:43 +0200 (CEST)
Subject: Re: Bad XDP performance with mlx5
From:   Tom Barbette <barbette@kth.se>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Leon Romanovsky <leonro@mellanox.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>
References: <d7968b89-7218-1e76-86bf-c452b2f8d0c2@kth.se>
 <20190529191602.71eb6c87@carbon>
 <0836bd30-828a-9126-5d99-1d35b931e3ab@kth.se>
 <20190530094053.364b1147@carbon>
 <d695d08a-9ee1-0228-2cbb-4b2538a1d2f8@kth.se>
Message-ID: <2218141a-7026-1cb8-c594-37e38eef7b15@kth.se>
Date:   Fri, 31 May 2019 08:51:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d695d08a-9ee1-0228-2cbb-4b2538a1d2f8@kth.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

CCing mlx5 maintainers and commiters of bce2b2b. TLDK: there is a huge 
CPU increase on CX5 when introducing a XDP program. See 
https://www.youtube.com/watch?v=o5hlJZbN4Tk&feature=youtu.be around 
0:40. We're talking something like 15% while it's near 0 for other 
drivers. The machine is a recent Skylake. For us it makes XDP unusable. 
Is that a known problem?

I wonder if it doesn't simply come from mlx5/en_main.c:

rq->buff.map_dir = rq->xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;

Which would be inline from my observation that memory access seems 
heavier. I guess this is for the XDP_TX case.

If this is indeed the problem. Any chance we can:
a) detect automatically that a program will not return XDP_TX (I'm not 
quite sure about what the BPF limitations allow to guess in advance) or
b) add a flag to such as XDP_FLAGS_NO_TX to avoid such hit in 
performance when not needed?

Thanks,

Tom
