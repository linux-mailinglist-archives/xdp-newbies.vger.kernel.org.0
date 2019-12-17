Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8699122F7D
	for <lists+xdp-newbies@lfdr.de>; Tue, 17 Dec 2019 15:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfLQO5c (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 17 Dec 2019 09:57:32 -0500
Received: from mail.nic.cz ([217.31.204.67]:60130 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbfLQO5c (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 17 Dec 2019 09:57:32 -0500
Received: from [IPv6:2001:1488:fffe:6:9595:ecab:ab88:6713] (unknown [IPv6:2001:1488:fffe:6:9595:ecab:ab88:6713])
        by mail.nic.cz (Postfix) with ESMTPSA id 6D8C9140A5B
        for <xdp-newbies@vger.kernel.org>; Tue, 17 Dec 2019 15:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1576594649; bh=GDfQ0spaZtD461L9snQLuSrE5KDkSp0LPoFe6kQ9JNw=;
        h=From:To:Date;
        b=gJbk3toU1JBICFP+nzGuljt0zyl8TseODeyjXzutcDEILWcM77OLiSAwEX5OkQi5T
         Y0ucEw/AyjKD+L4y/g+PJV2V7PkB6A18A0VPJRrlzNe2ezkcjB3qqcIgbrc2UFx7Yt
         ai8XXm+bJjvKzFvzKA7j+jJePiPUxErPRpzOMmfk=
From:   =?UTF-8?B?VmxhZGltw61yIMSMdW7DoXQ=?= <vladimir.cunat@nic.cz>
Subject: AF_XDP headroom
Autocrypt: addr=vladimir.cunat@nic.cz; prefer-encrypt=mutual; keydata=
 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
To:     xdp-newbies@vger.kernel.org
Message-ID: <b36728e9-4cb8-4127-2127-2cbdcd9a0068@nic.cz>
Date:   Tue, 17 Dec 2019 15:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello.

I configured .frame_headroom = 0 (default) but I receive packets with
larger one (256).  Am I doing something wrong?  Kernel [docs] says:

> There is also an option to set the headroom of each single buffer in
the UMEM. If you set this to N bytes, it means that the packet will
start N bytes into the buffer leaving the first N bytes for the
application to use.

which doesn't sound to leave an option for kernel-space to
change/increase it, but apparently it does so for me.  In my case it
wouldn't really be an issue, except it makes me unsure e.g. whether 2k
frames are guaranteed to handle standard 1.5k payloads.

[docs]
https://www.kernel.org/doc/html/latest/networking/af_xdp.html?highlight=headroom

Thanks
--Vladimir

