Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C47A5104AF1
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 08:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfKUHCf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Nov 2019 02:02:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52769 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726230AbfKUHCf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Nov 2019 02:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574319754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dYwZWMk85NnPuO16yUa4pCewvPztmqDHHOTy7FmKaPQ=;
        b=SO1FEQP7orydXD93PVSIqZuGAEOyw5sG8V51XwyFDnFtojBD0qYwyGGOkaD419AfFfFx01
        qpKLZG+R4toaHA4IhloBrqHvPoVxEZTKMpijRe1OUOiJK/hK/78XBHmIKzkKaFzwS26Frw
        5WFIW/RsGe/+uC16juhAmKpRY6sy6pU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-zpJEb5voNwebmtJ-UJHHew-1; Thu, 21 Nov 2019 02:02:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80E15477;
        Thu, 21 Nov 2019 07:02:30 +0000 (UTC)
Received: from [10.72.12.204] (ovpn-12-204.pek2.redhat.com [10.72.12.204])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4EAE6BF97;
        Thu, 21 Nov 2019 07:02:26 +0000 (UTC)
Subject: Re: error loading xdp program on virtio nic
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        David Ahern <dsahern@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
 <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
 <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
 <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
 <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com>
 <20191121072625.3573368f@carbon>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <4686849f-f3b8-dd1d-0fe4-3c176a37b67a@redhat.com>
Date:   Thu, 21 Nov 2019 15:02:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191121072625.3573368f@carbon>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: zpJEb5voNwebmtJ-UJHHew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2019/11/21 =E4=B8=8B=E5=8D=882:26, Jesper Dangaard Brouer wrote:
> On Wed, 20 Nov 2019 21:05:48 -0700
> David Ahern <dsahern@gmail.com> wrote:
>
>> On 11/20/19 8:54 PM, Jason Wang wrote:
>>>> The current error message is:
>>>>  =C2=A0=C2=A0 virtio_net: Too few free TX rings available
>>>> again, looking for some libvirt setting for the vm create.
>>>>  =20
>>> Make sure you have sufficient queues, e.g if you N vcpus with multiqueu=
e
>>> enabled, you need 2*N queues for virtio-net.
>> yep, that did the trick and now I can attach xdp programs. Thanks for
>> the help.
> How did you configure number of queues in libbvirt?
>

By specifying queues property like:

<devices>

 =C2=A0 <interface type=3D'network'>
 =C2=A0=C2=A0=C2=A0 <source network=3D'default'/>
 =C2=A0=C2=A0=C2=A0 <target dev=3D'vnet1'/>
 =C2=A0=C2=A0=C2=A0 <model type=3D'virtio'/>
 =C2=A0=C2=A0=C2=A0 <driver name=3D'vhost' txmode=3D'iothread' ioeventfd=3D=
'on'=20
event_idx=3D'off' queues=3D'5' rx_queue_size=3D'256' tx_queue_size=3D'256'>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <host csum=3D'off' gso=3D'off' tso4=3D'off'=
 tso6=3D'off' ecn=3D'off'=20
ufo=3D'off' mrg_rxbuf=3D'off'/>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <guest csum=3D'off' tso4=3D'off' tso6=3D'of=
f' ecn=3D'off' ufo=3D'off'/>
 =C2=A0=C2=A0=C2=A0 </driver>
 =C2=A0=C2=A0=C2=A0 </interface>
</devices>


More information is here: https://libvirt.org/formatdomain.html

Thanks

