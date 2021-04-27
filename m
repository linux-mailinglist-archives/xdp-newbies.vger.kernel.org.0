Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627D336CC10
	for <lists+xdp-newbies@lfdr.de>; Tue, 27 Apr 2021 22:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhD0UDU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 27 Apr 2021 16:03:20 -0400
Received: from dal3relay168.mxroute.com ([64.40.27.168]:44007 "EHLO
        dal3relay168.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbhD0UDU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 27 Apr 2021 16:03:20 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Apr 2021 16:03:20 EDT
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by dal3relay168.mxroute.com (ZoneMTA) with ESMTPSA id 17914e87975000881b.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Tue, 27 Apr 2021 19:57:30 +0000
X-Zone-Loop: feb25e307eaf8733e267b27fc777db45e6cb95e2365e
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=PV+nslL4aXhJ1ImDJQkVECwkcd/ukxVGZyW1pRmk5rU=; b=GIscCEI5eEk5X/LV4Wfz4/otnk
        BTDI921U330VwPIqD8ENVNqfJ1Cgb7nbmclSDtbwXzxVApplpJoGG9bt1BhQlI6gELnnclAN9v4Ov
        mHR8Vv5b2E9LajWRl+rcRg0/gjLOXpG3Yh68bm83+i+WeSnbegeXsyOp9lpExFwv6NOdUY0TvOUGw
        ysgp6ibQmol5tCtmGf3HotJZ13WF6jRS6C9TG8jKROOwuhTw7Ql+DX/u9POLdKVpcJg2JUbniQBlu
        hdUaxhJHZmsGgXnnccjFfLLrIPx6lkALpwDpVRB0w4sQdumh3PAsCQ5Kk9dK555bBgqNVFe2NrhLL
        HojMa5qg==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: Sending A Separate Packet Out The TX Path In XDP
Message-ID: <d153ed73-3a46-cbf9-c9b7-947926083027@gflclan.com>
Date:   Tue, 27 Apr 2021 14:57:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,


I had a quick question. Is it possible to send a packet separate from 
the original out of the TX path within an XDP program? I would imagine 
this isn't possible, but I just wanted to make sure.


If this isn't possible within the XDP program itself, is it possible to 
do this with AF_XDP sockets or can AF_XDP sockets only handle packets 
redirected via the fast-path XDP creates? I wasn't sure if I'd need to 
make another Linux socket inside of the AF_XDP program in this case to 
send a separate packet out.


Any help is highly appreciated and thank you for your time.

