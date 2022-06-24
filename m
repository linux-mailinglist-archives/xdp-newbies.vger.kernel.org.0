Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0DB559AA2
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 Jun 2022 15:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiFXNr6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 24 Jun 2022 09:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiFXNr4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 24 Jun 2022 09:47:56 -0400
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37FE7B6E
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Jun 2022 06:47:55 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 25ODltsd011680;
        Fri, 24 Jun 2022 15:47:55 +0200
Date:   Fri, 24 Jun 2022 15:47:55 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Full 40Gbps with i40e for large packets?
Message-ID: <20220624134755.GB11243@1wt.eu>
References: <CANzUK5-ooeCADg0+N47TN29J5Pcknb8CF+3mrC7_jWDp-J-zNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANzUK5-ooeCADg0+N47TN29J5Pcknb8CF+3mrC7_jWDp-J-zNw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

On Fri, Jun 24, 2022 at 06:51:33PM +0530, Srivats P wrote:
> Hi,
> 
> Using the xdpsock txonly benchmark in zero-copy mode with the i40e
> driver, I get ~22 Mpps for 64 Byte packets.
> 
> However, for 1518 byte packets, although the theoretical pps rate for
> 40Gbps is ~3.25 Mpps (which is much lower than 22 Mpps), I am not able
> to get the full rate - only around 39G or 39.5Gbps (i.e. < 3.25Mpps).
> My assumption is AF_XDP performance is more pps dependent than packet
> size related and so I thought full 40G should be achievable.
> 
> Settings:
>  * tuned set to "throughput performance"
>  * hardware tx ring size set to 512 descriptors - increasing it to up
> to the max of 4096 doesn't have any noticeable changes
> 
> Increasing the packet size to 3000 or 4096 does bump up the Gbps rate
> to around 39.9Gbps.
> 
> Is there a way to get the full 40Gbps (or close, say 39.9Gbps) tx rate
> with 1518 byte packets?

While I don't know for the XDP part itself, you should really not speak
in terms of bps but in terms of pps exclusively. The reason is that it
is very difficult otherwise to know what layer you're measuring.

In addition, 40 Gbps is 4*10GbE which itself is exactly 10G on copper but
can be a bit more (10.3125G) on fiber depending on the type (and maybe a
bit less on single-mode as well though I don't remember having seen that
in a while), so taking that into account can make it even harder to observe
an exactly round value.

So assuming that you're running on copper with 40.000 Gbps, this is the
on-wire bit rate, that includes the 8-byte preamble, the visible eth frame,
the FCS (4 bytes) and the IFG (12 bytes), hence 1538 bytes for the regular
1514 bytes. This gives a maximum frame rate of 3250975 pps for such frames,
which is what you'd get if by 1518 you included the FCS, or 3242542 pps if
by 1518 you included a VLAN header (hence 1542 bytes on the wire).

If we take that last example that sounds like the most plausible, that
gives you a layer2 max bit rate of 3242542*1518*8 = 39.377 Gbps. As such,
depending on how and where you measure, it's very possible that you've
totally filled the wire.

Thus as a conclusion: forget about bit rate and only count packet rates.

Hoping this helps,
Willy
