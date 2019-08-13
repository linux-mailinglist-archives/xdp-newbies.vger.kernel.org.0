Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8588C129
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Aug 2019 20:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfHMS7F (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Aug 2019 14:59:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37500 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfHMS7F (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Aug 2019 14:59:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id t14so279343lji.4
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Aug 2019 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0u7BN29CLMZnWfORCWS1hbiMyqbWKAOria45XT6FwOU=;
        b=mJtgPvGBhkUvHoKaycDfPjauZ+0YHZj65HimqLO5OuLOGR3snn7HnQgEaAoDS4vomC
         iU+m0UB3EgfX6iZSeiiQsrHp81onXlmYZIMT9gSwIAIKdWQ+h9Pe9cMsskki2GcA8j51
         kt2UdlZViy6wUGzVsvJlEn8sidFz+Vt7AGOMYI2yp/xaGApOUAbKYDUDhURCMEv4njsh
         16MmIp9a6IfZpMpY5xeIZxYCAh1DfBtb5gBQzeynZEBkOnODLiA/RaDXRZXTOjoTr+c1
         1spfNPE0Qi9kK+Vnkrsoo3NqAW/aq9hh+Umhw7uNMiODUc8ybgfp2scdfLnRdycvxPvX
         TQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=0u7BN29CLMZnWfORCWS1hbiMyqbWKAOria45XT6FwOU=;
        b=dROIYXXwWdUK2igo7f6ntjw3M8v+iMlRYi4++0kVxxDHBNna3wQq/WKhrPw+P9PCnE
         Iv3lsMfStLAtczqHVdi5KqUbrr5xdZEPGnB+7y4I7AvlRGDSevQS7SR/3Rn5DYnsDiTC
         1taVoLkBgJ1+w97pYjBfAt/yu3/o06xEW0DLWxZCdgVeE0z7jn4I74RZpBGGnoQV9jrt
         RfLJjiTRgWUrbMYcgMBniYH5dcgSBs79kJ6Vda8en03XzDQeUf+9gaqi7zW0RcnWVKpP
         DevmtsVOo3KWPwxSWB7xfF7tNiG0tQQc1PGQhjjvOxDEz7MjDpdCQE16tqCJF8CJlIZX
         QWEw==
X-Gm-Message-State: APjAAAWFeyf2GbunHGt9Tytm0dwHrOOEBL+dTjyXrMqKTQOdljY0XUSd
        DUS+m1Z6Bctw2kHYfgqQ1lXCQw==
X-Google-Smtp-Source: APXvYqyRXtsoKu9SnfFnRKyYvn6LAfLvigbsl0ZaoJ2liTJsIIoMtB6k54ODKD/0bftwhoAPbedMfA==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr8037467ljc.105.1565722743295;
        Tue, 13 Aug 2019 11:59:03 -0700 (PDT)
Received: from khorivan (168-200-94-178.pool.ukrtel.net. [178.94.200.168])
        by smtp.gmail.com with ESMTPSA id i17sm19868876lfp.94.2019.08.13.11.59.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 11:59:02 -0700 (PDT)
Date:   Tue, 13 Aug 2019 21:59:00 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Jonathan Lemon <jlemon@flugsvamp.com>
Cc:     magnus.karlsson@intel.com, bjorn.topel@intel.com,
        davem@davemloft.net, hawk@kernel.org, john.fastabend@gmail.com,
        jakub.kicinski@netronome.com, daniel@iogearbox.net,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        xdp-newbies@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 3/3] samples: bpf: syscal_nrs: use mmap2 if
 defined
Message-ID: <20190813185859.GB2856@khorivan>
Mail-Followup-To: Jonathan Lemon <jlemon@flugsvamp.com>,
        magnus.karlsson@intel.com, bjorn.topel@intel.com,
        davem@davemloft.net, hawk@kernel.org, john.fastabend@gmail.com,
        jakub.kicinski@netronome.com, daniel@iogearbox.net,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        xdp-newbies@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190813102318.5521-1-ivan.khoronzhuk@linaro.org>
 <20190813102318.5521-4-ivan.khoronzhuk@linaro.org>
 <036BCF4A-53D6-4000-BBDE-07C04B8B23FA@flugsvamp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <036BCF4A-53D6-4000-BBDE-07C04B8B23FA@flugsvamp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Aug 13, 2019 at 10:41:54AM -0700, Jonathan Lemon wrote:
>
>
>On 13 Aug 2019, at 3:23, Ivan Khoronzhuk wrote:
>
>> For arm32 xdp sockets mmap2 is preferred, so use it if it's defined.
>>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>
>Doesn't this change the application API?
>-- 
>Jonathan

From what I know there is no reason to use both, so if __NR_mmap2 is defined
but not __NR_mmap. Despite the fact that it can be defined internally, say
#define __NR_mmap (__NR_SYSCALL_BASE + 90)
and be used anyway, at least arm use 2 definition one is for old abi and one is
for new and names as their numbers are different:

#define __NR_mmap (__NR_SYSCALL_BASE + 90)
#define __NR_mmap2 (__NR_SYSCALL_BASE + 192)

, so they are not interchangeable and if eabi is used then only __NR_mmap2 is
defined if oeabi then __NR_mmap only... But mmap() use only one and can hide
this from user.

In this patch, seems like here is direct access, so I have no declaration for
__NR_mmap and it breaks build. So here several solutions, I can block __NR_mmap
at all or replace it on __NR_mmap2...or define it by hand (for what then?).
I decided to replace on real one.

>
>
>> ---
>>  samples/bpf/syscall_nrs.c  |  5 +++++
>>  samples/bpf/tracex5_kern.c | 11 +++++++++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/samples/bpf/syscall_nrs.c b/samples/bpf/syscall_nrs.c
>> index 516e255cbe8f..2dec94238350 100644
>> --- a/samples/bpf/syscall_nrs.c
>> +++ b/samples/bpf/syscall_nrs.c
>> @@ -9,5 +9,10 @@ void syscall_defines(void)
>>  	COMMENT("Linux system call numbers.");
>>  	SYSNR(__NR_write);
>>  	SYSNR(__NR_read);
>> +#ifdef __NR_mmap2
>> +	SYSNR(__NR_mmap2);
>> +#else
>>  	SYSNR(__NR_mmap);
>> +#endif
>> +
>>  }
>> diff --git a/samples/bpf/tracex5_kern.c b/samples/bpf/tracex5_kern.c
>> index f57f4e1ea1ec..300350ad299a 100644
>> --- a/samples/bpf/tracex5_kern.c
>> +++ b/samples/bpf/tracex5_kern.c
>> @@ -68,12 +68,23 @@ PROG(SYS__NR_read)(struct pt_regs *ctx)
>>  	return 0;
>>  }
>>
>> +#ifdef __NR_mmap2
>> +PROG(SYS__NR_mmap2)(struct pt_regs *ctx)
>> +{
>> +	char fmt[] = "mmap2\n";
>> +
>> +	bpf_trace_printk(fmt, sizeof(fmt));
>> +	return 0;
>> +}
>> +#else
>>  PROG(SYS__NR_mmap)(struct pt_regs *ctx)
>>  {
>>  	char fmt[] = "mmap\n";
>> +
>>  	bpf_trace_printk(fmt, sizeof(fmt));
>>  	return 0;
>>  }
>> +#endif
>>
>>  char _license[] SEC("license") = "GPL";
>>  u32 _version SEC("version") = LINUX_VERSION_CODE;
>> --
>> 2.17.1

-- 
Regards,
Ivan Khoronzhuk
