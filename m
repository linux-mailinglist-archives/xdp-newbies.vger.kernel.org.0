Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05486CDCF4
	for <lists+xdp-newbies@lfdr.de>; Mon,  7 Oct 2019 10:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfJGIPZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 7 Oct 2019 04:15:25 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:37687 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGIPY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 7 Oct 2019 04:15:24 -0400
Received: by mail-qt1-f176.google.com with SMTP id e15so3096240qtr.4
        for <xdp-newbies@vger.kernel.org>; Mon, 07 Oct 2019 01:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gE+7qmttIUpxWf2wCIhJVFYfDHo1x9GX5/I/7PWmYZo=;
        b=XJ4Myx9uOVcJQL9Ed0VQpo/hdVKbbdp/SOJ7nD+28fVtE0MW2HyXF+nlD+z0hj6xJZ
         sHFd3u2M9t7DnBbFhExt0JOZPzFELz8qv1j+6F2eO0oGqFvni7eCS0xU5WQnkQzAfNpG
         tdWWgCLNE3cbFMn0z0vKQHik1JczW/fmwCrTJ+1JOaYx103svmJ4FqiPYcw4Sk5a/g+Z
         2PnYLSywf0jWciFYftb1Q23cUv2ZzNOoaguGTx9z1bwcKrriC3WLDUhBocluiM+cY9fM
         hb1Lr+rHgCfOvh1fuR74lkfSmzchrVCUjzFZdxtHSRFzlk5SHUlW/q5C6p8iiGuGuln0
         wfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gE+7qmttIUpxWf2wCIhJVFYfDHo1x9GX5/I/7PWmYZo=;
        b=TzX2bUeJ5Nwc9yz8WnuGkHIV+jE1SgdnvTXt/BLWzBdToGbClquDSDhP7yP6ctFJLg
         6ihyTx4crGXd1eIKCWgTspHPstplnP6rkU/fzF9k95c5vLgYJ/c95p+sKSk4oven6ktp
         UEaX3brVEyjAC0O9He0MEdu/aPPWjfieT2FGuiLqIOCa0qX8fFZ3D4BKP/QYNTGP5phK
         CjdvHpVtUdRUHAz4iKR8+X1tZUOCvIjoq6ZJU8vRpmsWT7ydbzCehlkD5Ku7lxACwazs
         O3l67wjpNJSAtGcBMx/vL4bGAK0JWasqFGfUs37wRAxb1ND+3R+4tTxVcl5AojUCgx1y
         qP2A==
X-Gm-Message-State: APjAAAU9tSa9LpjG2cYqeXPO+XT4nUo2uNFyV5b7pgZPyTZ2hdxk13bo
        wHHEbEyRkl3uY3tr5PZqXA/5Ur3utIe+FdNO88HVciUy
X-Google-Smtp-Source: APXvYqzsphoIlmygE0/TvzDsLitsp/4v1gQbpJfVVQ8CRJUUAvKUl49/w/KqclXToJRK1xKVGpvI9q9m+HIyGptsmd0=
X-Received: by 2002:ac8:fd1:: with SMTP id f17mr26700380qtk.213.1570436123748;
 Mon, 07 Oct 2019 01:15:23 -0700 (PDT)
MIME-Version: 1.0
From:   Radu Stoenescu <radu.stoe@gmail.com>
Date:   Mon, 7 Oct 2019 11:15:12 +0300
Message-ID: <CAM-scZMSvAE0jny0b__Da1j=krBB38J8w_H_12s=sy7T=F0spQ@mail.gmail.com>
Subject: Unable to run eBPF program that uses maps
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I'm running this Ubuntu: Linux anemie 5.0.0-31-generic #33~18.04.1-Ubuntu SMP

I've cloned and compiled the Linux kernel - the same version and
config as of my machine's.

When trying to run the xdp_redirec_map sample program from samples/bpf I get:

sudo ./xdp_redirect_map 2 1
#=> failed to create map 0 (tx_port): 1 Operation not permitted

I read that, on certain systems, the default limit of locked memory
might pose problems, and I mitigated that as seen below:

ulimit -a

core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 31231
max locked memory       (kbytes, -l) 1024
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 31231
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited

What else can I try?

Regards
-- 
Radu Stoenescu
