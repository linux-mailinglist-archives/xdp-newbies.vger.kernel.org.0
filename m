Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC571EC1B9
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Jun 2020 20:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFBSXd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Jun 2020 14:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgFBSXd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Jun 2020 14:23:33 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527EBC08C5C0
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Jun 2020 11:23:33 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id x1so13701234ejd.8
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Jun 2020 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7RmME0+KESr5P3A2bZfe5IoBuFN8lIAL/7xYGzsqkA4=;
        b=P2CWf8s7ci1B5J0J65hzIzybtgltONC4yojOKBcM0W26MFqplMqtvnwRJXQqKMkHSG
         Qe+vYf3vHvGgSxgGpJUlagPrwfvW9mHXFt0NDlzs1+AJ3a/7cnHuNppp2zdhJjO66gTp
         fp/6qJJE+GckUxTou3+9E9RtoBIdd+rLBVPlnKWiO3ey7iRX+Ru2bqO4R1RuJrLoIrve
         P/S5uQIdIftiu99R5vdWHbvDjXpogzoLe2iTNKliImCY2tGaJe5dCBsOBpeZqNB0Xsym
         vQ2iZ2AU2wRtXPvJ9ZGlsf+8JhT6T3Wc10MXB/0nmvAAF91KHpJrlUg3VshCrPEmVxTa
         cohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7RmME0+KESr5P3A2bZfe5IoBuFN8lIAL/7xYGzsqkA4=;
        b=akinjg/Fmj0+KFuExe5A101xDC2CVgQnyGI9uwPGXYDVFD6OJ/RJ3gHPfzW4XpBU1c
         Pu1UJiWIYfNl2jlWSaSUspVKLclIg1FMx7i5WyCEr3ZaIXSzqD0TSq5IoyK3tC0+BMPK
         AZaoTnzTWj+1APKbMFf/HtvUa5Q7J2sg8nJTKPc4vAoits99fVHL1VQ6InH20Eyg+3W1
         e1MjCcp1A/GMQ6E0rmsgxoE/qEobYUw8peqZAzWrQYU9TfF7wsrTmv8Sccg0hU3EN1Ex
         D6HgA8sgQcbGpaUcXsaPSTPYiCZBtBHs9bo+yU2pZn6oqB6f2tFK9AMsStE5o9jW+rMI
         U1fA==
X-Gm-Message-State: AOAM532P+JCH4/3/rjDSp6je4Rr2hNlcMjEuTUhN6q7Ve1mNQMlEFk66
        7OJLFB9g2J8Akh08LoqGlcnWeVVy7ts5dUFovxYxXg==
X-Google-Smtp-Source: ABdhPJw88U0zlyCKFb2ee8TyCfSnQ/Iap53D93hy/DehRq/BVRNOMdoCK4SmWv2nvDRGn3SwL6C8fyiCxL4PT9bi8QE=
X-Received: by 2002:a17:906:e0cf:: with SMTP id gl15mr10830050ejb.501.1591122211893;
 Tue, 02 Jun 2020 11:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
 <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
 <877dwpmp7f.fsf@toke.dk>
In-Reply-To: <877dwpmp7f.fsf@toke.dk>
From:   maharishi bhargava <bhargavamaharishi@gmail.com>
Date:   Tue, 2 Jun 2020 23:53:19 +0530
Message-ID: <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com> wrote:
>
> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>
> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=B8iland-J=C3=B8rgensen, <toke@redha=
t.com> wrote:
> >>
> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >>
> >> > Hi, in my XDP program, I want to redirect some packets using AF_XDP
> >> > and redirect other packets directly from driver space.
> >> > Redirection through AF_XDP works fine, but redirection through dev m=
ap
> >> > stops after some packets are processed.
> >>
> >> Do you mean it stops even if you are *only* redirecting to a devmap, o=
r
> >> if you are first redirecting a few packets to AF_XDP, then to devmap?
> >>
> >> Also, which driver(s) are the physical NICs you're redirecting to/from
> >> using, and which kernel version are you on?
> >>
> >> -Toke
> >
> >
> >
> > Currently, I'm trying to redirect packets only using devmap. But also
> > have code for redirection using AF_XDP(only when a given condition is
> > satisfied). A DPDK program is running in userspace which will receive
> > packets from AF_XDP.
>
> Right, so it's just devmap redirect that breaks. What do you mean
> 'redirection stops', exactly? How are you seeing this? Does xdp_monitor
> (from samples/bpf) report any exceptions?
>
> -Toke
>
So, In my setup, there are three systems, Let's Assume A, B, C. System
B is acting as a forwarder between A and C. So I can see the number of
packets received at system C. To be specific, only 1024 packets are
received. If I remove the xsks_map part from the code and don't run
DPDK in userspace. This problem does not occur. Also if I forward all
the packets using AF_XDP, there is no such issue.

- Maharishi
