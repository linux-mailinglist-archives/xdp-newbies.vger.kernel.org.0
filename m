Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBAB3E0442
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Aug 2021 17:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239114AbhHDPdx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 4 Aug 2021 11:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239104AbhHDPdx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 4 Aug 2021 11:33:53 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC634C0613D5
        for <xdp-newbies@vger.kernel.org>; Wed,  4 Aug 2021 08:33:40 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id 188so1166995ioa.8
        for <xdp-newbies@vger.kernel.org>; Wed, 04 Aug 2021 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ihbYgH0vviXnn+RtARabQtFRmpcDemvTSxU3gDZMLZk=;
        b=H5467crS3dwxii4dn0x/Uqxv66O8yu7iTtvCjyyNbaXDqMnfuRBNktWgVtbTI5KVmW
         R0+mAhZctPKm2IAR80phkM3r72F3cztD3pekai5NIF7RA1IaQ8zWqE/tEbp0+ATiU4xT
         ORBSdfEOr9Lpu2O6aKJ/osMw0czU0w1nQq6REC9UXh0q9oU9hIpEpV9nhZwP3jbpO7u2
         nI24d3BcjKcPmTmgB+2lhUiR+ZsfFECUhGaqJsN+vZmZXUtLXON7mH8SYtaGYwibvOC3
         cW6LFMFra/4r8LfgSmRUxM7Zr9C2tgIyVzXA4/CTPPfiBIvjRYSsqVKH5l2Bs/ajy7Gj
         ENwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ihbYgH0vviXnn+RtARabQtFRmpcDemvTSxU3gDZMLZk=;
        b=qHqqN+JvrDju+RX2Ew3FZkRDyUeV0SjOXzwt1hJojd9ckyayBoSI5Yy2O/Mc9qxB5d
         OC9eWWG5V6mvRQXeugBBLjJADWmkYpoqiQCANhg5jvgSjMTKW4gYNUkzEeNJstjrb1tO
         kHuVhWL9P4TjsOJdC1D8scpsiDqbKDbqYXpl95wTNd5bJATkgXYL4DjH8Nnnjqv1hBZa
         TtzKFRyJUZPvs/39/81MWWK5oDlSKqDndq2kwerSk9Onood8MzS8+GwlGgmGQqEFgiul
         cfCVIZKRH0IrMhWb/TnSwcrtEse6HSZ7jP5MjizixJnhyR/G4o2X1bSHncBoKGFOKiXN
         xG2g==
X-Gm-Message-State: AOAM532NCb7uDE3P5sOJIskoz3qhqqtMQYOVOOCPS61oq6cdA4ZtnB4w
        /L9CUuW3AZYanRi0UTHw4qS7VaUTnkdqZ08Rc6g=
X-Google-Smtp-Source: ABdhPJwyfRT0JvH2GRyfJOmptgPCr0rbqc9RvkJOnA6JmmQqF8AtJWzXpyoxWYoYgZr0p6MOJeb9bMdk0ApDIc5v8nc=
X-Received: by 2002:a05:6638:14d:: with SMTP id y13mr86748jao.78.1628091219766;
 Wed, 04 Aug 2021 08:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR11MB41739E5557BB1CCA85CC703EA6F19@MN2PR11MB4173.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB41739E5557BB1CCA85CC703EA6F19@MN2PR11MB4173.namprd11.prod.outlook.com>
From:   Pedro Tammela <pctammela@gmail.com>
Date:   Wed, 4 Aug 2021 12:33:28 -0300
Message-ID: <CAKY_9u3150wk7uywpfHThXe0Zn-8Edp0T_VVC-tD7uO_RLGY2g@mail.gmail.com>
Subject: Re: Instructions to enable spin locks?
To:     "Fingerhut, John Andy" <john.andy.fingerhut@intel.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

>
> Greetings:
>
> I believe the way that this project is using EBPF hash maps in an EBPF pr=
ogram that processes received packets on the XDP receive hook, we need to a=
cquire spin locks while updating map entries, or else we are subject to mul=
tiple packets being processed in parallel on multiple CPU cores, and causin=
g incorrect updates to the map values.
>
> https://github.com/intel/host-int
>
> In particular, we should use spin locks at least for this map in the prog=
ram intmd_xdp_ksink.c: https://github.com/intel/host-int/blob/main/src/xdp/=
intmd_xdp_ksink.c#L27-L31
If I may, I would suggest using percpu hash maps and aggregating the
stats from the same flow_key in your userspace daemon.
That way you can avoid spinlocks completely as it models one key to n
values, where n is the number of CPUs.
You can even leverage batching if your map has a considerable amount
of keys[1], which in my experience can handle large maps without
noticeable overhead.

Pedro

[1] https://elixir.bootlin.com/linux/latest/source/tools/testing/selftests/=
bpf/map_tests/htab_map_batch_ops.c
