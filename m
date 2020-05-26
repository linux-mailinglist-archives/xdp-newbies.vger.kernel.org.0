Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A661E1CD9
	for <lists+xdp-newbies@lfdr.de>; Tue, 26 May 2020 10:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731503AbgEZIFA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 26 May 2020 04:05:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37510 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730117AbgEZIEz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 26 May 2020 04:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590480294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cHzr6IVy3f5+EVe81tlgOhfF5RL3YY63m5I8GU1aHWM=;
        b=X6HfGZFBWIu6QoJsUgCav9OMhAQdBA6Kdz+AgO51X5nnEOMUtGWjIKOePy6fCcgPfKdviB
        4ejekbAevTdSTtr84by6KPwlYoy40qdCSYG+D9BY6pgySJd6xUe5IzgkB58z4rOrdtrU+k
        KMZ3x08TEnqHNGeckp/E0Ay7s7sttbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-4IFgEW6ZOPG9Ct6fxoDBEA-1; Tue, 26 May 2020 04:04:50 -0400
X-MC-Unique: 4IFgEW6ZOPG9Ct6fxoDBEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E10351005510;
        Tue, 26 May 2020 08:04:49 +0000 (UTC)
Received: from carbon (unknown [10.40.208.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D2756ED99;
        Tue, 26 May 2020 08:04:47 +0000 (UTC)
Date:   Tue, 26 May 2020 10:04:43 +0200
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
To:     Denis Salopek <Denis.Salopek@fer.hr>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: XDP_REDIRECT forwarding speed
Message-ID: <20200526100443.2c927057@carbon>
In-Reply-To: <AM0PR08MB3345DF6A3FABBCF262B39E968BB00@AM0PR08MB3345.eurprd08.prod.outlook.com>
References: <AM0PR08MB3345DF6A3FABBCF262B39E968BB00@AM0PR08MB3345.eurprd08.prod.outlook.com>
Organization: Red Hat Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 26 May 2020 07:00:30 +0000
Denis Salopek <Denis.Salopek@fer.hr> wrote:

> I want to make sure I did everything right to make my XDP program
> (simple forwarding with bpf_redirect_map) as fast as possible. Is following
> advices and gotchas from this: 
> https://www.mail-archive.com/netdev@vger.kernel.org/msg184139.html
 
I prefer links to lore.kernel.org:
 [1] https://lore.kernel.org/netdev/20170821212506.1cb0d5d6@redhat.com/

Do notice that my results in [1] is for a single queue and single CPU.
In production I assume that you can likely scale this across more CPUs ;-)

> enough or are there some additional/newer recommendations? I managed
> to get near line-rate on my Intel X520s (on Ryzen 3700X and one
> queue/CPU), but not quite 14.88 Mpps so I was wondering is there
> something else to speed things up even more.

In [1] I mention the need to tune the TX-queue to keep up via either
adjusting the TX-DMA completion interrupt interval:

 Tuned with rx-usecs 25:
  ethtool -C ixgbe1 rx-usecs 25 ;\
  ethtool -C ixgbe2 rx-usecs 25

Or increasing the size of the TX-queue, so it doesn't overrun:

 Tuned with adjusting ring-queue sizes:
  ethtool -G ixgbe1 rx 1024 tx 1024 ;\
  ethtool -G ixgbe2 rx 1024 tx 1024

This might not be needed any longer, as I think it was Alexander, that
implemented an improved interrupt adjustment scheme for ixgbe.


> Also, are there any recommended settings/tweaks for bidirectional
> forwarding? I suppose there would be a drop in performance compared to
> single direction, but has anyone done any benchmarks?

As this was 1-CPU you can just run the other direction on another CPU.
That said, it can still be an advantage to run the bidirectional
traffic on the same CPU and RX-TX-queue pair, as above issue with
TX-queue DMA cleanups/completions goes away.  Because, the ixgbe driver
will do TX-cleanups as part (before) the RX-processing.

What is your use-case?
e.g. building an IPv4 router?

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

