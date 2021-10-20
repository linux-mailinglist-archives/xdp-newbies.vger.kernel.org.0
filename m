Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE58434727
	for <lists+xdp-newbies@lfdr.de>; Wed, 20 Oct 2021 10:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhJTIpg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 20 Oct 2021 04:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhJTIpe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 20 Oct 2021 04:45:34 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6785CC06161C
        for <xdp-newbies@vger.kernel.org>; Wed, 20 Oct 2021 01:43:20 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id v20so15621382plo.7
        for <xdp-newbies@vger.kernel.org>; Wed, 20 Oct 2021 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=takMGdb35wZ2Cy3SNYTPTWN4xv4WzqlMPO04hQHipk4=;
        b=mftqu+1MSE/pZajR1CRRuZqH8HJl0+6LYuPPT5W1konDm/qvy9ysvG6KLww+hMm8bf
         7Kgaz981qiRBs9x2USoUGvWZyMo3fGto8lq6gRM9ZbE97ltJ84O57Lil8tb2RORn0HiO
         01kfslhfwwCwQBp8NYTk6+rOrWUuUbu1LXQn5n4Rsyy+KwVNBw81HcPbQ0DazcZE4nzi
         SPA0JzqM+rXpxJDlvoDxhiciDkpl8ZWu85q036ytNl5oeuZy5jn6+4B4S51UZdOwpKV9
         gQsgqHVG+l/55ILYCSErQ4jlZ7xUyAcRpylICaujlvdSNjoAmVTmh1wR1ftAlnjQqPg9
         +t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=takMGdb35wZ2Cy3SNYTPTWN4xv4WzqlMPO04hQHipk4=;
        b=LQGPVB4fPPMBrHxrmkNDjTme6QjIT2QDMoSWLspkjacN/i+U4qXAgs4kaysAHFxW6e
         LhySGl69ZsXzajDTWeJmeCVVBZN8d1xL7+ht4AAIMEjNeSsJDZIkZYeQkFuYTqOKsl+v
         l9M48tttOBIJt0OOol8FIL6BzEOCG3e2AUzzISxVSUWoz2BsWUkKwseRm7CJLTOjEP4o
         nZceEbnWfHLY24fTjouPJsLuys0pSnxU3HwNy+BTyFF7vdlbMnoJvvsGEKJbRvaI6wuY
         h1aR6J/wOgEDW6FpEHu26fL8UXklhpsR7u4zrEbViIQUXa257tbfUNj6nhOsC7vMixEX
         QUDA==
X-Gm-Message-State: AOAM530jPQ69Ec5v++J8PlcLuj05tcixYKwAXCpKF4zSE51StRIWL85E
        fLmU31FMsqgbJVlzmtP0gyZKwTXUjgCR07KN5wSl32dn+9A=
X-Google-Smtp-Source: ABdhPJzkTViXd+Qn3xBMpyna8obpRcMwjhbTRkjWOQfn+MWNhk159QQr6luSRTaotj8voMs0OCAJm1+aRtLASoXbdnM=
X-Received: by 2002:a17:902:70cb:b0:13e:91f3:641a with SMTP id
 l11-20020a17090270cb00b0013e91f3641amr37565493plt.13.1634719399584; Wed, 20
 Oct 2021 01:43:19 -0700 (PDT)
MIME-Version: 1.0
From:   Harold Huang <baymaxhuang@gmail.com>
Date:   Wed, 20 Oct 2021 16:43:08 +0800
Message-ID: <CAHJXk3b1Hj9Xp_v0gEXf6TB56-P7T=jVQ9_mzTVwhUFSKVJjOg@mail.gmail.com>
Subject: Use shared umem in CentOS 8.2(4.18.0-193.el8.x86_64)
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi, all
   I see in libbpf 0.3 or higher version, xsk_socket__create_shared
function is added to support shared umem. I also want to use shared
umem in CentOS 8.2 with a native kernel 4.18.0-193.el8.x86_64.  I have
updated libbpf to v0.4.0, but the samples/bpf/xsk_fwd is existed with
an exception:

libbpf: can't get next link: Invalid argument

The function is existed in bpf_obj_get_next_id where it calls sys_bpf.
The gdb trace is showed as followed:

#0  bpf_obj_get_next_id (start_id=0, next_id=0x7fffffffddc8, cmd=31)
at bpf.c:806
#1  0x0000000000421b4d in bpf_link_get_next_id (start_id=0,
next_id=0x7fffffffddc8) at bpf.c:830
#2  0x000000000042e393 in xsk_link_lookup (ifindex=1, prog_id=0x0,
link_fd=0x7fffffffde1c) at xsk.c:685
#3  0x000000000042e602 in xsk_probe_bpf_link () at xsk.c:740
#4  0x000000000042f0a9 in xsk_socket__create_shared (xsk_ptr=0x724838,
ifname=0x7fffffffe4e0 "peer0", queue_id=0, umem=0x7242d0,
    rx=0x724778, tx=0x7247a8, fill=0x7247d8, comp=0x724808,
usr_config=0x650720 <port_params>) at xsk.c:1075
#5  0x0000000000403831 in port_init (params=0x650720 <port_params>) at
samples/bpf/xsk_fwd.c:499
#6  0x00000000004047c0 in main (argc=11, argv=0x7fffffffe1b8) at
samples/bpf/xsk_fwd.c:1012

Is there any way to support shared umem if I only updated the libbpf
with a native kernel version 4.18.0-193.el8.x86_64 in CentOS 8.2?

Thanks
