Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2272DDD0D
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Dec 2020 03:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbgLRCsl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Dec 2020 21:48:41 -0500
Received: from dal2relay92.mxroute.com ([64.40.26.92]:43155 "EHLO
        dal2relay92.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730483AbgLRCsl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Dec 2020 21:48:41 -0500
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Dec 2020 21:48:41 EST
Received: from filter004.mxroute.com ([149.28.56.236] 149.28.56.236.vultr.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by dal2relay92.mxroute.com (ZoneMTA) with ESMTPSA id 17673ba01270005659.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 18 Dec 2020 02:42:18 +0000
X-Zone-Loop: 698d19125cf5af5f2da0bcd61f88e5b6b0938a68207a
X-Originating-IP: [149.28.56.236]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter004.mxroute.com (Postfix) with ESMTPS id 78BA13EADC
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Dec 2020 02:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=p79cw84OcGtrEuCY5x28VlJe8PP8njrB9Lf98tkiipk=; b=bfh+SQq0iLSVJq9Qgv+xnQXjm7
        ydIJnii05tY00b0TeFanPNxV4soAXQWPpliqPbI5x0S9WKQolcK/T4E/1PIedPaKHeO2+LpbNB8dU
        V5ijr4duY1hZiYEUdLne2hohu660JHHflgAbXqVSzCok4r4VLWknO9TO/T8XJ0TGqbeIRt+heOpo2
        2xZ6BQrr0RRvUWWkyWTQBtAD8YuT29iAR7GFOzKU6reMNhgeIlb9kN+3WXgTyY5IJ/fTY/UqIrSQq
        xGZ2x1ttGO5Iy0a9yQgkAuLDMy4uK0u7GCz4OUh/4tloPn02MNXeXN7G7T1K3wQN5IiMWOLI5oZMA
        W28APptQ==;
Subject: Re: XDP BPF Stack Limit Issues
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <ad6ea0ec-c5ce-2887-6f4c-7ed762a0f130@gflclan.com>
 <20201217095016.1f38e06c@carbon>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <992798d6-2f41-afbe-608c-3987dd90593b@gflclan.com>
Date:   Thu, 17 Dec 2020 20:42:15 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201217095016.1f38e06c@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thank you for pointing this out Jesper! I'm honestly surprised I didn't 
realize this before.


I've made this change and I'm able to compile the XDP/BPF program 
without any issues now.


Thank you again!

On 12/17/2020 2:50 AM, Jesper Dangaard Brouer wrote:
> I have to look elsewhere[2] to see that:
>   #define MAX_FILTERS 55
>
> Your problem is that you create an array with 55 pointers each 8 bytes
> equal 440 bytes on the stack (max stack is 512).  Why do you need to
> lookup all 55 map elements in a loop before using them?
>
> https://gist.github.com/gamemann/663674924e16286b02a835637912c2a5#file-xdp_fw_ipv6_maps-c-L267
>
>   struct filter *filter[MAX_FILTERS];
>   for (uint8_t i = 0; i < MAX_FILTERS; i++)
>      {
>          key = i;
>          
>          filter[i] = bpf_map_lookup_elem(&filters_map, &key);
>      }
>   [...]
>   for (uint8_t i = 0; i < MAX_FILTERS; i++)
>      {
>          // Check if ID is above 0 (if 0, it's an invalid rule).
>          if (!filter[i] || filter[i]->id < 1)
>    [...]
