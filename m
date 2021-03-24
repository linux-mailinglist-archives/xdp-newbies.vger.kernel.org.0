Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACDC346F88
	for <lists+xdp-newbies@lfdr.de>; Wed, 24 Mar 2021 03:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCXCbA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 23 Mar 2021 22:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbhCXCal (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 23 Mar 2021 22:30:41 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146BFC061763
        for <xdp-newbies@vger.kernel.org>; Tue, 23 Mar 2021 19:30:41 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id dc12so10700017qvb.4
        for <xdp-newbies@vger.kernel.org>; Tue, 23 Mar 2021 19:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=WO3rnJQ1TQN9vWFOtkLEFufk+ecQVBm74R4GV/ekdlA=;
        b=l1oDrfEPczWmkTnz2zWOIO5t4DwYUPYHt6+HsWNyQaYKCNEk5/PKUDKNGTAqsUx0wE
         JVtRMEvv3BwxP/VwINb49j9zl2TKwM07bHkSedm1DOk9pG/7U6B/p2D4jRgboEFbxrsm
         fmVXYwvEQEWct+/wEIo6/ofN5fOkAYkJ2/9rk4vHPuqZ3y5nNX720Czd2aYKc3EL4TuL
         iQ093GLD0nOsP5a3lDv5emz+UyR0GqPANenPm1ETwJh8r4FG3vkDcv0PNTmQUeGgMF+N
         zuBIjKfFhc466s+wNzdrzqkEPVZbKSL5lh10Pw0sLatXNbotzgWiO5soaJOjLzaZ6dHf
         Y5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=WO3rnJQ1TQN9vWFOtkLEFufk+ecQVBm74R4GV/ekdlA=;
        b=hwqYt2U4XWqVL4Lar3vN9vFj1IMu4M4fsR31klQ4qd7Ll6JHJxov4JxvsJ7Jr1WPsI
         j99VWYTtHVRSWkSqbHQ3pgv7Q76agckA5D+X9SLnO4BzxiMY4nsORPJ/RWPfj7icghrV
         tdyxlJFY6GzB2EzDhoBWcVYyNXcsGePSi3e7Y9syWryocc3ZvKSq7TIIgUlOSA/1uA9X
         uOLX7lJubolJwWKzdzgmrrrgj9395+SbUlvpVnV7GRP9xxbhboo178xLWS1MON9ezXVo
         ljv1AvG1MBBqJ9A5d0xcZksw8MKG4/9Z2kTkHL6HjIgeJrHW55Jxhp7c298kyr3MoxCl
         8l/A==
X-Gm-Message-State: AOAM5308ULOrsH04GmHX4iWyxaFUo22TQxEyLMr2e0F8fI2K2+A4HFHE
        IbW13IxFeT04Nn1nfGFDAscU8J7dV1Cxsdu9
X-Google-Smtp-Source: ABdhPJxRr3y6AFEia5Ie2K/vLKGBDJESDmujaCwaFCMto+mXh4s7CILWd/rk8ty8huq2KU7rOHqBJQ==
X-Received: by 2002:a05:6214:18c3:: with SMTP id cy3mr1122574qvb.1.1616553040210;
        Tue, 23 Mar 2021 19:30:40 -0700 (PDT)
Received: from ?IPv6:2607:f2c0:e56e:28c:5524:727c:ba55:9558? ([2607:f2c0:e56e:28c:5524:727c:ba55:9558])
        by smtp.gmail.com with ESMTPSA id p66sm714807qka.108.2021.03.23.19.30.39
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 19:30:39 -0700 (PDT)
Message-ID: <35a931df0e2cb4bf1fd23ecc15895419c7ca0e3c.camel@coverfire.com>
Subject: AF_XDP (i40e) behavior change in 5.11?
From:   Dan Siemon <dan@coverfire.com>
To:     xdp-newbies@vger.kernel.org
Date:   Tue, 23 Mar 2021 22:30:38 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

./xsk_fwd -i ens1f0 -q 2 -i ens1f1 -q 2 -c 5 -i ens1f0 -q 3 -i ens1f1 -
q 3 -c 6

On 5.10, the cores (2,3) assigned interrupts for the queues (2,3) are
idle when there is no traffic.

On 5.11, the cores immediately go to 100% system time when the program
starts (as viewed in htop). There is no network traffic.

Intel 710/i40e.

I tried this with xsk_fwd built from 5.10 and 5.11 trees with the same
result.

Is this behavior change expected?

