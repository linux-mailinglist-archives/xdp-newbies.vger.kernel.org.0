Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301EA3B09DC
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Jun 2021 18:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhFVQGJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 22 Jun 2021 12:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFVQGI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 22 Jun 2021 12:06:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3820C061574
        for <xdp-newbies@vger.kernel.org>; Tue, 22 Jun 2021 09:03:51 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id y7so24199839wrh.7
        for <xdp-newbies@vger.kernel.org>; Tue, 22 Jun 2021 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=J2UEOOiqRhhh21SDNU+oqP9GXhfBvYKSNyEUPQeiWvUL8jFrTHhW1mVMXKPu9dSBsN
         9+vgwVcsAo+Ku14ZyFKC/zhciufrRP9HwqmS8PQMviZsnD5bUU7D3gc+/MzfgX1VV5Ic
         VTSYpy6oOL0IhURF4Z6xUQnYzQx5J83zwuaQJyQHVcPDbb4D6nMy/M7DQR9sndD1I4g4
         7yl23dDe9YzPS1OxMo/8eC1mIXJ3iFKAEKx/osPp1sd3WqYxiyKL6jSLvB1QmsSIKQfr
         NrTbTSsp3PBAK5iYPJEcWOpyc/dnmZxmRUPXta9KsscQn8LFgz5kFwSOyDPHSn08Bf6t
         b1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=X8ampOLpRBzFpF18kPYm6sE3PsfFoYNoL6Ws2WPu+6PYpM6Q/JU72hbpuBlYBvFxUH
         09o8qrT6txqRIRNTugGbONUoyLgYvV6q/J7TUxrY6fpuyrYGUsr8fNHKidpQUDgFztGz
         rVqMrabLmdoJ3eS1m17UH8ASahV8kt5VmK6cqjRyRDstb1CR1JGT4s5Vw/EoBSK1LZbN
         ZGMBjfSjoU0wqQNgIvvjnahkoxxIfOmQL8fqVZCapeXLP+9asmL9b6nUwOMza3YX+f8R
         hN2hACTHvJ7nLlb95QVOBcRrYegN/TmDG488ZmSCycrLnZIkj+Ws5WFSHwWkQ2IPTcwh
         cdvg==
X-Gm-Message-State: AOAM530TlR2Rbm9ohdirq7OodRyet/lT1CkKLmBZhZlMTiAO+c7QApHV
        OPc5RO+RuRoWgrvhd5Ua0wRLMZJPbLFHQw==
X-Google-Smtp-Source: ABdhPJzxcLVrj6xSYqkkBA1yN07qNfdgURWOm2RdxU+++v9WGqDecii8Akbx3T+CxB2hCMZZpyVS2A==
X-Received: by 2002:a5d:4a91:: with SMTP id o17mr2053329wrq.335.1624377830085;
        Tue, 22 Jun 2021 09:03:50 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:9d54:2900:9e8:6d62:9375:e905? ([2a01:4b00:9d54:2900:9e8:6d62:9375:e905])
        by smtp.gmail.com with ESMTPSA id y14sm15399759wrq.66.2021.06.22.09.03.49
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 09:03:49 -0700 (PDT)
To:     xdp-newbies@vger.kernel.org
From:   Alireza Sanaee <sarsanaee@gmail.com>
Message-ID: <375049f4-f3b0-14e1-696b-f777377e8a5b@gmail.com>
Date:   Tue, 22 Jun 2021 17:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


