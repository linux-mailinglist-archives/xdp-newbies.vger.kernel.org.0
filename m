Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C175E6B1F
	for <lists+xdp-newbies@lfdr.de>; Thu, 22 Sep 2022 20:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiIVSkM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 22 Sep 2022 14:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbiIVSkK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 22 Sep 2022 14:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D50974DE8
        for <xdp-newbies@vger.kernel.org>; Thu, 22 Sep 2022 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663872006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BuwnU4LY9LUZUOj+3vPz6Ys9U7Z4NjlKCZIkLslrat0=;
        b=EpOzQMrJ2nGIaeigQdAx9hSFOkVnjN+ZlzeWxd6llqfwZTdZKN4fErPbyDS4/MGfUHg8TJ
        Qmtwtr6TFcmjXjXU5rnI9oz1gLwzNC/Iea3ERN8EV/JNAEhqA4tcb48DTqD6TpYhAOozSn
        eDIlt2IuWR//Y2FvBKQ8kzmCo6cHCi4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-NTT9Lj7hPsGTXUgKtc4PlA-1; Thu, 22 Sep 2022 14:39:00 -0400
X-MC-Unique: NTT9Lj7hPsGTXUgKtc4PlA-1
Received: by mail-ed1-f71.google.com with SMTP id f18-20020a056402355200b0045115517911so7215226edd.14
        for <xdp-newbies@vger.kernel.org>; Thu, 22 Sep 2022 11:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BuwnU4LY9LUZUOj+3vPz6Ys9U7Z4NjlKCZIkLslrat0=;
        b=m3U2Okw/XAoMAHcwjRuPWyTMXFGFLnXb6RjU0ljiSkfGmA7UwEYJV9wKAXLBoIoKI1
         WYmfBMUWjVrxGP0CDX0oiZYy/XJBEj7kaN+PBRxPyGqUk5ECR/zXmf8rohU2nnxQYIQ1
         u6mAYRrBVWZla8CDLiHEkQ/TDjpYk0Il4Y/PX0KZRLOapRYoXZa9XG6dNREn4cEeLi18
         hCbKFNXa++c5x82iJqfTpIEbrLL6qYzH/03IuajlUiO5wDySPjq8dZkRl0mGJ7iAwSsZ
         I2pzBIZ7c3bg9BAYltv9/lUIbGUu4nRhHE45wBmsHVJozYVTQmB6N9R9TjK7uKjNnZ2M
         leUw==
X-Gm-Message-State: ACrzQf1Nn1cyv2XCU8IID4XGuZ3KFLyS66NJinHe3oTXg556/LXBck8+
        ca+hiKumw1y4B4nXGksDJoY7Z/OEQH8OGbNJ8lHPuxltFz21uKNmGOJQ7o0cSyfYjSEcpw2CWRB
        0VLqlAAVy+1Zv5dLZVw6GiEQ=
X-Received: by 2002:a17:907:80d:b0:73d:1e3f:3d83 with SMTP id wv13-20020a170907080d00b0073d1e3f3d83mr3871975ejb.372.1663871937115;
        Thu, 22 Sep 2022 11:38:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6etjZE9ZvgBmhnAe95n1L9EYAcB0RNpRSu1HIY0vN7JS/mljCrtjxhwEKNasaTWXEBt0Vghw==
X-Received: by 2002:a17:907:80d:b0:73d:1e3f:3d83 with SMTP id wv13-20020a170907080d00b0073d1e3f3d83mr3871922ejb.372.1663871936122;
        Thu, 22 Sep 2022 11:38:56 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id s18-20020a1709060c1200b00780f24b797dsm3043530ejf.108.2022.09.22.11.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 11:38:55 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0F2AB61C729; Thu, 22 Sep 2022 20:38:55 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Federico Parola <federico.parola@polito.it>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP and AF_XDP performance comparison
In-Reply-To: <26480f7b-44b4-c6d3-2376-9b4be8781645@polito.it>
References: <26480f7b-44b4-c6d3-2376-9b4be8781645@polito.it>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 22 Sep 2022 20:38:55 +0200
Message-ID: <87r103tfsw.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Federico Parola <federico.parola@polito.it> writes:

> Dear all,
> I would like to share with this community a draft I recently wrote [1] 
> on the performance comparison of XDP and AF_XDP packet processing.
> In the paper we found some interesting and unexpected results 
> (especially related to the impact of addressed memory on the performance 
> of the two technologies) and tried to envision a combined use of the two 
> technologies, especially to tackle the poor performance of re-injecting 
> packets into the kernel from user space to leverage the TCP/IP stack.
> Any comment and suggestion from this community or any type of joint 
> work/collaboration would be very appreciated.

Hi Federico

Thank you for the link! All in all I thought it was a nicely done
performance comparison.

One thing that might be interesting would be to do the same comparison
on a different driver. A lot of the performance details you're
discovering in this paper boils down to details about how the driver
data path is implemented. For instance, it's an Intel-specific thing
that there's a whole separate path for zero-copy AF_XDP. Any plans to
replicate the study using, say, an mlx5-based NIC?

Also, a couple of comments on details:

- The performance delta you show in Figure 9 where AF_XDP is faster at
  hair-pin forwarding than XDP was a bit puzzling; the two applications
  should basically be doing the same thing. It seems to be because the
  i40e driver converts the xdp_buff struct to an xdp_frame before
  transmitting it out the interface again:

  https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/intel/i40e/i40e_txrx.c#L2280

- It's interesting that userspace seems to handle scattered memory
  accesses over a large range better than kernel-space. It would be
  interesting to know why; you mention you're leaving this to future
  studies, any plans of following up and trying to figure this out? :)


Finally, since you seem to have your tests packaged up nicely, do you
think it would be possible to take (some of) them and turn them into a
kind of "performance CI" test suite, that can be run automatically, or
semi-automatically to catch future performance regressions in the XDP
stack? Such a test suite would be pretty great to have so we can avoid
the "death by a thousand paper cuts" type of gradual performance
degradation as we add new features...

-Toke

