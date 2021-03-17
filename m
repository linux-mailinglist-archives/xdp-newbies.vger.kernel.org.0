Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5341833F2B5
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Mar 2021 15:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhCQOeP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 17 Mar 2021 10:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbhCQOeF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 17 Mar 2021 10:34:05 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493CFC06174A
        for <xdp-newbies@vger.kernel.org>; Wed, 17 Mar 2021 07:34:04 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1467711pjv.1
        for <xdp-newbies@vger.kernel.org>; Wed, 17 Mar 2021 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=739CtvzEF236/+rHcufmL0VXmZ8mT/LLIl/Q6Wyst64=;
        b=ek9KK/2pzm0y3mFNuoL76g/LfqdjgD1+Aw9xDobDnsTHS0dFE+IjYJtD8wCLRLJ2qj
         j0JsGK70Tsr7hCSZkVlfRQ53M46TqzoX+fNCp59zNk86dNbyOOjXOEN3cLXspykZsL6R
         YOUn5ZkMNKGEz9ZtLiw7D94KaevR8IMI4heN/7Jucqoi6ynSD0WF59X6HfYzw7bTQ1u2
         GZvLE/p7n/NstLKLj9RxT4o9JMSGsd54uW95iKvuLGZHGDvLu9BFBjc9l3sN0R8z5C2z
         4L04aJp/xBIFkRmEpl7XhyrL3nkRSQ5y0o4YBCfoVedo8GuE/Qe/Id7u1+xK34Ct9TrT
         VjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=739CtvzEF236/+rHcufmL0VXmZ8mT/LLIl/Q6Wyst64=;
        b=KU8J6k8dWuRWMTVB2AK8carE+A++wltvkbgxoaMt0Qu9GBVbEITc0TSFSBH2eHZd8t
         FEygIoKDa+yZW5W+V9w12QJwatl6lWK2K5J6pZ+i3jtuGkxdeQjBBfHDhRXrL9dxoTQS
         PjwxG0GDnyDTQsalsyqZCR3z0uKmUmmVVEPX4z7HoZcKAuzEC20qiYhcPonR2YZtEPdZ
         ioO04n/tWWBDC7Ej369AknK/Btzmzx1CnVT64qcwKWXmQ0azcGfvKkqMANSX5HEDFnio
         AONmZs1hLx6RvAlW0dyFDkTt8uLJryjPwF+l5OnHi+l4RyYZdbeU+OpyvxZs+RFUCoQL
         lKFw==
X-Gm-Message-State: AOAM533Cw4wfOM2vsggVA2o+P8WWbyE8rpp8hWTzmdRxZXgW49zQWSVa
        vni5RGTR8vn707AAHyZN8Z+wvTSgEe6H6b9bPKc=
X-Google-Smtp-Source: ABdhPJy5SHff1ZesKRS5vqGpsR4tx68HD2i+/daz3QtAumdekBjjvGDaQ4h0623JVh7k2qx3pPpwJSEAPFLRTBxARbI=
X-Received: by 2002:a17:90a:17c3:: with SMTP id q61mr4890043pja.58.1615991643476;
 Wed, 17 Mar 2021 07:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFQY-shyWTWk0+uf95G-5m-9FmMzQ2kcCdjFx+heWq3ko1KhmA@mail.gmail.com>
 <874khcppet.fsf@toke.dk>
In-Reply-To: <874khcppet.fsf@toke.dk>
From:   Rohit M P <rohitmp99@gmail.com>
Date:   Wed, 17 Mar 2021 20:03:52 +0530
Message-ID: <CAFQY-sgriAjkyDwrjTfjt+p7PoLTiVQMTYCz1ZYLM2kytpz4BQ@mail.gmail.com>
Subject: Re: Queuing disciplines with XDP_REDIRECT
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thank you for the response. Helps a lot!

On Mon, Mar 15, 2021 at 6:03 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Rohit M P <rohitmp99@gmail.com> writes:
>
> > Hi folks,
> >
> > I was experimenting with XDP where I'm able to route the packets using
> > XDP_REDIRECT.
> > Could anyone point me towards using kernel queuing disciplines along
> > with this if it's possible, or other possible alternatives for queuing
> > disciplines while using XDP_REDIRECT?
>
> This is not currently possible. It's on our radar, though:
> https://xdp-project.net/#Queueing-and-QoS - and we have a PhD student
> who has started looking into this.
>
> It may be a while before anything concrete materialises, though; in the
> meantime you'll have to rely on TC if you want proper queueing with
> BPF...
>
> -Toke
>
