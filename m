Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15AD189D2E
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Aug 2019 13:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfHLLeg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 12 Aug 2019 07:34:36 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43508 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbfHLLef (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 12 Aug 2019 07:34:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id c19so73993103lfm.10
        for <xdp-newbies@vger.kernel.org>; Mon, 12 Aug 2019 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=IkqOR8n2+d0i33XDKFM1W8wAyFU3lbQkmsZ60SEYyPM=;
        b=f9vf1iLtiab+eHV3kZOQO62bnPIg2kpxRLOsLdE2aePP2MavO1FwnSfZTKU2gG1Vid
         FTSXW6pJnPelXkdyHDsD8HnaKbrZ8HBK1UrAEznDBMiKpWHgKIGy04tN/b/3O7U9FwxN
         RkELHnQEtDoNEU47ZI+JgZeawx6ZbBzPTqYu3d0adXTAmWT+6iTmJSi0qFzbLiM94EKR
         b1aOm9gYSrwfwhemeWN5g2PPwPKL9uwujCri85WIHhBMFRpsErG37m7EsTSDMq9v/XwW
         wwlYlwM5ARj1kSy+dG3Ew25OoxHrFFHqWWqlcwYDkH+ysW1WQUH6cwos+LR+g4T3K/Vt
         /7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IkqOR8n2+d0i33XDKFM1W8wAyFU3lbQkmsZ60SEYyPM=;
        b=Ud/qJmyn0Ne+efIFQkbwideQOJd15J7Z2DC3JuPmoNl3oncYgPpy7xokq7rt+PRz77
         My3CfQrIVYLSf5c2fah1rOqc5GgzdxKeMQag4iPC8Nl1f412GQfhz4203+2mJzwJpRSk
         CVnhi6TwnArd+J3iTWL8ig8ZlftcjtlCnzbPoHkWsiiOXUmWgFVMEhWwBSgLfxd9xWQH
         mD6ZSfDxxC2CuHsjrbd/aSC47YjoHL/tz4THWCwun2qa1HTZ/t9MF9uEf1V9YL2WK0wm
         Clp2PJ/zZjAlpFfNx60GnkoXliFiuIcXsPRGYpTyO/9k+k4MXj3onuwH58jhib1cBiPK
         ySDw==
X-Gm-Message-State: APjAAAV9NJ+wB0XpdLjsCYuhjFGeTTIl6Xi7qKn7vIP2NvAcLOONnysJ
        hYf+GGvd6BxmZ3O2CsQyQMgXTA==
X-Google-Smtp-Source: APXvYqzh1SErF8ryWdfIHPMHlE6ltaAF9sQ0IEXr2dph8iVua6PhVfFXYXM8qM4Dabgo4tBfsXhDBQ==
X-Received: by 2002:ac2:4157:: with SMTP id c23mr19159300lfi.173.1565609673727;
        Mon, 12 Aug 2019 04:34:33 -0700 (PDT)
Received: from localhost.localdomain (168-200-94-178.pool.ukrtel.net. [178.94.200.168])
        by smtp.gmail.com with ESMTPSA id a70sm20899745ljf.57.2019.08.12.04.34.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 04:34:33 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     bjorn.topel@intel.com, linux-mm@kvack.org
Cc:     xdp-newbies@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, ast@kernel.org,
        magnus.karlsson@intel.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH bpf-next] mm: mmap: increase sockets maximum memory size pgoff for 32bits
Date:   Mon, 12 Aug 2019 14:34:29 +0300
Message-Id: <20190812113429.2488-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

The AF_XDP sockets umem mapping interface uses XDP_UMEM_PGOFF_FILL_RING
and XDP_UMEM_PGOFF_COMPLETION_RING offsets. The offsets seems like are
established already and are part of configuration interface.

But for 32-bit systems, while AF_XDP socket configuration, the values
are to large to pass maximum allowed file size verification.
The offsets can be tuned ofc, but instead of changing existent
interface - extend max allowed file size for sockets. The 64-bit
systems seems like ok with this, so extend threshold only for
32-bits for now.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---

Based on bpf-next/master

 mm/mmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 7e8c3e8ae75f..238ce6b71405 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1358,6 +1358,11 @@ static inline u64 file_mmap_size_max(struct file *file, struct inode *inode)
 	if (S_ISBLK(inode->i_mode))
 		return MAX_LFS_FILESIZE;
 
+#if BITS_PER_LONG == 32
+	if (S_ISSOCK(inode->i_mode))
+		return MAX_LFS_FILESIZE;
+#endif
+
 	/* Special "we do even unsigned file positions" case */
 	if (file->f_mode & FMODE_UNSIGNED_OFFSET)
 		return 0;
-- 
2.17.1

