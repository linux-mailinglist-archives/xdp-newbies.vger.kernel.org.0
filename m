Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B914555A126
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 Jun 2022 20:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiFXSgF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 24 Jun 2022 14:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbiFXSgC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 24 Jun 2022 14:36:02 -0400
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9E9E7FD26
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Jun 2022 11:35:56 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 25OIZvEi011956;
        Fri, 24 Jun 2022 20:35:57 +0200
Date:   Fri, 24 Jun 2022 20:35:57 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Alexander Petrovsky <askjuise@gmail.com>
Cc:     Srivats P <pstavirs@gmail.com>, Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Full 40Gbps with i40e for large packets?
Message-ID: <20220624183557.GA11919@1wt.eu>
References: <CANzUK5-ooeCADg0+N47TN29J5Pcknb8CF+3mrC7_jWDp-J-zNw@mail.gmail.com>
 <20220624134755.GB11243@1wt.eu>
 <CAH57y_QcP9a1j0BpZcf7y+ENFXEnjh9TBYNFUNM40nNVPg8how@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH57y_QcP9a1j0BpZcf7y+ENFXEnjh9TBYNFUNM40nNVPg8how@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jun 24, 2022 at 09:56:22PM +0400, Alexander Petrovsky wrote:
> ??, 24 ???? 2022 ?. ? 17:57, Willy Tarreau <w@1wt.eu>:
> 
> > Hi,
> >
> > On Fri, Jun 24, 2022 at 06:51:33PM +0530, Srivats P wrote:
> > > Hi,
> > >
> > > Using the xdpsock txonly benchmark in zero-copy mode with the i40e
> > > driver, I get ~22 Mpps for 64 Byte packets.
> > >
> > > However, for 1518 byte packets, although the theoretical pps rate for
> > > 40Gbps is ~3.25 Mpps (which is much lower than 22 Mpps), I am not able
> > > to get the full rate - only around 39G or 39.5Gbps (i.e. < 3.25Mpps).
> > > My assumption is AF_XDP performance is more pps dependent than packet
> > > size related and so I thought full 40G should be achievable.
> > >
> > > Settings:
> > >  * tuned set to "throughput performance"
> > >  * hardware tx ring size set to 512 descriptors - increasing it to up
> > > to the max of 4096 doesn't have any noticeable changes
> > >
> > > Increasing the packet size to 3000 or 4096 does bump up the Gbps rate
> > > to around 39.9Gbps.
> > >
> > > Is there a way to get the full 40Gbps (or close, say 39.9Gbps) tx rate
> > > with 1518 byte packets?
> >
> > While I don't know for the XDP part itself, you should really not speak
> > in terms of bps but in terms of pps exclusively. The reason is that it
> > is very difficult otherwise to know what layer you're measuring.
> >
> > In addition, 40 Gbps is 4*10GbE which itself is exactly 10G on copper but
> > can be a bit more (10.3125G) on fiber depending on the type (and maybe a
> > bit less on single-mode as well though I don't remember having seen that
> > in a while), so taking that into account can make it even harder to observe
> > an exactly round value.
> >
> > So assuming that you're running on copper with 40.000 Gbps, this is the
> > on-wire bit rate, that includes the 8-byte preamble, the visible eth frame,
> > the FCS (4 bytes) and the IFG (12 bytes), hence 1538 bytes for the regular
> > 1514 bytes. This gives a maximum frame rate of 3250975 pps for such frames,
> > which is what you'd get if by 1518 you included the FCS, or 3242542 pps if
> > by 1518 you included a VLAN header (hence 1542 bytes on the wire).
> >
> > If we take that last example that sounds like the most plausible, that
> > gives you a layer2 max bit rate of 3242542*1518*8 = 39.377 Gbps. As such,
> > depending on how and where you measure, it's very possible that you've
> > totally filled the wire.
> >
> 
> Can't catch your math here. 40Gbps it's a 5GB. In this case, 5368709120 /
> 1518 = 3536699 frames, but it's not match with your 3250975. Could you
> point please where I'm mistaken?

The on-wire frames are not 1518 but 1538 because there's a 8-byte preamble
and a 12-byte inter-frame-gap. In addition, network bandwidths do not use
powers-of-two but powers-of-ten. Thus 40 Gbps is 40.10^9 bits per second
hence 5.10^9 bytes per second. 5000000000 / 1538 = 3250975.29...

Usually you don't see the FCS so you're seeing ethernet frames of 1514
(or 1518 when VLANs are used or 1522 when q-in-q is used). Thus you just
have to add 24 bytes to whatever ethernet packet size you're considering.
Just keep in mind that the smallest frame from dest addr to FCS is 64B,
hence 84B including preamble and IFG. This explains why the max frame
rate on 10Gbps is 14.88 Mpps.

This same principle explains why when transfering a file using HTTP or FTP
over a GbE link from a server to your laptop, you're seeing a perfectly
stable rate of 117.68 or 118.66 MB/s. Your TCP frames carry 1448 data
bytes (when timestamps are enabled) or 1460 (when disabled), for 1538
on-wire bytes, hence an efficiency ratio of 1448/1538. These values are
easy to remember and convenient to immediately spot that something's
wrong when you don't reach them.

Regards,
Willy
