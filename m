Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8068819A26B
	for <lists+xdp-newbies@lfdr.de>; Wed,  1 Apr 2020 01:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731325AbgCaXW7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 31 Mar 2020 19:22:59 -0400
Received: from qrelay116.mxroute.com ([172.82.139.116]:39481 "EHLO
        qrelay116.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbgCaXW6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 31 Mar 2020 19:22:58 -0400
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by qrelay116.mxroute.com (ZoneMTA) with ESMTPA id 17132e7a16b0000d83.001
 for <xdp-newbies@vger.kernel.org>;
 Tue, 31 Mar 2020 23:22:53 +0000
X-Zone-Loop: 53768184a77146fc642c60c5949159d8876ea765b747
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id D3DBB60016
        for <xdp-newbies@vger.kernel.org>; Tue, 31 Mar 2020 23:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YE7LrmiimntTxMfYbPRNfnvY+rq/HHsgjjaVxR0r72A=; b=i8krNPPNMm+ImqasY7nQ8Wowcm
        vgnsFnOIpiakqa9edn337UKWbBgH0Eo6QXERERggA0o6h71ZCiLEuUxWFJPWO6mDBfNT2bkG33zii
        YuwCKx4kz9Gf4Uz+M7YE3/IKgvsKi8B/pJguCptlOqf4fhmnZNA2OQiYtBHk6dD0kk+7CYFWRJRVF
        dnPau1r6XRLwnjW84nnqiFSbbvc1rpV2i/rwXuxre01NIbrA7iUaQLCqaE5g/N+RsFpYVHm52tM5M
        xaOIXalQE2bMsKqAmBDPeHtydPOGksPpO8oYXS//UIDzUe16cWmgy2svwGXlcM1G7eL54BSJwNSJB
        z5CdwRYg==;
Subject: Re: Using AF_XDP To Modify Outgoing Packets
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
 <20200330111048.1167e6f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <dd0d11d8-29ff-18c5-85b2-d566d2bba2ea@gflclan.com> <87sghoj2jf.fsf@toke.dk>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <8013b38c-696c-cadd-a4cd-756eca658215@gflclan.com>
Date:   Tue, 31 Mar 2020 18:22:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87sghoj2jf.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey Toke,


Thank you for your reply and information!


After looking into the TC Hook, it looks like this will work for my 
case. I'll try to get a program made in the next few days or so.


Thank you for the help!


On 3/31/2020 4:29 AM, Toke Høiland-Jørgensen wrote:
> Christian Deacon <gamemann@gflclan.com> writes:
>
>> Hey David and Jakub,
>>
>> Thank you for your replies!
>>
>> David, it's good to know that egress support is being added to XDP and I
>> appreciate all the work you and others are putting into this! Do you
>> know if there is any ETA on when this will be officially
>> available/supported? With that said, will this be faster than most
>> solutions available now for processing/modifying outbound packets such
>> as using standard AF_PACKET sockets, IPTables, or DPDK?
>>
>> Jakub, thank you for that information! As for my project, I have a
>> program forwarding traffic to a server via IPIP packets. The destination
>> server has multiple network namespaces along with the IPIP tunnel
>> endpoints and the application sitting inside each namespace. As of right
>> now, the destination machine replies back through the IPIP tunnel (to
>> the forwarding server) and the forwarding server has to send the replies
>> back to the client. My goal is to make it so the application sends
>> traffic back to the client directly by spoofing the source address as
>> the forwarding server's IP address. This would result in less load on
>> the forwarding server along with less latency in my case. Currently, the
>> IPIP tunnel endpoints inside the namespaces are set as the default
>> devices and all IPIP packets go out the main interface on the
>> destination machine.
>>
>> Initially, I tried creating a veth pair and put the peer inside the
>> namespace. I then created a bridge on the main namespace and bridged the
>> veth on the main namespace. I assigned the bridge an IP and had an SNAT
>> rule in the IPTables POSTROUTING chain to source all traffic out as the
>> forwarding server IP. I set the veth pair inside the network namespace
>> as the default device on the network namespace and set the next hop to
>> the bridge IP. The networking part of this worked fine, traffic sent out
>> from the application (through the default route in the network
>> namespace) was reaching the clients directly and the clients were
>> replying back to the forwarding server. However, this still didn't work
>> and I believe the cause is due to the application not supporting two
>> separate interfaces (one for receiving and one for sending).
>> Unfortunately, the application is closed-source and I doubt support for
>> using two separate interfaces will be added.
>>
>> With the above said, I've been trying to look into creating a program
>> that would receive all outgoing packets on the main interface. It would
>> check the outer IP header's protocol to ensure it's IPPROTO_IPIP. If
>> this is the case, it would then check if the outer IP header's source
>> address is the same as the main interface's IP address. If this matches,
>> it would save the outer IP header's destination address and remove the
>> outer IP header. It would then replace the inner IP header's source
>> address with the saved address (outer IP header's destination address)
>> which should be the IP of the forwarding server. Afterwards, it would
>> recalculate the IP and transport header's checksums and continue sending
>> the packet. I believe in theory this should work.
>>
>> I am trying to find the best way to achieve the above. I don't believe
>> IPTables supports changing the packet's contents to the same extent as
>> the above.
>>
>> I made an XDP program yesterday that would do this, but later found out
>> XDP doesn't support egress at the moment. I still plan to use the code
>> for when TX path/egress support is added. I'd like to come up with
>> another solution in the meantime to achieve the above, though.
> I think you could do this with the TC hook? You can install BPF programs
> there that have then same ability to modify the program as XDP does. And
> since the packets are coming from an application, you don't gain any
> speedup from XDP anyway (since the kernel has already built its packet
> data structures).
>
> -Toke
>
