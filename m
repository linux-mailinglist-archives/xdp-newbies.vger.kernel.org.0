Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA844800D
	for <lists+xdp-newbies@lfdr.de>; Mon, 17 Jun 2019 12:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfFQK5O (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 17 Jun 2019 06:57:14 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45224 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfFQK5O (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 17 Jun 2019 06:57:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so9383503wre.12
        for <xdp-newbies@vger.kernel.org>; Mon, 17 Jun 2019 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oux/URqtLnCQz0hykKTkssrS1+fpFZHSJIx+RX8G2GQ=;
        b=woWBv1RXqXXHBEQ2kf8e2DZPxwrUfx5k/e/ISXi9lZ6He1N7LRwUjrvxqScxwGKd3o
         4OycgIpGpAi5c1xogO3KzWCexPePrzLlrwCq3CSVEYhuSRrWTLLLRzMkEe+NvDbRa2Oz
         ah7gQ9zJp29xYL5jA4bCK05fMVTUjLGBiW04J4qENx+kNeDyp/QB9LuWHL1m0m+pM3Jc
         m4QHqKGaZGV+sL3PH0j6+86+EyphPjGJJfOzQAHlgyB3LqKUxGn3qRBGdSjwnPp+1te9
         67cDRwBn43SvwKV69OTUIr08hiVd+eYwuMa4qqsB+lLEoWbIuNup1NEIBdOzZon2C3ul
         jf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oux/URqtLnCQz0hykKTkssrS1+fpFZHSJIx+RX8G2GQ=;
        b=NuOuPYlGGzUtctFpSSEYoW6vAiGrWD4P+rWkDaHxrBsJfDmRN6LeB5ijSyUL3BVA6K
         fv6JUStFw5URW/wZWFe9aDgEyUNhHyAkQH8qHurThvnP7PUiwalaZXEojcJCTQcPnG6E
         QPdude4YtD6tllx5YdJDQBPnbyQemFQP5yZXE5evDfnGFCzhvfMA4qgLmX8Pg532O4TG
         2CDGc1SyLb4KqyoFJr88uzdmHOwt8xGC7eyeu11eMVf9MAKq04J6Almmkc1UdiyGhtJ0
         attX76LSk7etpeprAG0wejBMDJqWqf+4dQf8a45ewyc7Do/vgxfyf0Qa2TCcLgst5an2
         2q3A==
X-Gm-Message-State: APjAAAU+9sA8t3LfT1W6zoxKkrfAn55HPTUcI7IppwGBqRKYsr3SbfiP
        kNlrsTMnsbcycNiUmZwFvwjqoloslzM=
X-Google-Smtp-Source: APXvYqzSZkIn0gcYcq0qS9jJgUE++a1PcnxamM6yGuvyXofsWa9cEoLY4IWOWY6E1PtukP71GOgtCQ==
X-Received: by 2002:adf:c541:: with SMTP id s1mr60865126wrf.44.1560769032254;
        Mon, 17 Jun 2019 03:57:12 -0700 (PDT)
Received: from apalos (athedsl-4461147.home.otenet.gr. [94.71.2.75])
        by smtp.gmail.com with ESMTPSA id y184sm9411205wmg.14.2019.06.17.03.57.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 03:57:11 -0700 (PDT)
Date:   Mon, 17 Jun 2019 13:57:09 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Eric Leblond <eric@regit.org>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: AF_XDP and packet timestamp
Message-ID: <20190617105709.GA7734@apalos>
References: <86f135475a7820adadb05e7ac9a05c71846bebd6.camel@regit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f135475a7820adadb05e7ac9a05c71846bebd6.camel@regit.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Eric, 

> Hello,
> 
> I did start to work on AF_XDP support for Suricata. API was really easy
> to use via libbpf.
> 
> From Suricata point of view, the current system with default
> configuration is lacking an important information. I don't have access
> to the timestamp of the packet. I'm in particular interested by the
> hardware timestamp as it would allow to do reordering in some capture
> cases.
There's no timestamp available to my knowledge
> 
> Is there a way to get the information via AF_XDP. I've seen the
> discussion on hardware hints but there was no code example I was able
> to find. 
This is an awful hack i did when i needed similar information [1]
Essentially i am copying a software 'timestamp' (in my case rdtsc() since i
needed to measure packet timings from AF_XDP -> userspace), into the meta_data
of XDP.
The way i did it is obviously wrong since it has to be added per driver.
> 
> BR,
> -- 
> Eric Leblond <eric@regit.org>
> 

[1] https://github.com/xdp-project/xdp-project/blob/master/areas/arm64/xdp_for_tsn.org

Cheers
/Ilias
