Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A438D41C0
	for <lists+xdp-newbies@lfdr.de>; Fri, 11 Oct 2019 15:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbfJKNqZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 11 Oct 2019 09:46:25 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:39315 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728169AbfJKNqZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 11 Oct 2019 09:46:25 -0400
Received: by mail-lj1-f177.google.com with SMTP id y3so9899829ljj.6
        for <xdp-newbies@vger.kernel.org>; Fri, 11 Oct 2019 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=y4xNN4g6BzcHgJqSNYya+vheTxn74TmdxnKCPUG32Zw=;
        b=I11sStgM/bEYLkyDSpMEYuK3AE+5nPim/WsowreVJTnz5aplODeGednbCLKLX3RYun
         ykIXk4Tmv/IumBFJIeNGVQUKajlhDG1YCBbiv+3kcx+exTbfANmVuHdwczsVj/aGpj0C
         c+I+sx0FqGy7uMRv9+GImdDq7KIF3SEEBqQ9vuRiWq2yqvD9KFoPGZyK/Epr+gDEyw5O
         T0Bjt08ZcySKVQpKizSIeGgwSUMLYpPqEubLGiXqsVW9Zl1vdc79vaUd5lAuBLKRBs48
         S9RhUrqWT3iUTWVIOCHLO54OyHn78EvXFIIfN5EvKvUyIjPt225wdlv0UGo3O6jeYsJJ
         GCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=y4xNN4g6BzcHgJqSNYya+vheTxn74TmdxnKCPUG32Zw=;
        b=TxGZS73FYW4A7fHbTzycrNGWYAJLnAIw47D46HAiu7aY/0mWKzi1guaYklEudbUUGX
         o55Kul+Kg/w28PeAKMySHnD4cfg0ztS234gH4P4Zakr/RZ43qQQICDHf5WAKiono7nPg
         tpfnAwKPID/iHfJFhnyb2l4dVkSLLbBI09IsIqGRP3jdlKXY98ORnCHt0jLbn2cJd83m
         YC93vBwOkMxi8hFLYilo40ghDtEpbzjmV4z+fX+R5q6R/TDdI+kH8Y3V3WCiACn3aOZp
         sRgTvPte5XuOQrg31lKKtsfs5Nwsq+SkS2Pej+cUd/p0seFSbJWEQaR0BfeD6mXhy+Nv
         J9Vg==
X-Gm-Message-State: APjAAAW+KtDJnwURgipSp7sHF5c9v+wNsIC2y3NcmQfVln2zJXzkazvu
        Ktau27gNZmg8WE7RHpHb7rjXwSMyaBEaOOHu5KI7WoLe
X-Google-Smtp-Source: APXvYqwEapgLDdoutdHKOtGg04WcMdkeKBXRf4GVTWzXLBrX1magVtNlUonzJKxtyQW0YoXBx7m0Ps6nD6Rdjctr6q0=
X-Received: by 2002:a2e:a41a:: with SMTP id p26mr9066339ljn.15.1570801582301;
 Fri, 11 Oct 2019 06:46:22 -0700 (PDT)
MIME-Version: 1.0
From:   Vladimir Soldatov <solardatov@gmail.com>
Date:   Fri, 11 Oct 2019 16:46:12 +0300
Message-ID: <CALn2wre+wvE6DmryyT1=1NL5vShk4eqKQwTErZJbQnrg6V7jzg@mail.gmail.com>
Subject: XDP performance and benchmarks on generic not supported NICs
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi guys, I could not find any XDP benchmark for the not supported NICs
to figure out is there any benefits / performance improvements when we
will use XDP on NICs without XDP support. Could you please share such
benchmarks or your thoughts?

Thanks in advance,
Vladimir
