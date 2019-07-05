Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E3060B8A
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2019 20:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbfGESs5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jul 2019 14:48:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53264 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbfGESs5 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 5 Jul 2019 14:48:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5E22B3083391;
        Fri,  5 Jul 2019 18:48:57 +0000 (UTC)
Received: from carbon (ovpn-200-17.brq.redhat.com [10.40.200.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7E7B5DD8D;
        Fri,  5 Jul 2019 18:48:53 +0000 (UTC)
Date:   Fri, 5 Jul 2019 20:48:52 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Arthur Gautier <baloo@gandi.net>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        brouer@redhat.com
Subject: Re: Should we remove xdp-newbies from kernel patch CC-list?
Message-ID: <20190705204852.42be642f@carbon>
In-Reply-To: <20190705180812.ahmkhaslgukhxxaq@khany>
References: <20190704161900.43cec3a7@carbon>
        <20190705152428.14b9830c@carbon>
        <20190705180812.ahmkhaslgukhxxaq@khany>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 05 Jul 2019 18:48:57 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 5 Jul 2019 18:08:12 +0000
Arthur Gautier <baloo@gandi.net> wrote:

> On Fri, Jul 05, 2019 at 03:24:28PM +0200, Jesper Dangaard Brouer wrote:
> > On Thu, 4 Jul 2019 16:19:00 +0200
> > Jesper Dangaard Brouer <brouer@redhat.com> wrote:
> >   
> > > Question to people subscribed to xdp-newbies@vger.kernel.org mailing
> > > list.  As you likely have noticed, patches and kbuild-bot is sending
> > > XDP related kernel stuff to this mailing list.  This is caused by being
> > > listed in the kernel MAINTAINERS file[1].
> > > 
> > > I've tried to create a survey to collect answers easier:
> > >  https://www.surveymonkey.com/r/MTSL5T3  
> > 
> > I did choose an US holiday for this survey, so I guess US participants
> > are not well represented, but the preliminary results are fairly clear
> > with 69% for "Remove from MAINTAINERS file".
> > 
> > I'll give it until tomorrow, to get the US results, before sending a
> > patch that removes this list.  
> 
> Hello Jesper,
> 
> To be fair, a ton of people in the US takes a holiday on July 5th to
> make a 4 days weekend. You might want to let it run until Monday 8th.
 
Fair point, it is bad timing.  Unfortunately I travel on holidays
Sunday 7th, thus that will delay the patch until after my holidays, and
likely after the merge window (as Linus will make rc8 or release this
Sunday).  I guess, we are not in a hurry... so let's just wait, until
after the merge window.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
