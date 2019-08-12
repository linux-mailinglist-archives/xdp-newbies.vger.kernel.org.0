Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C86518A8A7
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Aug 2019 22:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfHLUwB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 12 Aug 2019 16:52:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39373 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfHLUwB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 12 Aug 2019 16:52:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id r21so158281171otq.6
        for <xdp-newbies@vger.kernel.org>; Mon, 12 Aug 2019 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IObGYsne4bO9JeoeZnC3eAAQ28nzsV158nNmq1acSBM=;
        b=upSCXLX2Tub+bTnDByU7LyMk40qqVLhiZMdAo+ZO5SDYGdyTDemdOC3t0aIqGL+Cv+
         nfYY6m8jU4jxIJCBL1xbNxIO0BhSZo3axqZnOFh1Wnhm3vUs1LdEvsy6F7Kd5e9EgfUw
         auzE+U/HNb3zkPTL7VRESAcAFo/h719+kfUCFRdfiOOCv3XVZvsBl23gd4kWkfKGvcqw
         mleguMXI06nhh0my2ya+AGHokBuoqC1BjaxTgtORtLhsazQIVg4bP03nx0WMsqGczJTe
         54mO9LR+8+hDbZFcInNnJKNKaYf8UmA3vrCi0knLwbH39TQDoQeWE6g+Aijo3N4pFF+P
         THyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IObGYsne4bO9JeoeZnC3eAAQ28nzsV158nNmq1acSBM=;
        b=G173Cz4Od2XxWSwbXpFF3C+Y6uIA9SezFi4lATdR8dWs+X8nKtNHUWqIkinkxGn/Aw
         bs2xWRwnCEg3Abe9oJ8l3iMaG6ytWbVqC9k26Y083FH5fabDg4s+ZFJhnU77gOok8OuY
         NyPJ7Bm4YW3ch74V//XCIDWlQ5/wpscEQCtRRB3Ugna8Ras9dwR6ClqZ4YRnybRNXNIA
         tHHJPOIeD/PFgvGeifMLYG+CWrpy2G7sKlFJ8ntb3JIazOUHCh743l5T6325ag8amTqT
         ky0iVwULkgY/moyE3QkvGAnrFyBudgbt1iY+w9HX0CC2XaGYKyZWH91/SZIfaodJakcE
         rxEA==
X-Gm-Message-State: APjAAAUDC34cy9u3lj/ybghbbyF4M2stLXYXyEdGwAsjxG8tMaCUXqoc
        2T0MabehtwAm97mLkMQ6h4iKz/HJfwkBurIoiGBmDJv1Yh4=
X-Google-Smtp-Source: APXvYqz4px60hSazLOx7RU4JIhySByXFHnSWvEhy0NZ3HOcwcE7HM+KRKtHoeAt2yZnV+stGWrsJQCtCBtBBvKjAQAo=
X-Received: by 2002:a5d:888d:: with SMTP id d13mr24859376ioo.135.1565643119973;
 Mon, 12 Aug 2019 13:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAEaYocZ3awg1aW=7Z7Ut_G64Ov9ZdyOAeYWNMdTBTf7scJM6EQ@mail.gmail.com>
In-Reply-To: <CAEaYocZ3awg1aW=7Z7Ut_G64Ov9ZdyOAeYWNMdTBTf7scJM6EQ@mail.gmail.com>
From:   Y Song <ys114321@gmail.com>
Date:   Mon, 12 Aug 2019 13:51:23 -0700
Message-ID: <CAH3MdRXcFtxi1mPq2KXUbDLhzHLtm3W=e6XTpFvsgFKH8hjogA@mail.gmail.com>
Subject: Re: libbpf expected backward compatibility
To:     Rafael Vargas <vargas@khomp.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Aug 12, 2019 at 11:13 AM Rafael Vargas <vargas@khomp.com> wrote:
>
> Hi,
> Reading the tools/lib/bpf/README.rst file, I could find what should be
> the expected backward compatibility of the library with older kernels.

Now, libbpf tries to maintain backward compatibility with itself.
That is, APIs introduced in older versions are expected to work
in new versions.

This has nothing to do with old or new kernels.

>
> Should I be able to use a libbpf compiled from a kernel newer than the
> one I will be running or vice-versa?

On the other hand, when libbpf is able to able to load a program or map,
it tries to reload by resetting some debug/info fields. But depending on
which API you are using, you may not be able to retry successfully
on old kernels.

>
> I've noticed that the following diff (part of
> 421ecf02c8e73e1d95e16e5e12aa19146561edba) makes the xsk_socket__create
> function return errno 95 'Operation not supported' on older kernels
> (5.1.0 in this particular case).
>
>
> diff --git a/src/xsk.c b/src/xsk.c
> index 7ef6293..bf15a80 100644
> @@ -597,6 +599,16 @@ int xsk_socket__create(struct xsk_socket
> **xsk_ptr, const char *ifname,
>         }
>
>         xsk->prog_fd = -1;
> +
> +       optlen = sizeof(opts);
> +       err = getsockopt(xsk->fd, SOL_XDP, XDP_OPTIONS, &opts, &optlen);
> +       if (err) {
> +               err = -errno;
> +               goto out_mmap_tx;
> +       }
> +
> +       xsk->zc = opts.flags & XDP_OPTIONS_ZEROCOPY;
>
> Should this really return Operation not supported or should it handle
> this particular error and set the zc flag as false?

maybe xdp expert can commit on this.
From my understanding of the code, XDP_OPTIONS_ZEROCOPY
does not involve any user parameters, so it is totally okay
to test whether kernel has XDP_OPTIONS or not.
If not, xdk->zc = 0. Also seems xdk->zc is not really used?

>
> --
> Rafael Vargas
