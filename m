Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63426E0C79
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Apr 2023 13:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjDMLbU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 Apr 2023 07:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjDMLbT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 Apr 2023 07:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D03975A
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Apr 2023 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681385427;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AFRCYjm2Twz3J16D0m8836m89Rw0mCeSvdjQ4gi7+2c=;
        b=X+wPC9bADm1up7y5AAau9+LNUyvvli6GrZqyhBO4NMWgiN8telLrI+HIkjYXMjApDPJ2WB
        hjI6wTbErKZ08Vv+IhgJw6OY8zL9LDk2edwUlAxiP5Efcz90SIbKWTVfPFasURM31lFNDp
        xgZtKZSF1BwizIMAhq/GT6vk8uAWL+U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-46LEWdmRPi-MCZ0F8x40mg-1; Thu, 13 Apr 2023 07:30:26 -0400
X-MC-Unique: 46LEWdmRPi-MCZ0F8x40mg-1
Received: by mail-ed1-f69.google.com with SMTP id i17-20020a50d751000000b005045c08ca6dso10882943edj.7
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Apr 2023 04:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385424; x=1683977424;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFRCYjm2Twz3J16D0m8836m89Rw0mCeSvdjQ4gi7+2c=;
        b=CNYZiNROq8DVDdU545GqpKBsoTRPBS9lu3iQfXXJD4mICQZTV0A3yP2NQ9AAQq89xD
         HqGohBd3ihMXdTN5qdrWDJXLMwn4qGhWBRxL49T4rdyt36f1BBH03ptwlL3USFs1naP9
         +IUGqtSgOum5woRtuRzpVTW8V1iA3YPpMjVor9BREfJ2VqdUpfn+uEawvqF+kWtnfs9+
         dgmyWdg+EuJLWxK4L1KvHtkm9PSxycOUkjwZcEgfH3dBXsRq/oyUFFKXM3cLXeuPyNDX
         ydf5ZbmBB5EW+bEy2IsIXphTsz1cMleUHF+gwbWPmCnGP4/wbSSWOxoWMhFdriabp0WW
         W1GQ==
X-Gm-Message-State: AAQBX9cG6Lf6r++13An2Fz9FHw3rgCo3u+OJ1x3mk55Yfg7f4HElCGII
        hckW+bnPqwOte/wyB0FppIkEaW+h8jImM3BmCZ9J/DOGWcoYjrI7fRtWnCfP/xNRnA7e39ZJ3Dl
        QdQLif9D2Tg3S1ZZVJQcSBKg=
X-Received: by 2002:a17:906:5a95:b0:94e:6921:af2c with SMTP id l21-20020a1709065a9500b0094e6921af2cmr2711409ejq.0.1681385424777;
        Thu, 13 Apr 2023 04:30:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZqCYWQCqoXLe9UYRl6yTdWPsEDt3HoomEX1BMOz4HwRa6QmVLyP/Bzmw/tZWmfyLrZLoL4jA==
X-Received: by 2002:a17:906:5a95:b0:94e:6921:af2c with SMTP id l21-20020a1709065a9500b0094e6921af2cmr2711386ejq.0.1681385424417;
        Thu, 13 Apr 2023 04:30:24 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net. [194.45.78.10])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b00932fa67b48fsm842301ejb.183.2023.04.13.04.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 04:30:23 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <d2ea2dee-1be5-8211-dcd1-b1dded91c182@redhat.com>
Date:   Thu, 13 Apr 2023 13:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc:     brouer@redhat.com,
        Srinivas Narayana Ganapathy <sn624@cs.rutgers.edu>,
        Tariq Toukan <tariqt@nvidia.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Question about xdp: how to figure out the throughput is limited
 by pcie
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Qiongwen Xu <qx51@cs.rutgers.edu>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>
References: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
 <b8fa06c4-1074-7b48-6868-4be6fecb4791@redhat.com>
 <CH2PR14MB3657EF09F9A2BE7C08E4C9DBE3989@CH2PR14MB3657.namprd14.prod.outlook.com>
 <7C8EC844-D2DF-4980-A178-30E2719E3575@cs.rutgers.edu>
 <87fs94118o.fsf@toke.dk>
In-Reply-To: <87fs94118o.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 13/04/2023 13.16, Toke Høiland-Jørgensen wrote:
> Qiongwen Xu <qx51@cs.rutgers.edu> writes:
> 
>> Hi Jesper,
>>
>> Thanks for the detailed reply and sharing these helpful
>> materials/papers with us!
> 
> (Please don't top post on the mailing list).

+1

>> After enabling rx_cqe_compress, the throughput in our experiment increases from
>> 70+Mpps to 85 Mpps. We also tried to use the counter "rx_discards_phy". The counter
>> increases in both cpu-limited and pcie-limited experiments, i.e., in the experiment
>> which is only cpu-limited can also increase the counter. We are looking for any
>> counter that can separate cpu- and pcie-limited cases. Regarding the [pcie-bench] tool,
>> unfortunately, we are not able to use it, as it requires fpga hardware.
> 
> Well, are your CPUs being maxed out? IIRC it was pretty obvious that
> they weren't when we were running those tests, so just looking at
> something like 'mpstat' should give you a hint. 

As you can see in[1] I find this mpstat command very useful:

  $ mpstat -P ALL -u -I SCPU -I SUM 2

The tool turbostat will also tell you how busy individial CPUs are.


> For more detailed analysis you can use 'perf' to see exactly where
> the CPU is spending its time.

Again a practical hint.
Perf record with cmdline:

  # perf record -g -a -- sleep 10

Look at results with cmdline that also expose the 'cpu' info:

  # perf report --sort cpu,dso,symbol --no-children

Look at a specific CPU e.g. core 3 (counting from 0) with cmdline:

  # perf report --sort cpu,dso,symbol --no-children -C3

--Jesper

Links:
  [1] 
https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench02_xdp_drop.org#test-100g-bandwidth

