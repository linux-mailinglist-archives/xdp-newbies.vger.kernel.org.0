Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E14A6198483
	for <lists+xdp-newbies@lfdr.de>; Mon, 30 Mar 2020 21:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgC3Td1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 30 Mar 2020 15:33:27 -0400
Received: from qrelay122.mxroute.com ([172.82.139.122]:46013 "EHLO
        qrelay122.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgC3Td1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 30 Mar 2020 15:33:27 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Mar 2020 15:33:27 EDT
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by qrelay122.mxroute.com (ZoneMTA) with ESMTPA id 1712cea8e240000d83.001
 for <xdp-newbies@vger.kernel.org>;
 Mon, 30 Mar 2020 19:28:21 +0000
X-Zone-Loop: 6b750ebcd812b13a19b4cf10c596c61b1395fb8cbca1
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id C534B6002D
        for <xdp-newbies@vger.kernel.org>; Mon, 30 Mar 2020 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VJ9drtficeCDfgCEr+R6KZhYubvHIoPt9PoTAR4CeRE=; b=AD/RjUul2FjoK2BGCTxW1HRc1a
        W0nZKQv6B+jCZeqyRCXWRbiswyqhxLNB9PmW4X+5qX8E1JZHbNOFrblYncINA+sHTOOL9DUMaKkVE
        A2gvNbSXqGW9PwtvmQHZQOhMl2aQnNVKL9DoT+Mywojknet/9uJdJiou82iOgwFCN5CM54hqDcrzo
        spHKFM82kpUKirkOQcotrw3Q916qFt13sQJjxBaW3G9sPgAaq9PdHBYpQKOYtuzO+QPLtRRXHj2xb
        Pe8NYcayQWOf+grtvFuO0L5Ld+G4ENFhJrfc8mvL0zCMOtXRjzZ2OUCj0zLwZl975mQpUBEuRHsOb
        aRZypivA==;
Subject: Re: Using AF_XDP To Modify Outgoing Packets
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     xdp-newbies@vger.kernel.org
References: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
 <20200330111048.1167e6f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <dd0d11d8-29ff-18c5-85b2-d566d2bba2ea@gflclan.com>
Date:   Mon, 30 Mar 2020 14:28:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330111048.1167e6f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey David and Jakub,

Thank you for your replies!

David, it's good to know that egress support is being added to XDP and I 
appreciate all the work you and others are putting into this! Do you 
know if there is any ETA on when this will be officially 
available/supported? With that said, will this be faster than most 
solutions available now for processing/modifying outbound packets such 
as using standard AF_PACKET sockets, IPTables, or DPDK?

Jakub, thank you for that information! As for my project, I have a 
program forwarding traffic to a server via IPIP packets. The destination 
server has multiple network namespaces along with the IPIP tunnel 
endpoints and the application sitting inside each namespace. As of right 
now, the destination machine replies back through the IPIP tunnel (to 
the forwarding server) and the forwarding server has to send the replies 
back to the client. My goal is to make it so the application sends 
traffic back to the client directly by spoofing the source address as 
the forwarding server's IP address. This would result in less load on 
the forwarding server along with less latency in my case. Currently, the 
IPIP tunnel endpoints inside the namespaces are set as the default 
devices and all IPIP packets go out the main interface on the 
destination machine.

Initially, I tried creating a veth pair and put the peer inside the 
namespace. I then created a bridge on the main namespace and bridged the 
veth on the main namespace. I assigned the bridge an IP and had an SNAT 
rule in the IPTables POSTROUTING chain to source all traffic out as the 
forwarding server IP. I set the veth pair inside the network namespace 
as the default device on the network namespace and set the next hop to 
the bridge IP. The networking part of this worked fine, traffic sent out 
from the application (through the default route in the network 
namespace) was reaching the clients directly and the clients were 
replying back to the forwarding server. However, this still didn't work 
and I believe the cause is due to the application not supporting two 
separate interfaces (one for receiving and one for sending). 
Unfortunately, the application is closed-source and I doubt support for 
using two separate interfaces will be added.

With the above said, I've been trying to look into creating a program 
that would receive all outgoing packets on the main interface. It would 
check the outer IP header's protocol to ensure it's IPPROTO_IPIP. If 
this is the case, it would then check if the outer IP header's source 
address is the same as the main interface's IP address. If this matches, 
it would save the outer IP header's destination address and remove the 
outer IP header. It would then replace the inner IP header's source 
address with the saved address (outer IP header's destination address) 
which should be the IP of the forwarding server. Afterwards, it would 
recalculate the IP and transport header's checksums and continue sending 
the packet. I believe in theory this should work.

I am trying to find the best way to achieve the above. I don't believe 
IPTables supports changing the packet's contents to the same extent as 
the above.

I made an XDP program yesterday that would do this, but later found out 
XDP doesn't support egress at the moment. I still plan to use the code 
for when TX path/egress support is added. I'd like to come up with 
another solution in the meantime to achieve the above, though.

I hope this helps clear up the situation and thank you again!


On 3/30/2020 1:10 PM, Jakub Kicinski wrote:
> On Mon, 30 Mar 2020 11:11:49 -0500 Christian Deacon wrote:
>> Hey everyone,
>>
>>
>> I am fairly new to XDP and AF_XDP programming. Therefore, I apologize if
>> this question sounds silly.
>>
>>
>> To my understanding, an XDP program cannot process outgoing packets
>> since it doesn't support the TX path. However, I read that AF_XDP
>> sockets support both receiving and transmitting packets inside the user
>> space while achieving zero-copy. I am trying to create a C program that
>> modifies outgoing packets on an interface and trying to do this the
>> fastest way possible. Unfortunately, I cannot use IPTables for this.
>>
>>
>> I wanted to know if there is any way to use AF_XDP sockets to modify
>> outgoing packets on an interface. I wasn't sure if the AF_XDP sockets
>> only support receiving traffic from the XDP program when using the
>> redirect function or not.
>>
>>
>> If this isn't possible, are there any plans to add TX path support into
>> XDP in the future? I'm also not sure what else I can do to achieve fast
>> packet processing for this. I looked into using standard AF_PACKET
>> sockets. However, since that makes a copy of the packet from the kernel,
>> I'd assume that's pretty slow and I'd have to find a way to block the
>> original packets (probably doing something with IPTables). I might also
>> look into DPDK, but I want to see if using AF_XDP sockets for outgoing
>> packet processing is possible first because it looks like it's going to
>> take a while to learn DPDK.
>>
>>
>> Any help is highly appreciated and thank you for your time!
> Could you give us some more info on the use case? Where do the packets
> originate? The main advantage of XDP is that it processes packets
> before the metadata needed by the networking stack is allocated (skb).
> This is only possible for RX or when packets are redirected from
> another interface with XDP. All packets which pass through the stack
> anyway can be efficiently modified using cls_bpf.
>
