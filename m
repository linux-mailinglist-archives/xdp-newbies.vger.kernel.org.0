Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC0284C06
	for <lists+xdp-newbies@lfdr.de>; Wed,  7 Aug 2019 14:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbfHGMtf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 7 Aug 2019 08:49:35 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:37106 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729722AbfHGMtf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 7 Aug 2019 08:49:35 -0400
Received: by mail-wr1-f45.google.com with SMTP id b3so150175wro.4
        for <xdp-newbies@vger.kernel.org>; Wed, 07 Aug 2019 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ufdc1wiIkvEeJsPWjLQhX1ytiruiDNsHkddePOCBxMU=;
        b=hoZwEnC7SUqkHyY0h+kEXxZEzBbcGNxFD5m1EX8f7cuaQBj4vbzIRD8vFlgoyXJKDy
         s6qVNCISyChJ6wWGHZ33JiXQGOpTRPPb+F7TLBvXZvbJ2CJ6hGyeoDwJHQSOROETKPSr
         EJw6CpiwgAaWcraVYrls9sePbHVxP1rVHrSnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ufdc1wiIkvEeJsPWjLQhX1ytiruiDNsHkddePOCBxMU=;
        b=qF9qVB0TKLpLMhakwJ9IUghBnHoqMqEXANLrHiC8L4Ak792FGzNkDw4TjAJU8onPmV
         ildp+4c2IalWCPB1fXi0p10SIuJ4KZC5DVoGlZpBY6CV2aR/J5bab047caiZWekDTbG6
         j0zn4wjj0B5M1x8ar2f4fWU+qa5zW641dY3GLTbVPGBxLShQF1aiWH3F321wtCdF4vEq
         v2TTDyTLIb7wukdkM4CctAqQQTufmLLCtolXKM+CCR6fiBfbpWv0HPDBsymzNAAq6b99
         v6XqD81qbmy6x0mTt2QkqKpjHKrrLMZm8tngHXsKsOBaXgsiE8M/xzMP/mwphxywa/y4
         9RgQ==
X-Gm-Message-State: APjAAAVW4HpJAcNp1fBEhZhEHFyptvgT5CZx+YDKy8+DmHlW2K52qSqB
        a5GT5mYB5362MmkxqZOl/PoZaphrlPXyTCI2sH8atkMcrCnvaw==
X-Google-Smtp-Source: APXvYqzuq5nnpE6LmyzDSeGHexJM7uekR3VIgHKiCbW7iMkN9/s5DH7r1cuR0jPsSfOVHdFI9j4CCFU+JxYItMLye7s=
X-Received: by 2002:adf:aac8:: with SMTP id i8mr11465374wrc.56.1565182173690;
 Wed, 07 Aug 2019 05:49:33 -0700 (PDT)
MIME-Version: 1.0
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Wed, 7 Aug 2019 14:49:22 +0200
Message-ID: <CAHApi-mMi2jYAOCrGhpkRVybz0sDpOSkLFCZfVe-2wOcAO_MqQ@mail.gmail.com>
Subject: net/mlx5e: bind() always returns EINVAL with XDP_ZEROCOPY
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,
I am testing the mlx5e driver with AF_XDP. When I specify
XDP_ZEROCOPY, bind() always returns EINVAL. I observe the same problem
with the xdpsock sample:

sudo samples/bpf/xdpsock -r -i dcb1-port1 -z
samples/bpf/xdpsock_user.c:xsk_configure_socket:322: errno:
22/"Invalid argument"

Without XDP_ZEROCOPY, everything works as expected. Is this a known
issue/limitation? I expected this to be supported looking at the
code/commit history.

Thanks,
Kal
