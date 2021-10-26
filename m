Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97D343B9AB
	for <lists+xdp-newbies@lfdr.de>; Tue, 26 Oct 2021 20:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhJZShH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 26 Oct 2021 14:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhJZShG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 26 Oct 2021 14:37:06 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F779C061745
        for <xdp-newbies@vger.kernel.org>; Tue, 26 Oct 2021 11:34:42 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id d204so21850344ybb.4
        for <xdp-newbies@vger.kernel.org>; Tue, 26 Oct 2021 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iRxd5pc1GncumC0VLpd8+ty5CF2zfb9oHndDcotje2g=;
        b=k+ZFpIEVMq2pfv5eSDuwM5oDP861S/cKSsWM2s7pTnbRAR0W+p5nHBdbRSN2So6+3k
         TyHMiodg0yll6zBQzYlQR6jyErXqY22nbjgCW5LDUOeqJ5WrAd/znNHFKU1nQYVKgRdc
         vCXj0OTEpSdKzQV2s8tHn7BncrC2ntqj2aEeHBU0guQvEfMNRpZ3XYOUHLXJmfLx9KAR
         xubESZwNiQCjUnsv3gYjxOiSCRdLW35On12vw5xYHsJuSX5SB1GF+DmwJqXsinIwSKN9
         TSUwO7Phf/xgLkRAiKjiI4GI3rES9pcxlyNnftfqzo7wBALyMqIN2GnQqWlB3pnMLerp
         fopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iRxd5pc1GncumC0VLpd8+ty5CF2zfb9oHndDcotje2g=;
        b=6grDkO0tvVJhW3e68ZaggIN4FTWfQlTECo2fsb9Eqdax5J+bTIKT6LPlVmkXPMUvl5
         3bvrW4HdSiUF9aQoTo4V/aThdYXAIiXQ13fT8YTMiEBhYH7f8dMZVKh2BdvM8USfiHn9
         0hhhMu3ma0vwKPwRbghJ+BKeuRr+9iFPtCfb+OuxTm4TkUBWXtitUkKqRpzSQKoT04fX
         sxGUgl7aT8PAozv1sSvxjArnsPWshb6wH+w8H7wZBK27bj3FsTu5D6wVuq3DF28KK22X
         2fiNcYpAoBdKmbHgNrzzQ7mWT+d1kH2IDqM58BkmK7t2O3HApPqPiTWCMLH+vU3XbFjJ
         wfzg==
X-Gm-Message-State: AOAM532RNfONhCjPV6/dWcMWZvD4b6Rtt4IfqzGA7OtNoTJ20X35YDZs
        /24uat/TxaZ8dAKP53UkZwQhCbtuutvOwZoUysUYQvCiu5g=
X-Google-Smtp-Source: ABdhPJxpojVx45YN8celJRcSs9WPbtof01lNYC023LqfX/darFeiAaE5+oyKLf2cBa3kH7Us9Km+2Zf8q5KbKIBlwiU=
X-Received: by 2002:a25:ace2:: with SMTP id x34mr6890839ybd.194.1635273281248;
 Tue, 26 Oct 2021 11:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
 <875ytlcrdi.fsf@toke.dk> <CAEM4-kBWUK=BatL+CguHyey9S8Fb4dSD0-CvbvVT+JtaAn_sng@mail.gmail.com>
 <oM1Y-n6UaYUi_6m-lAXmxeqxarfyIBRoZcEpq5WObujvHCCFRZZNwjrBIn0ycTo5oevKJvw6JtlR2UeE2qqzwtKV_QNrpxHBfFgJ_EQLdfQ=@zemek.io>
In-Reply-To: <oM1Y-n6UaYUi_6m-lAXmxeqxarfyIBRoZcEpq5WObujvHCCFRZZNwjrBIn0ycTo5oevKJvw6JtlR2UeE2qqzwtKV_QNrpxHBfFgJ_EQLdfQ=@zemek.io>
From:   Jun Hu <hujun.work@gmail.com>
Date:   Tue, 26 Oct 2021 11:34:30 -0700
Message-ID: <CAEM4-kBho+aUNNSAoGWWF-Ou=2QC+7b6OD6m+JixOHCcye9RFw@mail.gmail.com>
Subject: Re: AF_XDP socket TX path interact with TC?
To:     Konrad Zemek <konrad@zemek.io>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Oct 26, 2021 at 4:08 AM Konrad Zemek <konrad@zemek.io> wrote:
>
> On Monday, October 25th, 2021 at 8:26 PM, Jun Hu <hujun.work@gmail.com> w=
rote:
>
> > On Mon, Oct 25, 2021 at 3:48 AM Toke H=C3=B8iland-J=C3=B8rgensen toke@r=
edhat.com wrote:
> >
> > > Jun Hu hujun.work@gmail.com writes:
> > >
> > > > Hi,
> > > >
> > > > I want to put a timestamp in the egress packets, and I want to use
> > > >
> > > > AF_XDP socket for both sending and receiving packets; since a XDP
> > > >
> > > > kernel program only work in ingress direction, I wonder if I could =
use
> > > >
> > > > a tc kernel program to change a packet sent out via an AF_XDP socke=
t?
> > > >
> > > > I searched around, but couldn't find any direct answer...
> > >
> > > Nope, AF_XDP bypasses the stack completely, so TC won't see the packe=
t
> > >
> > > on egress...
> > >
> > > -Toke
> >
> > Ok, thanks for the clarification, I guess I have to wait for the XDP
> >
> > egress support ...
>
> You can also directly modify the packet that you send out through an AF_X=
DP socket, before putting it on the outgoing queue. Is there anything speci=
fic that you would want to do in an egress-attached BPF program that you wo=
uld not be able to do in the userspace program that manages your AF_XDP soc=
ket?
>
> Konrad

Yes, that's what I am doing right now, however ideally I want to add a
timestamp to the packet as close as it egress the NIC; since AF_XDP
doesn't have access to hardware timestamp, that's why I was searching
for an alternative solution.
