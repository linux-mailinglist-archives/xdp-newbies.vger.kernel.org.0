Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F02994EEC75
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Apr 2022 13:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244619AbiDALk4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 1 Apr 2022 07:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236414AbiDALkz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 1 Apr 2022 07:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EC6939838
        for <xdp-newbies@vger.kernel.org>; Fri,  1 Apr 2022 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648813144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Tbc6IAqcM69cRobA2xIvPAuYCf0Lh4lpx8f9tQRIgzU=;
        b=OUV2BlVO9u0Yj1LzE9u4COp+7/knmBFdxH+SATz4wwsJCDzZBIiTJ373O+aaFUyGJXYLzG
        Rt+mH2uliim/IJtoo+oX1cL9GE3ZPF9DAroelqv3XJLAeAhzJh8cJmZb11JvkKPukgHuEb
        tO4yu05lcbExbua4EyJPnkLYyRj/4Ok=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-eT1M1WxdPAawElTPHugz1g-1; Fri, 01 Apr 2022 07:39:03 -0400
X-MC-Unique: eT1M1WxdPAawElTPHugz1g-1
Received: by mail-ed1-f69.google.com with SMTP id f2-20020a50d542000000b00418ed3d95d8so1378410edj.11
        for <xdp-newbies@vger.kernel.org>; Fri, 01 Apr 2022 04:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Tbc6IAqcM69cRobA2xIvPAuYCf0Lh4lpx8f9tQRIgzU=;
        b=HCLPHD4L17IQIoRSHnq/oqAjtkE+S0cf9opRCl8kvbBL/tF2K1vkXevTEcvpPliq8l
         WXwb0HNEOS2XfK1tXpLCYPrWXDP6019RJGsahj6t+LdUY+1N87NlzZuZ6k6jVXDM44p7
         kE0+tMN6EN4s2iw8DrgSd8VlVMhHvXzFIJr4fdNtbsJCLyOc8RNw57iumVsEbntjlJSN
         Wj9Mx91FpwdH02lqg6MOTAYoqErB+Nz/qoqR4ut9Uf0IuP3qyFMcH3D46j6O4Y8KGEiW
         JitGtc/8NMhfen3t1Y5u1k41DDo65qdlYk8xohE5l7RSceWYI46UQ0v9tv6MVBiVBMc7
         s+mA==
X-Gm-Message-State: AOAM533OSo7MfGJVdXQYZbgPA/FpYUyrJU3r1SpRnO/vgPTCAyMd6xA/
        D5nF5daA8qflORHUciKsxe1Q7U9/Tt7i9LGrAWQ8+zg2p9hV0VOu8ahoKHMIv99kKp5HTdAWWR5
        4YBeONQNeY0CDwMHigvC4DoU=
X-Received: by 2002:a17:907:3e94:b0:6d1:d64e:3141 with SMTP id hs20-20020a1709073e9400b006d1d64e3141mr8621745ejc.213.1648813141782;
        Fri, 01 Apr 2022 04:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzndvuPtpuadOGwSsnYa/aPdg3STO0iS3sTshQTypRfUjkikz5f14nPG2OfbtGNrYbm0qbylw==
X-Received: by 2002:a17:907:3e94:b0:6d1:d64e:3141 with SMTP id hs20-20020a1709073e9400b006d1d64e3141mr8621718ejc.213.1648813141407;
        Fri, 01 Apr 2022 04:39:01 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id x12-20020aa7d6cc000000b00419812ecd2csm1056225edr.74.2022.04.01.04.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 04:39:00 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 4B6AF2588E3; Fri,  1 Apr 2022 13:39:00 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Kal Cutter Conley <kal.conley@dectris.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Cc:     Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: XDP multi-buffer and AF_XDP
In-Reply-To: <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 01 Apr 2022 13:39:00 +0200
Message-ID: <87wng9f2y3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Kal Cutter Conley <kal.conley@dectris.com> writes:

>>
>> Hi,
>> We are very interested in receiving jumbo frames (> 8000 bytes) over
>> AF_XDP. Does XDP multi-buffer support XDP_REDIRECT with AF_XDP? What
>> about in zero-copy mode?
>>
>> Cheers,
>> Kal
>
> Looking into this more I found this comment in the mlx5 driver:
>
> /* Don't enable multi buffer on XDP_REDIRECT SQ, as it's not yet
> * supported by upstream, and there is no defined trigger to allow
> * transmitting redirected multi-buffer frames.
> */
>
> So at least mlx5 does not yet support XDP multi-buffer with
> XDP_REDIRECT. What "upstream" support is required to get XDP_REDIRECT
> to work with XSKs?

Well, the initial patch set for multibuf explicitly blocked XDP_REDIRECT
between interfaces, which is what that comment is referring to (the TX
side).

For AF_XDP we'd also need to define the UAPI, and maybe add a socket
flag so the userspace program can signal to the kernel that it
understands it? Not sure about the details.

You're definitely not the only person who wants this, though; adding in
some people who may have a better idea of the exact steps needed.

-Toke

