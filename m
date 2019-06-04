Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA2703401A
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Jun 2019 09:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfFDH2a (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Jun 2019 03:28:30 -0400
Received: from smtp-4.sys.kth.se ([130.237.48.193]:43794 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfFDH23 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 4 Jun 2019 03:28:29 -0400
Received: from smtp-4.sys.kth.se (localhost.localdomain [127.0.0.1])
        by smtp-4.sys.kth.se (Postfix) with ESMTP id 8764F2C23;
        Tue,  4 Jun 2019 09:28:26 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at kth.se
Received: from smtp-4.sys.kth.se ([127.0.0.1])
        by smtp-4.sys.kth.se (smtp-4.sys.kth.se [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id DV6B6iexAKPG; Tue,  4 Jun 2019 09:28:26 +0200 (CEST)
X-KTH-Auth: barbette [83.249.19.162]
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kth.se; s=default;
        t=1559633305; bh=QQYSH7YsNhxK6nlDhpKsA8UQf/oBc/akpNCd/8QxeJg=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To;
        b=PHo/yKIP/hOVDPefkzumy8yh++IVIIuT/hXJQgvzi+P8v8SYNgv8D0uzSH1kKH0WF
         UveNbmgUDJ1IFJhb0ImkigrF8TtkG7xGUbA83pmgIwE4NZsnkX3xBxuyYiBLWjzLyp
         ScpPx3tolS4KJ3ZM/ildr8PteIyEkxaPUwLwiRQQ=
X-KTH-mail-from: barbette@kth.se
Received: from [192.168.0.59] (c83-249-19-162.bredband.comhem.se [83.249.19.162])
        by smtp-4.sys.kth.se (Postfix) with ESMTPSA id 189A229EA;
        Tue,  4 Jun 2019 09:28:24 +0200 (CEST)
From:   Tom Barbette <barbette@kth.se>
Subject: Re: Bad XDP performance with mlx5
To:     Saeed Mahameed <saeedm@mellanox.com>,
        "brouer@redhat.com" <brouer@redhat.com>
Cc:     "toke@redhat.com" <toke@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Leon Romanovsky <leonro@mellanox.com>,
        Tariq Toukan <tariqt@mellanox.com>
References: <d7968b89-7218-1e76-86bf-c452b2f8d0c2@kth.se>
 <20190529191602.71eb6c87@carbon>
 <0836bd30-828a-9126-5d99-1d35b931e3ab@kth.se>
 <20190530094053.364b1147@carbon>
 <d695d08a-9ee1-0228-2cbb-4b2538a1d2f8@kth.se>
 <2218141a-7026-1cb8-c594-37e38eef7b15@kth.se>
 <20190531181817.34039c9f@carbon>
 <19ca7cd9a878b2ecc593cd2838b8ae0412463593.camel@mellanox.com>
Message-ID: <9f116335-0fad-079b-4070-89f24af4ab55@kth.se>
Date:   Tue, 4 Jun 2019 09:28:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <19ca7cd9a878b2ecc593cd2838b8ae0412463593.camel@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Le 31/05/2019 à 20:06, Saeed Mahameed a écrit :
> 
> The question is, On the same packet rate/bandwidth do you see higher
> cpu utilization on mlx5 compared to other drivers? you have to compare
> apples to apples.
> 
I meant relative increase. Of course at 40G the XL710 is using less CPU, 
but activating XDP is nearly free. As XDP is purely per packet I would 
expect the cost of it to be similar. Eg, a few instructions per packet.


Thanks Jesper for looking into this!

I don't think I will be of much help further on this matter. My take out 
would be: as a first-time user looking into XDP after watching a dozen 
of XDP talks, I would have expected XDP default settings to be identical 
to SKB, so I don't have to watch out for a set of per-driver parameter 
checklist to avoid increasing my CPU consumption by 15% when inserting 
"a super efficient and light BPF program". But I understand it's not 
that easy...

Tom
