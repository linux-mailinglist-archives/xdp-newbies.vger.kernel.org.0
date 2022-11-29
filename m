Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E37663C0FA
	for <lists+xdp-newbies@lfdr.de>; Tue, 29 Nov 2022 14:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiK2NZg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 29 Nov 2022 08:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiK2NZg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 29 Nov 2022 08:25:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A293627CB
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Nov 2022 05:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669728279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GufdHo4UHzRJQXqwjS7UF++voPULYPiiHOq/D2P59Ok=;
        b=WX2F3hk6ybIAlslAfojCVu8ldOGrPQViWQznLZNmPG1l17kvfC73MZSIEGA2nTknet1Vl8
        OSLve9uljRUIj8Bu5APgls7C8iVO+MaMTzxd1q7GhaTZrp3Fi7RvhrMZBydTqsLxgWhvax
        OMnqJJ2vB0xiN7k9RQmIH8QfS9Abubs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-Nql6DCreMMe1GWwlxvwmBg-1; Tue, 29 Nov 2022 08:24:38 -0500
X-MC-Unique: Nql6DCreMMe1GWwlxvwmBg-1
Received: by mail-ed1-f69.google.com with SMTP id j11-20020aa7c40b000000b0046b45e2ff83so2813399edq.12
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Nov 2022 05:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GufdHo4UHzRJQXqwjS7UF++voPULYPiiHOq/D2P59Ok=;
        b=kyOVzEQg4nJczK6FPkfrSGW4BWeSN9yMmFDyJkIMX0CGxy7lih0u33BLDgzvgbSluX
         drVV/aS+lIo9veQ1sIh0lD/FCQyp8u0/DfYYOjgKQBs6sDh373ryZjv8fO6Gt1tef/G7
         dHPcKBUcES0HvADkDs0ReJLAVRM7F8IL4Wq2WeRlY4lXt+Yqeg4BtNzBvNhRJ58GZHMx
         ceGdaMHJcFGpnvvRiS8RMaAwtI2ajLG1je5ot9qfkPZXyXRlgPNWWnc3DPf7v9RAQTCy
         DGrRhI5e8Vr7lSR5UD7pMgYHX9ZhJFzrz5DGI+daqpVNHoF+wdYu9RT76/oynIM83zf8
         OoXw==
X-Gm-Message-State: ANoB5pkos3tiJ7kFL1bgKxAuL6sTEbcK9/kfXCys7HuxmxWdUuVdmS41
        +FVxath7m2TlWNm+A/Q3qxRkR59qRafouN6RewMze1M53irTRmTnq6TSwkLbPrtHtFopwYcSZm9
        O0VYseIdPd6gvzGbesTvXKMU=
X-Received: by 2002:a17:906:3b4c:b0:7c0:8223:e66b with SMTP id h12-20020a1709063b4c00b007c08223e66bmr4213008ejf.705.1669728276350;
        Tue, 29 Nov 2022 05:24:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ZAlnBppaoT12rkk3c77tmn22qKYZNu+7h0jowIYEYgWB3csKEFsLa3c3eUv2RHb2xg8NJeA==
X-Received: by 2002:a17:906:3b4c:b0:7c0:8223:e66b with SMTP id h12-20020a1709063b4c00b007c08223e66bmr4212884ejf.705.1669728274105;
        Tue, 29 Nov 2022 05:24:34 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906293200b00734bfab4d59sm6226254ejd.170.2022.11.29.05.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 05:24:33 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D796780ABC8; Tue, 29 Nov 2022 14:24:32 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Henning Fehrmann <henning.fehrmann@aei.mpg.de>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: make XDP program aware of multi buffer
In-Reply-To: <Y4X3u39irCVmVxZx@mephisto.aei.uni-hannover.de>
References: <Y4X3u39irCVmVxZx@mephisto.aei.uni-hannover.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 29 Nov 2022 14:24:32 +0100
Message-ID: <87cz95zyen.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Henning Fehrmann <henning.fehrmann@aei.mpg.de> writes:

> Hello,
>
> we use XDP/BPF programs to redirect and record network data.
> We run the 6.0.9 vanilla kernel with the delivered Mellanox driver.
> We mounted MT28800 NICs.
>
> As this scheme seems to work reliably we'd like to step forward and
> enable multi buffer packets. We get the following message from the driver:
>
> mlx5_core 0000:01:00.0 enp1s0f0np0: XDP is not allowed with striding RQ and MTU(9000) > 3498
>
> We turned striding off and now we get:
>
> mlx5_core 0000:01:00.0 enp1s0f0np0: MTU(9000) > 3498, too big for an XDP program not aware of multi buffer
>
> It seems that we have to make the XDP program aware of multi buffer.
> What would be the correct way to do it?

You just replace:

SEC("xdp")

with

SEC("xdp.frags")

in your source file and, assuming your libbpf version is up-to-date,
that should be it as far as the kernel is concerned.

However, you obviously also need to make sure there are no semantic
issues in your program before doing this. I.e., data_end is no longer
the end of your packet, so if you are using data_end-data to calculate
the packet len, that will no longer be accurate. If you need to access
data beyond the first frag you'll need to use the
xdp_{load,store}_bytes() helpers.

Note that if you're using libxdp you also need to wait for this to be
resolved: https://github.com/xdp-project/xdp-tools/issues/235 - I'm
halfway through a fix for it, so hopefully that should land before too
long.

-Toke

