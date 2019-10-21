Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D34DF57D
	for <lists+xdp-newbies@lfdr.de>; Mon, 21 Oct 2019 21:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfJUS76 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Oct 2019 14:59:58 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:44208 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfJUS76 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Oct 2019 14:59:58 -0400
Received: by mail-pl1-f178.google.com with SMTP id q15so7065688pll.11
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Oct 2019 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8aOL2YZ0jhFAMIlR2WVxQ6RiMNZi6Jl9Rh342kBzEmI=;
        b=mjcPNV29+t97E6w/o66NZj03EsifWyktVuduRDGCS+1bH0NcubPH7hm19YjqBg62TX
         Wf02ZdKm/52SeQ8xj579PIYgwNv+nAltLi0uYB5gmBFOquBQQrano+QxfPaQv6NbSPv5
         b2WpVBaGZFkfC+WPakAbtI66i/1zDcmi2yncFhzgM5FrmxZR6hthQ90s6bseuW8X1Mby
         A7Mk7vnDaU1BxQz0t5OT45c1hLsuJA0YhFFsWqH2l4RCyiYqImntfuzhY8g7n7IProfq
         ZOaiPVqsHM43nn/ciJIngWkZw7Wl6VlwHX4czULM9rtGGF16AJV9hKZjk8xkAbAoha4J
         zj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aOL2YZ0jhFAMIlR2WVxQ6RiMNZi6Jl9Rh342kBzEmI=;
        b=TKzvgwnODTzFOdTCX/FOND/BiJPk6byK/aBrV45g/pbe1jLxExv6P2i+e1eAoAFLgC
         ChxRJVmxnOVDQu5HrNh7lXToH6DdBSdp3tplUxyI/xjgVO057Ow3U+2zn+5pI+Dqn8pe
         kw8wk99iie+2UrsA5xPxVT0pyH6XP6d6BTjGsK40qzq4VkvlFi1WJflaXyQm1a8+1+wo
         GDQa1Psj7xhjyRb64QhcJzqEWqIYxmRQiLDum/RSDyhzp3jwxgF+BAhsTIAopcsoSF/y
         XqDTWuZxPEKre0umGuiGNUAaKptp3LpCONg4/v/4im7QWL5fkaFHXX0H66WIdbVl2kxd
         Vo/g==
X-Gm-Message-State: APjAAAW9oy9hD/bQu2KF3H97s7HxaGh+BmZvcor89/r+7pPjqRbJDPKa
        6x2V7RZY4zEG+6FKT4ZGWFEFHtcZiIv7hb4CPdk=
X-Google-Smtp-Source: APXvYqz+ulJchr30sqY5Dvor8YJdMQ/MukBLWYA+HwKj0YcgAgjIGf6m/Gg/Wbeb8+QqbY5RNtOqgOAQizCIXHAUAgw=
X-Received: by 2002:a17:902:7d85:: with SMTP id a5mr21014913plm.324.1571684397599;
 Mon, 21 Oct 2019 11:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <CACCo2jk9rx3sf78RPFr39-JVZgaymsJVd6vg=WMKLmWfYZrNaA@mail.gmail.com>
 <CAADnVQ+X-Fz68XkLPDVBntkcboMoXGg_ArCKMzeeEqfQmvRx-g@mail.gmail.com>
In-Reply-To: <CAADnVQ+X-Fz68XkLPDVBntkcboMoXGg_ArCKMzeeEqfQmvRx-g@mail.gmail.com>
From:   Farid Zakaria <farid.m.zakaria@gmail.com>
Date:   Mon, 21 Oct 2019 11:59:46 -0700
Message-ID: <CACCo2j=fFm+FRix4CW+wubZ8h+iLW6s4fNnjjpDK4hXRy2nK1w@mail.gmail.com>
Subject: Re: sharing a simple ebpf code sample
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, Mark Williams <mrw@enotuniq.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, Oct 19, 2019 at 9:12 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> snip.
>
> Thanks for sharing.
> I think we can create new bpf_examples_and_links.rst file in Documentation/bpf/
> with links for various repos, samples, examples, etc
> Like yours, cilium, cloudflare, Jesper's docs, etc.
> At least from kernel tree all the places will be reachable.

That's a great idea. I know there is
https://github.com/zoidbergwill/awesome-ebpf however having something
maintained in the kernel would preferable I think.
eBPF is interesting because it empowers some user-space developers to
work on code that "looks" kernel like, so I think there is opportunity
to expand on the documentation for that segment.

I will also be attending the LLVM developer conference this week in
San Jose -- if anyone from this mailing list is there I hope to meet
you.
