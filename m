Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2AD1DECF8
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 May 2020 18:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgEVQMn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 May 2020 12:12:43 -0400
Received: from qrelay215.mxroute.com ([172.82.139.215]:42973 "EHLO
        qrelay215.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbgEVQMm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 May 2020 12:12:42 -0400
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by qrelay215.mxroute.com (ZoneMTA) with ESMTPA id 1723d2876aa000add6.001
 for <xdp-newbies@vger.kernel.org>;
 Fri, 22 May 2020 16:12:41 +0000
X-Zone-Loop: 12a87dfbeec0e2d0cb53efe5bb8b7e4ce594ef831171
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id C28366001A
        for <xdp-newbies@vger.kernel.org>; Fri, 22 May 2020 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5M+dWb4gW/7mTq1aivp7PNQFTIZZpQHM/QG7znnxByQ=; b=e/jlgUK4fx+NQ+RQNPOaqZ+hBR
        T5lVJaSKsSXNnDnxrNzM0DyINRaXlAoYfIswcg3rWnyECTtc5bataN4G7GqnPVdH3pwi1+v0+6lSo
        /MP8JUtw5fcAzfaBX9JWJ6h+8GtPlMjJ7mN5mgKe2crvCr4o37dZ81w5nMqlzLmC5kp6mlYXOxG7e
        /gggjj4wfDfpzp58QbpA0a10Ozs5eYcS1zFk1h/WBA65c3R7brRDODgd10mt3Ve4IVfza/ASxlvXE
        wtWtR6T+OrccddP0ykqpRjUEqJGSoCARGcMJ9b1pboFzX+zKLB/1ybpKtH3mnNXQmylj7VV5pcE9f
        vuTOQexQ==;
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
 <20200522175136.5a6fdc55@carbon>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
Date:   Fri, 22 May 2020 11:12:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522175136.5a6fdc55@carbon>
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


I apologize for not providing that information before. The driver is 
`virtio_net`. Unfortunately, I'm not sure what the NIC driver on the 
cluster is. Once my program's code is confirmed to be correct, I will 
try reaching out to our hosting provider to see if they can provide this 
information if the NIC's driver is the suspected cause to this issue.

```

root@SEAV21:~/AF_XDP-Test# ethtool -i ens3
driver: virtio_net
version: 1.0.0
firmware-version:
expansion-rom-version:
bus-info: 0000:00:03.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no
```


Thank you!


On 5/22/2020 10:51 AM, Jesper Dangaard Brouer wrote:
> On Fri, 22 May 2020 10:22:10 -0500
> Christian Deacon <gamemann@gflclan.com> wrote:
>
>> If I'm not doing anything wrong here, is it possible there's a bug with
>> the NIC's driver? Unfortunately, I'm not sure which driver the cluster's
>> NIC is using.
> Please run:
>   ethtool -i ens3
>
> And provide output.  As it will tell you that NIC driver you are using.
>
