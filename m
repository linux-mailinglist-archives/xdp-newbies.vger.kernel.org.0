Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F3D123A54
	for <lists+xdp-newbies@lfdr.de>; Tue, 17 Dec 2019 23:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfLQWz7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 17 Dec 2019 17:55:59 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36920 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfLQWz7 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 17 Dec 2019 17:55:59 -0500
Received: by mail-qk1-f194.google.com with SMTP id 21so7052771qky.4
        for <xdp-newbies@vger.kernel.org>; Tue, 17 Dec 2019 14:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bjN4whhbp6nTQ6P5lPNpFXr1gERtyMPTC9LPUU3jZ1Y=;
        b=gw5O4u4xOVFB55z7hcXlfmobl0/QalY5AD8BCjt1lFSuOg/9plcj+sEJzX/EEvRw4X
         1KkywbOYXPyb9Rp3oUXi4IPFgjst8wK1bugFKzslMKRUS1pxtLN18jbJeOkqF7fmjHOO
         /OU1x8EepF0hbn8BxJ/pm29ILIxcvOKZOAl5D4ndfzk38MogXEpl7H8J7Dh61m8cMgAz
         if5N8lRfpm+DRB/XpqpECmLiDUZ5rfXb4W8JMFFeD9XRxGfdGsvJnVCBAjJh3raMucOm
         92j8hGIOuUsvqmVJfFQZhZ3LAoN9J5aam/sCcfSiUL7cJhfQnZJO/pwLZrVzjsr6ovcK
         rIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bjN4whhbp6nTQ6P5lPNpFXr1gERtyMPTC9LPUU3jZ1Y=;
        b=gcAid6r0pBwZckOibRR9KU19ecyvsRdm/wAPTKbeqrs/0DSnQWU4SSXoKzmwQOB7X+
         9h3M3fpJ+qJhRGFbc39QwqlM5lHmlJ9GZ1d0eS0yOaCJHbN93GuDcGsIbeNRkzutNb0z
         i4/+trjGpLaBXmlNRV5qWQZ4ycwoLszMjEIrG98IsyGCHfocyS6+fIJpVDYlOs/sdFQw
         Debg7M8/P8nzvb1o2U5kS6fWMY/5u45i0Y5f+deFjsb4vk3Y091vJy5g1OQIVM4LasYf
         Q7k44AIFUQJckmrDfmJXHf09eibrskfuYzWJqFwp//UYkaFZpu4J1WN84SKw+AnyaPCi
         Y62A==
X-Gm-Message-State: APjAAAXivWw0PIV5XRLzRF4Z4uzrAn2FV1PW2TxUB7MbPCTny1hE6++g
        UEoTyI2bG+qvsenQG0jCi1y1UZ1uFy9JbQW893mJHQ==
X-Google-Smtp-Source: APXvYqwplksrCxTqVX6QQE6JVJICpHpM2rpQ0aa7D4JJL/fSekhTGPRsyaPW6H5ljIddasDRMVPPAserX46jQ/Ip3PQ=
X-Received: by 2002:a37:b602:: with SMTP id g2mr492555qkf.174.1576623358526;
 Tue, 17 Dec 2019 14:55:58 -0800 (PST)
MIME-Version: 1.0
References: <b36728e9-4cb8-4127-2127-2cbdcd9a0068@nic.cz>
In-Reply-To: <b36728e9-4cb8-4127-2127-2cbdcd9a0068@nic.cz>
From:   William Tu <u9012063@gmail.com>
Date:   Tue, 17 Dec 2019 14:55:22 -0800
Message-ID: <CALDO+Sb00zQKuGKP43q-WEVXntMhmL+y8RN-_NTB879HxYbfTA@mail.gmail.com>
Subject: Re: AF_XDP headroom
To:     =?UTF-8?B?VmxhZGltw61yIMSMdW7DoXQ=?= <vladimir.cunat@nic.cz>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Dec 17, 2019 at 7:05 AM Vladim=C3=ADr =C4=8Cun=C3=A1t <vladimir.cun=
at@nic.cz> wrote:
>
> Hello.
>
> I configured .frame_headroom =3D 0 (default) but I receive packets with
> larger one (256).  Am I doing something wrong?  Kernel [docs] says:
>
This is correct.
The 256 headroom is for XDP frame's headroom, reserved in driver.
So you shouldn't use it.
if you configure .frame_headroom =3D 256, then your frame will start
with 256 + 256.

> > There is also an option to set the headroom of each single buffer in
> the UMEM. If you set this to N bytes, it means that the packet will
> start N bytes into the buffer leaving the first N bytes for the
> application to use.

Yes
William

>
> which doesn't sound to leave an option for kernel-space to
> change/increase it, but apparently it does so for me.  In my case it
> wouldn't really be an issue, except it makes me unsure e.g. whether 2k
> frames are guaranteed to handle standard 1.5k payloads.
>
> [docs]
> https://www.kernel.org/doc/html/latest/networking/af_xdp.html?highlight=
=3Dheadroom
>
> Thanks
> --Vladimir
>
