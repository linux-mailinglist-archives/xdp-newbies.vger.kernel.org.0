Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131AA78E9B7
	for <lists+xdp-newbies@lfdr.de>; Thu, 31 Aug 2023 11:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343601AbjHaJoE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 31 Aug 2023 05:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343672AbjHaJn6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 31 Aug 2023 05:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258D0CF3
        for <xdp-newbies@vger.kernel.org>; Thu, 31 Aug 2023 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693474987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BnXGZYR/WSJ3bOx7Da1jU9wAwk0OIQrHvdk5BRS0vUw=;
        b=d+2xu8HIl39N2YUWOrLo0GCtdGKaRjVDRaSPGZ1d+tBK+nuTPrRtzryDiCOmuzk7Osy3pA
        xfgVdfpMt7v3b5SFQ4v2a4XYly8keL612G2FSownrWETT9mRpwWpRBPSNPhbR+VeLCYTW4
        /var4FzYei17FQVOlTUA2wr3/UebJD4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-VfnUGtMzOUeT1rPw9mxixQ-1; Thu, 31 Aug 2023 05:43:05 -0400
X-MC-Unique: VfnUGtMzOUeT1rPw9mxixQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-52a38baa269so468453a12.2
        for <xdp-newbies@vger.kernel.org>; Thu, 31 Aug 2023 02:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693474984; x=1694079784;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BnXGZYR/WSJ3bOx7Da1jU9wAwk0OIQrHvdk5BRS0vUw=;
        b=P1H6K9EMJMWKjq/T2THGjcue4SyY7/5u4TM6RSINXzywYyQGUITv/vAYcpj4qmfsPn
         JUeFERwk1jbuE/UrEYcJhV8XnDySwvi0hJPVT7gkzBHUFO3ldU5j/GYrS5/jNSEiYV9K
         lZIN7gvSbk3dh/duBWudKjQkqWOX5EIpvLA2bmhjLoVs4Do92el1QWYGv5znV9vgZ7I0
         71ItDminlJBKfkAJiJub2ZZ/YWyLshMit8HAfy03Xt+QE0Pu0Jg65CChbkDpgK16ihTU
         6GMZ2/igzZVMOjqrTeWYBWBgwQhPmujN60n3c3/sVA/kucWiDz0Pawq8SBsnk26PndWW
         Z6Sg==
X-Gm-Message-State: AOJu0Yy0AlwRfK+e65unHaj2kLyLOLq5N/yA3suXFf7nkoqC1GZPjcEs
        MvAHmI1veEg+DtR6ZQgLl5dbkovsIhnuS7vsIxir+WmfG6m+JZUCjDyrFVEoT7pABkJ6uFGs6Er
        3V45FWibngKm7uHGvi4i7t78=
X-Received: by 2002:aa7:c414:0:b0:51e:ed6:df38 with SMTP id j20-20020aa7c414000000b0051e0ed6df38mr3668862edq.13.1693474984403;
        Thu, 31 Aug 2023 02:43:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpjjaaEODnhPnbl0VyzQuQFzhmGc73dLaP83xqduBCpPVAFYCWCUV9UqjFk6Sq6Rv6h8DEcA==
X-Received: by 2002:aa7:c414:0:b0:51e:ed6:df38 with SMTP id j20-20020aa7c414000000b0051e0ed6df38mr3668852edq.13.1693474983971;
        Thu, 31 Aug 2023 02:43:03 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id x2-20020aa7dac2000000b005272523b162sm577620eds.69.2023.08.31.02.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 02:43:03 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0F8C2D8216D; Thu, 31 Aug 2023 11:43:03 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Rene Vrolijk <rrvrolijk@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: XDP use for data diodes
In-Reply-To: <0CF95803-5B47-4793-9FE4-F20F3312D075@gmail.com>
References: <0CF95803-5B47-4793-9FE4-F20F3312D075@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 31 Aug 2023 11:43:03 +0200
Message-ID: <878r9rv97c.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Rene Vrolijk <rrvrolijk@gmail.com> writes:

> Hi,
>
> I have a question about the use of XDP. A little warning upfront, i=E2=80=
=99m
> not a programmer or network manager so my question could be strange.
> Sorry for that.
>
> I created a Github to teach people about the basics of data diodes on
> https://github.com/vrolijk/osdd Via this git i explain student in 2
> hours the basics and how to to get their hands on a data diode,
> insight in UDP packetloss with normal operating systems, setup Ubuntu
> to use as a proxy and send data with three different use cases. All
> with publicly available hard and software and with complicated
> scripting.
>
> My (noob) question:
> There is a major issue when using Ubuntu and packetloss in the
> Linuxkernel. Is it possible to use XDP to prevent packetloss when
> sending data over an unidirectional connection between 2 Ubuntu
> machines via a data diode? Is it possible to help me (and the
> students) via an example how to configure this on the 2 machines?

While XDP can help alleviate some causes of packet loss, it is always
possible to overwhelm a receiver. And XDP is certainly not noob
friendly, so I'm not sure I'd recommend it as a tool for people who are
just starting out experimenting with network programming.

The XDP tutorial is probably still the best resource we have for getting
started with XDP, so I'd suggest you take a look at that:
https://github.com/xdp-project/xdp-tutorial

-Toke

