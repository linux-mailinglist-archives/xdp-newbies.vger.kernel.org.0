Return-Path: <xdp-newbies+bounces-47-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C211854AD1
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Feb 2024 14:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1D228DAEF
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Feb 2024 13:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0575054BD8;
	Wed, 14 Feb 2024 13:56:38 +0000 (UTC)
X-Original-To: xdp-newbies@vger.kernel.org
Received: from dediextern.your-server.de (dediextern.your-server.de [85.10.215.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A362054BC7
	for <xdp-newbies@vger.kernel.org>; Wed, 14 Feb 2024 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.215.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707918997; cv=none; b=YDsDCLQweuOIThqjLyKsaDXHUQfROgGLY0eaT3fakf2rDl+ImVslRCFw/0ZZU52tigNlmas1HC2G8mbIvtGx4R+i5+crlUXSG0fj8uqqHfKCdpgSgKtxdhHW0nvPUO9QneWZPk+slOnZcN5syfGoyat1y8pKCJtXhXvTZU9pZ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707918997; c=relaxed/simple;
	bh=UVyTBDiTdYN66J9q8HdEv/y8xIoc81jSfIsXK3LZvJM=;
	h=Message-ID:Date:MIME-Version:To:References:From:Subject:
	 In-Reply-To:Content-Type; b=ozrtwuKe0mtu2iegEQR6DlsdP5PBvwGpGVXumiixm2nxQh88iy2qJnm23PvnRMe9AAH+yqYpjjDRrp5iL870Nx8KI6FjOMKeRbCjdeBP0Rfnwp5b7/8gwMWl+VTkbDHUVFUsrhoWbkbNGcJTGArYMt+TLaINDFtzv6P7saLF17c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hetzner-cloud.de; spf=pass smtp.mailfrom=hetzner-cloud.de; arc=none smtp.client-ip=85.10.215.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hetzner-cloud.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hetzner-cloud.de
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by dediextern.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <marcus.wichelmann@hetzner-cloud.de>)
	id 1raFIW-000HcE-Iv; Wed, 14 Feb 2024 14:27:36 +0100
Received: from [2a0d:3344:1523:1f10:a815:1281:47eb:d190]
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <marcus.wichelmann@hetzner-cloud.de>)
	id 1raFIW-000G87-Dg; Wed, 14 Feb 2024 14:27:36 +0100
Message-ID: <bcb43611-a463-4d1a-a6f6-dac340d571f8@hetzner-cloud.de>
Date: Wed, 14 Feb 2024 14:27:35 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 xdp-newbies@vger.kernel.org
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
 <87le7ofre3.fsf@toke.dk>
From: Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>
Autocrypt: addr=marcus.wichelmann@hetzner-cloud.de; keydata=
 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
 wySmewx3h/yfMh0aFxHhvLPxrO2IEQ==
Subject: Re: XDP packet queueing and scheduling capabilities
In-Reply-To: <87le7ofre3.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Authenticated-Sender: marcus.wichelmann@hetzner-cloud.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27185/Wed Feb 14 10:22:57 2024)

QW0gMTMuMDIuMjQgdW0gMTQ6MDMgc2NocmllYiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW46
DQo+IFdoYXQncyB5b3VyIGludGVyZXN0IGluIHRoaXM/IEkuZS4sIHdoYXQgZG8geW91IHdh
bnQgdG8gdXNlIHRoZW0gZm9yPw0KPiBXb3VsZCBiZSB1c2VmdWwgdG8ga25vdyBzbyBJIGNh
biBtYWtlIHN1cmUgdGhpcyBpcyBjb3ZlcmVkIDopDQoNCkhpLCBqdXN0IHdhbnRpbmcgdG8g
bGV0IHlvdSBrbm93IHRoYXQgd2UncmUgYWxzbyBzdGlsbCB2ZXJ5IGludGVyZXN0ZWQgDQpp
biB0aGlzIGZvciBvdXIgY2xvdWQtcHJvdmlkZXIgdXNlIGNhc2UuDQoNCldlIHVzZSBYRFAg
dG8gcm91dGUgcGFja2V0cyB0byBhbmQgZnJvbSBWTXMgYW5kIHdhbnQgdG8gYWxzbyBhcHBs
eSANCmZpcmV3YWxsIHJ1bGVzIG9uIHRoZSB3YXkuIEZvciB0aGlzLCB3ZSBuZWVkIHRvIGJ1
ZmZlci9kZWxheSByZW9yZGVyZWQgDQpJUCBmcmFnbWVudHMgdGhhdCBhcnJpdmVkIGJlZm9y
ZSB0aGUgZmlyc3QgZnJhZ21lbnQgdW50aWwgd2UgaGF2ZSBzZWVuIA0KdGhlIHJlcXVpcmVk
IEw0IGhlYWRlci4NCg0KSGF2aW5nIGEgcGFja2V0IHF1ZXVlIGZvciB0aGlzLCBsaWtlIGlu
IHlvdXIgcGF0Y2gsIHRoYXQgY2FuIGFsc28gYmUgDQpkZXF1ZXVlZCBhZ2Fpbiwgd291bGQg
ZGVmaW5pdGl2ZWx5IGJlIGhlbHBmdWwgZm9yIHRoYXQuDQoNCldlJ2QgYWxzbyBsaWtlIHRv
IGltcGxlbWVudCBzaGFwaW5nIGluIHRoZSBmdXR1cmUsIHNvIHRoaXMgaXMgYWxzbyB2ZXJ5
IA0KaW50ZXJlc3RpbmcgZm9yIHVzLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCk1hcmN1cyBX
aWNoZWxtYW5uDQpTRE4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCkhl
dHpuZXIgQ2xvdWQgR21iSA0KRmVyaW5nYXN0cmHDn2UgMTJBDQo4NTc3NCBVbnRlcmbDtmhy
aW5nDQpHZXJtYW55DQoNClBob25lOiArNDkgODkgMzgxNjkwIDE1MA0KRS1NYWlsOiBtYXJj
dXMud2ljaGVsbWFubkBoZXR6bmVyLWNsb3VkLmRlDQoNCkhhbmRlbHNyZWdpc3RlciBNw7xu
Y2hlbiBIUkIgMjI2NzgyDQpHZXNjaMOkZnRzZsO8aHJlcjogU2ViYXN0aWFuIEbDpHJiZXIs
IE1hcmt1cyBLYWxtdWsNCg0KLS0tLS0tLS0tLS0tLS0tLS0tDQpGb3IgaW5mb3JtYXRpb24g
b24gdGhlIHByb2Nlc3Npbmcgb2YgeW91ciBwZXJzb25hbA0KZGF0YSBpbiB0aGUgY29udGV4
dCBvZiB0aGlzIGNvbnRhY3QsIHBsZWFzZSBzZWUNCmh0dHBzOi8vaGV0em5lci1jbG91ZC5k
ZS9kYXRlbnNjaHV0eg0KLS0tLS0tLS0tLS0tLS0tLS0tDQo=

