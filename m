Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE61403453
	for <lists+xdp-newbies@lfdr.de>; Wed,  8 Sep 2021 08:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237226AbhIHGj0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 8 Sep 2021 02:39:26 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:41463 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhIHGjZ (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 8 Sep 2021 02:39:25 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 1886c7Wr015032;
        Wed, 8 Sep 2021 08:38:07 +0200
Date:   Wed, 8 Sep 2021 08:38:07 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Jose Fernandez <me@jrfernandez.com>
Cc:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
        Zvi Effron <zeffron@riotgames.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Linux laptop with native XDP support
Message-ID: <20210908063807.GA14966@1wt.eu>
References: <CAPwzzmsGdMqa9PnOQvtDOcwdByi8CzVEmLHpCmvdVfa4Rnkjeg@mail.gmail.com>
 <CAC1LvL1x4Y9BJPtLncy=uFyq-0LdjpM45a=hRtf8gGVQevD-qQ@mail.gmail.com>
 <87k0jsp5se.fsf@toke.dk>
 <CAPwzzmu_YGhSjQvyx23enetF_5DTdeAa49jh73CvSQoAK766ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPwzzmu_YGhSjQvyx23enetF_5DTdeAa49jh73CvSQoAK766ug@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Sep 07, 2021 at 06:50:49PM -0700, Jose Fernandez wrote:
> > Nope, no XDP support for WiFi. There was some exploratory discussion
> > about that some years ago, but XDP has Ethernet as a pretty fundamental
> > assumption so it's not an obvious fit to the Linux WiFi stack...
> >
> > -Toke
> >
> 
> I came to the realization about that a few hours after sending this
> email. I found this link useful to identity which drivers support XDP:
> https://elixir.bootlin.com/linux/latest/A/ident/bpf_prog_run_xdp
> 
> I had my eyes on the latest gen "slim" Linux notebooks (Lenovo XC1,
> Dell XPS), but these don't have built-in Ethernet anymore. So I'm back
> to the drawing board. Thanks for the tip on ixgbe and Broadcom.

Note that e1000e remains quite popular among notebooks (my last HP one
and the two following thinkpads including the T480s I'm typing on have
this), and there is common ancestry between e1000e and igb. When I
implemented the NDIV framework (which basically does pretty similar
things as XDP does in the drivers), I managed to implement e1000,
e1000e, igb and ixgbe without too many difficulties. Maybe it could
be a good opportunity for you to try to port XDP to e1000e using such
a machine, by looking at the work from igb ?

Willy
