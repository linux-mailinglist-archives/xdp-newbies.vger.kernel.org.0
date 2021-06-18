Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AB03AD15C
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Jun 2021 19:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbhFRRmg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Jun 2021 13:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20708 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231685AbhFRRmg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Jun 2021 13:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624038026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LwXaB8eXeFD329hf2lWBjatpw82yUj3QxWdizonx3Ds=;
        b=V+Wc/ow+qU2Vhz+ttnfTLI7lEEthCENasuL7RiRkRuFwR/+k1nRz+wmMZnpGW7wG5ABv4f
        EdullheiQa6a1IznnYvNKdnJuEQjHKNxuWFQq0KmtNXu5Ej3VHo/IbHD0LEWLAeWrm150I
        eoFqGvoBzD+X4ME7kRjDmscNGkmHvlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-mnunWl5vPyiv_ghh7KiBCw-1; Fri, 18 Jun 2021 13:40:25 -0400
X-MC-Unique: mnunWl5vPyiv_ghh7KiBCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C18B4800685;
        Fri, 18 Jun 2021 17:40:23 +0000 (UTC)
Received: from carbon (unknown [10.36.110.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A2374604CF;
        Fri, 18 Jun 2021 17:40:19 +0000 (UTC)
Date:   Fri, 18 Jun 2021 19:40:17 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc:     brouer@redhat.com,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Newbie questions
Message-ID: <20210618194007.4dfb838b@carbon>
In-Reply-To: <20210618133106.01f2129b@babalu>
References: <20210618133106.01f2129b@babalu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 18 Jun 2021 13:31:06 -0300
"Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:

> Hi All.
> 
> I've been doing some home work reading the docs and some doubts have raised.
> For reference, my environment is 
> 	Ubuntu 20.04
> 	kernel 5.4.0-66 
> 	tc utility, iproute2-ss200127.
> 
> 1) https://xdp-project.net/areas/cpumap.html#cpumap--Create-script-MQ-HTB-silo-setup says that: 
> 	"XPS (Transmit Packet Steering) will take precedence over any changes to 
> 	skb->queue_mapping. You need to disable *XDP* via mask=00 in files 
> 	/sys/class/net/DEV/queues/tx-*/xps_cpus"
> 
> Shouldn't it say I need to disable *XPS* (not XDP) using mask=00??

You are absolutely right it is a typo. Can I ask you to fix that and
send a GitHub PR?

The file you need to change is:
 https://github.com/xdp-project/xdp-project/blob/master/areas/cpumap.org

 
> 2) Taking tc_mq_htb_setup_example.sh as reference, how to enable XDP?

XDP gets enabled when you load an XDP program.

> Since I have to disable XPS, I assume I have to enable something in
> replacement, right?

No, XPS is just a kernel feature you need to disable, because it
conflicts with the TC-BPF program usage of skb->queue_mapping.


> How to set that CPU-0 will deal with mq queue 7FFF:1, CPU-1 will deal
> with 7FFF:2, and so on?

That is the role of the XDP program that redirect into a cpumap, and
the key in the cpumap is the CPU number.

 
> 3) Is XDP available in kernel 5.4.0 ?

I think so.

The real question is what NIC card drivers are you using?


> 4) Is XPS a suitable "substitute" for XDP ?

XPS and XDP are completely unrelated kernel features.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

