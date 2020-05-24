Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49CA1E02FB
	for <lists+xdp-newbies@lfdr.de>; Sun, 24 May 2020 23:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387875AbgEXVZe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 May 2020 17:25:34 -0400
Received: from qrelay173.mxroute.com ([172.82.139.173]:32937 "EHLO
        qrelay173.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387830AbgEXVZe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 May 2020 17:25:34 -0400
Received: from filter004.mxroute.com ([149.28.56.236] 149.28.56.236.vultr.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by qrelay173.mxroute.com (ZoneMTA) with ESMTPA id 172489399b1000add6.001
 for <xdp-newbies@vger.kernel.org>;
 Sun, 24 May 2020 21:25:32 +0000
X-Zone-Loop: d707377b3fe3b465184fad819deeefab8ba38989c2bf
X-Originating-IP: [149.28.56.236]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter004.mxroute.com (Postfix) with ESMTPS id 5B4C63EAD9
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 21:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YdCuXg2p6gyV/qTHbp/h+2wyBAu0xA7W5Xbdy6w5FOA=; b=iQdboEDuHzFMwftbz6fNJhCbKf
        L0//bivUHKRwIBWr97+FSXcjuJVGfN+cCv2zQ55uNK6WbWWxHAfJAZxzkml/ToFVnVyLh+i6vHhTh
        7raaEtEj9CHu54sXIDl/rSMhSO9sb/LZaiJNAm7mLUapCKc/dnkfk8YrLwqBc+rjaPaFKlWH0PKiw
        9LlZggYGglpnWSFm6dQQ/QHlVn7JOuRjhkAepvaZ6Ae5XsDzy4SfzkD+LPRDGBtlTWv0agRF6ba/l
        uXX1LJydsn1+Y/dFNsg7EVqmLfVSA9XucrmW9b5e2imOdESEVLBqU+3eNWalJcVdHZGmRjE/Hn7Av
        4jpkAfWw==;
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
To:     David Ahern <dsahern@gmail.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
 <20200522175136.5a6fdc55@carbon>
 <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
 <6709130c-a676-127d-ac9d-d0ab35397b0d@gmail.com>
 <2ed7d441-1a98-b4c1-8799-733ae286ed5e@gflclan.com>
 <f4a901ef-6edf-0b92-5ec1-d931956c0ffd@gmail.com>
 <25405fb0-83f3-066a-629f-f89044e2cce7@gflclan.com>
 <791e4566-0944-399f-fade-550c60ea8643@gmail.com>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <edfe88b4-7006-f571-17c3-087c88bbaa2f@gflclan.com>
Date:   Sun, 24 May 2020 16:25:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <791e4566-0944-399f-fade-550c60ea8643@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey David,


Thank you for this!


I will be looking into implementing the packet parsers into my current 
projects with XDP to simplify code :)


In regards to the AF_XDP issue, now that I know it should be working 
with the `virtio_net` driver under XDP-native, I'm not sure why I keep 
receiving a device is busy error after the first XDP attach. I also have 
a second issue with Compressor, AF_XDP, and XDP-native which is the 
AF_XDP program isn't sending packets back to the client via TX. It works 
fine with XDP-generic, though.


https://github.com/Dreae/compressor/blob/master/src/compressor_cache_user.c#L283


I discovered that `rcvd` is returning 0 when XDP-native is enabled, but 
returns a number higher than 0 when using XDP-generic. I'd imagine this 
is due to outdated AF_XDP code, though. I'll continue digging deeper 
into that issue after the first issue is resolved (the device is too 
busy error).


Thank you again for all the help!


On 5/24/2020 3:23 PM, David Ahern wrote:
> On 5/24/20 1:27 PM, Christian Deacon wrote:
>> As of right now, the packet processing software I'm using forwards
>> traffic to another server via XDP_TX. It also drops any traffic via
>> XDP_DROP that doesn't match our filters (these filters aren't included
>> in the open-source project linked below). Do you know if there would be
>> any real performance advantage using XDP-native over XDP-generic in our
>> case with the `virtio_net` driver for XDP_TX and XDP_DROP actions? We're
>> currently battling (D)DoS attacks. Therefore, I'm trying to do
>> everything I can to drop these packets as fast as possible.
> native will be much faster than generic.
>
>>
>> If you would like to inspect the source code for this project, here's a
>> link to the GitHub repository:
>>
>>
>> https://github.com/Dreae/compressor
>>
>>
>> I'm also working on a bigger open-source project with a friend that'll
>> drop traffic based off of filtering rules with XDP (it'll be version two
>> of the project I linked above) and we plan to use it on VMs with the
>> `virtio_net` driver. Therefore, it'll be useful to know if XDP-native
>> will provide a performance advantage over XDP-generic when dropping
>> packets.
>>
> Looking at:
> https://github.com/Dreae/compressor/blob/master/src/compressor_filter_kern.c
>
> A packet parser would simplify that code a lot - and make it more
> readable. For example:
>
> https://github.com/dsahern/bpf-progs/blob/master/ksrc/flow.c
> https://github.com/dsahern/bpf-progs/blob/master/ksrc/flow.h
>
> It is modeled to a huge degree after the kernel's flow dissector. It
> needs to be extended to handle IPIP, but that is straightforward. The
> flow struct can also expanded to save the various header locations. You
> don't care about IPv6 so you could make the v6 code based on #ifdef
> CONFIG options to compile it out.
>
> I have an acl program that uses it, but I make too many changes to it
> right now to make it public. Example use of the flow parser:
>
>          void *data_end = (void *)(long)ctx->data_end;
>          void *data = (void *)(long)ctx->data;
>          struct ethhdr *eth = data;
>          struct flow fl = {};
>          void *nh = eth + 1;
>          u16 h_proto;
>          int rc;
>
>          if (nh > data_end)
>                  return true;
>
>          h_proto = eth->h_proto;
> 	/* vlan handling here if relevant */
>
>          rc = parse_pkt(&fl, h_proto, nh, data_end, 0);
>          if (rc)
>                  // you might just want DROP here
>                  return rc > 0 ? XDP_PASS : XDP_DROP;
>
>          ...
>          make decisions based on L3 address family (AF_INET), L4 protocol
> , etc
