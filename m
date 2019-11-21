Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D064104AC1
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 07:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKUG0h (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Nov 2019 01:26:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54307 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725842AbfKUG0h (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Nov 2019 01:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574317596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BZOAUakMJJDKepcjN2r6UZ/hfB81LhYQI3NvZHH/AB0=;
        b=CkoNXUAgHshe7lmCdUrIdfNC50D3+Gbj/JJdtkHwpMh2EUh8GvF7bS0udNN1E+BfNyAhz2
        i/dyKdLFwB0A8i4lCnPMSD8alLBSDNnOafxJ7t7lWZHgwTUb23kWD2fIJxHPjj1SBUVoY+
        jTVYFp/xxQVS2TSqVkRWNOoWopc4FcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-UtQVoSh9OzCwX8wpeGDk8g-1; Thu, 21 Nov 2019 01:26:34 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D6DFDB23;
        Thu, 21 Nov 2019 06:26:33 +0000 (UTC)
Received: from carbon (ovpn-200-17.brq.redhat.com [10.40.200.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1FBD644F8D;
        Thu, 21 Nov 2019 06:26:27 +0000 (UTC)
Date:   Thu, 21 Nov 2019 07:26:25 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     David Ahern <dsahern@gmail.com>
Cc:     brouer@redhat.com, Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: error loading xdp program on virtio nic
Message-ID: <20191121072625.3573368f@carbon>
In-Reply-To: <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
        <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
        <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
        <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
        <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: UtQVoSh9OzCwX8wpeGDk8g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 20 Nov 2019 21:05:48 -0700
David Ahern <dsahern@gmail.com> wrote:

> On 11/20/19 8:54 PM, Jason Wang wrote:
> >>
> >> The current error message is:
> >> =C2=A0=C2=A0 virtio_net: Too few free TX rings available
> >> again, looking for some libvirt setting for the vm create.
> >> =20
> >=20
> > Make sure you have sufficient queues, e.g if you N vcpus with multiqueu=
e
> > enabled, you need 2*N queues for virtio-net. =20
>=20
> yep, that did the trick and now I can attach xdp programs. Thanks for
> the help.

How did you configure number of queues in libbvirt?=20

--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

