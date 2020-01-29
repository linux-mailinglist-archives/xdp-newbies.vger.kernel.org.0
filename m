Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A642314C4B7
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Jan 2020 03:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgA2CvJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Jan 2020 21:51:09 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36052 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgA2CvJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Jan 2020 21:51:09 -0500
Received: by mail-ot1-f68.google.com with SMTP id g15so14216210otp.3
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Jan 2020 18:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=QJADqPmMGaZaHq5n519ftzQrFjM0NjWFT0fp7j9pAOA=;
        b=V1WPIJCS7LNssdYgAA95QJ2wrNhAYpcGRfaOC6MazvZ8IMT6U9kPjeiL4tDtoH678n
         6QxF0pZQTq4EgOymKS1F3xW3PApifXgWQ6OmJy0pbJPjNtywhSilt4EMd7FSX06AINp8
         SjGE2tUTbU/NVxRqpqkFqNi9T41da9LgtggebmMGGYTAlCoHfkSNPCZ9BDzQaB9rISnT
         pxtix79e9YVagdDQ46brprMIkBoO72fZ9ZDmKoqilTqRa0OPBzXwrqNQfdJuQotqngqr
         Luh74oxDeqm2dVjZRHvIz469T3vQieyfXVmyRmTItV70gn/COsz4bUNj4dsU3s6LEQBS
         ggdg==
X-Gm-Message-State: APjAAAWu7bZaCM/USL1dZ5zIqSBXXisSOiK6/LIxtz6FgE5fFUsG1omu
        DOZkJlucHi/2F6p+8gRD32VG1Mdrrj/NGla+pZpFUo6Rxgg=
X-Google-Smtp-Source: APXvYqyKN91sFL6eqZp04JOgVbKj9Z/DxRdXp2CsBCfC4wlc6es33xVZUFymuhoxZeL2//3C8hhz+5kHVUM27VuRe1Y=
X-Received: by 2002:a05:6830:15d7:: with SMTP id j23mr7563708otr.357.1580266268732;
 Tue, 28 Jan 2020 18:51:08 -0800 (PST)
MIME-Version: 1.0
References: <CAMyc9bWnDuwDx_i=NjoAS1cDd5Fuy6T05ukSQZpjQv2Ji36jGg@mail.gmail.com>
 <CAJ8uoz1=Se+-hYWO6E11_LM9kS2Z1Eqeq17pB=oQC1tDR75WiA@mail.gmail.com>
In-Reply-To: <CAJ8uoz1=Se+-hYWO6E11_LM9kS2Z1Eqeq17pB=oQC1tDR75WiA@mail.gmail.com>
From:   Cameron Elliott <cameron@cameronelliott.com>
Date:   Tue, 28 Jan 2020 18:50:55 -0800
Message-ID: <CAMyc9bUr9FLLS7hqVeU=jOBfvDfn4Ch0kkErGMFYZgstMXRqPw@mail.gmail.com>
Subject: Re: Maximum xdpsock txpush rate with AF_XDP ??
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all,

I am still stuck at 'xdpsock -t -i enp1s0f0 -N -z'
Failing: samples/bpf/xdpsock_user.c:xsk_configure_socket:322: errno:
95/"Operation not supported"

But if I remove the -z, it works, at 2mpps

I believe I am running just i40e without the virtual function driver.
(installed i40e from source with modprobe)

I am running a 5.3 kernel, IS THIS TOO NEW?  (details below)

I am running the i40 2.10.19.30 driver, with firmware 7.10 (details below)

Do all those version numbers sound okay?

Should I try a different kernel or i40 driver, or firmware/NVM revision?

Thanks, Cameron



--- details on kernel and i40 driver and firmware version ---

~> uname -aLinux lumen 5.3.0-26-generic #28~18.04.1-Ubuntu SMP Wed Dec
18 16:40:14 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

~> ethtool -i enp1s0f0
driver: i40e
version: 2.10.19.30
firmware-version: 7.10 0x80006456 1.2527.0
expansion-rom-version:
bus-info: 0000:01:00.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes
