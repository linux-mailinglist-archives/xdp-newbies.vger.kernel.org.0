Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461814EEA31
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Apr 2022 11:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239013AbiDAJQy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 1 Apr 2022 05:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236995AbiDAJQy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 1 Apr 2022 05:16:54 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B201CABC0
        for <xdp-newbies@vger.kernel.org>; Fri,  1 Apr 2022 02:15:04 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id o5so3951415ybe.2
        for <xdp-newbies@vger.kernel.org>; Fri, 01 Apr 2022 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=vN4/hGRxSHzzfTltzJO8aQ4iNkgatLrUBDCqvZSRWlw=;
        b=WTnm69AtPc+MS0CXMxns+XkKypwsdwMOZlgtqP7Gq+3zJqVPFTs6yBqB9xjzQrojnA
         6hixymbCp9ATfYZ0weo4i1fm8/0YvcUVCusOvpjM9S64wZWEHAjMbskU9tICvxIN4/1l
         KNN+ycg0/rYRoNqWzz5SFp3/1eHKWo74OXZtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vN4/hGRxSHzzfTltzJO8aQ4iNkgatLrUBDCqvZSRWlw=;
        b=UZOJdZv/CMRU/Cxo64G/uR96IotTLKwLBraBmpCfI+zWqfP7UY2nAFiySTjjbqouRR
         K/kQpeL43IQPFhpR10IcbZl/jeQin4tuCquFj2SYg1Bdl6llR1AkaKu+CO5A5V8pE8GY
         TtzERmE3jFYc1DMxJMUL9mUtlHLH7eOtlaKTYR2+LtYzgjTkeJmwfhQZNNWOPaUkzvW4
         99n6e+RDt1DRGB+V2iZMnwJgHi3EOJSbER8M/SIJXHGDih8Z0KBTFChpYCmxDGfTl9Ve
         Qvei/pteUzA/kD7b/GlPrSoD+YjOeb/agKt/7EhHjdtQkkzdXMKEqCUepgUsGNJlCszn
         Byjg==
X-Gm-Message-State: AOAM532pjK4kd9EF/ffPO7i+UCNSTjuiTFxZ9UYkQpZHZ1UYX7MhItXR
        Nm6WmGq8Q/2eHvgsIaFPGPPDFSIbYUIQXuEnWnClS1d2qtPCdQ==
X-Google-Smtp-Source: ABdhPJySCqHnf5N9OFyJ8dg+I78zzGo51fLzPvM1AE9vs6et7O9iDvpr4hid2mC6ANs/4nSxMLCbtRg34HyKBIPnhe0=
X-Received: by 2002:a25:8303:0:b0:633:7c97:5882 with SMTP id
 s3-20020a258303000000b006337c975882mr7245837ybk.564.1648804503653; Fri, 01
 Apr 2022 02:15:03 -0700 (PDT)
MIME-Version: 1.0
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Fri, 1 Apr 2022 11:14:53 +0200
Message-ID: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
Subject: XDP multi-buffer and AF_XDP
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,
We are very interested in receiving jumbo frames (> 8000 bytes) over
AF_XDP. Does XDP multi-buffer support XDP_REDIRECT with AF_XDP? What
about in zero-copy mode?

Cheers,
Kal
