Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8845B36DD10
	for <lists+xdp-newbies@lfdr.de>; Wed, 28 Apr 2021 18:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240661AbhD1QeX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 28 Apr 2021 12:34:23 -0400
Received: from mail-108-mta130.mxroute.com ([136.175.108.130]:40969 "EHLO
        mail-108-mta130.mxroute.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230470AbhD1QeX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 28 Apr 2021 12:34:23 -0400
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Apr 2021 12:34:23 EDT
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta130.mxroute.com (ZoneMTA) with ESMTPSA id 179194f82a00004964.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Wed, 28 Apr 2021 16:28:31 +0000
X-Zone-Loop: c53c4234381202ea6dd0d5f7861f78536563fd3d3327
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TJKO+yquOqchFldVFQWWwAppFKRUWW4XmHYQVKmBmEc=; b=DWO0yEIxpmQyoF2rmkEsPGhpen
        /pZxzGsDAPG6VogrWhU2fdN6EoA/RuHxE+E3OkHcBwkFdeNWaZXHfm2Ib5MsrvG/CXBrEyeABqubc
        0za0EKQdwspBXjAwHnVktTjsk3iyOsKUN0cRGoJo5ZfgWmdKVchISthDSveSUzxzqViUj3LbpDome
        VfJjXE+GtTOYYkyu1TBOyRNVdb7vEOc1Pb2Cb8QkuAatI0tss796rgNAJ+HBg70Y7qZw9FsdAY1PY
        BHjkMO9X1b9Xct2K4Dt7MymZmEVzJUPffGbONxrzhgJF8gsDk8Z4Cq6O6aNV+JAXyi3fDCdk4EgZS
        0E+ueKVg==;
Subject: Re: Sending A Separate Packet Out The TX Path In XDP
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <d153ed73-3a46-cbf9-c9b7-947926083027@gflclan.com>
 <87wnsn8oxr.fsf@toke.dk>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <389750c6-6a31-fe80-7fa2-56fbec888534@gflclan.com>
Date:   Wed, 28 Apr 2021 11:28:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87wnsn8oxr.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey Toke,


That makes sense! I'm going to look into using AF_XDP sockets to achieve 
this.


As always, thank you for all your help!


On 4/27/2021 3:14 PM, Toke Høiland-Jørgensen wrote:
> Christian Deacon <gamemann@gflclan.com> writes:
>
>> Hey everyone,
>>
>>
>> I had a quick question. Is it possible to send a packet separate from
>> the original out of the TX path within an XDP program? I would imagine
>> this isn't possible, but I just wanted to make sure.
> Not from within XDP, no...
>
>> If this isn't possible within the XDP program itself, is it possible to
>> do this with AF_XDP sockets or can AF_XDP sockets only handle packets
>> redirected via the fast-path XDP creates? I wasn't sure if I'd need to
>> make another Linux socket inside of the AF_XDP program in this case to
>> send a separate packet out.
> ...but AF_XDP sockets can send whatever you want :)
>
> -Toke
>
