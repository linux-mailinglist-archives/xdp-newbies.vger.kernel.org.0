Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647751BBB27
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Apr 2020 12:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgD1KY1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Apr 2020 06:24:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38684 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727105AbgD1KY0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Apr 2020 06:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588069464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F+cwub0o59VgQ+OqNb19J8sEeWo/pJ00MhghsTEftWU=;
        b=gSwfwcSJBbtk62hpSeyF++fIvo8kPni96AtyUATk8jF8251ZuFLQ4QCFOb6Mwg9BFyG7DG
        hud4i08taUA5WKMUnxbsiQHA6jvgzguqf3b9MtrevUyRZYXMPP3EC36rYpQmDJ0oRenF0c
        HZ/prDfLBKw5d+OElOMjE66iauPlL64=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-F-hwwA1NPECmb0qCeksoVA-1; Tue, 28 Apr 2020 06:24:18 -0400
X-MC-Unique: F-hwwA1NPECmb0qCeksoVA-1
Received: by mail-lf1-f71.google.com with SMTP id g5so8746614lfh.9
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 03:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=F+cwub0o59VgQ+OqNb19J8sEeWo/pJ00MhghsTEftWU=;
        b=Ho1YrhUBDXaoOXokyF0jzL1oQSbzKlCkhl7S9Q/Uw8Pc3gvmimCc0GNH4m2MGM8TlF
         qLjPHxuQABT7LktZiKPW4kgxVvTyc42K5OPmVOYyk/SRO1xyTqSdmTAxky1512gR+9oU
         Bl5IyG6gnk+MSptDPU9sxTMB4KDck41IIk0RRfiH7QaweOpg5qgon6VLKxPYzxPYiUMw
         SyDWg30wW+D7stor3LtQ2D7uWzz6VVhqdzPF6FRFvhPUujbdGRLG4DscXjPITnR3tDFq
         dVHscscK4Ddzjzbh3VCuOE2quWZltA3RSllnNQ+HmZAplqmT3IA/aEuTjNXiNmFAjdB/
         YmwQ==
X-Gm-Message-State: AGi0PuZGrKU8KcnAnfCrUbQ0MoGbpr+juhWMPbko9mAUJ3KE0CqvyyTv
        ZOS/KHDPNPK4Urauq5vRMaYyR0NAdJ8y5bR+q+aXAX/+yyddiuHbipbozXORi7oCxCNUFYbtB7Y
        20n79dsg0IG9nNEsm9F+Y2JQ=
X-Received: by 2002:a05:6512:1046:: with SMTP id c6mr18529341lfb.115.1588069455839;
        Tue, 28 Apr 2020 03:24:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypKmAx+OY02+hejkyIX71HIv+FDsxjFsgNeyjokbWFQgyrZ/qdPAamkEkybp5c0bVaqhKRjMxQ==
X-Received: by 2002:a05:6512:1046:: with SMTP id c6mr18529332lfb.115.1588069455607;
        Tue, 28 Apr 2020 03:24:15 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id d23sm13739324ljg.90.2020.04.28.03.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 03:24:15 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 5592F1814FF; Tue, 28 Apr 2020 12:24:14 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Phu Tran <phu.tran@futurewei.com>,
        "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Difference in TCP throughput in comparison to OVS
In-Reply-To: <BF562847-15D5-471F-8A50-FC38BE92D505@futurewei.com>
References: <BF562847-15D5-471F-8A50-FC38BE92D505@futurewei.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 28 Apr 2020 12:24:14 +0200
Message-ID: <87ees7x60h.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Phu Tran <phu.tran@futurewei.com> writes:

> Hi,
>
> Following the XDP tutorial on GitHub, we ran some tests comparing the set=
up from
> the =E2=80=9Credirecting packets=E2=80=9D section and a basic OVS setup.
> (Specifically packet03-redirecting/Assignment3: Extend to a bidirectional=
 router)
>
> In our test, we collected the numbers below.
> For the OVS setup. we saw TCP throughput at around 90 Gbits/sec.
> For the XDP setup, we saw TCP throughput at around 9 Gbits/sec.
>
> On the OVS side we had the following
> - Two veth devices each assigned to their own unique network namespace.
> - Both veth devices added to an ovs-bridge.
> - iperf2 between the two veth devices.
>
> Similarly, for the XDP setup, we followed the instructions from packet03-=
redirecting/Assignment3.
> Differences highlighted below:
> - We had to disable rx and tx checksumming to get TCP to work.
> - ethtool --offload veth0 rx off tx off
> - We disabled BPF tracing.
> - iperf2 between the two veth devices.
>
> Questions:
> 1. Why is there a TCP throughput difference between these two setups?

Likely because of the lack of HW checksumming (as you've already
noticed), and TSO (XDP doesn't support superpackets). There's ongoing
work to fix this, though. For large packets, the first step is this
series: https://lore.kernel.org/bpf/87eesd3rvu.fsf@toke.dk/T/ - but a
few more bits are needed before we get all the way to TSO.

> 2. Why do we need to disable rx and tx checksumming?

Because XDP doesn't support it :)

Again, 'yet'. We do want to support this eventually; it's noted here:
https://xdp-project.net/#Metadata-from-hardware

-Toke

