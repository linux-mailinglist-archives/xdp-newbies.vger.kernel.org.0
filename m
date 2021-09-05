Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F77401219
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 Sep 2021 01:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhIEX3z (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 5 Sep 2021 19:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhIEX3y (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 5 Sep 2021 19:29:54 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15585C061575
        for <xdp-newbies@vger.kernel.org>; Sun,  5 Sep 2021 16:28:51 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h1so8246028ljl.9
        for <xdp-newbies@vger.kernel.org>; Sun, 05 Sep 2021 16:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrfernandez.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=9Uig99Z2N9q2mINEAWK9gzkqZd+ovmE/WSXb0bhnWaw=;
        b=EAqJgbx5rmEGKpjg+1Lea8YMQBJtHvXKySKCeQaW9Snqbtu/BNOF8/2sZv6dB57Yf2
         iFu0ubxc9xgtxFuNIWuwcP9IPNsuiS80sWHxKuKdY9kVGikYxwk21i6PIIcg5hNulyV4
         ngt6K+R2Dgn3wXJ8ro9u/da/SXmA/1Z5NFCDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9Uig99Z2N9q2mINEAWK9gzkqZd+ovmE/WSXb0bhnWaw=;
        b=QzoBVmgW2W9f0NKsGxxktjCgGknQfT1zzUTJzOo48f3IueYXxarId3StcXfuyJG5jR
         Sarw2HzJNblLJOjIB7P8dVi1rK1lDVdrWDMNyihBeQ0aXHbqPNnyH/jNSjAdypBHqlcv
         zUwpkMQweN9t+mONPCNgqHVTUByEMsaQRQ7+FBPeAGMrPpiIKA8/z82ur1h8ICI5LCfJ
         lbb8YXePqht674LyMoBq+pq9rZVO5xh10VQnj3us7gbybA3iFjSXtq+dr5Cy9A2tk1kN
         WDXGBj0a3bNeG8Pwvt96owZOhQsitXk/K3Ev2OXkLp59DMAl8em2Qnp8MXOWokhh5ygT
         TE7g==
X-Gm-Message-State: AOAM531Kh+ojssb2IfK9AWXEg/f0qEUiGbVABTCJobj+17R8OJWnOwAG
        1OoRleSfCSQ5d5Xw+GVVE3xoeAAK7b1pmT53S8TH+eQClfKKS4nr
X-Google-Smtp-Source: ABdhPJxQ4M9ilf+u2Bdxo1swsUiilDphXtlYQa+hUeHkOAjrJxjQxo/KrOAKs50LMIStrm3b8McN/vE7ls+edQR5GGQ=
X-Received: by 2002:a2e:1514:: with SMTP id s20mr8718973ljd.34.1630884529315;
 Sun, 05 Sep 2021 16:28:49 -0700 (PDT)
MIME-Version: 1.0
From:   Jose Fernandez <me@jrfernandez.com>
Date:   Sun, 5 Sep 2021 16:28:38 -0700
Message-ID: <CAPwzzmsGdMqa9PnOQvtDOcwdByi8CzVEmLHpCmvdVfa4Rnkjeg@mail.gmail.com>
Subject: Linux laptop with native XDP support
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi folks,

I'm looking to purchase a laptop for Linux development and was hoping
to find one with native XDP support. I believe the i40e driver
supports XDP, but I'm having a hard time identifying which laptops can
use that driver (I was first looking at Lenovo). Any advice or
suggestions would be appreciated!

- Jose
