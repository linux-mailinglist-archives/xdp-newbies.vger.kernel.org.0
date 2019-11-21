Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D595104959
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 04:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKUD0T (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 20 Nov 2019 22:26:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33032 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725819AbfKUD0T (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 20 Nov 2019 22:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574306778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uHdg9IjgM0zgcQ2SiWr77IgbI4yBbrKbRu7tyDSC0gs=;
        b=MSrin5TmVhX2EIuPLC0V40EH0JayGcBerIySXxAr83wQSkljOV12t8XJ8+GgJKADknxusk
        fgSOVMjhd9P7+zRyw4Y1MdQYku54RJkskpcLJy7nqBVQsUQYTkDu4MTBPplZ7b2i2BCr1Q
        PUcclNXPpPLP5s/KOTkObHq+MS5PTZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-2ohaIzD7MtiGhEclmkyuLA-1; Wed, 20 Nov 2019 22:26:16 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6311005502;
        Thu, 21 Nov 2019 03:26:15 +0000 (UTC)
Received: from [10.72.12.204] (ovpn-12-204.pek2.redhat.com [10.72.12.204])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8D8D434D2D;
        Thu, 21 Nov 2019 03:26:14 +0000 (UTC)
Subject: Re: error loading xdp program on virtio nic
To:     David Ahern <dsahern@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
Date:   Thu, 21 Nov 2019 11:26:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 2ohaIzD7MtiGhEclmkyuLA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2019/11/21 =E4=B8=8A=E5=8D=881:52, David Ahern wrote:
> Hi:
>
> Trying to load an XDP program on a virtio based nic is failing with:
>
> virtio_net: XDP expects header/data in single page, any_header_sg require=
d
>
> I have not encountered this error before and not able to find what is
> missing. Any tips?


Hi David:

What qemu + guest kernel version did you use? And could you share you=20
qemu cli?

Old qemu requires vnet header to be placed into a separate sg which=20
breaks the assumption of XDP. Recent qemu doesn't have such limitation=20
(any_header_sg feature).

Thanks


>
> Thanks,
> David
>

