Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BB431E610
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Feb 2021 06:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhBRFzV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 18 Feb 2021 00:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41342 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231857AbhBRFto (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 18 Feb 2021 00:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613627298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QMAoWhrg9pi0Bth6nmmJObjFW+JCxj4zXro8TJavaio=;
        b=Tdz7NIANa0biXjULg6LpkY2LkIJPflLeRAf46aIxEpZniPhBQ6zRa+LG7QgWj47TBZjsHl
        Ena0mKC9dAXtcyfbwpIxESIS42cqrdx9aJGQ8jhU4fuJCBuiCDvgH095sqm53hq/UVA0Od
        pTyWmZ1OBX4k4lqdo4ZtU8DNqtZXpJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-lfbT4EvvN_qULncqvV4kgQ-1; Thu, 18 Feb 2021 00:48:16 -0500
X-MC-Unique: lfbT4EvvN_qULncqvV4kgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F0CA8030B7;
        Thu, 18 Feb 2021 05:48:15 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8A63F6E407;
        Thu, 18 Feb 2021 05:48:06 +0000 (UTC)
Subject: Re: Redirect from NIC to TAP
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Radu Stoenescu <radu.stoe@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
 <20210209102118.476f507d@carbon>
 <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
 <fe13ccc1-9ccf-8f58-b8a8-45300f970ac2@redhat.com>
 <20210210123521.1ea112bc@carbon>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <2eb7dd67-f8f6-f6fa-b56b-811ad76a3a35@redhat.com>
Date:   Thu, 18 Feb 2021 13:48:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210123521.1ea112bc@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2021/2/10 下午7:35, Jesper Dangaard Brouer wrote:
> On Wed, 10 Feb 2021 11:42:10 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2021/2/9 下午5:26, Radu Stoenescu wrote:
>>> Hello
>>>
>>> My physical NIC is a Netronome (I can come back with exact model type
>>> and driver version).
>>>
>>> Redirect NIC to TAP doesn't work when XDP is attached in driver mode.
>>> It works when they are both in generic mode. I haven't tried other
>>> combinations of attachment modes (one driver, other generic etc.).
>>
>> It should work. I tested with i40e/ixgbe/mlx4 in the past.
>>
>> What eBPF program did you use? (Is it the one in samples/bpf?)
>>
>> I would test it by myself.
>>
>> (It's near to spring festival, so I can only check after the holiday).
> As Maciej Fijalkowski pointed out:
>   "Looks like Netronome driver still doesn't support XDP_REDIRECT in native
> mode."
>
> So, that is likely the problem.


I see.

Thanks


