Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73054436DA8
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 Oct 2021 00:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhJUWoO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Oct 2021 18:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhJUWoN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Oct 2021 18:44:13 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBE7C061764
        for <xdp-newbies@vger.kernel.org>; Thu, 21 Oct 2021 15:41:57 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id r184so2699375ybc.10
        for <xdp-newbies@vger.kernel.org>; Thu, 21 Oct 2021 15:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ti+C90qcnYpdZEKOM3dYdCJicxMI442fNIM9oxUp+6Q=;
        b=Msr88XMZh5yI9hrd9ifA2LMeYPJ4eAwHgYPzC9Pi7kSf9kyXktJ3f9d01PhVVsdR0b
         ayqh526V53EHZVJfHiafFQHqvyXA5dLe+bWscVzqg1Uqm/2dGcaSjPRYSzPPR7gPUGAW
         n1KbR1cbLtlE6oANEVCoQ6AQG5q0G88IDTAWm1m1ucOrV2G4X8pfWEkM/OF+UY2jjgKN
         SVbHc2gOmHySJxhG1YN0ethm2HS0qH3qgwUEUaGPa9Ot/+BcWmjO/rnBbd1G4AsMhR7E
         PmTV7K7tGEqJI/38giNRAFBixhgaLCL1dWWM9J+Fg16SR3oe/mnbuhr/xrRcgSz0QrBY
         muAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ti+C90qcnYpdZEKOM3dYdCJicxMI442fNIM9oxUp+6Q=;
        b=3qSvqXGKADx1+RpJ13XpHPKGPd8qRE3ziyzU3HaKgdFni5RUQULVDdcG/K9glqKIvp
         sEGy5YrV8EaQ5xirxFbwIAO4c2XTjxya3/Ss8S1bvUStZFLJRgOXSYJ/9+pi2JyaxADu
         kkSec9bXZcL2195zl88cIcNemDw6X+gzvo+NgW4NGnU1pYTudUHdQDpc39yUKsUa8Lhm
         YrgroiDF9VPVTe3t0zyNwWT1CZQPJSYduf2ZEJtlyy9+cFE+y2JBZOVSDi3ob/eWlO2x
         4pWcYsOMU02qEyTDw/R1hDQTY9EauEwpEKJLH5sKGBOLVGoUK/kl3wDmASPjEkCR8y5U
         ja6A==
X-Gm-Message-State: AOAM532BjDJck31SWLRlxvS/90k9sXpxWDAqrAuAgNfa2igFDfadfQCk
        iHmWgF7NJ2JZQeRzwPM5EhdnYtwn4AxnbD7F4pwXVLsSJMc=
X-Google-Smtp-Source: ABdhPJz41vdNAFFeuTm/g6yoekGFg1Pmd0nVPfm1T2rPkVFjTIuMf9J4LIW7QplZPJBSrVRH5+hL49wjLuKlMK2cPiI=
X-Received: by 2002:a25:cb0d:: with SMTP id b13mr6216072ybg.495.1634856116114;
 Thu, 21 Oct 2021 15:41:56 -0700 (PDT)
MIME-Version: 1.0
From:   Jun Hu <hujun.work@gmail.com>
Date:   Thu, 21 Oct 2021 15:41:45 -0700
Message-ID: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
Subject: AF_XDP socket TX path interact with TC?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,
I want to put a timestamp in the egress packets, and I want to use
AF_XDP socket for both sending and receiving packets; since a XDP
kernel program only work in ingress direction, I wonder if I could use
a tc kernel program to change a packet sent out via an AF_XDP socket?
I searched around, but couldn't find any direct answer...

HJ
