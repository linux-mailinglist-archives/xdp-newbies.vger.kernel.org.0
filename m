Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B8F315DE8
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Feb 2021 04:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhBJDnr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Feb 2021 22:43:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40581 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229854AbhBJDnq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 9 Feb 2021 22:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612928540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Djc2XdOL9BsQ76pA2tghi0B5EeY/je5QzMBwdSF4mNk=;
        b=TxifD+LNB4se+q8WeZv7k0ro85mfVSe3SVCN7Fk/SwQlfM6H0Kp+YWjLw9sDvep9O7eIjc
        NakcMM2+tHcHs0hHfthd9lh8KB3YI6/CK70smQs6tzsEFu0+MD2sJ28saPlq/lptowirIR
        Zaxday/TVx23Jf3sOPwKoUVyqPA18Z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-X3ULyOALNzuidqa_NuQuRg-1; Tue, 09 Feb 2021 22:42:17 -0500
X-MC-Unique: X3ULyOALNzuidqa_NuQuRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB55B801962;
        Wed, 10 Feb 2021 03:42:16 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9146267E;
        Wed, 10 Feb 2021 03:42:12 +0000 (UTC)
Subject: Re: Redirect from NIC to TAP
To:     Radu Stoenescu <radu.stoe@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
 <20210209102118.476f507d@carbon>
 <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <fe13ccc1-9ccf-8f58-b8a8-45300f970ac2@redhat.com>
Date:   Wed, 10 Feb 2021 11:42:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2021/2/9 下午5:26, Radu Stoenescu wrote:
> Hello
>
> My physical NIC is a Netronome (I can come back with exact model type
> and driver version).
>
> Redirect NIC to TAP doesn't work when XDP is attached in driver mode.
> It works when they are both in generic mode. I haven't tried other
> combinations of attachment modes (one driver, other generic etc.).


It should work. I tested with i40e/ixgbe/mlx4 in the past.

What eBPF program did you use? (Is it the one in samples/bpf?)

I would test it by myself.

(It's near to spring festival, so I can only check after the holiday).

Thanks


>
> Thanks
>
> On Tue, Feb 9, 2021 at 11:21 AM Jesper Dangaard Brouer
> <brouer@redhat.com> wrote:
>> On Tue, 9 Feb 2021 10:31:50 +0200
>> Radu Stoenescu <radu.stoe@gmail.com> wrote:
>>
>>> Is it possible to redirect packets from XDP program attached in driver
>>> mode to a physical NIC to a TAP interface?
>> Cc. Jason Wang as I think he implemented this, but I'm not 100% sure.
>> Maybe Jason can remember?
>> (or point me to the relevant code that I can check).
>>
>>> The same works fine if the XDP programs are attached in generic mode.
>> So, you have tried and it doesn't work.
>>
>> What is your setup?
>>
>> --
>> Best regards,
>>    Jesper Dangaard Brouer
>>    MSc.CS, Principal Kernel Engineer at Red Hat
>>    LinkedIn: http://www.linkedin.com/in/brouer
>>
>

