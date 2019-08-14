Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEAD8D09A
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Aug 2019 12:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfHNKUI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Aug 2019 06:20:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36927 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNKUC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Aug 2019 06:20:02 -0400
Received: by mail-lj1-f194.google.com with SMTP id t14so2031899lji.4
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Aug 2019 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LNONNFXrGqvOtXZDbhestEqwQXax/1n3/5TNvc5DICg=;
        b=mlksZd0gBWCNSchq/6oBDjmyQUZ6kOe8L/P2I4bi1TJUahRnht34+T+2RqEKyNMgY7
         YsjszEkrTju9J1/CBMIebMjOtA9fF5RfTRCaEuKmqsWuYw1w2aJaq0EMBO1n844voqrs
         d+Tjt/K5G3Wo/W1f1FozlZZR9M+5fSjWGQKmtQD/OC/9xPWTbVp0Wad0ugJBltv2bFhX
         jf71A7tGUJgiFOvPwXBeX5V8hrOJF/d7/x0wJ6k6Ah0V3mniO3qWFIdsxEwJNzaZwLud
         1CjdbNoEsKg2cZqDCeAzG/xsOLaVD00eiRlVEzhjqLoOLBeu8iCBW4m0ysvnW7/tHsep
         kZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=LNONNFXrGqvOtXZDbhestEqwQXax/1n3/5TNvc5DICg=;
        b=rH2a5vMQQrOc2Oz84EC7Ad10ucaEuLToiy0QINv5K2fE6gwutAG+2GUxV+g8As+31r
         yUyvmIwHGobVGn1kkpcIW/tQX/sl3mulXBIYVRFvkeUOFyvemIqsDEZLdz8MtfVfsA51
         RzcotvLbP+QytYrvghQ0alFL1Wwvkh5lffk5d1+j5bR3N/fsakrsWr5dzc3+YiZovaNj
         AJeOAbpMWGZ1I2h9HruNHprO43UvDPuqP2N2bnfe6UFB5wonyZZtXEvExecQ8DfaDgnh
         tSdP6BaGRdPsIn7ynCNAwt6blz2l/T3o1lFLHaPXDN4UAUh7FHdEOnPR0A81+uDnZQIq
         S+ng==
X-Gm-Message-State: APjAAAXLTlfIDiiulIFTSI0lhljRXTMFgH+bW2VSAeQlvESuB9fjoH+6
        UjNSdO/ImS2iB9MhI42oOLvdyw==
X-Google-Smtp-Source: APXvYqyPW+JUeUyj8OH23+74Qvhhy6dvjThEquM3C2xwT+kZ++cix1fxH6nw1BxpuKzD+pif73Er/Q==
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr7672871lja.180.1565778000259;
        Wed, 14 Aug 2019 03:20:00 -0700 (PDT)
Received: from khorivan (168-200-94-178.pool.ukrtel.net. [178.94.200.168])
        by smtp.gmail.com with ESMTPSA id j4sm1605560ljg.23.2019.08.14.03.19.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 03:19:59 -0700 (PDT)
Date:   Wed, 14 Aug 2019 13:19:57 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Yonghong Song <yhs@fb.com>
Cc:     "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "bjorn.topel@intel.com" <bjorn.topel@intel.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "hawk@kernel.org" <hawk@kernel.org>,
        "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
        "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
        "daniel@iogearbox.net" <daniel@iogearbox.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/3] libbpf: add asm/unistd.h to xsk to get
 __NR_mmap2
Message-ID: <20190814101955.GB4142@khorivan>
Mail-Followup-To: Yonghong Song <yhs@fb.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "bjorn.topel@intel.com" <bjorn.topel@intel.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "hawk@kernel.org" <hawk@kernel.org>,
        "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
        "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
        "daniel@iogearbox.net" <daniel@iogearbox.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190813102318.5521-1-ivan.khoronzhuk@linaro.org>
 <20190813102318.5521-2-ivan.khoronzhuk@linaro.org>
 <05e5d15b-5ef9-b4dc-a76c-0d423fb2f15d@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <05e5d15b-5ef9-b4dc-a76c-0d423fb2f15d@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Aug 14, 2019 at 12:32:41AM +0000, Yonghong Song wrote:

Hi, Yonghong Song

>
>
>On 8/13/19 3:23 AM, Ivan Khoronzhuk wrote:
>> That's needed to get __NR_mmap2 when mmap2 syscall is used.
>
>It seems I did not have this issue on x64 machine e.g., Fedora 29.
>My glibc version is 2.28. gcc 8.2.1.

On 64 there is no the issue.

>
>What is your particular system glibc version?
>So needing kernel asm/unistd.h is because of older glibc on your
>system, or something else? Could you clarify?

It doesn't fix build issues, only runtime one on 32bits.

If no such inclusion -> no __NR_mmap2 definition - just mmap() is used ->
no problems on x64.

Is the inclusion -> no NR_mmap2 or is NR_mmap2 -> no problems on x64


-- 
Regards,
Ivan Khoronzhuk
