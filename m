Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B38133418D
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Mar 2021 16:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCJPbJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Mar 2021 10:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCJPao (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Mar 2021 10:30:44 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21451C061760
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Mar 2021 07:30:44 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so7680138pjb.0
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Mar 2021 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=AVtb6R5ywfz1s4OXlh/HsOIS4ArOL+G2gIZ78rt1l0I=;
        b=Er/svI65IPXfJCGQM9fpjXle0xDk1+D53bwTxXHPV/kfNalSIJg5OoeKsXzetX+XIE
         66Jd9mm+Ryvetsw/qLD9mhdwpgixk7fJElyROij3DNazgg7JXSlPSAogeWKifqbVfexG
         L0Qvq4tAt0U9Og+rPZGG9FzMmpwQ0gpTZ2B8bOQrPATk+tetqkoYtjlQTXjMaHZ+wiqQ
         xiC5/0KCq5tRYrv+WPXtgtjKhLKugn1F1krWUh5uVU2Lv96C8+jjYKvd/Wiwud0iHMps
         cN7b7pVcK/IxJkmhGNdqFX7QoqiFgROImbeT2ZZuZpJnT10sypH490jtegxe327bYmnL
         sK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AVtb6R5ywfz1s4OXlh/HsOIS4ArOL+G2gIZ78rt1l0I=;
        b=SZHtsJCP4ONBw7DyetMR5a1U0+sXltrZ6vg0oPjMoHRMxDFBX44KhuhwuTOXXftXip
         Ok9vSKSR7iLdWsgpLLjCgNLNpJPfpzC/JYaD0ecNF3BX7oB38X2ufcePIGF2+dt15NhD
         qXzBlIUl3qX+7HPeiy7ZS90aq8o4+2eShx+/tJAGaeEuvGg+YYxqUDOyjqgzPyW1GVui
         J83UP5HFXZBWxJKc0IBPaHXtr4Gdrgb1JeTggH1doV06OcJlVV4Qz/Wizs1jx535Gaz8
         0SNOHdTHLsaLypJEHB5qBQv+ZHjDzyGnoDZXtcxO4zBn+L9Qp1SIt4XKQrD50PpXwQ6p
         LPtg==
X-Gm-Message-State: AOAM532FYX9u42M1cqkIDulCa5D7Ji8DUUt/YU0Gfv6ra6CeqXqW2mrH
        Ca03vxSFzoSfN8mv2bHr1FqfDOE51w4mpCkiPZ7yJWGtM0k=
X-Google-Smtp-Source: ABdhPJyvB8Fglu31/Juw7q4XFboMdy6gXxsB/gHABijT/70YFO1duWBTTo+fjm/fkznHEr8Ub/hD4calMWLvlkqgk2g=
X-Received: by 2002:a17:90a:17c3:: with SMTP id q61mr4016974pja.58.1615390243346;
 Wed, 10 Mar 2021 07:30:43 -0800 (PST)
MIME-Version: 1.0
From:   Rohit M P <rohitmp99@gmail.com>
Date:   Wed, 10 Mar 2021 21:00:32 +0530
Message-ID: <CAFQY-shyWTWk0+uf95G-5m-9FmMzQ2kcCdjFx+heWq3ko1KhmA@mail.gmail.com>
Subject: Queuing disciplines with XDP_REDIRECT
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi folks,

I was experimenting with XDP where I'm able to route the packets using
XDP_REDIRECT.
Could anyone point me towards using kernel queuing disciplines along
with this if it's possible, or other possible alternatives for queuing
disciplines while using XDP_REDIRECT?

Regards,
Rohit M P
