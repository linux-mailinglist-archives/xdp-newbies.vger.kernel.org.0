Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663161E012C
	for <lists+xdp-newbies@lfdr.de>; Sun, 24 May 2020 19:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387762AbgEXRfy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 May 2020 13:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbgEXRfy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 May 2020 13:35:54 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0967FC061A0E
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 10:35:54 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id v4so12339322qte.3
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7DZWtVSj7KuhvihBEq6j5wEVcR3QG0ZSz5zRJufMxQM=;
        b=CpecwuOYci7u1U5RHKT2swxJPXja+9zaQwiXskBhCDTDHI2za8/KwUglDV40fI802T
         OgqtGmZjlQ9sDABMclKrJ4FrfqQEXZWlxe60Lp9dodJuGbM6OLzmCxI9wljloSJfQhb+
         zAns5PYtaCziGCHaoXd5xcqaQxBaEHY9A6MBHEzZoOVbfHwD8yBKlT5RFwFe6kMiWRlN
         uAIBqZzYIlGPcFuPfJnLA2RL+ZJUhrL2PFzua0DetbEGpaERXICNQrUpceMXuneRVSid
         0xUSY54BESJcst+BuAjKn4uzeHVP6WxnJR4lxL3Srm7z7FKI41+1hjoyafFqrJdAUyvU
         D+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7DZWtVSj7KuhvihBEq6j5wEVcR3QG0ZSz5zRJufMxQM=;
        b=r1Flog50RPsnYDAOylChIWPnG3AuocHSUINd33UEOoWYdSi6nx7KQ1bvZI/MS02Kkv
         SNUOLjnxTPmPbef+7BdbrNSb8/VHHlayxTWlnQFzCwXHk4at98aDNf9vhfx+o2Tr7SCB
         VumRUA5VDzSsDASgwjdRoI35WWivRFs7O8laUar5dFtE3JnhlFowe/dfp1yRZoPO680x
         VCr0SUtU80MGHaAMt+vIhsjot42HmgdNZcxcrhf74qZ4JYFt034uJY55GIP1weOStuIQ
         Pw3rPr28b1UCvNQ2OBLHo/cg9Xkm+CWARvB5CZGMHySyj+iwlZul4gyhK5DAXDk12Ne+
         KuUw==
X-Gm-Message-State: AOAM530DgPnMRmQaRWKpYY5dpqLXlCt1AF2hF8eb2BGh1Akv2jFrcKUa
        A76bLmK33+3ixGohoSVlhhHSNwdq
X-Google-Smtp-Source: ABdhPJyKY/pFN8e+Or7cwSx5lQjVh4KbKZbe3xxojucvmEllW3h+F4r7LgBK9AOwDnX1WOYO5RO6KQ==
X-Received: by 2002:ac8:36c8:: with SMTP id b8mr23029665qtc.212.1590341753099;
        Sun, 24 May 2020 10:35:53 -0700 (PDT)
Received: from ?IPv6:2601:284:8202:10b0:dde6:2665:8a05:87c9? ([2601:284:8202:10b0:dde6:2665:8a05:87c9])
        by smtp.googlemail.com with ESMTPSA id k190sm12241421qkf.40.2020.05.24.10.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2020 10:35:52 -0700 (PDT)
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
To:     Christian Deacon <gamemann@gflclan.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
 <20200522175136.5a6fdc55@carbon>
 <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <6709130c-a676-127d-ac9d-d0ab35397b0d@gmail.com>
Date:   Sun, 24 May 2020 11:35:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 5/22/20 10:12 AM, Christian Deacon wrote:
> Hey Jesper,
> 
> 
> I apologize for not providing that information before. The driver is
> `virtio_net`. Unfortunately, I'm not sure what the NIC driver on the
> cluster is. Once my program's code is confirmed to be correct, I will
> try reaching out to our hosting provider to see if they can provide this
> information if the NIC's driver is the suspected cause to this issue.
> 
> ```
> 
> root@SEAV21:~/AF_XDP-Test# ethtool -i ens3
> driver: virtio_net
> version: 1.0.0
> firmware-version:
> expansion-rom-version:
> bus-info: 0000:00:03.0
> supports-statistics: yes
> supports-test: no
> supports-eeprom-access: no
> supports-register-dump: no
> supports-priv-flags: no
> ```
> 
> 

Is this a 4-cpu VM or 8 cpu VM?

A previous response had:

root@SEAV21:~/AF_XDP-Test# ethtool -l ens3
Channel parameters for ens3:
Pre-set maximums:
RX:             0
TX:             0
Other:          0
Combined:       8
Current hardware settings:
RX:             0
TX:             0
Other:          0
Combined:       1

The 8 for pre-set max says the nic has 8 queues. If it is a 4-vcpu vm,
then try

ethtool -L ens3 combined 4

which leaves 4 for xdp. If it is an 8 cpu VM I believe you are out of
luck given current requirements.
