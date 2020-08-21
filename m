Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5482F24D1D5
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Aug 2020 11:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgHUJ5E (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Aug 2020 05:57:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39778 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725855AbgHUJ5D (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Aug 2020 05:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598003821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=889JLFRqGE5epjsKJsBvNT8BrURcTQVPOCZJgDs+rho=;
        b=BUnY36rGn8Y2aj04j3fX4QOsS6kYAP9k7Fsw75I2VVIOCjyARTTTrZCEL5o/+S8OB5+CTS
        1pmbokp1WXfTpxGCi5NrtXcTD/rOPGUCfAA/MPHKHneaykICuoGS9nhzziKuLjjlmuLd58
        X1NuIQSs9BHe1NyCLFmY+6xl3hyHLSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-3t_t9JHhNiCfa9it8nAdnA-1; Fri, 21 Aug 2020 05:56:26 -0400
X-MC-Unique: 3t_t9JHhNiCfa9it8nAdnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB3391006706;
        Fri, 21 Aug 2020 09:56:24 +0000 (UTC)
Received: from carbon (unknown [10.40.208.64])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 188437E31B;
        Fri, 21 Aug 2020 09:56:16 +0000 (UTC)
Date:   Fri, 21 Aug 2020 11:56:14 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     brouer@redhat.com, David Ahern <dsahern@kernel.org>,
        Anton Protopopov <aspsk2@gmail.com>
Subject: Using XDP for Cloud VMs by David Ahern
Message-ID: <20200821115614.40fa7eb0@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi XDP-newbies and cloud-providers,

I want to promote the recent excellent work by David Ahern (maintainer of
several kernel networking components). Ahern explains in detail how to use
XDP for lowering CPU usage (and increasing performance) on the host machine
running the Cloud VMs.  Making it more efficient for a cloud provider.

Ahern is explaining and calling for collaboration at many levels. (Note
[xxx] brackets indicate link below). His [Talk#1] at NetDevConf have not
been released on [YouTube] yet, but [Slides] are available. In [Blogpost#2]
you can see the results for XDP vs OVS, and to understand how CPU-overhead
is measured read [Blogpost#1]. He have even released the [Code] on GitHub,
and encourage people to reproduce his results.

I encourage other cloud providers to collaborate with Ahern. XDP is a core
kernel building block, but we need to create FOSS projects that explore
different use-case (e.g xdp-cloud-provider). XDP is still early days, and as
Ahern already discovered, trying out this Cloud-VMs use-case have identified
several gotchas and missing XDP features that we should work on
adding/fixing in upstream kernels.

 --
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

Links:

[Talk#1] XDP and the cloud: Using XDP on hosts and VMs
 https://netdevconf.info/0x14/session.html?tutorial-XDP-and-the-cloud

[Slides]
 https://github.com/dsahern/bpf-progs/blob/master/docs/netdev-0x14-XDP-and-the-cloud.pdf
 https://github.com/dsahern/bpf-progs/raw/master/docs/netdev-0x14-XDP-and-the-cloud.pdf

[Code] https://github.com/dsahern/bpf-progs

[Blogpost#2]: XDP vs OVS
 https://people.kernel.org/dsahern/xdp-vs-ovs

[Blogpost#1]: The CPU Cost of Networking on a Host
 https://people.kernel.org/dsahern/the-cpu-cost-of-networking-on-a-host

[Talk#2] XDP Workshop
 https://netdevconf.info/0x14/session.html?workshop-XDP

[NetDevConf]: https://netdevconf.info/0x14/
[YouTube]: https://www.youtube.com/channel/UCribHdOMgiD5R3OUDgx2qTg/videos

