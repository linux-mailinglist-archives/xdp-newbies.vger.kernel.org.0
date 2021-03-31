Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B54435006E
	for <lists+xdp-newbies@lfdr.de>; Wed, 31 Mar 2021 14:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbhCaMei (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 31 Mar 2021 08:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbhCaMe1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 31 Mar 2021 08:34:27 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2303FC061574
        for <xdp-newbies@vger.kernel.org>; Wed, 31 Mar 2021 05:34:27 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id f17so7826070plr.0
        for <xdp-newbies@vger.kernel.org>; Wed, 31 Mar 2021 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Rm9LJ+tSP3AS9iz771NwVbT/dZjEkGQHhDcfR4NuamM=;
        b=FLdD8DrV7fR34I2/kLFzwQj8ieBt0V9ho7+C68XrcWkNT/Yt2kYXeESNXeFMnbE5Hw
         TlqICDx3mGVYAotEXx3bTunTIuQVLgTEV9LXAzfK9pcxF8ESuTF2NRQwNAYLwEF6GAt6
         axpzSafIOADr19TllDYY6m134Q0pM9SIZS4jP2svVmeRnwd8enAbrNuDqh5PONTT+NXQ
         c/oYf/lAHbbSEaS8HXwxnibwW1sIOUDDRyoksIOxt/nHmjL6gal5ueCuy/BCroqOcq+J
         eziJOsoxiBQO+SwGPzvYTh/kCy/oo8yNs61rbA+uTWBetTViGdMCuunOVwihznbOC6To
         HZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Rm9LJ+tSP3AS9iz771NwVbT/dZjEkGQHhDcfR4NuamM=;
        b=oFHP/SgG/zZ4WIW4sR8afNqmTB5maPVwRW8HIMjebSy8/59ufpu18trjv7cirN4NjX
         4efbm6F5+VRlE/FT1ZI3q7o8uDyKl5FZEFBhgDTGJJCJY98xyKxAfbMA16P3PXcyyjfx
         ux4zLjPQB839myuUfx16QzbE+so8VRuf6qhUrsUML0n9RgyHeEDECDCSS5YlO6bIlIKR
         AllHpcq5NaHgvFMzaNEmfb6+glHaSqO5JQdSSKq2BBqhEpOm0/9iJFgxj1t+6+zFfEVf
         FogmSPVEo3snL/2zr116cK4D1HdG9c8NLeV7fN9mp/Z0s26XKmqK1W0LqKSR9F7bUfvK
         mMLA==
X-Gm-Message-State: AOAM532i1yb8JRObhxv9gbeWFtMKmcqS3KdjE8cWzHTgx9XiWmg42Qzi
        /bz+hppbW4lFXIagyEFr4+fp0thvK+LDQPQVXV77cmGNKFATwQ==
X-Google-Smtp-Source: ABdhPJxfncs2gULUmnvfd66cMevwYRtADPOOw1uiI64V8sWElvtT0YaMTYVijn4XxUaoysCs+SeBQlDtpJ3lmLg8PIw=
X-Received: by 2002:a17:902:7786:b029:e6:cc0f:4dff with SMTP id
 o6-20020a1709027786b02900e6cc0f4dffmr3081490pll.4.1617194066394; Wed, 31 Mar
 2021 05:34:26 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Wed, 31 Mar 2021 18:04:12 +0530
Message-ID: <CANzUK5_NfMLh9+se3hdJ176Ow_At6bwPqUSUD8XOSO0yc4vYig@mail.gmail.com>
Subject: AF_XDP - why setrlimit() ?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

The sample xdpsock_user.c program does a setrlimit(RLIMIT_MEMLOCK) but
subsequently doesn't do a mlock or pass MAP_LOCKED flag to mmap().
Same with xdp-tutorial which has the following comment but I don't see
any locking happening anywhere in the code.

/* Allow unlimited locking of memory, so all memory needed for packet
* buffers can be locked.
*/

What is the purpose behind this setrlimit? Does the libbpf/xdp library
do a mlock internally?

I came to know that BPF maps need the setrlimit and I assume the xsk
APIs create a XSK map internally - so is that the only reason?

Didn't find any references to setrlimit in
https://www.kernel.org/doc/html/latest/networking/af_xdp.html either.

Srivats
