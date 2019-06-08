Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1FD39A31
	for <lists+xdp-newbies@lfdr.de>; Sat,  8 Jun 2019 04:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbfFHC4N (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 7 Jun 2019 22:56:13 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:43195 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729573AbfFHC4N (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 7 Jun 2019 22:56:13 -0400
Received: by mail-qk1-f174.google.com with SMTP id m14so2491234qka.10
        for <xdp-newbies@vger.kernel.org>; Fri, 07 Jun 2019 19:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=4vuOY7pHtTEkIPD8f6uPcmGiTDccxF+tdIeJDkHRJ+s=;
        b=ow+vBtb7BEmhMSnMew/CeOqOJaWiINvaiZjjKkZuA9AglInozsYcvs5etkElqwPyw2
         sypKXMUfNEzU8cd28CJ+FcQkkc0qoDHSsAFVCm9DE9AOkzKtAlQKr8Xc7HILbdfvshf3
         oDHwPuJtfTK2g/PLGLJpSzLvgeqkaRd8bwobVr3oDdukjDtaolY9o5Rb/nqEDgyhgTyy
         VwVc/a/ucf0m9njyx/iOdXgCktn6NnviiqklSELEC9T3jqyTTpgk1GgguoiKQRBk6cux
         hwFITbYxMuGBbtEnq1WeJ7ZsfE39rZdi7L1bXouMKheWDl00vJ+nHFfrr07HqU48+I0w
         yE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4vuOY7pHtTEkIPD8f6uPcmGiTDccxF+tdIeJDkHRJ+s=;
        b=Zxf0HCKX1IfZDgcvlYvCtrHbfBI/xdHyc+oVqrUeNDO9QCk/zboIoSJBKhCSWHscV8
         xju3c2RBPnUpuLkOEW5U/oLc1FBgwByrJ8vfPG0feZgpYJ6ZxvU35U7lX8PxW0unQ5Kj
         TwOcErVyOP1qVOXkZA64P7C6KjRLEqmJ3tSeBeNifVuT/6JJa2BJ7p83AmHuJ0Svn/7m
         8qLAG+GnnSeWfjoKP/om2ttbXAyA1/vuc/2hpry2i82kUqRqKuc4rWwIm1idVe1ipDjS
         A958+1fRE/ZkWa5wGevwRY0WeLWJRa7o2IosFzcC/ltOoBgwaYHu7DeZQ/Yuc4bfKWZ+
         0ajA==
X-Gm-Message-State: APjAAAWWmxX0Rn3sT7OusKUb/EMPoQ5HtzVn1Jdi5DnArOvGvqwF2D4f
        3c/IW56IHGyuFanonzLJEhMKyJwxQRV5dya8PBD38g==
X-Google-Smtp-Source: APXvYqweV9cDkFxxkR+g/8J8Qflp6TNBqMEJpQzBbbcwkXPVtzKjSKE0S6lJ6/0S4HFKdlVMesvuvXqN8ALy/pynhvk=
X-Received: by 2002:a37:670e:: with SMTP id b14mr45442417qkc.216.1559962572413;
 Fri, 07 Jun 2019 19:56:12 -0700 (PDT)
MIME-Version: 1.0
From:   William Tu <u9012063@gmail.com>
Date:   Fri, 7 Jun 2019 19:55:34 -0700
Message-ID: <CALDO+SZ_y2crYSXGtFxQtk8zZz2X=Fr-rJTPr_zm6rbtD8h9iQ@mail.gmail.com>
Subject: AF_XDP with QoS support question
To:     Xdp <xdp-newbies@vger.kernel.org>,
        "<dev@openvswitch.org>" <dev@openvswitch.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

When using AF_XDP, the TC qdisc layer is by-passed and packets go to
userspace directly. One problem is that there is no QoS support when
using AF_XDP.

For egress shaping, I'm thinking about using tc-mqprio, which has
hardware offload support. And for OVS, we can add tc-mqprio support.
For ingress policing, I don't know how to do it. Is there an hardware
offload ingress policing support?

Thanks
William
