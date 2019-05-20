Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952BC24230
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 May 2019 22:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfETUjE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 May 2019 16:39:04 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46377 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfETUjE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 May 2019 16:39:04 -0400
Received: by mail-qt1-f195.google.com with SMTP id z19so17835196qtz.13
        for <xdp-newbies@vger.kernel.org>; Mon, 20 May 2019 13:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=wPFeH7XPsIimjhzEp22O6Np8+nftZ/N1aLKEWF0ZxEg=;
        b=GIVK3fQZJfd3IjewlySeI5LCq+RSRd96F67W24vHp0NBQ/9vtvqZQT6yC+c3I42Cdl
         Hv7Bn02XqyTUZhdJp0xnV3qu6758vWZxmZXCkDo4VD9X9oC3cXrAqxO7J93Jd6jW8zHw
         xPXB91xhSgoxPdA1MT3Yg40PiYX6z2toSQkhYYcpApIizZ69Q9XQ9Ba7yKt/AHg9XTOh
         lrw5+HqK/fR0J8/ME9zFgkKk0qzvzCR7bMKbwTVEXIFlZEAjHMIk5C/F0d1mkKVNVSUH
         mq7wJ2iwjrkk6dW6IRTBZj8SXdTMkwoETaOPtbxuUxFA0sfCny9yYvJFe3dc6ZW2/y2V
         E5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=wPFeH7XPsIimjhzEp22O6Np8+nftZ/N1aLKEWF0ZxEg=;
        b=LRAc4Zh+BHzs4adxBgouFEXK0I9oDUGs7FDAk4XLft8f6AAZtaOqGgETuDd9VZ59YA
         wgCFNbTZk0ommHK3FzXNb8MYzOqrFDFkj3rPwMb3Fxzf35lgi8ZzzDBmNrTjWITNKtZv
         QJQYFY607nQ483Xjw0yWATCDYx6QJr8B4hTv1sCy28ynL/zN0XtUuRxyNskZZggi7NYJ
         BFYkOqbBibAOSUlhwJYBnZVMKAVe+I+d5op4Ay63gUh2ldaN/xqClBkUW/XcV1w+5ZH4
         AeVTqzRBwC/U0EV8lwXb9gAkcdDkEn6GQdzAA+mMnhjwetaVGTbu1GoRFAXEJR/lN105
         mWeQ==
X-Gm-Message-State: APjAAAXGxkIz2WFpea6MaU00VUdDa1ozsq8z2iSCUiv1lihNKQOgdckw
        0gZaIL0Mci8FQK0thYJOnUSe43Cd8VY=
X-Google-Smtp-Source: APXvYqyIYAMt4+0J67afSHPg+bDU0MZwDc+FTORmGsBmLZqEkZB4mPMqoUH9CCKiQEFatxakMDUKcA==
X-Received: by 2002:a0c:9934:: with SMTP id h49mr35490041qvd.146.1558384743029;
        Mon, 20 May 2019 13:39:03 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id 29sm9653091qty.87.2019.05.20.13.39.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 20 May 2019 13:39:02 -0700 (PDT)
Date:   Mon, 20 May 2019 13:38:30 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Matteo Croce <mcroce@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, bpf@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH 1/5] samples/bpf: fix test_lru_dist build
Message-ID: <20190520133830.1ac11fc8@cakuba.netronome.com>
In-Reply-To: <CAGnkfhxt=nq-JV+D5Rrquvn8BVOjHswEJmuVVZE78p9HvAg9qQ@mail.gmail.com>
References: <20190518004639.20648-1-mcroce@redhat.com>
        <CAGnkfhxt=nq-JV+D5Rrquvn8BVOjHswEJmuVVZE78p9HvAg9qQ@mail.gmail.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 20 May 2019 19:46:27 +0200, Matteo Croce wrote:
> On Sat, May 18, 2019 at 2:46 AM Matteo Croce <mcroce@redhat.com> wrote:
> >
> > Fix the following error by removing a duplicate struct definition:
> >  
> 
> Hi all,
> 
> I forget to send a cover letter for this series, but basically what I
> wanted to say is that while patches 1-3 are very straightforward,
> patches 4-5 are a bit rough and I accept suggstions to make a cleaner
> work.

samples depend on headers being locally installed:

make headers_install

Are you intending to change that?
