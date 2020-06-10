Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184921F5109
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 11:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgFJJVi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 05:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJVh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 05:21:37 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B9DDC03E96B
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 02:21:35 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id 190so802857vsr.9
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=wrjX1VjjnsL6cuxa3TB142dXk1tgwtF7a3/VOP9X9MU=;
        b=BOuB7YVN+L8yBSQn7NyvO/RzYo4NNjllgAaMJh+Hy4GpkNscDsJONiVr8gUVfmk50U
         diUNax1yzWMpBF6hyVTjDU0xxPq7Pm+X1hBzJ7aoWg0qhp8vCXg5yGY+ey33mJwzPtON
         124KP43fbQaOePiBA58gxT0pgaDMRg2P9fg1ozV/B3IKtaSMMf3zQ4lZFMVnF+3tJ9Et
         tfa3I17DEOYbiikqwhQudCJFb//nDHUtewHzomG+4SWqjddhhJ/sbZ21CKlGHw7nI3BQ
         l7IFPH9lJ5j/GIWyx2CrkGJOUJVP32mPdzdHvlpt/cM0lKijEhyj+6jjOI+j9TTzGGYl
         im6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wrjX1VjjnsL6cuxa3TB142dXk1tgwtF7a3/VOP9X9MU=;
        b=UOKS4Yl83Rs00xqRPMHXxcmQEnZLiQY5vsloKwpwakvxvBXpJ27/TEz/z6wgB+rHHr
         Kj9arC5pAKV+Q7zPHT3uf/CYnjM1EGbteRCVS5E8bj5rojzz2agl33yujg0YEnLwqbQ+
         aiJWrVLxE0uCJ8E8c+X93v3wkry4ycMBRCO0DieKqmPSMZWgiltj801UQw4RDBcM+YS9
         E6TdsjVln8t5gPfSJzk4Pb7S7ag8eWTzSGHPDbcKMEUYeV+0p5hkpGHX6OcTOv6JY0Dg
         wz3Rawj2umo+l4gP4K0CxtF7HovJHJM0HQi+IP93oGU7+1FiGqWVnsbliqmUKsx3tX7C
         B1ag==
X-Gm-Message-State: AOAM532sQ+uzkouxoc93X+x9tVFJDRWh6BNNM2eVx4LGliEyktkkc0Db
        1rWYchuIorRt4ljgS3mXWUOZq1V7c66TrR+OSarqJTJLHvI=
X-Google-Smtp-Source: ABdhPJxOn0KZltu93vpW23ONtMNfEweqmpSeos9/06myyJGswWwTnB0CHRCKPk3/7ke0/0Q6TX+zP3XoOSQ77KaBfWQ=
X-Received: by 2002:a67:e957:: with SMTP id p23mr1704091vso.190.1591780894417;
 Wed, 10 Jun 2020 02:21:34 -0700 (PDT)
MIME-Version: 1.0
From:   Elerion <elerion1000@gmail.com>
Date:   Wed, 10 Jun 2020 02:21:23 -0700
Message-ID: <CAMDScm=VZJMZYN=SXo9OAshY=yYxwtavLDgTvu1qEasg77JyLw@mail.gmail.com>
Subject: How to load BTF style maps?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I have maps written in the old style like this:

struct bpf_map_def SEC("maps") xdp_stats_map = {
.type        = BPF_MAP_TYPE_ARRAY,
.key_size    = sizeof(__u32),
.value_size  = sizeof(struct datarec),
.max_entries = XDP_ACTION_MAX,
};

I changed it to the new BTF style like this but now the example BPF
loader from the kernel doesn't work anymore.

struct {
    __uint(type, BPF_MAP_TYPE_ARRAY);
    __uint(max_entries,  XDP_ACTION_MAX);
    __type(key,  __u32);
    __type(value,  struct datarec);
}  xdp_stats_map SEC(".maps");

I used this to load my program
https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c

But now it fails to load. First thing I noticed was the I had to
change "maps" to ".maps"
https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c#L563

But then bpf_create_map_node fails because all the arguments are 0. I
dumped the buffer here
https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c#L489
and it just copies 28 bytes of zeroes for each map I have.

How do you load BTF style maps? bpf_load.c doesn't seem to work on them.
