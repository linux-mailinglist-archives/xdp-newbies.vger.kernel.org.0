Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 445F9104960
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 04:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfKUDfh (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 20 Nov 2019 22:35:37 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43777 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfKUDfh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 20 Nov 2019 22:35:37 -0500
Received: by mail-pf1-f194.google.com with SMTP id 3so905662pfb.10
        for <xdp-newbies@vger.kernel.org>; Wed, 20 Nov 2019 19:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KwynHTLqWSIX2ODMQpdzBD4ze1tOEnyekv0kya7bf/A=;
        b=r605pPQuZaSdc16dTntTWbRPNul9MUWedExNxbwI/XMqgVsglDbyDVoe3X+2AjT/mR
         PO6fROizx5/zigjvgDiXGTnROqvJhZ180Eu+qtV/icNtc+9ZUgO1CY61ui8ikVUmaeK+
         nLVna52FK6kevNrh6/Dlovqalngdtp7w1UKP/XROzmzj22nvgnOmSSCSbZ5ptW2783Ze
         R54b0N7Uu99MOhg5MnQmqZJhJMgetVSD3F05LPKJEXXsTkDMqGtUqFRZAVrfENRCQ//3
         /reh508eGv1yJtaZPbXd+a95186FCtnQ2AIE7yy07IjuMK6Ei/dD28xKfCpASePnFJW5
         wlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KwynHTLqWSIX2ODMQpdzBD4ze1tOEnyekv0kya7bf/A=;
        b=O5+bwFReJG6S5eO5BawMeEKjoUSAIdX3jdLAPTv16sRfGpDnC9dK7L2bg/GgRklFYd
         syOErjMrL6L0fa6hcjI15pPSJke6Wk/cSn1eu16DPbx8KI51TdyxgJO/QQP9jksh5Efj
         3+SGGBWf/SSVLGIOTC4H+dbduFPtctoP36+3rBeXJLUTCg7fEP0S1FxtTkINu7nbEWfv
         btwRZBJ5AtiYPwIeO+arvVVN4rkUsquSYrH0mxHYWCAXOGbm+CoegZXmxSgYLyguxz9W
         j8xcDxnnUhvQiCnNRTnZHzx0T3EBMnqHFTEpXP4wD7LkFStfXyqG++hvFzaXU1OgU/Cg
         90Sw==
X-Gm-Message-State: APjAAAXJRlMJDjk7vZmQlUArkiw7Rl0EN9Cbp02s+4XxN1JNlGigIy9b
        Nr2D1lUKz0OGg2EavBY1i5FDVyl+
X-Google-Smtp-Source: APXvYqyZ0oknp5pEuNkmb09ZZ/mv6SnR63w5wVqaHXBSVsqobF8oK25LTKwDdYhceoe7aWlt1KOPJw==
X-Received: by 2002:a62:5258:: with SMTP id g85mr7807464pfb.180.1574307336110;
        Wed, 20 Nov 2019 19:35:36 -0800 (PST)
Received: from dahern-DO-MB.local ([2601:282:800:fd80:b9b1:601f:b338:feda])
        by smtp.googlemail.com with ESMTPSA id v3sm891612pfn.129.2019.11.20.19.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 19:35:35 -0800 (PST)
Subject: Re: error loading xdp program on virtio nic
To:     Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
 <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
Date:   Wed, 20 Nov 2019 20:35:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 11/20/19 8:26 PM, Jason Wang wrote:
> 
> On 2019/11/21 上午1:52, David Ahern wrote:
>> Hi:
>>
>> Trying to load an XDP program on a virtio based nic is failing with:
>>
>> virtio_net: XDP expects header/data in single page, any_header_sg
>> required
>>
>> I have not encountered this error before and not able to find what is
>> missing. Any tips?
> 
> 
> Hi David:
> 
> What qemu + guest kernel version did you use? And could you share you
> qemu cli?
> 
> Old qemu requires vnet header to be placed into a separate sg which
> breaks the assumption of XDP. Recent qemu doesn't have such limitation
> (any_header_sg feature).
> 
>

Hi Jason,

When I run qemu via my older vm-tools scripts XDP works fine. This is
the first time I am trying to use XDP with guests started by libvirt.

We isolated it to a libvirt xml file using an old machine type
(pc-i440fx-1.5) - basically any machine with VIRTIO_F_VERSION_1 not set.
Using a newer one move the problem forward.

The current error message is:
  virtio_net: Too few free TX rings available
again, looking for some libvirt setting for the vm create.
