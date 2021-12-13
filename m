Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9615473656
	for <lists+xdp-newbies@lfdr.de>; Mon, 13 Dec 2021 22:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238624AbhLMVEW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 13 Dec 2021 16:04:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45298 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233931AbhLMVEW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 13 Dec 2021 16:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639429461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=kPYalMpFVO14Brm11WBg201RVT3nSSr+XTqO+FiE+pE=;
        b=jD93mgbgJV4Eggt+fkMnCa+8sNWBU4xYp8m8aJ4uS4QrUMhXzQBmpKcX/4OMuDmcme5sAX
        a1INIapvRSlTyllITe61S0VoFqLBFn/ATT4UXWrwBdorTGvANe9jXt/EWSaUC3KNJ7Nh1T
        rcCE4WpsBYjp5LwKrTPFKumwUzQ6D20=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-nL8znml0OCmdRd5r1HHrOg-1; Mon, 13 Dec 2021 16:04:20 -0500
X-MC-Unique: nL8znml0OCmdRd5r1HHrOg-1
Received: by mail-ed1-f71.google.com with SMTP id d13-20020a056402516d00b003e7e67a8f93so15123697ede.0
        for <xdp-newbies@vger.kernel.org>; Mon, 13 Dec 2021 13:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :content-language:to:subject:content-transfer-encoding;
        bh=kPYalMpFVO14Brm11WBg201RVT3nSSr+XTqO+FiE+pE=;
        b=ejZv+AIjsF61Uk+YeSEa8aiIqIezwBBmPPyYMNjk/tzxiq3/iJACNEnzrXqD15BSsh
         eemckr/ss201b7uaZBMwW2tzVTQctw1gt+xLtMWK4ocRjszbU8+lmUga6opdNMVnaoAR
         1FZppSdoD0LhOm9YQM9t/kjO9kG2waOJaHRoEIIM5eHC254UJCVKKcioFJwzXdhP3/Ny
         EB10xW9FIDbco/Cvs0Ay4Brh2x+zJuXA4JOblSYgOzZeTKG/ohj3/i6UqyBn71USqEzD
         yAgsRkavJN/U4tuDNUrcInFEzbEZ2QXndYKz5iTBUfa76auMKQUZKadwJKg0Q3EvXoZ6
         W7jw==
X-Gm-Message-State: AOAM531D2aT2g3hwK1bR5v/RA1qwzXTs1Zo0fWShzEiqcOunO/jssQxT
        El+ViS/yQIms6DlZxAGIGHuXl174NZ5ONlQ09Nge7Rn0/Sak4VQtDvRhb/hgUJAslbR42bkWD5w
        l+86AqcBPgFeZEeUAl9ilF9s=
X-Received: by 2002:a17:907:7fa9:: with SMTP id qk41mr914385ejc.422.1639429458378;
        Mon, 13 Dec 2021 13:04:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykLozWv/TO8Q/v71Zvqa2n9FKIsLesMwxEnMMnLB4qD3z5AOs7r/RdcHORF3CA82X21KnHyQ==
X-Received: by 2002:a17:907:7fa9:: with SMTP id qk41mr914360ejc.422.1639429458210;
        Mon, 13 Dec 2021 13:04:18 -0800 (PST)
Received: from [192.168.2.15] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id em21sm6156014ejc.103.2021.12.13.13.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 13:04:17 -0800 (PST)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
Date:   Mon, 13 Dec 2021 22:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com, Xdp <xdp-newbies@vger.kernel.org>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Content-Language: en-US
To:     "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: AF_XDP not transmitting frames immediately
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Magnus and Bjørn,

I'm coding on an AF_XDP program[1] that need to send (a bulk of packets)
in a short time-window (related to Time-Triggered Ethernet).

My observations are that AF_XDP doesn't send the frames immediately.
And yes, I do call sendto() to trigger a TX kick.
In zero-copy mode this is particular bad.  My program want to send 4
packets in a burst, but I'm observing 8 packets grouped together on the
receiving host.

Is the a known property of AF_XDP?

How can I get AF_XDP to "flush" TX packets when calling sendto()?
Should we add another flag than the current MSG_DONTWAIT?

--Jesper

Hint, I'm using tcpdump hardware timestamping on receiving hist via cmdline:

  tcpdump -vv -s0 -ni eth1 -j adapter_unsynced 
--time-stamp-precision=nano  -w af_xdp_tx_cyclic.dump42

Notice[1] on specific branch:
  [1] 
https://github.com/xdp-project/bpf-examples/tree/vestas03_AF_XDP_example/AF_XDP-interaction

