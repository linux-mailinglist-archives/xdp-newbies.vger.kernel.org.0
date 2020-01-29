Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8BC14CC63
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Jan 2020 15:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgA2O0h (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Jan 2020 09:26:37 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21674 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726261AbgA2O0h (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Jan 2020 09:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580307996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iIeWZ2oxrgmLniVaNVNGaMHEfbuuFfPQRFxgwvAAzlw=;
        b=CZDBvbWjjjUSNG7m2a70GrGT4PVcwEYUYtyz+MjT/Zhn1FuUN+sgQzfO9golZ2+ECsM5x+
        ih5jOPDc0vG1rplC+DNRG0mSfinmtDj6HbwYNYNGDKjD+RnbJ1RFA41H0rZwAGdhR7yzZx
        aUB6+bshU6CvyXW2cDFeus7KGbiVKVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-jZFXXuugNpOm0dagpbsv-A-1; Wed, 29 Jan 2020 09:26:30 -0500
X-MC-Unique: jZFXXuugNpOm0dagpbsv-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760EF1005510;
        Wed, 29 Jan 2020 14:26:29 +0000 (UTC)
Received: from carbon (ovpn-200-56.brq.redhat.com [10.40.200.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C80225DA66;
        Wed, 29 Jan 2020 14:26:25 +0000 (UTC)
Date:   Wed, 29 Jan 2020 15:26:24 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Measuring/Debugging XDP Performance
Message-ID: <20200129152624.2d0dde2a@carbon>
In-Reply-To: <b1d478e6-555c-97da-f967-4f10f879f589@gflclan.com>
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
        <20200123141122.3783e298@carbon>
        <23ec64c0-e0d7-a60b-ecc4-6ca401dc4896@gflclan.com>
        <20200123213808.7a1f200b@carbon>
        <fdd597bf-7da9-f9bd-d97f-f1bd90f14281@gflclan.com>
        <b1d478e6-555c-97da-f967-4f10f879f589@gflclan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 28 Jan 2020 12:42:21 -0600
Christian Deacon <gamemann@gflclan.com> wrote:

> With that said, it appears my other POP servers that are using the 
> "virtio_net" NIC driver are using XDP generic according to the 'perf' 
> results as well (they're similar to the above). They're also on
> kernel 4.18.

First of all 'virtio_net' is tricky to get working with 'native-XDP',
because you need to disable a number of offloads.  This have gotten a
bit easier on newer kernels.

That said, it is important to understand that getting raw "fast" frames
into your "virtio_net" virtual netcard is a two-stage "rocket".   The
owner of the hardware box also need a native-XDP netcard that runs XDP
which XDP-redirect frames into your virtual NIC, else there is not
performance advantage.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

