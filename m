Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B76EA8A573
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Aug 2019 20:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfHLSNX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 12 Aug 2019 14:13:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41909 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfHLSNX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 12 Aug 2019 14:13:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id d24so99139517ljg.8
        for <xdp-newbies@vger.kernel.org>; Mon, 12 Aug 2019 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khomp.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=kL7a0v5HFcPRR8mMqLWLjsDtajuo9cc1vCUlJrsnvPc=;
        b=pTMfRZ1vs4fhsj/JxOUo6tqUrYXemdOQtxh0aJ5/bq8Xts/udqV3R8NlqR06bLPeoU
         Xt878rEahAHHSkEULo5bMvYDa/bAK6i1LoQkpr1Mf0np18N8JTLDuId1W3ow+HjzxHfp
         BtgL9APRCiVy+PxMtgsMaTnXxZ36/ZjUWnMc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kL7a0v5HFcPRR8mMqLWLjsDtajuo9cc1vCUlJrsnvPc=;
        b=pXVqdCQgA2Rl6UvG6jWjH2zAQjHRClovyljd7A8AoYN42B6nHa0Gvo3m86/uLwXMiJ
         l6lX97U7FyXTQbX/iXw3Ux49uuCSXRufcvFzpe0Kzx2aNAL2PnE2xDZJe9uJiA5gR9F6
         M0tczSpt7zB+PJDns5A8SUQWeHt5oGMp3J11pG195TWZRIa5cfbzarsmTW8qy718z4I9
         dNEisefUl7B90YRCUNL4yXXpijfd0RLAzGYAOt5ta4jE9+ouh9o7+8QX9VCxuW/rz5IJ
         hhAglXSJoDUmMs9p/dTLUM7HSS1tDTNZ0C1OzBPiQYPpkWtHeDWGC/r4ykz9K+rrUlFY
         qSqw==
X-Gm-Message-State: APjAAAU+v6cXK2jtci/stkWXiGCLE2/VhHoIneU8uLiImmD+YEfxNcz4
        X8JWi9nhSJdsBq4Jn9kUmk3miyI8yz05cqLZxJGo7CIguy4n6Q==
X-Google-Smtp-Source: APXvYqwqF+1IumQXDJtI2X7B7QQ7FDXSJpvQ9DbJSFkQvhC3s2dTb3jaZya+aXfpMphjPeNkYbcunoL/1A8KkCCtsoo=
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr2670489ljj.191.1565633600523;
 Mon, 12 Aug 2019 11:13:20 -0700 (PDT)
MIME-Version: 1.0
From:   Rafael Vargas <vargas@khomp.com>
Date:   Mon, 12 Aug 2019 15:13:09 -0300
Message-ID: <CAEaYocZ3awg1aW=7Z7Ut_G64Ov9ZdyOAeYWNMdTBTf7scJM6EQ@mail.gmail.com>
Subject: libbpf expected backward compatibility
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,
Reading the tools/lib/bpf/README.rst file, I could find what should be
the expected backward compatibility of the library with older kernels.

Should I be able to use a libbpf compiled from a kernel newer than the
one I will be running or vice-versa?

I've noticed that the following diff (part of
421ecf02c8e73e1d95e16e5e12aa19146561edba) makes the xsk_socket__create
function return errno 95 'Operation not supported' on older kernels
(5.1.0 in this particular case).


diff --git a/src/xsk.c b/src/xsk.c
index 7ef6293..bf15a80 100644
@@ -597,6 +599,16 @@ int xsk_socket__create(struct xsk_socket
**xsk_ptr, const char *ifname,
        }

        xsk->prog_fd = -1;
+
+       optlen = sizeof(opts);
+       err = getsockopt(xsk->fd, SOL_XDP, XDP_OPTIONS, &opts, &optlen);
+       if (err) {
+               err = -errno;
+               goto out_mmap_tx;
+       }
+
+       xsk->zc = opts.flags & XDP_OPTIONS_ZEROCOPY;

Should this really return Operation not supported or should it handle
this particular error and set the zc flag as false?

-- 
Rafael Vargas
