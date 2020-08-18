Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2CD248298
	for <lists+xdp-newbies@lfdr.de>; Tue, 18 Aug 2020 12:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgHRKK1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 18 Aug 2020 06:10:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24186 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726374AbgHRKK0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 18 Aug 2020 06:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597745425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NQvvdnxU5fpoLc0Jbfyq1tMG6TiEis1/FVA0zxot3aI=;
        b=KgwWj36A5TaXJjQRytWlN+G1xr3eH4Yw2RRLoHXVlGZE51kFpvcYw9WbDNJv7Xb0n320p6
        QXMJm3r3ZrH/YnSWoIFchh6S8+q6890p4NGVtp1BB5TV/s9eibN0wyBE48kWii1t1MDocM
        YO+fBOr+SGxqRZw/fmPCSMHKWzdco74=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-KDcPJS7vNaGTkcQqDgeFuA-1; Tue, 18 Aug 2020 06:10:23 -0400
X-MC-Unique: KDcPJS7vNaGTkcQqDgeFuA-1
Received: by mail-wm1-f71.google.com with SMTP id d22so7217561wmd.2
        for <xdp-newbies@vger.kernel.org>; Tue, 18 Aug 2020 03:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=NQvvdnxU5fpoLc0Jbfyq1tMG6TiEis1/FVA0zxot3aI=;
        b=Gs5wBjpihp1yNJ++BF49BLBdESQeKccsLvhfab8FqigS2NkThfdTrwE2Om5eO+U3iU
         9aKOe+ChEsD9HlPJbT2aumLqV3HhxpT5MkCrtModabisbu/koPn4QXiQ7ln9AofIb81g
         z9rQ5mg7yB2f1O05IdT0r4+YOk6NYveT0IGYkUZpZVgKNwsC1URvUBeJHwSgmql9bLCA
         FN56AMQHlQCZ+klApg88WQcRvJ/A68e0Y5KHTJYmdWAcrg1ljrivktGt97n58FFRBs6l
         W6mTgnSYvtcnvmr+3w7IW8wIUmPRFEYvv92DyLtI0EmUufEcLc5vEsBVwdKGETFJLtgm
         yVEA==
X-Gm-Message-State: AOAM533vKkpEFxBTQ8LWj7A6cuexAcim1E6+/ZA4CIAxT6v6mSXozbKA
        +skFkXtB5XauM1340UWDp3TdJeINyY6JeRCqE1ftziSNvuuzJbMIWDWvIYwo8krE7oLURBTLcKc
        NBvTKcfxBh9R6Oz/KeNFqhoI=
X-Received: by 2002:a7b:c095:: with SMTP id r21mr20004713wmh.152.1597745419119;
        Tue, 18 Aug 2020 03:10:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb5R/ihwDoc9xD5fdAMEuYlAXFTZX9Z7StbGVaAqt6/C4kCsPB8shp11DVcf9wY4cqgKoKJw==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr20004690wmh.152.1597745418880;
        Tue, 18 Aug 2020 03:10:18 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id i14sm41200696wrc.19.2020.08.18.03.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 03:10:18 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id DA0731825D2; Tue, 18 Aug 2020 12:10:16 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     =?utf-8?Q?Michael_A=2E_Fl=C3=BCckiger?= <fmichael@student.ethz.ch>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP and AF_XDP
In-Reply-To: <44904e04-b9f5-0e9e-9b67-8ccfeded852e@student.ethz.ch>
References: <44904e04-b9f5-0e9e-9b67-8ccfeded852e@student.ethz.ch>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 18 Aug 2020 12:10:16 +0200
Message-ID: <87lficuuwn.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Michael A. Fl=C3=BCckiger <fmichael@student.ethz.ch> writes:

> Hi all
>
> I've recently discovered XDP / AF_XDP, and I now familiarize myself with=
=20
> the very interesting technology. Two questions came up, and I'm sure=20
> that the XDP community will be able to answer them a lot faster than if=20
> I search for documents in the www jungle.. :)
>
> - An user land application is able to read and process incoming data=20
> directly from the AF_XDP socket. I'm wondering what happens when an=20
> application writes data into the AF_XDP socket? Are these frames=20
> directly sent out on the respective network interface?

You can send packets from AF_XDP as well, but it's not a regular socket.
Please see the documentation here:
https://www.kernel.org/doc/html/latest/networking/af_xdp.html

> - Whats the current status on XDP support on TX? Is it possible to=20
> intercept the TX queue (outgoing packets) or is still "just" the=20
> processing of incoming packets possible? Where could I find documents=20
> covering such updates?

There's no 'XDP TX' hook, but there are a few other options: When
redirecting packets via the bpf_redirect_map() helper, you can attach a
second XDP program to the map entries, which gives you a "post-redirect"
hook that is tied to the destination. This is analogous to an XDP hook
on TX, but only for packets that were redirected from XDP.

For packets coming from the regular networking stack, you can use the TC
eBPF hook to modify traffic instead; it is possible to write eBPF
programs that can be reused across the XDP and TC hooks (basically, by
putting the logic in a function that you call from a small wrapper
function in each hook type).

-Toke

