Return-Path: <xdp-newbies+bounces-175-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5AA23351
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jan 2025 18:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085913A50C0
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jan 2025 17:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F5C1F0E2D;
	Thu, 30 Jan 2025 17:45:49 +0000 (UTC)
X-Original-To: xdp-newbies@vger.kernel.org
Received: from dediextern.your-server.de (dediextern.your-server.de [85.10.215.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35C4431
	for <xdp-newbies@vger.kernel.org>; Thu, 30 Jan 2025 17:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.215.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738259149; cv=none; b=Om5mDZVVqH3O+vf1yliqgp8Bhf7Qclw0nSf7GjRivNB0YQCALZJyugAB+mGx1fRRHNW29oI8r0kKZy5K7rAuZUsI64btj6IzfcofYzXNkNigVaY0R8NMrMeq7+u/9nTqEPzom+T9j4NpocVQkJxvYfuxqk5ptmHGXp36LM9N+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738259149; c=relaxed/simple;
	bh=VhH0VlnF8FRsGdtAlmtLHuXN+CgXc+F5diSdfrdwObU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=gVCQM2awx9GCzaYkAPUsvhKEmUsa5xCjGEahQkve//ONZd9AbESgwvJWe4XVSjG/74AonsEB6WRMyhZ5HyC76as7mtXZki2NaIqlyN+QKi9PiUVYMlGGx4GknaMTuwM778t9pybKg+mtbi0Z5hrCpgXPEgKj4V3l55/yP7JS/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hetzner-cloud.de; spf=pass smtp.mailfrom=hetzner-cloud.de; arc=none smtp.client-ip=85.10.215.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hetzner-cloud.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hetzner-cloud.de
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by dediextern.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <marcus.wichelmann@hetzner-cloud.de>)
	id 1tdYbp-0000sm-Cg
	for xdp-newbies@vger.kernel.org; Thu, 30 Jan 2025 18:45:45 +0100
Received: from [2a0d:3344:1523:1f10:f118:b2d4:edbb:54af]
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <marcus.wichelmann@hetzner-cloud.de>)
	id 1tdYbp-000Ggn-0f
	for xdp-newbies@vger.kernel.org;
	Thu, 30 Jan 2025 18:45:45 +0100
Message-ID: <7c87d6b6-faaf-414a-92a3-614b0a2045d7@hetzner-cloud.de>
Date: Thu, 30 Jan 2025 18:45:42 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: No xdp_meta area in tun driver
From: Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>
To: xdp-newbies@vger.kernel.org
References: <60a59404-46ca-4cad-a6c3-ac5a7dc20d1f@hetzner-cloud.de>
Content-Language: en-US
Autocrypt: addr=marcus.wichelmann@hetzner-cloud.de; keydata=
 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
 wySmewx3h/yfMh0aFxHhvLPxrO2IEQ==
In-Reply-To: <60a59404-46ca-4cad-a6c3-ac5a7dc20d1f@hetzner-cloud.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------asCrMDOSkIOWZoVqlqjvyImt"
X-Authenticated-Sender: marcus.wichelmann@hetzner-cloud.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27534/Thu Jan 30 10:34:41 2025)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------asCrMDOSkIOWZoVqlqjvyImt
Content-Type: multipart/mixed; boundary="------------wsysqY5wigRxAnxp0VFxLY5L";
 protected-headers="v1"
From: Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>
To: xdp-newbies@vger.kernel.org
Message-ID: <7c87d6b6-faaf-414a-92a3-614b0a2045d7@hetzner-cloud.de>
Subject: Re: No xdp_meta area in tun driver
References: <60a59404-46ca-4cad-a6c3-ac5a7dc20d1f@hetzner-cloud.de>
In-Reply-To: <60a59404-46ca-4cad-a6c3-ac5a7dc20d1f@hetzner-cloud.de>

--------------wsysqY5wigRxAnxp0VFxLY5L
Content-Type: multipart/mixed; boundary="------------7eusKXOpct0raQ9xJvW2IK0P"

