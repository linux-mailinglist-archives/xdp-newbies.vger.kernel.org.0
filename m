Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC6BC4ECE6
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Jun 2019 18:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfFUQRz (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Jun 2019 12:17:55 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36533 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfFUQRz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Jun 2019 12:17:55 -0400
Received: by mail-io1-f67.google.com with SMTP id h6so172564ioh.3
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Jun 2019 09:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Sw0tar4GKNYE+fKeYGxgNKh8+9qTX2z35GEBt1SVpc0=;
        b=EkOlu8qlRhzBLmqK/JdjBqIW5qryF2RdLS3wOFZsu3n9PHhrG1wi6n0hFXLG1MFQ5/
         KTBVBI7etM1aU/ONn6Qx3W6uNfI4Yqqc6fdLe5cj+t0vt2i/1/wqMnkttynIQB8/u5cO
         IAm1ffnYDxs7vAskpJvZyQo38g5G44Rx2R77/kU2bM/oNK5GsXdJG5uhioKfysrK8Lm8
         2OktVp8osiuoXqbOEL9B58NPIk3A4R/seH4kyi0MzEh7I3xwtNwX/a0GWSgv23582DWp
         dHjg6Aw7vupuRHaqil5vjLFXql1/9Tc+p0qGWipiN27RVTQV9X4JNJKSd+NJpC5BQfeW
         PZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sw0tar4GKNYE+fKeYGxgNKh8+9qTX2z35GEBt1SVpc0=;
        b=Sbx7uADJ3V50iga11AvRg6XG/BoltRWrQmD3k4/95C5HRSWAn/DKBNdOyV3sVO3yY/
         O5mnXEXBUIigV2qrUh24DdD4lN1UiwmoOq/vl2x+BzwldoAbpjyPWP4WKOvElFBaC/vC
         59SD/6DXOsUmr8vOmuZOMxWVT1pb07pXX8he5JJ6TPRFY1XePykOUjIfWeXMwH/z88vB
         XZSkFqOMHrbJGS3T5VlxUUxrGTinGko+DmW+Q59qywV+TI1vuUlt60IX038nelzd44DK
         K/brOUY6n/baD8p3UUT6oy5w7qBDrCWVh4XmGbmY7OcVi/gWNYnCNVZi9OKwkR48bNeJ
         xe+w==
X-Gm-Message-State: APjAAAVWaBRwM0KyWyScnCszLZhSwzlaxURL7lD2R8o/Gg42zGvh/dhY
        OJvBGoPBtbGuaVNKoFur3fNKQA==
X-Google-Smtp-Source: APXvYqwrP5rrf+639Ym7wMFWZQdU1WfoVNcgUP+bsXyCprN6Jo1hWnpDosiQ8jA1YW4OBOu8ZR8yFw==
X-Received: by 2002:a02:22c6:: with SMTP id o189mr3228179jao.35.1561133874834;
        Fri, 21 Jun 2019 09:17:54 -0700 (PDT)
Received: from localhost (c-73-24-4-37.hsd1.mn.comcast.net. [73.24.4.37])
        by smtp.gmail.com with ESMTPSA id f20sm3921317ioh.17.2019.06.21.09.17.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 09:17:53 -0700 (PDT)
Date:   Fri, 21 Jun 2019 11:17:52 -0500
From:   Dan Rue <dan.rue@linaro.org>
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        xdp-newbies@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>, Martin Lau <kafai@fb.com>,
        Yonghong Song <yhs@fb.com>,
        john fastabend <john.fastabend@gmail.com>, hawk@kernel.org,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Shuah Khan <shuah@kernel.org>
Subject: Re: selftests: bpf: test_libbpf.sh failed at file test_l4lb.o
Message-ID: <20190621161752.d7d7n4m5q67uivys@xps.therub.org>
References: <CA+G9fYsMcdHmKY66CNhsrizO-gErkOQCkTcBSyOHLpOs+8g5=g@mail.gmail.com>
 <CAEf4BzbTD8G_zKkj-S3MOeG5Hq3_2zz3bGoXhQtpt0beG8nWJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzbTD8G_zKkj-S3MOeG5Hq3_2zz3bGoXhQtpt0beG8nWJA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jun 20, 2019 at 10:17:04PM -0700, Andrii Nakryiko wrote:
> On Thu, Jun 20, 2019 at 1:08 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > selftests: bpf test_libbpf.sh failed running Linux -next kernel
> > 20190618 and 20190619.
> >
> > Here is the log from x86_64,
> > # selftests bpf test_libbpf.sh
> > bpf: test_libbpf.sh_ #
> > # [0] libbpf BTF is required, but is missing or corrupted.
> 
> You need at least clang-9.0.0 (not yet released) to run some of these
> tests successfully, as they rely on Clang's support for
> BTF_KIND_VAR/BTF_KIND_DATASEC.

Can there be a runtime check for BTF that emits a skip instead of a fail
in such a case?

Thanks,
Dan

> 
> > libbpf: BTF_is #
> > # test_libbpf failed at file test_l4lb.o
> > failed: at_file #
> > # selftests test_libbpf [FAILED]
> > test_libbpf: [FAILED]_ #
> > [FAIL] 29 selftests bpf test_libbpf.sh
> > selftests: bpf_test_libbpf.sh [FAIL]
> >
> > Full test log,
> > https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190619/testrun/781777/log
> >
> > Test results comparison,
> > https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_libbpf.sh
> >
> > Good linux -next tag: next-20190617
> > Bad linux -next tag: next-20190618
> > git branch     master
> > git commit    1c6b40509daf5190b1fd2c758649f7df1da4827b
> > git repo
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >
> > Best regards
> > Naresh Kamboju

-- 
Linaro - Kernel Validation
