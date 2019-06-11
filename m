Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6D23CF5D
	for <lists+xdp-newbies@lfdr.de>; Tue, 11 Jun 2019 16:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404061AbfFKOp3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Tue, 11 Jun 2019 10:45:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38502 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404050AbfFKOp3 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 11 Jun 2019 10:45:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2657B2F8BFF;
        Tue, 11 Jun 2019 14:45:29 +0000 (UTC)
Received: from carbon (ovpn-200-32.brq.redhat.com [10.40.200.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9D3FF60C05;
        Tue, 11 Jun 2019 14:45:27 +0000 (UTC)
Date:   Tue, 11 Jun 2019 16:45:25 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     =?UTF-8?B?xLBicmFoaW0=?= Ercan <ibrahim.metu@gmail.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>
Subject: Re: ethtool isn't showing xdp statistics
Message-ID: <20190611164525.6f8e845c@carbon>
In-Reply-To: <CAK6Qs9mncU4E-ZBSb8RNZrGqUyruU4of-fStr9vhLVmCVHg+TA@mail.gmail.com>
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
        <20190610121540.36391dc3@carbon>
        <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
        <20190611124119.49a0e440@carbon>
        <CAK6Qs9mncU4E-ZBSb8RNZrGqUyruU4of-fStr9vhLVmCVHg+TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 11 Jun 2019 14:45:29 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 11 Jun 2019 16:18:17 +0300
İbrahim Ercan <ibrahim.metu@gmail.com> wrote:

> and loaded with
> ./ip -force link set dev enp7s0f0 xdp object dropudp.o sec prog
> 
> I also realized that after loading xdp code, network go down about 5
> second, Is that normal?
>
> I'm using bridged topology. I don't know it is important or not.
>
> # brctl show
> bridge name     bridge id           STP enabled   interfaces
> br0             8000.00900b3b696c   yes           enp7s0f0   enp7s0f1

I would recommend removing the bridge setup, for isolation the issue,
as this could be the issue.  XDP doesn't cooperate with the bridge
code, and it works on a layer before the bridge.

For the ixgbe driver it does a full link down/up (to reconfigure all
the NIC queues), which is why you likely you see this 5 sec issue, as
you have enabled STP on your bridge.  (Note, replacing an XDP-prog with
another XDP-prog does not require this link down/up).

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
