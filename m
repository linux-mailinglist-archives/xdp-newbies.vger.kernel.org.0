Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D14714CA60
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Jan 2020 13:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgA2MJ5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Jan 2020 07:09:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53305 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726186AbgA2MJ5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Jan 2020 07:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580299795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Mqv8u0kDQ0e55K1eQsHbJ1Ne80h0/I4L2ic1yL4ihYo=;
        b=fv8V/cUMnGsjOHrCCV2arVMwKWsVsE4prhdk573DBl08rptRZWSf6k4olZMP76U+Nzi+7t
        zc7MawQN3eQtZX/UDVNv+Y6++ZoV34M9RIaUaHv/t0DMHO9DtDvbsauXYjVaFUYMakbBti
        hhJgtMCMLKsco52Sow2vw+PBVLu6UjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-y_nV_A1ENZiJz7zQyN-BaQ-1; Wed, 29 Jan 2020 07:09:52 -0500
X-MC-Unique: y_nV_A1ENZiJz7zQyN-BaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0967018B5FA3;
        Wed, 29 Jan 2020 12:09:51 +0000 (UTC)
Received: from carbon (ovpn-200-56.brq.redhat.com [10.40.200.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2A19884BC4;
        Wed, 29 Jan 2020 12:09:46 +0000 (UTC)
Date:   Wed, 29 Jan 2020 13:09:45 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Measuring/Debugging XDP Performance
Message-ID: <20200129130945.733deacf@carbon>
In-Reply-To: <b1d478e6-555c-97da-f967-4f10f879f589@gflclan.com>
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
        <20200123141122.3783e298@carbon>
        <23ec64c0-e0d7-a60b-ecc4-6ca401dc4896@gflclan.com>
        <20200123213808.7a1f200b@carbon>
        <fdd597bf-7da9-f9bd-d97f-f1bd90f14281@gflclan.com>
        <b1d478e6-555c-97da-f967-4f10f879f589@gflclan.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Hq/MD+ZN9n9isat+s6MDNry"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

--MP_/Hq/MD+ZN9n9isat+s6MDNry
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, 28 Jan 2020 12:42:21 -0600
Christian Deacon <gamemann@gflclan.com> wrote:

> I understand the `e1000e` driver doesn't have XDP support upstream. 
> Therefore, I tried implementing the driver patch that adds XDP support 
> here <https://github.com/adjavon/e1000e_xdp>. Unfortunately, this patch 
> was based off of kernel 4.10.2 (I'm using 4.19). Therefore, I had to 
> manually implement the patch code (this is my first time messing with 
> NIC driver code). Sadly, it doesn't seem like the patch worked based off 
> of the 'perf' results which are attached. I still see "do_xdp_generic" 

I do think it would be more valuable to implement XDP for driver igb.

Given igb is a "slow" 1Gbit/s interface, we could also just fix
XDP-generic to avoid the reallocation of the SKB for every packet...
I've attached two patches which does exactly that. It sounds like you
know howto apply patches and recompile your kernel(?)

I've tested this on my testlab.  The igb hardware seems is limited
to 1.2Mpps.  Using an XDP_DROP test program, I observe the CPU
processing packets use 50% CPU time before, and 36% CPU time after the
patches.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

--MP_/Hq/MD+ZN9n9isat+s6MDNry
Content-Type: application/octet-stream; name=01-04-xdp-headroom
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=01-04-xdp-headroom

eGRwOiBhY2NlcHQgdGhhdCBYRFAgaGVhZHJvb20gaXNuJ3QgYWx3YXlzIGVxdWFsIFhEUF9QQUNL
RVRfSEVBRFJPT00KCkZyb206IEplc3BlciBEYW5nYWFyZCBCcm91ZXIgPGJyb3VlckByZWRoYXQu
Y29tPgoKVGhlIEludGVsIGJhc2VkIGRyaXZlcnMgKGl4Z2JlICsgaTQwZSkgaGF2ZSBpbXBsZW1l
bnRlZCBYRFAgd2l0aApoZWFkcm9vbSAxOTIgYnl0ZXMgYW5kIG5vdCB0aGUgcmVjb21tZW5kZWQg
MjU2IGJ5dGVzIGRlZmluZWQgYnkKWERQX1BBQ0tFVF9IRUFEUk9PTS4gIEZvciBnZW5lcmljLVhE
UCwgYWNjZXB0IHRoYXQgdGhpcyBoZWFkcm9vbQppcyBhbHNvIGEgdmFsaWQgc2l6ZS4KClN0aWxs
IGZvciBnZW5lcmljLVhEUCBpZiBoZWFkcm9vbSBpcyBsZXNzLCBzdGlsbCBleHBhbmQgaGVhZHJv
b20gdG8KWERQX1BBQ0tFVF9IRUFEUk9PTSBhcyB0aGlzIGlzIHRoZSBkZWZhdWx0IGluIG1vc3Qg
WERQIGRyaXZlcnMuCgpTaWduZWQtb2ZmLWJ5OiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIDxicm91
ZXJAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvYnBmLmggfCAgICAxICsKIG5l
dC9jb3JlL2Rldi5jICAgICAgICAgICB8ICAgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xp
bnV4L2JwZi5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2JwZi5oCmluZGV4IGYxZDc0YTJiZDIzNC4u
MmQ5M2NiMWY5NDMzIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvYnBmLmgKKysrIGIv
aW5jbHVkZS91YXBpL2xpbnV4L2JwZi5oCkBAIC0zMjkxLDYgKzMyOTEsNyBAQCBzdHJ1Y3QgYnBm
X3hkcF9zb2NrIHsKIH07CiAKICNkZWZpbmUgWERQX1BBQ0tFVF9IRUFEUk9PTSAyNTYKKyNkZWZp
bmUgWERQX1BBQ0tFVF9IRUFEUk9PTV9NSU4gMTkyCiAKIC8qIFVzZXIgcmV0dXJuIGNvZGVzIGZv
ciBYRFAgcHJvZyB0eXBlLgogICogQSB2YWxpZCBYRFAgcHJvZ3JhbSBtdXN0IHJldHVybiBvbmUg
b2YgdGhlc2UgZGVmaW5lZCB2YWx1ZXMuIEFsbCBvdGhlcgpkaWZmIC0tZ2l0IGEvbmV0L2NvcmUv
ZGV2LmMgYi9uZXQvY29yZS9kZXYuYwppbmRleCAzOGJjMzVkYTM5ZjcuLmM1NGVkOTA2NjcyNCAx
MDA2NDQKLS0tIGEvbmV0L2NvcmUvZGV2LmMKKysrIGIvbmV0L2NvcmUvZGV2LmMKQEAgLTQ1MzEs
MTEgKzQ1MzEsMTEgQEAgc3RhdGljIHUzMiBuZXRpZl9yZWNlaXZlX2dlbmVyaWNfeGRwKHN0cnVj
dCBza19idWZmICpza2IsCiAJCXJldHVybiBYRFBfUEFTUzsKIAogCS8qIFhEUCBwYWNrZXRzIG11
c3QgYmUgbGluZWFyIGFuZCBtdXN0IGhhdmUgc3VmZmljaWVudCBoZWFkcm9vbQotCSAqIG9mIFhE
UF9QQUNLRVRfSEVBRFJPT00gYnl0ZXMuIFRoaXMgaXMgdGhlIGd1YXJhbnRlZSB0aGF0IGFsc28K
KwkgKiBvZiBYRFBfUEFDS0VUX0hFQURST09NX01JTiBieXRlcy4gVGhpcyBpcyB0aGUgZ3VhcmFu
dGVlIHRoYXQgYWxzbwogCSAqIG5hdGl2ZSBYRFAgcHJvdmlkZXMsIHRodXMgd2UgbmVlZCB0byBk
byBpdCBoZXJlIGFzIHdlbGwuCiAJICovCiAJaWYgKHNrYl9pc19ub25saW5lYXIoc2tiKSB8fAot
CSAgICBza2JfaGVhZHJvb20oc2tiKSA8IFhEUF9QQUNLRVRfSEVBRFJPT00pIHsKKwkgICAgc2ti
X2hlYWRyb29tKHNrYikgPCBYRFBfUEFDS0VUX0hFQURST09NX01JTikgewogCQlpbnQgaHJvb20g
PSBYRFBfUEFDS0VUX0hFQURST09NIC0gc2tiX2hlYWRyb29tKHNrYik7CiAJCWludCB0cm9vbSA9
IHNrYi0+dGFpbCArIHNrYi0+ZGF0YV9sZW4gLSBza2ItPmVuZDsKIAo=

--MP_/Hq/MD+ZN9n9isat+s6MDNry
Content-Type: application/octet-stream; name=02-igb-adjust-headroom
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=02-igb-adjust-headroom

aWdiOiBpbmNyZWFzZSBoZWFkcm9vbSB0byBjb29wZXJhdGUgd2l0aCBYRFAtZ2VuZXJpYwoKRnJv
bTogSmVzcGVyIERhbmdhYXJkIEJyb3VlciA8YnJvdWVyQHJlZGhhdC5jb20+CgpJbmNyZWFzZSB0
aGUgcGFja2V0IGhlYWRyb29tIHRvIDE5MiBieXRlcy4KClRoaXMgd29ya3MsIGJ1dCBkdWUgdG8g
TklDIFRpbWVTdGFtcCBoZWFkZXIgKElHQl9UU19IRFJfTEVOID0gMTYpLApwcm92aWRpbmcgMTky
IGJ5dGVzIGhlYWRyb29tLCBjYXVzZSB0aGUgZHJpdmVyIHRvIHVzZSBvcmRlci0xIHBhZ2VzCig4
MTkyIGJ5dGVzKSB0byBzdG9yZSBwYWNrZXRzLiAgVGhpcyBpcyBvbmx5IGEgcHJvYmxlbSBpZiB0
aGUgVFMKaGVhZGVyIGlzIGNvbWJpbmVkIHdpdGggYSBWTEFOIGhlYWRlciBhbmQgaXMgYSBNVFUg
c2l6ZWQgcGFja2V0cy4KCkEgc29sdXRpb24gd291bGQgYmUgdG8gZGV0ZWN0IGlmIEhXIHRpbWVz
dGFtcCBpcyBlbmFibGVkLCBidXQgSQpjb3VsZG4ndCBmaW5kIGFuIGVhc3kgdGVzdC4KClNpZ25l
ZC1vZmYtYnk6IEplc3BlciBEYW5nYWFyZCBCcm91ZXIgPGJyb3VlckByZWRoYXQuY29tPgotLS0K
IGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYi9pZ2IuaCAgICAgIHwgICAgOSArKysrKysr
LS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYi9pZ2JfbWFpbi5jIHwgICAgMyArKy0K
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYi9pZ2IuaCBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L2ludGVsL2lnYi9pZ2IuaAppbmRleCA0OWI1ZmE5ZDQ3ODMuLjRjNjg5ZmU5NDdk
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaWdiL2lnYi5oCisrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYi9pZ2IuaApAQCAtMTM3LDEwICsxMzcsMTUg
QEAgc3RydWN0IHZmX21hY19maWx0ZXIgewogI2RlZmluZSBJR0JfUlhfSERSX0xFTgkJSUdCX1JY
QlVGRkVSXzI1NgogI2RlZmluZSBJR0JfVFNfSERSX0xFTgkJMTYKIAotI2RlZmluZSBJR0JfU0tC
X1BBRAkJKE5FVF9TS0JfUEFEICsgTkVUX0lQX0FMSUdOKQorLyogSGVhZHJvb20gMTkyIGZpdCBN
VFUgc2l6ZSBFdGhlcm5ldCBmcmFtZSBpbnRvIDJLIHdpdGggc2tiX3NoYXJlZF9pbmZvICovCisj
ZGVmaW5lIElHQl9TS0JfUEFECQkxOTIKKy8vIEZJWE1FOiBXaGF0IGFib3V0IE5FVF9JUF9BTElH
Tj8KKwogI2lmIChQQUdFX1NJWkUgPCA4MTkyKQogI2RlZmluZSBJR0JfTUFYX0ZSQU1FX0JVSUxE
X1NLQiBcCiAJKFNLQl9XSVRIX09WRVJIRUFEKElHQl9SWEJVRkZFUl8yMDQ4KSAtIElHQl9TS0Jf
UEFEIC0gSUdCX1RTX0hEUl9MRU4pCisJIC8vIEhtbS4uLiB0aGlzIC1JR0JfVFNfSERSX0xFTiBt
aWdodCBiZSBhIHByb2JsZW0KKwkvLyAyMDQ4IC0gMzIwIC0gMTkyIC0gMTYgPSAxNTIwCiAjZWxz
ZQogI2RlZmluZSBJR0JfTUFYX0ZSQU1FX0JVSUxEX1NLQiAoSUdCX1JYQlVGRkVSXzIwNDggLSBJ
R0JfVFNfSERSX0xFTikKICNlbmRpZgpAQCAtMzQ4LDcgKzM1Myw3IEBAIHN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgaW50IGlnYl9yeF9wZ19vcmRlcihzdHJ1Y3QgaWdiX3JpbmcgKnJpbmcpCiB7CiAj
aWYgKFBBR0VfU0laRSA8IDgxOTIpCiAJaWYgKHJpbmdfdXNlc19sYXJnZV9idWZmZXIocmluZykp
Ci0JCXJldHVybiAxOworCQlyZXR1cm4gMTsgLy8gcGFnZSBvcmRlci0xID0gODE5MiBieXRlcwog
I2VuZGlmCiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9p
bnRlbC9pZ2IvaWdiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYi9pZ2Jf
bWFpbi5jCmluZGV4IGI0NmJmZjhmZTA1Ni4uOGVkM2RiMjdkNGQyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9pZ2IvaWdiX21haW4uYworKysgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9pbnRlbC9pZ2IvaWdiX21haW4uYwpAQCAtNDU2Nyw3ICs0NTY3LDcgQEAgc3RhdGlj
IHZvaWQgaWdiX3NldF9yeF9idWZmZXJfbGVuKHN0cnVjdCBpZ2JfYWRhcHRlciAqYWRhcHRlciwK
ICNpZiAoUEFHRV9TSVpFIDwgODE5MikKIAlpZiAoYWRhcHRlci0+bWF4X2ZyYW1lX3NpemUgPD0g
SUdCX01BWF9GUkFNRV9CVUlMRF9TS0IpCiAJCXJldHVybjsKLQorCS8vIElzc3VlICgxNTIyIDw9
IDE1MjApIC0tPiBzZXRfcmluZ191c2VzX2xhcmdlX2J1ZmZlcgogCXNldF9yaW5nX3VzZXNfbGFy
Z2VfYnVmZmVyKHJ4X3JpbmcpOwogI2VuZGlmCiB9CkBAIC02MjU2LDYgKzYyNTYsNyBAQCBzdGF0
aWMgaW50IGlnYl9jaGFuZ2VfbXR1KHN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYsIGludCBuZXdf
bXR1KQogewogCXN0cnVjdCBpZ2JfYWRhcHRlciAqYWRhcHRlciA9IG5ldGRldl9wcml2KG5ldGRl
dik7CiAJaW50IG1heF9mcmFtZSA9IG5ld19tdHUgKyBFVEhfSExFTiArIEVUSF9GQ1NfTEVOICsg
VkxBTl9ITEVOOworCS8vIDE1MDAgKyAxNCArIDQgKyA0ID0gMTUyMgogCiAJLyogYWRqdXN0IG1h
eCBmcmFtZSB0byBiZSBhdCBsZWFzdCB0aGUgc2l6ZSBvZiBhIHN0YW5kYXJkIGZyYW1lICovCiAJ
aWYgKG1heF9mcmFtZSA8IChFVEhfRlJBTUVfTEVOICsgRVRIX0ZDU19MRU4pKQo=

--MP_/Hq/MD+ZN9n9isat+s6MDNry--

