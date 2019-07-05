Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F6860689
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2019 15:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbfGENYd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jul 2019 09:24:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55470 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728841AbfGENYd (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 5 Jul 2019 09:24:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 27DD630C543D
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jul 2019 13:24:33 +0000 (UTC)
Received: from carbon (ovpn-200-17.brq.redhat.com [10.40.200.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DEDE8900A3;
        Fri,  5 Jul 2019 13:24:29 +0000 (UTC)
Date:   Fri, 5 Jul 2019 15:24:28 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     brouer@redhat.com
Subject: Re: Should we remove xdp-newbies from kernel patch CC-list?
Message-ID: <20190705152428.14b9830c@carbon>
In-Reply-To: <20190704161900.43cec3a7@carbon>
References: <20190704161900.43cec3a7@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 05 Jul 2019 13:24:33 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 4 Jul 2019 16:19:00 +0200
Jesper Dangaard Brouer <brouer@redhat.com> wrote:

> Question to people subscribed to xdp-newbies@vger.kernel.org mailing
> list.  As you likely have noticed, patches and kbuild-bot is sending
> XDP related kernel stuff to this mailing list.  This is caused by being
> listed in the kernel MAINTAINERS file[1].
> 
> I've tried to create a survey to collect answers easier:
>  https://www.surveymonkey.com/r/MTSL5T3

I did choose an US holiday for this survey, so I guess US participants
are not well represented, but the preliminary results are fairly clear
with 69% for "Remove from MAINTAINERS file".

I'll give it until tomorrow, to get the US results, before sending a
patch that removes this list.


> People can also just respond to mailing-list or just me (if you are
> shy or want to reduce ML traffic) then I'll collect the results.
> 
> [1] https://github.com/torvalds/linux/blob/v5.2-rc7/MAINTAINERS#L17263-L17271

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
