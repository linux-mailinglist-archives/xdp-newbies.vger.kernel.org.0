Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB702CEEA
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 May 2019 20:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbfE1Srt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 May 2019 14:47:49 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:41833 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728224AbfE1Srt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 May 2019 14:47:49 -0400
Received: by mail-pf1-f174.google.com with SMTP id q17so7182987pfq.8
        for <xdp-newbies@vger.kernel.org>; Tue, 28 May 2019 11:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bfW8Ch56pKuDc8FWEN4QlfkBm/dSo1h6NKmQey0jCc=;
        b=jV0qtqClV+CIN3KOkLYBkzI9rMBcjTrsy/0vRYBS3jhh+NRr0EY776/hFDTGefQpz0
         LhUZHv6d88/Y3YbLKj8Zs3D2msWXrFKqtpJ01EuQeYYMJWonW25I5LuBe/mcXlUlVhB3
         z4aOK8ZrQN0ufqDuanfIt41BwTarc+i6LLEeiLuOedA3uLZBWFXnwcXyZzlZLjrJrffa
         PtIeSVTFDsx75hEUGbEWKeySoULmRJ5MHIVauy488yYxsm5FTccQU7PQdV2VjXlyzlGH
         WUDxc6BJuB8Y/ItrCzG6xmRMl0BUsIouT4XSz50KIyW9vrUvZfdcAbmZx7NwDrteo0f5
         agyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bfW8Ch56pKuDc8FWEN4QlfkBm/dSo1h6NKmQey0jCc=;
        b=ClNugyAZWANtdLiIPGNQItTcuOxC7xLTG8RrKuo91QXafW/0eFdHofHK2K9MJjpIJh
         fhvd9lXITm1lSHoItjgn41N1mCZNwBWYypXMiA2ColzVcg8Cw8WwcKvLhU1ZSboJXmKw
         b20UuvH/sjtAm0lEHh/fMJGONw/pHjqUwDu2dYurvVhRgriA9GkxqZewpstTgN62vLpj
         4YxCMjsRzTcDA6uDqa+FL9AYbOqyN7SqEA7VeUd3Nvv10ZDcrEjs7tr8Nqj5fCviLiMb
         OvRJpLnQ304KG60obEe9sugjJp7JSgAPtwa9MxghYU8cXdGfi1auStk08t32UtlTT0iT
         G0Pw==
X-Gm-Message-State: APjAAAWlvQfTQ9ACTz5TZzMhgsnAyS9uEpTm3YwB3BUF3LbIZMYc01Ml
        XUSrSLEuYnNpBlw9VhvchEiLSQ==
X-Google-Smtp-Source: APXvYqzZaI5O4zWqtjzHKbmUxaaPGpRHbBwqtZ+zD6WZo9vZPw6gWNwhgz3KSZ4bo8U3ZFAn7KSU8Q==
X-Received: by 2002:a63:2d0:: with SMTP id 199mr76352480pgc.188.1559069268408;
        Tue, 28 May 2019 11:47:48 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id n12sm14213608pgq.54.2019.05.28.11.47.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:47:47 -0700 (PDT)
From:   Stephen Hemminger <stephen@networkplumber.org>
X-Google-Original-From: Stephen Hemminger <sthemmin@microsoft.com>
To:     davem@davemloft.net, saeedm@mellanox.com, jasowang@redhat.com,
        brouer@redhat.com
Cc:     netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>
Subject: [PATCH PATCH v4 0/2] XDP generic fixes
Date:   Tue, 28 May 2019 11:47:29 -0700
Message-Id: <20190528184731.7464-1-sthemmin@microsoft.com>
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

Stephen Hemminger (2):
  netvsc: unshare skb in VF rx handler
  net: core: support XDP generic on stacked devices.

 drivers/net/hyperv/netvsc_drv.c |  6 ++++
 net/core/dev.c                  | 58 +++++++--------------------------
 2 files changed, 18 insertions(+), 46 deletions(-)

-- 
2.20.1

