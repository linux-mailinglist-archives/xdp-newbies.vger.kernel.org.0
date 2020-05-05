Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203631C4FCC
	for <lists+xdp-newbies@lfdr.de>; Tue,  5 May 2020 10:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgEEICV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 5 May 2020 04:02:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47687 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEICU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 5 May 2020 04:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588665739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=F824n6o9AwkP7FGk7NZITlebis/3bgUMg6Yl5z2N8JY=;
        b=XDAxbMCAyY0Ql9h4AmE2AcJP6BcFaXJEqIXnbJheqs4CZfbl4U7EZP9p0Ei3TO9L3zD9S8
        yLOAK2/xXLd0SJPoCL2/ZHMIiE4Hxk/IsVHahhtS6ywaEVnt8ZrUXNx5njvU/I8z+UlZR1
        VPzcLKWqpMMKGLmrQ/yUOQUlEEST9TA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-dZ3G4je6N4yzWOc7FrIfuA-1; Tue, 05 May 2020 04:02:13 -0400
X-MC-Unique: dZ3G4je6N4yzWOc7FrIfuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F008014D6;
        Tue,  5 May 2020 08:02:12 +0000 (UTC)
Received: from carbon (unknown [10.40.208.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A97DF70540;
        Tue,  5 May 2020 08:02:04 +0000 (UTC)
Date:   Tue, 5 May 2020 10:02:03 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     brouer@redhat.com,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Subject: Seeking candidates for PhD position related to XDP/eBPF
Message-ID: <20200505100203.38da7ae8@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Potential PhD student,

Reminder: Application deadline 15.May 2020 is really soon for our PhD
position located in Sweden, at Karlstads University.  See:

 "PhD position in Computer Science, programmable networks"
 https://kau.varbi.com/en/what:job/jobID:315513

This PhD position is related to XDP/eBPF.  The Red Hat engineers you
will be cooperating with are Toke and I.  Red Hat is funding the
position, but employment happens under University terms, with the
exception the work should be released under an Open Source license.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

