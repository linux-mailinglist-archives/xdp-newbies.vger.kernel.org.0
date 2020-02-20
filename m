Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE31166A86
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 Feb 2020 23:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgBTWty (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 20 Feb 2020 17:49:54 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]:37756 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbgBTWty (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 20 Feb 2020 17:49:54 -0500
Received: by mail-qk1-f182.google.com with SMTP id c188so157991qkg.4
        for <xdp-newbies@vger.kernel.org>; Thu, 20 Feb 2020 14:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=IXRNkjzY27mGL2wK3749YQFmH9WESiBF92QShJsbDzU=;
        b=iQ9gxR3gkZ/i9+qGiLZRODqR0AxcO4y6K7xr/C07Dk5hqVkVDGj7dSyikIdFipsF/L
         VBUXdeHlxzTLDclqOClgsaudBvYzWMWj57Gd6jvPWUskdQjLRh/UWRVpCWLHNARKg3tH
         hUOjp/USKHXH8DGznhQnMcI958h4LS/BaydX1OsE6RzqMfWbAWze8JcKH4ouo3azkRCH
         WFDAMOtJJuLiz/XgulX/m+h4z4v09GJOcvawxLDChJuLspzPDrc0LF7jJTMpzOojNrDr
         N+SgAuvYPUu05/uUAmYzv8o5tnU/q3twLWepHtlZU7Ye743uTt/+9kR2K0IKMy59BibI
         aL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=IXRNkjzY27mGL2wK3749YQFmH9WESiBF92QShJsbDzU=;
        b=c1nu8hHomgzH/KM+jVtKhns+BoBWIPeGH+1bmVFcQTsHg8vkertV8rTzU/nE6/bCFW
         K4avdXKfLj3DRE+N3VrA3OKf2t+sH6n6Y6ocLRXDg0jp1MPjbk02EzNZeizb/ujoSzEp
         Xgq57um/lKxuHwq7Afz4MZ+5sRuGVVYk32IFkwdsTxlkDxZPUCGfLjksaqrxOL0U38pV
         a4Dl4NrKxo+aUz7rLLLPoNVp9eB0zI7JdTiEoqor4/M5DbOucyQMuNWbL3kiZTCaLIni
         5Fddc5N77t0jfpVfYwdWrKkEkKKdt7k/WsNioiUSrPnJf73DhPOOXxbphzJ2HXHVZmAP
         TLtA==
X-Gm-Message-State: APjAAAVjvmMtg4U/me25G52LpFhlEHJUOQflQzdLwCq/d3DuYwJI2DBX
        +E/LC0XpDXiGSVicU2KiXB6dikOc/h283DrvwXXZXC9g
X-Google-Smtp-Source: APXvYqzNXWE8Y5H+wJ32OyKqr5ciGekCBqJXpRVLN9tTBHGXZbzPFgSR9pbsfRzy04mJV+7LD1Hf/hrTK/y/4IuutM8=
X-Received: by 2002:a37:9b8b:: with SMTP id d133mr30541618qke.147.1582238993461;
 Thu, 20 Feb 2020 14:49:53 -0800 (PST)
MIME-Version: 1.0
From:   William Tu <u9012063@gmail.com>
Date:   Thu, 20 Feb 2020 14:49:17 -0800
Message-ID: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
Subject: xdpsock poll syscall CPU 100%
To:     Xdp <xdp-newbies@vger.kernel.org>
Cc:     "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I'm trying to save some CPU cycles when there is no packet arrives.
I enable the poll syscall option of xdpsock, by doing

$ ./xdpsock -r -p -S -i ens16
 sock0@ens160:0 rxdrop xdp-skb poll()
                pps         pkts        1.00
rx              0           0
tx              0           0

Since there is no packet coming, I though by calling poll()
system call, the xdpsock process will be blocked and CPU utilization
should be way under 100%. However, I'm still seeing 100%
CPU utilization. Am I understanding this correctly?

Thanks,
William
