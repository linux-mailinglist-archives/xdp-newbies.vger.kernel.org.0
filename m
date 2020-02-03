Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4D71503A3
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Feb 2020 10:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgBCJxw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Feb 2020 04:53:52 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:44252 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgBCJxw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 Feb 2020 04:53:52 -0500
Received: by mail-ot1-f44.google.com with SMTP id h9so12993372otj.11
        for <xdp-newbies@vger.kernel.org>; Mon, 03 Feb 2020 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ke5B2cF4aOaPVmYaDlysExaqnPvLA5aWfzSXnV/m1o=;
        b=UG1+g8gT2maT8p/3Bj1km3Bk8d73Erdq3mNNiHAUPsIEYrP4wlCtjpPlxwpop+9lUB
         R6H/TlheV1Q+dK1GaeePIa2+LQiPgQ8R4j8sat2EreA6PCD/tvZbNuaBbMKPQxALaC8F
         2ipGETg4SO6fxatOhMxFblE9/pG9VCTRBXhKfE1mk+GR8RxKFjOKtQBRTSkOUlTuQjGz
         1ldZOTShL8uJLkleTYeE6yOBLnD9SgZdioDJoelakUt/LyzyixdrC1zhFP3vwXyeVKiq
         3QTq7Pr2TjLiHr9QTno6ZYTOha9anbphURqEWwZqo/rZkrUHXwjVsRwDE2chzInGTjSH
         snlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ke5B2cF4aOaPVmYaDlysExaqnPvLA5aWfzSXnV/m1o=;
        b=CWtmGNspHqyRz7Jys5G+pZX0DJAe82Ync3kH1HWaspZalSOyIDEYZjZQ6Ju/zhfEJQ
         075kCsu3/Rro9gWC+qBou0Tm0cQwcGKJkPv6QG8pCMxRvIQRYupIrTymEXnmRJodHDNs
         hJPiQei1ybZi+lA9Lk+kWJezkGns0av1L5GVbKHxO9Ald1ImidVwDtYSllXgPSzIfW7X
         V3b5I2qMEpCVi/SouzWkh++AJq4oR8VhM4J66upUl38G+5pFf6ltQbWucDAcrDPXx8sX
         lQVkRtKWew8F371L8hKbgHHbunjWqCX4nnFmZsobuhgvyREHDSE2cuDfNp1g3P1toXRj
         4daw==
X-Gm-Message-State: APjAAAXXogBbwU0cp0MlsBNuBr6Phuo7qAvecaOvQhOxAzmRvYPGXaCH
        T6BVzRP/qw8pTjt0lQtmYV/o/4qNKAlP79IH/kVJrC9Y
X-Google-Smtp-Source: APXvYqxJU3GT/O5uevz2mD6itNkbmzj9G3vCp6QZCuWippk0Cbq+F4y58VvBT6vDzKbuxR76kxdvkv1uQs4h20R7gh0=
X-Received: by 2002:a9d:6b17:: with SMTP id g23mr17420183otp.139.1580723631878;
 Mon, 03 Feb 2020 01:53:51 -0800 (PST)
MIME-Version: 1.0
References: <CAMyc9bVixUDEJ-WHLJaCCTF3iV4pFF2j+RPM0hM1XOKh6S2yBw@mail.gmail.com>
In-Reply-To: <CAMyc9bVixUDEJ-WHLJaCCTF3iV4pFF2j+RPM0hM1XOKh6S2yBw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 3 Feb 2020 10:53:40 +0100
Message-ID: <CAJ8uoz0btU4L80d2DHv+=ivL3RJmunnAsmetL=2zBo_2xfpgAA@mail.gmail.com>
Subject: Re: Cannot run multiple 'xdpsock' concurrently?
To:     Cameron Elliott <cameron@cameronelliott.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jan 31, 2020 at 3:14 AM Cameron Elliott
<cameron@cameronelliott.com> wrote:
>
> Hello, I am trying to measure the maximum mpps I can push using AF_XDP on a 40G X710
>
> I can do 22 mpps  after resolving a few bumbles I made with drivers, etc., (Thanks Magnus!)
> when using a single instance of 'xdpsock'
>
>
> Apparently the way to upto 50, 60 or 70? mpps is to use multiple cores...
> And apparently the simple way to do that, is multiple instances of xdpsock on different queues.
>
> But, my attempts with multiple instances fail. :(
>
>
>
> First, I checked my channel setup:
>
> $ sudo ethtool --set-channels enp1s0f0
> no channel parameters changed.
> current values: rx 0 tx 0 other 1 combined 4
>
> I presume that is okay...
>
> Then I run these two commands in two different windows:
>
> sudo  /home/c/bpf-next/samples/bpf/xdpsock -i enp1s0f0 -t -N -z -q 0
> sudo  /home/c/bpf-next/samples/bpf/xdpsock -i enp1s0f0 -t -N -z -q 1
>
> With the only difference being the queue id.
>
> The first will start and show ~22 mpps tx rate.
> When I start the second, both instances die:
>
> The first instace dies with:
> /home/c/bpf-next/samples/bpf/xdpsock_user.c:kick_tx:794: errno: 100/"Network is down"
>
> The second instance dies with:
> /home/c/bpf-next/samples/bpf/xdpsock_user.c:kick_tx:794: errno: 6/"No such device or address"
>
>
> Do I understand correctly I should be able to run two instances like this concurrently?

This is probably not supported by the current xdpsock application.
What is likely happening is that it tries to load the XDP program
multiple times. As the XDP program is per netdev, not per queue, it
should only be loaded once. When the second process then fails, it
probably removes the XDP program (as it think it has loaded it) which
crashes the first process you started.

So, the application needs to get extended to support this. Maybe you
want to do this :-)? Could be a good exercise. You could add a new
commend line option that takes the number of instances you would like
to create. Look at the -M option for some inspiration as it does some
of the things you need. Maybe you can reuse that code to support your
use case.

/Magnus

>
> Thank you for any ideas, input.
>
>
>
> # ethtool dump / i40e driver from recent bpf-next clone
> c@lumen ~> ethtool -i enp1s0f0
> driver: i40e
> version: 2.8.20-k
> firmware-version: 7.10 0x80006456 1.2527.0
> expansion-rom-version:
> bus-info: 0000:01:00.0
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: yes
> supports-register-dump: yes
> supports-priv-flags: yes
>
>
