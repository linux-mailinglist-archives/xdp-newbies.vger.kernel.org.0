Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A51167820
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Feb 2020 09:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgBUIqo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Feb 2020 03:46:44 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46286 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732529AbgBUIqn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Feb 2020 03:46:43 -0500
Received: by mail-ot1-f67.google.com with SMTP id g64so1295684otb.13
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Feb 2020 00:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IYgNoSgRHvYTF8Qe1FaR6fQJEYuNsMoEJgGkig0cUNI=;
        b=JrfGgOBNNeTZwMEh59xR1apFP2IG6epWXWtKIUyMjIHmwx9LjQzbnnEAJjwJT5/1hS
         4I/z3Jsm3SUjVEzpHwdFt75LSinGBZxtCHA+GX+DCTAAHuKsaoifdDsmrkhLta/7OHk4
         8NAfV3uRwedc0kN0KOdXUft7+VglkeMn5+2NRYqI0xzKamxu1dxgnqc0w8h0WSbbt27n
         /kek+jKhLdJHpec6H0z8N7RdOQBGoMD6EWvYNC6ynMVGrmKZKpV+GXHPEv+tKyOBOBH4
         zX9Ivip37hfuRnqmq0mO+vC5wxDXZ8v/QBEp66amWfkEyvzZ2W5R5QHvkBz2a5NzpHeR
         2uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IYgNoSgRHvYTF8Qe1FaR6fQJEYuNsMoEJgGkig0cUNI=;
        b=M14ifZLGRIvJ7RYmSD+WrrysKBJF/PoDLLeFVQ0C95VtmGHLLJEESyRO2tIZ/5yNdm
         sbU6aAgmWgGJg72Z76es+Zlb5Gp938JUBLTdDrJPz5PdbAcgHdJQu8YOR33DHrr6Mc2g
         ILhX0YlMMpmnaTWx81Tbt1GX47Twrxy1B6XW50NXXcEVIaopxpIGWCGIaIrnt6BrDU9y
         FbAgUhH0UdjvsO2P9HoU7SL9UX8Iwz/sWnMVy2pLhI+h9+oHJlwiqVhyFjNWVfXDlkvc
         Kr0auCtjQsjnElcxe48JYhZLS/htMdNqKNXh9xk29i2H7Nv1ovBR3hx53YF/A+wRKk4Y
         tV7Q==
X-Gm-Message-State: APjAAAU7vjGBMKASiivBg/YEgWdqr0xeDn05FLbKTCdMCS65lfzYTU3m
        NPMG9RBeOyQkvBYiOULj40Qu8uR/4w0fK7Dt1yoUmuJI
X-Google-Smtp-Source: APXvYqwyJ2LPhJvYOJfrPayMs0AgaOpHFDNa595pIiDBcyemZ+XTVLw4iMxu0Jm749mA9PllVFNsi7w/YEkqiUP7+vM=
X-Received: by 2002:a9d:5607:: with SMTP id e7mr27935330oti.196.1582274803075;
 Fri, 21 Feb 2020 00:46:43 -0800 (PST)
MIME-Version: 1.0
References: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
 <28C7C59E-0ED6-4331-8547-952419F20D1F@redhat.com> <CAJ8uoz3t6mKVr+aHx_WDkPg66_wTSsMNySzWny9JhCR1VG7mBA@mail.gmail.com>
 <FA00F7E2-E4E2-413B-9CC0-93AB2BA861A2@redhat.com>
