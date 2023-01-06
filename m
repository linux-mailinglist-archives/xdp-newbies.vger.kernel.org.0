Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC726600E5
	for <lists+xdp-newbies@lfdr.de>; Fri,  6 Jan 2023 14:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbjAFNBg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 6 Jan 2023 08:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234704AbjAFNBT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 6 Jan 2023 08:01:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307986F958
        for <xdp-newbies@vger.kernel.org>; Fri,  6 Jan 2023 05:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673010037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=I/nqiQg1O3VEjIezoapTkEfZWICI8ZrsoB9Bb7JM6rM=;
        b=IPn/DqyBwGx6Ah2OzbxOqAKFOiWBdD69o/GaXvRIk+6AJ8tAauJyxPLXPql9okAiY6hIID
        go5mYr45JvT6fMBj6/hoF0r1nsBgd5O4IGjTQRTNMJqRVq6Z7t8YIZGE2t3vdUnFFZYACQ
        Msfkjl8xuUgTIm0u2p8Fa0RhIJsDLic=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-vXQzVav_NcW4zZJMv2UDxQ-1; Fri, 06 Jan 2023 08:00:36 -0500
X-MC-Unique: vXQzVav_NcW4zZJMv2UDxQ-1
Received: by mail-ed1-f69.google.com with SMTP id s13-20020a056402520d00b0046c78433b54so1177987edd.16
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Jan 2023 05:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/nqiQg1O3VEjIezoapTkEfZWICI8ZrsoB9Bb7JM6rM=;
        b=j3+Fni6Topf/VgWcCJYOJMYj0M/F1hdhZefpRvAHX16PW+wSKcdFgBtHWRxpX8FvaK
         yHsRIbpmAcRx00C8ccsaRzTLGztMeK/awxKKr/1WPzZ2uyVf304jtV2kMfLUsqXStTKY
         +SbdoGiqnRrRLpCMlP9Zep5B2VxgeAHPpIDwJcF83Cy2K6SIrOEesjtZ5QLFZOVjbuJx
         IBLPCuCSmq+HUpS+TF9ql4jht4JeCH+s3jeoASGsC4HJTuIl7MvdEp395fq1IX7Koxqi
         h09bBkpKb7BVW5k+SUqwvv2i9o3dxTFijXmpr6jra7mLpFTx1KoILAL+2xBV+19ulqPl
         vh/w==
X-Gm-Message-State: AFqh2koy2y1Rj3lf1iTnz6N+5c0PSwoIJrWMAjtanDeFuIXcZmW1OuvU
        esifPrHF8RvgBBvi97wTvq4yGJjc2uLVoLImTbeJapQLDVAYgyb3YDI1vjM5PwL1Pj6FKq95Z2W
        Mo3JR/ttDtlzm/AvCxx3WAJE=
X-Received: by 2002:a05:6402:3706:b0:472:9af1:163f with SMTP id ek6-20020a056402370600b004729af1163fmr48924176edb.37.1673010034476;
        Fri, 06 Jan 2023 05:00:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvZHTzT+ZKzd13sug/2sfOC8boZIwhMJmPFtu2hAVjhjaDvG1j9kVazPlM9GyuhQ96rukTRpg==
X-Received: by 2002:a05:6402:3706:b0:472:9af1:163f with SMTP id ek6-20020a056402370600b004729af1163fmr48924162edb.37.1673010034083;
        Fri, 06 Jan 2023 05:00:34 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id bc25-20020a056402205900b0046b00a9eeb5sm481210edb.49.2023.01.06.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 05:00:33 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id CDF778DA0AF; Fri,  6 Jan 2023 14:00:32 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     team lnx <teamlnxi8@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Pause and unpause queue
In-Reply-To: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 06 Jan 2023 14:00:32 +0100
Message-ID: <87sfgnzukv.fsf@toke.dk>
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

team lnx <teamlnxi8@gmail.com> writes:

> Hello everyone,
>
> 1. Is there a way to pause/unpause queue ?
> 2.  Is QoS (work in progress for XDP) ? Can we use work in progress
> series if  there exists any ?

XDP has no pushback from the driver at all, nor any way to queue
packets. I am planning to add this, see this presentation at LPC last
year:

https://lpc.events/event/16/contributions/1351/

Could you elaborate a bit on what your use case is, specifically? :)

-Toke

