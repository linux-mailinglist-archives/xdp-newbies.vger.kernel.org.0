Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E45A370487
	for <lists+xdp-newbies@lfdr.de>; Sat,  1 May 2021 02:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhEAAqW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 30 Apr 2021 20:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhEAAqW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 30 Apr 2021 20:46:22 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F5BC06174A
        for <xdp-newbies@vger.kernel.org>; Fri, 30 Apr 2021 17:45:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u3so29053235eja.12
        for <xdp-newbies@vger.kernel.org>; Fri, 30 Apr 2021 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:from:date:message-id:subject:to;
        bh=qvpi1EZPS1DStDyVSXfyyJOLmUG+1a9V48otBcMrS7A=;
        b=fjnp48uzdDk0acC8Zi77UPEeoXLIDIo5J1MoHAiS6D2pso0Vsu39lv/G+9b8OM07ed
         6qgd22CQhW4mRSnhe091XejzMZjgmUp7RL2oO+/YmAiBwSnlW6UyG0wzoyWEGShfopgy
         N32v79UfGqA8G2SiOa7lK5KK83FEbxGJllNmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qvpi1EZPS1DStDyVSXfyyJOLmUG+1a9V48otBcMrS7A=;
        b=rU4e6BwZbRJDb/SlxWE0r4RpPB9z+jxURHNHYn9LqiqtiCnZUwFmGUVReHdaDIo1sc
         y+Jw4zzhJdpMjvfpK8an8Ve1QLRlR3uC7JG0UzMoEnDyk+xVA6KtErr3qqBpJHOj2gXi
         cPjoD+ytA+1Fy/yVZ6YKwKvkCXCQ1NjZE32dJpeWAtOSDtlLoGPvtspQyq578zuQRYFH
         dGlWJ/CKWXSnlKl9FLVnRvfsUBCmH49Jx3vQJpmOtlskj/LToWkj1LhXF50hgsucK6qi
         pSyRp4nUexNxWL0Z6Mch59B/eyj9+fuLgYhSQb8WFQU5tsdRgqu6bCbmYHc5YlNGGrOr
         NPqg==
X-Gm-Message-State: AOAM530Yk+Lo7H8AFJgSZrNG4P/DWucO8GU35x5GXlD9QnrMvvb0Z4E9
        QxDuCxLZ3sfCQHEImNT6RiiZSdGpydo3T3LqQiyrFZ3KwRMUYNsk
X-Google-Smtp-Source: ABdhPJyrjEPDK4/HfH4NWOLNyazhGy7UBD51lbaEs7jnAm7+RVkdiYV0EXqddIpPpBsQuwLYpHWN92SLNLwq1K6XKWQ=
X-Received: by 2002:a17:906:1284:: with SMTP id k4mr6838714ejb.409.1619829930285;
 Fri, 30 Apr 2021 17:45:30 -0700 (PDT)
MIME-Version: 1.0
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Fri, 30 Apr 2021 17:45:19 -0700
Message-ID: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
Subject: Dropped packets mapping IRQs for adjusted queue counts on i40e
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi-ho, friends!

I'm trying to tune network queues so that there's one queue per core,
as recommended in many, many places. I've noticed that if I adjust the
number of queues from the default AND adjust the IRQ affinities, then
I get some percentage (varying from a small percent to 100%, seemingly
proportional to the number of reduced queues) of packets not making it
through.

For my setup, I have a single 36 core Skylake processor with two dual
port X710 NICs. All traffic coming in one one port of each NIC is
redirected out the other port (traffic arrives on all four ports). 34
cores are isolated for network processing. I adjust the combined
queues from the default of 36 down, and then map the IRQ associated
with each queue to one of the 34 isolated cores. Everything works fine
if I don't map the IRQs.

For a minimum repro case, I reduced my program (reproduced below) to a
blind redirector using a devmap (it doesn't even adjust MACs, which is
not a problem as my DUT is directly connected to a measurement device
in promiscuous mode) reproduced below. I use bpftool to load 4 copies
of the program and pin them, use bpftool to configure the egress
interface in the devmap, and then use ip link to attach the programs
to the interfaces.

I have played around with when I adjust the queue counts and IRQs
(before attaching XDP programs, after, XDP attachment in the middle,
etc.) and it doesn't seem to matter. But with any ordering, if I just
don't remap the IRQs, everything works fine, and if I remap, I lose
packets.

Has anyone encountered anything like this? Does anyone know what might
be causing it? How can I assign a single queue to a single core
without using the default number of queues and without losing packets?

Thanks!
--Zvi

#include <linux/bpf.h>

struct bpf_map_def {
    unsigned int type;
    unsigned int key_size;
    unsigned int value_size;
    unsigned int max_entries;
    unsigned int map_flags;
    struct bpf_map_def* inner_map;
};

struct bpf_map_def __attribute__((section("maps"), used)) device_map = {
    .type = BPF_MAP_TYPE_DEVMAP,
    .key_size = sizeof(__u32),
    .value_size = sizeof(__u32),
    .max_entries = 1,
};

static int (*bpf_redirect_map)(void *map, int key, int flags) = (void
*)BPF_FUNC_redirect_map;

__attribute__((section("xdp/test"), used))
int test(struct xdp_md *context) {
    __u32 key = 0;
    bpf_redirect_map(&device_map, key, 0);
    return XDP_REDIRECT;
}
