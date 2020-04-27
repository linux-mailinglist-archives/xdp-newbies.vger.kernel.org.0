Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1035D1BA0B7
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 Apr 2020 12:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgD0KDt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Apr 2020 06:03:49 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22614 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726243AbgD0KDs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Apr 2020 06:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587981827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JhzniwgNhTYmgURhNwjyH3hxTWsQ6s8FrNmCTHSo5Zk=;
        b=MBjgmSCzHK/YDrKk67en0tr2EgJmPIeA2gdq4EH0ORob1mizPyY9gQxytbfqse77LcASQ2
        jv5okc6acQdAC6fWTkFVW/fuA8xDpj9LOXag2vzIbpIaRmidBdgIUlHII6b2qDK9OcFQ4P
        2nJTxO1JRPJZ7k/QuiKo+X4M0BpJb/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-Mc0A4ENMM_ObfRobTW9OGg-1; Mon, 27 Apr 2020 06:03:43 -0400
X-MC-Unique: Mc0A4ENMM_ObfRobTW9OGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C9B9BFC1;
        Mon, 27 Apr 2020 10:03:42 +0000 (UTC)
Received: from carbon (unknown [10.40.208.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 062AF60C84;
        Mon, 27 Apr 2020 10:03:35 +0000 (UTC)
Date:   Mon, 27 Apr 2020 12:03:33 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Sowmini Varadhan <sowmini05@gmail.com>
Cc:     brouer@redhat.com,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Subject: Re: building eBPF
Message-ID: <20200427120333.7e6cedfc@carbon>
In-Reply-To: <20200427002027.GE488@gmail.com>
References: <20200425122225.GA455@gmail.com>
        <20200425145619.4405a50d@carbon>
        <20200427002027.GE488@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, 26 Apr 2020 20:20:27 -0400
Sowmini Varadhan <sowmini05@gmail.com> wrote:

> With the latest iproute2 (built from master, 'ip -V' reports
> iproute2-ss200330) when I try to run tc_l2_redirect.sh
> I get errors like the following. What am I missing?

The iproute2 BPF-loader does not support BTF.  I think upstream agrees
that it would be too much work to add (and maintain) it, so the current
plan[1] is to convert iproute2 to use libbpf instead.

Also notice that BPF-map layout is not compatible with libbpf.  Thus,
yet another hint not to use iproute2 to load XDP programs. (Toke have
done some initial work with libbpf maps, that will allow us AFAIK to be
backward compatible when converting iproute2 to libbpf).

Why do you want to use 'tc' to load XDP?


The XDP-tutorial[2] shows how to use libbpf from your C-programs, and
XDP-tools[3] contains a xdp-loader that you can use instead.

[1] https://xdp-project.net/#Port-iproute2-to-libbpf
[2] https://github.com/xdp-project/xdp-tutorial
[3] https://github.com/xdp-project/xdp-tools/tree/master/xdp-loader


> (full transcript of output from run is in the run.out attachment)
> 
>   :
> + tc filter add dev ve2 ingress bpf da obj ./tc_l2_redirect_kern.o sec l2_to_iptun_ingress_forward
> 
> BTF debug data section '.BTF' rejected: Invalid argument (22)!
>  - Length:       3554

I actually think this is only a warning, and the program is actually
loaded...

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

