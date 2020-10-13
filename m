Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1D128D282
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Oct 2020 18:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgJMQo4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Oct 2020 12:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34966 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727696AbgJMQo4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Oct 2020 12:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602607494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jGh6CHXYhI3qUL1YJM9lEW9HB3HTOIewbdZlVRoLEfQ=;
        b=R0tllxTc8E0/tkBaPzmQJCzCarWg9nJ5sVJTLsN9bgf2tpQAUb6d4UjIBgdDPojJJ8rc+G
        3V4XWGayOtkFHkwqEGEx1zNnzdqU6AJCTHcwWLgA1sjkYWCS4uk9BSXyUEANdbujAKivFl
        SHh58TFxLE4t57WHv3SvNfvz79oTjaM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-MtjqD7CaPvCFmahCOLsyHg-1; Tue, 13 Oct 2020 12:44:53 -0400
X-MC-Unique: MtjqD7CaPvCFmahCOLsyHg-1
Received: by mail-vk1-f197.google.com with SMTP id y18so183685vkd.14
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Oct 2020 09:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=jGh6CHXYhI3qUL1YJM9lEW9HB3HTOIewbdZlVRoLEfQ=;
        b=YlNkyBMjWddy4DHX+s4yCw4Sx1MyVlbuLPzjTnNp5KA/r7lzrNfBAw+4D41h/rV+/V
         V0FmeuamOdf87EGPnuXFs9xNT1En7bWNIvK1un3H1cRZqQO5D//dZShE7tq33pGk+dga
         uMTo756nWMBLSa4+NG3kHjevqIN+MDgX58abz5YDPqqfQy2c6KpZhf15DNlW0vlB0AjL
         JKhPCEh9VV3ihm05sicP1PG+q7uf4XzzcjsxUXxDDDuGat/UsUzVl32PkqlO5rL376UP
         li7VDBESgNbI4o0rmhr1Y4xh7IVoy4iVgBppfXN4XpnbG7/v0/FYLprmUhtcYvmz0nmm
         Yuxg==
X-Gm-Message-State: AOAM533a6L9bO7alQmUPNMYEglqah1x8s/g79WHrxomedD7Iu6UG44jY
        UPJdTBoqQ8ENYH0v7kXSM3KQV2NWxCzFKpZfnVcL7y/re+uyBCoqVXmfDXkendo8o8sa+Deg2+h
        /UZu4SC+9ZHR+JO0PLf8ShGA=
X-Received: by 2002:a67:6991:: with SMTP id e139mr601604vsc.25.1602607492092;
        Tue, 13 Oct 2020 09:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLgczWYdIUQU2JUzF09loUU5Mpjkmfwmu7MruVTh1koZFnm7RgV6juLnA1bAUasvkRj9ncAg==
X-Received: by 2002:a67:6991:: with SMTP id e139mr601586vsc.25.1602607491782;
        Tue, 13 Oct 2020 09:44:51 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id t6sm66193vke.28.2020.10.13.09.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 09:44:50 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 4357B181CC1; Tue, 13 Oct 2020 18:44:49 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Federico Parola <fede.parola@hotmail.it>,
        xdp-newbies@vger.kernel.org
Subject: Re: Multi-core scalability problems
In-Reply-To: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 13 Oct 2020 18:44:49 +0200
Message-ID: <87r1q29ita.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Federico Parola <fede.parola@hotmail.it> writes:

> Hello,
> I'm testing the performance of XDP when dropping packets using multiple 
> cores and I'm getting unexpected results.
> My machine is equipped with a dual port Intel XL710 40 GbE and an Intel 
> Xeon Gold 5120 CPU @ 2.20GHz with 14 cores (HyperThreading disabled), 
> running Ubuntu server 18.04 with kernel 5.8.12.
> I'm using the xdp_rxq_info program from the kernel tree samples to drop 
> packets.
> I generate 64 bytes UDP packets with MoonGen for a total of 42 Mpps. 
> Packets are uniformly distributed in different flows (different src 
> port) and I use flow direction rules on the rx NIC to send these flows 
> to different queues/cores.
> Here are my results:
>
> 1 FLOW:
> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       17784270    0
> XDP-RX CPU      total   17784270
>
> RXQ stats       RXQ:CPU pps         issue-pps
> rx_queue_index    0:0   17784270    0
> rx_queue_index    0:sum 17784270
> ---
>
> 2 FLOWS:
> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       7016363     0
> XDP-RX CPU      1       7017291     0
> XDP-RX CPU      total   14033655
>
> RXQ stats       RXQ:CPU pps         issue-pps
> rx_queue_index    0:0   7016366     0
> rx_queue_index    0:sum 7016366
> rx_queue_index    1:1   7017294     0
> rx_queue_index    1:sum 7017294
> ---
>
> 4 FLOWS:
> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP options:no_touch
> XDP stats       CPU     pps         issue-pps
> XDP-RX CPU      0       2359478     0
> XDP-RX CPU      1       2358508     0
> XDP-RX CPU      2       2357042     0
> XDP-RX CPU      3       2355396     0
> XDP-RX CPU      total   9430425
>
> RXQ stats       RXQ:CPU pps         issue-pps
> rx_queue_index    0:0   2359474     0
> rx_queue_index    0:sum 2359474
> rx_queue_index    1:1   2358504     0
> rx_queue_index    1:sum 2358504
> rx_queue_index    2:2   2357040     0
> rx_queue_index    2:sum 2357040
> rx_queue_index    3:3   2355392     0
> rx_queue_index    3:sum 2355392
>
> I don't understand why overall performance is reducing with the number 
> of cores, according to [1] I would expect it to increase until reaching 
> a maximum value. Is there any parameter I should tune to overcome the 
> problem?

Yeah, this does look a bit odd. My immediate thought is that maybe your
RXQs are not pinned to the cores correctly? There is nothing in
xdp_rxq_info that ensures this, you have to configure the IRQ affinity
manually. If you don't do this, I suppose the processing could be
bouncing around on different CPUs leading to cache line contention when
updating the stats map.

You can try to look at what the actual CPU load is on each core -
'mpstat -P ALL -n 1' is my goto for this.

-Toke

