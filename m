Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F278516766E
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Feb 2020 09:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732248AbgBUIeG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Feb 2020 03:34:06 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43800 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732926AbgBUIeE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Feb 2020 03:34:04 -0500
Received: by mail-oi1-f196.google.com with SMTP id p125so821867oif.10
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Feb 2020 00:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OTTPxFGw40o4P8ostLFCnhIRqYBfw3uy3gnSA2mOEEo=;
        b=ojD1WB4M65yh0VRJShlXngXn89BWjtv4UW8sSeb7cIi2/k8wREB9OoPwVEWLDbfLzm
         NHHqX4BsL/mW73kRvHi8VUfg/0NZo//Fly+ssKvHSHRyni+4V3KyzJE4xRDt6pmWEXWj
         XgelOOY4ct7HuYfkaCB4m1GlRIXaHD6eUBWpT+Qmcywi3ciNvnFqNj9nOGOW3pEXJ+a5
         9EiRYSL9+V62NR25V8adC9D43H21PMudrwo+vW9/V2bfTogcIMtPDbKlJehn2+SWqiSJ
         spo97jvFzjNPTBVvleqtwuNPswigMrAteXxSA00T9YezEMDizFofxMv648UAnnpAJodT
         7+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OTTPxFGw40o4P8ostLFCnhIRqYBfw3uy3gnSA2mOEEo=;
        b=YWL7dVtaC9eKGJV4ZSBGEmv0cRs2h5EGMWDoSEU51z7yoAlHPAbrhZ9bSRRZfuwjQ/
         oRqlcoWz2edOvFZg2Ea1WlKG4IjRnOJn33ijQ8ZJCH0mlpLzhuERQrunVXd+YkKQGic9
         GEZ3h/PDVXR76lVYu41W3HHNEtOSmUKVMxa0Cd4V1R8El3lPoKNJpztvIfSFvpPHVrxX
         pBnKnfqH00/7i7pPrrHiDyF05u/A66etdCoC0oKV0W7wg63ownrHxyF+l+kgUQrDpbjj
         53XczbthpuK3vB8b0tclW3QIb0Y9oKwZzaOaUOlSCp0idiv1ke1a9RaSR68v4WykecgM
         +iAA==
X-Gm-Message-State: APjAAAXqVUBc+cw/E688qnq95/B0lYUBH8caKO3e3Q6BJuekluVaJghR
        EiJzzpta4uuY/Q6MYhTHEbnHYccsTGADvKzlS2uAo6Pa
X-Google-Smtp-Source: APXvYqx4z0n3T6tyPMIfiyHch2YO895Yb/OcookwddhdA7zioA65P8GeUbObTKPvlbJpKXrvXNBImnuwXMtC4uDT5uk=
X-Received: by 2002:aca:dc45:: with SMTP id t66mr1062384oig.39.1582274043868;
 Fri, 21 Feb 2020 00:34:03 -0800 (PST)
MIME-Version: 1.0
References: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
 <28C7C59E-0ED6-4331-8547-952419F20D1F@redhat.com>
In-Reply-To: <28C7C59E-0ED6-4331-8547-952419F20D1F@redhat.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 21 Feb 2020 09:33:45 +0100
Message-ID: <CAJ8uoz3t6mKVr+aHx_WDkPg66_wTSsMNySzWny9JhCR1VG7mBA@mail.gmail.com>
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

On Fri, Feb 21, 2020 at 9:30 AM Eelco Chaudron <echaudro@redhat.com> wrote:
>
>
>
> On 20 Feb 2020, at 23:49, William Tu wrote:
>
> > Hi,
> >
> > I'm trying to save some CPU cycles when there is no packet arrives.
> > I enable the poll syscall option of xdpsock, by doing
> >
> > $ ./xdpsock -r -p -S -i ens16
> >  sock0@ens160:0 rxdrop xdp-skb poll()
> >                 pps         pkts        1.00
> > rx              0           0
> > tx              0           0
> >
> > Since there is no packet coming, I though by calling poll()
> > system call, the xdpsock process will be blocked and CPU utilization
> > should be way under 100%. However, I'm still seeing 100%
> > CPU utilization. Am I understanding this correctly?
>
> Hi William, I can remember I saw this in the past two with this code. It
> had something to do with the way xdpsock waits for the buffers to be
> free=E2=80=99 ed by the kernel. What I can remember it had something to d=
o
> with the veth interfaces also.
>
> I do remember that I fixed it in the tutorial for AF_XDP:
> https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP=
/af_xdp_user.c

Eelco,

Do you remember exactly what you had to fix in the xdpsock sample?
Your tutorial is quite a rewrite so it is hard for me to tell exactly
which of all the changes that fix this problem. The reason I ask is
that it would be nice to fix this in the sample too.

Thanks: Magnus

> Maybe you can see if you have the same problem with this example.
>
> //Eelco
>
>
> > Thanks,
> > William
>
