Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D7E1686D9
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Feb 2020 19:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgBUSlb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Feb 2020 13:41:31 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39717 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgBUSlb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Feb 2020 13:41:31 -0500
Received: by mail-qt1-f195.google.com with SMTP id p34so1984167qtb.6
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Feb 2020 10:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pDvp86gqFerJLv+pcWNEJby/z7OM+13T47AUsB7uXVo=;
        b=obfRSpUIq3wkfqMMKr523U1JpW5jE8+J+iV6dwNzAQs0UCeee/jrUEAs2juVjWoLqz
         gAOVITVgem4brExuqjSbjpSuuu4Fi0C91MhrGb+/paObLd/4wXiflhW+/w9XWE98+tTa
         XIV85+zk2itA/szg/MLwE++F+5JraLVZy8unU9NpaBziUCHUZ3yFwyBazcAgGTMznz5W
         zLdYIZ5bvy89MP9RkOa+AQzPMiAeIRmZaoIgigH0dEq9fnSL0weHZS3d0TsFyca7vUIY
         dhbSuh/HHMbUlAIJpBO5+4Pv2XN6t9Kr5T/C1qnU/AO3jcOogv2+bx5+oEuB0gNWskuY
         Izew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pDvp86gqFerJLv+pcWNEJby/z7OM+13T47AUsB7uXVo=;
        b=K8iDWZ9HU0fpfg1uZACAoAtPnXUmsMafnGpuvClMaZSYcC45oeMF59lGLI4wX5LVVK
         uqfGFPPGfekuhupTQMEL8hqOq4YQX1wb6Ti6WhtDNmt3Je3DBN/tcxHhzT+OSQgm6nAN
         /boPv3c42dd0NRHsTifOhDU3tFrgX5kn0sAsod3TzlIR5APgZ8ZfVy+AnhxDwgaK6q05
         62TksvpRGs1GTi0GRRaTCDk03Dh5UqGQBCDbiL+v1TkO9uAgKDiA4uuQoZOOCyuazKjB
         XN5S4Y+DExGDISVIRFT9PPTv+BHvWbBdJUIA+1TyvUi35BwOTTYEA+WSm9BTL3MI8tSo
         HVVw==
X-Gm-Message-State: APjAAAWIufn3pV/V/5OEYe3KT6ODTvlTqOvDXIJQU+HyFYk22D2635S2
        y3z0OFU1vMqugjz3/PeYJPaQTPs5R/iMAkdIVI4=
X-Google-Smtp-Source: APXvYqzaNq2Yr2cvKReGIZdxwIdtsIKfrmwIulksD/mOXPOJPwqfq181IDI/caqfBgmwQazPuU7/gni9Z6lUkSfBjm4=
X-Received: by 2002:aed:31e2:: with SMTP id 89mr33594066qth.35.1582310490098;
 Fri, 21 Feb 2020 10:41:30 -0800 (PST)
MIME-Version: 1.0
References: <CALDO+SZmCxtWCeqh93HO6vm1KHh_UGxMby+td2ba_o66ZT+MVQ@mail.gmail.com>
 <28C7C59E-0ED6-4331-8547-952419F20D1F@redhat.com> <CAJ8uoz3t6mKVr+aHx_WDkPg66_wTSsMNySzWny9JhCR1VG7mBA@mail.gmail.com>
 <FA00F7E2-E4E2-413B-9CC0-93AB2BA861A2@redhat.com> <CAJ8uoz3cGwP4xsCxxv=pvqP3hJw9LBL1u=Jivba2xRBTs6vmgA@mail.gmail.com>
In-Reply-To: <CAJ8uoz3cGwP4xsCxxv=pvqP3hJw9LBL1u=Jivba2xRBTs6vmgA@mail.gmail.com>
From:   William Tu <u9012063@gmail.com>
Date:   Fri, 21 Feb 2020 10:40:54 -0800
Message-ID: <CALDO+SYZmY2i2XgDYdFQC2TJvcng9rAPdihEve1rn4Un1x-=Bg@mail.gmail.com>
Subject: Re: xdpsock poll syscall CPU 100%
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Eelco Chaudron <echaudro@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Feb 21, 2020 at 12:46 AM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Fri, Feb 21, 2020 at 9:40 AM Eelco Chaudron <echaudro@redhat.com> wrot=
e:
> >
> >
> >
> > On 21 Feb 2020, at 9:33, Magnus Karlsson wrote:
> >
> > > On Fri, Feb 21, 2020 at 9:30 AM Eelco Chaudron <echaudro@redhat.com>
> > > wrote:
> > >>
> > >>
> > >>
> > >> On 20 Feb 2020, at 23:49, William Tu wrote:
> > >>
> > >>> Hi,
> > >>>
> > >>> I'm trying to save some CPU cycles when there is no packet arrives.
> > >>> I enable the poll syscall option of xdpsock, by doing
> > >>>
> > >>> $ ./xdpsock -r -p -S -i ens16
> > >>>  sock0@ens160:0 rxdrop xdp-skb poll()
> > >>>                 pps         pkts        1.00
> > >>> rx              0           0
> > >>> tx              0           0
> > >>>
> > >>> Since there is no packet coming, I though by calling poll()
> > >>> system call, the xdpsock process will be blocked and CPU utilizatio=
n
> > >>> should be way under 100%. However, I'm still seeing 100%
> > >>> CPU utilization. Am I understanding this correctly?
> > >>
> > >> Hi William, I can remember I saw this in the past two with this code=
.
> > >> It
> > >> had something to do with the way xdpsock waits for the buffers to be
> > >> free=E2=80=99 ed by the kernel. What I can remember it had something=
 to do
> > >> with the veth interfaces also.
> > >>
> > >> I do remember that I fixed it in the tutorial for AF_XDP:
> > >> https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-A=
F_XDP/af_xdp_user.c
> > >
> > > Eelco,
> > >
> > > Do you remember exactly what you had to fix in the xdpsock sample?
> > > Your tutorial is quite a rewrite so it is hard for me to tell exactly
> > > which of all the changes that fix this problem. The reason I ask is
> > > that it would be nice to fix this in the sample too.
> > >
> > > Thanks: Magnus
> >
> >  From an earlier email conversation we had this is where it looped in m=
y
> > case:
>
> Thanks Eelco. Yes, the xdpsock sample is too simplistic in this case.
> I will put this on my backlog to fix so that we do not have this
> problem in the future. I might take some inspiration from your code
> :-). Hope you do not mind.
>
> /Magnus
>
Hi Magnus and Eelco,

Thanks for your reply.
I run Eelco's af_xdp_user.c and indeed, with poll syscall, the CPU is
way under 100%. But I'm still figuring out the difference and where to
fix in xdpsock_user.c.

Regards,
William
