Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECBC10CE74
	for <lists+xdp-newbies@lfdr.de>; Thu, 28 Nov 2019 19:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfK1SSc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 28 Nov 2019 13:18:32 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:42256 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfK1SSc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 28 Nov 2019 13:18:32 -0500
Received: by mail-lj1-f178.google.com with SMTP id e28so5202334ljo.9;
        Thu, 28 Nov 2019 10:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yxZR1L4NZ/aArEqSK85BQqYEUzhWZlAUOz9pbiLL6/I=;
        b=i8qBduAwboGsFn0tMTtnOOKyTFGa1bRQbO9auvQP2tX4H+15ELpPR8++6fwlM+lO+l
         mlN7q49+QAJ7GcdlSNYrI2RPjI0LTcbYulj97fBj91Ghl3C136VrekbXWZQZJDScA1GM
         w5jSW+F3D/c3k4G/1cqd5MQd4Ct6AJzELqcfnS6jnvYEhyplPisPn0YlGZG0F0xcfWHc
         Zz+x25bZiO/G5Lnjq2O4B/fMvA7pMjUbWv3S/Eu2YNZ/HqDUaSX5ConVCw42QNaZPuCb
         XT0WX5w5PYW69vfhbSDKDdmc6l9ND+IRyeSI1z3aP98DXxE8d7MNzGorLKmfz99HmTwy
         FA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yxZR1L4NZ/aArEqSK85BQqYEUzhWZlAUOz9pbiLL6/I=;
        b=gzjf4k2ABnY0381xG4Wg4F/trJruXbg/wys/0OIl/wQIxUlJFGAtsuoApzSMdW2VHB
         UXdsbLAnbfGWW978dL0bi1NCWNf/tIyZ39I4jmpGPuA6XzucRvSnO0aOXilNhIuKIb5Q
         9L0S5TZzv+cdceYH1T8lG3mwPymrQWhdxwAQEudYktsWLaV1qw0MzckyKcS10928fnzl
         ROPrF0Usu5HFMhLx9TDVmK6b4LBJEU5TSDOR9Rt7hVt1NjWN+4tiXFyy8DWATIzpsY9q
         PCgbiN+P+qUL4sVfjmZivUo79P4rz8VPz0ag7/52wiGZNuFPuX9Wz3BjOHJ9cZ5vO7UQ
         ogfw==
X-Gm-Message-State: APjAAAWi0k+2JVMdMtYg1NE6BGsuWoomjoLfKLXwJb24GGhIxKzlgwAW
        ECJ49Mj4uMmNOqpmE19we7D1aUEyQoX+5HYWvJA=
X-Google-Smtp-Source: APXvYqwcahbzWSdr11XQZYNk/1GpCGVvfxUV2OjosKyruu4kAnJ5YMmWthsv+YIVO6ACnLR59cI4d26Jgy3QQXK0WzE=
X-Received: by 2002:a2e:b5b8:: with SMTP id f24mr34446268ljn.188.1574965110321;
 Thu, 28 Nov 2019 10:18:30 -0800 (PST)
MIME-Version: 1.0
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
In-Reply-To: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Thu, 28 Nov 2019 10:18:18 -0800
Message-ID: <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
Subject: Re: Trying the bpf trace a bpf xdp program
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Nov 28, 2019 at 9:20 AM Eelco Chaudron <echaudro@redhat.com> wrote:
>
> Trying out the BPF trace to trace a BPF program, but I=E2=80=99m already
> getting stuck loading the object with the fexit  :(

I can take a look after holidays.

> libbpf: load bpf program failed: Argument list too long
> libbpf: failed to load program 'fexit/xdp_prog_simple'
> libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
> ERROR: Failed to load object file: Operation not permitted

please add -vvv and share full output.
