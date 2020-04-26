Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505C41B916C
	for <lists+xdp-newbies@lfdr.de>; Sun, 26 Apr 2020 18:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgDZQHY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 26 Apr 2020 12:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725778AbgDZQHX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 26 Apr 2020 12:07:23 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC5DC061A0F
        for <xdp-newbies@vger.kernel.org>; Sun, 26 Apr 2020 09:07:23 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id t12so3314995oot.2
        for <xdp-newbies@vger.kernel.org>; Sun, 26 Apr 2020 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=whDN6kY62CGZ19sIAEVmRaM63t6zzMcR/tUPd9NfgF8=;
        b=IBAX/U8s8FHE4BPu0LxoKwkoxHweGFe9rGIpUagk93xnshfsJa5XqZC+gW4cEHpvS4
         /tzfAI2yYz4RCv0kuTSAAun5Ei3vlmO2M+KmIXfafolrg2D4HMq7eEIrVW5ANETMrV6I
         RllfJgVUV67bDVNFz0Y4iMcUlO1Fy0HM6hpnnc2hrmx8hnVvegPrvbxgxUF4ju3+aWQM
         QCIlgqVhx5YzwNKmrCjM5ifWZYwc/6t+I6uxgn0xRPITvJXFPbaHwfrBZ9s6EiW5R+sv
         24HG0iPfcZM+s46uYG2qONuqaSH3uaIc31koaL9/n3mg+uOazuLBPZvm+LcapVVZZS4x
         zlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=whDN6kY62CGZ19sIAEVmRaM63t6zzMcR/tUPd9NfgF8=;
        b=DGD1IbtOUa1c7/nzR2gCo5ktg15CbVue8ZRB+OBh4nzc9/oA8YbE6RgOQDIMlnUX74
         SDjviDBMSnS1OYGCst7aGiMgRBXRqyY+TLbCIeF4PtRHfUrVEBle6m6ARiZn5kLzVUlh
         srt38kUZllRrdQdLZaPeX9s7+pUEjLxwIgmqpHxhIz2EhyBQ6Dk3P7hDzvdoQ05TqVTG
         FB+EnokPYR2F7uaHuXt/hhomm8t/GQRrmRAD+tD+Htf5duteICDKZD7lKBY9nox2G6+k
         wT78SCtbMjSzW03QRzwtE9IYxcywjZDARoxXh82UlhwN5VCuPs5XlfM4ERPMbc23fBF0
         LHvw==
X-Gm-Message-State: AGi0PubfT6atZ/ZJm6T8yM4E9v1lDBDfzU6uhBeCzoeqcxhoA9A4ruAr
        jR1km/D5DMU2cpiSUbfWGrLihRVw4l0re/XgzH0oh+2i
X-Google-Smtp-Source: APiQypKiAUtDCNLRpsnuNTJxC2D+BfakUgPXfUc3MGz6tWSEJVGFcw1Qfc9363Z/iPbO4xlR5urlNf2fBUf0OthxRh8=
X-Received: by 2002:a4a:d355:: with SMTP id d21mr4576343oos.66.1587917242452;
 Sun, 26 Apr 2020 09:07:22 -0700 (PDT)
MIME-Version: 1.0
From:   Jesse DuMond <suttonshiredev@gmail.com>
Date:   Sun, 26 Apr 2020 12:07:11 -0400
Message-ID: <CAJEJvEW31-O9x-0WsipVqSf-kPy8HnWnB6gG2jeQTH5WWm2iqw@mail.gmail.com>
Subject: Error creating a AF_XDP socket after deleting
To:     xdp-newbies@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000002b810005a433cbab"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

--0000000000002b810005a433cbab
Content-Type: text/plain; charset="UTF-8"

Hi there,

I am writing some test code that tries  repeatedly to create a umem
and socket and then deletes them both. I'm using the libbpf function
xsk_umem__create/delete and xsk_socket__create/xsk_socket__delete. I
am getting an EBUSY from xsk_socket__create when trying to create a
socket after deleting a socket on the same interface and queue number.
The attached program reproduces the error.

I've traced the EBUSY error to this call to xdp_umem_assign_dev in the
kernel: https://github.com/torvalds/linux/blob/v5.3/net/xdp/xsk.c#L500
That call is made during the bind call in xsk_socket__create. As far
as I can tell this error is because the work of xdp_umem_clear_dev is
actually called asynchronously after xsk_socket__delete. Putting a
sleep between xsk_socket__delete and xsk_socket__create makes this
code succeed.

Am I trying to do something that is not supposed to be supported?

--0000000000002b810005a433cbab
Content-Type: text/x-csrc; charset="US-ASCII"; name="test.c"
Content-Disposition: attachment; filename="test.c"
Content-Transfer-Encoding: base64
Content-ID: <f_k9h8dw8g0>
X-Attachment-Id: f_k9h8dw8g0

LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KI2luY2x1ZGUgPGVycm5vLmg+
CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdHJpbmcu
aD4KI2luY2x1ZGUgPHN5cy9tbWFuLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KCiNpbmNsdWRlIDxi
cGYvbGliYnBmLmg+CiNpbmNsdWRlIDxicGYveHNrLmg+CiNpbmNsdWRlIDxicGYvYnBmLmg+Cgpp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCnsKCXZvaWQgKmJ1ZnM7CglzdHJ1Y3QgeHNr
X3VtZW0gKnVtZW07CglzdHJ1Y3QgeHNrX3NvY2tldCAqc29ja2V0OwoJc3RydWN0IHhza19yaW5n
X3Byb2QgZnE7CglzdHJ1Y3QgeHNrX3JpbmdfY29ucyBjcTsKCXN0cnVjdCB4c2tfcmluZ19wcm9k
IHR4OwoJc3RydWN0IHhza19yaW5nX2NvbnMgcng7CglzdHJ1Y3QgeHNrX3VtZW1fY29uZmlnIHVj
ZmcgPSB7CgkJLmZpbGxfc2l6ZSA9IDQsCgkJLmNvbXBfc2l6ZSA9IDQsCgkJLmZyYW1lX3NpemUg
PSAyMDQ4LAoJCS5mcmFtZV9oZWFkcm9vbSA9IDAsCgkJLmZsYWdzID0gMAoJfTsKCXN0cnVjdCB4
c2tfc29ja2V0X2NvbmZpZyBzY2ZnID0gewoJCS5yeF9zaXplID0gNCwKCQkudHhfc2l6ZSA9IDQs
CgkJLmxpYmJwZl9mbGFncyA9IFhTS19MSUJCUEZfRkxBR1NfX0lOSElCSVRfUFJPR19MT0FELAoJ
CS5iaW5kX2ZsYWdzID0gMCwKCQkueGRwX2ZsYWdzID0gMAoJfTsKCWludCByZXQ7CgoJYnVmcyA9
IG1tYXAoTlVMTCwgNCAqIDIwNDgsCgkJICAgIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCgkJICAg
IE1BUF9QUklWQVRFIHwgTUFQX0FOT05ZTU9VUywgLTEsIDApOwoJaWYgKGJ1ZnMgPT0gTUFQX0ZB
SUxFRCkgewoJCXByaW50ZigiRVJST1I6IG1tYXAgZmFpbGVkXG4iKTsKCQlleGl0KEVYSVRfRkFJ
TFVSRSk7Cgl9CgoJcmV0ID0geHNrX3VtZW1fX2NyZWF0ZSgmdW1lbSwgYnVmcywgNCoyMDQ4LCAm
ZnEsICZjcSwgJnVjZmcpOwoJaWYgKHJldCkgewoJCXByaW50ZigiRVJST1I6IHhza191bWVtX19j
cmVhdGUgZmFpbGVkOiAlZCAoJXMpXG4iLCAtcmV0LCBzdHJlcnJvcigtcmV0KSk7CgkJZXhpdCgx
KTsKCX0KCgoJcmV0ID0geHNrX3NvY2tldF9fY3JlYXRlKCZzb2NrZXQsICJ0ZXN0IiwgMCwgdW1l
bSwgJnJ4LCAmdHgsICZzY2ZnKTsKCWlmIChyZXQpIHsKCQlwcmludGYoIkVSUk9SOiB4c2tfc29j
a2V0X19jcmVhdGUgZmFpbGVkOiAlZCAoJXMpXG4iLCByZXQsIHN0cmVycm9yKC1yZXQpKTsKCQll
eGl0KDEpOwoJfQoKCXhza19zb2NrZXRfX2RlbGV0ZShzb2NrZXQpOwoJeHNrX3VtZW1fX2RlbGV0
ZSh1bWVtKTsKCS8vc2xlZXAoMSk7CglyZXQgPSB4c2tfdW1lbV9fY3JlYXRlKCZ1bWVtLCBidWZz
LCA0KjIwNDgsICZmcSwgJmNxLCAmdWNmZyk7CglpZiAocmV0KSB7CgkJcHJpbnRmKCJFUlJPUjog
c2Vjb25kIHhza191bWVtX19jcmVhdGUgZmFpbGVkOiAlZCAoJXMpXG4iLCAtcmV0LCBzdHJlcnJv
cigtcmV0KSk7CgkJZXhpdCgxKTsKCX0KCgoJcmV0ID0geHNrX3NvY2tldF9fY3JlYXRlKCZzb2Nr
ZXQsICJ0ZXN0IiwgMCwgdW1lbSwgJnJ4LCAmdHgsICZzY2ZnKTsKCWlmIChyZXQpIHsKCQlwcmlu
dGYoIkVSUk9SOiBzZWNvbmQgeHNrX3NvY2tldF9fY3JlYXRlIGZhaWxlZDogJWQgKCVzKVxuIiwg
cmV0LCBzdHJlcnJvcigtcmV0KSk7CgkJZXhpdCgxKTsKCX0KCglyZXR1cm4gMDsKfQo=
--0000000000002b810005a433cbab--
