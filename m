Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3427A3A221
	for <lists+xdp-newbies@lfdr.de>; Sat,  8 Jun 2019 23:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfFHVTz (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 8 Jun 2019 17:19:55 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:34962 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbfFHVTz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 8 Jun 2019 17:19:55 -0400
Received: by mail-pf1-f181.google.com with SMTP id d126so3102924pfd.2
        for <xdp-newbies@vger.kernel.org>; Sat, 08 Jun 2019 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Z85FVM9F3rsOnqiPh2XWkohB2FCzloIU7OWy16wPEgo=;
        b=V2MNMpG9crZlzzqd3L1beAiyjPOcu63EFM2eGWjuRiQIuFr8IsoAABtFdsmPok8YxM
         mMR6X/LNXFIspIatY8xlCcc19O/pOU6BN6WVzgO4TjnBiIPDJ8AD3E6Pp2hOXiOx2+5O
         HU6oWHaKFSUtWx9AAIY/u0unK2B+F4d9iYQw0bRL8Cxw7nvBvae/4ZAA6vQuD8QtDUTb
         0hNV/mnHbxfXR/eJckr3saBMrbnqYWcE9kr+lvVi2F0i7Eq7naJSuueYz8ZsTZqy68RV
         oqyMp/WBvsFF7dybpMUbJUlte9/uACmlWOiBkfnC87YBnrk9dCsQbiQwgsr1yaabBSc6
         JLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Z85FVM9F3rsOnqiPh2XWkohB2FCzloIU7OWy16wPEgo=;
        b=AgkiZVJzi80ftKP91aCa+Oo8V13Skc6MQgAOUdGZ1NeZ3CmWojgbnKidJy/pDUCyWV
         cnwKF23/kEQAfklwoyTnYCxasz5V54J8/J4D+5ahz46bgHNO38pICcnYSRA/NcG8uzsn
         E4d9S3+id4j4PwHW1nVHzlZUkacWB2YmpVnJUUU7SiIC6uU0u8OrrigZ7q88Dt2uWsIn
         tVODpziIWuCiMHA31fnxT0Gj1yK2+zu1sSbjGLe/pniLRrtBfJEOcnkIltTlxObeA9Cs
         s49mBkhiAe5jTg6WM/oNYOV2Eyd6pDHf0fH31ieoUQN7WxxWudvTcsNSRwL3tccC3L78
         3MfA==
X-Gm-Message-State: APjAAAXJY9XunA40dSfzHsngzYgKhzygsCfdCYbYMbMrGi3ho0voumim
        QYRb4NJwr3b0ichGP6fNLJiomQ==
X-Google-Smtp-Source: APXvYqxyyRuZl2kbZvb1efHbTRfREGMQt/uJB66+pMArMlhpWAYH/M6zAUzn6OxE/Wu8vwebDXh8Tw==
X-Received: by 2002:aa7:8d43:: with SMTP id s3mr66057221pfe.5.1560028794345;
        Sat, 08 Jun 2019 14:19:54 -0700 (PDT)
Received: from cakuba.netronome.com (cpe-76-172-122-34.san.res.rr.com. [76.172.122.34])
        by smtp.gmail.com with ESMTPSA id b15sm6421078pfi.141.2019.06.08.14.19.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 14:19:54 -0700 (PDT)
Date:   Sat, 8 Jun 2019 14:19:48 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     William Tu <u9012063@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "<dev@openvswitch.org>" <dev@openvswitch.org>
Subject: Re: AF_XDP with QoS support question
Message-ID: <20190608141948.65e77b75@cakuba.netronome.com>
In-Reply-To: <CALDO+SZ_y2crYSXGtFxQtk8zZz2X=Fr-rJTPr_zm6rbtD8h9iQ@mail.gmail.com>
References: <CALDO+SZ_y2crYSXGtFxQtk8zZz2X=Fr-rJTPr_zm6rbtD8h9iQ@mail.gmail.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 7 Jun 2019 19:55:34 -0700, William Tu wrote:
> Hi,
> 
> When using AF_XDP, the TC qdisc layer is by-passed and packets go to
> userspace directly. One problem is that there is no QoS support when
> using AF_XDP.
> 
> For egress shaping, I'm thinking about using tc-mqprio, which has
> hardware offload support. And for OVS, we can add tc-mqprio support.

What is your end game?  Once upon the time Simon was explaining the QoS
stuff in OvS to me, but IIRC it used CBQ and/or HTB.  The XDP TX queues
are not exposed to the stack, so we can't set per-queue QoS, setting a
root Qdisc (like mqprio) and expecting the XDP queues to have the same
settings would be very limiting (then again even with mqprio IDK how
you'd select the prio? by using the TX queue ID? hm..).

> For ingress policing, I don't know how to do it. Is there an hardware
> offload ingress policing support?

There is support for act_police in a couple drivers.  Although using it
per queue could be a challenge...  (At least we do have a real queue ID
on the RX, hopefully the mlx5 fake queues never get merged.)