In-Reply-To: <FA00F7E2-E4E2-413B-9CC0-93AB2BA861A2@redhat.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 21 Feb 2020 09:46:30 +0100
Message-ID: <CAJ8uoz3cGwP4xsCxxv=pvqP3hJw9LBL1u=Jivba2xRBTs6vmgA@mail.gmail.com>
Subject: Re: xdpsock poll syscall CPU 100%
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     William Tu <u9012063@gmail.com>, Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Feb 21, 2020 at 9:40 AM Eelco Chaudron <echaudro@redhat.com> wrote:
>
>
>
> On 21 Feb 2020, at 9:33, Magnus Karlsson wrote:
>
> > On Fri, Feb 21, 2020 at 9:30 AM Eelco Chaudron <echaudro@redhat.com>
> > wrote:
> >>
> >>
> >>
> >> On 20 Feb 2020, at 23:49, William Tu wrote:
> >>
> >>> Hi,
> >>>
> >>> I'm trying to save some CPU cycles when there is no packet arrives.
> >>> I enable the poll syscall option of xdpsock, by doing
> >>>
> >>> $ ./xdpsock -r -p -S -i ens16
> >>>  sock0@ens160:0 rxdrop xdp-skb poll()
> >>>                 pps         pkts        1.00
> >>> rx              0           0
> >>> tx              0           0
> >>>
> >>> Since there is no packet coming, I though by calling poll()
> >>> system call, the xdpsock process will be blocked and CPU utilization
> >>> should be way under 100%. However, I'm still seeing 100%
> >>> CPU utilization. Am I understanding this correctly?
> >>
> >> Hi William, I can remember I saw this in the past two with this code.
> >> It
> >> had something to do with the way xdpsock waits for the buffers to be
> >> free=E2=80=99 ed by the kernel. What I can remember it had something t=
o do
> >> with the veth interfaces also.
> >>
> >> I do remember that I fixed it in the tutorial for AF_XDP:
> >> https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_=
XDP/af_xdp_user.c
> >
> > Eelco,
> >
> > Do you remember exactly what you had to fix in the xdpsock sample?
> > Your tutorial is quite a rewrite so it is hard for me to tell exactly
> > which of all the changes that fix this problem. The reason I ask is
> > that it would be nice to fix this in the sample too.
> >
> > Thanks: Magnus
>
>  From an earlier email conversation we had this is where it looped in my
> case:

Thanks Eelco. Yes, the xdpsock sample is too simplistic in this case.
I will put this on my backlog to fix so that we do not have this
problem in the future. I might take some inspiration from your code
:-). Hope you do not mind.

/Magnus

> >>>>> One other thing I noticed, which I need to research is that if I
> >>>>> use
> >>>>> rx_drop() function from /xdpsock_user.c it loops a lot in:
> >>>>>
> >>>>>           while (ret !=3D rcvd) {
> >>>>>                   if (ret < 0) {
> >>>>>                           exit(-1);
> >>>>>           }
> >>>>>                   ret =3D xsk_ring_prod__reserve(&xsk->umem-
> >>> fq, rcvd, &idx_fq);
> >>>>>
> >>>>>           }
> >>>>>
> >>>>> As ret return 0, until (it looks like) I send more packets. So
> >>>>> even
> >>>>> in the poll() mode, it uses 100% cpu after sending a single
> >>>>> packet.
> >>>>> Note this is with the default Fedora Kernel, as I=E2=80=99m working=
 on
> >>>>> this
> >>>>> from my laptop. Does this sound familiar? If not I=E2=80=99ll dig i=
nto
> >>>>> it
> >>>>> once I=E2=80=99m back.
> >>>>
> >>>> The xdpsock test is a busypolling test, to compare against DPDK
> >>>> speeds.  For real use-cases, I think people will want to trade-off
> >>>> latency vs. burning CPU.
> >>>
> >>> I understand the use case, but even with the xdpsock test program,
> >>> if
> >>> I send a single packet it=E2=80=99s not received, or at least not whe=
n
> >>> it's
> >>> sent. It takes 16 (or a multiple of it) before the get
> >>> detected/processed. I think it=E2=80=99s because of the
> >>> xsk_ring_prod__reserve(), but I=E2=80=99ll try to debug it more today=
 and
> >>> to
> >>> understand the APIs better.
>
