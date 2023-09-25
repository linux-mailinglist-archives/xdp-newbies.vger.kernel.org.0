Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D408D7AD22C
	for <lists+xdp-newbies@lfdr.de>; Mon, 25 Sep 2023 09:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbjIYHpT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 25 Sep 2023 03:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjIYHpQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 25 Sep 2023 03:45:16 -0400
X-Greylist: delayed 523 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Sep 2023 00:44:50 PDT
Received: from mail.mavenbizbuilders.pl (mail.mavenbizbuilders.pl [217.61.23.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665CC197
        for <xdp-newbies@vger.kernel.org>; Mon, 25 Sep 2023 00:44:49 -0700 (PDT)
Received: by mail.mavenbizbuilders.pl (Postfix, from userid 1002)
        id A5602823FA; Mon, 25 Sep 2023 09:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mavenbizbuilders.pl;
        s=mail; t=1695627364;
        bh=eDz+Sjl+yzEpSesSLCYHZ+CLqawaxo8QNW1VskJ4zaQ=;
        h=Date:From:To:Subject:From;
        b=gUOKVLQr0pZ64QDExOjxVQJw9OXQix/LbEcDXKhNDWbkAUOSQFuqOJA/6nx3LRpCP
         /ypjH/4tQ8sZaJqroxx+qIIqokNTqQ1AwcSfORpFP78R1nXebGpdwhwUS4et4xJwCH
         FtwERFsWC1IWnkDqYcZ9AEAc/VkRs/F8g8SK4P/WITtPAudqJeBaLZ8v9GO5bdobOf
         qaBHzD7F8wRF38/ycEPYH58mJXFZWY9Wj4Pk9wahGd1EZA6rhxO1gvxZDDerz+EpLR
         u9btdJuJjmjxy7hj9esPFbDTt2mo8sYs7ROtWN/pQ2/eaziOe+Br2+e/5pT9O9TGwB
         wWOSomUK1lqMQ==
Received: by mail.mavenbizbuilders.pl for <xdp-newbies@vger.kernel.org>; Mon, 25 Sep 2023 07:36:01 GMT
Message-ID: <20230925084500-0.1.t.2vhf.0.ihhe56nnud@mavenbizbuilders.pl>
Date:   Mon, 25 Sep 2023 07:36:01 GMT
From:   "Mariusz Witczuk" <mariusz.witczuk@mavenbizbuilders.pl>
To:     <xdp-newbies@vger.kernel.org>
Subject: =?UTF-8?Q?Przyznano_now=C4=85_dotacj=C4=99?=
X-Mailer: mail.mavenbizbuilders.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: mavenbizbuilders.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [217.61.23.202 listed in zen.spamhaus.org]
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.1126]
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [217.61.23.202 listed in list.dnswl.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: mavenbizbuilders.pl]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Dzie=C5=84 dobry,

chcemy poinformowa=C4=87 Pa=C5=84stwa o mo=C5=BCliwo=C5=9Bci uzyskania do=
finansowania na instalacj=C4=99 systemu fotowoltaicznego i magazyn=C3=B3w=
 energii.=20

Pi=C4=85ta edycja Programu M=C3=B3j Pr=C4=85d znacz=C4=85co rozszerza zak=
res i kwot=C4=99 dofinansowania kt=C3=B3ra wynosi 58 tys. z=C5=82, gdzie =
w poprzedniej edycji, mo=C5=BCna by=C5=82o otrzyma=C4=87 nie wi=C4=99cej =
ni=C5=BC 31 tys. z=C5=82.=20

Jako firma specjalizuj=C4=85ca si=C4=99 w monta=C5=BCu i serwisie fotowol=
taiki ch=C4=99tnie podejmiemy si=C4=99 realizacji ca=C5=82ego projektu wr=
az z przygotowaniem, z=C5=82o=C5=BCeniem i rozliczeniem wniosku o dotacj=C4=
=99. =20

Kiedy mogliby=C5=9Bmy um=C3=B3wi=C4=87 si=C4=99 na kr=C3=B3tk=C4=85 rozmo=
w=C4=99 w celu zbadania potrzeb?=20


Pozdrawiam
Mariusz Witczuk
