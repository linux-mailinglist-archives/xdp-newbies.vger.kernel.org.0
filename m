Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7CF3854A2
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 Aug 2019 22:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbfHGUsy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 7 Aug 2019 16:48:54 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:51316 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGUsy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 7 Aug 2019 16:48:54 -0400
Received: by mail-wm1-f51.google.com with SMTP id 207so216320wma.1
        for <xdp-newbies@vger.kernel.org>; Wed, 07 Aug 2019 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=cZEVlc1ROE/CGVOxbFYVHoqVeUBFqC8tN6r2moOGPpE=;
        b=aByXSHieM6bPlGeybsxvzL2QIua2UMX9T0byR2FAQ8WquJejeequBHoaTxgidMHq9M
         sJCO+OBRAy/XZfKqrDfmFNjoLHM7TPdaAlqglF/jvbMtH2BsEc4mt9DoUTXX2n4u7Nsb
         9Y5XHmHpLGCLRAuIA1x18stXvaGJLJt5f+SeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=cZEVlc1ROE/CGVOxbFYVHoqVeUBFqC8tN6r2moOGPpE=;
        b=ZO3UYbLjJpkNLtZhCSEzA2CPK/kq0VbNdlbhFHH1EPO5N/Aa1iG5XOv6Af7X2U8/5x
         rLTwiWwT0wLaBGOybWwweO5GK/pew2zGOCspYD3UwMKwb4Bo2ytNMmbUzBInTJ4pM1Hb
         s8F3b2SvWSDv8RuLzxmgmNNU50F9Dk9tL2z/u3lURK6/oZwhzs7O4FmGkTwG7caIvsuu
         5QzwtfEc1vQpwEiBzrXXdlgzgi+WUBudMm2IW0YEopFhZzylVETsd7VhJtHv+DsXdfxp
         pe6cdZGFToRHzt74IE+MMFg/oGaliOyWZ+dJBQhci1T/+lDGeiD+hnpt0KLrzpcIyIph
         kXHA==
X-Gm-Message-State: APjAAAVA+ldieAzJSamHkdm/qh9xJid8RLW0kQ5AFnP07R5S9/6vCZV6
        37iPDuKenoGnEgUzA7WR3ub9mqkqWFtbfXmMkVKb6Iv0gHo=
X-Google-Smtp-Source: APXvYqwpkDUMBeYHsVYzy4PRTooQO5WapHT3K7RxvJTwuHGtNG5QkhaPPTJpiCecT10xy74Pn9luhBTfCe+Ya3UFA1c=
X-Received: by 2002:a1c:a503:: with SMTP id o3mr185324wme.37.1565210932482;
 Wed, 07 Aug 2019 13:48:52 -0700 (PDT)
MIME-Version: 1.0
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Wed, 7 Aug 2019 22:48:40 +0200
Message-ID: <CAHApi-mbMMx5bhdyfoLuiw7V3qML3L8f+N-+ReQ9XmAKH_2q8A@mail.gmail.com>
Subject: i40e: Kernel freezes with XDP_ZEROCOPY
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,
I am trying to get AF_XDP working with the i40e driver (Ethernet
Controller X710 for 10GbE SFP+). After bind() with XDP_ZEROCOPY the
kernel (machine) freezes hard. I have reproduced this on varying
kernel versions between 5.1 and 5.3-rc3 with 5.3 kernels freezing
also, but at a later stage. I tried replacing my XDP program with a
trivial one that simply returns XDP_PASS but it didn't help. On the
same system, the xdpsock sample does appear to work with the -z flag,
however. Are there any current known issues that could be causing
this? I will try to extract a minimal example that exercises the
freeze.

Thanks,
Kal
