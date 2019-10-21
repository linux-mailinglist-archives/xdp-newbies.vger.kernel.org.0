Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEC2DE2DF
	for <lists+xdp-newbies@lfdr.de>; Mon, 21 Oct 2019 06:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbfJUEE7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Oct 2019 00:04:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53714 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725468AbfJUEE7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Oct 2019 00:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571630696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iPPMjIxBJv5Bh6S7lcFQMBNOO5Ks02aK4S9zt1+zGpk=;
        b=MBf7Z+P4bxYUzZIO47KoLyGZNqFuIPgbPn4EW7kzpKaXA+Sq8hI4WcQvGMzSxX98+Fy48i
        4s6NcrFD/midO8vtOARt3b36ePTfP3d2WZImQUKcRl6d4RkGbRDfTy2AFpV0/ve/KEs7Dc
        w/qawGv9LJ8QzH6AANRNDIAXOwTGTlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-2TDnT-FiMoKUADUsI9vGwQ-1; Mon, 21 Oct 2019 00:04:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEADD800D49;
        Mon, 21 Oct 2019 04:04:53 +0000 (UTC)
Received: from carbon (ovpn-200-16.brq.redhat.com [10.40.200.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AAC5260BE2;
        Mon, 21 Oct 2019 04:04:47 +0000 (UTC)
Date:   Mon, 21 Oct 2019 06:04:44 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Zvi Effron <zeffron@riotgames.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, brouer@redhat.com
Subject: Re: How to debug XDP_REDIRECT errors
Message-ID: <20191021060444.297a7886@carbon>
In-Reply-To: <CAC1LvL3efhuf8dc-aQKepMND24drwVAHAzVs-4Np4CUTV8qOgQ@mail.gmail.com>
References: <CAC1LvL3efhuf8dc-aQKepMND24drwVAHAzVs-4Np4CUTV8qOgQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2TDnT-FiMoKUADUsI9vGwQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, 20 Oct 2019 16:07:13 -0500
Zvi Effron <zeffron@riotgames.com> wrote:

> Hello,
>=20
> I'm trying to get some additional performance out of XDP on the i40e
> driver (under kernel 5.0.7, Fedora 28) by adjusting the queues to be
> one per desired core. I have several cores isolated for network
> traffic, so I'm adjusting the queues to be one per isolated core (with
> IRQ adjustments to match) as opposed to the default of one per online
> core. I've noticed that when I adjust the number of queues down, I see
> packet loss proportional to the number of queues missing. For example,
> if I drop the queues from the default of 36 down to 34, I see ~6%
> packet loss.
>=20
> Using the trace_pipe, I've managed to confirm that my program is
> successfully calling bpf_redirect_map() for all of the packet (no
> losst). I found the xdp_monitor tutorial[1] and ran it, and it shows
> the loss showing up as XDP_REDIRECT errors (which I believe means the
> raw_tracepoint xdp:xdp_redirect_map_err).

I usually use standard perf-record:

 $ perf record -e xdp:xdp_redirect_map_err sleep 1

And then look at detailed results with:

 $ perf script

As this is a standard tracepoint, you can lookup docs for howto use
tracepoints.  To debug closer you likely want to extract other info,
and maybe aggregate.  I will recommend looking closer at bpftrace
tool[2].

[2] https://github.com/iovisor/bpftrace/blob/master/docs/tutorial_one_liner=
s.md


> At this point, I'm a bit stuck on how to proceed further to determine
> what is causing the redirect error and where the packet is being
> dropped.
>=20
> Any help in pointing me in the right direction for debugging
> techniques would be greatly appreciated.
>
> Thanks!
> --Zvi
>=20
> [1]: https://github.com/xdp-project/xdp-tutorial/blob/master/tracing02-xd=
p-monitor



--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

