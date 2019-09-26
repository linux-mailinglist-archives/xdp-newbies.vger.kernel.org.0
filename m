Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0610BBF316
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Sep 2019 14:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfIZMe6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 26 Sep 2019 08:34:58 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46267 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfIZMe6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Sep 2019 08:34:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so1736426pfg.13
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Sep 2019 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=greyhouse-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=xdnnjxUAeTf0zqbbSO1ztRZ/6rUD7Zswr7GS9F0o3dg=;
        b=IAot1wyb2IlMS1RIFufDQjGvhZpfU35rfBf5OO6VoAAqL1Ad4mx7RysrLBbgnDFoGO
         hPWVH6eY5qF1EYkUXUY1gEvxMlS91exatop2WwnhZOjYW09NSI2+rme9hB3bIzGJqpj+
         cveHUejTlpyp+UPHG8prOeM/RA6+0TfKEBN1NuUvCAZcN+iP8057sZHlt6VLixO/ieoq
         veTc4FdNMJAc00kzX0hjmzb6poMjmaBxGuticjqoQ6KMI5g78r7g7HZ43jNfIMwINSb7
         ajq2a79OPmV7fHnKT/ymeUTZsAQbQB8IqfS6MtV3o+AbWJeYjKzy+PsITdmk164FBCAZ
         B5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xdnnjxUAeTf0zqbbSO1ztRZ/6rUD7Zswr7GS9F0o3dg=;
        b=Ei9/g0nUsVKTub54io9vIYXSh/tJOnypYcwDeNDy3FXsFDcImqwFe8+PT54ahPLx2Q
         z1o/fYCKjqZcdXzA4OBuYNiuCwcn48Q6H5BcU1gQPbQmfczBGD5QLB0eMA5GPgMINVhO
         3MvslNPyYnlka59SvPr1kwOhZf2jP/aie6hYeQpAZ6x7gQfkByztZr+o1/s4zejoxyFM
         X2Hk4FoekOp1h2HmgkTDzMxbV8O2JDO0rCG3+raxhbczRkRecFcgP+u99qBuuK/J3NJw
         3MvF7+Qu0zX6UPBjsBlrQuyvkFlpmbXfNHz9WSxBBmm1vYwes/wmrrHb7YhA6BJlsGbO
         Bj0A==
X-Gm-Message-State: APjAAAXT+jfGNoKJmDdkXWc8V3WC4p/R20mGlOoz2VY3J3OCJsjsp0bZ
        AywhK2b6V8N+zfhJlvWfEr0UcQ==
X-Google-Smtp-Source: APXvYqwMv2C/l4ydjaHENzM3Eopw9eGOmEuc98QRj3hCz64fUKoQOmpUWdLtTOKtRfO/wZUeE3Tkdg==
X-Received: by 2002:aa7:9ab5:: with SMTP id x21mr3356985pfi.252.1569501295641;
        Thu, 26 Sep 2019 05:34:55 -0700 (PDT)
Received: from C02YVCJELVCG ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id x68sm5686094pfd.183.2019.09.26.05.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:34:55 -0700 (PDT)
Date:   Thu, 26 Sep 2019 08:34:50 -0400
From:   Andy Gospodarek <andy@greyhouse.net>
To:     Anton Protopopov <aspsk2@gmail.com>
Cc:     =?iso-8859-1?Q?Th=E9o?= Mainguet 
        <theo.mainguet.etu@univ-lille.fr>, xdp-newbies@vger.kernel.org
Subject: Re: [xdp-tutorial] : permission denied when I try to execute a
 program
Message-ID: <20190926123450.GA39817@C02YVCJELVCG>
References: <0cbbc2e2-9eba-ad40-d819-d092b2015707@univ-lille.fr>
 <CAGn_ityTBjJ+erYRrvoFCCVYM9qwztg3tkmRuShs60xACQhvbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn_ityTBjJ+erYRrvoFCCVYM9qwztg3tkmRuShs60xACQhvbQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Sep 26, 2019 at 08:17:48AM -0400, Anton Protopopov wrote:
> чт, 26 сент. 2019 г. в 05:22, Théo Mainguet <theo.mainguet.etu@univ-lille.fr>:
> >
> > Hi,
> >
> >
> > Thank you very much for your xdp tutorial. Currently, I try to write a
> > simple xdp program to count the number of TCP and UDP packets I receive.
> > For that, I created a BPF_MAP_TYPE_ARRAY map in my kern.c file. I can
> > read into this map with the bpf_map_lookup_elem function but when I try
> > to update a value, I have an error message "libbpf: load bpf program
> > failed: Permission denied". To solve this issue, I've try to run it in
> > sudo, I've verify my kernel configuration (everything needed seems
> > enable) ....
> 
> What's the error message when you are trying to load your program with sudo?

That information would be helpful as some distros will not run some of
the sample BPF programs without some ulimit changes.  For example the
command:

# ulimit -l 1024

or even

# ulimit -l $VERY_LARGE_VALUE

may be needed on Fedora or Ubuntu, but not on other distros.

