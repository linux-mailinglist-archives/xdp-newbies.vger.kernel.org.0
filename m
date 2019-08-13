Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBFC58B373
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Aug 2019 11:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbfHMJMe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Aug 2019 05:12:34 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37829 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfHMJMe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Aug 2019 05:12:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id z28so46654220ljn.4
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Aug 2019 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fqm1qEXgId3LWA2NcOGNLytQeIXWcu4whGK205OK+oE=;
        b=hfRt+z+D9yk1sJYudtDMXBHyY6D+2qiqV/Q0A5uC517NkQfhn84w03CEm+CUmcg/YO
         xJPqvrGgLs16lDH/3dloHHlkGbp2h3r9rIgnDvmKfVTplppEulAeS2WQtVGZ8wWFs15M
         R5qBYokxyKXI2Jfql/W33mwqvH+OuFprJVGNGTsHQu5VItj8aJMS6Ur6rJYb6Hy7WRn/
         AX4hDuDNWmPdJr+yZFLhP6VsHFefhVLaK4WsyRhEk2D+tu0eVkerETdtQ8N8zpk4CR7G
         z7+Z3ORP+em5lWvkHic+zqfbFKZVaZBuXDwrPHPXLdvyLr95YD3Zita8cZ6CQHogX55V
         lS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Fqm1qEXgId3LWA2NcOGNLytQeIXWcu4whGK205OK+oE=;
        b=K16vR4HqINdl1GAvzEjb8++Q3AVPr/xG1VOvvJkyp5uc7LbNBAeabOqSjwsGHqjTjc
         vXNuJRBK8ryGSeEW1AbTsk2f4IofylYXxeUUylUbX0ybnSyvlQHb6hRRXyGXW09UEYOd
         cRYHgx42yNjUwj8Va96OrTaR9xiKobmoz/GhOyo7NIaB5hXFwUFvm+gpmMiwhsfE8rta
         yHeq74vGdMELNNTzZmDXeKe7rfw44wU+MGwqWQd/oCdbepRoyqZyTtY0WRvT0I5sPrZy
         Mohj3XflktQ0ofqnKD9+cx0RJ/IZK6PunBrfrXk+T3jL9/1N3X0wQavIWR2dfpAp1jwH
         US0w==
X-Gm-Message-State: APjAAAWOWr0smXi951v0As7Dk3Knz50ZC6WSfH/wgG9gMaUnJ2QWIx0Q
        nSNxYoiAw1c1jjXKCRz+Gd/v/A==
X-Google-Smtp-Source: APXvYqyEmjV0GBixJh0DVshdyHJJIKyBEfQHcoHLxMsbb6J1S0HM71TOzoTAcNAvNIqYowflXLcs+w==
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr20948011lja.220.1565687552537;
        Tue, 13 Aug 2019 02:12:32 -0700 (PDT)
Received: from khorivan (168-200-94-178.pool.ukrtel.net. [178.94.200.168])
        by smtp.gmail.com with ESMTPSA id l23sm21497274lje.106.2019.08.13.02.12.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 02:12:31 -0700 (PDT)
Date:   Tue, 13 Aug 2019 12:12:29 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
        linux-mm@kvack.org, Xdp <xdp-newbies@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, Alexei Starovoitov <ast@kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Subject: Re: [PATCH v2 bpf-next] mm: mmap: increase sockets maximum memory
 size pgoff for 32bits
Message-ID: <20190813091228.GA6951@khorivan>
Mail-Followup-To: Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
        linux-mm@kvack.org, Xdp <xdp-newbies@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, Alexei Starovoitov <ast@kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
References: <20190812113429.2488-1-ivan.khoronzhuk@linaro.org>
 <20190812124326.32146-1-ivan.khoronzhuk@linaro.org>
 <CAJ8uoz0bBhdQSocQz8Y9tvrGCsCE9TDf3m1u6=sL4Eo5tZ17YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJ8uoz0bBhdQSocQz8Y9tvrGCsCE9TDf3m1u6=sL4Eo5tZ17YQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Aug 13, 2019 at 10:02:54AM +0200, Magnus Karlsson wrote:
>On Mon, Aug 12, 2019 at 2:45 PM Ivan Khoronzhuk
><ivan.khoronzhuk@linaro.org> wrote:
>>
>> The AF_XDP sockets umem mapping interface uses XDP_UMEM_PGOFF_FILL_RING
>> and XDP_UMEM_PGOFF_COMPLETION_RING offsets. The offsets seems like are
>> established already and are part of configuration interface.
>>
>> But for 32-bit systems, while AF_XDP socket configuration, the values
>> are to large to pass maximum allowed file size verification.
>> The offsets can be tuned ofc, but instead of changing existent
>> interface - extend max allowed file size for sockets.
>
>Can you use mmap2() instead that takes a larger offset (2^44) even on
>32-bit systems?

That's for mmap2.

>
>/Magnus
>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>> ---
>>
>> Based on bpf-next/master
>>
>> v2..v1:
>>         removed not necessarily #ifdev as ULL and UL for 64 has same size
>>
>>  mm/mmap.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index 7e8c3e8ae75f..578f52812361 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -1358,6 +1358,9 @@ static inline u64 file_mmap_size_max(struct file *file, struct inode *inode)
>>         if (S_ISBLK(inode->i_mode))
>>                 return MAX_LFS_FILESIZE;
>>
>> +       if (S_ISSOCK(inode->i_mode))
>> +               return MAX_LFS_FILESIZE;
>> +
>>         /* Special "we do even unsigned file positions" case */
>>         if (file->f_mode & FMODE_UNSIGNED_OFFSET)
>>                 return 0;
>> --
>> 2.17.1
>>

-- 
Regards,
Ivan Khoronzhuk
