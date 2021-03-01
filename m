Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9728E327D31
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Mar 2021 12:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbhCAL2k (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 1 Mar 2021 06:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbhCAL2h (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 1 Mar 2021 06:28:37 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F0DC061756
        for <xdp-newbies@vger.kernel.org>; Mon,  1 Mar 2021 03:27:56 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b1so14112194lfb.7
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Mar 2021 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iith.ac.in; s=google;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=HBMmdBS7oynkYH/dRJ+tbTk5LOlSMugJCLoh6dIXC1Y=;
        b=ljKMd253JcJn9j0YgZThZQ4SYUNXPOYXXsZB/OI5vbbwn8FI4c9RV1OxYwgG5bHDEK
         pYDNgw4k/RnTCa/hwSD1qlmvHnhJ/pSSRM0e30f1Z8SulmMa/i9aYUKnQSa/9WYVGbRN
         lI7cDRvpi0SiQWS6ArFDjdYMVem26SR/nXMeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=HBMmdBS7oynkYH/dRJ+tbTk5LOlSMugJCLoh6dIXC1Y=;
        b=rnzXTnFZgpc4C1pPz+T85P8+USlSifnwRxnOTM3mG1LwkXY/mr3GnQZVDpjQWjQe0o
         kvkIFi0qA0QMuizv2JfwitwbYVvsYKneMrKwqvdKLuLdhooQd/QXeiEchgHSKklOnt/F
         CD7/84z08jlSvnonZfKLzWFCXnLanyYqz6tvb36wdcgOWHf3NfBbgUb1OIC5UxC2F1Bq
         BnotxuLhCeXAvpzG7kIhMvp5OXq9VqcvgJpzayzSB2OaaQ7HvBq/hcsUUFi6Q+WL/NNL
         68yeCoclcrcUQ1nKkkrOZM3KJGuxN382+x+uaSXRTA5dhFfFTLNCaxWcT6iaEmk7sjZk
         wCig==
X-Gm-Message-State: AOAM533kUThSzqvOYGkQ9k304ntxbAmTBAjABFldMSvqno/nsR6AVtyw
        T5r6fVwuFtMRQtsF6IdvUx3qAUYnFaAddDx29zMzOClqJlra9YMt93l8vypCiNCK/DXvLsPbC9a
        0mYP4J8AnKrpGepPTP3BhhBgZi1gwJyO0U2SbDIK02f0=
X-Google-Smtp-Source: ABdhPJzmuK5agTpj/yzaOqkAxzb605GRYf9lTO14VFr3vu5GLpzkfK3B/xQraW0QscaTwjtIv/OODgEgGLblvuUchDc=
X-Received: by 2002:a05:6512:3290:: with SMTP id p16mr4339407lfe.150.1614598075216;
 Mon, 01 Mar 2021 03:27:55 -0800 (PST)
MIME-Version: 1.0
From:   Shwetha Vittal <cs19resch01001@iith.ac.in>
Date:   Mon, 1 Mar 2021 16:57:44 +0530
Message-ID: <CADutbzUJrgLQvhyd7EGd2EQSJv13rQkCHFpfMJwJkAtYhGLtdw@mail.gmail.com>
Subject: Query on eBPF Map iterator in Kernel space
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

Is there any way to iterate through eBPF Map elements in kernel space.
I know that there is one at user space bpf_map_get_next_key(). But it
doesn't work when tried in kernel space. I have a requirement to find
the record in the eBPF map which has the least value in kernel space
and pick it for further packet processing and therefore need to
iterate through eBF Map .

Kindly help

Thanks
Shwetha

--=20


Disclaimer:- This=C2=A0footer text is to convey that this email is sent by =
one=20
of the=C2=A0users of IITH. So, do not mark it as SPAM.
