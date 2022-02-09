Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36D14AF6AA
	for <lists+xdp-newbies@lfdr.de>; Wed,  9 Feb 2022 17:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236925AbiBIQ3I (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 9 Feb 2022 11:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235825AbiBIQ3I (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 9 Feb 2022 11:29:08 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B50C061355
        for <xdp-newbies@vger.kernel.org>; Wed,  9 Feb 2022 08:29:11 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h6so4982615wrb.9
        for <xdp-newbies@vger.kernel.org>; Wed, 09 Feb 2022 08:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=accelleran-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=f29cM95TStIfak5SPDNSyjVlMRy/JKNx//QLdTrYep8=;
        b=aJa2oTksdW6nGqKaTv7zh17aqxUiEbtG1vqIYVMVf6Nhb9HPc/tZx+SQUM52DMTE3o
         NS9S6kWyn95we5H8NgDRCqxJnX09CMrL0EqN2RYlhP87E3RJoP/RTtBk6KQmpHSrRPJi
         0tl6uNoAJhmpxU7THDePS6fIdhxv3OpSqFSA1nJSPAAhbIJ+CkPbSwm9uFPxq4eXU+ng
         1Q/XfLkFsYrYaw9j8yTEvL4m80qcluPrYN/a0kDFsBxnhuMxG3Rdrc+1l32Bd3mE+spI
         VkGXV/lsSDF4YO7IxbdlvDFz8dQ8WoqJfe6n0y57HFfyn4VirRipAgejU1DjgjefqB3+
         Wa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=f29cM95TStIfak5SPDNSyjVlMRy/JKNx//QLdTrYep8=;
        b=6rQPY+CdXfaD1a9Xj0LmK/B2X5JoL47qetMtATZ0SssYTK2nx70k1VGFdIIMWE+2OK
         m7SDQeDEKsBYyT3ksieeO2Re3m1Xd0E7KX+c4R2tGR2MLsrVhY6YZz+Duv4BggLLjkpt
         PlXOWPAJ2x9UeJluMlEtDQZg7PS16PZHOsCIgRmYoBuINYuVvu3J+auiX9dpNGOsXm/P
         CFu0ohR0+JKwUhANus8EIQpsKt+iTbyclgVCWEe8H5i74eMr9xeM8POxAeje4QyTZ5Gq
         hNzyIcOeQOWoJ0kyu8f6s/Tt9XV3XGoOGKbalC9D8wmUqf7TAmKq67M3HneHOQA9xVuW
         OnwQ==
X-Gm-Message-State: AOAM532o3fhS8s+DCiKD1iI+Qea5ao0FKNwG1aNwgCtfDNKWFf91tCBS
        V5TGdyA0xLssfyaR+nr+EdX4PPqN+kWOkw==
X-Google-Smtp-Source: ABdhPJxdnWUURt0v6Nj3af2LZTnbPiKCslNsteWAgMXoXuaRWaew3VzmzPqbuZefRtQ7EIwayxkcDA==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr2840355wrd.207.1644424149049;
        Wed, 09 Feb 2022 08:29:09 -0800 (PST)
Received: from ?IPV6:2a02:a03f:838d:900:b443:d214:5390:7a4b? ([2a02:a03f:838d:900:b443:d214:5390:7a4b])
        by smtp.gmail.com with ESMTPSA id n4sm3054068wmq.42.2022.02.09.08.29.08
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 08:29:08 -0800 (PST)
Message-ID: <83a47cc3-8199-cd59-9b22-c084b19dd90b@accelleran.com>
Date:   Wed, 9 Feb 2022 17:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To:     xdp-newbies@vger.kernel.org
Content-Language: en-US
From:   Erik Kazandjian <erik.kazandjian@accelleran.com>
Subject: XDP soxkets over loopback
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I've implemented an XDP socket that sends a simple UDP message to a 
server that listens on a specific port. I therefore create the packet 
with ethernet header, ip header, udp header and payload. This all works 
fine on an interface which is not the loopback interface, however if I 
try to use the loopback interface I see that my packet is send (I can 
see it in wireshark, all checksum are correct ), however the program the 
server never receives that packet. If I use netcat as a client to send 
to the server I see exactly the same data in wireshark as when I send it 
with XDP but in that case the packet arrives in the server.

My question is can you send over the loopback interface XDP TX to a 
standard udp socket or is this not possible ?Do I have to configure my 
loopback interface in a spacial way ?

All tips are welcome

Erik

