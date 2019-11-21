Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB67104978
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 04:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKUDy7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 20 Nov 2019 22:54:59 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52727 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725842AbfKUDy7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 20 Nov 2019 22:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574308498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aRwVF3AjnJ/SPLEZzNWu338oI4CaQUSCmoevOXVhQ08=;
        b=LimSqUCXgqOCiFY1n6Uit5ZRF833Nr94Osu3xBGafRJEDDmramIfWXMaWgyovplwLWfpbp
        fQGd9GuL05fJQg/vcaNkbVB39m74OaO3BNef5qminUB4bmzd49l8qomZouk5mWXWC0HL80
        ZmeflO94PU3Jc9G/Ab2z7jTOKhHbO6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-G5m0QQEfN_i3gvPFZvoLlA-1; Wed, 20 Nov 2019 22:54:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0C1E2F2A;
        Thu, 21 Nov 2019 03:54:55 +0000 (UTC)
Received: from [10.72.12.204] (ovpn-12-204.pek2.redhat.com [10.72.12.204])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AD9566CE48;
        Thu, 21 Nov 2019 03:54:54 +0000 (UTC)
Subject: Re: error loading xdp program on virtio nic
To:     David Ahern <dsahern@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
 <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
 <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
Date:   Thu, 21 Nov 2019 11:54:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: G5m0QQEfN_i3gvPFZvoLlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2019/11/21 =E4=B8=8A=E5=8D=8811:35, David Ahern wrote:
> On 11/20/19 8:26 PM, Jason Wang wrote:
>> On 2019/11/21 =E4=B8=8A=E5=8D=881:52, David Ahern wrote:
>>> Hi:
>>>
>>> Trying to load an XDP program on a virtio based nic is failing with:
>>>
>>> virtio_net: XDP expects header/data in single page, any_header_sg
>>> required
>>>
>>> I have not encountered this error before and not able to find what is
>>> missing. Any tips?
>>
>> Hi David:
>>
>> What qemu + guest kernel version did you use? And could you share you
>> qemu cli?
>>
>> Old qemu requires vnet header to be placed into a separate sg which
>> breaks the assumption of XDP. Recent qemu doesn't have such limitation
>> (any_header_sg feature).
>>
>>
> Hi Jason,
>
> When I run qemu via my older vm-tools scripts XDP works fine. This is
> the first time I am trying to use XDP with guests started by libvirt.
>
> We isolated it to a libvirt xml file using an old machine type
> (pc-i440fx-1.5) - basically any machine with VIRTIO_F_VERSION_1 not set.
> Using a newer one move the problem forward.


Yes, if VERSION_1 implies ANY_HEADER_SG, and if you're using old qemu,=20
make sure any_header_sg is enabled in qemu cli.


>
> The current error message is:
>    virtio_net: Too few free TX rings available
> again, looking for some libvirt setting for the vm create.
>

Make sure you have sufficient queues, e.g if you N vcpus with multiqueue=20
enabled, you need 2*N queues for virtio-net.

Thanks

