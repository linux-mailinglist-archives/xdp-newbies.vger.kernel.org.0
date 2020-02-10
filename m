Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E764E157CFC
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Feb 2020 15:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgBJOCU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Feb 2020 09:02:20 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43552 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgBJOCT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Feb 2020 09:02:19 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so9232244oif.10
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Feb 2020 06:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lzGgIgaZKCj4pX6XMl2ZJLXMLGlFloI5WjWQDp54Udg=;
        b=XJfNv4B+B3VO9cXHUILkMFPwf6TGjQ02lnaFM2OjyG/rREOer5j+0OqdfhuD5A3zTV
         nZm/hYFo2TXlAxlQxGxNCb0ngTUAnY0xCSQE3/u5IfYka0vNJOxeNnhTy192dms8uVlR
         GNu4iOiiHHFE8xOW26+o3DivhIPy5hQo8qFaWGbYJbj/1sMrLNP1Q1K+sMuWRdarkoxl
         93twoBYhdlkB0FdcbCKStFigCzbBgfQkDJb1UHel1sb+SF8A8vaEzY5nFtjGJv2nLQPY
         xM8VkhcYiWW6FW1eZ5//3Yqp+rz57v15hWlnkF6jst7d5UHTWVHo9htJb532xn98HTgW
         CvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lzGgIgaZKCj4pX6XMl2ZJLXMLGlFloI5WjWQDp54Udg=;
        b=fSfJIIdhV6FAY68EvSx82ljFz89OEs8LFi9KUno+Z07KifI9NnZKY8Vln8+/m0nSaF
         X/hkrRek9RHXcuZnxvXs1JtxTh9bnJL86VJ4id3e9eW7ibDGZtewa5xO/RLfT4OJEv78
         ETfWLgAKFsQTnHk9bHnPQbKIbSEL+PcwEG/eNtwO0Eabc9ESS+ZGR1V+CyY4R5i/1woq
         4UyiGkzWtYAUC2+ycgHYFm10QvMKPMnvovlcdT6k4n7hoG0HcbIB1RxJJYobyCuo28ai
         nov8ZEUF9h/hdyov8AR9TdZHY2jElSDln+coQ4wUrr39sLy98a+R3yxDcPJ1v1Ef6r3v
         p5ag==
X-Gm-Message-State: APjAAAXaldpE7viOQ/ldPOlLPhwrqMTCfiAnWxKGpdgrHb+XqaY0wFPI
        y2MeK8/ruBTH4yLvEA2SBn3w9BX7zyi0Xql7a2A=
X-Google-Smtp-Source: APXvYqx2/Q8WmWQUU5GI80hnBGVP2LA8hEjGCSnrscL++N1tVXyJJ73z/YQguulxEwcREB61kscV8Ut7K8CWyoKCM5M=
X-Received: by 2002:a54:488d:: with SMTP id r13mr859162oic.115.1581343338819;
 Mon, 10 Feb 2020 06:02:18 -0800 (PST)
MIME-Version: 1.0
References: <1581068272-4615-1-git-send-email-magnus.karlsson@intel.com>
 <c5d6fd11-8696-e898-6f05-5fcc087c0065@mellanox.com> <95de5e86-8930-5655-62b9-ec60b9952440@iogearbox.net>
 <CAJ8uoz2Qn496NX2Q49_Ct_r4b_NjouqhM8iz+c2yp8y9=e4wSg@mail.gmail.com> <ad324d2e-c9ab-f2fa-c11a-d26bc8d21284@mellanox.com>
In-Reply-To: <ad324d2e-c9ab-f2fa-c11a-d26bc8d21284@mellanox.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 10 Feb 2020 15:02:07 +0100
Message-ID: <CAJ8uoz3fuRsrKcru5KAyt3t_1Zrf-Y3Vx-ZDxJG_NH5J5idA8w@mail.gmail.com>
Subject: Re: [PATCH bpf] xsk: publish global consumer pointers when NAPI is finsihed
To:     Maxim Mikityanskiy <maximmi@mellanox.com>
Cc:     Magnus Karlsson <magnus.karlsson@intel.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Ryan Goodfellow <rgoodfel@isi.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Moshe Shemesh <moshe@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Feb 10, 2020 at 2:43 PM Maxim Mikityanskiy <maximmi@mellanox.com> wrote:
>
> On 2020-02-09 11:58, Magnus Karlsson wrote:
> > On Fri, Feb 7, 2020 at 10:41 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> >>
> >> On 2/7/20 1:34 PM, Maxim Mikityanskiy wrote:
> >>> On 2020-02-07 11:37, Magnus Karlsson wrote:
> >>>> The commit 4b638f13bab4 ("xsk: Eliminate the RX batch size")
> >>>> introduced a much more lazy way of updating the global consumer
> >>>> pointers from the kernel side, by only doing so when running out of
> >>>> entries in the fill or Tx rings (the rings consumed by the
> >>>> kernel). This can result in a deadlock with the user application if
> >>>> the kernel requires more than one entry to proceed and the application
> >>>> cannot put these entries in the fill ring because the kernel has not
> >>>> updated the global consumer pointer since the ring is not empty.
> >> [...]
> >>>
> >>> Acked-by: Maxim Mikityanskiy <maximmi@mellanox.com>
> >>>
> >>> Is it intentional that you didn't send it to bpf and netdev mailing lists?
> >>
> >> Yep, please resend with Maxim's ACK to bpf + netdev in Cc. Thanks!
> >
> > It was intentional, but maybe confusing. In the mail just before this
> > patch I suggested that this patch should be part of a patch set that
> > we send to bpf and netdev. The purpose of sending it was for you Maxim
> > to ok it, and you did with your ack :-). But I will repeat the other
> > questions from that mail here.
>
> OK, I see. Sorry, I didn't see the previous email (and still can't find
> it, BTW).
>
> > Does the Mellanox driver set the need_wakeup flag on Rx when it needs
> > more buffers in the fill ring to form its stride and the HW Rx ring is
> > empty? If yes, great. If not, please submit a patch for this.
>
> Yes, it does (regardless of emptiness of the HW RX ring). If
> xsk_umem_has_addrs_rq returns false, the driver sets the need_wakeup flag.

Perfect. I will then submit the patch to the netdev mailing list.
Please ack it again there.

> > I will produce a documentation patch that clarifies that when the
> > need_wakeup flag is set for the fill ring, the user need to put more
> > packets on the fill ring and wakeup the kernel. It is already
> > mentioned in the documentation, but I will make it more explicit.
> >
>
> Great, thanks!
>
> There's still room for optimization here, though: how many is "more"? If
> the application puts them one by one and wakes up the driver every time,
> it's not very effective comparing to the case if it knew the exact
> amount of missing frames. On the other hand, normally the application
> would put enough frames in advance, and it shouldn't get to this point.

Yes, there are many ways of messing up performance ;-). Ignoring the
advice of using batching is one of them.

Thanks: Magnus
