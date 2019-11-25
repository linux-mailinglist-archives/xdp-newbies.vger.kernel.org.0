Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE104108695
	for <lists+xdp-newbies@lfdr.de>; Mon, 25 Nov 2019 03:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfKYCsb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 Nov 2019 21:48:31 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33396 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726895AbfKYCsb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 Nov 2019 21:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574650110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LYnpYaVvGAjoyrxfxjKyBCL1DAd0ba4uyZRP6oAPrcA=;
        b=BJk7FK1Q1hmGdykrc5YH/EQ0tCc1i4kTvtBcf8E/cxvwZXz5/feBFZcLmEMnItOocYwDkc
        ykwHD+VdQZdkY9/lpXyHWSl+Kb2/jXNHc3oeAC1TqA1JuF/zOqlmblY7rTmv5k9MQvBw6O
        kYqd6qb4IubcfhSbEUlnBUqHx6AEptg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-DffXOnm6MZaKKRocCUfUIg-1; Sun, 24 Nov 2019 21:48:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2856800580;
        Mon, 25 Nov 2019 02:48:25 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 021485C1D4;
        Mon, 25 Nov 2019 02:48:21 +0000 (UTC)
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
 <f7b19bae-a9cf-d4bf-7eee-bfe644d87946@redhat.com>
 <8324a37e-5507-2ae6-53f6-949c842537e0@gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <8041b387-5cfb-7a57-fc01-9be6967d8658@redhat.com>
Date:   Mon, 25 Nov 2019 10:48:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8324a37e-5507-2ae6-53f6-949c842537e0@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: DffXOnm6MZaKKRocCUfUIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2019/11/22 =E4=B8=8B=E5=8D=8811:43, David Ahern wrote:
> On 11/21/19 11:09 PM, Jason Wang wrote:
>>> Doubling the number of queues for each tap device adds overhead to the
>>> hypervisor if you only want to allow XDP_DROP or XDP_DIRECT. Am I
>>> understanding that correctly?
>>
>> Yes, but there's almost impossible to know whether or not XDP_TX will be
>> used by the program. If we don't use per CPU TX queue, it must be
>> serialized through locks, not sure it's worth try that (not by default,
>> of course).
>>
> This restriction is going to prevent use of XDP in VMs in general cloud
> hosting environments. 2x vhost threads for vcpus is a non-starter.
>
> If one XDP feature has high resource needs, then we need to subdivide
> the capabilities to let some work and others fail. For example, a flag
> can be added to xdp_buff / xdp_md that indicates supported XDP features.
> If there are insufficient resources for XDP_TX, do not show support for
> it. If a program returns XDP_TX anyways, packets will be dropped.
>

Or we can just:
- If queues is sufficient, using per-cpu TX queue
- If not, synchronize through spinlocks (like what TAP did right now,=20
since there's no easy way to have more queues on the fly)

Thanks

