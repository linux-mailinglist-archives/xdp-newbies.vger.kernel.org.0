Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC1E0104292
	for <lists+xdp-newbies@lfdr.de>; Wed, 20 Nov 2019 18:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbfKTRw5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 20 Nov 2019 12:52:57 -0500
Received: from mail-pl1-f175.google.com ([209.85.214.175]:37579 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727619AbfKTRw5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 20 Nov 2019 12:52:57 -0500
Received: by mail-pl1-f175.google.com with SMTP id bb5so116842plb.4
        for <xdp-newbies@vger.kernel.org>; Wed, 20 Nov 2019 09:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=BOpkgZQqN7dZalgEBIofLQCrd7m4iHrAeD9MSag4+sk=;
        b=J+pL/7kRMTC3CAx4zxGRR51BGDidl2DTNDQDfrSJH/wPRq4M6hOdxYfW95rJSpqh0u
         vWAaiJSx/2Pv5Ien3J6jiqdZviheQOIjMFixj4kScOByaPdTbbLbJbBWm84xKqGeQb2h
         gZyTBWjLyE1rbk6+OV7cJv/ZZ9Kq7SWzd0y8MBsWW+9fvSy5fTnXCgIAYYG+j4GQQ/IS
         PCtMytdTeJ3svkmGh+eHITCUoAf/STrqPPwX00e5+R+ArG2g61lEuVjkZEabdzf55ZsO
         oAdSLBlxWV5nem8/dZijPevtwSIK8z0Yrc0HG8Zu9QjJoKBvYHssW7ubOMshLULG1YWE
         7moA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=BOpkgZQqN7dZalgEBIofLQCrd7m4iHrAeD9MSag4+sk=;
        b=oNKNq5et7Z840WBYSPrm3qTvmdqDzRAKpUcGBOvB3u5X3OAKaW3xXg+xmAl96hoZbf
         XVv2tJX5l7OlHCjUtoktRTr20k+vo1JbNdYBqRUOgPnQtZfiEv5DNl9aHOwWvvms943J
         Ney/U2t3dYGIAY+d7F8UqFeTpyOpsLD1SHAx5joekciyutz5QpkrfPmLMago4OCeF+SO
         9AcMAjK4c+MYSDvvLDk3XOOi6izel474yJl3LOOTVs0wp1geTMXhAbogudWWC+th7sXk
         KzMo6bs0EYa0PTwPGSSZgRhj2WxXWoLBzHeyd+HMePTfe/n2bXXMTvDq+dRtJsdtAqI8
         +h4Q==
X-Gm-Message-State: APjAAAUat7G7D7Pmy80DozPRww/1Tk5DwIHrp5N9xikh4ptfCh6ToYLI
        cYAoFdRD77mABkrX/oZRAuY=
X-Google-Smtp-Source: APXvYqwQ/zsG9CUAYgKIoOcahyf4IfrcLsEy9jzFYToxVKYi65+t96NcRz+gwgAO90t5uxxzd6NN/g==
X-Received: by 2002:a17:90a:c789:: with SMTP id gn9mr5499181pjb.99.1574272375645;
        Wed, 20 Nov 2019 09:52:55 -0800 (PST)
Received: from dahern-DO-MB.local ([2601:282:800:fd80:d52e:b788:c6dc:7675])
        by smtp.googlemail.com with ESMTPSA id r15sm31053031pfh.81.2019.11.20.09.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 09:52:54 -0800 (PST)
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Jason Wang <jasowang@redhat.com>
From:   David Ahern <dsahern@gmail.com>
Subject: error loading xdp program on virtio nic
Message-ID: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
Date:   Wed, 20 Nov 2019 10:52:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi:

Trying to load an XDP program on a virtio based nic is failing with:

virtio_net: XDP expects header/data in single page, any_header_sg required

I have not encountered this error before and not able to find what is
missing. Any tips?

Thanks,
David
