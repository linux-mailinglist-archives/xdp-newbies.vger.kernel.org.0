Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9320084C31
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 Aug 2019 15:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387945AbfHGNAQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 7 Aug 2019 09:00:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51317 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387799AbfHGNAQ (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 7 Aug 2019 09:00:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5D00F3001473;
        Wed,  7 Aug 2019 13:00:16 +0000 (UTC)
Received: from carbon (ovpn-200-43.brq.redhat.com [10.40.200.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0A81D5C258;
        Wed,  7 Aug 2019 13:00:11 +0000 (UTC)
Date:   Wed, 7 Aug 2019 15:00:10 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     xdp-newbies@vger.kernel.org
Cc:     Anton Protopopov <a.s.protopopov@gmail.com>, dsahern@gmail.com,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Subject: Re: [bpf-next PATCH 0/3] bpf: improvements to xdp_fwd sample
Message-ID: <20190807150010.1a58a1d2@carbon>
In-Reply-To: <156518133219.5636.728822418668658886.stgit@firesoul>
References: <156518133219.5636.728822418668658886.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 07 Aug 2019 13:00:16 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi XDP-newbies,

I cross-posted this patchset to remind XDP-users that the kernel
since[2] v4.18 have a BPF helper (bpf_fib_lookup) to do forwarding
lookups in kernel FIB route table directly from XDP.

The XDP-tutorial now have an assignment[3] 'packet03-redirecting' that
also uses this FIB helper (special thanks to Anton Protopopov for
adding this).

Toke's devmap lookup improvement is first avail in kernel v5.3.
Thus, not part of XDP-tutorial yet.


[2] 87f5fc7e48dd ("bpf: Provide helper to do forwarding lookups in kernel FIB table")
 https://git.kernel.org/torvalds/c/87f5fc7e48dd

[3] https://github.com/xdp-project/xdp-tutorial/blob/master/packet03-redirecting/


On Wed, 07 Aug 2019 14:36:12 +0200
Jesper Dangaard Brouer <brouer@redhat.com> wrote:

> This patchset is focused on improvements for XDP forwarding sample
> named xdp_fwd, which leverage the existing FIB routing tables as
> described in LPC2018[1] talk by David Ahern.
> 
> The primary motivation is to illustrate how Toke's recent work
> improves usability of XDP_REDIRECT via lookups in devmap. The other
> patches are to help users understand the sample.
> 
> I have more improvements to xdp_fwd, but those might requires changes
> to libbpf.  Thus, sending these patches first as they are isolated.
> 
> [1] http://vger.kernel.org/lpc-networking2018.html#session-1


-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
