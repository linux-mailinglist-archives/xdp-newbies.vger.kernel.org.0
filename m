Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE7041277C
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Sep 2021 22:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbhITUtw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Sep 2021 16:49:52 -0400
Received: from mail-108-mta72.mxroute.com ([136.175.108.72]:45417 "EHLO
        mail-108-mta72.mxroute.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229503AbhITUrv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Sep 2021 16:47:51 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Sep 2021 16:47:51 EDT
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta72.mxroute.com (ZoneMTA) with ESMTPSA id 17c04f11304000ac7a.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 20 Sep 2021 20:41:20 +0000
X-Zone-Loop: 9384d041db660ae7f0bbc350bd8792fac2af771515a6
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UBK7NbyeAPaq3r3gzwMWSEC5fLFmZVlAs/l4h9QiS+U=; b=YOOispKai2csVV/iI8bj7Ie2ak
        Bimvm6ktr8pJIxINBUoEKQxy55fRfiD6lYud8nTk3cebuH3nX6LXMhBYTlltfsnCf3QN84o1nMTm3
        pjyThhEIc5jD+R/jfT1B79ae8iWLb6DphFeyDH1GpWpj4Gi/ncpWwUTd2eHN3XX/RD12y+xOjCVP9
        d8cC+S1LqaB8DP16nFVo624RQGAzf4Bct5W0LPLbXUsp+7Bgt6YEoGd0jN3SPyOJZj6zaijXaCmiF
        Cs/pFitxLSDCyQc9IAJeouwiyJKPk+I22j5V7PxY+obD1NJ3mVbUgqXhox2bjW/5WZ+i4RlZ8/ueB
        hPanL/mQ==;
Subject: Re: Parsing TCP Header Options In XDP/BPF
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
 <87h7ek6cb1.fsf@toke.dk>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <dc08f117-50e7-bbe3-44e7-f6adb95eb011@gflclan.com>
Date:   Mon, 20 Sep 2021 15:41:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87h7ek6cb1.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey and I apologize for the late reply!


On 9/15/2021 11:19 PM, Rob Sherwood wrote:
 > Definitely not an expert but no one has replied so I'll throw out my 
guess :-)
 >
 > Check out https://lwn.net/Articles/794934/ for more info on 'bounded 
loops', but my guess is that the verifier doesn't have enough context to 
verify your loop is really bounded.
 >
 > One trick might be to convert your while loop to a for(;;) loop, 
e.g., instead of :
 >
 > 
https://github.com/gamemann/XDP-TCP-Header-Options/blob/master/src/xdp_prog.c#L81
 > while ( optdata < 40) {... }
 >
 > you could try:
 >
 > for (optdata = 0; optdata < 40; optdata ++) { ... }
 >
 > I know from past attempts that just because it's obvious to humans 
that there's not an infinite loop, it's not always obvious to the verifier.
 >
 > Hope that helps (and is correct!),
 >
 > - Rob
 > .

I did try a for loop before, but still ran into the same BPF verifier 
error :( I tried adding checks to prevent an infinite loop along with 
checks to make sure it doesn't go outside of ctx->data_end or below 
ctx->data, but no change. Thank you!

On 9/16/2021 5:32 AM, Toke Høiland-Jørgensen wrote:
 > Christian Deacon <gamemann@gflclan.com> writes:
 >
 >> Hi everyone,
 >>
 >>
 >> I wasn't sure whether to submit this under XDP's mailing list or BPF's.
 >> However, since it's an XDP program, I figured I'd start here. The issue
 >> has to do with the BPF verifier, though.
 >>
 >>
 >> I am trying to parse TCP header options within XDP/BPF. In my case, I
 >> want to locate the 'timestamps' option and read/write to the sender and
 >> receive timestamps (the option's data, which is eight bytes in total I
 >> believe).
 >
 > We're doing just this in the 'pping' utility, see code here:
 > 
https://github.com/xdp-project/bpf-examples/blob/master/pping/pping_kern.c#L83
 >
 > -Toke

This code works great for me so far! Thank you!
