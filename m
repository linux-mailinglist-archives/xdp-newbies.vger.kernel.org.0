Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD294B70C9
	for <lists+xdp-newbies@lfdr.de>; Tue, 15 Feb 2022 17:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiBOO72 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 15 Feb 2022 09:59:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbiBOO72 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 15 Feb 2022 09:59:28 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16ABDFA8
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 06:59:17 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id d9-20020a17090a498900b001b8bb1d00e7so2337996pjh.3
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 06:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=princeton-edu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2SZKxNehK9wETrLcCtclxxvBiS0ZB8izQKJtImnrHek=;
        b=v8lr7Y2i5aK5KelNN2Ik42bR/81Pu9dfBUeWN5HchP45OO1wyFszQcKKvD61UTJTnb
         0b8ZeFUgDUYTxd1m+JKE8QrqE26dPcWMwA8r3UbkmJcdjox079n1Nk1oCY5JbH2qwfci
         UIszfWGkW5jg+jBYP3owk44RQxLSmGjClQukhzVu7X6O+pBgzxV8g+gcBs6DNiIdMn6t
         Z8mVPxrVdKQJD6uTUGc0Gb9UhErme9UfUbf2dgl7fiNj/QtplE7mGa3VY265Zt3ki7Ue
         0mHQr2/cfl4SvC4rlYL+Oox3HlzSMm2I4CWQQoDfO7ObLROfLVWciV+/oxzxAqP0BWMu
         REQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2SZKxNehK9wETrLcCtclxxvBiS0ZB8izQKJtImnrHek=;
        b=lQQQoQncwdk7wYSlE6LL+vIUrLQTvzvzBskD7mLl1Q3zVlmxtZkTA1sLPb6XfiFOif
         +ZgtuEqrHm1Kw5hDL5czprUOX5ksw9z/7XYO/OVk+krpT705La9u4q5h3F/UboOjSyKy
         oMZyOt7RAJtJ0ys4e3+ns3wzl9uHmf3UeQ3YqSZZ4tq/t1HtWEKLzeMDyOMPW75webFZ
         GS49N59jplzMiP2WNK5wZPQfmbP8kvCEBpA9kQ5je9L6TKj/qo5yMMdMEFRgjl8ZvZ18
         IPOKyPs16hSxWXrJLjV9igjVcz484ZpfCP15VtZATMU2Dle4LmWhDeznuwOnLW3l5IwS
         vMDA==
X-Gm-Message-State: AOAM533rXuSWBodoetJDYuqsIUePWrWht4hGvtLUgHKdPLT1CZM4VlQW
        4BpwWXUL3Y6+kXWxlWT2dCE+Yxam/Scd3MnIlZU2qfpQD1/4oA==
X-Google-Smtp-Source: ABdhPJxkYU7J/qxvAEdXWlZ5sPhFygwkokK58zFdqPSWWrL/d3PKMr1kAVL3/tCyZMkXy5IO2cRREPFfDSmqv7h7McQ=
X-Received: by 2002:a17:902:cf06:: with SMTP id i6mr4723021plg.66.1644937157289;
 Tue, 15 Feb 2022 06:59:17 -0800 (PST)
MIME-Version: 1.0
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
 <877d9x7168.fsf@toke.dk> <CANLN0e6d-=3SjX_VEOOVmPBfCy74KCSTwBCTFxyxEgczpQTwTA@mail.gmail.com>
 <874k516q32.fsf@toke.dk>
In-Reply-To: <874k516q32.fsf@toke.dk>
From:   Sophia Yoo <sy6@princeton.edu>
Date:   Tue, 15 Feb 2022 09:59:06 -0500
Message-ID: <CANLN0e6ersLvCSZSbxt6Roy2qJV2C90Y12RmEwQNtwyX2tURwQ@mail.gmail.com>
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> Is it possible the packet is looping? I.e., it goes out eth0, you
> redirect it to egress on eth1, it goes all the way up the stack and the
> kernel ends up forwarding it back out eth0?

I don't believe so, as I am redirecting from the egress on eth0 to the
ingress on the same eth0 interface.

> >> So this has nothing to do with the support in the driver; XDP is simpl=
y
> >> not suitable for what you're trying to do. Why are you trying to do th=
is
> >> in the first place? I.e., what's the higher-level use case here?

