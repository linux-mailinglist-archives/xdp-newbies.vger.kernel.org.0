Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F19E719BD91
	for <lists+xdp-newbies@lfdr.de>; Thu,  2 Apr 2020 10:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387565AbgDBI1D (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 2 Apr 2020 04:27:03 -0400
Received: from relay0184.mxlogin.com ([199.181.239.184]:44149 "EHLO
        relay0184.mxlogin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbgDBI1D (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 2 Apr 2020 04:27:03 -0400
Received: from filter004.mxroute.com ([149.28.56.236] 149.28.56.236.vultr.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by relay0184.mxlogin.com (ZoneMTA) with ESMTPSA id 1713a002d3f0000766.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Thu, 02 Apr 2020 08:27:02 +0000
X-Zone-Loop: dfb2567c6cdf8b1698a52f508d86cb43ff9e15edaac2
X-Originating-IP: [149.28.56.236]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter004.mxroute.com (Postfix) with ESMTPS id 2B44E3ED96
        for <xdp-newbies@vger.kernel.org>; Thu,  2 Apr 2020 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SMns3UOtrVX8hHzSJnGcZ19zP68PvBT4vcG6vLhGaG8=; b=Ez3KbP6+KBGdoobpLEWkxF9pK4
        u9V4M2r3vSOeBkDD6LQUJuxSrRGOkNC2eIGgumF8CNTFf3PMxgTFmPefhGXb4eQbmc9DUPSoTcihK
        Q347cO+t538Hji1AilcsrWMyih/Y+iYT/wTxJxT1L9CuI3y0ZoXlKOGWgIeBPJE8EGENbOYG6zw88
        RlxPtj0n/RnHFpbMrOL3SXgxWg3ZYY0gAdfRVmTepMJcopQD+FkEtbNRdp1ppR0H7JsEzeUh+iozu
        ARuSe3Mfg7YrJNQrFCciOYxEOa+zvm4nnInDM4UlOfypCh1ct6vOCNk0IXRpqqV7Hh9w/v4laV2FZ
        jX/lY+Rg==;
Subject: Re: Using AF_XDP To Modify Outgoing Packets
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
 <20200330111048.1167e6f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <dd0d11d8-29ff-18c5-85b2-d566d2bba2ea@gflclan.com> <87sghoj2jf.fsf@toke.dk>
 <8013b38c-696c-cadd-a4cd-756eca658215@gflclan.com>
 <20200401115512.4b28f975@carbon>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <b32e36ee-cf04-30cf-b63f-d2a32ef2b8b9@gflclan.com>
Date:   Thu, 2 Apr 2020 03:26:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200401115512.4b28f975@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey Jesper,


Thank you for the information and examples! They helped a lot!


I've started developing the TC egress program today and I have it nearly 
finished. For some reason, when I modify the source address of the inner 
IP header after removing the outer IP header, the packet is never 
received from the destination host after returning 'TC_ACT_OK'. I did a 
tcpdump and can see the packets with the changed source IP along with 
all the checksums being calculated properly. They also have the correct 
MAC addresses in the Ethernet header. I plan to continue looking into it 
tomorrow and to my understanding, this mailing list is for XDP-specific 
threads. Therefore, I'll probably be creating a thread on the BPF 
mailing list if I can't figure things out (I didn't see any TC-specific 
mailing list).


I just wanted to thank everyone who has replied for the information and 
help! I really appreciate it.


On 4/1/2020 4:55 AM, Jesper Dangaard Brouer wrote:
> On Tue, 31 Mar 2020 18:22:53 -0500
> Christian Deacon <gamemann@gflclan.com> wrote:
>
>> After looking into the TC Hook, it looks like this will work for my
>> case. I'll try to get a program made in the next few days or so.
> If you want code examples of TC egress hook with BPF look at[1]:
>   [1] https://github.com/xdp-project/xdp-cpumap-tc/
>
> Notice that map pinning with libbpf have gotten easier (thanks to
> Toke). This example does work (runs in production), it shares and reuse
> maps between XDP and TC-bpf.  The example uses the old way to define
> maps, and I recommend switching to the new BTF-based syntax instead
> (requires LLVM 10), which defines ".maps" SEC, see example[2], and
> notice "pinning" option, which obsoletes a lot of the map code in[1].
>
> Attaching TC-bpf progs are different that XDP.  I've hidden the detail
> in C-code function tc_egress_attach_bpf() (see[3]), which actually just
> calls the "tc" command.  I was hoping that this would be replaced with a
> libbpf call, like we have for XDP, but that have not happened.
>
>
> [2] https://github.com/xdp-project/xdp-tools/blob/master/xdp-filter/xdpfilt_prog.h#L124-L131
> [3] https://github.com/xdp-project/xdp-cpumap-tc/blob/master/src/common_user.c#L386
