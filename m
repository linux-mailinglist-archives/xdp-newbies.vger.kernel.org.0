Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8BF273092
	for <lists+xdp-newbies@lfdr.de>; Mon, 21 Sep 2020 19:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgIURGD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Sep 2020 13:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbgIUQdG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Sep 2020 12:33:06 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC896C061755
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 09:33:05 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r7so18588799ejs.11
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ezJfqrrQJDCKiGlPoRhhMP0p58Cd6OP/aqD1LWi72JM=;
        b=RZE9vRuUROBaVzJ9MAwh6jVAzB/X31bzAZahRwwK7l8WdpMWxSS2tstZA557nEx/bx
         rDg/7RnY6cFvNCrLARrGBcS5Y0cWWa7BDfHRvtRxtu4oCm7Gu7vZouaRhrwC+TFEMMV1
         RjPMiUS45tPp0zmmzgjXZe37WD/xGM05G/oj+Q4nj+Ei8B27Zsg5hzWQ/PhKw0QPFtRL
         6wwHZOEHn6ed4qTca/RpckFuq8AU4wiNMzKQQQZ46TKLbX8x5GClj8+OImIFfZZjiE3C
         H/C1gjawcFV4ftp7TbsY3/DMyBe/Rhnc//OIx7drEUfzWdkPRkmVfUu7XlOHSuiTvmV0
         VcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ezJfqrrQJDCKiGlPoRhhMP0p58Cd6OP/aqD1LWi72JM=;
        b=k/qrVWElI4YGA3mcJ7wi3JqXSMdXIyBmTglUrAB6RWvHOFAs+RzZ+X++qRZsLNXsEy
         2Il3Ypa1t/+VRHp+IUx1W871AN75MHoebNShkkCkIzfRRN3iCK+uuHSzP6uLP0/BB38H
         Uo4C16c7hKXI0Jw/wsvw8ub/yQyaevV73sJZSd9mpoHguUuk2iycJ8D6eROv4soL9ScV
         +PpWeI8zC1D8/7H0VYEwPIVy1ze/t6yZptcw9AXLcw+BlkyBA3pN/LhFEqGnA6m2RAE7
         jL1fBRRQCr8JFrnLW0qjAnSLXwDdzkQFkOIcRrHpm7rt4lvqhGBYti6t3gBGiORxbo2R
         vInQ==
X-Gm-Message-State: AOAM5334e3NUJajmwwLLXcjI3iASh2FfyjMZfxWzDNqtA1BQ/rmdfm8X
        k+iRpVkCi6nQ8c3INp5WP25+h6Z1cHG/IwFOPKw=
X-Google-Smtp-Source: ABdhPJx9ey65YL9WXMi4dmmhSkTYV61BXCHWGxhTbfnp4kgQzlGeI8O/RT6b+Rba/j5X5AolAbTD6f5/pnoHd1Ho310=
X-Received: by 2002:a17:906:6005:: with SMTP id o5mr221167ejj.465.1600705984373;
 Mon, 21 Sep 2020 09:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAL8+sW1=kjnPJ1UEDZsxbe1QfSwL5YszNYipT7kBgYOBOAC6Q@mail.gmail.com>
 <87wo0np3df.fsf@toke.dk>
In-Reply-To: <87wo0np3df.fsf@toke.dk>
From:   Tugce Ozturk <tugceozturk.5@gmail.com>
Date:   Mon, 21 Sep 2020 19:32:52 +0300
Message-ID: <CAAL8+sUULjNeuitkoR-DcMLxTChW0_GNS5y1=c7O=+hPvjoygQ@mail.gmail.com>
Subject: Re: XDP program unloads by itself
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Toke,
I had microk8s daemon running and I disabled it. Now xdp seems to work fine=
.
Thanks a lot!
T.

Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>, 21 Eyl 2020 Pzt, 18:16
tarihinde =C5=9Funu yazd=C4=B1:
>
> Tugce Ozturk <tugceozturk.5@gmail.com> writes:
>
> > Hello,
> >
> > I am trying to run the XDP router program from xdp-tutorials. I
> > successfully load the program with xdp_loader provided, and I can
> > verify that the program is loaded with ip command. However, after a
> > few seconds (this duration is random) the xdp program unloads by
> > itself without any error. It just disappears.
> >
> > I tried with different XDP programs, different XDP modes and different
> > interfaces as well. But the same issue persists. So, could you suggest
> > me a way to troubleshoot this issue? for e.g. where can I find some
> > related logs or how can I monitor the behaviour of an XDP program?
> > Have you ever come across such a problem?
> >
> > My kernel is 5.4.0-47-generic. NIC driver i40e (tried with ixgbe too).
>
> Sounds like you have a daemon reconfiguring the interface in the
> background? Do you have NetworkManager, systemd-networkd or similar
> running?
>
> -Toke
>


--=20
Tugce Ozturk
Aalto University | M.Sc. Communications Eng. | Student
Espoo, Finland
+358-40-680-5393
