Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E62146F85
	for <lists+xdp-newbies@lfdr.de>; Thu, 23 Jan 2020 18:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgAWRWl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 23 Jan 2020 12:22:41 -0500
Received: from q2relay90.mxroute.com ([160.202.107.90]:34337 "EHLO
        q2relay90.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgAWRWl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 23 Jan 2020 12:22:41 -0500
Received: from filter003.mxroute.com [168.235.111.26] (Authenticated sender: mN4UYu2MZsgR)
 by q2relay90.mxroute.com (ZoneMTA) with ESMTPSA id 16fd36d5c4a00198e2.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Thu, 23 Jan 2020 17:22:37 +0000
X-Zone-Loop: 9ca6309cdbacc1872bb8b0f588487518237251a9156f
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id 927136003E
        for <xdp-newbies@vger.kernel.org>; Thu, 23 Jan 2020 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=My4mUOYoUOFFkHgfYJUvb1ZoayjdHPQ/SfhcLg9bNP8=; b=L+KAISmYA61VS1hpKCkP5L8ekx
        WSwwNvhHcQcT6iqNaevioMjwo1/QQeZpMunCLMqP3bKgIdg5bqJWajLiTqO/G7W3hmmMZOIH3VHCo
        ehQqerq02Pmh6G2DuxWWyztas7onhz5Qn7OvA1hSoHzf9qpqlstq8gfwhmjss56wxOgYlBxF07ace
        2+gHI2PTrYL9RwYR8imMDB12qNp3e5whLmVocSeAbiZvOsIDtLmfxlZJX86YZxDBGJdaaDjoCZozT
        Yby/LfoPO9kFPkednf8q/v8OXsz/c4wIwKtOog/hgfPhg+tq4139cbFLX5E25lnWTtSRb8ZfxxnXO
        SAiadjbg==;
Subject: Re: Measuring/Debugging XDP Performance
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
 <20200123141122.3783e298@carbon>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <23ec64c0-e0d7-a60b-ecc4-6ca401dc4896@gflclan.com>
Date:   Thu, 23 Jan 2020 11:22:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123141122.3783e298@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey Vincent and Jesper,

Thank you for the information and I will try these commands tonight when 
there is higher traffic load! The 'perf' command seems interesting.

Jesper, I do believe my kernel supports BPF Trace. I was able to use 
this function in our software while I was debugging it for a separate 
issue that I resolved earlier this week. With that said, the IPIP 
traffic is handled in the XDP program. We only redirect a certain packet 
to the AF_XDP program so it can be cached via a Redis server (needed in 
the user space). However, this doesn't happen that often and other 
packets handled by the XDP program itself are being dropped. Therefore, 
I doubt the AF_XDP program is causing anything.

Thank you!

On 1/23/2020 7:11 AM, Jesper Dangaard Brouer wrote:
> On Wed, 22 Jan 2020 12:02:23 -0600
> Christian Deacon <gamemann@gflclan.com> wrote:
>
>> Hey everyone,
>>
>> I am new to XDP + AF_XDP (along with C programming in general), but I am
>> very interested in it and I've been learning a lot recently. I own an
>> Anycast network and our POP servers are running custom software our
>> developer created that processes packets using XDP. This software
>> basically forwards specific traffic to another machine via an IPIP
>> tunnel.
> Why are you using AF_XDP to implement a simple IPIP tunnel header?
>
> You can easily implement it in BPF.
> Example here:
>   https://github.com/torvalds/linux/blob/master/samples/bpf/xdp_tx_iptunnel_kern.c#L110-L112
