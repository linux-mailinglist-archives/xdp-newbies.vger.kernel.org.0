Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C33E60B57
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2019 20:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfGESQo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jul 2019 14:16:44 -0400
Received: from mail12.gandi.net ([217.70.182.73]:60603 "EHLO gandi.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725730AbfGESQo (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 5 Jul 2019 14:16:44 -0400
X-Greylist: delayed 508 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Jul 2019 14:16:43 EDT
Received: from khany.gandi.net (unknown [10.231.1.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by gandi.net (Postfix) with ESMTPSA id A49D2160540;
        Fri,  5 Jul 2019 18:08:14 +0000 (UTC)
Received: by khany.gandi.net (Postfix, from userid 1000)
        id C9707DC138E; Fri,  5 Jul 2019 18:08:12 +0000 (GMT)
Date:   Fri, 5 Jul 2019 18:08:12 +0000
From:   Arthur Gautier <baloo@gandi.net>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Should we remove xdp-newbies from kernel patch CC-list?
Message-ID: <20190705180812.ahmkhaslgukhxxaq@khany>
References: <20190704161900.43cec3a7@carbon>
 <20190705152428.14b9830c@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705152428.14b9830c@carbon>
User-Agent: NeoMutt/20180716
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jul 05, 2019 at 03:24:28PM +0200, Jesper Dangaard Brouer wrote:
> On Thu, 4 Jul 2019 16:19:00 +0200
> Jesper Dangaard Brouer <brouer@redhat.com> wrote:
> 
> > Question to people subscribed to xdp-newbies@vger.kernel.org mailing
> > list.  As you likely have noticed, patches and kbuild-bot is sending
> > XDP related kernel stuff to this mailing list.  This is caused by being
> > listed in the kernel MAINTAINERS file[1].
> > 
> > I've tried to create a survey to collect answers easier:
> >  https://www.surveymonkey.com/r/MTSL5T3
> 
> I did choose an US holiday for this survey, so I guess US participants
> are not well represented, but the preliminary results are fairly clear
> with 69% for "Remove from MAINTAINERS file".
> 
> I'll give it until tomorrow, to get the US results, before sending a
> patch that removes this list.

Hello Jesper,

To be fair, a ton of people in the US takes a holiday on July 5th to
make a 4 days weekend. You might want to let it run until Monday 8th.

-- 
\o/ Arthur
 G  Gandi.net
