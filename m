Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E800719A8F7
	for <lists+xdp-newbies@lfdr.de>; Wed,  1 Apr 2020 11:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgDAJz2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 1 Apr 2020 05:55:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41762 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726335AbgDAJz2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 1 Apr 2020 05:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585734927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S7Tby5PR8Rm/AIhDVANysCpjyfAiOSPWrxJh34q0NME=;
        b=S2uFAdj/+4tppHf3YFS7MYHyuG6PCJwNDY8vYP1iuB1gOL2fkB3ji0mlimA7HWR78d9/YH
        JJ7qq4QDwDxrts0PUw2WGw2oaW/B4uaiRv0n68pUZCsu83gyjPqrhpxeNHlePlYb/blPex
        YYSB1tsU1vQbe0ylOYfVSqkIejows+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-djEwBn7EPsCAYfOhtMSOSA-1; Wed, 01 Apr 2020 05:55:24 -0400
X-MC-Unique: djEwBn7EPsCAYfOhtMSOSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60E7213FE;
        Wed,  1 Apr 2020 09:55:23 +0000 (UTC)
Received: from carbon (unknown [10.40.208.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B754618A85;
        Wed,  1 Apr 2020 09:55:14 +0000 (UTC)
Date:   Wed, 1 Apr 2020 11:55:12 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     brouer@redhat.com,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: Using AF_XDP To Modify Outgoing Packets
Message-ID: <20200401115512.4b28f975@carbon>
In-Reply-To: <8013b38c-696c-cadd-a4cd-756eca658215@gflclan.com>
References: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
        <20200330111048.1167e6f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <dd0d11d8-29ff-18c5-85b2-d566d2bba2ea@gflclan.com>
        <87sghoj2jf.fsf@toke.dk>
        <8013b38c-696c-cadd-a4cd-756eca658215@gflclan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 31 Mar 2020 18:22:53 -0500
Christian Deacon <gamemann@gflclan.com> wrote:

> After looking into the TC Hook, it looks like this will work for my 
> case. I'll try to get a program made in the next few days or so.

If you want code examples of TC egress hook with BPF look at[1]:
 [1] https://github.com/xdp-project/xdp-cpumap-tc/

Notice that map pinning with libbpf have gotten easier (thanks to
Toke). This example does work (runs in production), it shares and reuse
maps between XDP and TC-bpf.  The example uses the old way to define
maps, and I recommend switching to the new BTF-based syntax instead
(requires LLVM 10), which defines ".maps" SEC, see example[2], and
notice "pinning" option, which obsoletes a lot of the map code in[1].

Attaching TC-bpf progs are different that XDP.  I've hidden the detail
in C-code function tc_egress_attach_bpf() (see[3]), which actually just
calls the "tc" command.  I was hoping that this would be replaced with a
libbpf call, like we have for XDP, but that have not happened.


[2] https://github.com/xdp-project/xdp-tools/blob/master/xdp-filter/xdpfilt_prog.h#L124-L131
[3] https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/common_user.c#L386
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

google keywords: tc qdisc clsact cls_bpf egress filter

