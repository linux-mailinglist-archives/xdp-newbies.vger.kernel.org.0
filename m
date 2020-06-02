Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708761EBED9
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Jun 2020 17:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgFBPPi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Jun 2020 11:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgFBPPi (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Jun 2020 11:15:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53635C08C5C0
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Jun 2020 08:15:38 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g1so9500341edv.6
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Jun 2020 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XGUqY+/7fF3GjL9tpVZRl4PMGmlb70kJZqctOG3rTO8=;
        b=G5QO8Vs6JqoNBvnbrQ3flnTRvx26c3HL5RP6KcXnMN4oUlyHWe9nFA9RMmGehLGJEy
         DAqz1eDyLbvDxpJz4mRDATu2V3mFRWb40rNe4D98wVBKssZLMMpE7jXIbglb/6sdhzXH
         GDlq7Y2QC+HcCXsfB3pof88vXLC0TGKa3KV9zKqtog0YF0lcoJYDhSaK3Ugz3qsavBXJ
         VxKj/Gg/CmcDoILs4n0hHOVVaYif+EtsTUf15dkEea1NO8gKOuTXDk3zS8ZdByGKCyua
         cqgaeIORvIF055GJen8crddvPiNrpIwCuytCCbpMbCB+nt/yVsQ1HGUsr+FJdyBQv1je
         ewbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XGUqY+/7fF3GjL9tpVZRl4PMGmlb70kJZqctOG3rTO8=;
        b=AqvhUApwmon52PvrSJAkOuU5q7v13WU4h4svGclsow9TUiXLg5Ew4V2FT5tuCnZJFl
         vktyRfDO5kM/mcr9Oe72chcXiOjMSAm4vu3B9WyoUn2AQU3q9xi/Mb4a1coqnnot/8dq
         ZuqnDs82+59UO37ueyVp/7thJZB2IwDJyZON28mpYA8lNEvDLy4aQPVbXGj0goqGVKCY
         pPU6oPEUkNTiurcke9QfmZTNWPC6bwp8piRg9+KnAGJHJsbOihmRofhV8ryM82P35kzZ
         Q6km95S+F+YjEt4WvDGScNuhwgCJZ6MFFQgEbYDL6HAz4vIysG/QIci/Xz2oqPj4bgWm
         AmeA==
X-Gm-Message-State: AOAM531SD7LUXR8ZazMO4uQSg+V4qU1/IZhgYOsVSlNBXLVpaDoep0Ms
        +lnjdr9uQ6TCeAdpbE1BqZhi9PKZTtwLUk+BP/8=
X-Google-Smtp-Source: ABdhPJz0+iPYu/Uz/Rybb2hG8ww/JQqBbwGz+ST82YTb2w2J+UH+FvlGZQiOHeZ8Gwk65ZcbO8PhC99+ohGqxuCbCV4=
X-Received: by 2002:aa7:cd41:: with SMTP id v1mr14171711edw.378.1591110936962;
 Tue, 02 Jun 2020 08:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
 <87d06hzvr8.fsf@toke.dk>
In-Reply-To: <87d06hzvr8.fsf@toke.dk>
From:   maharishi bhargava <bhargavamaharishi@gmail.com>
Date:   Tue, 2 Jun 2020 20:45:25 +0530
Message-ID: <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue 2 Jun, 2020, 14:31 Toke H=C3=B8iland-J=C3=B8rgensen, <toke@redhat.co=
m> wrote:
>
> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>
> > Hi, in my XDP program, I want to redirect some packets using AF_XDP
> > and redirect other packets directly from driver space.
> > Redirection through AF_XDP works fine, but redirection through dev map
> > stops after some packets are processed.
>
> Do you mean it stops even if you are *only* redirecting to a devmap, or
> if you are first redirecting a few packets to AF_XDP, then to devmap?
>
> Also, which driver(s) are the physical NICs you're redirecting to/from
> using, and which kernel version are you on?
>
> -Toke



Currently, I'm trying to redirect packets only using devmap. But also
have code for redirection using AF_XDP(only when a given condition is
satisfied). A DPDK program is running in userspace which will receive
packets from AF_XDP.

Drivers: ixgbe (2x10GbE Intel NIC)
Kernel version 5.3

- Maharishi Bhargava
