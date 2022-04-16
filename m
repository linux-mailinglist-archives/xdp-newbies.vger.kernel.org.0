Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8195035CA
	for <lists+xdp-newbies@lfdr.de>; Sat, 16 Apr 2022 11:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiDPJlD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 16 Apr 2022 05:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiDPJlD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 16 Apr 2022 05:41:03 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73813CA6B
        for <xdp-newbies@vger.kernel.org>; Sat, 16 Apr 2022 02:38:31 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id r1so8733556vsi.12
        for <xdp-newbies@vger.kernel.org>; Sat, 16 Apr 2022 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=BWjISJmW7Yu96Wf/oRC9CNhHcmE2hFWmlh4NbnEsbVs=;
        b=PypWli3CVYQ0uFru+2Zp25Rt0vaW9Lwnj5E+qgw7VAmXx0MOpL9PL6IFT5uEvm3cO4
         a0sDlnuvU0U+JBv3J52tMcoOxVchtrhgGWHn8Zu6kPULh/PojkMA0++MuOWNGApnJKOB
         ECW92EhiJpBTWFH3DCnDRz9b5YHtMGCknOqZbP4OjyfdZnWLiCYMU/YjxaQk0DPI1DnD
         uzY7yjuWdzr6DMWOqn32i2YdQHe6xmnIw8HHoDb4IsjT247oUznOYFBNBjXj8hfB8Udu
         PWC/LLMk7P5hTKN2DeTsHtlKB0nHg8TuqAbdJoP8JR7UpMBt3Li/RnuDq04B6s48ysUc
         VFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=BWjISJmW7Yu96Wf/oRC9CNhHcmE2hFWmlh4NbnEsbVs=;
        b=BqLRPHqIsekF8CU4nZUwXlBBEBNnzhAXghOVwiyFKWgna7EYymdQAEtHJaSi1WM9Ey
         fpqpgBWoQ0CcFDLx3v/bMlLgeyPpmMmD+J3uMRrJENudrlbRtRmBHg9/NV/xfo2/K+ku
         SRFySZ9ZHH5Pp+D/ghU30HpP+G4OK0hTbArTx/T3nw+8qlaewwjcKkWYod2Kjfd3JD38
         uAgu20ktAB1vfY+hJbxTM4TBTKNKPtwaISX0hioi9jorqvOu3rw7HHZGqkTv1UHA0I3Y
         XOk5Z5z6BVZ9Zf2vKxCSRraYI4+QmnY+bWdDLKSGHzWPZJSJEbBmgvAd3De3KY379Qpx
         Y1pw==
X-Gm-Message-State: AOAM530tJRldCAjknAdcHttCWuWfWM2xGGuQb67Q5XrADo+59rIXb3Ri
        GPdWeas+e7ynKd8AGus9Tmh7x6RsnH1PS/MOazieEtY+aJwRUA==
X-Google-Smtp-Source: ABdhPJzFfDjYjeS/VJlvaH8gjd4CAzjn83yxNvF7f8XS1fu8alzerleUI7fR8WkypyYL4LabeB3CJLv8gMoyyKy8c/o=
X-Received: by 2002:a05:6102:2009:b0:32a:3fe8:de93 with SMTP id
 p9-20020a056102200900b0032a3fe8de93mr757731vsr.28.1650101910919; Sat, 16 Apr
 2022 02:38:30 -0700 (PDT)
MIME-Version: 1.0
Reply-To: ctxspi@gmail.com
From:   Marco <ctxspi@gmail.com>
Date:   Sat, 16 Apr 2022 11:43:17 +0200
Message-ID: <CAAVAo4MGusmZeW6eOsx8-Ph-dJRGYENQ-eKY7h0B=3TapQii5A@mail.gmail.com>
Subject: XDP Redirect detail
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi

Can XDP_REDIRECT forward packets to egress interface with speed
different than ingress interface?

More precisely, if ingress interface speed is 100 Gbps and the egress
interface speed is 10 Gbps, the xdp program can be load on two
interfaces and forward traffic (using XDP_REDIRECT) between them?

Best regards

Marco
