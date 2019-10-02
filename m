Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40480C8E59
	for <lists+xdp-newbies@lfdr.de>; Wed,  2 Oct 2019 18:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfJBQ3H (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 2 Oct 2019 12:29:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43022 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfJBQ3H (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 2 Oct 2019 12:29:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id n14so17765534ljj.10
        for <xdp-newbies@vger.kernel.org>; Wed, 02 Oct 2019 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4iMAFOIlgD8KCaBB+zVqGC0WZM5rzQq/ee+5RYJEX90=;
        b=UdXrdT122ibxMoO2+1b77E2Lit2105KIbmeevPWZjPh/ZsM+FpRI5pPS9U+lOjT67o
         ErZxw+yjMF7fvDz72adcamWIIbMUKdpqqq/LMAVQeJqXv3ixT39c1vlloRJwNBd9v/4z
         E8DLvzCXlpXUieYgGcdawCi9rDiughz59425l2FXFiD54C+5UWeRaRJ5wR788wOFo14/
         PvXYi+lkiclvGvuHvp2LtDbid/aiRhzMZ9d2hzKWDgQYsk+hff+jsgnLVQvEBJE2wnA9
         6praNZVm5mjgsXcK0jHnK4h+L2ewZKcqjKu53eCpCAiZWUtBiTaAC9Bpd2rBtA1GIClH
         BTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4iMAFOIlgD8KCaBB+zVqGC0WZM5rzQq/ee+5RYJEX90=;
        b=BpoiPiN+Nyb/MtB+sOQvzcwjrZpRHCbRW8sqDLkmEQ/Ik6QtJe0AlpT77xlprFUpAL
         VjBZiHIgGWtyx+Wwp4b05/4KoBsOV70dWpT3Jj26uZsWv2uas1BmG/xvgV2fXZEEdmur
         6gMHikmWojYaqo2UtyFl21IUFezk0qUAo+e+FOxPt89qVtvPym7nIBnKOdTsjNXzM+Xp
         JQ+GacnV14G5zSrUeFnsigNgHiLtUalcr6nOQ8cd2ap8vGi6eMDMnFzf2+fhFkcMHH8y
         YaOQG0x1/a3ay6gfvlPIZHiNVt4TuM8vyHQyPwX94jw3p73sZfw6GmdINFW0f6v81JeG
         gwJw==
X-Gm-Message-State: APjAAAWgKZq/PgnyCA7uZrfmljizdYZVrqVyHf1nIkwkByR6QieT62hW
        e7QQwAbv1tfSIRwCT6md715QWWYagbQ=
X-Google-Smtp-Source: APXvYqzW7+0iHdamyC0qb4sChpwEfU7THK/IYYBTRJCmscWTTbAssJ1sQztUPuMH4lfZ+4QqnQl/1g==
X-Received: by 2002:a2e:88cd:: with SMTP id a13mr512361ljk.102.1570033745164;
        Wed, 02 Oct 2019 09:29:05 -0700 (PDT)
Received: from localhost (host-185-93-94-35.ip-point.pl. [185.93.94.35])
        by smtp.gmail.com with ESMTPSA id n2sm4825686ljj.30.2019.10.02.09.29.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 09:29:04 -0700 (PDT)
Date:   Wed, 2 Oct 2019 18:28:57 +0200
From:   Maciej Fijalkowski <maciejromanfijalkowski@gmail.com>
To:     =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Cc:     =?ISO-8859-1?Q?J=FAlius?= Milan <Julius.Milan@pantheon.tech>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        Marek =?ISO-8859-1?Q?Z=E1vodsk=FD?= 
        <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        William Tu <u9012063@gmail.com>,
        Eelco Chaudron <echaudro@redhat.com>
Subject: Re: xdpsock problem testing multiple queues
Message-ID: <20191002182755.00000657@gmail.com>
In-Reply-To: <CAJ+HfNh58fN=BU5ADzTs=vbCD1j5fs0i1EKhAQQdByjiVHz4BQ@mail.gmail.com>
References: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
        <CAJ+HfNh58fN=BU5ADzTs=vbCD1j5fs0i1EKhAQQdByjiVHz4BQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 2 Oct 2019 15:52:04 +0200
Bj=F6rn T=F6pel <bjorn.topel@gmail.com> wrote:

> On Wed, 2 Oct 2019 at 14:11, J=FAlius Milan <Julius.Milan@pantheon.tech> =
wrote:
> >
> > Hi all
> >
> > We are trying to test multiple RX queues with sample program xdpsock fr=
om kernel on vmware virtual machine with 2 queues.
> > The driver on the NIC is:
> > # ethtool -i ens192
> > driver: vmxnet3
> > version: 1.4.16.0-k-NAPI
> >
> > NIC has 2 queues, I can check it by ethtool -S.
> >
> > But when I try to use queue 1, I am getting following:
> > # ./xdpsock -i ens192 -q 1
> > /home/jmilan/ws/pt-xdp/linux/samples/bpf/xdpsock_user.c:xsk_configure_s=
ocket:315: errno: 1/"Operation not permitted"
> >
> > Any ideas what the problem could be? Maybe vmxnet3 driver does not supp=
ort some necessary operations related to queues?
> > =20
>=20
> XDP support is missing for that driver, but the XDP_SKB/generic mode
> is available, and should work.
>=20
> Can you run the xdp1 application in the samples directory, to rule out
> that you can run XDP.

xdp1 should work fine but I think the reason for a reported failure is beca=
use
vmxnet3 driver doesn't expose the {set,get}_channels ethtool API (at least I
don't see it?) which is used by libbpf's xsk part for querying the underlyi=
ng
driver how many queues does it has and use that info for creating that many
entries in XSKMAP.

So in that case you're limited to use queue 0 because the XSKMAP map has
only single entry.

Maciej

>=20
>=20
> Bj=F6rn
>=20
> > Best Regards
> > J=FAlius =20

