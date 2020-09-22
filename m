Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27522273872
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Sep 2020 04:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgIVC1h (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Sep 2020 22:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgIVC1h (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Sep 2020 22:27:37 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8FCC061755
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 19:27:37 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id z18so11071978pfg.0
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 19:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=s8zmU2hRdGCAuMF/4fdhOozD5JsKDRbq3KmjrdqwwUU=;
        b=V2X5x+JaTkgVUsazDbQ3luMnome6WxHFE3SPMUSvu2OecwnLnPtNgMhGv8/CKVnX3a
         d/1ANA+JEMoXH/1rGbbGP/0Gtm3G0GZLKSPuNdEZyTlbXRjH25JPFMVAQD8QFstnRW0u
         VtBy2B5K4dKrowrKHNkfowA0wH3XSutmCkLtnDmQ7/IpB6i0Hn9I4weAgh5tYt7DCrRF
         zEu3gTLmJJwDETRy2I8VXFRHokZplXazSniG6EPiBel7CYL93usqlqqt6/XjfrrpQHm+
         IwQVjbGRvo7rPkTd8yNn1aixpB/yJ4bu1tCYkA+tbTFBzdB/p8BiLOg1mxwpheZ4XjEw
         HMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s8zmU2hRdGCAuMF/4fdhOozD5JsKDRbq3KmjrdqwwUU=;
        b=sve6wuFDKIEpsI32t2Qt0j8VCXSP7TIF1/d1QoLvFBiCO9CW4NTt7wl+gSuAaIA0BI
         dmZGOA/tTvLmu1XdHaMxSXCYVIXBXRysHEEkVtP2Q/Fl22MENMX3JxkCrqYY+BnR4eAA
         PwpTI9p2FIvPnuTpNabUpaNAsOWDJPwMAwoKvFCdjAhhHwjG7sLzI8fAqW2Z9OZ25/qZ
         DRXDL9p/MuKwM3BSNVofWWujgWwWi2k48i1tJT2YexT3jMdXaFI/Wf4l3aYJjrPj7IIk
         7IVnNrEuBNPNED7fQpY4DtxdaPIWbD/5CMnV5KpM+BZmZecrKun0mNDQtceFuRl1pd0t
         eR1w==
X-Gm-Message-State: AOAM533Cq2ewX2tobznH29ziiOsm2ZMaiXKGwixxrU2RpR3TQ84O+adg
        aX0q9KDfOGiwosPq7sx5dKBsHNFjx9p+Y5xqFk4gbOcN
X-Google-Smtp-Source: ABdhPJymDaiPk2d2cRc8VrU+r3tn8scBU5wShRFsnvdjrY6ARLucelKbB8W2uJJ7h/LdYY5v3CfR1u2hy/MYmEsPI5o=
X-Received: by 2002:a17:902:ab87:b029:d2:1ceb:34 with SMTP id
 f7-20020a170902ab87b02900d21ceb0034mr2589920plr.12.1600741656222; Mon, 21 Sep
 2020 19:27:36 -0700 (PDT)
MIME-Version: 1.0
From:   Topi Wala <walatopi@gmail.com>
Date:   Mon, 21 Sep 2020 19:27:25 -0700
Message-ID: <CAOfgOftdYJF7yc8HQWCPvfLkuBcd3VRjgNK6vwV7ampuW+TKTw@mail.gmail.com>
Subject: NDv6 and xdp-filter
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I've installed an xdp-filter (dny_all) on my tap interface (and am
only letting through L2 packets that match my src/dst mac), and it
still lets through NDv6 traffic. Do L2 multicast packets not get
"received" by the xdp filter? Running tcpdump inside Qemu linux
connected to this tap interface shows me NDv6 multicast packets from
the ToR switch.

Thanks,
Hari
