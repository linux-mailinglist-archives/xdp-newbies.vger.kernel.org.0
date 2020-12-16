Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300CE2DC32E
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Dec 2020 16:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgLPPfg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Dec 2020 10:35:36 -0500
Received: from mail-108-mta155.mxroute.com ([136.175.108.155]:38211 "EHLO
        mail-108-mta155.mxroute.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725957AbgLPPfg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Dec 2020 10:35:36 -0500
X-Greylist: delayed 342 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Dec 2020 10:35:36 EST
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta155.mxroute.com (ZoneMTA) with ESMTPSA id 1766c2b5b150007603.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Wed, 16 Dec 2020 15:29:09 +0000
X-Zone-Loop: 2ca12dd96b525ee07c7816550143b42d7cd7d4a3fbb5
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id BFFD862B30
        for <xdp-newbies@vger.kernel.org>; Wed, 16 Dec 2020 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=UglOUee7txbV+lbzzzer7C8AVBMJzAd0vgDQZQfWBws=; b=HG/P96TMe49xNJe57kmd18yQjt
        6HVYjcaZt/jKfq8Ii5R4aMssvJjcWkR7tdf4DRjH0tjHSlJO1+oT5u6pB/egqN+Hp7YjWoIgPsYjz
        rvBVfMxNpIgAwhMEItAKy2qVPzwlYX5NyhBVs2pHV4aIJL08dzqnH4UC2iEPnUjc/0qpgiwdYFLj/
        UhQ7JjuK1C/Rm6sc7npiBXvJC+3skfXf/iVqVH9Qp/Wnvuzs9fphE+Anbufud+MBCfYPByoLUdMQb
        dK2+WOxrBpu195aKf4BiJinU7q+GA7Im00xR9FB0kmC/RM97WVupCEGpS5olACvAQh23cat+dBdgr
        Kglyg8gA==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: XDP BPF Stack Limit Issues
Message-ID: <ad6ea0ec-c5ce-2887-6f4c-7ed762a0f130@gflclan.com>
Date:   Wed, 16 Dec 2020 09:29:05 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,

I've been trying to implement IPv6 support into an XDP Firewall which 
can be found below.

https://github.com/gamemann/XDP-Firewall

Unfortunately, I've been fighting with the BPF verifier and I'm 
exceeding the BPF stack size of 512 bytes. I linked the above in the 
case others want to see the headers that define things like 
`MAX_FILTERS` inside the XDP program. The error I am receiving is:

```
error: <unknown>:0:0: in function xdp_prog_main i32 (%struct.xdp_md*): 
Looks like the BPF stack limit of 512 bytes is exceeded. Please move 
large on stack variables into BPF per-cpu array map.
```

Which spams anywhere from 3 - 10 times depending on what I try to 
resolve the issue.

I ended up re-writing the entire program trying to use as little 
variables as possible and I got very close to getting the program to 
compile until I added support for the ICMPv6 protocol (once I remove 
this, it compiles and runs without any issues). I'm at a loss on what I 
can do now, though.

The current XDP program code is the following.

https://gist.github.com/gamemann/a0acd9603405c3d7b3c792b5429ced38

 From what the error states, I could try storing variables into a 
per-CPU BPF map. Therefore, I tried storing the ICMP (and at one point 
TCP) information into a BPF map and used the data later on which can be 
found below.

https://gist.github.com/gamemann/663674924e16286b02a835637912c2a5

This still exceeded the BPF stack size. With that said, I'd assume 
performance would be heavily impacted if we stored everything inside a 
BPF map. To my understanding, per-CPU maps cannot be reliably read 
within the XDP program. Therefore, if this would have worked, I'd 
probably want to use a regular non per-CPU map anyways which would 
impact performance.

I also tried BPF calls without luck and was thinking about trying BPF 
tail calls. Though, I don't think this would help. BPF tail calls use 
the same BPF stack to my understanding.

I could try adding even more variables inside the program to a BPF map 
such as the PPS and BPS variables. However, I wanted to see if there 
were any other suggestions from the mailing list on this. I plan to 
write another firewall that'll have a lot more functionality than this 
firewall in XDP and I'm worried I'd run into similar issues there.

Any help would be highly appreciated and thank you for your time!

