Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B90C380BE8
	for <lists+xdp-newbies@lfdr.de>; Fri, 14 May 2021 16:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhENOfQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 14 May 2021 10:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbhENOfO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 14 May 2021 10:35:14 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC114C061574
        for <xdp-newbies@vger.kernel.org>; Fri, 14 May 2021 07:34:03 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id c10so12506111qtx.10
        for <xdp-newbies@vger.kernel.org>; Fri, 14 May 2021 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=IbJb/gikVoiu3eVyqyGLqOpbgfah9iSAjCqc50R5Z7M=;
        b=b2b4MD6KMeQtMRDyJnuR6eldblk3PkunESm0ICUcsqFiytamppTzzMm32GvL0HQPFl
         rtsButLsP10Aapo7sOMznvhdyUYanFD27o2mPfvWS4vVdl/rPPwMk6EGeLGBDmXktnHe
         HODpEecz8f7uag2b5UNF2NVREyRfM2V02cewSGzF0oG3vdsgKAWN40QhQZ2hwdfDMahU
         uRfd0Ev13MMGNhRqDGRYb9hpQl36efPuefN0/JVlUO1yD8zxSRdC1a5Yl5wJ/KyGKwCt
         oRKXoSKxBWUX78rRYN+ponG27/bPV/toAxLVGt3a7fvedtO5VdICNBu1Cu7cCE0UiMEv
         iORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=IbJb/gikVoiu3eVyqyGLqOpbgfah9iSAjCqc50R5Z7M=;
        b=YcJWIc7yPbYjEpWXVEc+ltaIYo/XR5Vn2e6lbHlDh3hKURO4Vx/dHYOrMqkVTTdNh8
         68Rl+sMtAvpqNhmPShAx8ogPM6sSTcHGnL3qHTjuRzBqxfuRQXormO7S6T4sMaepHpGx
         hjnW9K/d2k2kaqXL8sS3tVC90q8FTecDf2g/fcc3Yt7SVYlzBz4U8Ahx88vhleu+a81I
         WOXsSHud5z7AoBwC8oKGOQ0drAYsRKF0RDTcEsZDAdSiR2nAitrrw2/z5h0J61VEYe2M
         4gNsuPbpTFsi2Qna6QVF2cMo/+VfQ+ko6cZQaLu8Hgz34bouJv1rrWuDLrGxvnDjz1tS
         4lqQ==
X-Gm-Message-State: AOAM532aSofiVZqAs+GzlorkOkYwPq195dYvJJ8jOiiHh4KHR2CGr7Nm
        dH95C5ndwcaiq9ffEDCUQVwMVniSZq6aQA==
X-Google-Smtp-Source: ABdhPJwrT8/2MyC8FiipgyJSwLPMGncTTW1wUE+tqhQE5ClJJ3iEZI2zEwOck9SMeKOT2cLfmhgurw==
X-Received: by 2002:ac8:4447:: with SMTP id m7mr24115544qtn.55.1621002842737;
        Fri, 14 May 2021 07:34:02 -0700 (PDT)
Received: from ?IPv6:2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a? ([2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a])
        by smtp.gmail.com with ESMTPSA id s5sm4917854qkg.88.2021.05.14.07.34.02
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 07:34:02 -0700 (PDT)
Message-ID: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
Subject: Umem Questions
From:   Dan Siemon <dan@coverfire.com>
To:     Xdp <xdp-newbies@vger.kernel.org>
Date:   Fri, 14 May 2021 10:34:01 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I've been trying to work with large Umem areas and have a few questions
. I'd appreciate any help or pointers. If it makes any difference, my
AF_XDP testing is with i40e.

1) I use kernel args to reserve huge pages on boot. The application
mmap call with the huge TLB flag appears to use huge pages as I can see
the count of used huge pages go up (/proc/meminfo). However, the number
of pages used by the umem, as shown in ss output, looks to still be 4k
pages. Are there plans to support huge pages in Umem? How hard would
this be?

2) It looks like there is a limit of 2GB on the maximum Umem size? I've
tried with and without huge pages. Is this fundamental? How hard would
it be to increase this?

For both of these, I'd like to try to help make them happen. If the
kernel side changes are deep or large, it may be beyond me but I can
offer lab equipment and testing.

Thanks.

