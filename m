Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5667AD3E
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Jul 2019 18:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfG3QGt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Jul 2019 12:06:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:61529 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbfG3QGt (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Jul 2019 12:06:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 09:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; 
   d="p7s'?scan'208";a="323248740"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
  by orsmga004.jf.intel.com with ESMTP; 30 Jul 2019 09:06:46 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jul 2019 09:06:46 -0700
Received: from orsmsx116.amr.corp.intel.com ([169.254.7.85]) by
 ORSMSX159.amr.corp.intel.com ([169.254.11.26]) with mapi id 14.03.0439.000;
 Tue, 30 Jul 2019 09:06:46 -0700
From:   "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
To:     "zeffron@riotgames.com" <zeffron@riotgames.com>,
        "brouer@redhat.com" <brouer@redhat.com>
CC:     "Topel, Bjorn" <bjorn.topel@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>
Subject: Re: Intel 800 series 100Gbe NIC with XDP
Thread-Topic: Intel 800 series 100Gbe NIC with XDP
Thread-Index: AQHVRr+AzruW5CfwWkaJmP8cUxvxIqbjyWiA
Date:   Tue, 30 Jul 2019 16:06:44 +0000
Message-ID: <8866a9ab6814ab3d5062526e5317a5045bf3acc7.camel@intel.com>
References: <CAC1LvL3xoHQo_oNJEVa4DeZ3G9R6Z61ukScRuMq5UrnRCHWo1g@mail.gmail.com>
         <20190730121349.538b5299@carbon>
In-Reply-To: <20190730121349.538b5299@carbon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
x-originating-ip: [10.22.230.62]
Content-Type: multipart/signed; micalg=sha-1;
        protocol="application/x-pkcs7-signature"; boundary="=-FIo2bzXRsMNFsL8mqcx6"
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

--=-FIo2bzXRsMNFsL8mqcx6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-30 at 12:13 +0200, Jesper Dangaard Brouer wrote:
> On Mon, 29 Jul 2019 16:27:01 -0700
> Zvi Effron <zeffron@riotgames.com> wrote:
>=20
> > Hello all,
> >=20
> > I was wondering if anyone knew if the upcoming 800 series Intel
> > NICs
> > with 100gbe support XDP? I don't yet see a new driver for them, but
> > they may be reusing the i40e driver, or I may have missed it? If
> > they
> > do support it, do they maybe also support hardware mode (as opposed
> > to
> > driver mode)?
>=20
> Good to see that Intel customers are requesting XDP support, for new
> HW
> and associated drivers.
>=20
> AFAIK Linux kernel driver is called ICE for Intel 800 series NIC[1]
> (which supports 100/50/25/10 Gbit/s Ethernet).  (p.s. I don't have
> this
> hardware in my testlab).
>=20
> It is located in the kernel tree[2]: drivers/net/ethernet/intel/ice/.
> Reading and grepping the code for 'xdp', reveals that this driver
> doesn't support XDP.  So, I guess you need to buy your 100G hardware
> from another vendor, or convince Intel to add XDP support.

We had pushed patches that add XDP and AF_XDP support for ice to Jeff
Kirsher's next-queue tree (links below), but it appears that some
rework is required before we can push it to net-next. This is being
worked on right now.

https://patchwork.ozlabs.org/patch/1123016/
https://patchwork.ozlabs.org/patch/1123017/

Please note that the above patches are for reference only. Final
patches will be posted when available.

Best,
Ani

>=20
>=20
> Code details: Strangely it looks like this driver always does a
> memcpy
> of the headers into linear part of a 256 bytes SKB, and attach the
> payload as a SKB "fragment". (I wonder why this was chosen?)
>   It should still be easy to add a XDP step before doing this (in
> ice_clean_rx_irq() just after call to ice_get_rx_buf())
>=20
>=20
> [1]=20
> https://www.intel.com/content/www/us/en/architecture-and-technology/ether=
net/introducing-800-series.html
> [2]=20
> https://github.com/torvalds/linux/tree/master/drivers/net/ethernet/intel/=
ice

--=-FIo2bzXRsMNFsL8mqcx6
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKkDCCBOsw
ggPToAMCAQICEDabxALowUBS+21KC0JI8fcwDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzEyMTEwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRCMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
yzuW/y/g0bznz8BD48M94luFzqHaqY9yGN9H/W0J7hOVBpl0rTQJ6kZ7z7hyDb9kf2UW4ZU25alC
i+q5m6NwHg+z9pcN7bQ84SSBueaYF7cXlAg7z3XyZbzSEYP7raeuWRf5fYvYzq8/uI7VNR8o/43w
PtDP10YDdO/0J5xrHxnC/9/aU+wTFSVsPqxsd7C58mnu7G4VRJ0n9PG4SfmYNC0h/5fLWuOWhxAv
6MuiK7MmvTPHLMclULgJqVSqG1MbBs0FbzoRHne4Cx0w6rtzPTrzo+bTRqhruaU18lQkzBk6OnyJ
UthtaDQIlfyGy2IlZ5F6QEyjItbdKcHHdjBX8wIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFNpBI5xaj3GvV4M+INPjZdsMywvbMA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAp9XGgH85hk/3IuN8F4nrFd24MAoau7Uq
M/of09XtyYg2dV0TIPqtxPZw4813r78WwsGIbvtO8VQ18dNktIxaq6+ym2zebqDh0z6Bvo63jKE/
HMj8oNV3ovnuo+7rGpCppcda4iVBG2CetB3WXbUVr82EzECN+wxmC4H9Rup+gn+t+qeBTaXulQfV
TYOvZ0eZPO+DyC2pVv5q5+xHljyUsVqpzsw89utuO8ZYaMsQGBRuFGOncRLEOhCtehy5B5aCI571
i4dDAv9LPODrEzm3PBfrNhlp8C0skak15VXWFzNuHd00AsxXxWSUT4TG8RiAH61Ua5GXsP1BIZwl
4WjK8DCCBZ0wggSFoAMCAQICEzMAAHkTIVKrqmsvplQAAAAAeRMwDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEIwHhcNMTkwMzI4MjE0NDAwWhcNMjAwMzIyMjE0NDAwWjBTMSAwHgYDVQQDExdWZW5rYXRh
cmFtYW5hbiwgQW5pcnVkaDEvMC0GCSqGSIb3DQEJARYgYW5pcnVkaC52ZW5rYXRhcmFtYW5hbkBp
bnRlbC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDPPX+0SJUnoJn/QQe45hv+
2hy7yVCOmRl/okheyYURkSYsgQaE0ippJL9VarJgxN55OC/aQwWXhsA630zEkFDSRE2EL3RKOm69
K88EDMYOE50lhPIM4+Ok+qNcouxKyq1WAinVcth/mkU0V+B7ZlGuLT/NFbHU4i3wcioJbkL0LM3d
gZmE6XGr4fHvrfIy7GuwExhYxxhIN7dkcxiEIFK3zmWPKIBTJR1fD2vS1RBmUq0pBxZsRspMw8uE
fF1cNsswxcoxyePubePRgpaTggYywjZH8jBEIc+dGvqKjszgr471qusQAGRQ1+8PY3IHomOmXvHW
mgQYnVFHzf57QoNnAgMBAAGjggJCMIICPjAdBgNVHQ4EFgQUyz8uDggnt8gzLwXuqIhmuVeKbggw
HwYDVR0jBBgwFoAU2kEjnFqPca9Xgz4g0+Nl2wzLC9swZQYDVR0fBF4wXDBaoFigVoZUaHR0cDov
L3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIw
SXNzdWluZyUyMENBJTIwNEIuY3JsMIGeBggrBgEFBQcBAQSBkTCBjjAhBggrBgEFBQcwAYYVaHR0
cDovL29jc3AuaW50ZWwuY29tMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3LmludGVsLmNvbS9yZXBv
c2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIw
Q0ElMjA0Qi5jcnQwCwYDVR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWE
meVRg/2BKIWOn1OCkcAJZ4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQB
gjcKAwwwKQYJKwYBBAGCNxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMMF0GA1UdEQRW
MFSgMAYKKwYBBAGCNxQCA6AiDCBhbmlydWRoLnZlbmthdGFyYW1hbmFuQGludGVsLmNvbYEgYW5p
cnVkaC52ZW5rYXRhcmFtYW5hbkBpbnRlbC5jb20wDQYJKoZIhvcNAQEFBQADggEBABEzcpLmjuoH
y140sRNwpV4LiDZP52cyTmnyBn9QUfe6EvpUg/XnC8eqDscJWRInuI5tIGhRafDNGRP0QLEPDeDy
wOavrAlXhWbiJYq2hxR544WkSH5t5NuTPP7pPcIymW4CZopLGZw3VURc8bn8iWUURuaZXv3il16L
egwmcjSOo+mujehMYvnI5Oefn1KoqGrRDm4TDIjvU0QthboZgEsm003UzimpWbRQXy09xDE8nxj3
7yl4FG0Rv/XC5FJLXd5ilACRoOMPMxCuFUFdwS6/DwTLy0YBeG1PIwFLuAA+GrECm1JNXkn8bEqm
4D/5L544i4xPvLwg3Ot0mefamn0xggIXMIICEwIBATCBkDB5MQswCQYDVQQGEwJVUzELMAkGA1UE
CBMCQ0ExFDASBgNVBAcTC1NhbnRhIENsYXJhMRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlvbjEr
MCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFzaWMgSXNzdWluZyBDQSA0QgITMwAAeRMhUquqay+m
VAAAAAB5EzAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMTkwNzMwMTYwNjQzWjAjBgkqhkiG9w0BCQQxFgQU9PwqnMplv+PUGBnt2helZxRtBTIw
DQYJKoZIhvcNAQEBBQAEggEAV3VcIk7RYlq+6w/VUlsoX7Kt/Icg7xY51QyoMfJnYV34EaQ/qoYT
m8RWf1zHcVtQN7ZaBvzGJFYSlz+qriIAFLWqhfsM8pbPqUObnFYAMDcvKA/byBmzeyjfmoLF/At5
LbVnTytrgvTpWC4UAMSH8gAYKsiBzgsAGUQNhCsBpj28ehJG1m8XvIINO3hJU/hHklZnQpZbHfbr
ZSbTsKa6eyutGsSglNtM6VB7JQbQ3NvVz0tfbEsFRVbZPKkpNN/aMCqlH8cFE4qoWt64AtwIU6Sq
p4V1oIOa756paXbbgnorEZ4W/8oMuRy4+UgDiYpQrOinHFD34gNrEDnkTQaV1gAAAAAAAA==


--=-FIo2bzXRsMNFsL8mqcx6--
