Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 378CD1468C4
	for <lists+xdp-newbies@lfdr.de>; Thu, 23 Jan 2020 14:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgAWNLc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 23 Jan 2020 08:11:32 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55323 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726232AbgAWNLc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 23 Jan 2020 08:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579785091;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oGL84D77x5qfDJkDJTH63ITxMgVZAw9bJZHV2wVYPmc=;
        b=NunI+K8xdzN2hBc7EBqVDiQyvkpu5t4V+Sx3DZK/Os1zZthw6ICqS7lu9esmRXRBd5JeAn
        FvNRsGlaGCpqOl5bhWUndjzoViwE++9ZQw/oQHZgzVQCGqrLiBe55iyCoZN14eiLP27+yG
        py0QExdsx7r9fY99wwii0MHPQHZoPmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-pf30w1j2OayaMdFyX1fZ8w-1; Thu, 23 Jan 2020 08:11:29 -0500
X-MC-Unique: pf30w1j2OayaMdFyX1fZ8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0391A8010C9;
        Thu, 23 Jan 2020 13:11:28 +0000 (UTC)
Received: from carbon (ovpn-200-37.brq.redhat.com [10.40.200.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B908E19C69;
        Thu, 23 Jan 2020 13:11:24 +0000 (UTC)
Date:   Thu, 23 Jan 2020 14:11:22 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org
Subject: Re: Measuring/Debugging XDP Performance
Message-ID: <20200123141122.3783e298@carbon>
In-Reply-To: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 22 Jan 2020 12:02:23 -0600
Christian Deacon <gamemann@gflclan.com> wrote:

> Hey everyone,
> 
> I am new to XDP + AF_XDP (along with C programming in general), but I am 
> very interested in it and I've been learning a lot recently. I own an 
> Anycast network and our POP servers are running custom software our 
> developer created that processes packets using XDP. This software 
> basically forwards specific traffic to another machine via an IPIP 
> tunnel.

Why are you using AF_XDP to implement a simple IPIP tunnel header?

You can easily implement it in BPF.
Example here:
 https://github.com/torvalds/linux/blob/master/samples/bpf/xdp_tx_iptunnel_kern.c#L110-L112
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

