Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64E8E3B2CB
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Jun 2019 12:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388850AbfFJKPq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Mon, 10 Jun 2019 06:15:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36198 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388734AbfFJKPq (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Jun 2019 06:15:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 32E2330832EF;
        Mon, 10 Jun 2019 10:15:46 +0000 (UTC)
Received: from carbon (ovpn-200-32.brq.redhat.com [10.40.200.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6515A1001943;
        Mon, 10 Jun 2019 10:15:42 +0000 (UTC)
Date:   Mon, 10 Jun 2019 12:15:40 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     =?UTF-8?B?xLBicmFoaW0=?= Ercan <ibrahim.metu@gmail.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com,
        David Ahern <dsahern@gmail.com>
Subject: Re: ethtool isn't showing xdp statistics
Message-ID: <20190610121540.36391dc3@carbon>
In-Reply-To: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 10 Jun 2019 10:15:46 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 10 Jun 2019 12:55:07 +0300
İbrahim Ercan <ibrahim.metu@gmail.com> wrote:

> Hi.
> I'm trying to do a xdp performance test on redhat based environment.
> To do so, I compiled kernel 5.0.13 and iproute 4.6.0
> Then I loaded compiled code to interface with below command.
> #ip -force link set dev enp7s0f0 xdp object xdptest.o
> 
> After that packets dropped as expected but I can not see statistics
> with ethtool command like below.
> #ethtool -S enp7s0f0 | grep xdp
> 
> ethtool version is 4.8
> I did my test with that NIC
> Intel Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (rev 01)
> 
> I wonder why I can't see statistics. Did I miss something while
> compiling kernel or iproute? Should I also compile ethtool too?

You did nothing wrong. Consistency for statistics with XDP is a known
issue, see [1].  The behavior varies per driver, which obviously is bad
from a user perspective.  You NIC is based on ixgbe driver, which don't
have ethtool stats counters for XDP, instead it actually updates
ifconfig counters correctly. While for mlx5 it's opposite (p.s. I use
this[2] ethtool stats tool).

We want to bring consistency in this area, but there are performance
concerns.  As any stat counter will bring overhead, and XDP is all
about maximum performance.  Thus, we want this counter overhead to be
opt-in (that is not on as default).

Currently you have to add the stats your want to the XDP/BPF program
itself.  That is the current opt-in mechanism.  To help you coded this,
we have an example here[3].


[1] https://github.com/xdp-project/xdp-project/blob/master/xdp-project.org#consistency-for-statistics-with-xdp
[2] https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl
[3] https://github.com/xdp-project/xdp-tutorial/blob/master/common/xdp_stats_kern.h
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

