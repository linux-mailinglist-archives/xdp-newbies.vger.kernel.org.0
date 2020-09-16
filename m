Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871D726BBB9
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Sep 2020 07:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgIPFMa (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Sep 2020 01:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgIPFM1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Sep 2020 01:12:27 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5C5C06174A
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Sep 2020 22:12:26 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id j2so6866749ioj.7
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Sep 2020 22:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DS2VrvWkE8SimzyR6eK7yGFoT0jbdCD8HbrhnhaJNvg=;
        b=Dr/jAIAwDIyZpvlASYp9mW8QLwBxUJkGptSuukIlagXGnpBe2+1AGs3NKBfDJlzlx/
         V1UBcdvKiveBWwUYM/ROwkU82S5dWrnSKEYOYVXctTX0JkhwvNcJjeoSFPc1uEshItaK
         whMIguO5BsclAdpVw8DLveL/TeeXT0Z3piTLkn36filbliZ2eARpTKu50+I15z6QFWhm
         qfyLq/XdR6CUbyaZ1Q+y7cqVNIKomAf/EZ6TZjm5nxG6Hxi6ebQo10Bd7CYqh0sFzwPr
         A17XSdrOS09i6qkRps8HTV4OuLRjiPnreGujyTemz9TkzhohyE7wl+4Oj5TxlrUyi0HI
         Ns4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DS2VrvWkE8SimzyR6eK7yGFoT0jbdCD8HbrhnhaJNvg=;
        b=fwH7EAPNgF/4JzIJUvl+5NWRFfgphqZfXFRb4VY27HUf8/Qz6NC+Nlei2b3DpF0e3e
         nsBnA7z2hPYtEhc0MKDicqsjpkBBPduqUT2G4Cz6WjCAfx1x4RyRT/LrJ19dQofrzzWs
         eciXJNB+h8euA92vi8hwfmhCFUUWKUjP2fTh+g5gpRC/Q1CFSZKh+7c84ybEeTF4J2jm
         OKRQSTv6bCwZAgNFkQA+xnzACPG27Y0J2CL4cAp3qnDMTgy3SuelWED3JF2L36s1Tb0U
         CW8RWCkjvvxAPriNvCnmE6VYxaBdIX9CqoHhP0TK1cisNbVUV084TtxvpVGz44d04+02
         fCBA==
X-Gm-Message-State: AOAM533KidfWYJMnFy7SnqkJryNMoUQPPF5G9UX6FqCr78sBMWANnL3j
        DGBFKj0hZKAThtfgTvE7JO+yAlct9Y1f0Z9NFhec79c1CYo=
X-Google-Smtp-Source: ABdhPJy/tCdL8HCnwIbFqtzyB01/tL+pO7z7Y1uUM0eFrHVBpkNYgdZw3Br+5ZR13NiXmnk3M3M76iyvvo4d7J1EAHI=
X-Received: by 2002:a02:b199:: with SMTP id t25mr20161608jah.124.1600233145752;
 Tue, 15 Sep 2020 22:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
In-Reply-To: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
From:   Y Song <ys114321@gmail.com>
Date:   Tue, 15 Sep 2020 22:11:49 -0700
Message-ID: <CAH3MdRUUEHMeTjpNy=a0Q0CnJeXioFzCuoBVpdnu3gKhm5D0pA@mail.gmail.com>
Subject: Re: Using pinned maps within a network namespace
To:     John McDowall <jmcdowall@paloaltonetworks.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Sep 15, 2020 at 11:46 AM John McDowall
<jmcdowall@paloaltonetworks.com> wrote:
>
> Hi everyone,
>
> This may be a dumb question, I have set up a simple test environment
> with multiple network namespaces running on a ubuntu 20.04 vagrant
> box, with the latest github libbpf.
>
> I want to use a pinned map, I can make /sys/fs/bpf shared by:
>
> $ mount mount --make-shared /sys/fs/bpf
> $ mount --bind /sys/fs/bpf /sys/fs/bpf

Similar commands `mount --bind /sys/fs/bpf /sys/fs/bpf1` in the same namespace
works fine.

Maybe there are restrictions related to namespace? Maybe it becomes readonly?
Could you print out the error code below?

>
> but when I try access the maps from a C program running in a namespace
> using bpf I get
>
>  Access to /sys/fs/bpf/lwtconfig map failed obj_pin errno: No such
> file or directory
>
> The code snippet is:
>
> mapfd = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);
>         if (mapfd < 0) {
>             jed_info(jed_logfile,"Access to %s map failed obj_pin ",
> CONFIG_MAP_PATH);
>             pin_fd = bpf_obj_get(CONFIG_MAP_PATH);
>             if (pin_fd < 0){
>              jed_error(jed_logfile,"Access to %s map failed with
> obj_get ", CONFIG_MAP_PATH);
>             }
>         }
>
> Is this possible, and if so what am I missing?
>
> Regards
>
> John
