Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEB6330C83
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Mar 2021 12:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHLgV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Mar 2021 06:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhCHLgF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Mar 2021 06:36:05 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7674EC06174A
        for <xdp-newbies@vger.kernel.org>; Mon,  8 Mar 2021 03:36:05 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z13so9510336iox.8
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Mar 2021 03:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Xzr51jzF4dSaRLsqILhPUo6+HT+FwMUxo+rNfmjLiLY=;
        b=CThP/SllzMeZ/TBH9HCWFbQ0nS4Xl9C65pNHCc+xXFi1Eb6hXBRaI4lZLBXoKlWhow
         fSdWfvqb0JL7BLx9jaHZubfJiFchhD9w4Ss2ooQxK1RYW7W4YZ1KTSgClJuAROXwUey3
         B4NtAHM803BLjFfhGX/H1esPXgzgHIjnapaCAF+IBrT6uevWdWFKG43IaFq2SWINj4De
         iu+IWJVeqpJ10W3ddT+heLzPRq1KwXF5L+Dq2CArIdBf6fTyORLMGYd/+Ao7tcyfFLev
         SRZV0eVhwEuoL/HA/A3Dz2G/ojKMaXoIYLhG7ePtrrL8k+rHfZ71sx2xSbiVgkoLu/00
         p9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Xzr51jzF4dSaRLsqILhPUo6+HT+FwMUxo+rNfmjLiLY=;
        b=bdTht8FYigvebyllREDnRbzzgv96+T1JpjCnvpleUJkZql9Kb7dRiKIV1nlbJ/zhKw
         taWuzYG/SyHtw3B/Ilngm51SBZyp7uBGO7xvamMJt4Gvrnb1pc00WRo/tAkujY6rNf7Y
         2S/w5MIcne+4kmy6hC6J4V6JdVS+ZLJt1d0DiO4i0z4tA184SM1+Zu5xFOmObrVyOLAR
         /7nNs13H1GzUWJF90EBzdN2u9cRl4RtA720lU0zWdyVh2WOzf3DQnRiRv32peVnzTUqS
         R16gwx8DoeBOolvcb5uLdzDI7XZHncgXsc4LIa+TGmjZo3kEvJOiLG4hb62oVoFwo+RK
         C9Bw==
X-Gm-Message-State: AOAM532iCxWFhZzmb8oIm3v7ab116JKi3z/yeQCN7O9rHr1cR1oaVDkE
        IB6yF9BuyC6hQ69rzcbFpjIRXa8O744IwDpoCWbPYM6y
X-Google-Smtp-Source: ABdhPJwCMPw0vvpUnnPZ9HJO/MVart/qwk9ZSR2mU1JjLl62q2eNwgqx7pYTuG0ur4KTxRlZk5ABCqaJlZZuyhhDHPU=
X-Received: by 2002:a6b:b7d7:: with SMTP id h206mr18520416iof.56.1615203364503;
 Mon, 08 Mar 2021 03:36:04 -0800 (PST)
MIME-Version: 1.0
References: <CAK9R32Tu_fjHbUjfcgMK3unJTFGnLyNVJcLBFeZCa1pzOh3wGg@mail.gmail.com>
In-Reply-To: <CAK9R32Tu_fjHbUjfcgMK3unJTFGnLyNVJcLBFeZCa1pzOh3wGg@mail.gmail.com>
From:   Martin Teichmann <martin.teichmann@gmail.com>
Date:   Mon, 8 Mar 2021 12:35:52 +0100
Message-ID: <CAK9R32SpVG22rpdT252Jip7UW_HAsndhWBdN5m809uMSKWtKaA@mail.gmail.com>
Subject: Fwd: A Python-based ebpf code generator
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi friends of XDP,

I wrote a small ebpf code generator for ebpf. The idea is that one
writes what mostly looks like a Python program, yet it actually
generates ebpf. The advantage is that everything is done in one go, no
external compilation is needed.

To give an example, the following is the complete code needed to
simply count incoming packages. Note that the code does define a
HashMap, which can be accessed both from XDP and user space. The
reading and writing of the hash map is done transparently by the
library:

    from asyncio import get_event_loop, sleep
    from ebpfcat.hashmap import HashMap
    from ebpfcat.xdp import XDP, XDPExitCode

    class Count(XDP):
        license = "GPL"

        userspace = HashMap()
        count = userspace.globalVar()

        def program(self):
            # this code actually generates ebpf:
            self.count += 1
            self.exit(XDPExitCode.PASS)

    async def main():
        c = Count()
        await c.attach("eth0")

        for i in range(100):
            await sleep(0.1)
            # c.count can be accessed from userspace!
            print("packets arrived so far:", c.count)

    if __name__ == "__main__":
        get_event_loop().run_until_complete(main())

Everything can be found on github: https://github.com/tecki/ebpfcat
PyPI: https://pypi.org/project/ebpfcat/ and readthedocs:
https://ebpfcat.readthedocs.io/en/latest/
The code is still in its infancy, but the above example already works.
I hope that this contribution will make XDP development much easier,
expecially for newbies (like me...)

To give you some background why I did this, which is most likely
completely unrelated to what others do on this list, but for your
entertainment:

I want to control hardware using the EtherCAT protocol. This protocol
is directly on top of EtherNet, and basically what you have to do is
to write out an EtherNet packet to the hardware to tell it to do
something, and it returns a packet with the changes that this resulted
in, ending in a ping-pong between the hardware and the controlling
computer. In this scenario, latency is everything: the faster you can
react to packets coming in, the better is the control of the hardware.
XDP promises good latency, so I gave it a shot. The reason I wrote a
Python code generator is that I need to generate a dedicated XDP
program for the connected hardware. Usually one writes a generic
library that can deal with all kinds of hardware, but given that ebpf
programs are pretty limited in size, I have to generate code
on-the-fly after having detected the current hardware configuration.

Now to the results: on my Raspberry Pi 4 I was able to process 30 000
packets/s. This probably is a good laugh for most on this list, but
for EtherCat this is pretty amazing, as this is close to the hardware
limit. Interestingly, when I used my laptop, which has an Intel
ethernet card that uses the e1000e kernel driver, I was only able to
process 10 000 packets/s, even though I had switched off all buffering
using ethtools. Worse, sometimes (I guess around one out of a 100 000
packets) the packet got stuck somewhere for more than a millisecond.
This is awful for my application, and never happened on my Raspberry
Pi 4. In the end I don't care much as a Raspi is pretty cheap, and if
it does the job, fine.

But this still does puzzle me. Why does the e1000e sometimes delay
packets? If the e1000e driver was XDP enabled (I read that somebody
seems to be working on that), would that improve the situation? And
what about my Raspi, could I improve the situation even more by adding
XDP code to its network driver?

Hope you have fun with my ideas

Martin
