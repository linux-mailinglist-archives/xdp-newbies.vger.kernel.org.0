Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3431DD29B
	for <lists+xdp-newbies@lfdr.de>; Sat, 19 Oct 2019 00:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389752AbfJRWND (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Oct 2019 18:13:03 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:43792 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389659AbfJRWKE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Oct 2019 18:10:04 -0400
Received: by mail-pg1-f169.google.com with SMTP id i32so4068299pgl.10
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Oct 2019 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Zm3Gh917n5Sf0IDi1PBENc5AzHhAR09wf9kMLLHbr5A=;
        b=Ca6ljCEReWfnm0vA4D0Fkc0sWBEuq1Wx3XT2gBOJfcKgPIxi8uLibSAbZgpZILo96X
         RfF2bk9MnGklw/+cHD9vTAaLQpiE5rMbQBduyHaz9+5G2M9xl6JnaevIPl8XCzeXDTA5
         ss8dim+FSM9lqAV8FbYgdOOxUyMIXDBNrFT0Mh5Ghjikh/uWZR57G4Z7gGsgwgeaxdJN
         Y2IPM1GfBEmVjT9gJmcmyg7s0ybIOYlBV2JLPLbwaPgN7X3O/oF1NOFTJfwi6rih1S+Y
         O/KMBVjCQcbDl4cKoxQn2SvdK5uPMxvyEum6EpnrjNjIv5JUmDKjDoukUGzwiMU3yzYR
         Zz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Zm3Gh917n5Sf0IDi1PBENc5AzHhAR09wf9kMLLHbr5A=;
        b=Qx9Zu3OXq6fV/uLxOto60V+qtxv0HgN21hlIroOAWkgQXWKOxKGrLgG7HkeE0lRWT6
         /69eliGh02rSJvc9me55VRUU1jNvUCs+dmX5WH0EmgKT+eJcnIvVg2Mh93TF4xZ9pnM8
         Qd2DptP+LkJ7IokVhYixUyzHHohsc1PhX4gBX0BUqyDJ4m4WqDS19pGvE7oec1MUqv0u
         d5YOrE1wp47cW8YL8cquoqpeSuUWRaxN58bLgGrwYnh2wXn9ZZ9YWFeYXjP2RcFK+IW7
         7QcvHhxK+ZxeZLa0QSTX5Bb4uhU1+Msda69rp/8aAsq5dVCeBi31HMcid4hIlQ5Y5ZhH
         ahVg==
X-Gm-Message-State: APjAAAUixb+LxrLQpG/FUq+YguMXT87loSjtsYFbleViAPjKlzfAhnXf
        M7jC3OwGSPOgLv4nMmgzC9KSVRlVhDlTlfwzdOTFBT2R
X-Google-Smtp-Source: APXvYqyWhlyBwGR/WyisQDse3+3uilGbwdbmn0qvbH+a5epnnn6dS8qaJ8+AsiDv5qaC+Rxd/mEsCgMbe8SuKOjo/qw=
X-Received: by 2002:a63:f418:: with SMTP id g24mr12547734pgi.15.1571436603397;
 Fri, 18 Oct 2019 15:10:03 -0700 (PDT)
MIME-Version: 1.0
From:   Farid Zakaria <farid.m.zakaria@gmail.com>
Date:   Fri, 18 Oct 2019 15:09:52 -0700
Message-ID: <CACCo2jk9rx3sf78RPFr39-JVZgaymsJVd6vg=WMKLmWfYZrNaA@mail.gmail.com>
Subject: sharing a simple ebpf code sample
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I just wanted to share a code sample I put together which does
MPLSinIP encap/decap via clasct (not xdp).

https://github.com/fzakaria/ebpf-mpls-encap-decap

I know there's quite a few samples in the Linux source tree but I
found them lacking in terms of comments for someone new to the new
space.
(They were more geared at demonstrating a particular feature
specifically rather than simply instructional)

Learning & using ebpf for a project at work in a similar capacity
(encap/decap) has been a joy/fun to work with.

Cheers,
Farid Zakaria
