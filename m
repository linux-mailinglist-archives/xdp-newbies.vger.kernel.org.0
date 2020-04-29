Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A5B1BD1ED
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Apr 2020 03:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgD2B5a (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Apr 2020 21:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgD2B5a (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Apr 2020 21:57:30 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4C3C03C1AC
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 18:57:29 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w2so267978edx.4
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Apr 2020 18:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYnLs4yNZkBSeyYVlJ6LkcdoC0wVqzkFdNTNgeShUpY=;
        b=gl84FHZBb/3/GtYHRC0UYjPv+AMABG3abRiL9FGzLoWRiFfRKmzgg5rlbOsjsXtGgJ
         CjZNhloskT3ESIr/x+FlAAE5lElIRBw6h0jyWRD9MXpcr3NufGLJu4E1AgRTcnbQf63m
         m75ol9wixhf4oaB+ai+5PY8Sb3zs7hl8/jNAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYnLs4yNZkBSeyYVlJ6LkcdoC0wVqzkFdNTNgeShUpY=;
        b=b/+ogY7tVA2NSnXkxppzGIts+FUgqLdTzaWXomSKaNvjgeLxueJvC47ItZ06GRvI7e
         7cIWtnSMluqta6v1DrOiVDj7XXuLtRqj+f1NWiRMg3nkS2BJoY6S9H5FCYyjwQJ3e0VK
         aOcn5UGssIysVNVvtSH4ORxwXHL73hxR8YaZtdC2EOUEghwJULKB2pCqUC1oH+WXbOxs
         PAuoPR5iRveEmD3te0PU5tTyVoTjofl6qQ4s/NxOZj8u4h68UqHMLoGZVMa8+zhwgMV2
         VFi0LCfEb0KqNUMZW+H0osfmVCvJb8n6ctXpbt+p3oA835zM1XhPQBuNRgHf2TJEUzxL
         Rebw==
X-Gm-Message-State: AGi0Pua+WMNGCe7jqXHZVyGi++4lvKp2GfRURnaRucOUpan60lGhJZAi
        XSC7ijNrpi6mzXoNDmszbR2U/f7nn/ocgpH30mq1wLuMsGq1fg==
X-Google-Smtp-Source: APiQypLgLY/A/qWr52uAZZSESEJS1h0S7c02LkvraIR0QLatBrk2rXT564v0UsNQHcYAnJEg5Z33Z2jxHcaM5cyhTUc=
X-Received: by 2002:a05:6402:6d5:: with SMTP id n21mr538464edy.82.1588125447952;
 Tue, 28 Apr 2020 18:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTZGdLYZ=qjF8+Rwi+E5y_st1u1CwMPiP65UHWpvRXvhZA@mail.gmail.com>
 <60973878-18e8-aca3-5b4b-26947dc5ded8@gmail.com>
In-Reply-To: <60973878-18e8-aca3-5b4b-26947dc5ded8@gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Tue, 28 Apr 2020 20:57:16 -0500
Message-ID: <CAC1LvL2sVd428n3PwhDbwVoDGk5wh4s34kNj=GVkRM5X44A2+A@mail.gmail.com>
Subject: Re: XDP Native mode with public cloud (GCP)
To:     David Ahern <dsahern@gmail.com>
Cc:     John McDowall <jmcdowall@paloaltonetworks.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Apr 28, 2020 at 12:19 PM David Ahern <dsahern@gmail.com> wrote:
> last I looked AWS does not support XDP either. Never tried Azure.

XDP just recently started supporting XDP. You will need their
out-of-tree driver from https://github.com/amzn/amzn-drivers/. It does
not support XDP_REDIRECT, and I don't think it supports AF_XDP, but it
does support XDP_PASS, XDP_DROP, and XDP_TX.

I have verified this today on a Fedora 31 based image, though it does
require a few modifications to get the RPM to build.

--Zvi
