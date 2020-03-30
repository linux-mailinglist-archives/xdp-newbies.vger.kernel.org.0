Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50335198126
	for <lists+xdp-newbies@lfdr.de>; Mon, 30 Mar 2020 18:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgC3QY3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 30 Mar 2020 12:24:29 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54]:37160 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728784AbgC3QY3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 30 Mar 2020 12:24:29 -0400
Received: by mail-pj1-f54.google.com with SMTP id o12so7555729pjs.2
        for <xdp-newbies@vger.kernel.org>; Mon, 30 Mar 2020 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=agI8Na3JEC5SXpK2SzqIp6n8dv1MROJNQCmmIXFieoM=;
        b=HD57/qnQg0UGnwoBJUvYydMf97NQ3nfRVzHJ1gCUD4vyX+k0qa/u4ZGJ5Q03ImJEFe
         yJuVK43XHxIHMf7nt0hLOk+uM85rVs/DKg/h6WoiD6KSLziWjjcU5Bs7HxleKH7TLTSW
         Id/ClfQyL46iEXl3GQYZOJGV15yzYV+h0K3EiNIlyJdxANzINeDimkxKQSzdsEUQUwN0
         MIxNbq0vntudF3QmaZJRP7t8hQoGmI/6h8CvoGF9oTcKP+rovF86hLt4pxR8QvB/srhF
         mVqy2KAuW4T7FOx9x2/Fmo4SP5bgqASnJ7ikv/zUnVOEOMrxSjzyu8H6Tbn1sDED+HNS
         kO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=agI8Na3JEC5SXpK2SzqIp6n8dv1MROJNQCmmIXFieoM=;
        b=dEvjxbokMgSiJjLepto4F3Fp9HWa2JCys0A9GPeUaE5MXWIHKS2GdeAWjE1Z52dq86
         9OlRDBzaN9c+UiQ4TiVMybDbF9I9DkVln8YSJlfqZ6jds65+SlwnoWFtVJUQ42BnvIE6
         Kj8JBNKn3X4KHms+AldVyMCgV/H0mGyJHi/Q5zzHD3AurXi66I/moTTDttqmleVmVING
         wanDxjDcm9NRVr/8ICMoT7AsUogWqDrYgXBIctA+YnERjgLNYfWW4TOOgkP5BZlho5LV
         eHak4umm1mISs/MClAjlGDzGzMUAVWagA0t7PSRtmXxHEeYMagYrl7Ztea3QyAU3BY3a
         sTJQ==
X-Gm-Message-State: AGi0PuaLfMDC4hJ4gucngaMq0W/SInVZ/NPhT3sDLUbsYs2X0B0ZKkZh
        JkDGrVlV8DJHc4ngVnYF+L04bIEY
X-Google-Smtp-Source: APiQypIAzQY2vQXky1VhtzakmOH9fXC/9EOkM0Onk/ZkZcg/W24uMaklqwfFU/HvmYiBYQsiNikfIw==
X-Received: by 2002:a17:902:bd01:: with SMTP id p1mr3949765pls.98.1585585468089;
        Mon, 30 Mar 2020 09:24:28 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:6833:d88e:92a1:cac9? ([2601:282:803:7700:6833:d88e:92a1:cac9])
        by smtp.googlemail.com with ESMTPSA id q9sm10534467pfh.213.2020.03.30.09.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 09:24:27 -0700 (PDT)
Subject: Re: Using AF_XDP To Modify Outgoing Packets
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
References: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <1bcd8d55-1d31-e46f-a2e9-15b03c0c74ac@gmail.com>
Date:   Mon, 30 Mar 2020 10:24:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 3/30/20 10:11 AM, Christian Deacon wrote:
> If this isn't possible, are there any plans to add TX path support into
> XDP in the future?

I am working on it. Latest set is here:
   https://github.com/dsahern/linux/commits/xdp/egress-rfc5-06

does not include support for AF_XDP, but hopefully that can be added
later by someone with more knowledge of socket needs.
