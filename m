Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FE01CB14B
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 May 2020 16:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgEHODH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 8 May 2020 10:03:07 -0400
Received: from qrelay29.mxroute.com ([172.82.139.29]:43581 "EHLO
        qrelay29.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgEHODH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 8 May 2020 10:03:07 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 May 2020 10:03:07 EDT
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by qrelay29.mxroute.com (ZoneMTA) with ESMTPA id 171f4942fd2000add6.001
 for <xdp-newbies@vger.kernel.org>;
 Fri, 08 May 2020 13:58:04 +0000
X-Zone-Loop: 9af3a27a1ff4fa2bee0a4a610d68a5ffd8e611abefa8
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id 1442961074
        for <xdp-newbies@vger.kernel.org>; Fri,  8 May 2020 13:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Q6ZOT92GgVGInpvqJa6g63xex49xhnoup/JP8cegJq8=; b=GsbHjQ35NfuHY3BZeWpuqf/cIu
        2m3NgouriSDocr+pE7K84JfxXaHTNYnnC8BzJOe2aIkKwgAIfKVarOIgQrbRLj86J2A2+5yTxsbM0
        0PcScZAqkBWwW4vsrADg3XsPD/Gb5tvsiurwvaVkV1/F3gFs0FqGLJnYYXWJgGePS+bXgNyOXnfQZ
        d+hYNDJF/e41ix6e3rAOViAsqo64TlUdP2aFiLrvx5tv66A2v1FYF08gxwFJpianUCehi/03ChgTo
        hHtbk/EEe+O4xSLzlygfSVo7ix4FXupOiLZj9wNvDnKh/tV77azEEkhxGIORdoAXn1U6mM1GLRNS5
        x24DsE+g==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: XDP Software Issue - Payload Matching
Message-ID: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com>
Date:   Fri, 8 May 2020 08:57:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,

I apologize if this isn't the correct place to discuss an issue with XDP 
software I'm attempting to create. I'm not sure where else I can request 
help on this since it may be related to BPF/XDP itself.

I've made an XDP Firewall project on GitHub here:

https://github.com/gamemann/XDP-Firewall

I am still fairly new to C and XDP. Therefore, I'm sure many 
improvements could be made to the software. However, everything besides 
the payload matching is working correctly from what I've tested.

Basically, this program transfers filtering rules from a config file in 
the user space to the XDP program via BPF maps. The XDP program then 
performs checks against each filter specified. I'm trying to implement 
payload matching into this project and I got the user-space side working 
properly. However, when I attempt to check the payload within the XDP 
program, I keep receiving errors either when compiling (stating the BPF 
stack has been exhausted) or the following error when attaching the XDP 
program:

```
The sequence of 8193 jumps is too complex.
processed 100132 insns (limit 1000000) max_states_per_insn 4 
total_states 1279 peak_states 1279 mark_read 97
```

There is a very long BPF stack trace that I can attach if need to be. 
The following is the part of code causing this issue (it's not commented 
out on my development VM):

https://github.com/gamemann/XDP-Firewall/blob/master/src/xdpfw_kern.c#L306

If I comment out line 332 or set `found` to 1, the XDP program does not 
crash. I've tried a `goto` approach as well which is available here:

https://gist.github.com/gamemann/9f0d42c25151d0f2e1630840d04fd599

However, this causes the following error when starting the XDP program:

```
invalid read from stack off -488+0 size 8
processed 844 insns (limit 1000000) max_states_per_insn 4 total_states 
28 peak_states 28 mark_read
```

If I comment out line 27 from that Gist (`continue;`), the program runs 
properly. I've also tried moving the code into its own for loop by 
making some modifications. However, I get the same results. I'd assume 
this is some sort of BPF limitation with for loops and jumps. However, 
I'm sure there's a strong possibility I'm just not doing something right 
when attempting to match the payload.

Does anyone know what I'm trying to do is possible within BPF/XDP?

The VM I'm using to develop this project and having the above issues is 
running Ubuntu 18.04 on kernel `5.6.1-050601-generic`.

If you need additional information, please let me know.

Any help is highly appreciated and thank you for your time!

