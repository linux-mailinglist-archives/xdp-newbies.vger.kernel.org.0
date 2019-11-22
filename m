Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD4B10633F
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 Nov 2019 07:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbfKVGJ3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 Nov 2019 01:09:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58689 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727579AbfKVGJ2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 Nov 2019 01:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574402967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lPmTEO5n95ZZE9QEXw/bmBPmPf4LNo8JvFfB+OArRz4=;
        b=R5Bjxg2f0Ov9bQCqCqVboMMCX9cfAg3kYUdtuYHp0sskA8Y7ZTIQORYVEKTJyYquBMuVqt
        ZPaVjhznnXQq8a3tMVBs0juEXaXKyikrkmP8SN39prNq6l8u4YxrgGopZCaNqDsAXVYs5Y
        uaFs+e4qiz+4aURAypOi4O0CmQoiWTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-8pB_N9A_OVWjgZe4jxOhQA-1; Fri, 22 Nov 2019 01:09:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E53801E58;
        Fri, 22 Nov 2019 06:09:24 +0000 (UTC)
Received: from [10.72.12.152] (ovpn-12-152.pek2.redhat.com [10.72.12.152])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8856E10840CD;
        Fri, 22 Nov 2019 06:09:15 +0000 (UTC)
Subject: Re: error loading xdp program on virtio nic
To:     David Ahern <dsahern@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
 <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
 <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
 <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
 <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com>
 <20191121072625.3573368f@carbon>
 <4686849f-f3b8-dd1d-0fe4-3c176a37b67a@redhat.com>
 <df4ae5e7-3f79-fd28-ea2e-43612ff61e6f@gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <f7b19bae-a9cf-d4bf-7eee-bfe644d87946@redhat.com>
Date:   Fri, 22 Nov 2019 14:09:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <df4ae5e7-3f79-fd28-ea2e-43612ff61e6f@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 8pB_N9A_OVWjgZe4jxOhQA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2019/11/21 =E4=B8=8B=E5=8D=8811:49, David Ahern wrote:
> On 11/21/19 12:02 AM, Jason Wang wrote:
>> By specifying queues property like:
>>
>> <devices>
>>
>>  =C2=A0 <interface type=3D'network'>
>>  =C2=A0=C2=A0=C2=A0 <source network=3D'default'/>
>>  =C2=A0=C2=A0=C2=A0 <target dev=3D'vnet1'/>
>>  =C2=A0=C2=A0=C2=A0 <model type=3D'virtio'/>
>>  =C2=A0=C2=A0=C2=A0 <driver name=3D'vhost' txmode=3D'iothread' ioeventfd=
=3D'on'
>> event_idx=3D'off' queues=3D'5' rx_queue_size=3D'256' tx_queue_size=3D'25=
6'>
> I can not check this because the 3.0 version of libvirt does not support
> tx_queue_size. It is multiqueue (queues=3D5 in the example) setting that
> needs to be set to 2*Nvcpus for XDP, correct?


Yes.


>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <host csum=3D'off' gso=3D'off' tso4=3D'o=
ff' tso6=3D'off' ecn=3D'off'
>> ufo=3D'off' mrg_rxbuf=3D'off'/>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <guest csum=3D'off' tso4=3D'off' tso6=3D=
'off' ecn=3D'off' ufo=3D'off'/>
>>  =C2=A0=C2=A0=C2=A0 </driver>
>>  =C2=A0=C2=A0=C2=A0 </interface>
>> </devices>
>>
>>
> The virtio_net driver suggests the queues are needed for XDP_TX:
>
>         /* XDP requires extra queues for XDP_TX */
>          if (curr_qp + xdp_qp > vi->max_queue_pairs) {
>                  NL_SET_ERR_MSG_MOD(extack, "Too few free TX rings
> available");
>                  netdev_warn(dev, "request %i queues but max is %i\n",
>                              curr_qp + xdp_qp, vi->max_queue_pairs);
>                  return -ENOMEM;
>          }
>
> Doubling the number of queues for each tap device adds overhead to the
> hypervisor if you only want to allow XDP_DROP or XDP_DIRECT. Am I
> understanding that correctly?


Yes, but there's almost impossible to know whether or not XDP_TX will be=20
used by the program. If we don't use per CPU TX queue, it must be=20
serialized through locks, not sure it's worth try that (not by default,=20
of course).

Thanks

>

