Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3741560C3
	for <lists+xdp-newbies@lfdr.de>; Fri,  7 Feb 2020 22:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgBGVlP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 7 Feb 2020 16:41:15 -0500
Received: from www62.your-server.de ([213.133.104.62]:48230 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgBGVlP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 7 Feb 2020 16:41:15 -0500
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1j0BN5-0006GK-29; Fri, 07 Feb 2020 22:41:07 +0100
Received: from [85.7.42.192] (helo=pc-9.home)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <daniel@iogearbox.net>)
        id 1j0BN4-000Tug-4F; Fri, 07 Feb 2020 22:41:06 +0100
Subject: Re: [PATCH bpf] xsk: publish global consumer pointers when NAPI is
 finsihed
To:     Maxim Mikityanskiy <maximmi@mellanox.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>
Cc:     xdp-newbies@vger.kernel.org, rgoodfel@isi.edu,
        bjorn.topel@intel.com, tariqt@mellanox.com, saeedm@mellanox.com,
        moshe@mellanox.com
References: <1581068272-4615-1-git-send-email-magnus.karlsson@intel.com>
 <c5d6fd11-8696-e898-6f05-5fcc087c0065@mellanox.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <95de5e86-8930-5655-62b9-ec60b9952440@iogearbox.net>
Date:   Fri, 7 Feb 2020 22:40:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c5d6fd11-8696-e898-6f05-5fcc087c0065@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25717/Fri Feb  7 12:45:15 2020)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2/7/20 1:34 PM, Maxim Mikityanskiy wrote:
> On 2020-02-07 11:37, Magnus Karlsson wrote:
>> The commit 4b638f13bab4 ("xsk: Eliminate the RX batch size")
>> introduced a much more lazy way of updating the global consumer
>> pointers from the kernel side, by only doing so when running out of
>> entries in the fill or Tx rings (the rings consumed by the
>> kernel). This can result in a deadlock with the user application if
>> the kernel requires more than one entry to proceed and the application
>> cannot put these entries in the fill ring because the kernel has not
>> updated the global consumer pointer since the ring is not empty.
[...]
> 
> Acked-by: Maxim Mikityanskiy <maximmi@mellanox.com>
> 
> Is it intentional that you didn't send it to bpf and netdev mailing lists?

Yep, please resend with Maxim's ACK to bpf + netdev in Cc. Thanks!
