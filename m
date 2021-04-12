Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D978B35C95C
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Apr 2021 17:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238999AbhDLPDZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 12 Apr 2021 11:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48358 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238723AbhDLPDZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 12 Apr 2021 11:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618239787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eb+4zBLgtGga9AXAKHIaueoN2MH5bUBHgZtcwU1aqNA=;
        b=irBXCYJxKFUWsu89KPWElF+LSZdyQ3VE2xC1UO//M4DpUe//oopCcYFdgzDAlBjyGB6dO0
        wMZoHJCMStHxyj2Z9QBAS7F4OWGScRk9BWBvCMWVLr4zHWC18Mt2jFU5pPwFiRdOAX6hIA
        mvkJGf0QpNGVIzosGDwuEWN9Vk7xAew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-N2jpBhHJMY2HZgOiJQFamw-1; Mon, 12 Apr 2021 11:03:03 -0400
X-MC-Unique: N2jpBhHJMY2HZgOiJQFamw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2821283DD20;
        Mon, 12 Apr 2021 15:03:02 +0000 (UTC)
Received: from carbon (unknown [10.36.110.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B56855D6D1;
        Mon, 12 Apr 2021 15:02:57 +0000 (UTC)
Date:   Mon, 12 Apr 2021 17:02:56 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Federico Parola <federico.parola@polito.it>,
        =?UTF-8?B?QmrDtnJuIFQ=?= =?UTF-8?B?w7ZwZWw=?= 
        <bjorn.topel@gmail.com>
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org
Subject: Re: XDP redirect max rate on Intel XL710
Message-ID: <20210412170256.4a62fea1@carbon>
In-Reply-To: <8f897fd2-5ac1-a86f-2db1-6c4a45e144ad@polito.it>
References: <8f897fd2-5ac1-a86f-2db1-6c4a45e144ad@polito.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 12 Apr 2021 15:48:10 +0200
Federico Parola <federico.parola@polito.it> wrote:

> Hello everybody,
> when I redirect packets between two ports of an Intel XL710 40Gb card=20
> (e.g. with the xdp_redirect_map example fo the kernel) I can not achieve=
=20
> throughputs higher than ~31 Mpps.
> This NIC is not able to reach the theoretical ~60 Mpps with small

1/(84*8)*40*10^9 =3D 59,523,810 pps

> packets ([1] p. 23) but with DPDK I'm able to achieve ~40 Mpps with the=20
> testpmd application and 2 cores.

Lets calculate the processing or arrival rate per packet (or between
packets arriving).

 31 Mpps =3D 32.25 nanosec  (1/31*(10^9/10^6))
 40 Mpps =3D 25    nanosec
 Difference =3D 7.26 nanosec.

Thus, you only have to optimize XDP redirect with 7 nanosec to catch up
with DPDK.  Assuming a 4GHz CPU (7*4) you get 28 cycles more with DPDK
that I'm sure your application really needs and use with carefully ;-)

> In XDP when dropping packets I achieve more or less the same throughput=20
> with 3 cores, but I'm not able to exceed 31 Mpps when forwarding, no=20
> matter how many cores I use.
> I tried tuning the size of the RX/TX rings and the DDIO occupancy but=20
> with no success. I can scale with the number of cores more linearly but=20
> as soon as I reach the 31 threshold cores usage decreases and throughput=
=20
> remains the same.

If the CPU usage start do decrease (e.g. CPU gets idle cycles) then the
limitation is likely elsewhere, likely in the PCIe layer.  Or a limit
in the NIC hardware, but given DPDK is 7 nanosec faster then it might
not be the NIC hardware, but it could as DPDK could have disabled some
flow-dissector HW feature.  It can also be that XDP/kernel is doing more
PCIe operations than DPDK.

> I don't know if this is just related to my setup or my specific NIC (I=20
> exprimented on kernels 5.11 and 5.9), does anybody know what the reason=20
> could be?

Bj=C3=B8rn have recently optimized the kernel XDP redirect code path with
around 3-4 nanosec.  You can try with net-next kernel (Bj=C3=B8rn correct me
if this isn't true).

In your userspace AF_XDP application also make sure you don't use these
28 cycles / 7 nanosec for something that the DPDK testpmd doesn't.

=20
> [1]=20
> https://www.google.com/url?sa=3Dt&rct=3Dj&q=3D&esrc=3Ds&source=3Dweb&cd=
=3D&ved=3D2ahUKEwicv__o6_jvAhWUwQIHHQtpBu8QFjABegQIBhAD&url=3Dhttps%3A%2F%2=
Fwww.intel.com%2Fcontent%2Fdam%2Fwww%2Fpublic%2Fus%2Fen%2Fdocuments%2Fspeci=
fication-updates%2Fxl710-10-40-controller-spec-update.pdf&usg=3DAOvVaw27anC=
uRwRX25h8Dg3epgoy
>=20



--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

