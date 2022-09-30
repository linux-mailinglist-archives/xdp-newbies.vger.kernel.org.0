Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1CB15F0DA6
	for <lists+xdp-newbies@lfdr.de>; Fri, 30 Sep 2022 16:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiI3Ofi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 30 Sep 2022 10:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiI3Ofg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 30 Sep 2022 10:35:36 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E582F3C5D
        for <xdp-newbies@vger.kernel.org>; Fri, 30 Sep 2022 07:35:13 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id n192so3402396iod.3
        for <xdp-newbies@vger.kernel.org>; Fri, 30 Sep 2022 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SOM0sMbrqhQz/WfuiD9go87B+yevdImpLnR4Oiboehw=;
        b=TtbVtmqyB8LdDu3PELorRl03p7Obw3oL3+FZp65FZAIfOZlrWlkvqZ8E77XinL4yZF
         TTgo+yOsjf7WDAXrdowFKBfVbboZT8wznYhG+ct4dUGjOxRjQZdBv0ENgXiucdo99qpz
         RGJCVMIp45ptkQxvjo//HtKD8ygxhGICOL2LpJ4aAwD6EBhGdf9tuAxF1bjbWlTZ6BFP
         CUTDNuJmuTb/NSYxfK1wYBlOavgH8ql7NsvQ7CvDAVTWV0Z+562Yg4kPUy8nOhaJyTgW
         qah/JmI3IT621Pym+iwio2e2mt2XuU3ClfQVLQRHFJ4WQtc20ecv7H5mMbycnbQfFIPa
         HBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SOM0sMbrqhQz/WfuiD9go87B+yevdImpLnR4Oiboehw=;
        b=lpPzJI0XNVHhg/n4INdODy7qzEgXdSGo3KYiDn7vjXSegKm49qIYE6Hb+QkKCeNbS3
         w4cSTFnfn/kmB/HK6gurGwTEiS5OpLhyiwDes/YQExjJKxf/TBXSHFKEIagRvliW1GwV
         4Ux3VKpqJ+MhLoZ5rFPPXQOw3DmtCiK8RoFzIuxviMc3A+PW2ufINij5K0DZgTx6w49P
         ahnaA8uMc3bFVWhmDxowXeNwzWCUh4BEIhK+td42+cUDdFEMf5aATr2tR2Bx/Xw4i2ls
         T0J0dksjnHIl/IuVLOfXZKih3Hl5RdaRtM6R/nF02TREUUuSio+Vz4z+h3ZOLf8bZhUt
         TnNg==
X-Gm-Message-State: ACrzQf0RTGVwJUxEGXCLxRq3YiVac6Cko18urJE5ivmHca2f+gnyioV4
        modo7avB3wnrjAx37hErUNCw5nn9A7j63g==
X-Google-Smtp-Source: AMsMyM43OwOsZ8pGl6Qif1g83yth3WoP3qnz1bbcj9QYCMg6OL0hB2kTMnZIdLvdYVx0TxgnofQ4YA==
X-Received: by 2002:a05:6638:448d:b0:35a:81aa:939d with SMTP id bv13-20020a056638448d00b0035a81aa939dmr4670124jab.312.1664548512652;
        Fri, 30 Sep 2022 07:35:12 -0700 (PDT)
Received: from ?IPV6:2601:282:800:dc80:75a0:fca2:49e5:d109? ([2601:282:800:dc80:75a0:fca2:49e5:d109])
        by smtp.googlemail.com with ESMTPSA id d2-20020a92ddc2000000b002f8e24577ebsm984190ilr.83.2022.09.30.07.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 07:35:11 -0700 (PDT)
Message-ID: <7b051cc3-04ef-5969-d79a-81dc7dae06a8@gmail.com>
Date:   Fri, 30 Sep 2022 08:35:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: traffic redirection and tapping
Content-Language: en-US
To:     Henning Fehrmann <henning.fehrmann@aei.mpg.de>,
        xdp-newbies@vger.kernel.org
References: <YzWyFYccrHxKGsrQ@mephisto.aei.uni-hannover.de>
From:   David Ahern <dsahern@gmail.com>
In-Reply-To: <YzWyFYccrHxKGsrQ@mephisto.aei.uni-hannover.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 9/29/22 7:56 AM, Henning Fehrmann wrote:
> Is there any chance to improve the ringbuffer output?
> Or could I get the packets onto disks in any other way using bpf helper
> functions? Do I need to gather more or other information?

you can't do any packet copies in the datapath, and right now there is
no other option - perf buffers and bpf ringbuffer both require copies.

To maintain data rate you need a second server and span the port at the
switch.
