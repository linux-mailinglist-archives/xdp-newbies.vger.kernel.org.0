Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF34541E44
	for <lists+xdp-newbies@lfdr.de>; Wed, 12 Jun 2019 09:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfFLHx3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Wed, 12 Jun 2019 03:53:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45116 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfFLHx2 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 12 Jun 2019 03:53:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E0DFB308A951;
        Wed, 12 Jun 2019 07:53:28 +0000 (UTC)
Received: from carbon (ovpn-200-32.brq.redhat.com [10.40.200.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 201F0194B3;
        Wed, 12 Jun 2019 07:53:24 +0000 (UTC)
Date:   Wed, 12 Jun 2019 09:53:23 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     =?UTF-8?B?xLBicmFoaW0=?= Ercan <ibrahim.metu@gmail.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>,
        brouer@redhat.com
Subject: Re: ethtool isn't showing xdp statistics
Message-ID: <20190612095323.620c0791@carbon>
In-Reply-To: <CAK6Qs9kbWdRSer1LTz53BunJkvpQaa02YExen65Tha3HpGrW+w@mail.gmail.com>
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
        <20190610121540.36391dc3@carbon>
        <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
        <20190611124119.49a0e440@carbon>
        <CAK6Qs9mncU4E-ZBSb8RNZrGqUyruU4of-fStr9vhLVmCVHg+TA@mail.gmail.com>
        <20190611164525.6f8e845c@carbon>
        <CAK6Qs9kbWdRSer1LTz53BunJkvpQaa02YExen65Tha3HpGrW+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 12 Jun 2019 07:53:28 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On Wed, 12 Jun 2019 09:57:02 +0300 İbrahim Ercan <ibrahim.metu@gmail.com> wrote:

> I removed bridge and did same tests again. Unfortunately result is
> same :/

I sort of expected that, as the ethtool "rx_missed_errors" counter
says, that packets are dropped inside the NIC, before reaching Linux.
Something more fundamental is wrong with your setup.

You mentioned there was a switch between the machines in your lab.  One
possibility is that the switch is somehow corrupting the frames before
the reach the NIC, e.g. in these overload DDoS scenarios.  Try to
remove the switch from the equation (by directly connecting machine
back-to-back), to identify where the pitfall is...

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
