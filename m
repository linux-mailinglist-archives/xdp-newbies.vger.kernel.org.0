Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC0610D490
	for <lists+xdp-newbies@lfdr.de>; Fri, 29 Nov 2019 12:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfK2LMn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 29 Nov 2019 06:12:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60681 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725892AbfK2LMn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 29 Nov 2019 06:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575025962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QaHdUTwod8xCSPXvdK4PSsHUTlwkL38TBQOJsqgweHg=;
        b=L/boR6LVzKNiMsQ3kCI8hWL8Ea1I9ndABfqXr6a5yFKyP8z297z8ootTPw2ijmQZE3z5rF
        y3em6Q+XLa6LdS8PVPft58xKZwqlJdo48bpZl7Cgxg9RxalTOQn+NsIo17aivzz720GuZj
        INDhP5nPvz4xt3zaHCssXZeW0KSXPQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Zi5_ziJGOVusizKotB3bcw-1; Fri, 29 Nov 2019 06:12:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8B0B56BDD
        for <xdp-newbies@vger.kernel.org>; Fri, 29 Nov 2019 11:12:39 +0000 (UTC)
Received: from carbon (ovpn-200-39.brq.redhat.com [10.40.200.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C6E755DA75;
        Fri, 29 Nov 2019 11:12:33 +0000 (UTC)
Date:   Fri, 29 Nov 2019 12:12:32 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     brouer@redhat.com
Subject: Video for understanding eBPF conceptually
Message-ID: <20191129121232.5e5a31ec@carbon>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Zi5_ziJGOVusizKotB3bcw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Brendan Gregg (NetFlix) claim that eBPF is the first fundamental change
to how kernels are used in 50 years, and explain why in this 31 minutes
video.

 https://www.youtube.com/watch?v=7pmXdG8-7WU

I really recommend to watch this video, to understand why the BPF model
is so fundamentally different from the existing OS model we all assume.

XDP is mentioned, but XDP is just a user of BPF, that takes advantage
of the BPF model.  As I've said before, the real power comes when
combining several BPF hooks.  Go explore the BCC/bpftrace tracing tools
that are also mentioned.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

