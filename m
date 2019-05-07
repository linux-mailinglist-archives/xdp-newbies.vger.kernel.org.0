Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB053162D1
	for <lists+xdp-newbies@lfdr.de>; Tue,  7 May 2019 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfEGLbf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 7 May 2019 07:31:35 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:55847 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGLbe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 7 May 2019 07:31:34 -0400
Received: by mail-wm1-f43.google.com with SMTP id y2so19678345wmi.5
        for <xdp-newbies@vger.kernel.org>; Tue, 07 May 2019 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=QjMXMsSSirdUYoTUuJO+JEDtUnxzPrM5xgigZEkLnYQ=;
        b=RqOFfDSYdz/H0bcGfdSjaCVDatHo8QOFl9VXt50M2D3B0Pl2xxxi0898C7GyYi3zx/
         wgaHMiv4lbloz8y3chMJwbSDG05DUC/zjhHpvhcyQZDee25CFO4zB5a9nkeQgBhO/UA+
         uz4qOSyAlE8agjyZOCgxdu7k5YhSui3vUYd58viRzWH88/Yfw++XsNAC4vTs/fIbhuY3
         4UgDvzWCoOFnH8shxy0lBiaS8kLsM+mqqpqSy0KPVcMz0P8R/ltcUzh1iGkEGoBDM3ia
         JYSUT2PH9o098h+nPMGyncOBu6+MU350F3EscT3UIFI0IE/B34or+gy5PQm+Y6966eef
         /4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=QjMXMsSSirdUYoTUuJO+JEDtUnxzPrM5xgigZEkLnYQ=;
        b=NIYQsYHhwBi3FdhwuwstOnvTrG2pwQIAj2c5MR+AFSRc64NQ+Amc51mfpI3BDofhXl
         m4ByTxKtj38/cTRxkDpC2w1vPd87sWjBMHszgmwMvE828erYlOi7jeaJImX3ritDuLuG
         JyNqzHG6sn5ZWW17bn7dM6Bf63GCcN1fU+BnHljjosG6LvAlrJoh4u7fka3TkorohoLk
         eLc93jPY23TwROS9dzwlOKcQaMkBQHVW762ttoGvxkEjiFdwej65rDjf44cyRv9xYCCb
         UcB4xstpyQCijk9jc62RTh0p0o43/gzCwRLwKs4z1bXdv/F4/yKWqhFJostUV35wgJdD
         /2KA==
X-Gm-Message-State: APjAAAW0nXLl3bdqO7zSStPI297x4DWj4+t9ZCk5QtO5VI0NUvoAf7g8
        rjjyLsM0gLPRFi3k3l0IWfQ8wg==
X-Google-Smtp-Source: APXvYqzpk9v6VfYXiGQLaQXAPP9u1YxXM4HVm7/pNclsGOb/OESBsJfjNuMH+hELgSYpImHipKwfHA==
X-Received: by 2002:a1c:cf83:: with SMTP id f125mr19275746wmg.96.1557228692779;
        Tue, 07 May 2019 04:31:32 -0700 (PDT)
Received: from LAPTOP-V3S7NLPL ([217.38.71.146])
        by smtp.gmail.com with ESMTPSA id m25sm12848005wmi.45.2019.05.07.04.31.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 04:31:31 -0700 (PDT)
References: <673b885183fb64f1cbb3ed2387524077@natalenko.name> <87mujzutsw.fsf@netronome.com> <4414f1798ea3c0f70128b7e4caa14edc@natalenko.name>
User-agent: mu4e 0.9.18; emacs 25.2.2
From:   Jiong Wang <jiong.wang@netronome.com>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     Jiong Wang <jiong.wang@netronome.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        oss-drivers@netronome.com, linux-kernel@vger.kernel.org,
        xdp-newbies@vger.kernel.org, valdis@vt.edu
Subject: Re: [oss-drivers] netronome/nfp/bpf/jit.c cannot be build with -O3
In-reply-to: <4414f1798ea3c0f70128b7e4caa14edc@natalenko.name>
Date:   Tue, 07 May 2019 12:31:29 +0100
Message-ID: <87ef5abiwe.fsf@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Oleksandr Natalenko writes:

> Hi.
>
> On 07.05.2019 00:01, Jiong Wang wrote:
>> I guess it's because constant prop. Could you try the following change 
>> to
>> __emit_shift?
>> 
>> drivers/net/ethernet/netronome/nfp/bpf/jit.c
>> __emit_shift:331
>> -       if (sc == SHF_SC_L_SHF)
>> +       if (sc == SHF_SC_L_SHF && shift)
>>                 shift = 32 - shift;
>> 
>> emit_shf_indir is passing "0" as shift to __emit_shift which will
>> eventually be turned into 32 and it was OK because we truncate to 
>> 5-bit,
>> but before truncation, it will overflow the shift mask.
>
> Yup, it silences the error for me.

Thanks for the testing.

I have also reproduced this issue after switching to gcc 8.3, and confirmed
the error is triggered from "value too large for the field" check inside
__BF_FIELD_CHECK due to immediate "32" is out of range for mask 0x1f.

Will send out a fix.

Regards,
Jiong
