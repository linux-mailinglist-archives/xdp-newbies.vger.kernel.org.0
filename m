Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3616F1416F5
	for <lists+xdp-newbies@lfdr.de>; Sat, 18 Jan 2020 11:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgARKOS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 18 Jan 2020 05:14:18 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48229 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726831AbgARKOS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 18 Jan 2020 05:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579342457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ISJe8yA8hRKIWZ4vSBPiT7yiU6F1Sr/8FZxEPuQF3II=;
        b=XDIrtIHnvE/sLsBYgt2a0v3BCSWaOYJ2DcgqctVB6A+HwUABnokqFbrOnewVOkpbmbUlTt
        50BvX4fMjYQU5JSrs17SklY50szO0e2T9xM90gKMAkGd6nR3Mxrunt75+JxsaA+66UDzcj
        BpqDsZ8eUl3NqEPeS0IKKg01whDj2Hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-pWtIX4wxNE2XzB1kX73wgw-1; Sat, 18 Jan 2020 05:14:12 -0500
X-MC-Unique: pWtIX4wxNE2XzB1kX73wgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED27C8017CC;
        Sat, 18 Jan 2020 10:14:10 +0000 (UTC)
Received: from carbon (ovpn-200-25.brq.redhat.com [10.40.200.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5EC3E19C4F;
        Sat, 18 Jan 2020 10:14:07 +0000 (UTC)
Date:   Sat, 18 Jan 2020 11:14:05 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        brouer@redhat.com
Subject: Re: zero-copy between interfaces
Message-ID: <20200118111405.28fd1c75@carbon>
In-Reply-To: <20200117175409.GC69024@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
        <20200113124134.3974cbed@carbon>
        <20200113152759.GD68570@smtp.ads.isi.edu>
        <20200113180411.24d8bd40@carbon>
        <20200117175409.GC69024@smtp.ads.isi.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 17 Jan 2020 12:54:09 -0500
Ryan Goodfellow <rgoodfel@isi.edu> wrote:

> On Mon, Jan 13, 2020 at 06:04:11PM +0100, Jesper Dangaard Brouer wrote:
> > On Mon, 13 Jan 2020 10:28:00 -0500
> > Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> >   
> > > On Mon, Jan 13, 2020 at 12:41:34PM +0100, Jesper Dangaard Brouer wrote:  
> > > > On Mon, 13 Jan 2020 00:18:36 +0000
> > > > Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> > > >     
> > > > > The numbers that I have been able to achive with this code are the following. MTU
> > > > > is 1500 in all cases.
> > > > > 
> > > > >     mlx5: pps ~ 2.4 Mpps, 29 Gbps (driver mode, zero-copy)
> > > > >     i40e: pps ~ 700 Kpps, 8 Gbps (skb mode, copy)
> > > > >     virtio: pps ~ 200 Kpps, 2.4 Gbps (skb mode, copy, all qemu/kvm VMs)
> > > > > 
> > > > > Are these numbers in the ballpark of what's expected?    
> > > > 
> > > > I would say they are too slow / low.
> > > > 
> > > > Have you remembered to do bulking?
> > > >     
> > > 
> > > I am using a batch size of 256.  
> > 
> > Hmm...
> > 
> > Maybe you can test with xdp_redirect_map program in samples/bpf/ and
> > compare the performance on this hardware?  
> 
> Hi Jesper,
> 
> I tried to use this program, however it does not seem to work for bidirectional
> traffic across the two interfaces?

It does work bidirectional if you start more of these xdp_redirect_map
programs.  Do notice this is an example program.  Look at xdp_fwd_*.c
if you want a program that is functional and uses the existing IP route
table for XDP acceleration.

My point is that there are alternatives for doing zero-copy between
interfaces... A xdp_redirect_map inside the kernel out another
interface is already zero-copy.

I'm wondering why did you choose/need AF_XDP technology for doing forwarding?

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

