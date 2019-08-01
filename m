Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDC27E211
	for <lists+xdp-newbies@lfdr.de>; Thu,  1 Aug 2019 20:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfHASQ7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 1 Aug 2019 14:16:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60176 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726818AbfHASQ7 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 1 Aug 2019 14:16:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 462BDC0BAA3F;
        Thu,  1 Aug 2019 18:16:59 +0000 (UTC)
Received: from carbon (ovpn-200-29.brq.redhat.com [10.40.200.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6810A60922;
        Thu,  1 Aug 2019 18:16:56 +0000 (UTC)
Date:   Thu, 1 Aug 2019 20:16:16 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Brandon Cazander <brandon.cazander@multapplied.net>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        David Miller <davem@davemloft.net>, brouer@redhat.com
Subject: Re: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation
 dropping packets
Message-ID: <20190801201612.3aef7783@carbon>
In-Reply-To: <20190801173324.GA660183@multapplied.net>
References: <20190731211211.GA87084@multapplied.net>
        <20190801101746.702431fc@carbon>
        <20190801173324.GA660183@multapplied.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 01 Aug 2019 18:16:59 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 1 Aug 2019 17:33:36 +0000
Brandon Cazander <brandon.cazander@multapplied.net> wrote:

> Thank you very much for your prompt and detailed review of my report!
> Some of these answers may be moot now that you have found the specific
> commit that caused the issue.

True.
 
> On Thu, Aug 01, 2019 at 10:18:49AM +0200, Jesper Dangaard Brouer wrote:
> 
> > Are you sure you are using "xdpgeneric" mode?
> > As virtio_net do have "native" XDP mode.  
> 
> The program is loaded with XDP_FLAGS_SKB_MODE in this case. I'm having a
> separate issue with "native" XDP on virtio_net that I'm working on but
> it is more likely an issue with my code.
> 
> > Encapsulated packet starts at a funny offset, making it harder to follow.  
> 
> Sorry about that. I should have made it easier.

No problem.

> > Looking at the code, I think the packet will be dropped earlier than
> > the pskb_trim_rcsum() call, in the check if (skb->len < len).  
> 
> I had the same suspicion but a probe in the corresponding drop showed no
> results, and furthermore, the InTruncatedPkts SNMP counter was not
> increasing.

Strange.

> > You only support IPv4 encapsulated packets?
> > 
> > Do you handle ARP requests separately?  
> 
> Sorry, I wanted a minimal example so this is stripped down.

I figured, that you already handled that.
 
> > Can you test an earlier kernel, specifically before: commit
> > 458bf2f224f0 ("net: core: support XDP generic on stacked devices.")
> > (Author: Stephen Hemminger)
> > 
> > $ git describe --contains  458bf2f224f04
> > v5.2-rc3~26^2~11^2
> > 
> > I fear that this commit, which moved generic-XDP to a later call point,
> > might cause this.  Because it could be that the SKB network_header
> > update, is now done before calling XDP program (... still looking at
> > code details).  
> 
> You have already confirmed this but I can also confirm that a kernel
> before commit 458bf2f224f0 works with no changes to my program.

Thanks for also confirming. I've just send a patchset with fixes:
 https://patchwork.ozlabs.org/project/netdev/list/?series=122796&state=%2a

I can recommend that you look at the selftest script test_xdp_vlan.sh:
 https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf/test_xdp_vlan.sh

Which uses veth and network namespaces for testing.  If you get the
hint, then you can actually create these small scripts, that can
function as unit and regression tests for XDP code snippets.

Our XDP-tutorial also uses veth as a development environment:
 https://github.com/xdp-project/xdp-tutorial/tree/master/testenv
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
