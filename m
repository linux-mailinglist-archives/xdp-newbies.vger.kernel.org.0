Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2681559F3D
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 Jun 2022 19:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbiFXRVD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 24 Jun 2022 13:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiFXRUr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 24 Jun 2022 13:20:47 -0400
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0489568C70
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Jun 2022 10:20:36 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 25OHKb4b011890;
        Fri, 24 Jun 2022 19:20:37 +0200
Date:   Fri, 24 Jun 2022 19:20:37 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Full 40Gbps with i40e for large packets?
Message-ID: <20220624172037.GA11878@1wt.eu>
References: <CANzUK5-ooeCADg0+N47TN29J5Pcknb8CF+3mrC7_jWDp-J-zNw@mail.gmail.com>
 <20220624134755.GB11243@1wt.eu>
 <CANzUK59xb1mOTCCzpXN5M50JN1zzviVgJeJ+f0psccGvSHR0Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANzUK59xb1mOTCCzpXN5M50JN1zzviVgJeJ+f0psccGvSHR0Yw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jun 24, 2022 at 09:23:51PM +0530, Srivats P wrote:
> Yes, I'm using 40G copper. 1518 byte is including FCS and no VLANs, so
> the pps expected to fully fill the pipe as you calculate rightly is
> 3250975 or 3.25 Mpps.

OK.

> The rate I get varies continuously between 3.19 and 3.22 Mpps and very
> rarely goes up to 3.24 Mpps. The few times I've seen 3.24 Mpps is at
> the immediate start of a run, but not afterwards - a behaviour I'm not
> able to explain.
> 
> I'm trying to understand why I get a lower rate than 3.250975 Mpps and
> what I need to do to get the full pps rate.

In other contexts I've faced causes such as too large tx_irq delay,
causing the tx ring to be empty when the code was able to deliver
more, and too small PCIe payload sizes (I remember having had to
change it to 4096 in a machine's BIOS years ago for a 100G test).

Beyond this I have no idea :-)

Willy
