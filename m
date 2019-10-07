Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8707FCDD6E
	for <lists+xdp-newbies@lfdr.de>; Mon,  7 Oct 2019 10:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfJGIgf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 7 Oct 2019 04:36:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41313 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726969AbfJGIgf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 7 Oct 2019 04:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570437394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ygWtsuVFVgMFE+BypjPj0QnknU6Tt0gITeP4RMC/RBA=;
        b=ChXHzBhNqyIKNkF5qP5Pdy73ze39HGF+xWtWv0iSW9SiQZEpWaGf+RBywRxlgGAblu5o4X
        1iiL51Gdl7D416a568OFret25IaTwitOzrCGJOADHJPIkCM56qaErxzMNXGTaTBggep8rp
        sXgON7QxzcvuVW8+Zep/5BaUuj/N6Ls=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-ORGAu1atMzuE3xJ9QLEf2w-1; Mon, 07 Oct 2019 04:36:32 -0400
Received: by mail-lj1-f199.google.com with SMTP id l13so3234229lji.7
        for <xdp-newbies@vger.kernel.org>; Mon, 07 Oct 2019 01:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=FKj0bJF7LOWN0kHOK/U1QjwsIpxxSisW4J1bOaqGios=;
        b=B0zA0hfGcgfL85HspRH1tsgjYJXzkgwYuSTdkPKjsNo8j0/2IUh038fmcikN82N8r4
         35NN/9WD98C2vh7iCTTvIoh5G+W37Jv0P63/sd0b0+uBjlajoRUmfmwG1zzjN3HidcWj
         hmQte9NQVjJOrGTi/RjCVLNZOWIsCj5G2YBH9oRQ5C89Wu585gyfeRxdRSRKw5EGyAUB
         D0cy8FpwhjaCIpuCpS9r3rrIzHpvRvagjWYC4y0ovGAtV92RG06ZJcamctX4bd+++K2L
         rHlzVxBGXVqC8sU5AFS//P4XxM+eGL0yZ5P7MYYqrHmb46X2jE/PHDUSFAipSWZfygx+
         Cchw==
X-Gm-Message-State: APjAAAXkBU9iwfelvEG6Z7VQyTap+FgxIZxVCAZ8WSCfmPBEOdaBPBMU
        4wlO/ApCpqIbCRrurfuVqKtikhdpQYfdYOAKCYHVT4O9IsOijso1EMfXSnO4wjW1kKpNregEKwg
        Zf3ZbII/rr7v2ZY3rrZbeM6c=
X-Received: by 2002:a19:488f:: with SMTP id v137mr15617345lfa.26.1570437390741;
        Mon, 07 Oct 2019 01:36:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0CUCOW07KxuV5NALyPj3T7AmegX7kO5BzA5Bx/vRYbkyEjTFyexDUs7Q2m/cbDtc4H7KJqQ==
X-Received: by 2002:a19:488f:: with SMTP id v137mr15617335lfa.26.1570437390522;
        Mon, 07 Oct 2019 01:36:30 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id b21sm2748632lff.96.2019.10.07.01.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 01:36:29 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 9002618063D; Mon,  7 Oct 2019 10:36:28 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Radu Stoenescu <radu.stoe@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Unable to run eBPF program that uses maps
In-Reply-To: <CAM-scZMSvAE0jny0b__Da1j=krBB38J8w_H_12s=sy7T=F0spQ@mail.gmail.com>
References: <CAM-scZMSvAE0jny0b__Da1j=krBB38J8w_H_12s=sy7T=F0spQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 07 Oct 2019 10:36:28 +0200
Message-ID: <87k19hlzoz.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: ORGAu1atMzuE3xJ9QLEf2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Radu Stoenescu <radu.stoe@gmail.com> writes:

> I'm running this Ubuntu: Linux anemie 5.0.0-31-generic #33~18.04.1-Ubuntu=
 SMP
>
> I've cloned and compiled the Linux kernel - the same version and
> config as of my machine's.
>
> When trying to run the xdp_redirec_map sample program from samples/bpf I =
get:
>
> sudo ./xdp_redirect_map 2 1
> #=3D> failed to create map 0 (tx_port): 1 Operation not permitted
>
> I read that, on certain systems, the default limit of locked memory
> might pose problems, and I mitigated that as seen below:
>
> ulimit -a
>
> core file size          (blocks, -c) 0
> data seg size           (kbytes, -d) unlimited
> scheduling priority             (-e) 0
> file size               (blocks, -f) unlimited
> pending signals                 (-i) 31231
> max locked memory       (kbytes, -l) 1024

Is this run as your regular user? The limit will be reset in the sudo
environment that loads the program; so you'll need to set it as root (so
something like `sudo -i; ulimit -l 1024; ./xdp_redirect_map 2 1`)

-Toke

