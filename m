Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A53EC14D4EA
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jan 2020 02:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgA3BDL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Jan 2020 20:03:11 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44706 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgA3BDL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Jan 2020 20:03:11 -0500
Received: by mail-ot1-f68.google.com with SMTP id h9so1510381otj.11
        for <xdp-newbies@vger.kernel.org>; Wed, 29 Jan 2020 17:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xsE8tDi5/zVy549lACc8LV+TVk9O3mq6cDYbNfBtZCM=;
        b=C2X1g7hf/xUk8hXWCREh8LBUz33z2Bdw31L2w+kaE6dfrHR/FmPuri/mBLRl8LW1Fd
         rF30+arV8MoRb/kTZp2/5cGN+LZWsgxros1LeHSjtxC8QzWcw+ZCmFo83JVfg3/9Cbg4
         1mV/SkV56mFeLg8tkyfZO4ZjJSoR29i4GUppPmrgq5x/R4MsmG1XYARfy2SeI7vlgzFE
         yszOrDK2LcOaY3bhbvXeaTibjuScHI7BUxK9PxQqdN0ZS1fetD36VcVFlnURtst8NJY+
         u2mZdZ4b2wWbrQgqYQ86kZ+Cqyeex1kjoJHJWYoM67WEiH0xsw87tXdFs5CCWMpOJBEf
         ARhg==
X-Gm-Message-State: APjAAAX+XmG4fnX3h+F4m6dCWs/nT2wuwykha1qMqC1atXVDlThI6nmx
        lVyoe4KsznM3Mjn5X32JVSnRQG9x/LIsX42OSIcXFEb2dUc=
X-Google-Smtp-Source: APXvYqzJgsuDa/R0xo5bIvAwB/52KxRpdc/IRj5EpQ72Wo+lh+8GqxFO89xLcZUFjRgju5HGQfQcUuksV4TbvH/ISk0=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr1664998oto.18.1580346190517;
 Wed, 29 Jan 2020 17:03:10 -0800 (PST)
MIME-Version: 1.0
From:   Cameron Elliott <cameron@cameronelliott.com>
Date:   Wed, 29 Jan 2020 17:02:59 -0800
Message-ID: <CAMyc9bVpR9thvVsa-LWNg6BPwkqNcL-W-FuEXdfXgGxCUUn3jA@mail.gmail.com>
Subject: xdpsock ... -N -z and AF_XDP XDP_ZEROCOPY not working: RESOLVED!
To:     Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

My benchmarking with xdpsock was failing whenever I added '-z' to the
'-N' option.
Which is basically the XDP_ZEROCOPY flag to the AF_XDP setup call.


I had the latest x710 firmware, and latest i40e driver on my ubuntu 18.04 box.
I also had th 5.3.0 kernel as installed by:
"sudo apt-get install --install-recommends linux-generic-hwe-18.04"

To my surprise, xdpsock ... -N -z was failing with errno 95


Turns out the 5.3.0 kernel was the culprit that prevented '-z' working with '-N'
(prevented XDP_ZEROCOPY working)

I installed the bpf-next kernel found here:

With this command:
git clone git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
More info: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/

I built the kernel using these directions:
https://wiki.ubuntu.com/KernelTeam/GitKernelBuild

And after rebooting and running on the 5.5 bpf-next kernel, -z and
XDP_ZEROCOPY were working fine!


Many many thanks to Magnus for his help tracking this down.


I re-posted this under a better title (IMHO) to help others suffering
the same fate to find it.



Cameron Elliott
