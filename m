Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909F914A384
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 Jan 2020 13:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbgA0MIy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Mon, 27 Jan 2020 07:08:54 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:36434 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729887AbgA0MIy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Jan 2020 07:08:54 -0500
Received: by mail-oi1-f177.google.com with SMTP id c16so6410887oic.3
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Jan 2020 04:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JLLu1xAUrAk8496hIeUgb80IvxEZWA9L+OdwVBfVhiw=;
        b=VCAsWep7whByjsLXig7+Gidl2DY3X3OYfER8FjzOS+bL8qEOXUEB13Qixrr6HrA2yJ
         x6J6JH/nmiKA7o24iWFmTHly4VEfwCfSdUjSVtzdIZjFJQ1yfST7fQsilJVE6ZoEJteB
         VjIvPHo5S3XUXxs4oU9lOf9NdoRIPOYUH4s2ZXJNWJqzHQnz+LmdZedW8NoO9aOMhoxw
         BEheLEHR/9C/DicHu471ywajwqgmgMdimI+ZdGKTqMQob8QSzngs97PjvuDIp5NQ7AP1
         8tg60eVasVTOO4xKsskEQC+ppi0UOsrfQj+5oL6A9ma3dUZ941uSOPWeu9BMcTIBfPXj
         fNLw==
X-Gm-Message-State: APjAAAUmVm4/vpDQ6JjjPEtqcxRJ2pauP3txGm00GkH/8gWoq1q+XbBW
        ZXPtMRCOTDUtEMm27jkLUF0tOBe2ZBwMRTw9fK70eY++92A=
X-Google-Smtp-Source: APXvYqyBDUbxwBQx8EMUCLGr5gPzry3PwIHBVLjokjvjI35FHrKcREKQvQGYc1d11xd4d7c16EoxYtjPqo9P9JLCLF8=
X-Received: by 2002:aca:b70a:: with SMTP id h10mr7612070oif.20.1580126933340;
 Mon, 27 Jan 2020 04:08:53 -0800 (PST)
MIME-Version: 1.0
From:   Cameron Elliott <cameron@cameronelliott.com>
Date:   Mon, 27 Jan 2020 04:08:41 -0800
Message-ID: <CAMyc9bWnDuwDx_i=NjoAS1cDd5Fuy6T05ukSQZpjQv2Ji36jGg@mail.gmail.com>
Subject: Maximum xdpsock txpush rate with AF_XDP ??
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I am trying see what the highest rate I can push out of a single
x710/QDA2 port is.

I have seen numbers like 50+ mpps in a  Magnus and Björn youtube video,
but granted, I know very little as I am really new to the x710 and XDP/AF_XDP.

But I am only able to get about 2.2 mpps,  nothing like Magnus and
Björn have been able to achieve.

One big issue is this command "sudo ./xdpsock -t  -i enp1s0f0 -N -z"
Fails with:
samples/bpf/xdpsock_user.c:xsk_configure_socket:322: errno:
95/"Operation not supported"


Is there a guide or README I should read on how to try to achieve
numbers like theirs?

If there is not a guide, would it be helpful if I wrote one? (a small
guide on maxing rxdrop/tspush/l2fwd)
(it would seem like a good trade to get some help from others here,
and write a simple guide from a newbies
perspective like mine, if someone wants to give me some help)


--------------
Kernel/os:     Linux lumen 5.3.0-26-generic #28~18.04.1-Ubuntu
Intel NIC:      version: 2.10.19.30 / firmware-version: 7.10 0x80006456 1.2527.0
Xeon 1225 V6 with 4 cores


Thank you
