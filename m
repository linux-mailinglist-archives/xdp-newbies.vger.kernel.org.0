Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323A436F417
	for <lists+xdp-newbies@lfdr.de>; Fri, 30 Apr 2021 04:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhD3Cg1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 29 Apr 2021 22:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhD3Cg1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Apr 2021 22:36:27 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70622C06138B
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Apr 2021 19:35:39 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u25so40611161ljg.7
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Apr 2021 19:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=9CB2kiaizy9XUjsJO2CUP1a0guMvirUzywfUfU9Ng1M=;
        b=o3nYuCSbMLuy4OB+gO5u1LiRMcyVkNrGSTXx8+PAoaTIz9+5laMTmJuLmibGLDyDO+
         ZWJ8W5tZBhYGlloHjhg9RPQtkPopG4bF+DHwtS3tM5wTgNvfe+2IkY4gytd9Cmb9O7YT
         JrdjU58y8ddgCb7v0oWtajBC8+E+tT5eskR0lWAoDnDbRkk9tkX7w7sl4Qv/cJPt+1aQ
         ndmdeVv5hmUr6angXBPQoA+kjPeS1otafJuyj85G/k+j8NKXMGAdkQUKg4t9Q7nhYcOi
         36c2L2B3bFebj58KeaQjDTachzxnRe8rZXQdlv2P61yLfRV9tu68UIGca81pUPmGJquV
         zhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9CB2kiaizy9XUjsJO2CUP1a0guMvirUzywfUfU9Ng1M=;
        b=kIRJcARO9xRIyLhLsQfGR+XaaDDAGrUrYmivrMwuMWqzIuYqskHA7EZ3fu8facnXRl
         0KiueLsW/QbpwufDsm5Wq8xqHp8RlYnDc4BwGhIWsJdXWGOybI6djYIj3Fw+z584nGwi
         C/046FiXolWEb/KcbKyNeLyjGm0J0/CGk0Wqcjt6RefDGuLYlim7dyuO5SarFjfE5zi2
         UcHgWk2ETScugp+lkwehNqtofIfdgKCaFSM6s9hrthv3DLE28kSNNoCqy4OvxGl3iJut
         tek7xod1NAnPoxwzQBwoPI1nLZqhd2JtptvC4JicZblCCkpMxz3SN61TZXOFBUxt6yor
         aPMg==
X-Gm-Message-State: AOAM531wsCWf9PfqUFLSonpDKSTxif7zQAg0SU/7B2C6a5OXNl6Cqk0l
        GvjnV89VzPxdeGc+88nJE7r8E2lvVNs/9BlVH/b2jwnJMgU=
X-Google-Smtp-Source: ABdhPJyACKQrAVVuBZWoRz8VjxcPEnztiLpaY5BmJkHd1hopfTjkJ/LRo00U89nDJUIfx2v2b6BqTF2EYB2qHIBCQxw=
X-Received: by 2002:a05:651c:b14:: with SMTP id b20mr1969862ljr.179.1619750137635;
 Thu, 29 Apr 2021 19:35:37 -0700 (PDT)
MIME-Version: 1.0
From:   ratheesh kannoth <ratheesh.ksz@gmail.com>
Date:   Fri, 30 Apr 2021 08:05:26 +0530
Message-ID: <CAGZFCEFLb+sjcju_6vxCBNzPfuOR7A0cdHphWSD1nw0rtPZFpA@mail.gmail.com>
Subject: AF_XDP acceleration
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

Suppose a DPI application running on a AF_XDP socket ( zero copy ) and
after inspecting , say 100 initial packets of the flow, decides to
accelerate the flow in HW.

1. Do we have use case and products/solutions in market which does the same ?

Just thinking, since packet buffer is from umem, how another entity
(hw) can accelerate.

Ratheesh.