--------------7eusKXOpct0raQ9xJvW2IK0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMTUuMDEuMjUgdW0gMjM6NDMgc2NocmllYiBNYXJjdXMgV2ljaGVsbWFubjoNCj4gSGks
DQo+IA0KPiBJIG5vdGljZWQgdGhhdCwgb3RoZXIgdGhhbiBtb3N0IG5ldHdvcmtpbmcgZHJp
dmVycywgdGhlIGB0dW5gIGRyaXZlciBoYXMgbm8gc3VwcG9ydCBmb3IgdGhlDQo+IFhEUCBt
ZXRhZGF0YSBhcmVhIHlldC4gKHhkcC0+ZGF0YV9tZXRhID09IHhkcC0+ZGF0YSArIDEpDQo+
IElzIHRoZXJlIGEgc3BlY2lmaWMgcmVhc29uLCB3aHkgaXQgY2Fubm90IG5vdCBiZSBpbXBs
ZW1lbnRlZCBmb3IgdGhlIHR1biBkcml2ZXIsIG9yIGlzIHRoaXMNCj4ganVzdCBiZWNhdXNl
IG5vYm9keSBjYW1lIGFyb3VuZCB0byBpbXBsZW1lbnQgaXQgeWV0Pw0KPiANCj4gVGhlIGhl
YWRyb29tIHJlc2VydmVkIGluIHRoZSB0dW4gZHJpdmVyIHNlZW1zIGhpZ2ggZW5vdWdoIChU
VU5fUlhfUEFEICsgWERQX1BBQ0tFVF9IRUFEUk9PTSksDQo+IHNvIEkgd291bGQgdGhpbmsg
dGhhdCBpdCBzaG91bGQgZml0Li4/DQo+IA0KPiBUaGFua3MhDQo+IA0KPiBNYXJjdXMgV2lj
aGVsbWFubg0KPiBIZXR6bmVyIENsb3VkIEdtYkgNCg0KRm9yIHRoZSByZWNvcmQsIGhlcmUg
aXMgYSBwYXRjaCBmb3IgdGhpczoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI1
MDEzMDE3MTYxNC4xNjU3MjI0LTEtbWFyY3VzLndpY2hlbG1hbm5AaGV0em5lci1jbG91ZC5k
ZS9ULyN1DQo=
--------------7eusKXOpct0raQ9xJvW2IK0P
Content-Type: application/pgp-keys; name="OpenPGP_0x49D307BF9FAC470E.asc"
Content-Disposition: attachment; filename="OpenPGP_0x49D307BF9FAC470E.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3Di5X7
-----END PGP PUBLIC KEY BLOCK-----

--------------7eusKXOpct0raQ9xJvW2IK0P--

--------------wsysqY5wigRxAnxp0VFxLY5L--

--------------asCrMDOSkIOWZoVqlqjvyImt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEFajXhmFJ6Ejg51NnSdMHv5+sRw4FAmebuscACgkQSdMHv5+s
Rw4LxQ//T8AzyDt6uiMsfez3nUIoWUNuoLJGIprd5kDKiN877X0lrV75bF2XsiKj
jPebSWXxEubK7W4WQ9u7tldifb8X81yuq/ZU37WzXqIN6Yzt3PZd8QndsTSMLS2g
YdWFX4vqW3bfUSHXr4r7cfLlYgbujE6wG9rob148by5SMDFAM0A34TOmgL/7/5hH
C9Ny+5kxn0/f4HGhonDIii9t0kLy3qco5y9mEcdx6ygWH6qGU/cYUqajw1xV+nj2
k03lFqFujBWrX94h8jDEWUQTbQHONNuvTXDKSXT/keNQ1JQgn9M06KKkDUTAKIFe
mrrF5Bm7NdYdnHzhUTR1hK4+lE93kv/GGZZgOxIAu0RB6AUCVG+BH2k0kreECBWd
OVHmOaLB6V4evle25JciPwWhhCb5Gk53rN2t3XqngNuqPsV04IvMiOgrB+kLOifk
m54vKQgz4lkbWWiBd00Rdk/uXc7X9CNSF/0zruVFRLkJpVWm3uWnpd+7qJggVC9K
/USPINRyAmC9fFe2yET0DNYM21VJT2KHsh1//FNu7zxp9Sl4+vTXUWT/TqlUDl22
GCXOsStCRh5X3BVfujXzG1k2XtBZhJ6FHgokoxyqDwaIj+pYfWbOO1rpY17Bs1Fr
BiAzEbsGjv6NP+nUcbYPEKjAHBa2Tkr+afZbbpnAGDmypROKtQw=
=LSr6
-----END PGP SIGNATURE-----

--------------asCrMDOSkIOWZoVqlqjvyImt--

