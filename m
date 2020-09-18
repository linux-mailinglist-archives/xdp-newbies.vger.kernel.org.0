Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D420270442
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Sep 2020 20:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgIRSmm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Sep 2020 14:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgIRSmm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Sep 2020 14:42:42 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33EDC0613CF
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Sep 2020 11:42:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n13so6979976edo.10
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Sep 2020 11:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=j2eYNeg015udNGB8swkWKCandUmqIuS/Xe2LmSRaFMs=;
        b=DaC3f1BQ+/JwBqOPggYcXO0ttF5AY4WLqev27AoWLLlCjCvOK26VdxXciuVnb+fWYl
         VzkhKKGO39J2GMO/xm2w/NPxWh7BRRRNiJUcNnMcUYTv/VrVlwAirQDKjEiS4+voEwy7
         Ylde2t1knqM0L0way6PjPSNgRAyUDjz9QGp/Zv5zPS8DTHsV0p4bHs47NFg85CbXsCZ+
         B2cEmzbNU2zdw6fklLYN8X8Lxelt1SHOpW3VpQxg6p7dAeYz5pRcRY+foBpppQjhO7cq
         bFlgJtH9JKBJ6PwnbHN4+805r3H46SVvbhIAgpqBl3biqW8f7m4khvNg+1YR5ZTzd3R+
         64sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=j2eYNeg015udNGB8swkWKCandUmqIuS/Xe2LmSRaFMs=;
        b=mSBTvWH3jkR78pSgJYOZ3NRKvwluUFy51uC/mfkTje3uDzzUMczv+sBtkvrsUJwXkm
         VPaSZYnkHXvbvsncrf5zyfJrDiLWM77ww/lKwGOUtUfB+ndcoGGq1y5SKdOJCAyFK+l8
         bKWsLDEoYGRHo9k2TKb0ntINFJ7ct5zvW5qpJUN9nS7xzuAujT272tlOT4Zq5xIPQVK4
         q/nSPLb0QSHuer52sh8VmxjS2LJCWUazgzHe5HjLFroBv2Rs5OQZ0Yg5lNSgMDo7CVir
         BeT5VN1WcSWPj41CKrRCL3X16OYEnp7cYwcBKl652fTZm/HSjBwFzWNgeP2ePv6XExBQ
         TqxA==
X-Gm-Message-State: AOAM531zuplvUsmfr9WfZark0E5nEb4NGxOeHiDngscPCojBRilof2V7
        W3XgXe2ooqA2xuismtoDruqqIRxiWlytLsXfeNmA+c92vqoYqw==
X-Google-Smtp-Source: ABdhPJzdTUwevCCSRXf9B3zvn2ga/zq/Rfplxg6Gxc20JE22mIWDN9Ea6BmwCQHJYNUIR6y0HTuXds4izsjqThL0FVE=
X-Received: by 2002:a50:e807:: with SMTP id e7mr40685696edn.84.1600454560171;
 Fri, 18 Sep 2020 11:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
 <87lfh7fkqs.fsf@toke.dk>
In-Reply-To: <87lfh7fkqs.fsf@toke.dk>
Reply-To: ThomasPtacek@gmail.com
From:   Thomas Ptacek <thomasptacek@gmail.com>
Date:   Fri, 18 Sep 2020 13:42:28 -0500
Message-ID: <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
Subject: Re: bpf_redirect and xdpgeneric
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

The setup is pretty simple. There's an eno1 (igb driver), to which our
default route points. On the same box are several VMs. There's a tap
interface (for each VM, call it tapX). Traffic for a VM flows in from
the Internet on eno1 and is directed to tapX; the response traffic
flows in the other direction.

I'm deliberately simplifying here:

eno1 runs an XDP program that does some lightweight IP rewriting from
anycast addresses to internal VM addresses on ingress. eno1's XDP
program currently XDP_PASS's rewritten packets to the IP stack, where
they're routed to the VM's tap. This works fine.

tapX runs an XDP program that does the same rewriting in reverse.
Right now, it also XDP_PASS's packets to the stack, which also works
--- the stack routes response traffic out eno1.

I'm playing with XDP_REDIRECT'ing instead of XDP_PASS'ing.

I have the ifindexes and MAC addresses (and those of IP neighbors) in
a map --- a normal HASH map, not a DEVMAP. Using that map, I can
successfully redirect traffic from tapX to arbitrary other tap
interfaces. What I can't do is redirect packets from tapX to eno1,
which is what the system actually needs to do.

---
Thomas H. Ptacek

On Fri, Sep 18, 2020 at 5:21 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Thomas Ptacek <thomasptacek@gmail.com> writes:
>
> > Weird question:
> >
> > Should there be a reason for me to expect bpf_redirect to fail when
> > redirecting, in XDP, to the egress of an xdpgeneric device?
>
> What does 'the egress of an xdpgeneric device' mean, exactly? I.e.,
> could you share some more details of your setup, please?
>
> In general, mixing native and generic mode XDP is not likely to work
> well...
>
> -Toke
>


--=20
---
Thomas H. Ptacek
312-231-7805
