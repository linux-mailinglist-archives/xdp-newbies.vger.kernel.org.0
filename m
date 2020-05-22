Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9952F1DEC76
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 May 2020 17:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbgEVPwP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 May 2020 11:52:15 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25909 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730181AbgEVPwP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 May 2020 11:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590162734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w0Sj2mAZZ6dpissl746j2hEOwt0w8WanJ2omiv3z6Is=;
        b=KKsfoUXnJs690Jph6u9mpiADwlMLRrUvqHhgMgW2Vncewb+klYSDLYEKZ1ZJx3etGhZqGp
        o9dZsEXj969wXkXXBGnhJBmqyZzUpzdsnqQ4s+UBqMxFEHc4APBtz0KN3bP/s7gEe3JAQf
        dvU5zmbyKhD/d0qyPZnWT1Z98hkcmUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-4Qd0AkL0P--pV5HeER4iHw-1; Fri, 22 May 2020 11:52:09 -0400
X-MC-Unique: 4Qd0AkL0P--pV5HeER4iHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D148CDE39;
        Fri, 22 May 2020 15:51:39 +0000 (UTC)
Received: from carbon (unknown [10.40.208.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B86746248F;
        Fri, 22 May 2020 15:51:37 +0000 (UTC)
Date:   Fri, 22 May 2020 17:51:36 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
Message-ID: <20200522175136.5a6fdc55@carbon>
In-Reply-To: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 22 May 2020 10:22:10 -0500
Christian Deacon <gamemann@gflclan.com> wrote:

> If I'm not doing anything wrong here, is it possible there's a bug with 
> the NIC's driver? Unfortunately, I'm not sure which driver the cluster's 
> NIC is using. 

Please run:
 ethtool -i ens3

And provide output.  As it will tell you that NIC driver you are using.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

