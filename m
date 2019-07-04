Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233605F9EE
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2019 16:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfGDOTG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jul 2019 10:19:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38132 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbfGDOTG (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 4 Jul 2019 10:19:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 105A730832F4
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jul 2019 14:19:06 +0000 (UTC)
Received: from carbon (ovpn-200-17.brq.redhat.com [10.40.200.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0FDBE84284;
        Thu,  4 Jul 2019 14:19:02 +0000 (UTC)
Date:   Thu, 4 Jul 2019 16:19:00 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     brouer@redhat.com
Subject: Should we remove xdp-newbies from kernel patch CC-list?
Message-ID: <20190704161900.43cec3a7@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 04 Jul 2019 14:19:06 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Question to people subscribed to xdp-newbies@vger.kernel.org mailing
list.  As you likely have noticed, patches and kbuild-bot is sending
XDP related kernel stuff to this mailing list.  This is caused by being
listed in the kernel MAINTAINERS file[1].

I've tried to create a survey to collect answers easier:
 https://www.surveymonkey.com/r/MTSL5T3

People can also just respond to mailing-list or just me (if you are
shy or want to reduce ML traffic) then I'll collect the results.


[1] https://github.com/torvalds/linux/blob/v5.2-rc7/MAINTAINERS#L17263-L17271
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

