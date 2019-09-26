Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E382EBF719
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Sep 2019 18:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfIZQrO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 26 Sep 2019 12:47:14 -0400
Received: from mail-qk1-f176.google.com ([209.85.222.176]:42384 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZQrO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Sep 2019 12:47:14 -0400
Received: by mail-qk1-f176.google.com with SMTP id f16so2336674qkl.9
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Sep 2019 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ih4kA64J1axdhTR5x45gExjpZa2EcOKOPK3UvyYCARc=;
        b=ADgJBfU1dX0QOI5ACtoY6ksQw3Ul5dZ87dr/QN9z8eq8TeWjF3aCxNZGGf0U4W6jFo
         sCSpHeZ5IuTSS930BBAuahXrhwgWyP4IgtGNg39efqOhyjyc8KvApxIXNxqXedP2haxu
         6acItI4+ryIk7NQW2+LptBvaDObKsZqL5xaGrLgEP0bsqyTWkFVBBlMPIuGJ/zoikMXo
         yRIj0HXpMTvojEcVgJIydVDMZIXf6aip7k3NIppZkLoYBRGeeeART9h9pQHLZQ5O7MHU
         S/qCbL3XI1njzday9X83PHrpv/oFmzwvL8eI6i4rKWgfVcru/SZV27EG/QJXjrNwV6dM
         1IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ih4kA64J1axdhTR5x45gExjpZa2EcOKOPK3UvyYCARc=;
        b=kdfU7GEkTb3niFcd9JlegW8c4LKlR3X0SkbLIi1QsIHv1LcUZmt/aMzveerTwBxuuq
         hRKvGRoh71ihSoUxKJr7EEG9TnDLCRv4fLYY02+0qKLfQtYE0IlNQS5b392lCJJNX4Yt
         ilkDKRPIqzzfNM5iiCatUjcfbITStexza6V2rCmxt5qHxXsC25ANCDRscCKE4U+eFW9K
         58prXsgWulQFgtkBYJV7IQXJ8ImtUpgUHyYDVvFTzBGX6IPZat6h52ufAdAvt6HtBJc+
         AquPSIsCtEoIBP4tuI4NLS0yOrDyJ5DHvKLiViedi76e4IAzd+qUEW1HT1qb+6i1u41A
         3Rbg==
X-Gm-Message-State: APjAAAWsn/bf2YhUQGeSvVniwLsw0f3OfHJYysmddUOGD8iOZ3k2MIoz
        rv+U54Qy+RDipz3XHGqVTydwxPwdmKJTK9h1MpU=
X-Google-Smtp-Source: APXvYqxOQH9D4O6rT5/4AwkzjYaMBMsBvldxbebHdn+1A5wG29hGjpZrI4SSf/9yyHU7MZu1lhmr8jvFu4SdbGYUUvg=
X-Received: by 2002:a37:4f4e:: with SMTP id d75mr4052894qkb.137.1569516433657;
 Thu, 26 Sep 2019 09:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <8292781f95b84d97a5e40684a4202175@pantheon.tech>
In-Reply-To: <8292781f95b84d97a5e40684a4202175@pantheon.tech>
From:   William Tu <u9012063@gmail.com>
Date:   Thu, 26 Sep 2019 09:46:36 -0700
Message-ID: <CALDO+SbOaGzFJ9oEH10N6Q=nvvNpkF_RykgRZwrC55GmOpxj3g@mail.gmail.com>
Subject: Re: bug? or how to properly clean up AF_XDP socket
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Thomas F Herbert <therbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Sep 26, 2019 at 12:05 AM J=C3=BAlius Milan
<Julius.Milan@pantheon.tech> wrote:
>
> Hi folks
>
> I am stuck with proper cleanup of AF_XDP socket. Not sure if I am doing s=
omething wrong or is it a bug.
> I create xdp socket, then I remove it and then I am trying to create it a=
gain in the same process but getting -EBUSY from bind syscall
> of xsk_socket__create.
>
> My cleanup looks like this:
> xsk_socket__delete();
> xsk_umem__delete();
> bpf_set_link_xdp_fd(ifindex, -1, opt_xdp_flags);

Hi Julius,

I think that's all you need.

>
> Attaching simple test case. It=E2=80=99s just reduced and slightly modifi=
ed xdpsock_user.c form kernel samples.
> Tested on kernel v5.3 4d856f72c10ecb060868ed10ff1b1453943fc6c8 and relate=
d libbpf.

I comment in another email, let me know if you do not see it.

William
>
> Thanks a lot
> Julius
>
