Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79389B33B
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2019 17:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390470AbfHWPXU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Aug 2019 11:23:20 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38626 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbfHWPXT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Aug 2019 11:23:19 -0400
Received: by mail-qt1-f196.google.com with SMTP id x4so11544604qts.5
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2019 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T02i3w8Z197UNR9oZA+FVCTHBotiZqaemPfFX30K9t0=;
        b=uUJmlOD19jRkwIdfzgmScl7d9fd67lpjsSvWsVDFmSR+ABBQvu2u9WlnSbwaGNAzba
         5QgkZPHpQuU1VvFlxTDVpA9x9nMyxnCjex8+H0tDB6RAHp2cQWsZHAb/Wmh2Fjx6qU1j
         /nIKarz6yOipV8P0Md1bVawo+EsRhQmKCWU9hZ00Hw4bxqt3YiV9wrh4ZxMgt+tPSmZ6
         UT+J64jqy4rq2r5zyfC0AC6u/fY0Zl1+RGmfI9767+sDoU9JKdpnrHRVg0D5yG5D1162
         ueXpsxE69qqSQ1+RXrCCBOYjDToFzq58R6ukE4O/DrKO55AkGnFX5rChlAzZktn9JWRB
         bSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T02i3w8Z197UNR9oZA+FVCTHBotiZqaemPfFX30K9t0=;
        b=rPtLnAFJUPd7KKXp3GS0cYQL0pBtJAYuCUFXAxM0ojutrXRYlHRVcdP0t4ryzXp2kB
         RUFZZclLXY1wnpER7kcmm8/C6IpOmEHTSjNmLibKwHEWNxVTX63gGljF8VAqhVKNvKOE
         gqKufsENWRB/iBh6v1JCd7uxmk+chwtDRiaJqI5LUkQpSM58X6C7p/RWMhm+qTGLjvbP
         ypvYTVg/+kWBTa7mgCWDyTVtrcYpTlNOR7VX43LlraOG/Xw0Mg2edIRZmoo3PLaSEvZZ
         mXXA0NgmuUsuKRlKHoVoNGIbJrevpdVmjCCaFqNmFCVD3PK5dcc4LwEgsO0IzGVxm9+K
         /kQw==
X-Gm-Message-State: APjAAAUlYRkAZV9FsetET4U6pXx1Je3n+167/Yf9jBwjyuHihsrgIKJJ
        qnrruF+uEQzJ4QlVXQHK5DbqzVF7UBB5jqoOpsc=
X-Google-Smtp-Source: APXvYqyFKy93qexixgJlRmM62lYolyLK2AGEtxtOBVY99dA07i0cyYDz6ZtldCm8kGDPYaCmIdoEvepY2Wtf375fI9E=
X-Received: by 2002:a05:6214:4cc:: with SMTP id ck12mr4200264qvb.194.1566573798814;
 Fri, 23 Aug 2019 08:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon> <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com> <97f984e84a7049bc80cdf6438d1f5f4d@pantheon.tech>
In-Reply-To: <97f984e84a7049bc80cdf6438d1f5f4d@pantheon.tech>
From:   William Tu <u9012063@gmail.com>
Date:   Fri, 23 Aug 2019 08:22:41 -0700
Message-ID: <CALDO+SbQeRjrPg5jFEOesEjtAVZSKv8CWipnHOE6FX5CgXBbOw@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Aug 23, 2019 at 7:56 AM J=C3=BAlius Milan <Julius.Milan@pantheon.te=
ch> wrote:
>
> Many thanks guys, very appretiated.
>
> Going to take a look at OVS implementation, but I would like to ensure so=
mething before.
>
> >> I took the _user part and split it into two:
> >>
> >> "loader" -  Executed once to setup environment and once to cleanup, lo=
ads _kern.o, attaches it to interface and pin maps under /sys/fs/bpf.
> >>
> >> and
> >>
> >> "worker" - Executed as many as required. Every instance loads maps fro=
m /sys/fs/bpf, create one AF_XDP sock, update xsks record and start listen/=
process packets from AF_XDP (in test scenario we are using l2fwd because of=
 write-back). I had to add missing cleanups there( close(fd), munmap()). Th=
is should be vpp in final solution.
> >>
> >> So far so good.
> >>
> >> I'm unable to start more than one worker due to previously mentioned e=
rror. First instance works properly, every other fails on bind (lineno may =
not match due to local changes):
> >>
> >> xdpsock_user.c:xsk_configure:595: Assertion failed: bind(sfd, (struct =
sockaddr *)&sxdp, sizeof(sxdp)) =3D=3D 0: errno: 16/"Device or resource bus=
y"
> >>
> >>
> > I don't think you can have multiple threads binding one XSK, see
> > xsk_bind() in kernel source.
> > For AF_XDP in OVS, we create multiple XSKs, non-shared umem and each
> > has its thread.
>
> In OVS, can you bind two sockets with non-shared umem to the same interfa=
ce?

Yes, but to the different queue id on the same interface.
So each xsk with non-shared umem bind to distinct queue id of that interfac=
e.

> Our goal is to have 2 or more processes (VPPs) listening on the same inte=
rface via XDP socket,
> while XDP program decides where to redirect the packets at the moment.
Make sense.

Regards,
William
