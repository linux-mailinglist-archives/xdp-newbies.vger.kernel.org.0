Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7A313D191
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 02:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgAPBep (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 20:34:45 -0500
Received: from mail-ed1-f47.google.com ([209.85.208.47]:33491 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729195AbgAPBep (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 20:34:45 -0500
Received: by mail-ed1-f47.google.com with SMTP id r21so17420141edq.0
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 17:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MJIkB1j9IdxFHK4TGdPHUdrMsMSjjbDpA+tPZGsAw14=;
        b=cqgllS93aSpdivFzdmyYtXevQr/b9gGzE3BVBau8y2JCGD3I4B3C4W55STAjsTHofA
         HWg0ZBQKAjFxbhKrbeAEJWgibjdxWrpZfx/2MTN6a6bg5Qq1ZEZJxPQabQH1jNhi4f2p
         vn/4gNJTpH4aO23NrMmUWvyc00UdK5wn3LIFAClwzvIikPmh3RnrOSLOjc9D9i9Osk+8
         1RWGorlnsjSKYXLcRLSgwlhcR3ilDd7srDSi1RtA9DaBAdHcwnRxx5nl3Z5ScF6jrEW4
         iab3vpZl+lDZR/87Rii4WZX92y0HtBskn0C6woVCFXjmDUGz6i/OaN4gAwR+zCGfuSp6
         1oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MJIkB1j9IdxFHK4TGdPHUdrMsMSjjbDpA+tPZGsAw14=;
        b=mDTJ8Uh9p5bzMBH/aFIiqOBqZqmk2+3Ln8a9ZQudl7JoE/09ELuB42dQhrRl4QJZ4u
         ddh8c//2CQMr3mne1FDWdyl8kw6tN6ujKFPEjrizzyNUCC+0sLZB5xehxPvJ2dRvlQZZ
         RNo4A5gTHpeQiadLMe95YkNA2SkhgKTwavGVgDDsYRapCSOefqzJuc60IsP5IHHzclox
         bY/MvRyDntCPBh+2ZJ8GlkhqLxOMfgYU0kgPDqjuhWokZP/ZRANuEseTLJ8oI9ARUIOo
         z8fvE0uss1uTIUzYnRjG4BNtrwZMrunMWBL3YT+9+unTSEX4sg/JSSlQ/pRfLFL6yI6x
         tlmA==
X-Gm-Message-State: APjAAAV50g9SVKU3I0vAKvDTEuWTYw8wZW+rHEHHLckGLbf0bNvf32yy
        +QvjXTiVr4r6J0BXGQs8KN7jD1JOZzRE/HD33BU=
X-Google-Smtp-Source: APXvYqyneykKhYSGnc9GONbxYtf66CDBGtFxfj5pCBjW+vEG9iOiErAisex8hCUl2fVqQqVy6Inl8GgUjbji9ZAkhfg=
X-Received: by 2002:a50:84ab:: with SMTP id 40mr13242652edq.14.1579138483583;
 Wed, 15 Jan 2020 17:34:43 -0800 (PST)
MIME-Version: 1.0
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
 <87ftggtl7t.fsf@toke.dk> <CAK86TEcyRqVrB-OOiCxtM6WLMp-Sr_+eO9G70+T=OMpF2KBrgQ@mail.gmail.com>
 <99fe90fe-cbb4-1ff1-156b-bd8053293aca@gmail.com>
In-Reply-To: <99fe90fe-cbb4-1ff1-156b-bd8053293aca@gmail.com>
From:   Vincent Li <mchun.li@gmail.com>
Date:   Wed, 15 Jan 2020 17:34:32 -0800
Message-ID: <CAK86TEcGAkmPLeYACWGtLT0CJPZqGYCqZDpZSO=0x4_ph0qcUA@mail.gmail.com>
Subject: Re: XDP invalid memory access
To:     David Ahern <dsahern@gmail.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

thank you! I will try that

On Wed, Jan 15, 2020 at 4:40 PM David Ahern <dsahern@gmail.com> wrote:
>
> On 1/15/20 3:31 PM, Vincent Li wrote:
> > On Wed, Jan 15, 2020 at 2:21 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com> wrote:
> >
> >> You have to check that you're not reading out of bounds before
> >> dereferencing the bytes in the TCP header...
> >>
> >
> > I have below before the optlen
> >
> >    47 /* sanity check needed by the eBPF verifier */
> >
> >     48 if ((void *)(tcphdr + 1) > data_end)
> >
> >     49 return 0;
> >
> > this is not enough, how do I check the out of bounds properly?
> >
>
> options are optional and after 'struct tcphdr' you need to do something
> like:
>
>    if ((void *)(tcphdr + 1) + tcphdr->doff > data_end)
>        return XDP_....
