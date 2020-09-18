Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACDB26F544
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Sep 2020 07:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIRFEc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Sep 2020 01:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgIRFEb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Sep 2020 01:04:31 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2CEC06174A
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Sep 2020 22:04:31 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id i26so6278084ejb.12
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Sep 2020 22:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Jn6Q9HNli9jXZ2HiiPPkrHCuNBnno0lGBtnX2zXYM9k=;
        b=FSMnor3sa1ayML9NpMmHLJAUE96T+3rkYMpZYiSyUnMIcB1dhR23ygyON3EXM3F+m1
         pJgyjIoy/GTLVxQV78Q1CzYMBs4AAum1Y1gD73YnKlkjkOIgRlLW1m3/fFDy6FksLaTk
         uWVpYkuEhMXT39DGnf+5lSOmJa34DSDZLiRA6Q6OeFnZGVZY3BT24mMxfjsxEuBGwJ9L
         L7Mz/PwZu9iwmAWRGgIDk119/h5LtE90zU4Wav0zk47XU+XRvXzvxq/6yXug8hA+lAPX
         VyWaa6ybYCQJM1zj3vmV8+ZC+PTE38wDXtIv9tCWaKRq1q0O0drlYoHHNcurfbegdTIU
         lMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Jn6Q9HNli9jXZ2HiiPPkrHCuNBnno0lGBtnX2zXYM9k=;
        b=XPqAJdSjW1BgSp90a9A3qQngRDw62TvBMxjBAiD48FmA3T5wtGmF0TEobm0X18EBTJ
         Ppbb2nLs1AtnFjl7hkQD/S0QIUpsHILJjrGxSqEPwKxW4wZgfoCJr4s5UVLg2f/8uZ5Y
         O7q1HlGZB3EeTH/QwzrgQvcXsyl2oy6LDv4p+Dl9rGGfIplbc0MxogNyHxHB3MhMHOP8
         AHfA+RrIuUlnNmfFA2jbejpK1GrvoGtdcAMuuDDf+WvPdwiLi8LBM+FihkdX57jBoJV7
         M2ncQnPwC7QPJ8dOeBqJd0K7yVgBvVlH2NNOFrvNHX+w/B4DQfWPc0g2lb3XNjpK2mmH
         2rag==
X-Gm-Message-State: AOAM532VIH7zVAepU1ObzIq2/uxy0CPianHlEm6d+1wog0H6Ze/U6VAV
        gxW5vscWIOFHlgjfuCQanPXNlqlaRgT6LlgzLU5VUA9vmGk=
X-Google-Smtp-Source: ABdhPJwV7YfRuXaJTKeN5+ITzA885md3YxkvgWTHXA1dKOKQ7KEN/A752/gzTwZNT9JLFH4rW4ccasoGX1sTxpQWJ/w=
X-Received: by 2002:a17:906:facb:: with SMTP id lu11mr35803582ejb.249.1600405469069;
 Thu, 17 Sep 2020 22:04:29 -0700 (PDT)
MIME-Version: 1.0
Reply-To: ThomasPtacek@gmail.com
From:   Thomas Ptacek <thomasptacek@gmail.com>
Date:   Fri, 18 Sep 2020 00:04:18 -0500
Message-ID: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
Subject: bpf_redirect and xdpgeneric
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Weird question:

Should there be a reason for me to expect bpf_redirect to fail when
redirecting, in XDP, to the egress of an xdpgeneric device?

I'm redirecting from an XDP program on a tap device, out the igb eno1
to the Internet (and fixing MAC addresses). I can redirect to other
tap devices, but not to eno1.

I was going to try with bpf_redirect_map, but I'm having tooling
trouble there (I can't get iproute2 to load a BPF object file with a
pinned DEVMAP; it complains that the flags don't match). But for my
purposes, bpf_redirect would be fine.

(My testbed is 5.6, for whatever that's worth).

This mailing list is fantastic and you are all excellent. Thanks
whether or not anyone has any thoughts.

---
Thomas H. Ptacek
