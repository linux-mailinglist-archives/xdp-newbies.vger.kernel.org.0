Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69F04C8FA
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 Jun 2019 10:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfFTIIF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 20 Jun 2019 04:08:05 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:39810 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfFTIIF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 20 Jun 2019 04:08:05 -0400
Received: by mail-lf1-f54.google.com with SMTP id p24so1739951lfo.6
        for <xdp-newbies@vger.kernel.org>; Thu, 20 Jun 2019 01:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5nLDF4KvNjOO0UGhzTbw+kgDFdu3GO4N4s2vFIPF9iU=;
        b=OmXGcAXDCg5tpnkC3zM065z42PKi+z/FVjoDHqkRFwQQ351XflSo05WQbSV3o17OA1
         ZCsdnjvvy8dS/tX2Yrk0+vtSVbKzdotrcrp1d3vJpozy0Jdb5LybpVHsiW48i/dDVI4m
         ck78rIIOF3bMUbZaiZAMkWKmJcJn6Z/ZVjyWEsqoSws8e7XxsYNIIMXEHmshvOdBKAcx
         J/hpS3vishBxStBuT5Vd6dFmaBnP06wN4IJ6LTtHWz3vxRs0dzNXAKspTbq1O91EelUW
         7USUCZOQGv2Sw7kPzWpfZs5oEBsiyWFpcnyvM6d2Eb0IbXkpG8FtvbT1xWFcC5FeFvd/
         egbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=5nLDF4KvNjOO0UGhzTbw+kgDFdu3GO4N4s2vFIPF9iU=;
        b=SkYKZAE6d7/9cm4jcENPp30eqtTUxFoWlG4jRCF0SlkHEIL8+nmfuPtIanQbBYXedz
         iGKUgP9r0AcQyTrY/J2+Q3cTf8nH8Dl/Xxf7NglakJ8ZBQjfxRzTJjHrxMExnf/hFdar
         Vymt80lzJOXoNs178f6pfRNYmGBICent0x6yejTvZ9rSZRtSH1+O2qz19UZkOAShmfty
         hqprLmjD+JSlP9Rgo1lJcfjhh4lX78mT3nAHGEs7CSvHgok3hMuKBMQghD84AjslWU0J
         RIEQNKwJtYdW1JXPTNdyvvDqjkMVLCVlou8ZyT3f5Uj3xUNyYm0SusSGXti26EPhJK5H
         SN6A==
X-Gm-Message-State: APjAAAWPnAC5VewfTSXgzGZusGq9+RB9tAw2diY46Z2fHO3EoC8GeeHa
        RMylafJu0u9rBdZvXcBhvUVGLjD0nGYu4tD3Tqtuqw==
X-Google-Smtp-Source: APXvYqyU7SYZ3r1zFZE21AN1DFeMgGQwh6SguX3BRtEUzUX/aM0TrfFkxtA08Wzok29Qq+v25QAmavsjX/AI8Qz4iuA=
X-Received: by 2002:a19:671c:: with SMTP id b28mr12475324lfc.164.1561018083426;
 Thu, 20 Jun 2019 01:08:03 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 20 Jun 2019 13:37:52 +0530
Message-ID: <CA+G9fYsMcdHmKY66CNhsrizO-gErkOQCkTcBSyOHLpOs+8g5=g@mail.gmail.com>
Subject: selftests: bpf: test_libbpf.sh failed at file test_l4lb.o
To:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, bpf@vger.kernel.org,
        Netdev <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        xdp-newbies@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>, kafai@fb.com,
        Yonghong Song <yhs@fb.com>, john.fastabend@gmail.com,
        hawk@kernel.org, jakub.kicinski@netronome.com,
        Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

selftests: bpf test_libbpf.sh failed running Linux -next kernel
20190618 and 20190619.

Here is the log from x86_64,
# selftests bpf test_libbpf.sh
bpf: test_libbpf.sh_ #
# [0] libbpf BTF is required, but is missing or corrupted.
libbpf: BTF_is #
# test_libbpf failed at file test_l4lb.o
failed: at_file #
# selftests test_libbpf [FAILED]
test_libbpf: [FAILED]_ #
[FAIL] 29 selftests bpf test_libbpf.sh
selftests: bpf_test_libbpf.sh [FAIL]

Full test log,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190619/testrun/781777/log

Test results comparison,
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_libbpf.sh

Good linux -next tag: next-20190617
Bad linux -next tag: next-20190618
git branch     master
git commit    1c6b40509daf5190b1fd2c758649f7df1da4827b
git repo
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Best regards
Naresh Kamboju
