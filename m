Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E09C3115D97
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Dec 2019 17:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfLGQvd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 7 Dec 2019 11:51:33 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:45119 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfLGQvd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 7 Dec 2019 11:51:33 -0500
Received: by mail-lf1-f48.google.com with SMTP id 203so7549459lfa.12;
        Sat, 07 Dec 2019 08:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H1vWx0dAQL31p+IIogmLYF5ORkKGGbq821m3i9i/pV0=;
        b=l69R3OsNyR8t6H+eyEVkm6Pd4gkWR//KmWOg0QJeklF4KOCui+kJR2cs5C1bxGbe6S
         n8UrkgdMKNjN45eQG7BulPvf+iRK6RisLBZogM6CmZ0hS6wvDo9vfY+lUZ/FUDsL5Okg
         BDffHDt/U+FLVT7IGYydylgTl+gsRcxpGv4ZLLYlOC/JRsvSes89W7lCOPMPplEqXskv
         q9QKwfW9C9y4Q494hHR20oylhShzQyOqNmraRZMZT5KCAS8ZV1x107lnaJBUeLu2i9pn
         b9IB0j2WETSn9zLnc5JEDYhACJ1dSeM38+it6R0C6iW8jjoMjqQfsVG+KUqAr/ExFkx7
         SBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H1vWx0dAQL31p+IIogmLYF5ORkKGGbq821m3i9i/pV0=;
        b=BSrDoLVCFYV7mt6fAeCs+vaSrIryNv17hWcIJZAwqOowpk7Rjid0XaddhlMOettKHV
         REbShcKO6DCkbp5bgX57EtkM7WBOSSgNv08eqpfKdpka0un0OxwsSd6FAZ7lsaSXf75o
         DszqXy+YnfnYHP569zrntyji2AOYbWhJ7dLDD3RWZIxX8x6USPNMAE1JzhJk4mdlQQF/
         mARR6n5OhYIUBtCErCWW+8VL9tHHHeAMC+L8nmGX5eWdBfUpPMYK1tI/bBxNs5zK9KYu
         BAYAh7F02H2G+h+uku1mJqRf77cMRoPtQt7rb2UoSlAj4yf3TBMFD/FWrd7ZF4n9cn2e
         xteQ==
X-Gm-Message-State: APjAAAWf5pwqEHTV2m0aIlFViiHFPTDdCn9k//dNQy60plz5AyNwIBC/
        QOIeeP3o8/X2akz+hr1oR89b1zy4C9wMV+wQayU=
X-Google-Smtp-Source: APXvYqybCyX9ONFN4SLNqXZu87KejRjU7J3OJArhn08ViTPNaLrkojkayz+3V1WmDeheyZ8DNsWnXbpS8vxZvIKIc0k=
X-Received: by 2002:ac2:52a5:: with SMTP id r5mr11120850lfm.19.1575737491115;
 Sat, 07 Dec 2019 08:51:31 -0800 (PST)
MIME-Version: 1.0
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
 <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com> <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
 <4BBF99E4-9554-44F7-8505-D4B8416554C4@redhat.com> <d588c894-a4e0-8b99-72a9-4429b27091df@fb.com>
 <056E9F5E-4FDD-4636-A43A-EC98A06E84D3@redhat.com> <aa59532b-34a9-7887-f550-ef2859f0c9f1@fb.com>
 <B7E0062E-37ED-46E6-AE64-EE3E2A0294EA@redhat.com> <7062345a-1060-89f6-0c02-eef2fe0d835a@fb.com>
 <b8d80047-3bc1-5393-76a1-7517cb2b7280@fb.com> <E08A0006-E254-492C-92AB-408B58E456C0@redhat.com>
 <F8CFD537-7907-4259-9C91-4649F799216B@redhat.com> <CAH3MdRXr+3mUfrd8MPH-mDdNwD1szXRhz07s2C4dVQ0EkzDaAg@mail.gmail.com>
 <78D7857B-82E4-42BC-85E1-E3D7C97BF840@redhat.com>
In-Reply-To: <78D7857B-82E4-42BC-85E1-E3D7C97BF840@redhat.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Sat, 7 Dec 2019 08:51:19 -0800
Message-ID: <CAADnVQ+DHuDS2xZbjsEfBYX5t761dbCih6p-=NaCNU9OJEMk8A@mail.gmail.com>
Subject: Re: Trying the bpf trace a bpf xdp program
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     Y Song <ys114321@gmail.com>, Yonghong Song <yhs@fb.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Dec 6, 2019 at 5:05 AM Eelco Chaudron <echaudro@redhat.com> wrote:
>
> Thanks the hint that it should be the jitted arguments solved it=E2=80=A6=
 And
> you quick example worked, just in case some one else is playing with it,
> here is my working example:
>
> // SPDX-License-Identifier: GPL-2.0
> #include <linux/bpf.h>
> #include "bpf_helpers.h"
> #include "bpf_trace_helpers.h"
>
> #define bpf_debug(fmt, ...)                \
> {                                          \
>      char __fmt[] =3D fmt;                    \
>      bpf_trace_printk(__fmt, sizeof(__fmt), \
>                       ##__VA_ARGS__);       \
> }
>
> struct net_device {
>      /* Structure does not need to contain all entries,
>       * as "preserve_access_index" will use BTF to fix this... */
>      int                    ifindex;
> } __attribute__((preserve_access_index));
>
> struct xdp_rxq_info {
>      /* Structure does not need to contain all entries,
>       * as "preserve_access_index" will use BTF to fix this... */
>      struct net_device *dev;
>      __u32 queue_index;
> } __attribute__((preserve_access_index));
>
> struct xdp_buff {
>      void *data;
>      void *data_end;
>      void *data_meta;
>      void *data_hard_start;
>      unsigned long handle;
>      struct xdp_rxq_info *rxq;
> } __attribute__((preserve_access_index));
>
>
> BPF_TRACE_1("fentry/xdp_prog_simple", trace_on_entry,
>              struct xdp_buff *, xdp)
> {
>      bpf_debug("fentry: [ifindex =3D %u, queue =3D  %u]\n",
>                xdp->rxq->dev->ifindex, xdp->rxq->queue_index);
>      return 0;
> }
>
>
> BPF_TRACE_2("fexit/xdp_prog_simple", trace_on_exit,
>              struct xdp_buff*, xdp, int, ret)
> {
>      bpf_debug("fexit: [ifindex =3D %u, queue =3D  %u, ret =3D %d]\n",
>                xdp->rxq->dev->ifindex, xdp->rxq->queue_index, ret);

This is great. Could you submit it as selftests/bpf ?
It will help others trying to do the same.
May be instead of bpf_debug() use global variables so the test will be
self checking ?

Long term we should teach verifier to understand 'struct xdp_md*'
in addition to 'struct xdp_buff *'. That will help ease of use.
