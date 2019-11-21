Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B11F0105B55
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 21:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfKUUsv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Nov 2019 15:48:51 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:45688 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUUsv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Nov 2019 15:48:51 -0500
Received: by mail-ot1-f48.google.com with SMTP id r24so4181584otk.12
        for <xdp-newbies@vger.kernel.org>; Thu, 21 Nov 2019 12:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berger-family.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=bgOtQnQuYkZ5GF19nBM/fsTaxvADesEAGpwTz/xBa/I=;
        b=Ui3ntHcGlYq6PCBnTgq7ZIeew4WaR5An8J3bJ9EqYZzrrg1bLJ1PIXpCvWgcQLe7Df
         /TRGsBXtTSBNqq0vQ97IcHg2XWNVi3T2wJwgtMxObGD7IjANW9hEI+Sg4weUFtsiLV4e
         1eB8EMHlFLKzp87908sJdkb6DB3IjOPH17B8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bgOtQnQuYkZ5GF19nBM/fsTaxvADesEAGpwTz/xBa/I=;
        b=cmj2ZlzcefZ9nKBNPaqM/rhd3olYEQ+O5/wFyXvOSCQ7daHHJWRfy+QF3zFBXyG8D7
         Zc7hNmu3YON2ewFODGJIlBdcafN8n+ShOCjdmSau3iYWjZ1nKZk7CL7ohRjJhyhV6BPz
         F3jAFYh0R+1BKfN97WxBBDufA2iuBE9UDhibBknTlxSSlRQXX0rM52QMdV8OafQc2TIn
         FSk6M2CgbFOokqiggiMZh46ssPn2dHwv+IQ78KZhNVYbSAvRctBc80lJObY62kw+gv6f
         v613aBvm6nZgCSEOP0WfXN7K3xGAfwNjjQJoUGXE2RknrASsYOs405fljE0YUGqNwxVw
         +nYQ==
X-Gm-Message-State: APjAAAWCfbozyd6b6UgfoQQEtCSG1P0bO3PpqRKIsU05BhFNJofT7Qxm
        sjfGJ4JM8tjHv8IzU7s5dTsUWjGvvaiDG3nMNv+YcEvvg5Fi0g==
X-Google-Smtp-Source: APXvYqzr47WnVgrLRpBS889SawtvW42aoKWiQ5utf3Ma+LyzBT2ojg3zYQvbp5Wtk/Uuu8Yu91ihyENga63ET/RbiF8=
X-Received: by 2002:a9d:2c25:: with SMTP id f34mr7739988otb.27.1574369330837;
 Thu, 21 Nov 2019 12:48:50 -0800 (PST)
MIME-Version: 1.0
From:   Joubert Berger <joubert@berger-family.org>
Date:   Thu, 21 Nov 2019 15:48:40 -0500
Message-ID: <CA+ZpPewq9hEEgcYcoUk05E0PxGXf=ppvB8wM+z3WVy5OkqTHzA@mail.gmail.com>
Subject: XDP - Bridge - not redirecting all UDP
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I have been playing around with Ilya's xdpbridge sample.  In my case,
what I am interested in is pushing all UDP traffic to userspace.  All
other traffic can flow through my box.  So, I setup something like this:

eth0 --> br0 --> eth1

I capture all packets on eth0/eth1 and return XDP_PASS for all but UDP
packets.  These I redirect it to the user space application. There
I set the UDP checksum to zero, that way I know it hit my code and
then send it to "other" interface.

The problem is that not *all* my UDP traffic has the checksum set to
zero.  Anyone have any ideas why that might be the case?  Why is only
some of the UDP traffic being pushed to user space?

--joubert
