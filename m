Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D416421AD3B
	for <lists+xdp-newbies@lfdr.de>; Fri, 10 Jul 2020 05:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgGJDEM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 9 Jul 2020 23:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgGJDEM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 9 Jul 2020 23:04:12 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106D5C08C5CE
        for <xdp-newbies@vger.kernel.org>; Thu,  9 Jul 2020 20:04:12 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id q15so4279770wmj.2
        for <xdp-newbies@vger.kernel.org>; Thu, 09 Jul 2020 20:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:date:subject:message-id
         :to;
        bh=ccvOwmY6oLZG88cPcv3MTpOiZLWvpF+fGsriLI9tC38=;
        b=YPtLxguayktkYUv3odI2uzXf0UCrFHq/4mDaVBqAMN96EUsPBce+XJOjI8b2HU/ZoN
         5w6kOBzLp4cIcTNbVvrAhB4RhDSTrFjpPWB//d1z9nKs0/js5Bqx1KAoS0TmFZrxQHEz
         1pG883/5bZe+ckgQn87ksf9JAI7ctq2QEnA/UtclZ1EBcdEY3vYzRMU2aJrcdZHyaJY4
         Y0MjiuGfRht1AKOJ5rlRYyH3dDJcrbq/3YyTAyg7jjewZP97vMSeW2q6iwpWSJPXaQvG
         yngzUZwABXoi82voDdTAd/GgPIklgiS7r7CM4m/G9pRv3xyhDVq6fo/E+ejDme+LVYIm
         6r/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
         :subject:message-id:to;
        bh=ccvOwmY6oLZG88cPcv3MTpOiZLWvpF+fGsriLI9tC38=;
        b=AsUQ8Ssq3RetmuixezXlCPBHpW0AdHw8M9e8Annuv9dhprmTbw5d19kvGQ3HFEP9kH
         hF1SPi6noJxjliXp/+tBA9hyIoZkMsh4zuoImEFqTLvgw99sfB67rbO/RXGzQ+ZjfnCu
         bt+758NzjX7ZJ5e8Bw/AcxekAQrAp31ipyYlX15/YZquFdcx7oveUEfcEWbMG0BvkN2i
         h6hmbNrZErX4fUJdUaJaszCqTpSa1EI43H7qw/I3Oop/asTjYgP0SPCkR0RLhQkQ3Igp
         Gv/m2Zxik+zgHpnd7Ct1RIyOwwXZOkMOo80XHpfZYs7CuV7+WxO7atoe8WPE131hDSTY
         FTFQ==
X-Gm-Message-State: AOAM532dA3V4YsM/a7m2VZLbqz2zi/jEWQIGIqfQyIeLy5nH+8u3ixhh
        ps0Z0pzFPh+1RPwr+PWKBPzFL9HA
X-Google-Smtp-Source: ABdhPJyNYLVGu8FZP/A6Qq4DxQLOEF+93Dthdey1IUiJQKpWpYzWz3YLWPMPrsWqyPhq/VsD3ozZhw==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr2694310wmi.99.1594350250024;
        Thu, 09 Jul 2020 20:04:10 -0700 (PDT)
Received: from ?IPv6:2a01:4c8:53:b80f:cec:6ee:dab9:67b9? ([2a01:4c8:53:b80f:cec:6ee:dab9:67b9])
        by smtp.gmail.com with ESMTPSA id p25sm6757408wmg.39.2020.07.09.20.04.09
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 20:04:09 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Cameron Boness <xdevps3@gmail.com>
Mime-Version: 1.0 (1.0)
Date:   Fri, 10 Jul 2020 04:04:08 +0100
Subject: TCP Payload
Message-Id: <449BEAB8-F4ED-489D-BF59-8993637268DB@gmail.com>
To:     xdp-newbies@vger.kernel.org
X-Mailer: iPhone Mail (17F80)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I want to be able to read the data being sent in TCP payloads using XDP (in c=
), but so far all I can read is a number of headers (eth->iph->tcp->dns). Is=
 it possible to get the TCP payload (i.e. client sent data) from xdp_md at a=
ll? Been looking online for hours, doesn't seem like anyone who's done XDP t=
hat's posted about it has ever parsed such data, hoping it's possible :(

Thanks=
