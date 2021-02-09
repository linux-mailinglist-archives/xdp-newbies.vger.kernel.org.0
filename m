Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B418E314A59
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Feb 2021 09:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhBIIcp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Feb 2021 03:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhBIIcm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 9 Feb 2021 03:32:42 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB89C061788
        for <xdp-newbies@vger.kernel.org>; Tue,  9 Feb 2021 00:32:02 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id x10so2548277oor.3
        for <xdp-newbies@vger.kernel.org>; Tue, 09 Feb 2021 00:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=23pd72aFuHc0rQf8u5KpdCoZnNKB36zw8iRFQ8aU8XM=;
        b=YsdMw81HD0AGivhKgl9rp2u2+2x+zyfS2LOyJnUHioe0fIiFTmVqrZriBwDpRphala
         RDcg1bJwufL6UDCQOA7Li021ZP5ZIwh8KMqBBVwAEhZKazmZ5tWd+miZR8q0fMSs4ssP
         iszHS6ZTb/1UA06WDU/P/1dr/ENYzJRiqzn2EiMKaNwTZ+S3fhA5VM3HoNKIPm9AOGKM
         KOhG6KOOx87oe14mRD6eSrXPPH5q0dRCigtp98Hq6ASC92Ea6WCB/2ykCUTp1M81CP17
         jNHESUx6NE2mfaske8cFYmbMtt8gsfL3PefxEzXHc+QQi5g9jtSrZZCiuIqUhcO8i1bj
         iHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=23pd72aFuHc0rQf8u5KpdCoZnNKB36zw8iRFQ8aU8XM=;
        b=lZS+xIjAkYTtwAiAQcR/2wyQVAne8Blx+kWs8xBCfV861IsdC0Hto1JY+olXxp12qw
         A0zkBkgv+97CSg23VUIgzeBjGgeBIBsAcRMxYUISaNBvxV8LNrHuZN3eMf1ocf/LO7o8
         g3WYsq1KVQJldT/kNKFgqwhzmOMelQzEqOv4iIpRy7yl0rAWSo5snkPaxfOgx0RMt3AU
         UDA/9CdfaSCmwxI6XFNfjttMBvR3Il2Ae/yJErraSA8hd+iiaTk5rBCYLNnBla7blmt9
         OOzWqcPEsMBmSHk3y8U9wB9nAhHd5wgMH7mR2XnGLSiKIKd0JK6cvCKjOEw5AIFXTgqx
         I3DQ==
X-Gm-Message-State: AOAM532+x+c6xZcGXlILbtG4GfmfVH8Acf8+uUv9sZPOdzbPJuT8H0tJ
        ojH/GB6NwiQeTloi4C5sWkUcleuKSB2Bky2/1GY2N8zX9gCOzg==
X-Google-Smtp-Source: ABdhPJyO3XBicPJYNvUwm82YHAouheimwSOOd90x5/8Ock4jmz67GZI+E9IFti6Gz7t+HR1/FCYDm89lWlpM9nsEyTY=
X-Received: by 2002:a4a:3ed2:: with SMTP id t201mr4208153oot.89.1612859521499;
 Tue, 09 Feb 2021 00:32:01 -0800 (PST)
MIME-Version: 1.0
From:   Radu Stoenescu <radu.stoe@gmail.com>
Date:   Tue, 9 Feb 2021 10:31:50 +0200
Message-ID: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
Subject: Redirect from NIC to TAP
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi

Is it possible to redirect packets from XDP program attached in driver
mode to a physical NIC to a TAP interface?

The same works fine if the XDP programs are attached in generic mode.

Best
-- 
Radu Stoenescu
