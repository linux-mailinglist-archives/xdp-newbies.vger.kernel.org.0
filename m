Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B404413B11
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Sep 2021 22:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhIUUFo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 21 Sep 2021 16:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhIUUFn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 21 Sep 2021 16:05:43 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A933C061574;
        Tue, 21 Sep 2021 13:04:15 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c4so179228pls.6;
        Tue, 21 Sep 2021 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lKZE2FHQtQiFIRKvNjn0PTcUcwcfzMHpmLVl/TYiwAw=;
        b=TyZo6YEEOrDTnMclGAoMvfyvROPXhC8ukvhObU4D0otO5ZBe589kYQZ+rVjchbN+DO
         7TNuLjGJLlTbwyThsbZkl4CwUu6LVrBnIDkg5JrnNTkBunO6pKtxBhzsMyOxNNmuCrxx
         3atrcSO/y7Xq1X9MRwixj71iSePQDP03V91FJclDTqSBJlwZr5DAPgqYXThgFRTZ6Aqz
         Z/aToNfSCC5qEw+Jxg997Uds6VvzVRbrtGm4O+FtUl808oLjAo3cdnrmLfL+Bo0nKtlq
         7/WdRQ640a5xixRP9Z0qJiYgTE6xC621ebzcx+ERbTfPezadlzPb/Gc+mxG9j3kl7Kau
         aIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lKZE2FHQtQiFIRKvNjn0PTcUcwcfzMHpmLVl/TYiwAw=;
        b=2dUYUTFu6ytEDkQH5XImfqyHdSNEq/nLUMWFJQLWo39XwsQYgVIY5vksr/7jrhiuus
         XBvSXdl/nQrAxcXWZWIuEIS0ajoeiXHHE77fnLWtyTBkU6dmP29i/YKSberldMzJsFz4
         e8bqht2Y6v8icjtt8D7+3Ngo2dDjKmbS3HY9jxHshPAHLSbq0S72cyOtFPm/4XmO4adS
         p4afoCLoMOA2+Wfe6uC8JXwTWSZ1APmoV2L44oOyD9fBvWwmDWX76kxdI/eUo1P8Brl5
         BaAzYwfEvduNzzGP9nn2fMj0z7TjkAqWfnjm38n0uU/2wwaUOBiy+QvLJqDexYNPxFAS
         DrLA==
X-Gm-Message-State: AOAM532k+5k+pKyfAErGq6Vp+NO9L7TVMX1qgfO+GcdiH6VngMqJGCYo
        h3Y99wnIfDaCX65TDbb3b1HLdO9SO4Os7W3ud/BeBbzbjxw=
X-Google-Smtp-Source: ABdhPJza29uUy9VxesivMMQaXATmxuAxrF3+TBjW24FORIyv+O/fxkqYwjbDqsLeuR8lim6xa/xpWZrHf9sW+AiLdbk=
X-Received: by 2002:a17:90a:19d2:: with SMTP id 18mr7228148pjj.122.1632254654363;
 Tue, 21 Sep 2021 13:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAC1LvL0670CWq183g54w3HGsByjcBaBL2rrTP1PyTbbYfm76iw@mail.gmail.com>
In-Reply-To: <CAC1LvL0670CWq183g54w3HGsByjcBaBL2rrTP1PyTbbYfm76iw@mail.gmail.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Tue, 21 Sep 2021 13:04:03 -0700
Message-ID: <CAADnVQJYmOrTq47r413WDcVurv8hL0zS4yUdgwghanA6ffxSXw@mail.gmail.com>
Subject: Re: Pass a map to a global BPF function
To:     Zvi Effron <zeffron@riotgames.com>, bpf <bpf@vger.kernel.org>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Sep 13, 2021 at 10:44 AM Zvi Effron <zeffron@riotgames.com> wrote:
>
> Hi all,
>
> We have some map-of-arrays that we use for tracking labeled metrics in
> our XDP code. The inner map tracks the metrics for a given label,
> which is the key in the outer map.
>
> Our XDP code calls several global BPF functions (freplaced, so can't
> be inlined). Currently, each global function has to make a lookup to
> get the inner map to record its metrics. Now that non-context pointers
> can be passed to global BPF functions, is it possible to pass maps to
> these global functions?

The program can pass a pointer to struct bpf_map and the verifier
will recognize it as PTR_TO_BTF_ID.
It won't be a CONST_PTR_TO_MAP, so secondary lookup won't be
allowed, but if that's the desired use case then the verifier can be extended
to recognize it.
