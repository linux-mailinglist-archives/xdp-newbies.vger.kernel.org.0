Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 519FADF841
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Oct 2019 00:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730477AbfJUWvB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Oct 2019 18:51:01 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34220 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730410AbfJUWvA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Oct 2019 18:51:00 -0400
Received: by mail-io1-f65.google.com with SMTP id q1so18060649ion.1
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Oct 2019 15:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qWF4BCLAtFRvp9lQ1n7cnwHUoykBZaUPua7UseKGDZY=;
        b=c4I9NgjdDuSlQFYqlPIb9C9+IdflV+YHND/5jW3if1MefPYBk1wr9/O9ArJqQMMWO9
         czMpnQpLfik5dHKPBg5ET4HICqKI2LWX29DQXeqIZ5rYp/lM7Q7O7o2am5aVCb2SiavW
         +Wa9m9mIRDXpt2JOcJWCKOMEuoTI11A0PPoXwZSp2JgXMy3sUsDzfoPCjou42ws8U76K
         0fg53XQp3XFG/be9JSJ95NFpxc9WeFZIOnIG4H3NCkSFuRdsHVcOlJVUUNB5hP3CzoDD
         DKTyBFJ5pOa1wTaYJ3Egcry3zHUjuVW3f5D6Qp1i1HZCUSC69GxFAJ74JBweD8ylj8dq
         r9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qWF4BCLAtFRvp9lQ1n7cnwHUoykBZaUPua7UseKGDZY=;
        b=QToV4dy8E+189VTU9IwvuXnHMEqQ3AyP7Ra+ZDlnhMzD3eyysdS+RtOqx0u8Mrf/Iz
         0OPM7u0F6xQehcXcUlmr8glvMxkiR6zRGwbL4meJ5iiktAJDqADOi1drYouRHZtZud4m
         tyTheFC6ERXxKJNgrDYKiSrc1TEWqAHpwCH68mI81o2N7LA3h1NasI8wK9sx+0BBeBNV
         sWOXbPHJFO7iZagbqvGYeU5kKmNqZn+qm0jS3CqoICV5flITFxuALWwlkwRDUsyRbVE9
         eSE/ptwrD8lO5ImnB1XdhMxbMe+rH6Mh75GWtShYgwaAjTdFg4S8Hsi9dOz7Am1UwzLD
         uB3g==
X-Gm-Message-State: APjAAAV5mHn7DL1YsyUrtJg5cMyvYTTCbQ6JmiNUZ4xX+WV2+34ot4mU
        UK1BMYoxvHPQVAXIaGtouYHnfDADqnut3u+NSvo=
X-Google-Smtp-Source: APXvYqz7Ppti44WrDrnAz2oYYz+/niYl2d7QeC5xCzG007Vfel4Yj2CKhORfwnEeY/DujGo50HwblmUiZhMgqSSmAms=
X-Received: by 2002:a5e:8b03:: with SMTP id g3mr684156iok.116.1571698259553;
 Mon, 21 Oct 2019 15:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <CACCo2jk9rx3sf78RPFr39-JVZgaymsJVd6vg=WMKLmWfYZrNaA@mail.gmail.com>
 <CAADnVQ+X-Fz68XkLPDVBntkcboMoXGg_ArCKMzeeEqfQmvRx-g@mail.gmail.com> <CACCo2j=fFm+FRix4CW+wubZ8h+iLW6s4fNnjjpDK4hXRy2nK1w@mail.gmail.com>
In-Reply-To: <CACCo2j=fFm+FRix4CW+wubZ8h+iLW6s4fNnjjpDK4hXRy2nK1w@mail.gmail.com>
From:   Y Song <ys114321@gmail.com>
Date:   Mon, 21 Oct 2019 15:50:23 -0700
Message-ID: <CAH3MdRWkepOc+k8+a0iA3CXD1up+sbbH84LmXJQ7XKDq6xB7kg@mail.gmail.com>
Subject: Re: sharing a simple ebpf code sample
To:     Farid Zakaria <farid.m.zakaria@gmail.com>
Cc:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Mark Williams <mrw@enotuniq.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Oct 21, 2019 at 12:02 PM Farid Zakaria
<farid.m.zakaria@gmail.com> wrote:
>
> On Sat, Oct 19, 2019 at 9:12 AM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > snip.
> >
> > Thanks for sharing.
> > I think we can create new bpf_examples_and_links.rst file in Documentation/bpf/
> > with links for various repos, samples, examples, etc
> > Like yours, cilium, cloudflare, Jesper's docs, etc.
> > At least from kernel tree all the places will be reachable.
>
> That's a great idea. I know there is
> https://github.com/zoidbergwill/awesome-ebpf however having something
> maintained in the kernel would preferable I think.
> eBPF is interesting because it empowers some user-space developers to
> work on code that "looks" kernel like, so I think there is opportunity
> to expand on the documentation for that segment.
>
> I will also be attending the LLVM developer conference this week in
> San Jose -- if anyone from this mailing list is there I hope to meet
> you.

Farid,

I will attend the conference as well. You can catch me there.

Yonghong
