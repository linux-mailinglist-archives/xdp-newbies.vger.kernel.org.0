Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FF828F318
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Oct 2020 15:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgJONXD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 15 Oct 2020 09:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33156 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726959AbgJONXD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 15 Oct 2020 09:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602768181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iswrZowXMusOu1+EfJ3u3QdkqyByzS9QfeiJB881WJs=;
        b=K3pk8LlcTyiXlgUevaPKgKVP9HqGAJEofbP6KZVH7UOXE6tUwQKdu0EqKiGX1fdhDI3DI+
        gdyHa4K5mAGwkX/mpKWCV8wTWsIBPrnW2nU/a2+wlV3itNAn4LQy7J4xoh11CpMdsTxh3t
        Ed5sDhS68pH7eWmBEtujpehfuK/PdUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-_U5G4KS0OcqofQoA4cgYZg-1; Thu, 15 Oct 2020 09:22:59 -0400
X-MC-Unique: _U5G4KS0OcqofQoA4cgYZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468F91018727;
        Thu, 15 Oct 2020 13:22:58 +0000 (UTC)
Received: from carbon (unknown [10.40.208.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BCC8919C66;
        Thu, 15 Oct 2020 13:22:53 +0000 (UTC)
Date:   Thu, 15 Oct 2020 15:22:52 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Federico Parola <fede.parola@hotmail.it>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Multi-core scalability problems
Message-ID: <20201015152252.4360cf9a@carbon>
In-Reply-To: <VI1PR04MB3104487E7F503BEEE13AE7999E020@VI1PR04MB3104.eurprd04.prod.outlook.com>
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <87r1q29ita.fsf@toke.dk>
        <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201014111529.6e464b4b@carbon>
        <VI1PR04MB3104C2AE44381640763C1F3D9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201014162636.39c2ba14@carbon>
        <VI1PR04MB3104487E7F503BEEE13AE7999E020@VI1PR04MB3104.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 15 Oct 2020 14:04:51 +0200
Federico Parola <fede.parola@hotmail.it> wrote:

> On 14/10/20 16:26, Jesper Dangaard Brouer wrote:
> > On Wed, 14 Oct 2020 14:17:46 +0200
> > Federico Parola <fede.parola@hotmail.it> wrote:
> >   
> >> On 14/10/20 11:15, Jesper Dangaard Brouer wrote:  
> >>> On Wed, 14 Oct 2020 08:56:43 +0200
> >>> Federico Parola <fede.parola@hotmail.it> wrote:
> >>>
> >>> [...]  
> >>>>> Can you try to use this[2] tool:
> >>>>>     ethtool_stats.pl --dev enp101s0f0
> >>>>>
> >>>>> And notice if there are any strange counters.
> >>>>>
> >>>>>
> >>>>> [2]https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl
[...]

> >> The only solution I've found so far is to reduce the size of the rx ring
> >> as I mentioned in my former post. However I still see a decrease in
> >> performance when exceeding 4 cores.  
> > 
> > What is happening when you are reducing the size of the rx ring is two
> > things. (1) i40e driver have reuse/recycle-pages trick that get less
> > efficient, but because you are dropping packets early you are not
> > affected. (2) the total size of L3 memory you need to touch is also
> > decreased.
> > 
> > I think you are hitting case (2).  The Intel CPU have a cool feature
> > called DDIO (Data-Direct IO) or DCA (Direct Cache Access), which can
> > deliver packet data into L3 cache memory (if NIC is directly PCIe
> > connected to CPU).  The CPU is in charge when this feature is enabled,
> > and it will try to avoid L3 trashing and disable it in certain cases.
> > When you reduce the size of the rx rings, then you are also needing
> > less L3 cache memory, to the CPU will allow this DDIO feature.
> > 
> > You can use the 'perf stat' tool to check if this is happening, by
> > monitoring L3 (and L2) cache usage.  
> 
> What events should I monitor? LLC-load-misses/LLC-loads?

Looking at my own results from xdp-paper[1], it looks like that it
results in real 'cache-misses' (perf stat -e cache-misses).

E.g I ran:
 sudo ~/perf stat -C3 -e cycles -e  instructions -e cache-references -e cache-misses -r 3 sleep 1

Notice how the 'insn per cycle' gets less efficient when we experience
these cache-misses.

Also how RX-size of queues affect XDP-redirect in [2].


[1] https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench01_baseline.org
[2] https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench05_xdp_redirect.org
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

