Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F797B4EB
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Jul 2019 23:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfG3VVI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Jul 2019 17:21:08 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:43603 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbfG3VVI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Jul 2019 17:21:08 -0400
Received: by mail-lf1-f46.google.com with SMTP id c19so45790020lfm.10
        for <xdp-newbies@vger.kernel.org>; Tue, 30 Jul 2019 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khomp.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=jBQh14xh4hsYJ4CAdHVNZJlKVo1tr+kss+vZrC41v40=;
        b=Io+iBmrBzAcDQfBzAiQzvW2MzjUfr7npo7eV4JKomivCnAgcv9GIdyzydGFzB3NDuz
         XnWWFZoJZoUkepVAq6tHFbPSboNy4HK+T3RkdfCyJ3/VuGPglltoxW97d0jIG7uZxoFl
         VbGDhvUZOjuPLa2tU6/5Bx+l7ZS43JVt9PXvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=jBQh14xh4hsYJ4CAdHVNZJlKVo1tr+kss+vZrC41v40=;
        b=r+nKD+NVnioyKbSYaemAA2me7/qfPr5uBnXHN4lV8omHDKp08PMgomHCank6POE9i7
         9Q05k9beNjeZ4xWCPnSzmpziqFhvfXSy1lUaBeD/ZnOqXgZNDup7w0JrmeSd0d/y864L
         BhHn/9KHvQ87g6xmmbG/mbJV8lTSU3nzSnxn08+oVfwjk81wH7IHXdIuOJdi8t+PvmWF
         eDWIEU3nC8+D6NBE6MK7EhbVtmQjNsyNCWb9ViGBMcBYT5H6x8DE3SpMFe5SoZtfq+BT
         LKgCNgtECbKd1QhYrLe/tuqwFuJ0PXR2/EJPnBtA4/PJJI749v7n0pOEBnTvUkKAvPyS
         orZQ==
X-Gm-Message-State: APjAAAVHdm4yh/dX5QFiAe3gHD+37ZSbvKDSVVCPq54I4SfPzmYr8SZi
        WNvJHA0RwY2NWfGM4Y3ECtt4bMXQVYHseydtUL+HHtY2zqA=
X-Google-Smtp-Source: APXvYqzalqrBZKuFdI71Qjl5jy+CQnyE4jeDDBKePITtyqWTPl4OmXRbWXYlPi9El6QQh89aDoCXgv5NtQe0mXZ1pV0=
X-Received: by 2002:a05:6512:288:: with SMTP id j8mr60731714lfp.181.1564521664977;
 Tue, 30 Jul 2019 14:21:04 -0700 (PDT)
MIME-Version: 1.0
From:   Rafael Vargas <vargas@khomp.com>
Date:   Tue, 30 Jul 2019 18:20:53 -0300
Message-ID: <CAEaYocbC=x=fzXVJoKpHRXmK74-buEoqpSAvyuODRm3CH4k+Sw@mail.gmail.com>
Subject: Ajusting XSKMAP max_entries value
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I'm using AF_XDP sockets to bulk read from the network device and it
seems to work fine.

Now I'm fine tuning my code in order to compatible in a broader range
of scenarios.

How should I set the size of my XSKMAP? As I'm creating one AF_XDP
socket for each RX queue, and using this as the map size, is this
correct?

As I'm using programs compiled using clang-bpf, is there a way to
change this value without having to recompile the program?

What would be the recommended way to setting this value correctly for
each interface?

Thanks!

Rafael Vargas
