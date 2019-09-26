Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D0FBF6E2
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Sep 2019 18:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbfIZQnv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 26 Sep 2019 12:43:51 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44950 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbfIZQnv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Sep 2019 12:43:51 -0400
Received: by mail-qk1-f193.google.com with SMTP id u22so2321785qkk.11
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Sep 2019 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1DdLaCr0/x/iFrsdna8+zS0pN3MhDcv2xJWkeDl5jUc=;
        b=L8h6zSVlMBXWlXwl254KqaiCpMQC7GqwkCkBBzUVwKN48sL2Y+bGQKfFYcL2qMEycp
         1ka8yjg3Y0EJkrpSRDLGGDW5njmNcp3fa4VcSZUTwTPFNN8gI8rIpVLIMTy9Rrw1wt4N
         pRA4XA6FFytv2c80RQrJQ2y877ADv9InIUS8T/k62eKbR4wemGIYsPhJ9ChmvQFIwW1C
         QbPewY1FO0H543w+6XgMPE323pod62ALDcVdwdWGpIsbM3EeYAFwPbs8BatZxidcrts/
         Z+oEfB4qHbeaQ90zSW2OjcN2HJZhuLZmmlVHej/Ta4kl6zchC/dXJJqtrihy3QvgHMvP
         Ia1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1DdLaCr0/x/iFrsdna8+zS0pN3MhDcv2xJWkeDl5jUc=;
        b=CmPXc3EN+DJkNQOLYxqI+HERF2+iB8g1bCvv1S5IDz56pn6OPR43VwWtnF+lSNdNNd
         NH53bAN63f0cSqGXwDdaa9qsyjb3+HV1G1TcbyUl98CMvEUgoStEGYpdOpSsS+4BM33n
         +0Uw8pqBfJL4YPcpcaZJSrCPZN5sG/LkNvsN04nbFxar7iB1MSbF+zq0/vnPWXmNvuwS
         V6zdnTUaXSse/+wjGAmrRuBzvt0v5/iO29ISzqjdxuwSOYgQAr/sVoDiy0eh1Elt6h4i
         BHi64/aozVIoRc2JY+b0VcMTKKqxKBpPfCHxu6Xs0UZBLTQNogdyhT95k0b+SqpVj7ty
         gp5Q==
X-Gm-Message-State: APjAAAXrws65FeOeNXgF1qzbjtlpxqlL/gTQAWOR3a79HOgeKlw1+qT4
        3DDAMZHUyEFaw7cVSrE4+gyvCe//YKyE+ieXuyE=
X-Google-Smtp-Source: APXvYqwwrgkwGjNGuD1d6rdRTmHxFPhDueDEYgr9QVs+WxcfePrICGFEtcEVEmqU+Yy4xqEg7EJNwJ2G5HvLwpgthIc=
X-Received: by 2002:a37:c14:: with SMTP id 20mr4188577qkm.291.1569516229912;
 Thu, 26 Sep 2019 09:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <7de437b13561433fa766aca690995c45@pantheon.tech>
In-Reply-To: <7de437b13561433fa766aca690995c45@pantheon.tech>
From:   William Tu <u9012063@gmail.com>
Date:   Thu, 26 Sep 2019 09:43:12 -0700
Message-ID: <CALDO+SZWdVNCBimVdBivJMYDw+9jCycU3jcVBL+zBJwpMvb8=Q@mail.gmail.com>
Subject: Re: bug in AF_XDP socket cleanup?
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Sep 25, 2019 at 8:47 AM J=C3=BAlius Milan <Julius.Milan@pantheon.te=
ch> wrote:
>
> Hi folks
>
>
>
> I am stuck with proper cleanup of AF_XDP socket. Not sure if I am doing s=
omething wrong or is it a bug.
>
> I create xdp socket, then I remove it and then I am trying to create it a=
gain and got EBUSY from bind syscall
>
> of xsk_socket__create.
>
>
>
> My cleanup looks like this:
>
> xsk_socket__delete();
>
> xsk_umem__delete();
>
> bpf_set_link_xdp_fd(ifindex, -1, opt_xdp_flags);
>
>
>
> Attaching simple test case. It=E2=80=99s just reduced and modified xdpsoc=
k_user.c form kernel samples.
>
> Tested on kernel v5.3 4d856f72c10ecb060868ed10ff1b1453943fc6c8 and relate=
d libbpf.

There are a couple of fixes related to cleanup.
Can you make sure your kernel has these patches

commit 0402acd683c678874df6bdbc23530ca07ea19353
Author: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
Date:   Thu Aug 15 11:30:13 2019 +0200

    xsk: remove AF_XDP socket from map when the socket is released

And libbpf has
commit 5750902a6e9bc6adb77da8257c0e34db2bfdebb2
Author: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
Date:   Tue Apr 30 14:45:36 2019 +0200

    libbpf: proper XSKMAP cleanup

commit 0e6741f092979535d159d5a851f12c88bfb7cb9a
Author: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
Date:   Tue Apr 30 14:45:35 2019 +0200

    libbpf: fix invalid munmap call


Thanks
William
