Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D243B4F9960
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Apr 2022 17:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237531AbiDHP2X (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 8 Apr 2022 11:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbiDHP2X (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 8 Apr 2022 11:28:23 -0400
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30061.outbound.protection.outlook.com [40.107.3.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DEE3981B
        for <xdp-newbies@vger.kernel.org>; Fri,  8 Apr 2022 08:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmTtKmrbM4SFzvMzrxg7/kuDtRgcVCDFmRKliKVx+89Khd7lZmtbmCWO6jKGluxjg/9/iWXJmI7JSmgGW2YYDZixbtFygxGQtVzEdSOjWOO8YtRCyP3S57zQX967HLlIsQlJob9DgObCzfkI3zBOxBOtMjQtwoXuEQVbt6QUFc+mEjV3BCjkBJv0gffDW2uFJKPsNAvcogHJs6pa0asdkLryLEbRZUBGb7L4whjs8ghbl9FRbq+cWjDywAM/bh7wnxOSm+cbS3ZSbo5MraNjaHeN/oG/UkZ2qcCf/PPBGpAuHAw8Y0cO9InCOIaxQSWZarII/BKBIdi9xETfSBchag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Yo9nlv0pneSzLUSoWvpK7LAauEjNmsT5/JQrlo4kSc=;
 b=TU72Mf6TouUqOySVXDNfuQvYgOa8TItNtqyWKZiYCj+DYF1Jcp/6M7D50a0O4n+5mUs93QXlADQvB4IQ3EvFJW2xmBGwI/XTLsaQK8w8HFSr8rxDaK10g0nnCxFqK8BHQp0H0QH/Y3It4tHNbIp6KehMqtBqdWeAYJh0CwtdEXAyOvV+KTDrmdXqgCqraWvSUBRP1PnHGk48zc/1ew+HAOYDihRryz0uilOrkIZxW4gLKZZp1VfypNIvjGQkAtmI+fww+tveEz6R2rBDSnWkaSfQu+BNDnSHyr/chnGnRKdH96WuIl3ClDpH4kN36b+vw5gJse86xRJVnytX8eHreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Yo9nlv0pneSzLUSoWvpK7LAauEjNmsT5/JQrlo4kSc=;
 b=Kja8ou2p9I07T5IHu6HzGS5KBIUXh/SXnzn6P1GQ8aqKq1NDTKcpX1n6oGZnfd1LUK45Hqe/mzC0ZbFT8pekkfvNjiu/lnr9Eg3sj0fAlRsCZ5rGZgHYJ9jJaJPiL+RKZhwbqGeSV6nsMDLvfzqqtVAZEIYqLF/5J66MlN6RCfmRNZcIFrgR7JuT0A2DjN+VdCt7WDPCym2ZPzx5We4np/+Xwe17WxZBA8IqC85mUp8dB7qOziwg+vWBP7fOOtDb1K3bK6AnxJQhtlHWPtjWy5mI1j8yqtb2Irt1QpRFiT9URt7s8Betc2/Q1LTMnxBAAiR8S9Rh+689Tphe+c3wXw==
Received: from DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:38::18) by
 AM9PR10MB4483.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:268::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 15:26:17 +0000
Received: from DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bd1c:280d:42a:9521]) by DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bd1c:280d:42a:9521%7]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 15:26:17 +0000
From:   "Deric, Nemanja" <nemanja.deric@siemens.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
CC:     "Bezdeka, Florian" <florian.bezdeka@siemens.com>
Subject: Questions regarding AF_XDP (ETF, TX queue selection)
Thread-Topic: Questions regarding AF_XDP (ETF, TX queue selection)
Thread-Index: AdhLXPyyE9+aEJuOSm2Hf9t5aDUfkw==
Date:   Fri, 8 Apr 2022 15:26:16 +0000
Message-ID: <DB6PR10MB1558DC7F6B10FD08418EC505EAE99@DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-04-08T15:26:15Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=95b55787-97c3-4250-97bc-b469449a3f39;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac613725-0a8f-427e-21a5-08da19742008
x-ms-traffictypediagnostic: AM9PR10MB4483:EE_
x-microsoft-antispam-prvs: <AM9PR10MB44838EAE36A95E0C5BFFC7F5EAE99@AM9PR10MB4483.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9/B93ZzjcXZPurh2NlwlEELBa0oXAZmYv19R896igHLTqd9K2D0/eSJzjREqlRhQWIVdUyxToUtE99t+9hnqSOVbFb/KaLFAL6Hm2274rGrZwUEgPCEIWFcf1EWMdy9SyyKcJ7FEd5mAEAtBmgfPkUzZzHsqxv5bHSwnPHKnsQQsHTnh1069KuJ7qxJqSU3zGi+EyEMND2ukFt8lGP4gKpSN2s8FmL8xTuxwWceamBKDcNtXpSsRAS4rsbgRsleq9ldD5OvNEWy528fx59KgEN52ge6KVR1QT+WTrlaPLwsJhLg33JKfdmET5Y8z4MhTOXM7EFZISCrz90SgBtd4Pzru+7PCbMOVkdli7S+veTize41G64/gCzlAstBZlq1ycom6kJenYbqChI4nr+SVFfk6X8IWquFRztTrRf8z9Q+G/B+GSBuAwlQ7MKEsywqqhLVUsk0PCWdZvWETC27ysDRTskc1TfC6e19MiRuA4vDQUDIWb9uzpa0ZDW3Ye7+VguDRgP/kDlv9+m014I/FjgcAoEi+Qvn7dZjaTTIg1FsZO8WaqkSggYC0IIcoFtb4rA/+BaQNmFWvlCxPgrjyHvhSNfUnMD6HKznTla7MSCqhYQCOkpq65LV9MfgFE/44S1AIej5ZUozRmnD5LOLTdx22r2TItr8ubtUJXQhU1NGIJ/OJlxsM8N6uPO9w3WQeSDSySROK5tO49i0Q95gUJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(316002)(186003)(55016003)(33656002)(4326008)(9686003)(6506007)(6916009)(7696005)(83380400001)(107886003)(71200400001)(508600001)(82960400001)(66556008)(66446008)(122000001)(86362001)(8676002)(66946007)(64756008)(66476007)(76116006)(2906002)(52536014)(8936002)(38070700005)(5660300002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1+ON8VjzXgNtgdSCzD/37jmkqY0mKtQCSwR/SwBygOF9VjLDsGpPKAQ4LaNm?=
 =?us-ascii?Q?O8BjVPT3wI0jSKXXzAEnbkVe2SOseId4Yf5r7L3pH5C+esvjqslnmVxve7jV?=
 =?us-ascii?Q?lbfquy1jcVcUH6v0UoW08hab79BVrHQXqi3b3NmsrQ7ESItJp1u8yxwMozOW?=
 =?us-ascii?Q?xxoG3emFhC24LvPXXi3aPlqxtn3OC13d1a/35rIGKEStvCCj3Il5DSevYb9D?=
 =?us-ascii?Q?SZq5Q/Ycz+NSotFc4yMflj1zXEfwK7LeksiYGCUhdLdtM3yOcT/gM9y8H7wS?=
 =?us-ascii?Q?8KyzaFOxJESQeSYdwz/9Goa7brCEVdtugo36Hqx3x/ylRnqDdv8k2zzrYOtf?=
 =?us-ascii?Q?AgWOiSNTaa2ZfYtc7dwUnzR/2vSzXmDBliFzzHNDUZgLY6jjadvRWh3IJnC2?=
 =?us-ascii?Q?4+aqHpqJY23psZ3eLF0fArydlgKKZoMmAlMI9O3T3GuZq+yA8ezStNTBG0Gu?=
 =?us-ascii?Q?sy0XI9IgGOsHG+gwMrVaAPnMrDpBij6XSN9w4GpyUQ4SjwuzVrPVIKHU159K?=
 =?us-ascii?Q?UfxD92cBtYrV81ZSxNHLIDDihRbCPtPTFYkP6CB0wgac/tBjWVxIC/87TDcS?=
 =?us-ascii?Q?ploLNHXa6gc8tMPV9jk2oqe+KzNyIzkoPnsEnBQ6RxnNNzmnfAAonFy5/IDi?=
 =?us-ascii?Q?RRBC+R0zuQ8MM+clw1ZWPc4V1GaAh+0eZ2nDw8eEliqyXl67AFwTe1v96wUY?=
 =?us-ascii?Q?+ZO96rkGyRm5RHCrjNakuYqeDoIECWZIzcG6DRQMNUoYK+SoH0q0XVTd36Of?=
 =?us-ascii?Q?+DYHfwzWuuMJFdf9Gy5nBX0Qny5MZspdZnd0qQRut2WmWbxTldMpyI4GD7I1?=
 =?us-ascii?Q?/igTVIKFw0ZgNn0MBuVBmNBq/f7Qz3JQwcFq7CixYv9wNa5omb1LOVdV+25I?=
 =?us-ascii?Q?19oeF8jp98bVGCzJ2SHDLxBtLUn5kZQN/LIAHL0ZdOlI0okw89UKC8d4bpvU?=
 =?us-ascii?Q?Jq/ZjJN8PCKi8pjL6wOHX3121bOy52jToiiFF2WqAY4Dq+5D/J9MSszgk5XB?=
 =?us-ascii?Q?1lk0pQeyq//3MqR84g3hIt+WOie35Ukr4+msKQjvrMmOoa+0fGZqx4Y2/akJ?=
 =?us-ascii?Q?p1M7VyXHQ7U2EpGhw2ErwptqTLIszqXF0X3Mvxcspy9xgKvLVJOQMlDfTY1M?=
 =?us-ascii?Q?RN0JcxHmMPaZFHpv5kK8S7SEl55IxJ9AmYm3laMTAlZWL7572TzMcqzKsycO?=
 =?us-ascii?Q?jf8LU+E3eSxdBOzxZ5E1lg/xkZNa5YUOFsx21lvo2Yvjf56mBpqb+AnRIJ8k?=
 =?us-ascii?Q?W9lKHXNhehe9sVItvj49w2/B01AxjMfFlfuMzKP+Qz7goLwrbnos6Fi2vPG2?=
 =?us-ascii?Q?AvViS2KZZDiB0Ddc8OuK8fe+RwWN+UNO8+7E5qRx4xl0RjRtarSHTje5QryM?=
 =?us-ascii?Q?x9fbv2yxQ8oAeDsrH8uX3+TDCI7ACkMrh+YMs/6+HnJogpKsxOt/fo4iHml2?=
 =?us-ascii?Q?h9vUmW3v8Ex8ZR8+YyWng+kwBKqMHDzKg6Idt7uSds9+E+rmhMk7dMgAgJyP?=
 =?us-ascii?Q?CCoBqi4YO9ufuqLaYRdUO7ywCSRmH3IE4b1daGozVQ7MuAJSaNfxZBf+Ckfb?=
 =?us-ascii?Q?85Q2PYk/kgpNHHY86piRDMlWQqWrwgS0QmrjiErlLK0SBUs1Z3T42HpMlczS?=
 =?us-ascii?Q?8z86bP0EyRXkgBiSxnl+EN0TxrCx7reKBjpgNzDoU/FOCD4K2ttRrMd6UWFI?=
 =?us-ascii?Q?79UML/SKHKsWhCqxB5TSqe9EC+k0e+KMSshjfMFOAzVk9FXPnXZ9tTZF3pqR?=
 =?us-ascii?Q?YNtp5/Q/G+5UgS+hQ6G/EJk2FvsqmOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac613725-0a8f-427e-21a5-08da19742008
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 15:26:16.9869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jdcjxfUZkaciTaUSUdsr51T/W7UThTyQr2PheTLZImJl9DWFByygXg/eyZgQiOPKcSLPwx3ANOgsoFGNF1xAk9fnD2d8/3uB0RgJ15ClBaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4483
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Dear XDP-newbies,

I am Nemanja Deric, and I am working as a Researcher for Industrial=20
Networking Department of Siemens AG (Munich, Germany). Recently,=20
we have started looking into AF_XDP/XDP and its applicability for some=20
of our industrial use cases. Thus, we have a few questions about the=20
technology which we hope that this mailing list can help us clarify.

If you believe that these questions are better suited for some other=20
mailing list or direct email contact, please let me know so that I can=20
contact the correct person/mailing list.

ETF, Timestamping:
In comparison to AF_PACKET sockets AF_XDP sockets do not support=20
timestamping (SOL_TXTIME) yet. There seems no way to pass such=20
request or meta-information to the kernel / NIC. Is that correct? We=20
already heard about "xdp hints" but we have failed to get further=20
information like plans / roadmap / implementation state / ideas.=20
Any pointers where to look at?

TX queue selection:
AF_XDP sockets are always bound to a specific RX queue. Instead,=20
TX queues are "automatically" chosen by the kernel - TX is more or=20
less handled by NAPI. Correct? Has someone already thought about=20
TX queue selection? Any plans / roadmap / details according=20
implementation state available?

In advance, thank you for your help.

Regards,
Nemanja