> > The higher-level design goal (simplified to what's relevant) is that I
> > am trying to perform a TCP 3WHS between the kernel network stack and
> > my xdp ingress/tc egress hooks, where some trigger on xdp ingress
> > sends a SYN packet to the network stack, and when the network stack
> > returns a SYN-ACK packet the egress program redirects the packet to
> > the ingress interface, where the XDP program converts the packet to an
> > ACK packet, then completing the handshake with the network stack.

> It's trying to handshake with itself (on the same box)? Why? Is this a
> real use case, or a test for something else? If the latter, have you
> considered using a veth pair in going to a different namespace (that
> gets the "direction" right)?

This is a real use case as part of a larger design I am working on.
However, given that redirect from TC egress to XDP_DRV_MODE ingress
fundamentally doesn't work, I am rethinking other options to the
design. Alternatively, it seems that support for XDP_REDIRECT from
egress to ingress is currently in the works, although I don't believe
the patch has yet been applied to the mainstream kernel. So I will
also try building the kernel myself with the patch and hopefully get
the egress to ingress redirect working with 2 XDP programs attached in
driver mode. Thank you very much for all your help!


On Mon, Feb 14, 2022 at 5:28 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Sophia Yoo <sy6@princeton.edu> writes:
>
> > On Mon, Feb 14, 2022 at 1:28 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com> wrote:
> >>
> >> Sophia Yoo <sy6@princeton.edu> writes:
> >>
> >> > Hello,
> >> >
> >> > I am relatively new to BPF/XDP, and I=E2=80=99m currently trying to =
use a TC
> >> > egress program to redirect a packet back to ingress, where I have an
> >> > XDP program attached. When the XDP program is attached in generic mo=
de
> >> > (XDP_SKB_MODE), the redirect occurs properly and the packet is seen =
on
> >> > the ingress of the interface, but when the program is attached in
> >> > native mode (XDP_DRV_MODE), the packet never redirects and is just
> >> > seen exiting the interface, even though the return code of the
> >> > redirect function is =E2=80=9Csuccess=E2=80=9D.
> >>
> >> The difference between XDP generic and driver mode is that the generic
> >> mode is hooked into the core networking stack whereas driver mode runs
> >> in the driver as the very first thing after packets are physically
> >> received from the network.
> >>
> >> This also explains why what you're trying to do doesn't work: the TC
> >> hook runs in the core networking stack, and when it does a redirect, t=
he
> >> packet does not actually pass through the network driver, it appears
> >> further up in the stack, where only the generic XDP hook will see it.
> >>
> > Thanks for your quick response! I see, I didn't realize that the
> > packet was being redirected before it passed through the network
> > driver. However, in this scenario, shouldn't the packets "disappear"
> > after being redirected from tc egress to xdp ingress? In other words,
> > even if the packet doesn't actually show up on the xdp ingress hook in
> > driver mode, it should at least not be seen exiting on the egress path
> > (e.g., on tcpdump)?
>
> Is it possible the packet is looping? I.e., it goes out eth0, you
> redirect it to egress on eth1, it goes all the way up the stack and the
> kernel ends up forwarding it back out eth0?
>
> >> So this has nothing to do with the support in the driver; XDP is simpl=
y
> >> not suitable for what you're trying to do. Why are you trying to do th=
is
> >> in the first place? I.e., what's the higher-level use case here?
> >
> > The higher-level design goal (simplified to what's relevant) is that I
> > am trying to perform a TCP 3WHS between the kernel network stack and
> > my xdp ingress/tc egress hooks, where some trigger on xdp ingress
> > sends a SYN packet to the network stack, and when the network stack
> > returns a SYN-ACK packet the egress program redirects the packet to
> > the ingress interface, where the XDP program converts the packet to an
> > ACK packet, then completing the handshake with the network stack.
>
> It's trying to handshake with itself (on the same box)? Why? Is this a
> real use case, or a test for something else? If the latter, have you
> considered using a veth pair in going to a different namespace (that
> gets the "direction" right)?
>
> > Initially, I had wanted to use an XDP program instead of a TC program
> > on the egress path to do the redirect to ingress (which I believe
> > would bypass the current issue if both ingress and egress xdp programs
> > were attached in driver mode), but as of now it seems that redirect
> > from egress to ingress simply isn't supported in XDP, which is why I'm
> > using a TC program.
>
> Well, there's also an ingress hook for TC you could look at (or just
> stay with generic XDP).
>
> -Toke
>
