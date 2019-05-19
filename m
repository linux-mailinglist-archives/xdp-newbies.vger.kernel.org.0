Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9D722883
	for <lists+xdp-newbies@lfdr.de>; Sun, 19 May 2019 21:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbfESTRo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 19 May 2019 15:17:44 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35228 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbfESTRo (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 19 May 2019 15:17:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id t1so4278305pgc.2
        for <xdp-newbies@vger.kernel.org>; Sun, 19 May 2019 12:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snVSccL/g5/3VjQbFQWWeEdO0X3Tn7Z02WtSfT8gC4E=;
        b=KOqSfn2TEcn7I+rykidhylNFj80cMmM6u+725tV03qqaTVSqWAcs7Q0TGCaLSXt19W
         nSMQQ5yJZk+aQWReTQTtHVOvSL62pNptRpvv5YlbrwRLD9Di7zBXYwNmONPVvef/gDNS
         qCpnpgMDdQXFWLQ6TC9be80V+e7U9oj8t22sGsMroeN+UcjftDWFjeFHOnjKoLTqdHZf
         B+tQwV+CWWz+2NCz0nHtzgU67fkHOzHbWn3i949TErIgvS9K/4/X3w6rCsde6wFqB/3T
         0+i3ZNHUSVWqSjCCbdAulqoiaK20oMnz+bxKk6CCDajueYOJNWqjQKqH4/q2Y0Djx1JZ
         3FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snVSccL/g5/3VjQbFQWWeEdO0X3Tn7Z02WtSfT8gC4E=;
        b=aA3PptrW4wHDNM+85LD/T/4qFXRs8521QFXqdbS5YI3HGbjiAxv0zZxcWfD8VEeBLu
         2uRbdt8Oo/fKIAUSsYJHUFrt0eiHe5GLUkriGnfU8+BrqmPm8cGvJ+9SnfqQPZa9qmun
         IPQ9539+nEPokOTqYG7tkFksNrMo93VYDdcYzzqkkg7rJJVqHYk1h3KTb8HnkIhcpH4/
         9gunNLLuoi1Ngsp7ekUndTAYzPvqQZmRi30AXEb8kjEX4N5ufC6U55uudoexCx1002gK
         ceC2XerFy0On1hoFsRPQwwfeOYXH0vdNuJcI4fK6o8Q47UxHI0ZTIzxfmhM/hsWRyRgk
         QKXA==
X-Gm-Message-State: APjAAAU68XN1LEHjYnZb7aAhgpmd51xoeu1AuFd6/Q/tvRFg6UTheUx5
        9A9ewP1Zb9wieZc4pvluzcGLoL65obY=
X-Google-Smtp-Source: APXvYqyM1t20YTUzYTzVxR3DfuC+MZRju4hp7/a+q1wejy6bTEywFj6NDLWou73xRc7ZKAYzgwTS+w==
X-Received: by 2002:a62:1a51:: with SMTP id a78mr70917175pfa.133.1558235449704;
        Sat, 18 May 2019 20:10:49 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id s80sm39049604pfs.117.2019.05.18.20.10.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 20:10:48 -0700 (PDT)
From:   Stephen Hemminger <stephen@networkplumber.org>
X-Google-Original-From: Stephen Hemminger <sthemmin@microsoft.com>
To:     netdev@vger.kernel.org, davem@davemloft.net
Cc:     xdp-newbies@vger.kernel.org, bpf@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>
Subject: [PATCH v2 net 0/2] XDP generic related fixes
Date:   Sat, 18 May 2019 20:10:44 -0700
Message-Id: <20190519031046.4049-1-sthemmin@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

This set of patches came about while investigating XDP
generic on Azure. The split brain nature of the accelerated
networking exposed issues with the stack device model.

The real fix is in the second patch which is a redo
of earlier patch from Jason Wang.

v2 - hold off the comment fixes for net-next

Stephen Hemminger (2):
  netvsc: unshare skb in VF rx handler
  net: core: generic XDP support for stacked device

 drivers/net/hyperv/netvsc_drv.c |  6 ++++++
 net/core/dev.c                  | 10 ++++++++++
 2 files changed, 16 insertions(+)

-- 
2.20.1

