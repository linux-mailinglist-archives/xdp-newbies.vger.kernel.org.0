Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91EB91472A7
	for <lists+xdp-newbies@lfdr.de>; Thu, 23 Jan 2020 21:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgAWUiS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 23 Jan 2020 15:38:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44892 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726167AbgAWUiS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 23 Jan 2020 15:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579811896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aYIDMWNLZ5y/pwRklPKKjuFTA8QsPh9saB+ZqANavjc=;
        b=B5PWMgbN9AzX0+UV8/Fu1uaOdKgMK21lGD7grI6nnwIXhDuv9wJ4c7z0pmVKttsSqKoDLb
        cyvCnmE/e2p7BfYskCg7Zz00XErhBMe6T8FTDebYLcULksmz2fMOVVJbxWT3sj1Gl5nl4X
        ubs22+MVBAY9x+Gu8VC+GyUP9wXOcXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-odwKsWE0PYSnd9JsHs-7Rg-1; Thu, 23 Jan 2020 15:38:14 -0500
X-MC-Unique: odwKsWE0PYSnd9JsHs-7Rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66E7F190B2A3;
        Thu, 23 Jan 2020 20:38:13 +0000 (UTC)
Received: from carbon (ovpn-200-24.brq.redhat.com [10.40.200.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BFD5F87EDC;
        Thu, 23 Jan 2020 20:38:09 +0000 (UTC)
Date:   Thu, 23 Jan 2020 21:38:08 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Measuring/Debugging XDP Performance
Message-ID: <20200123213808.7a1f200b@carbon>
In-Reply-To: <23ec64c0-e0d7-a60b-ecc4-6ca401dc4896@gflclan.com>
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
        <20200123141122.3783e298@carbon>
        <23ec64c0-e0d7-a60b-ecc4-6ca401dc4896@gflclan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 23 Jan 2020 11:22:31 -0600
Christian Deacon <gamemann@gflclan.com> wrote:

> Thank you for the information and I will try these commands tonight when 
> there is higher traffic load! The 'perf' command seems interesting.

Thanks for the perf output in the private email thread. From the output
I can clearly see the problem (some copy pasted below signature).  You
are using the driver igb which does not support XDP-native, and is thus
using generic-XDP.

This driver only have 192 bytes headroom, where 256 is needed.  Thus,
running XDP-generic will be slower than running the normal network
stack, as every packet will get reallocated and copied.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

     2.88%  swapper          [kernel.kallsyms]         [k] igb_poll
            |          
             --2.82%--igb_poll
                       |          
                        --2.45%--net_rx_action
                                  __softirqentry_text_start
                                  irq_exit



    0.71%  006  swapper          [kernel.kallsyms]         [k] page_frag_free
            |
            ---page_frag_free
               |          
                --0.68%--skb_free_head
                          pskb_expand_head
                          do_xdp_generic
                          netif_receive_skb_internal
                          napi_gro_receive
                          igb_clean_rx_irq
                          igb_poll
                          net_rx_action




