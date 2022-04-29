Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B286514ECE
	for <lists+xdp-newbies@lfdr.de>; Fri, 29 Apr 2022 17:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377778AbiD2PQ0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 29 Apr 2022 11:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbiD2PQZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 29 Apr 2022 11:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E3F3FD4C46
        for <xdp-newbies@vger.kernel.org>; Fri, 29 Apr 2022 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651245187;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=CIP4EjQlnEA4RLdFu7E8KFI2fhfpx2ToFF7pehAhFPQ=;
        b=f/fJ7yX0lrzGvSj0PqghOC+aEQhZhFjOVDpBgObJY2/GHR+1c6aM2qUoTGOHvjcuhsBlgh
        v2E38zKBCB9wL3MRqKTauYJMK+XW0FP460kkr7+vd58RDU+vqPKj5OCxRsJUeS8g13dQfX
        rwWT+GkhkFv3mAmGiFrcslHS8OM7Zeo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-_4sc2nSqMoq7EEeL-9d4lA-1; Fri, 29 Apr 2022 11:13:05 -0400
X-MC-Unique: _4sc2nSqMoq7EEeL-9d4lA-1
Received: by mail-lf1-f72.google.com with SMTP id a13-20020a19ca0d000000b0047233f64994so2802713lfg.14
        for <xdp-newbies@vger.kernel.org>; Fri, 29 Apr 2022 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :content-language:to:subject:content-transfer-encoding;
        bh=CIP4EjQlnEA4RLdFu7E8KFI2fhfpx2ToFF7pehAhFPQ=;
        b=5HB1HuqtePMGkf5411+x3L0Y1H//Oc8x3i4folBaEuTwSRuJZxBJ7GGomRv+GlLot7
         hsi0FZd7tUYka80fDPLK2C6H6GO5ksj69R4sPdChzbNGxT1BaIHBAmfHGScvrcFqIhIl
         n1MmJyIcG6wXz+Sr61tkrhghgwVMKadgsBZtI2xYVCNhkfRdyvwGoFTFnxSoECuApnO/
         7KIXfzgb7Ram0tmFjg4oQSA395+3zuptABBxJkRjbKlVCRkuckGIGq1W4wpez9XJ1N7H
         /0eFaS66hfAiBr5PvXgQT9uzMymM24FpZ2aMEiRMCC6Jppu73s24NOj1ta2KB6xf5HS+
         nnLQ==
X-Gm-Message-State: AOAM531/I5nsmhLaBtKRrVK6G0OcqflOq9fcgkYAW7bvLOxctGKFO7NF
        1Uz4BRcI8TSLakZdg4+R8Yb0XzAMwMOkO8PQ4qXhvuAeCgfehgFo9dDZIsOt5Dnq3ck3U/KefJ5
        GPTOzy9zSJrHPvj/ZTltC3wMOJESNHQ1X4hioAwhEWZ4AHVmCxaArIUJlHU9FAr+RRoE9ycBjcg
        ==
X-Received: by 2002:a2e:990e:0:b0:24f:19a0:acf5 with SMTP id v14-20020a2e990e000000b0024f19a0acf5mr12910592lji.438.1651245183884;
        Fri, 29 Apr 2022 08:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgBE/ujOVJ7KCp3AO9sh7NHC0ptiGs9sW52q8iMtk0gz536p6M3WvFlPbMBvP4S0b9cMeVjw==
X-Received: by 2002:a2e:990e:0:b0:24f:19a0:acf5 with SMTP id v14-20020a2e990e000000b0024f19a0acf5mr12910569lji.438.1651245183532;
        Fri, 29 Apr 2022 08:13:03 -0700 (PDT)
Received: from [192.168.0.50] (87-59-106-155-cable.dk.customer.tdc.net. [87.59.106.155])
        by smtp.gmail.com with ESMTPSA id p16-20020a056512313000b004722373eda4sm261132lfd.92.2022.04.29.08.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 08:13:02 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <e60747ef-e748-dcd7-7e3e-77b4ebc8b22d@redhat.com>
Date:   Fri, 29 Apr 2022 17:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Cc:     brouer@redhat.com
Content-Language: en-US
To:     Xdp <xdp-newbies@vger.kernel.org>
Subject: BPF related blogpost on network troubleshooting at Facebook
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi BPF-fans,

Super awesome BPF related blogpost[0] by Jakub "Kuba" Kicinski (one of 
the netdev kernel maintainers).

  - [0] 
https://developers.facebook.com/blog/post/2022/04/25/investigating-tcp-self-throttling-triggered-overload/

On how Facebook used BPF to troubleshoot a productions issue with TCP 
bufferbloat at high data-center rates, that caused CPUs to spin 100% in 
netstack NAPI processing stage.

I also loved their approach to implement CoDel in XDP for throttling the 
RX-queue (that were overflowing) at an earlier stage that netstack as 
the CPU was in a 100% overload state. They didn't share their CoDel BPF 
implementation, but I've added a link here[3] to my own code.


--Jesper

Social media links:
  [1] https://twitter.com/JesperBrouer/status/1520051491733712896
  [2] 
https://www.linkedin.com/feed/update/urn:li:activity:6925818081055289344/
  [3] 
https://github.com/xdp-project/bpf-examples/blob/master/traffic-pacing-edt/codel_impl.h

