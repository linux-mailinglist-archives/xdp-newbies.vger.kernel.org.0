Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71331DD995
	for <lists+xdp-newbies@lfdr.de>; Sat, 19 Oct 2019 18:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfJSQMJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 19 Oct 2019 12:12:09 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:46999 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfJSQMI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 19 Oct 2019 12:12:08 -0400
Received: by mail-lf1-f47.google.com with SMTP id t8so6897811lfc.13
        for <xdp-newbies@vger.kernel.org>; Sat, 19 Oct 2019 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K6Rj9Nzxgotwqsxylk/4eG9P3CmmUK/Budj0SHJuhXQ=;
        b=Z1Q7CQAkqWauXmoB07kEtPMkk4B0/q4QdhpPn/3fQaYKKHAz9OYYr5hY6NHPBwe3dh
         9KH7mDkjC1jcEwz9GrfIM5axdBwEasY/5DVdS9tjGGygZhmefMTEUhaLVTYZdlmCxDyl
         JEpDBgX+37aDp+Jqk/aJiOKtjuop9oL0ClKBIijQklM9CU0EcxXCa0+Utk7pdTByQGbN
         7blefVqPFn40PeXabib54sjbtCvWn2RAFiMDozSzM6nbg3FdCO5L+iBx4YPhOigBNrxv
         OWqcoXQ1+4JrMny9dARihm5Xg52o8FhukgRcLz+CA/I5GVGsiN7UiXE4r+EUnz6KRA3/
         E0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6Rj9Nzxgotwqsxylk/4eG9P3CmmUK/Budj0SHJuhXQ=;
        b=WON/n3PXfbfjmtkbkdOz8RDW/gQpT23xRdaPn1IMHQJiJJyZuldiSfPE2qdP65HmS8
         65N+b9Iq+m060aEKKDe+kPuJ05PS3nbJQ5gvfM0+DSNtNCHIz/XX638UFeyWHcKTZZn7
         eKokp4CJXElkWBznenVqKSvDKI2kdgFEPpMYdqVem8TNt1OeqkPbWMCEekuNsnA43Ybd
         G6IMa8K6P1oaSiAvx+240fIUMFq88w1cXledrS1E3l4aOLCYT72RljR+MdcRRJn0Oy/w
         7NkwYw/bJftuZzdQ1+1n5s18mA+FnGFXhQhk8k02IB90INDXjyFzSQZhUVD+1i5p0fsS
         Bo8w==
X-Gm-Message-State: APjAAAXNyJhVKTa2BI4leUkKoHHH84xm58G+hMHz5Wxq99KYxQQvehJX
        E8j5EmMiBRC/RBJC2DJ6UNo8DKxDXM10qMxDPboD7g==
X-Google-Smtp-Source: APXvYqwtOt8nJW+l1V3c1R76HChCa7Vjhr/6hAe1RdwFe7ghX8A67MqBjiPDTPxiRXy/fb2gfze6jlqHWuQ1Qe1m8wA=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr9128233lfm.15.1571501526466;
 Sat, 19 Oct 2019 09:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <CACCo2jk9rx3sf78RPFr39-JVZgaymsJVd6vg=WMKLmWfYZrNaA@mail.gmail.com>
In-Reply-To: <CACCo2jk9rx3sf78RPFr39-JVZgaymsJVd6vg=WMKLmWfYZrNaA@mail.gmail.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Sat, 19 Oct 2019 09:11:54 -0700
Message-ID: <CAADnVQ+X-Fz68XkLPDVBntkcboMoXGg_ArCKMzeeEqfQmvRx-g@mail.gmail.com>
Subject: Re: sharing a simple ebpf code sample
To:     Farid Zakaria <farid.m.zakaria@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, Oct 19, 2019 at 2:37 AM Farid Zakaria <farid.m.zakaria@gmail.com> wrote:
>
> Hi,
>
> I just wanted to share a code sample I put together which does
> MPLSinIP encap/decap via clasct (not xdp).
>
> https://github.com/fzakaria/ebpf-mpls-encap-decap
>
> I know there's quite a few samples in the Linux source tree but I
> found them lacking in terms of comments for someone new to the new
> space.
> (They were more geared at demonstrating a particular feature
> specifically rather than simply instructional)
>
> Learning & using ebpf for a project at work in a similar capacity
> (encap/decap) has been a joy/fun to work with.

Thanks for sharing.
I think we can create new bpf_examples_and_links.rst file in Documentation/bpf/
with links for various repos, samples, examples, etc
Like yours, cilium, cloudflare, Jesper's docs, etc.
At least from kernel tree all the places will be reachable.
