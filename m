Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1F035205F
	for <lists+xdp-newbies@lfdr.de>; Thu,  1 Apr 2021 22:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhDAUI5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 1 Apr 2021 16:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhDAUI5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 1 Apr 2021 16:08:57 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0C0C0613E6
        for <xdp-newbies@vger.kernel.org>; Thu,  1 Apr 2021 13:08:57 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id h7so2403905qtx.3
        for <xdp-newbies@vger.kernel.org>; Thu, 01 Apr 2021 13:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=8/qB6/ek/b3tx7WS4nzFURykCAicdhXaAtF+ZR5s8Bo=;
        b=FAmV0DKU4uHoQhYWheNgnINv7IXAun48JCbjNNvQDILq/U/k1hrqXJu96SaEQCu9JT
         kJ+U9V05vMXo7aRZzNZdHX2NFwjfLHY8YjhSkve8WqLakMAbAQ0O2JKH+LyIGlwONQJv
         /UQziKw9HORQVZKjUSjbZL7JWYU/fik4W3SNC4h4bFksSwq9F+0mtdBtqs3ayzLy1taP
         +kIwb5m01Vg3xCkSg01lE6eR2UON6z0dko70MEvtgFPb3xYDoR3NArNuhIrYZTMP8wdl
         YXorqqugRrsPYlYbecag75U3rXK1wyicTgLC9FXJ9TVJWUP8KjOkCPa9g6q6jrkvxKwn
         3e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=8/qB6/ek/b3tx7WS4nzFURykCAicdhXaAtF+ZR5s8Bo=;
        b=iLJKQUvNSSHsVQKUS8BK3Wy/Gaux2dUI6E3zmNjCiS5173iVtb4k1H8r6aSEBjnPwA
         tQ4/RGWtg+v7OTIi7XIzyZ7qKudXNWaJi5hPogHXMNz7TrRO0VE2vnWzr9kxivc8wUxe
         OK7gLumEb2ZkrR9uIClBb6OZss28MaXlXzyRq8E0mc+2/mTQOhmIJZ2utIDzL3KvRfJp
         /afpxle8mWiIOdSiGhQjWZYp/jjL+0l1/18SVQx2RywNCJ8zVEyAze7nfjs9Tqx0k+5m
         Kj5/hL9Eusqrp3aljL9K+JTiOBP1BIPc1DnNo+iP49ZUptXxc4ksC3FGcAIyGuXFk4Ge
         iPeQ==
X-Gm-Message-State: AOAM532VMwCzOh/uV4XRsEyDSJTFDcRS5BNf/JoNHRezLEnElnsPh8v9
        uxT7t+YA2becc5lEJna275ZpObglXvXY+lmv
X-Google-Smtp-Source: ABdhPJyP0E9PR4Oe737gxuFJGWn4XoRN4M8JQNpv8rSkXGchsM7xSDQgpjqmSmgucjjTrLa+z/lBVw==
X-Received: by 2002:ac8:698c:: with SMTP id o12mr8837117qtq.340.1617307736403;
        Thu, 01 Apr 2021 13:08:56 -0700 (PDT)
Received: from ?IPv6:2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a? ([2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a])
        by smtp.gmail.com with ESMTPSA id h8sm4204809qta.53.2021.04.01.13.08.55
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 13:08:56 -0700 (PDT)
Message-ID: <2eefacdbbee1bac291abbdfffb40b09d58c21831.camel@coverfire.com>
Subject: AF_XDP new prefer busy poll
From:   Dan Siemon <dan@coverfire.com>
To:     xdp-newbies@vger.kernel.org
Date:   Thu, 01 Apr 2021 16:08:54 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I've started working on adding SO_PREFER_BUSY_POLL [1] to afxdp-rs [2].
I have a few questions that I haven't been able to answer definitively
from docs or commits.

1) To confirm, configuration like the below is required?

echo 2 | sudo tee /sys/class/net/ens785f1/napi_defer_hard_irqs
echo 200000 | sudo tee /sys/class/net/ens785f1/gro_flush_timeout

2) It's not clear to me what polling operations are required. It looks
like the xdpdock example was modified to call recvfrom() and sendto()
in every situation where previously the condition was that the
need_wakeup flag was set on one of the queues. It looks like this
structure may do extra syscalls?

It it sufficient to 'poll' (I don't mean the syscall here) the socket
once with one syscall operation or do we need the equivalent of a send
and recv operation (like the example) in each loop iteration?

3) The patch linked below mentions adding recvmsg and sendmsg support
for busy polling. The xdpsock example uses recvfrom(). What is the set
of syscalls that can drive the busy polling? Is there a recommendation
for which one(s) should be used?

4) In situations where there are multiple sockets, will it work to do
one poll syscall with multiple fds to reduce the number of syscalls? Is
that a good idea?

5)

"If the application stops performing busy-polling via a system call,
the watchdog timer defined by gro_flush_timeout will timeout, and
regular softirq handling will resume."

Does this imply that if the application fails to poll within the
watchdog time that it needs to take action to get back into prefer busy
polling mode?

On the plus side, the initial performance numbers look good but there
are a lot of drops as traffic ramps up that I haven't figured out the
cause of yet. There are no drops once it's running in a steady state.

Thanks for any help or insight.

[1] - https://lwn.net/Articles/837010/
[2] - https://github.com/aterlo/afxdp-rs

