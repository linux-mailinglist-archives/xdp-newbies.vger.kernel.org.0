Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0861D104987
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 05:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfKUEFx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 20 Nov 2019 23:05:53 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:38008 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfKUEFx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 20 Nov 2019 23:05:53 -0500
Received: by mail-pf1-f179.google.com with SMTP id c13so957485pfp.5
        for <xdp-newbies@vger.kernel.org>; Wed, 20 Nov 2019 20:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=N4pOUNUccc7+6i66XMNT2HQaaDh+LUA4BQJjrNTvqdI=;
        b=TNSDNXsBnxWUSoKA+pl+x9aaog2Ax+7p5jw+YI0oKnins7C++TtN01qX4Y8wyAljRn
         tbT9m1YtE69xK5UT0T1pWGpZqjiNbJJCyaeXudz+Dil3JK2F4HtTiW9GwAJdNzN7HLzC
         k9KMhozgoiTrOf3qSVV3A/0/xW/QCJ9klKVhY0JtE+po3AasfG/I2yTSzrwhGmn/IJbz
         t6o7z1BDwypoVtEH2ilJO9SpFiny7MKLSOVX+FEQQZvD3dqzcVEnj48aEmrN0VNXpKQH
         Qcoko2J0qZxrxFM8OWnXT5t7r+R0bCdl/2Wy+qfVDs/Gp13+Z9BvuZJmXSwuUmv86d/m
         gYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N4pOUNUccc7+6i66XMNT2HQaaDh+LUA4BQJjrNTvqdI=;
        b=iGJvG0tWPpVevMbMMn7vPv2Mm+wrrIUo9/curfPu6nxb1F+WwG8UP3sVTBJRvQ8pO9
         FTAifd9gxZEMENFH2xBD9uB+sCt0wLRfEnMENBSxnbCDJ4wQzNky/9SBMTuC6x1pyVFy
         uboqvdhuuzq3SNPch8EpPiyfOSKgpJazl0+eISVTC5/6avZ6qbxO4AaSbJGXrR6idQC2
         GjaQMGWRhPZ3hsdC0xt87EJX/VjpIOFibSoUKrg4/zxVWsDDZzCMjqKmCPrjH9q+gzXB
         zgHUBfNl/YU9Vs08mbv9sfHd5fzGWdHuckwzDg0XwxqhR5HhvXoKSX07Ivd0nQSp3Wlr
         12MA==
X-Gm-Message-State: APjAAAUglP+Ux/uE4yFOm5aDDaHipTumhGzdvmGbJkhkqT29miMCjQmm
        ar4KtnmQLQ1wjoW7R/ErnBSvqNWV
X-Google-Smtp-Source: APXvYqzcP89oSp6k12SGS8Xh8HKCO4UiGQ6Qs2vhd656lST/6LHu6rIMMzF7yFzFRvNKMTQ9NiY53w==
X-Received: by 2002:aa7:971d:: with SMTP id a29mr8336495pfg.205.1574309150472;
        Wed, 20 Nov 2019 20:05:50 -0800 (PST)
Received: from dahern-DO-MB.local ([2601:282:800:fd80:b9b1:601f:b338:feda])
        by smtp.googlemail.com with ESMTPSA id s2sm760206pgv.48.2019.11.20.20.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 20:05:49 -0800 (PST)
Subject: Re: error loading xdp program on virtio nic
To:     Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
 <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
 <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
 <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com>
Date:   Wed, 20 Nov 2019 21:05:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 11/20/19 8:54 PM, Jason Wang wrote:
>>
>> The current error message is:
>>    virtio_net: Too few free TX rings available
>> again, looking for some libvirt setting for the vm create.
>>
> 
> Make sure you have sufficient queues, e.g if you N vcpus with multiqueue
> enabled, you need 2*N queues for virtio-net.

yep, that did the trick and now I can attach xdp programs. Thanks for
the help.
