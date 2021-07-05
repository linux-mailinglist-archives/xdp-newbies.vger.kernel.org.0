Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8723BBC37
	for <lists+xdp-newbies@lfdr.de>; Mon,  5 Jul 2021 13:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhGELe5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 5 Jul 2021 07:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbhGELe5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 5 Jul 2021 07:34:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90F1C061574
        for <xdp-newbies@vger.kernel.org>; Mon,  5 Jul 2021 04:32:19 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d16so31882683lfn.3
        for <xdp-newbies@vger.kernel.org>; Mon, 05 Jul 2021 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:cc;
        bh=nw8h5h5Z0OKTt3S/8cQGOnDIyxBkkGmujthbt8alB2k=;
        b=XYUfO5m9DcQXpejix7IkGTiBBOCRklhjNrqsULhq0IhiUSdHqSJy1rC1iJnpQS05km
         cMbhsIMszdr+8JHlAj2lFO2EXu+1EmtE8/zZmgG1UUObXsqa+SJvR58L7ikCJlo9k/AL
         ZDtW1Fpa4cP0Py+6RpJKt0wu1dZsHXxFBD131LZBJSa3kWjn/hMCIqQGLbWaSwMvN4dT
         UwwlhMJMjwdq5t50zm7/QdGIBt18uzH9iHdW+WAOxyPM/3gdCvnD2NXFN/8Nyq+1fbPG
         6vfUAmL7o6EAU21BmZC0VNffUfPO754XO+S0oncoT7nOL5nKixXgCcr2QLLCHlbl5FFb
         uo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:cc;
        bh=nw8h5h5Z0OKTt3S/8cQGOnDIyxBkkGmujthbt8alB2k=;
        b=mDkPA2kOYuVERp5SyrkXszup88RawsnzEVgQ/LUdQmv1gqojqk3Kd8abwO0CpgJ0dw
         RR18gecXuPPmRidYBYFu1vu5w7DDUC5fGGDkj0nI7nXuUte0GMNIeBVI81Clm8mDUuCE
         McEwfVlsANc+Uyj/GlZvXYuBIIej3huyc4vXff+gKhW5B3TTO5JAgy5PIcufk5GbeEWt
         NE5hIIOOBsrKdLDvLDWwsMNV32qM89znpLfX1ssISBystGD9uvs/EGj+Jtl8eIBH3WBo
         oLf3TtzvjRg7n/A06Ed/mKCurVyNw/LmdmesztVla1VA6iIHiZmyRwvweZKHljRjh8zi
         fvNg==
X-Gm-Message-State: AOAM532teoWxY+gocUYn4O9lgu+38SVybPd1I+0jHzPhoeWCcCCCWMXn
        L+y6Nwexyvy8+pZOO+LUBttyU/hz/0l/v7aKBuw=
X-Received: by 2002:ac2:4e82:: with SMTP id o2mt3514574lfr.38.1625484738334;
 Mon, 05 Jul 2021 04:32:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:240b:b029:fb:e978:6b2d with HTTP; Mon, 5 Jul 2021
 04:32:17 -0700 (PDT)
Reply-To: mp034367@gmail.com
From:   Pepe Edem <griestkristen667@gmail.com>
Date:   Mon, 5 Jul 2021 12:32:17 +0100
Message-ID: <CAH6eeoHemVonXk8+3zJ-VTN6-z1oeD2RA0iLmfEic4aY8zKaxQ@mail.gmail.com>
Subject: hi
Cc:     mp034367@gmail.com
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

do you receive my message
