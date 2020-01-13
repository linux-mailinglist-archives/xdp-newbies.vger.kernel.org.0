Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9C16139042
	for <lists+xdp-newbies@lfdr.de>; Mon, 13 Jan 2020 12:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgAMLln (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 13 Jan 2020 06:41:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25885 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725992AbgAMLlm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 13 Jan 2020 06:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578915702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i3yuc+DWl9EXMWPBOwWbbDsJI75GmRB2tEghFuhrAts=;
        b=HbvuCU0tzKC7sFPoBrFmP1uW8j3sBPelPyy/B9ByKC3OfFZUsIY9bCvoVhvtt/cs9k5OKt
        KJBqKqzR6SZR+DbZgr4U/AQuj9YBTLkijy7GgfNntvVC9AK71dHGmUlam28KdIsscMB76x
        vg+p9jiR06dDybRT9wmfFdSA2Bwp/VA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-XBdfQpm0PBOcubXxifs79A-1; Mon, 13 Jan 2020 06:41:40 -0500
X-MC-Unique: XBdfQpm0PBOcubXxifs79A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0E0800A02;
        Mon, 13 Jan 2020 11:41:39 +0000 (UTC)
Received: from carbon (ovpn-200-25.brq.redhat.com [10.40.200.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8620888868;
        Mon, 13 Jan 2020 11:41:38 +0000 (UTC)
Date:   Mon, 13 Jan 2020 12:41:34 +0100
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
Message-ID: <20200113124134.3974cbed@carbon>
In-Reply-To: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
Organization: Red Hat Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 13 Jan 2020 00:18:36 +0000
Ryan Goodfellow <rgoodfel@isi.edu> wrote:

> The numbers that I have been able to achive with this code are the following. MTU
> is 1500 in all cases.
> 
>     mlx5: pps ~ 2.4 Mpps, 29 Gbps (driver mode, zero-copy)
>     i40e: pps ~ 700 Kpps, 8 Gbps (skb mode, copy)
>     virtio: pps ~ 200 Kpps, 2.4 Gbps (skb mode, copy, all qemu/kvm VMs)
> 
> Are these numbers in the ballpark of what's expected?

I would say they are too slow / low.

Have you remembered to do bulking?


-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

