Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0325E3AB965
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Jun 2021 18:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbhFQQUo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Jun 2021 12:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45281 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231955AbhFQQUl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Jun 2021 12:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623946713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=njjuG5iTIDORU8mPaVDAWWMfRk7DO0CJqh9UOosYsso=;
        b=f72cqrzz8RFuo2wgjfFYeJr14ww2iqEL/hpixy96MgNH5ghRe+CXiDjV8PfPhso7NFlI8h
        5Y3bpGPko9pjc/PlQXQFu90/fYDgnRobAVGO5L16XQf0D1m/L+rYqCdVBLlExPnMbPpP1K
        BeSuG870rhEhj2c4AK3XLrIRzaKiASk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-D4m-uNi_PT6F_IDzsfbxsQ-1; Thu, 17 Jun 2021 12:18:29 -0400
X-MC-Unique: D4m-uNi_PT6F_IDzsfbxsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A246C8C69FB;
        Thu, 17 Jun 2021 16:17:07 +0000 (UTC)
Received: from carbon (unknown [10.36.110.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3027E1001281;
        Thu, 17 Jun 2021 16:17:04 +0000 (UTC)
Date:   Thu, 17 Jun 2021 18:17:03 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc:     brouer@redhat.com, Rich Brown <richb.hanover@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Robert Chacon <robert.chacon@jackrabbitwireless.com>,
        Yoel Caspersen <yoel@kviknet.dk>
Subject: Re: Traffic shaping at 10~300mbps at a 10Gbps link
Message-ID: <20210617181703.585ac78e@carbon>
In-Reply-To: <20210617121839.39aefb12@babalu>
References: <20210617121839.39aefb12@babalu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


(Reply inlined below, please learn howto reply inline)

On Thu, 17 Jun 2021 12:20:32 -0300
"Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:

> Hi. mr. Brouer
> 
> I read your comment at lists.bufferbloat.net about my issue shaping traffic.

 https://lists.bufferbloat.net/pipermail/bloat/2021-June/016441.html
 
> I don't know how it ended up there since I opened it at LARTC, I am
> not a subscriber to bufferbloat list.

Yes, Rich (cc) moved your email to the bufferbloat list.  I just
pointed out that your reported issue was a classical TC root-queue
locking issue (as someone else mis-interpreted this).

I'm Cc'ing XDP-newbies list, as we should share our finding with the
community on how this TC-lock problem can be solve with XDP.


> About your XDP-project solution, how can I test it? 

There a two solutions in XDP-project involving TC-BPF in combination
with XDP.  The one you are talking about is:

 [2] https://github.com/xdp-project/xdp-cpumap-tc


> I read the "tc_mq_htb_setup_example.sh" script and did not understand
> it completely.

 [3] https://github.com/xdp-project/xdp-cpumap-tc/blob/master/bin/tc_mq_htb_setup_example.sh

> Do you think it will sove my problem?

Well, yes, *but* notice there are some "home-work" in the bottom of the
script.  You need to code-up the redirecting to the appropriate CPUs
yourself... it will be specific to your use-case if you can partition
the traffic to avoid the TC root-lock.

Can you explain you use-case for us?

> Would you help with my doubts so I can implementing it?

Let help each-other. It doesn't scale that I help on an individual
level.  That is why I bring this to the mailing list
(xdp-newbies@vger.kernel.org).  Also Cc'ing Yoel and Robert, that have
related interests in this.

I do acknowledge that the documentation in [2] is lacking. Perhaps a
goal should be that we add documentation on howto use it?

A longer term goal is to add contents to this almost empty repo:
 https://github.com/xdp-project/BNG-router

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

