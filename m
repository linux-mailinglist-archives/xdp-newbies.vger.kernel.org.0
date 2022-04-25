Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56CB750DA1B
	for <lists+xdp-newbies@lfdr.de>; Mon, 25 Apr 2022 09:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiDYHcw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 25 Apr 2022 03:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237971AbiDYHcj (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 25 Apr 2022 03:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6AB35FD5
        for <xdp-newbies@vger.kernel.org>; Mon, 25 Apr 2022 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650871774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tBSEyECortLhbxPKNgE64+eGs/+rgto72732JzW6ohQ=;
        b=J+yJyyvzK1ePTnLA7o4Cq4wfPfWS/lAoVsCrODfS3D5rBRbXijq9aGoQmRUcsmh5zGBhvZ
        IrCKnRa/B8CBqlwFC5qqS5Vq/Dv7/w0L4vFlBiPVlX9SZrhWFNYk7KlaJ4BUOQOZ0//T7m
        F+xh0AQ9F+63G/VPAdbHVR3gCBEV/C4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-3fFL0FvLNCevkY7NxkGYbQ-1; Mon, 25 Apr 2022 03:29:33 -0400
X-MC-Unique: 3fFL0FvLNCevkY7NxkGYbQ-1
Received: by mail-ed1-f69.google.com with SMTP id w8-20020a50d788000000b00418e6810364so7810989edi.13
        for <xdp-newbies@vger.kernel.org>; Mon, 25 Apr 2022 00:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=tBSEyECortLhbxPKNgE64+eGs/+rgto72732JzW6ohQ=;
        b=SZzaiY1aAgYRdDWhjkADr9ruxU805xy2pWJGReyeVSvwLNSYzIIIfk4D+ffQDlc6uR
         LhMw7wG98izQMaGDAd5bkL8pS2+IKUiI++A1uxiu9q6l6GstIQsFSXYju+q237hRgM0P
         qXUaTnWiRKwLqpqTVxIkJaxy51l4m571NjfZkiT0ts+/INWE52VLhkEs7rXfz1OowW7e
         PuoOGBpk2HNs/evh+vB2in7By7OrCY3x0Pv1xVuq+jSHVWmgnqGUF6dO6p90J3iYNz84
         zazZsfR8+feE3Hmc41oLs7xZetXIeY/9xQwo32Fko3B8B1hGokRLSl87gWIE50m3Q94O
         xMYw==
X-Gm-Message-State: AOAM532PO6ahXOSEPOKF8EEb8zhn9D1dnurTDt3CwNUp3jmYsdHIHQ47
        GAZjOsgjvnb3bFjs+hSlu6+OO4mz0C6ZilYbDaS93rsItuWa0om9R15wfydsTt+atKL4MmHS+pc
        OS23NgUGK/4eK1Vh4M1QRMxY=
X-Received: by 2002:a05:6402:2999:b0:418:eb22:64f9 with SMTP id eq25-20020a056402299900b00418eb2264f9mr17192881edb.391.1650871771386;
        Mon, 25 Apr 2022 00:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6BujgIIS864TqTNoK3TJ76KYbx2yH8J7lW9T+b2QeWkEBQxVKJnIgE2Zj0qZQnHKoH2ftyQ==
X-Received: by 2002:a05:6402:2999:b0:418:eb22:64f9 with SMTP id eq25-20020a056402299900b00418eb2264f9mr17192867edb.391.1650871771140;
        Mon, 25 Apr 2022 00:29:31 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id w24-20020a50d798000000b00425eb9d893asm777137edi.79.2022.04.25.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 00:29:30 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id ACFE02D2394; Mon, 25 Apr 2022 09:29:29 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     ctxspi@gmail.com
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP Redirect detail
In-Reply-To: <CAAVAo4OaTBRHy1bhw4YGSG07-BfP6u6ybfO+cS6hr2xYiwvJCw@mail.gmail.com>
References: <CAAVAo4MGusmZeW6eOsx8-Ph-dJRGYENQ-eKY7h0B=3TapQii5A@mail.gmail.com>
 <87lew53qrs.fsf@toke.dk>
 <CAAVAo4OaTBRHy1bhw4YGSG07-BfP6u6ybfO+cS6hr2xYiwvJCw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 25 Apr 2022 09:29:29 +0200
Message-ID: <87pml5boyu.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Marco <ctxspi@gmail.com> writes:

> Hi Toke
>
> Your information is very useful for me.
>
> Thanks for your reply.

You're welcome! :)

-Toke

