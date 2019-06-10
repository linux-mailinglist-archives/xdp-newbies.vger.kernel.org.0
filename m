Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7CD3B292
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Jun 2019 11:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388395AbfFJJzT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Jun 2019 05:55:19 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:39992 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388347AbfFJJzT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Jun 2019 05:55:19 -0400
Received: by mail-it1-f194.google.com with SMTP id q14so11111674itc.5
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jun 2019 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/CJHi5sfyqplWN+bUkqAdt3Fom3eT+iMsUeLy2adrzw=;
        b=Jbs2CxRx/IQ4c56YEMfkF5LFnrKp2+e04z36HHrWebJJUj7WUnmfi6B4zAcejHBQss
         2Lfh3rPgi8XVDw4gbLtsC0ToQ+2qbQ4D68s8wy1YYXOPzTve7AMBO8G0ljXLng/MCR+2
         AK/A6HsG/4O//b8h/etILKFuVHuxml8jKP1RMa33p+vkaQ+bq71yKP3x4B2XfkWd3ao/
         3trdOgu2GojXARgpyDeuK/z6dHxDEKnzqTJcPtozh41fQB8wDXRLWBbCrjTOtMKkBHZ7
         KaxQivLqhczcY7Wtk8pGnihtYoxJ1JuqZWBOVw9gl8MsTz98SbyFEWtqduT1QwyQzY76
         2prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/CJHi5sfyqplWN+bUkqAdt3Fom3eT+iMsUeLy2adrzw=;
        b=XVQ6KJPLzehdx++/MipzSGNDvDj9f4Oxd8O/uckCDgIVItR97q65BvRnzaUXT1m6w+
         QiSt8bbhOj2+34d01IbqCe7wmVc3cVxZeADihQ9p76NkehJcYdsdXfHQ96n6EZEfLpYa
         kkAmr/4Q0pD5s+G5SPHC7++Esc6861roxmZjPJHi17goxIRacGHO+VlAl3PpE6eG7xX3
         JKjmk5Q8LEcUQ9DWmlhvlpfWVUaYfJQmNuKF+tCHZFiTQUA/LkXcfKim6536ZhBQ/h36
         GAKxL86HRoByxLOvK9Ywe+sdUt5rmYc2xaF8QcESCIRPmiJoT0oUyqlSiN2Nm9dfIYu8
         1Whg==
X-Gm-Message-State: APjAAAWmEB33HlHyEyI1f65K/nn+IH+lQeY6/XqMvnOWUrKrVG6FSkrC
        fKe0qwHmu3sJaL65p/7pdjxnghsLLs+wYshuDzGJFdeeocCqSQ==
X-Google-Smtp-Source: APXvYqyhDUj1o8bm+OrgRosyKavh0q0PsrGDVevDoX+ayOsCUyGxs+x81fYoJI0jPanxMOs4NVMVGbP1bkBJn/5TtuY=
X-Received: by 2002:a02:5489:: with SMTP id t131mr43022050jaa.70.1560160518099;
 Mon, 10 Jun 2019 02:55:18 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Date:   Mon, 10 Jun 2019 12:55:07 +0300
Message-ID: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
Subject: ethtool isn't showing xdp statistics
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi.
I'm trying to do a xdp performance test on redhat based environment.
To do so, I compiled kernel 5.0.13 and iproute 4.6.0
Then I loaded compiled code to interface with below command.
#ip -force link set dev enp7s0f0 xdp object xdptest.o

After that packets dropped as expected but I can not see statistics
with ethtool command like below.
#ethtool -S enp7s0f0 | grep xdp

ethtool version is 4.8
I did my test with that NIC
Intel Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (rev 01)

I wonder why I can't see statistics. Did I miss something while
compiling kernel or iproute? Should I also compile ethtool too?

--
Ibrahim Ercan
