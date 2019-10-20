Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49465DE099
	for <lists+xdp-newbies@lfdr.de>; Sun, 20 Oct 2019 23:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfJTVH1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 20 Oct 2019 17:07:27 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:38450 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfJTVH1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 20 Oct 2019 17:07:27 -0400
Received: by mail-ed1-f53.google.com with SMTP id l21so8454212edr.5
        for <xdp-newbies@vger.kernel.org>; Sun, 20 Oct 2019 14:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:from:date:message-id:subject:to;
        bh=cC+sElZ9n/qdDfPdHDciByl13h3BCar8aOXOWj3TdXM=;
        b=rQ8UGskET+WPCdMkk+WNoV9VAB6fBIodZSXS26OMaWxTnlgLjz/mh0KRPo5S4eFY+G
         RkNoV+ivJSp+0WM5QW++YwR1yc8WmfkAVzL72PYdzYLZim98bvBBAi088yhkKx67xriC
         7YXyqzOO37YLVVmX+D+dVAJADutJO5L6xByMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=cC+sElZ9n/qdDfPdHDciByl13h3BCar8aOXOWj3TdXM=;
        b=VXNnNxFysh/qCTUhUl4JQ0mVcicCVgkxKML9PgcJ1AvsZVuOF18zvcLNBmjdjpwmyL
         EJoOx6AKlmNnzWOET7X3HphugwCgFtDQxAVUYeZuxVBB9PyafJ55Nh+JjT5FXtQsfpRl
         k2WYkZPUVwp/18aotOn4ximscqOAq9t2HORO0mbSPRgSOTT/6isIacHVV0/xuCixOnIm
         1DwLPRo9WlcsOkowh3YklixYASF4PZXtomRojH9CpGmnmgFBk7skHSqULmFPzJ5F7ZuW
         4BTgImQJTqw4jh2pLn+c5kEUi73/1ifCdbMN70NXdGQ9LhpPQeQab2Kwqp3nMAyEn0VD
         NIvg==
X-Gm-Message-State: APjAAAUn8FYTBqeS9ZTqSZKM9FtABOIMBNTzeyAcLO+lwzp30TLT+Smm
        oJM/a6+OizoRDouySwcPZbUmYPHvGVtTREw6BWWrsmwzY+0=
X-Google-Smtp-Source: APXvYqykgNL9M4/wealjkiKTVM9sesicApWDeJ3NEMSeP+Qm1Vov9gh1gG3CP3kj3492lGlG3jNNjw1NhySlp0CxSvI=
X-Received: by 2002:a50:ec91:: with SMTP id e17mr21011622edr.169.1571605644630;
 Sun, 20 Oct 2019 14:07:24 -0700 (PDT)
MIME-Version: 1.0
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Sun, 20 Oct 2019 16:07:13 -0500
Message-ID: <CAC1LvL3efhuf8dc-aQKepMND24drwVAHAzVs-4Np4CUTV8qOgQ@mail.gmail.com>
Subject: How to debug XDP_REDIRECT errors
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I'm trying to get some additional performance out of XDP on the i40e
driver (under kernel 5.0.7, Fedora 28) by adjusting the queues to be
one per desired core. I have several cores isolated for network
traffic, so I'm adjusting the queues to be one per isolated core (with
IRQ adjustments to match) as opposed to the default of one per online
core. I've noticed that when I adjust the number of queues down, I see
packet loss proportional to the number of queues missing. For example,
if I drop the queues from the default of 36 down to 34, I see ~6%
packet loss.

Using the trace_pipe, I've managed to confirm that my program is
successfully calling bpf_redirect_map() for all of the packet (no
losst). I found the xdp_monitor tutorial[1] and ran it, and it shows
the loss showing up as XDP_REDIRECT errors (which I believe means the
raw_tracepoint xdp:xdp_redirect_map_err).

At this point, I'm a bit stuck on how to proceed further to determine
what is causing the redirect error and where the packet is being
dropped.

Any help in pointing me in the right direction for debugging
techniques would be greatly appreciated.

Thanks!
--Zvi

[1]: https://github.com/xdp-project/xdp-tutorial/blob/master/tracing02-xdp-monitor
