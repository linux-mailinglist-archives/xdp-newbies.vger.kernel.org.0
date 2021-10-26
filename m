Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC9D43B0C9
	for <lists+xdp-newbies@lfdr.de>; Tue, 26 Oct 2021 13:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhJZLKx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 26 Oct 2021 07:10:53 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:46300 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbhJZLKw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 26 Oct 2021 07:10:52 -0400
Date:   Tue, 26 Oct 2021 11:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zemek.io;
        s=protonmail; t=1635246504;
        bh=mWReVgsd3dy4YNup+DbpZLjpv+5zjrOrzLxofFGM+Gg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=aOHK7+B8LAfqKlSKCXNaSkU/SlSMF504QZtdpLNN77RFwKw6Rbxf7/cfhVRWiQExi
         NVcjmIaIZ+K+jAzIa5JQlpPFyrVu4sg011O0fZiH64YJSGvL32otApmH6zh/2asOvH
         LJayNg2DJAH2GoFnQq2o5fA30dWkYNY0YXXkEu9WOosRnXJGmuPmKinvgPu4Eh2VWk
         dNuE86Gs4L/tAvf0c9anQV5H5QT3TSaAPx1hfpYgjdJmmaomodtEurU6CQVqIwzGWW
         wEmMLFCAJsrFtsES+HjZWXsW6DI6T/lRbUSul/7iS6j8d6QyZnctiphLl20syaphJe
         cUL5BlCzk1t3Q==
To:     Jun Hu <hujun.work@gmail.com>
From:   Konrad Zemek <konrad@zemek.io>
Cc:     =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Reply-To: Konrad Zemek <konrad@zemek.io>
Subject: Re: AF_XDP socket TX path interact with TC?
Message-ID: <oM1Y-n6UaYUi_6m-lAXmxeqxarfyIBRoZcEpq5WObujvHCCFRZZNwjrBIn0ycTo5oevKJvw6JtlR2UeE2qqzwtKV_QNrpxHBfFgJ_EQLdfQ=@zemek.io>
In-Reply-To: <CAEM4-kBWUK=BatL+CguHyey9S8Fb4dSD0-CvbvVT+JtaAn_sng@mail.gmail.com>
References: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com> <875ytlcrdi.fsf@toke.dk> <CAEM4-kBWUK=BatL+CguHyey9S8Fb4dSD0-CvbvVT+JtaAn_sng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Monday, October 25th, 2021 at 8:26 PM, Jun Hu <hujun.work@gmail.com> wro=
te:

> On Mon, Oct 25, 2021 at 3:48 AM Toke H=C3=B8iland-J=C3=B8rgensen toke@red=
hat.com wrote:
>
> > Jun Hu hujun.work@gmail.com writes:
> >
> > > Hi,
> > >
> > > I want to put a timestamp in the egress packets, and I want to use
> > >
> > > AF_XDP socket for both sending and receiving packets; since a XDP
> > >
> > > kernel program only work in ingress direction, I wonder if I could us=
e
> > >
> > > a tc kernel program to change a packet sent out via an AF_XDP socket?
> > >
> > > I searched around, but couldn't find any direct answer...
> >
> > Nope, AF_XDP bypasses the stack completely, so TC won't see the packet
> >
> > on egress...
> >
> > -Toke
>
> Ok, thanks for the clarification, I guess I have to wait for the XDP
>
> egress support ...

You can also directly modify the packet that you send out through an AF_XDP=
 socket, before putting it on the outgoing queue. Is there anything specifi=
c that you would want to do in an egress-attached BPF program that you woul=
d not be able to do in the userspace program that manages your AF_XDP socke=
t?

Konrad
