﻿-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: Himall2_1
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Himall_AccountDetails`
--

DROP TABLE IF EXISTS `Himall_AccountDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_AccountDetails` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AccountId` bigint(20) NOT NULL COMMENT '结算记录外键',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Date` datetime NOT NULL COMMENT '完成日期',
  `OrderDate` datetime NOT NULL COMMENT '订单下单日期',
  `OrderType` int(11) NOT NULL COMMENT '枚举 完成订单1，退订单0',
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `ProductActualPaidAmount` decimal(18,2) NOT NULL COMMENT '商品实付总额',
  `FreightAmount` decimal(18,2) NOT NULL COMMENT '运费金额',
  `CommissionAmount` decimal(18,2) NOT NULL COMMENT '佣金',
  `RefundTotalAmount` decimal(18,2) NOT NULL COMMENT '退款金额',
  `RefundCommisAmount` decimal(18,2) NOT NULL COMMENT '退还佣金',
  `OrderRefundsDates` varchar(300) NOT NULL COMMENT '退单的日期集合以;分隔',
  PRIMARY KEY (`Id`),
  KEY `himall_accountdetails_ibfk_1` (`AccountId`) USING BTREE,
  CONSTRAINT `himall_accountdetails_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `Himall_Accounts` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8 COMMENT='结算详细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_AccountDetails`
--

LOCK TABLES `Himall_AccountDetails` WRITE;
/*!40000 ALTER TABLE `Himall_AccountDetails` DISABLE KEYS */;
INSERT INTO `Himall_AccountDetails` VALUES (308,202,1,'2015-10-08 18:14:28','2015-10-08 18:12:26',1,2015100888340498,45.00,0.00,0.00,0.00,0.00,''),(309,202,1,'2015-10-12 11:43:25','2015-10-09 13:55:25',1,2015100947826621,20.00,0.00,0.00,0.00,0.00,''),(310,202,1,'2015-10-12 12:00:37','2015-10-12 11:59:26',1,2015101296168092,0.01,0.00,0.00,0.00,0.00,'');
/*!40000 ALTER TABLE `Himall_AccountDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_AccountMeta`
--

DROP TABLE IF EXISTS `Himall_AccountMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_AccountMeta` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AccountId` bigint(20) NOT NULL,
  `MetaKey` varchar(100) NOT NULL,
  `MetaValue` text NOT NULL,
  `ServiceStartTime` datetime NOT NULL COMMENT '营销服务开始时间',
  `ServiceEndTime` datetime NOT NULL COMMENT '营销服务结束时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_AccountMeta`
--

LOCK TABLES `Himall_AccountMeta` WRITE;
/*!40000 ALTER TABLE `Himall_AccountMeta` DISABLE KEYS */;
INSERT INTO `Himall_AccountMeta` VALUES (41,202,'限时购','2.00','2015-07-09 00:00:00','2015-08-09 15:36:43'),(42,202,'优惠券','2.00','2015-07-16 00:00:00','2015-08-16 14:04:31'),(43,202,'限时购','4.00','2015-08-09 15:36:43','2015-10-09 15:36:43'),(44,202,'限时购','2.00','2015-10-09 15:36:43','2015-11-09 15:36:43'),(45,202,'组合购','100.00','2015-10-09 00:00:00','2016-08-09 09:48:07'),(46,202,'随机红包','100.00','2015-10-09 00:00:00','2016-08-09 14:16:51'),(47,202,'优惠券','4.00','2015-08-16 14:04:31','2015-10-16 14:04:31'),(48,202,'优惠券','4.00','2015-10-16 14:04:31','2015-12-16 14:04:31'),(49,202,'随机红包','10.00','2016-08-09 14:16:51','2016-09-09 14:16:51'),(50,202,'限时购','2.00','2015-11-09 15:36:43','2015-12-09 15:36:43'),(51,202,'优惠券','2.00','2015-12-16 14:04:31','2016-01-16 14:04:31'),(52,202,'随机红包','100.00','2016-09-09 14:16:51','2017-07-09 14:16:51');
/*!40000 ALTER TABLE `Himall_AccountMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_AccountPurchaseAgreement`
--

DROP TABLE IF EXISTS `Himall_AccountPurchaseAgreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_AccountPurchaseAgreement` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AccountId` bigint(20) DEFAULT NULL,
  `ShopId` bigint(20) NOT NULL,
  `Date` datetime NOT NULL COMMENT '日期',
  `PurchaseAgreementId` bigint(20) NOT NULL,
  `AdvancePayment` decimal(18,2) NOT NULL COMMENT '预付款金额',
  `FinishDate` datetime NOT NULL COMMENT '平台审核时间',
  `ApplyDate` datetime DEFAULT NULL COMMENT '申请',
  PRIMARY KEY (`Id`),
  KEY `AccountId` (`AccountId`) USING BTREE,
  CONSTRAINT `himall_accountpurchaseagreement_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `Himall_Accounts` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='结算预付款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_AccountPurchaseAgreement`
--

LOCK TABLES `Himall_AccountPurchaseAgreement` WRITE;
/*!40000 ALTER TABLE `Himall_AccountPurchaseAgreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_AccountPurchaseAgreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Accounts`
--

DROP TABLE IF EXISTS `Himall_Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Accounts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `AccountDate` datetime NOT NULL COMMENT '出账日期',
  `StartDate` datetime NOT NULL COMMENT '开始时间',
  `EndDate` datetime NOT NULL COMMENT '结束时间',
  `Status` int(11) NOT NULL COMMENT '枚举 0未结账，1已结账',
  `ProductActualPaidAmount` decimal(18,2) NOT NULL COMMENT '商品实付总额',
  `FreightAmount` decimal(18,2) NOT NULL COMMENT '运费',
  `CommissionAmount` decimal(18,2) NOT NULL COMMENT '佣金',
  `RefundCommissionAmount` decimal(18,2) NOT NULL COMMENT '退还佣金',
  `RefundAmount` decimal(18,2) NOT NULL COMMENT '退款金额',
  `AdvancePaymentAmount` decimal(18,2) NOT NULL COMMENT '预付款总额',
  `PeriodSettlement` decimal(18,2) NOT NULL COMMENT '本期应结',
  `Remark` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Accounts`
--

LOCK TABLES `Himall_Accounts` WRITE;
/*!40000 ALTER TABLE `Himall_Accounts` DISABLE KEYS */;
INSERT INTO `Himall_Accounts` VALUES (202,1,'官方自营店','2015-10-14 05:30:01','2015-10-08 00:00:00','2015-11-06 23:59:59',0,65.01,0.00,0.00,0.00,0.00,332.00,-266.99,'');
/*!40000 ALTER TABLE `Himall_Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ActiveMarketService`
--

DROP TABLE IF EXISTS `Himall_ActiveMarketService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ActiveMarketService` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL COMMENT '营销服务类型ID',
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='店铺购买的营销服务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ActiveMarketService`
--

LOCK TABLES `Himall_ActiveMarketService` WRITE;
/*!40000 ALTER TABLE `Himall_ActiveMarketService` DISABLE KEYS */;
INSERT INTO `Himall_ActiveMarketService` VALUES (9,2,210,'扣扣电脑城'),(11,1,210,'扣扣电脑城'),(14,2,215,'糖糖的店铺'),(15,1,223,'伟亿'),(16,1,1,'官方自营店'),(18,2,223,'伟亿'),(21,2,1,'官方自营店'),(23,1,215,'糖糖的店铺'),(39,3,1,'官方自营店'),(40,4,1,'官方自营店'),(41,2,233,'123'),(42,2,232,'zara专卖'),(43,2,235,'Life Style'),(44,2,236,'fex电子数码芙蓉店'),(45,2,237,'西城电子'),(46,2,238,'步走寻常路'),(47,2,240,'小肖的店铺'),(48,1,247,'数码旗舰店'),(49,2,247,'数码旗舰店'),(50,3,247,'数码旗舰店');
/*!40000 ALTER TABLE `Himall_ActiveMarketService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Agreement`
--

DROP TABLE IF EXISTS `Himall_Agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Agreement` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AgreementType` int(4) NOT NULL COMMENT '协议类型 枚举 AgreementType：0买家注册协议，1卖家入驻协议',
  `AgreementContent` text NOT NULL COMMENT '协议内容',
  `LastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk COMMENT='协议表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Agreement`
--

LOCK TABLES `Himall_Agreement` WRITE;
/*!40000 ALTER TABLE `Himall_Agreement` DISABLE KEYS */;
INSERT INTO `Himall_Agreement` VALUES (1,0,'<div><p><strong>【审慎阅读】</strong>您在申请注册流程中点击同意前，应当认真阅读以下协议。<strongstyle=\"text-decoration:underline\">请您务必审慎阅读、充分理解协议中相关条款内容，其中包括：</strong></p><p>1、<strongstyle=\"text-decoration:underline\">与您约定免除或限制责任的条款；</strong></p><p>2、<strongstyle=\"text-decoration:underline\">与您约定法律适用和管辖的条款；</strong></p><p>3、<strongstyle=\"text-decoration:underline\">其他以粗体下划线标识的重要条款。</strong></p><p>如您对协议有任何疑问，可向平台客服咨询。</p><p><strong>【特别提示】</strong>当您按照注册页面提示填写信息、阅读并同意协议且完成全部注册程序后，即表示您已充分阅读、理解并接受协议的全部内容。如您因平台服务与Himall发生争议的，适用《Himall平台服务协议》处理。如您在使用平台服务过程中与其他用户发生争议的，依您与其他用户达成的协议处理。</p><p><strongstyle=\"text-decoration:underline\">阅读协议的过程中，如果您不同意相关协议或其中任何条款约定，您应立即停止注册程序。</strong></p><p><a target=\"_blank\">《Himall服务协议》</a></p><p><a target=\"_blank\">《法律声明及隐私权政策》</a></p><p><a target=\"_blank\"></a></p><pstyle=\"text-align:center\"></p></div>','2015-07-15 16:54:35'),(2,1,'<div class=\"board_content\"><p>	为了更好地开拓市场，更好地为本地客户服务，甲乙双方本着互惠互利的双赢策略，根据乙方崇左商城入驻条件，甲方申请入驻乙方商城，并完全接受乙方的规范，经友好协商，甲乙双方签署以下入驻协议。</p><p>	<br>一、&nbsp;入驻商家基本条件<br>1、&nbsp;有良好的合作意愿，能提供优质的商品，保证合作的顺利进行，并保证提供良好的售后服务；<br>2、&nbsp;甲方必须满足以下条件之一（符合其中一项即可）：<br>⑴授权商，获得国际或者国内知名品牌厂商的授权；<br>⑵拥有自己注册商标的生产型厂商；<br>⑶专业品牌经销商，代理商，B2C网站；<br>⑷专业品牌专卖店。<br>3、&nbsp;甲方应在签订本协议时向乙方提供（经乙方认可的）包括但不限于以下证明材料复印件：<br>⑴营业执照 (包括个体户营业执照)、税务登记证；<br>⑵拥有注册商标或者品牌，或者拥有正规的品牌授权书。<br>4、&nbsp;甲方承诺：<br>⑴所有商品一口价销售（参与打折、促销、秒杀活动除外）；<br>⑵七天无损坏不影响二次销售情况下换货(如商品无质量问题，且包装未破坏不影响二次销售，换货费用由买家承担，每张订单只提供一次换货服务；如属商品质量问题，换货费用由商家承担)；<br>⑶实体店地址变更应及时告知乙方；<br>⑷参加乙方全网积分购物活动；<br>⑸所有商品保证原厂正品，保障商品质量、承诺售后服务，必要时能提供销售发票。</p><p>	<br>二、&nbsp;入驻商铺类型<br>1、&nbsp;展示型商铺；<br>2、&nbsp;销售型商铺。</p><p>	&nbsp;</p><p>	三、入驻商铺等级</p><p>	1、普通商铺</p><p>	2、扶持商铺；</p><p>	3、拓展商铺；</p><p>	4、旗舰商铺。</p><p>	<br>三、&nbsp;商铺入驻开通流程<br>1、&nbsp;甲乙双方签署本协议；<br>2、&nbsp;甲方根据所选择商铺类型，提交相应的证明材料复印件；<br>3、&nbsp;在乙方非常商城注册，获取管理员账号；<br>4、&nbsp;乙方审核通过后，甲方即可发布商品并展示经营活动。</p><p>	<br>四、&nbsp;双方权利义务<br>甲方权利义务：<br>1、&nbsp;在本协议第一条规定范围内，甲方自行开拓市场与发展业务，不得以欺诈、胁迫等不正当手段损害客户或甲方的利益与声誉；<br>2、&nbsp;甲方妥善保管商铺管理员账号，如因甲方保管、设置或使用不当造成的经济损失，由甲方自行承担责任；<br>3、&nbsp;甲方在使用过程中如发现任何非法盗用乙方账号出现安全漏洞等情况，应立即通知乙方<br>4、&nbsp;甲方保证其所有经营活动完全符合中国有关法律、法规、行政规章等的规定。如因甲方违反上述规定给乙方带来任何损害，甲方应承担所有法律责任并赔偿由此给甲方造成的损失；<br>5、&nbsp;在协议有效期内，甲方不得向与乙方构成商业竞争关系的企业、商业机构或者组织提供有关乙方相关信息或者资料，否则对乙方造成损失的，由甲方负责赔偿。<br>乙方权利义务：<br>1、&nbsp;乙方对甲方提供必要的开店技术咨询，并保证商城系统平台能正常稳定运行；<br>2、&nbsp;如甲方是托管商铺，乙方应及时为甲方进行店铺更新并实时进行日常管理；<br>3、&nbsp;在本协议有效期限内，乙方有权根据市场情况对各种商铺入驻条件进行调整。</p><p>	<br>五、&nbsp;协议期限<br>本协议有效期为一年，自签订之日起生效。有效期满后，双方可视合作情况续约。</p><p>	六、&nbsp;协议变更、终止及违约责任<br>1、&nbsp;甲乙双方应本着诚实信用的原则履行本协议。任何一方在履约过程中采用欺诈、胁迫或者暴力的手段，另一方均可以解除本协议并要求对方赔偿由此造成的损失；<br>2、&nbsp;在协议执行期间，如果双方或一方认为需要终止，应提前一个月通知对方，双方在财务结算完毕、各自责任明确履行之后，方可终止协议。某方擅自终止本协议，给对方造成损失的，应赔偿对方损失；<br>3、&nbsp;经双方协商达成一致，可以对本协议有关条款进行变更，但应当以书面形式确认；<br>4、&nbsp;一方变更通讯地址或其它联系方式，应自变更之日起十日内，将变更后的地址、联系方式通知另一方，否则变更方应对此造成的一切后果承担责任；<br>5、&nbsp;如因客观情况发生重大变化，致使本协议无继续法履行的，经甲乙双方协商同意，可以变更或者终止协议的履行。</p><p><br>七、&nbsp;保密条款<br>1、甲、乙双方所提供给对方的一切资料、技术和对项目的策划设计要严保密，并只能在合作双方公司的业务范围内使用；<br>2、甲、乙双方均应对在合作过程中所知悉的对的商业和技术秘密承担保密义务。保密条款不受本协议期限的限制。</p><p>	<br>八、&nbsp;争解决<br>在本协议执行期间如果双方发生争议，双方应友好协商解决。如果协商不成，双方同意提交崇左市仲裁委员会进行仲裁，接受其仲裁规则，并服从该仲裁裁决，仲裁费由败诉方承担。争议的解适用中华人民共和国法律、法规、条例和计算机行业惯例。</p></div>','2015-07-15 16:54:35');
/*!40000 ALTER TABLE `Himall_Agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ApplyWithDraw`
--

DROP TABLE IF EXISTS `Himall_ApplyWithDraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ApplyWithDraw` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemId` bigint(20) NOT NULL COMMENT '会员ID',
  `NickName` varchar(50) DEFAULT NULL COMMENT '微信昵称',
  `OpenId` varchar(50) DEFAULT NULL COMMENT 'OpenId',
  `ApplyStatus` int(11) NOT NULL COMMENT '申请状态',
  `ApplyAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `ApplyTime` datetime NOT NULL COMMENT '申请时间',
  `ConfirmTime` datetime DEFAULT NULL COMMENT '处理时间',
  `PayTime` datetime DEFAULT NULL COMMENT '付款时间',
  `PayNo` varchar(50) DEFAULT NULL COMMENT '付款流水号',
  `OpUser` varchar(50) DEFAULT NULL COMMENT '操作人',
  `Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ApplyWithDraw`
--

LOCK TABLES `Himall_ApplyWithDraw` WRITE;
/*!40000 ALTER TABLE `Himall_ApplyWithDraw` DISABLE KEYS */;
INSERT INTO `Himall_ApplyWithDraw` VALUES (112,541,'夹缝','osRzujiNxw7RQS772gNjwTcjW-EQ',2,1.00,'2015-10-12 13:57:18','2015-10-14 14:12:31',NULL,NULL,'HimallDemoUser','微信内支付');
/*!40000 ALTER TABLE `Himall_ApplyWithDraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ArticleCategories`
--

DROP TABLE IF EXISTS `Himall_ArticleCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ArticleCategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentCategoryId` bigint(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL COMMENT '文章类型名称',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '显示顺序',
  `IsDefault` tinyint(1) NOT NULL COMMENT '是否为默认',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ArticleCategories`
--

LOCK TABLES `Himall_ArticleCategories` WRITE;
/*!40000 ALTER TABLE `Himall_ArticleCategories` DISABLE KEYS */;
INSERT INTO `Himall_ArticleCategories` VALUES (1,0,'首页服务',1,1),(2,0,'系统快报',2,1),(3,0,'资讯中心',3,1),(4,0,'平台公告',4,1),(9,1,'购物指南',1,0),(10,1,'店主之家',1,0),(11,1,'支付方式',1,0),(12,1,'售后服务',1,0),(13,1,'关于我们',1,0),(14,0,'保障服务',1,1),(15,14,'七天无理由',1,1),(16,14,'消费者保障',1,1),(17,14,'及时发货服',1,1);
/*!40000 ALTER TABLE `Himall_ArticleCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Articles`
--

DROP TABLE IF EXISTS `Himall_Articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Articles` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryId` bigint(20) NOT NULL DEFAULT '0' COMMENT '文章分类ID',
  `Title` varchar(100) NOT NULL COMMENT '文章标题',
  `IconUrl` varchar(100) DEFAULT NULL,
  `Content` mediumtext NOT NULL COMMENT '文档内容',
  `AddDate` datetime NOT NULL,
  `DisplaySequence` bigint(20) NOT NULL,
  `Meta_Title` text COMMENT 'SEO标题',
  `Meta_Description` text COMMENT 'SEO说明',
  `Meta_Keywords` text COMMENT 'SEO关键字',
  `IsRelease` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`Id`),
  KEY `FK_ArticleCategory_Article` (`CategoryId`) USING BTREE,
  CONSTRAINT `himall_articles_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `Himall_ArticleCategories` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='系统文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Articles`
--

LOCK TABLES `Himall_Articles` WRITE;
/*!40000 ALTER TABLE `Himall_Articles` DISABLE KEYS */;
INSERT INTO `Himall_Articles` VALUES (1,2,'4K智能电视2599元起',NULL,'<p>4K智能电视2599元起</p>','2014-09-24 15:32:58',1,NULL,NULL,NULL,1),(2,2,'9.9元起，品蟹品酒季',NULL,'<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a target=\"_blank\" title=\"9.9元起，品蟹品酒季\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none;\">9.9元起，品蟹品酒季</a></p></li></ul><p><br/></p>','2014-09-24 15:33:15',1,NULL,NULL,NULL,1),(3,2,'彩票2元，买了就抽奖！',NULL,'<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a target=\"_blank\" title=\"彩票2元，买了就抽奖！\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none;\">彩票2元，买了就抽奖！</a></p></li></ul><p><br/></p>','2014-09-24 15:33:26',1,NULL,NULL,NULL,1),(4,2,'秋季运动惠大牌低至5折',NULL,'<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a target=\"_blank\" title=\"秋季运动惠大牌低至5折\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none;\">秋季运动惠大牌低至5折</a></p></li></ul><p><br/></p>','2014-09-24 15:33:36',1,NULL,NULL,NULL,1),(5,2,'《好妈妈2》新书7折抢',NULL,'<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a target=\"_blank\" title=\"《好妈妈2》新书7折抢\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none;\">《好妈妈2》新书7折抢</a></p></li></ul><p><br/></p>','2014-09-24 15:33:45',1,NULL,NULL,NULL,1),(6,2,'秋季服装 五折封顶',NULL,'<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a target=\"_blank\" title=\"秋季服装 五折封顶    \" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none;\">秋季服装 五折封顶</a></p></li></ul><p><br/></p>','2014-09-24 15:33:53',1,NULL,NULL,NULL,1),(7,2,'十一提前购 美孚299疯抢',NULL,'<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a target=\"_blank\" title=\"十一提前购 美孚299疯抢\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none;\">十一提前购 美孚299疯抢</a></p></li></ul><p><br/></p>','2014-09-24 15:34:02',1,NULL,NULL,NULL,1),(8,2,'好蟹四免一',NULL,'<p><a target=\"_blank\" title=\"京东管控 好蟹四免一\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none; font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">好蟹四免一</a></p>','2014-09-24 15:34:13',1,NULL,NULL,NULL,1),(12,3,'良良寝居满319减80 ',NULL,'<p>良良寝居满319减80 </p>','2014-10-27 00:00:00',1,NULL,NULL,NULL,1),(13,9,'购物流程图',NULL,'<p><img alt=\"\" src=\"/Storage/Plat/Article/13/b116555e5f664e8ebeaebf8d783b4916.jpg\" style=\"margin: 10px; padding: 0px; vertical-align: middle; color: rgb(102, 102, 102); font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/></p>','2014-11-06 14:54:04',1,NULL,NULL,NULL,1),(14,9,'会员介绍',NULL,'<p style=\"text-align: center;\">会员介绍</p>','2014-11-06 15:15:01',1,NULL,NULL,NULL,1),(15,9,'常见问题',NULL,'<p style=\"text-align: center;\"><a target=\"_blank\" rel=\"nofollow\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none; font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">常见问题</a></p>','2014-11-06 15:15:17',1,NULL,NULL,NULL,1),(16,9,'联系客服',NULL,'<p style=\"text-align: center;\"><a target=\"_blank\" rel=\"nofollow\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none; font-family: Arial, Verdana, 宋体; font-size: 12px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">联系客服</a></p>','2014-11-06 15:15:29',1,NULL,NULL,NULL,1),(17,10,'如何申请开店',NULL,'<p style=\"text-align: center;\"><a title=\"如何申请开店\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">如何申请开店</a></p>','2014-11-06 15:17:26',1,NULL,NULL,NULL,1),(18,10,'查看售出商品',NULL,'<p style=\"text-align: center;\"><a title=\"查看售出商品\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">查看售出商品</a></p>','2014-11-06 15:17:41',1,NULL,NULL,NULL,1),(19,10,'商城商品推荐',NULL,'<p style=\"text-align: center;\"><a title=\"商城商品推荐\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">商城商品推荐</a></p>','2014-11-06 15:20:47',1,NULL,NULL,NULL,1),(20,10,'如何管理店铺',NULL,'<p style=\"text-align: center;\"><a title=\"如何管理店铺\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">如何管理店铺</a></p>','2014-11-06 15:20:58',1,NULL,NULL,NULL,1),(21,10,'如何发货',NULL,'<p style=\"text-align: center;\"><a title=\"如何发货\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">如何发货</a></p>','2014-11-06 15:21:14',1,NULL,NULL,NULL,0),(22,11,'公司转账',NULL,'<p style=\"text-align: center;\"><a title=\"公司转账\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">公司转账</a></p>','2014-11-06 15:21:27',1,NULL,NULL,NULL,1),(23,11,'在线支付',NULL,'<p style=\"text-align: center;\"><a title=\"在线支付\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">在线支付</a></p>','2014-11-06 15:21:39',1,NULL,NULL,NULL,1),(24,11,'邮局汇款',NULL,'<p style=\"text-align: center;\"><a title=\"邮局汇款\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">邮局汇款</a></p>','2014-11-06 15:21:49',1,NULL,NULL,NULL,1),(25,11,'如何注册支付宝',NULL,'<p style=\"text-align: center;\"><a style=\"color: rgb(51, 51, 51); line-height: 20px; font-family: &quot;microsoft yahei&quot;; text-decoration: none; background-color: rgb(250, 250, 250); transition: color 0.3s ease; -webkit-transition: color 0.3s ease;\" title=\"如何注册支付宝\">如何注册支付宝</a></p>','2014-11-06 15:22:01',1,NULL,NULL,NULL,1),(26,12,'退换货流程',NULL,'<p style=\"text-align: center;\"><a title=\"退换货流程\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">退换货流程</a></p>','2014-11-06 15:22:19',1,NULL,NULL,NULL,1),(27,12,'退款申请',NULL,'<p style=\"text-align: center;\"><a title=\"退款申请\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">退款申请</a></p>','2014-11-06 15:22:33',1,NULL,NULL,NULL,1),(28,12,'退换货政策',NULL,'<p style=\"text-align: center;\"><a title=\"退换货政策\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">退换货政策</a></p>','2014-11-06 15:22:45',1,NULL,NULL,NULL,1),(29,12,'联系卖家',NULL,'<p style=\"text-align: center;\"><a title=\"联系卖家\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">联系卖家</a></p>','2014-11-06 15:23:00',1,NULL,NULL,NULL,0),(30,12,'返修/退换货',NULL,'<p style=\"text-align: center;\"><a title=\"返修/退换货\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">返修/退换货</a></p>','2014-11-06 15:23:28',1,NULL,NULL,NULL,1),(31,13,'联系我们',NULL,'<p style=\"text-align: center;\"><a title=\"联系我们\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">联系我们</a></p>','2014-11-06 15:24:25',1,NULL,NULL,NULL,1),(32,13,'合作及洽谈',NULL,'<p style=\"text-align: center;\"><a title=\"合作及洽谈\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none medium; transition: color 0.3s ease; -webkit-transition: color 0.3s ease; font-family: &#39;microsoft yahei&#39;; line-height: 20px; background-color: rgb(250, 250, 250);\">合作及洽谈</a></p>','2014-11-06 15:24:37',1,NULL,NULL,NULL,1),(33,13,'关于Hishop',NULL,'<p style=\"text-align: center;\">关于Hishop</p>','2014-11-06 15:25:05',1,NULL,NULL,NULL,1),(35,2,'测试平台公告',NULL,'<p>发时代是倒萨<br/></p>','2015-07-16 11:17:05',1,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `Himall_Articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_AttributeValues`
--

DROP TABLE IF EXISTS `Himall_AttributeValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_AttributeValues` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AttributeId` bigint(20) NOT NULL COMMENT '属性ID',
  `Value` varchar(100) NOT NULL COMMENT '属性值',
  `DisplaySequence` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Attribute_AttributeValue` (`AttributeId`) USING BTREE,
  CONSTRAINT `himall_attributevalues_ibfk_1` FOREIGN KEY (`AttributeId`) REFERENCES `Himall_Attributes` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8 COMMENT='系统属性值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_AttributeValues`
--

LOCK TABLES `Himall_AttributeValues` WRITE;
/*!40000 ALTER TABLE `Himall_AttributeValues` DISABLE KEYS */;
INSERT INTO `Himall_AttributeValues` VALUES (22,12,'26预包邮',22),(23,12,'27预包邮',23),(24,12,'28预包邮',24),(25,12,'29预包邮',25),(32,17,'S',32),(33,17,'M',33),(34,17,'L',34),(41,19,'1.5m',35),(42,19,'1.8m',36),(43,20,'绽放异彩',37),(44,20,'后青春',38),(45,20,'美国派',39),(46,20,'狂想曲',40),(47,19,'1.2m',41),(48,20,'红色',42),(49,20,'花色',43),(58,23,'社会',51),(60,23,'历史',53),(63,24,'欧美',55),(64,24,'科普',56),(65,24,'中国原创',57),(66,25,'#13',58),(67,25,'#21',59),(68,25,'#23',60),(69,25,'06#',61),(70,25,'05#',62),(71,25,'04#',63),(72,25,'03#',64),(73,25,'02#',65),(74,25,'01#',66),(75,26,'官方标配',67),(76,26,'套餐一',68),(77,26,'套餐二',69),(78,27,'全国联保',70),(79,27,'远程服务',71),(80,31,'全国联保',72),(81,31,'远程服务',73),(82,30,'官方标配',74),(83,29,'金色',75),(84,29,'皓白色',76),(85,29,'深灰色',77),(86,29,'白色',78),(87,29,'简约白',79),(88,29,'炫酷黑',80),(89,29,'地级黑',81),(90,29,'冰川银',82),(91,32,'浅蓝',83),(92,32,'深蓝',84),(93,32,'紫色',85),(94,32,'黑色',86),(95,32,'红色',87),(96,32,'粉红色',88),(97,32,'白色',89),(98,33,'橙色',90),(99,33,'棕色',91),(100,33,'花色',92),(101,33,'蓝色',93),(102,34,'黑白色',94),(103,34,'蓝玫色',95),(104,34,'湖蓝色',96),(105,34,'玫瑰红',97),(106,34,'黄色',98),(107,34,'黑玫红',99),(108,34,'黑白色',100),(109,35,'土黄色',101),(110,35,'蓝色',102),(111,35,'米色',103),(112,36,'38',104),(113,36,'39',105),(114,36,'40',106),(115,36,'41',107),(116,37,'土色',108),(117,37,'粉色',109),(118,37,'金色',110),(119,37,'红色',111),(120,37,'黑色',112),(121,37,'杏色',113),(122,38,'35',114),(123,38,'36',115),(124,38,'37',116),(125,38,'38',117),(126,39,'天蓝色',118),(127,39,'枚红色',119),(128,39,'宝蓝色',120),(129,39,'卡其色',121),(130,39,'蝴蝶结',122),(131,40,'蓝白',123),(132,40,'红白',124),(133,40,'黑白',125),(134,40,'绿黑',126),(135,40,'白紫',127),(136,41,'120',128),(137,41,'130',129),(138,41,'140',130),(139,41,'150',131),(140,42,'卡其',132),(141,42,'军绿',133),(142,43,'M',134),(143,43,'L',135),(144,43,'XL',136),(145,43,'XXL',137),(146,44,'26',138),(147,44,'27',139),(148,44,'28',140),(149,44,'29',141),(150,45,'天蓝色',142),(151,45,'深蓝色',143),(152,46,'琥珀色',144),(153,46,'白色',145),(154,46,'绿色',146),(155,46,'棕花色',147),(156,35,'棕色',148),(157,36,'37',149),(158,36,'38',150),(159,35,'白色',151),(160,35,'黑色',152),(161,35,'红色',153),(168,48,'3.5-4.0英寸',1),(169,48,'4.0-4.5英寸',1),(170,48,'4.5-5.0英寸',1),(171,48,'5.0-6.0英寸',1),(172,49,'移动4G',1),(173,49,'联通4G',1),(174,49,'电信4G',1),(175,49,'移动3G',1),(176,49,'联通3G',1),(177,49,'电信3G',1),(178,50,'0-199',1),(179,50,'199-299',1),(180,50,'299-399',1),(181,50,'399-599',1),(182,50,'600以上9',1),(183,23,'哲学',1),(184,23,'经济学',1),(185,23,'心理学',1),(186,23,'科技',1),(187,51,'0-19',1),(188,51,'19-39',1),(189,51,'39-59',1),(190,51,'59以上',1),(191,52,'一年',1),(192,52,'三年',1),(193,52,'二十年',1),(194,52,'终生质保',1),(195,54,'10.1寸',1),(196,54,'11寸',1),(197,54,'12寸',1),(198,54,'13寸',1),(199,54,'14寸',1),(200,54,'15.6寸',1),(201,55,'500-999',1),(202,55,'999-1999',1),(203,55,'1999-2999',1),(204,55,'2999-3999',1),(205,55,'3999以上',1),(206,56,'本店质保',1),(207,56,'全国联保',1),(208,21,'0-99',1),(209,21,'99-199',1),(210,21,'199-299',1),(211,21,'299-499',1),(212,21,'499-599',1),(213,21,'599以上',1),(214,22,'女士',1),(215,22,'男士',1),(216,22,'儿童',1),(217,22,'亲子',1),(218,57,'心型',1),(219,57,'纯色',1),(220,57,'卡通',1),(221,57,'字母',1),(222,57,'格子',1),(223,57,'豹纹',1),(224,57,'条纹',1),(225,58,'0-1399',1),(226,58,'1400-2299',1),(227,58,'2300-3399',1),(228,58,'3400-4699',1),(229,58,'4699-6999',1),(230,58,'6999以上',1),(231,59,'木质',1),(232,59,'布艺',1),(233,59,'实木',1),(234,59,'真皮',1),(235,59,'人造板',1),(236,59,'玻璃',1),(237,60,'现代简约',1),(238,60,'欧式古典',1),(239,60,'欧美式',1),(240,60,'中式现代',1),(241,60,'田园',1),(242,60,'韩式田园',1),(243,61,'地面砖',1),(244,61,'电源插座',1),(245,61,'墙面砖',1),(246,61,'PVC墙纸',1),(247,61,'马赛克',1),(248,62,'玻化砖',1),(249,62,'无纺布墙纸',1),(250,62,'特种砖',1),(251,62,'PVC墙纸',1),(252,62,'植绒墙纸',1),(253,63,'300*300',1),(254,63,'600*600',1),(255,63,'800*800',1),(256,64,'三件套',1),(257,64,'二件套',1),(258,64,'32cm',1),(259,64,'四件套',1),(260,64,'七件套',1),(261,64,'30cm',1),(262,65,'0-69',1),(263,65,'70-199',1),(264,65,'200-399',1),(265,65,'400-699',1),(266,65,'700-1499',1),(267,66,'是',1),(268,66,'否',1),(269,42,'灰色',1),(270,42,'白色',1),(271,42,'黑色',1),(272,43,'S',1),(273,67,'青年',1),(274,67,'青少年',1),(275,67,'中年',1),(276,67,'大码',1),(277,67,'老年',1),(278,67,'情侣装',1),(279,41,'160',1),(280,41,'170',1),(281,69,'日韩',1),(282,69,'OL',1),(283,69,'淑女',1),(284,69,'休闲',1),(285,69,'欧美',1),(286,69,'甜美',1),(287,69,'性感',1),(288,69,'优雅',1),(289,10,'男式',1),(290,10,'女式',1),(291,10,'儿童',1),(292,10,'情侣',1),(293,11,'白',1),(294,11,'肉色',1),(295,11,'灰',1),(296,11,'黑',1),(297,11,'红',1),(298,11,'粉',1),(299,70,'0-39',1),(300,70,'39-59',1),(301,70,'59-99',1),(302,70,'99-129',1),(303,70,'130以上',1),(304,71,'银',1),(305,71,'金',1),(306,71,'白金',1),(307,71,'镶钻',1),(308,71,'玉石',1),(309,72,'0-1999',1),(310,72,'1999-2999',1),(311,72,'2999-3999',1),(312,72,'4000以上',1),(313,73,'女士',1),(314,73,'男士',1),(315,73,'任何人群',1),(316,75,'欧美',1),(317,75,'英伦',1),(318,75,'韩版',1),(319,75,'百搭',1),(320,75,'休闲',1),(321,75,'甜美',1),(322,75,'简约',1),(323,77,'ABS&PC',1),(324,77,'ABS',1),(325,77,'牛津布',1),(326,77,'PC涤纶',1),(327,77,'尼龙',1),(328,77,'PU',1),(329,77,'其它',1),(330,79,'0-199',1),(331,79,'200-399',1),(332,79,'400-699',1),(333,79,'700-1599',1),(334,79,'1600-6899',1),(335,79,'6900以上',1),(336,80,'挂钟',1),(337,80,'闹钟',1),(338,80,'座钟',1),(339,80,'立式钟',1),(340,80,'电子钟',1),(341,80,'其他计时工具',1),(342,81,'圆形',1),(343,81,'方形',1),(344,81,'其他',1),(345,82,'0-499',1),(346,82,'500-899',1),(347,82,'900-1499',1),(348,82,'1500-2499',1),(349,82,'2500-3999',1),(350,82,'4000-6999',1),(351,82,'7000以上',1),(352,83,'T恤',1),(353,83,'外套',1),(354,83,'裤子',1),(355,83,'衬衫',1),(356,83,'针织',1),(357,83,'内衣裤',1),(358,83,'休闲时尚',1),(359,83,'商务休闲',1),(360,84,'板扣',1),(361,84,'针扣',1),(362,85,'XXS',1),(363,85,'XS',1),(364,85,'S',1),(365,85,'M',1),(366,85,'L',1),(367,85,'XL',1),(368,86,'儿童',1),(369,86,'男士',1),(370,86,'情侣',1),(371,86,'女士',1),(372,86,'中性',1),(373,87,'0-59',1),(374,87,'60-199',1),(375,87,'200-399',1),(376,87,'400-699',1),(377,87,'700-1099',1),(378,87,'1100以上',1),(379,88,'0-599',1),(380,88,'600-899',1),(381,88,'900-1199',1),(382,88,'1200-1499',1),(383,88,'1500-3399',1),(384,88,'3400以上',1),(385,89,'10KG以下',1),(386,89,'10-15KG',1),(387,89,'15-20KG',1),(388,89,'20KG以上',1),(389,90,'铝合金',1),(390,90,'高碳钢',1),(391,90,'铁架',1),(392,90,'铬钼钢',1),(393,90,'其它',1),(409,94,'0-39',1),(410,94,'40-79',1),(411,94,'80-199',1),(412,94,'200-399',1),(413,94,'400-599',1),(414,94,'600以上',1),(415,95,'方向盘套',1),(416,95,'车载支架/挂钩/托盘',1),(417,95,'车掸',1),(418,95,'毛巾',1),(419,95,'档把套',1),(420,95,'遮阳档/雪挡',1),(421,96,'卡通',1),(422,96,'商务',1),(423,96,'运动',1),(424,96,'其他',1),(425,97,'0-39',1),(426,97,'40-79',1),(427,97,'80-199',1),(428,97,'200-399',1),(429,97,'400以上',1),(430,98,'早教机',1),(431,98,'启蒙玩具',1),(432,98,'宝宝纪念品',1),(433,99,'纯棉',1),(434,99,'玻璃',1),(435,99,'硅胶',1),(436,99,'pp',1),(437,99,'ppsu',1),(438,99,'不锈钢',1),(439,99,'竹纤维/莫代尔',1),(440,99,'PES',1),(441,99,'其他',1),(442,100,'0-39',1),(443,100,'40-79',1),(444,100,'80-199',1),(445,100,'200-399',1),(446,100,'400以上',1),(447,101,'0-1岁',1),(448,101,'1-2岁',1),(449,101,'2-3岁',1),(450,101,'3-4岁',1),(451,101,'4-5岁',1),(452,101,'5岁以上',1),(453,102,'0-29',1),(454,102,'30-59',1),(455,102,'60-89',1),(456,102,'90-199',1),(457,102,'200-299',1),(458,102,'300以上',1),(459,103,'饮料',1),(460,103,'进口零食',1),(461,103,'米面杂粮',1),(462,104,'0-199',1),(463,104,'200-499',1),(464,104,'500-899',1),(465,104,'900-1699',1),(466,104,'1700-3999',1),(467,104,'4000-7399',1),(468,104,'7400以上',1),(469,105,'红酒',1),(470,105,'白酒',1),(471,105,'啤酒',1),(472,105,'黄酒',1),(473,106,'0-39',1),(474,106,'40-79',1),(475,106,'80-199',1),(476,106,'200-399',1),(477,106,'400-499',1),(478,106,'500以上',1),(479,107,'海鲜',1),(480,107,'水果',1),(481,107,'牛肉',1),(482,107,'虾',1),(483,107,'羊肉',1),(484,108,'0-89',1),(485,108,'90-199',1),(486,108,'200-399',1),(487,108,'400-699',1),(488,108,'700-1099',1),(489,108,'1100以上',1),(490,109,'B族',1),(491,109,'维生素C',1),(492,109,'维生素E',1),(493,109,'复合维生素',1),(494,109,'矿物质',1),(495,109,'其他',1),(496,110,'国产',1),(497,110,'进口',1),(498,111,'0-3折',1),(499,111,'3-5折',1),(500,111,'5-7折',1),(501,111,'7折及以上',1),(502,112,'0-79',1),(503,112,'80-199',1),(504,112,'200-299',1),(505,112,'300-499',1),(506,112,'500-1699',1),(507,112,'1700以上',1),(508,113,'日用型',1),(509,113,'夜用型',1),(510,114,'深层净化',1),(511,114,'秋冬滋润',1),(512,114,'劲能套餐',1),(513,114,'型男霜',1),(514,114,'控油套餐',1),(515,115,'干性',1),(516,115,'中性',1),(517,115,'油性',1),(518,115,'混合性',1),(519,115,'受损发质',1),(520,30,'心动4G版',1),(521,30,'4G增强版',1),(522,30,'WIFI增强版',1),(523,31,'上门维修',1),(524,31,'VIP专线',1),(525,31,'免费返厂',1),(526,31,'JFGT计划专服务',1),(527,48,'3.0英寸及以下',1),(528,49,'移动2G/联通2G',1),(529,49,'双卡',1),(530,116,'屏幕大',1),(531,116,'待机时间长',1),(532,116,'电池耐用',1),(533,116,'照相不错',1),(534,116,'反应快',1),(535,116,'外观不错',1),(536,116,'系统流畅',1),(537,116,'字体大',1),(538,116,'后盖很漂亮',1),(539,116,'软件也不错',1),(540,116,'功能齐全',1),(541,116,'分辨率高',1),(542,117,'安卓（Android）',1),(543,117,'微软（WindowsPhone）',1),(544,117,'苹果（IOS）',1),(545,117,'其它',1),(546,43,'XXS',1),(547,43,'XS',1),(548,43,'3XL',1),(549,43,'4XL',1),(550,43,'5XL',1),(551,43,'6XL',1),(552,43,'7XL',1),(553,43,'8XL',1),(554,43,'10',1),(555,43,'11',1),(556,118,'青春休闲',1),(557,118,'商务休闲',1),(558,118,'时尚休闲',1),(559,118,'日韩风格',1),(560,118,'商务正装',1),(561,118,'欧美简约',1),(562,118,'军旅工装',1),(563,118,'嘻哈风格',1),(564,118,'英式学院',1),(565,119,'立领',1),(566,119,'圆领',1),(567,119,'V领',1),(568,119,'方领',1),(569,119,'尖领',1),(570,119,'翻领',1),(571,119,'连帽可脱卸',1),(572,119,'帽扣领',1),(573,119,'撞色领',1),(574,119,'高领',1),(575,120,'棉',1),(576,120,'羊毛',1),(577,120,'涤纶',1),(578,120,'羊绒',1),(579,120,'锦纶',1),(580,120,'蚕丝',1),(581,120,'腈纶',1),(582,120,'麻',1),(583,120,'兔毛',1),(584,120,'LYCRA莱卡',1),(585,120,'莫代尔',1),(586,120,'马海毛',1),(587,121,'修身型',1),(588,121,'标准型',1),(589,121,'（腰围=胸围）',1),(590,121,'宽松型（腰围>胸围）',1),(591,121,'宽松型(腰围>胸围)',1),(592,103,'坚果',1),(731,155,'dfg',1),(742,159,'标间',1),(743,159,'豪华双人床',1),(744,159,'豪华单人床',1),(745,159,'总统套房',1),(746,160,'毛衣',1),(747,161,'长袖',1),(748,161,'短袖',1);
/*!40000 ALTER TABLE `Himall_AttributeValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Attributes`
--

DROP TABLE IF EXISTS `Himall_Attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Attributes` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL COMMENT '名称',
  `DisplaySequence` bigint(20) NOT NULL,
  `IsMust` tinyint(1) NOT NULL COMMENT '是否为必选',
  `IsMulti` tinyint(1) NOT NULL COMMENT '是否可多选',
  PRIMARY KEY (`Id`),
  KEY `FK_Type_Attribute` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_attributes_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `Himall_Types` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='系统属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Attributes`
--

LOCK TABLES `Himall_Attributes` WRITE;
/*!40000 ALTER TABLE `Himall_Attributes` DISABLE KEYS */;
INSERT INTO `Himall_Attributes` VALUES (10,1,'人群',10,1,1),(11,1,'颜色',11,1,1),(12,1,'尺寸',12,1,1),(17,3,'尺码',17,1,1),(19,4,'尺寸',18,1,1),(20,4,'颜色',19,1,1),(21,5,'价格',20,1,1),(22,5,'人群',21,1,1),(23,6,'类别',22,1,0),(24,7,'类型',23,1,1),(25,8,'型号',24,1,1),(26,13,'套餐',25,1,1),(27,13,'服务',26,1,1),(29,12,'机身',28,1,1),(30,12,'套餐类型',29,1,1),(31,12,'服务',30,1,1),(32,14,'颜色',31,1,1),(33,15,'颜色',32,1,1),(34,16,'颜色',33,1,1),(35,17,'颜色',34,1,1),(36,17,'尺寸',35,1,1),(37,18,'颜色',36,1,1),(38,18,'尺寸',37,1,1),(39,19,'颜色',38,1,1),(40,20,'颜色',39,1,1),(41,20,'尺寸',40,1,1),(42,21,'颜色',41,1,1),(43,21,'尺寸',42,1,1),(44,22,'尺寸',43,1,1),(45,22,'颜色',44,1,1),(46,3,'颜色',45,1,1),(48,12,'屏幕大小',0,0,0),(49,12,'网络',0,0,1),(50,13,'价格',0,0,1),(51,6,'价格',0,0,1),(52,24,'质保',0,0,1),(54,25,'尺寸',0,0,1),(55,25,'价格',0,0,1),(56,25,'质保类型',0,0,0),(57,5,'花型',0,0,0),(58,26,'价格',0,0,1),(59,26,'材质',0,0,1),(60,26,'风格',0,0,1),(61,27,'类别',0,0,1),(62,27,'材质',0,0,1),(63,27,'尺寸',0,0,0),(64,28,'规格',0,0,1),(65,28,'价格',0,0,1),(66,28,'是否带盖',0,0,0),(67,21,'人群',0,0,1),(69,20,'风格',0,0,1),(70,1,'价格',0,0,1),(71,29,'材质',0,0,0),(72,29,'价格',0,0,1),(73,9,'人群',0,0,0),(75,17,'风格',0,0,1),(76,17,'风格',0,0,1),(77,16,'材质',0,0,1),(79,30,'价格',0,0,1),(80,30,'用途分类',0,0,1),(81,30,'钟面形状',0,0,0),(82,31,'价格',0,0,1),(83,31,'款式',0,0,0),(84,31,'类型',0,0,0),(85,32,'尺码',0,0,1),(86,32,'适用人群',0,0,1),(87,32,'价格',0,0,1),(88,33,'价格',0,0,1),(89,33,'净重',0,0,1),(90,33,'车架材质',0,0,1),(94,35,'价格',0,0,1),(95,35,'类别',0,0,1),(96,35,'风格',0,0,1),(97,36,'价格',0,0,1),(98,36,'类型',0,0,0),(99,36,'材质',0,0,1),(100,37,'价格',0,0,0),(101,37,'适宜年龄',0,0,1),(102,38,'价格',0,0,1),(103,38,'类型',0,0,1),(104,39,'价格',0,0,1),(105,39,'类型',0,0,0),(106,40,'价格',0,0,1),(107,40,'类型',0,0,1),(108,41,'价格',0,0,1),(109,41,'类别',0,0,1),(110,41,'国别',0,0,0),(111,42,'折扣',0,0,1),(112,42,'价格',0,0,1),(113,9,'适用类型',0,0,0),(114,9,'功效类型',0,0,1),(115,9,'适合发质',0,0,0),(116,12,'大家说',0,0,1),(117,12,'系统',0,0,0),(118,21,'风格',0,0,1),(119,21,'领型',0,0,1),(120,21,'主要材质',0,0,1),(121,21,'版型',0,0,1),(155,70,'大小',0,0,0),(159,73,'房间套餐',0,0,1),(160,74,'材质',0,0,0),(161,74,'袖口',0,0,0);
/*!40000 ALTER TABLE `Himall_Attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Banners`
--

DROP TABLE IF EXISTS `Himall_Banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Banners` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL COMMENT '导航名称',
  `Position` int(11) NOT NULL COMMENT '导航显示位置',
  `DisplaySequence` bigint(20) NOT NULL,
  `Url` varchar(1000) NOT NULL COMMENT '跳转URL',
  `Platform` int(11) NOT NULL DEFAULT '0' COMMENT '显示在哪个终端',
  `UrlType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='系统商城首页导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Banners`
--

LOCK TABLES `Himall_Banners` WRITE;
/*!40000 ALTER TABLE `Himall_Banners` DISABLE KEYS */;
INSERT INTO `Himall_Banners` VALUES (12,0,'帮助中心',0,5,'http://192.168.10.69:8080/Article/Category',0,0),(13,0,'数码手机',0,1,'/',0,0),(14,0,'日化护理',0,2,'/',0,0),(16,0,'数码配件',0,3,'/',0,0),(17,0,'新品首发',0,4,'/',0,0),(46,210,'全部商品',0,1,'/m-WeiXin/vshop/Search?vshopid=4',1,1),(47,210,'店铺简介',0,2,'/m-WeiXin/vshop/introduce/4',1,3),(48,210,'商品分类',0,3,'/m-WeiXin/vshop/Category?vshopid=4',1,2),(49,210,'限时购',0,4,'',1,0),(53,210,'首页',0,6,'http://192.168.10.69:8080/Shop/Home/210',0,0),(54,210,'白富美',0,7,'/m-WeiXin/vshop/introduce/4',1,3),(55,215,'全部商品',0,1,'/m-WeiXin/vshop/Search?vshopid=8',1,1),(56,215,'店铺分类',0,2,'/m-WeiXin/vshop/Category?vshopid=8',1,2),(57,215,'店铺介绍',0,3,'/m-WeiXin/vshop/introduce/8',1,3),(58,1,'大牌男装',0,1,'/',0,0),(59,1,'大牌女装',0,2,'/',0,0),(60,1,'国际大牌',0,3,'/',0,0),(61,1,'智能数码',0,4,'/',0,0),(62,1,'美容化妆',0,5,'/',0,0),(63,1,'限时优惠',0,6,'/',0,0),(64,210,'台式电脑',0,8,'/',0,0),(65,210,'笔记本',0,9,'/',0,0),(66,210,'数码新品',0,10,'/',0,0),(67,210,'限时抢购',0,11,'/',0,0),(79,1,'测试',0,7,'',1,0),(80,1,'测试',0,8,'/m-WeiXin/vshop/Search?vshopid=16',1,1),(81,1,'测试',0,9,'/m-WeiXin/vshop/introduce/16',1,3),(82,1,'测试',0,10,'/m-WeiXin/vshop/Category?vshopid=16',1,2),(83,1,'测试',0,11,'/m-WeiXin/vshop/Search?vshopid=16',1,1),(84,245,'恶风v',0,1,'/m-WeiXin/vshop/Search?vshopid=18',1,1),(85,245,'二v',0,2,'/m-WeiXin/vshop/Category?vshopid=18',1,2),(86,245,'二v',0,3,'/m-WeiXin/vshop/introduce/18',1,3);
/*!40000 ALTER TABLE `Himall_Banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Bonus`
--

DROP TABLE IF EXISTS `Himall_Bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Bonus` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` int(11) NOT NULL COMMENT '类型，活动红包，关注送红包',
  `Style` int(11) NOT NULL COMMENT '样式，模板一（源生风格），模板二',
  `Name` varchar(100) DEFAULT NULL COMMENT '名称',
  `MerchantsName` varchar(50) DEFAULT NULL COMMENT '商户名称',
  `Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `Blessing` varchar(100) DEFAULT NULL COMMENT '祝福语',
  `TotalPrice` decimal(18,2) NOT NULL COMMENT '总面额',
  `StartTime` datetime NOT NULL COMMENT '开始日期',
  `EndTime` datetime NOT NULL COMMENT '结束日期',
  `QRPath` varchar(100) DEFAULT NULL COMMENT '二维码',
  `PriceType` int(11) DEFAULT NULL COMMENT '是否固定金额',
  `FixedAmount` decimal(18,2) DEFAULT NULL COMMENT '固定金额',
  `RandomAmountStart` decimal(18,2) DEFAULT NULL COMMENT '随机金额起止范围',
  `RandomAmountEnd` decimal(18,2) DEFAULT NULL COMMENT '随机金额起止范围',
  `ReceiveCount` int(11) NOT NULL,
  `ImagePath` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsInvalid` tinyint(1) NOT NULL,
  `ReceivePrice` decimal(18,2) NOT NULL,
  `ReceiveHref` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Bonus`
--

LOCK TABLES `Himall_Bonus` WRITE;
/*!40000 ALTER TABLE `Himall_Bonus` DISABLE KEYS */;
INSERT INTO `Himall_Bonus` VALUES (168,1,1,'年底大促，红包疯狂送','Hishop','Hishop','恭喜发财',100.00,'2015-10-09 00:00:00','2015-11-30 00:00:00','/Storage/Plat/Bonus/33b321a0-f9c5-4280-94f9-568625d18e45.jpg',1,2.00,0.00,0.00,20,'/temp/201510091822553835470.jpg','年底大促，红包疯狂送',0,40.00,'http://demo.himall.kuaidiantong.cn/m-weixin/bonus/index/168');
/*!40000 ALTER TABLE `Himall_Bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_BonusReceive`
--

DROP TABLE IF EXISTS `Himall_BonusReceive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_BonusReceive` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BonusId` bigint(20) NOT NULL COMMENT '红包Id',
  `OpenId` varchar(100) DEFAULT NULL COMMENT '领取人微信Id',
  `ReceiveTime` datetime DEFAULT NULL COMMENT '领取日期',
  `Price` decimal(18,2) NOT NULL COMMENT '领取金额',
  `IsShare` tinyint(1) NOT NULL,
  `IsTransformedDeposit` tinyint(1) NOT NULL COMMENT '红包金额是否已经转入了预存款',
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_1` (`BonusId`),
  KEY `FK_UserId` (`UserId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`BonusId`) REFERENCES `Himall_Bonus` (`Id`),
  CONSTRAINT `FK_UserId` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=51193 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_BonusReceive`
--

LOCK TABLES `Himall_BonusReceive` WRITE;
/*!40000 ALTER TABLE `Himall_BonusReceive` DISABLE KEYS */;
INSERT INTO `Himall_BonusReceive` VALUES (51143,168,'osRzujvuZWgJFi4bY2ngxdNdj1UY','2015-10-09 18:26:52',2.00,1,1,550),(51144,168,'osRzujo1mpla0AfOOrAhxCfULzT4','2015-10-09 18:28:05',2.00,0,1,567),(51145,168,'osRzujk3499vkVSm3dqX5F0HonPg','2015-10-10 07:05:53',2.00,0,1,551),(51146,168,'osRzujsr7d-wjmzu6Kbca53cqOKM','2015-10-10 14:11:13',2.00,0,1,559),(51147,168,'osRzujrZlCVNdRLgmPEg_FEEpuE0','2015-10-10 14:16:21',2.00,0,0,NULL),(51148,168,'osRzujoQ96VPjp2Mdf8Q39f3h2Ko','2015-10-10 15:15:14',2.00,0,1,560),(51149,168,'osRzujpjCgzY9-ycUhVVEPbL-HJY','2015-10-10 15:49:02',2.00,0,0,NULL),(51150,168,'osRzujjvQGlFvrA33ypfn4pVtZfU','2015-10-10 17:38:31',2.00,0,1,569),(51151,168,'osRzujvVA-O5k1X-SZm2xsUrFhQA','2015-10-11 17:05:01',2.00,0,0,NULL),(51152,168,'osRzujlfhtAKUP9q9Wh8ATxiRLbw','2015-10-11 23:31:41',2.00,0,0,NULL),(51153,168,'osRzujjnj_mpQ7Y9FIX0wo5PbVq8','2015-10-12 15:21:39',2.00,0,0,NULL),(51154,168,'osRzujsSdpyA-Fd1OqdeNGaB-PkM','2015-10-12 16:17:35',2.00,0,1,557),(51155,168,'osRzujlCOCkl4I4vXoHfG6iZQhJs','2015-10-12 22:01:29',2.00,0,1,578),(51156,168,'osRzujuac3gg0xEp4Qyg7QToVPTE','2015-10-13 12:44:59',2.00,0,0,NULL),(51157,168,'osRzujmlml7vijDrjr510xoDmfgo','2015-10-13 15:58:27',2.00,0,0,NULL),(51158,168,'osRzujvuZWgJFi4bY2ngxdNdj1UY','2015-10-14 11:18:58',2.00,0,1,550),(51159,168,'osRzujqCh6UYHqXN9qlwjanzOLZU','2015-10-14 11:19:02',2.00,0,0,NULL),(51160,168,'osRzujrNYZdL0IXdB68WbXtG0Irc','2015-10-14 11:19:15',2.00,0,0,NULL),(51161,168,'osRzujtGT6AXudX57cPq-bVkaTe0','2015-10-14 11:19:16',2.00,0,0,NULL),(51162,168,'osRzujk1W_hcSkMEdIhjzbzssoRo','2015-10-14 16:58:10',2.00,0,0,NULL),(51163,168,NULL,NULL,2.00,0,0,NULL),(51164,168,NULL,NULL,2.00,0,0,NULL),(51165,168,NULL,NULL,2.00,0,0,NULL),(51166,168,NULL,NULL,2.00,0,0,NULL),(51167,168,NULL,NULL,2.00,0,0,NULL),(51168,168,NULL,NULL,2.00,0,0,NULL),(51169,168,NULL,NULL,2.00,0,0,NULL),(51170,168,NULL,NULL,2.00,0,0,NULL),(51171,168,NULL,NULL,2.00,0,0,NULL),(51172,168,NULL,NULL,2.00,0,0,NULL),(51173,168,NULL,NULL,2.00,0,0,NULL),(51174,168,NULL,NULL,2.00,0,0,NULL),(51175,168,NULL,NULL,2.00,0,0,NULL),(51176,168,NULL,NULL,2.00,0,0,NULL),(51177,168,NULL,NULL,2.00,0,0,NULL),(51178,168,NULL,NULL,2.00,0,0,NULL),(51179,168,NULL,NULL,2.00,0,0,NULL),(51180,168,NULL,NULL,2.00,0,0,NULL),(51181,168,NULL,NULL,2.00,0,0,NULL),(51182,168,NULL,NULL,2.00,0,0,NULL),(51183,168,NULL,NULL,2.00,0,0,NULL),(51184,168,NULL,NULL,2.00,0,0,NULL),(51185,168,NULL,NULL,2.00,0,0,NULL),(51186,168,NULL,NULL,2.00,0,0,NULL),(51187,168,NULL,NULL,2.00,0,0,NULL),(51188,168,NULL,NULL,2.00,0,0,NULL),(51189,168,NULL,NULL,2.00,0,0,NULL),(51190,168,NULL,NULL,2.00,0,0,NULL),(51191,168,NULL,NULL,2.00,0,0,NULL),(51192,168,NULL,NULL,2.00,0,0,NULL);
/*!40000 ALTER TABLE `Himall_BonusReceive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Brands`
--

DROP TABLE IF EXISTS `Himall_Brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Brands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '品牌名称',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '顺序',
  `Logo` varchar(1000) DEFAULT NULL COMMENT 'LOGO',
  `RewriteName` varchar(50) DEFAULT NULL COMMENT '未使用',
  `Description` varchar(1000) DEFAULT NULL COMMENT '说明',
  `Meta_Title` varchar(1000) DEFAULT NULL COMMENT 'SEO',
  `Meta_Description` varchar(1000) DEFAULT NULL,
  `Meta_Keywords` varchar(1000) DEFAULT NULL,
  `IsRecommend` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COMMENT='系统品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Brands`
--

LOCK TABLES `Himall_Brands` WRITE;
/*!40000 ALTER TABLE `Himall_Brands` DISABLE KEYS */;
INSERT INTO `Himall_Brands` VALUES (1,'Test',0,'/Storage/Plat/Brand/logo_1.jpg',NULL,'1',NULL,NULL,NULL,1),(3,'妖精口袋',0,'/Storage/Plat/Brand/logo_3.jpg',NULL,NULL,NULL,NULL,NULL,0),(4,'TCL',0,'/Storage/Plat/Brand/logo_4.jpg',NULL,NULL,NULL,NULL,NULL,1),(5,'飞科',0,'/Storage/Plat/Brand/logo_5.jpg',NULL,NULL,NULL,NULL,NULL,1),(6,'创维',0,'/Storage/Plat/Brand/logo_6.jpg',NULL,NULL,NULL,NULL,NULL,1),(7,'九阳',0,'/Storage/Plat/Brand/logo_7.jpg',NULL,NULL,NULL,NULL,NULL,1),(8,'长虹',0,'/Storage/Plat/Brand/logo_8.jpg',NULL,NULL,NULL,NULL,NULL,1),(9,'康佳',0,'/Storage/Plat/Brand/logo_9.jpg',NULL,NULL,NULL,NULL,NULL,1),(10,'LG',0,'/Storage/Plat/Brand/logo_10.jpg',NULL,NULL,NULL,NULL,NULL,1),(11,'努比亚',0,'/Storage/Plat/Brand/logo_11.jpg',NULL,NULL,NULL,NULL,NULL,1),(12,'海尔',0,'/Storage/Plat/Brand/logo_12.jpg',NULL,NULL,NULL,NULL,NULL,1),(13,'英特尔',0,'/Storage/Plat/Brand/logo_13.jpg',NULL,NULL,NULL,NULL,NULL,1),(14,'佳能',0,'/Storage/Plat/Brand/logo_14.jpg',NULL,NULL,NULL,NULL,NULL,1),(15,'微软',0,'/Storage/Plat/Brand/logo_15.jpg',NULL,NULL,NULL,NULL,NULL,1),(16,'宏碁',0,'/Storage/Plat/Brand/logo_16.jpg',NULL,NULL,NULL,NULL,NULL,1),(17,'齐心办公',0,'/Storage/Plat/Brand/logo_17.jpg',NULL,NULL,NULL,NULL,NULL,1),(18,'神舟',0,'/Storage/Plat/Brand/logo_18.jpg',NULL,NULL,NULL,NULL,NULL,1),(19,'Thinkpad',0,'/Storage/Plat/Brand/logo_19.jpg',NULL,NULL,NULL,NULL,NULL,1),(20,'得力办公',0,'/Storage/Plat/Brand/logo_20.jpg',NULL,NULL,NULL,NULL,NULL,1),(21,'惠普',0,'/Storage/Plat/Brand/logo_21.jpg',NULL,NULL,NULL,NULL,NULL,1),(22,'清华同方',0,'/Storage/Plat/Brand/logo_22.jpg',NULL,NULL,NULL,NULL,NULL,1),(23,'HKC',0,'/Storage/Plat/Brand/logo_23.jpg',NULL,NULL,NULL,NULL,NULL,1),(24,'AOC',0,'/Storage/Plat/Brand/logo_24.jpg',NULL,NULL,NULL,NULL,NULL,1),(25,'TP-LINK',0,'/Storage/Plat/Brand/logo_25.jpg',NULL,NULL,NULL,NULL,NULL,1),(26,'海尔',0,'/Storage/Plat/Brand/logo_26.jpg',NULL,NULL,NULL,NULL,NULL,1),(27,'罗技',0,'/Storage/Plat/Brand/logo_27.jpg',NULL,NULL,NULL,NULL,NULL,1),(28,'天威',0,'/Storage/Plat/Brand/logo_28.jpg',NULL,NULL,NULL,NULL,NULL,1),(29,'海澜之家',0,'/Storage/Plat/Brand/logo_29.jpg',NULL,NULL,NULL,NULL,NULL,1),(30,'爱慕',0,'/Storage/Plat/Brand/logo_30.jpg',NULL,NULL,NULL,NULL,NULL,1),(31,'GXG',0,'/Storage/Plat/Brand/logo_31.jpg',NULL,NULL,NULL,NULL,NULL,1),(32,'mango',0,'/Storage/Plat/Brand/logo_32.jpg',NULL,NULL,NULL,NULL,NULL,1),(33,'ELLE',0,'/Storage/Plat/Brand/logo_33.jpg',NULL,NULL,NULL,NULL,NULL,1),(34,'百丽',0,'/Storage/Plat/Brand/logo_34.jpg',NULL,NULL,NULL,NULL,NULL,1),(35,'探路者',0,'/Storage/Plat/Brand/logo_35.jpg',NULL,NULL,NULL,NULL,NULL,1),(36,'丝界',0,'/Storage/Plat/Brand/logo_36.jpg',NULL,NULL,NULL,NULL,NULL,1),(37,'KENZO',0,'/Storage/Plat/Brand/logo_37.jpg',NULL,NULL,NULL,NULL,NULL,1),(38,'万里马',0,'/Storage/Plat/Brand/logo_38.jpg',NULL,NULL,NULL,NULL,NULL,1),(39,'兰芝',0,'/Storage/Plat/Brand/logo_39.jpg',NULL,NULL,NULL,NULL,NULL,1),(40,'天梭',0,'/Storage/Plat/Brand/logo_40.gif',NULL,NULL,NULL,NULL,NULL,0),(41,'飞亚达',0,'/Storage/Plat/Brand/logo_41.gif',NULL,NULL,NULL,NULL,NULL,0),(42,'丝蓓绮',0,'/Storage/Plat/Brand/logo_42.jpg',NULL,NULL,NULL,NULL,NULL,1),(43,'日百',0,'/Storage/Plat/Brand/logo_43.jpg',NULL,NULL,NULL,NULL,NULL,1),(44,'欧莱雅',0,'/Storage/Plat/Brand/logo_44.jpg',NULL,NULL,NULL,NULL,NULL,1),(45,'千寻海风',0,'/Storage/Plat/Brand/logo_45.jpg',NULL,NULL,NULL,NULL,NULL,1),(46,'莱百首饰',0,'/Storage/Plat/Brand/logo_46.jpg',NULL,NULL,NULL,NULL,NULL,1),(47,'谢瑞麟',0,'/Storage/Plat/Brand/logo_47.jpg',NULL,NULL,NULL,NULL,NULL,1),(48,'潮宏基',0,'/Storage/Plat/Brand/logo_48.jpg',NULL,NULL,NULL,NULL,NULL,1),(49,'罗莱家纺',0,'/Storage/Plat/Brand/logo_49.jpg',NULL,NULL,NULL,NULL,NULL,1),(50,'爱仕达',0,'/Storage/Plat/Brand/logo_50.jpg',NULL,NULL,NULL,NULL,NULL,1),(51,'拉歌蒂尼',0,'/Storage/Plat/Brand/logo_51.jpg',NULL,NULL,NULL,NULL,NULL,1),(52,'美国康宁',0,'/Storage/Plat/Brand/logo_52.jpg',NULL,NULL,NULL,NULL,NULL,1),(53,'滴露',0,'/Storage/Plat/Brand/logo_53.jpg',NULL,NULL,NULL,NULL,NULL,1),(54,'好事达',0,'/Storage/Plat/Brand/logo_54.jpg',NULL,NULL,NULL,NULL,NULL,1),(55,'GLY',0,'/Storage/Plat/Brand/logo_55.jpg',NULL,NULL,NULL,NULL,NULL,1),(56,'光明家具',0,'/Storage/Plat/Brand/logo_56.jpg',NULL,NULL,NULL,NULL,NULL,1),(57,'宝优妮',0,'/Storage/Plat/Brand/logo_57.jpg',NULL,NULL,NULL,NULL,NULL,1),(58,'水星家纺',0,'/Storage/Plat/Brand/logo_58.jpg',NULL,NULL,NULL,NULL,NULL,1),(59,'惠氏',0,'/Storage/Plat/Brand/logo_59.jpg',NULL,NULL,NULL,NULL,NULL,1),(60,'帮宝适',0,'/Storage/Plat/Brand/logo_60.jpg',NULL,NULL,NULL,NULL,NULL,1),(61,'乐儿宝',0,'/Storage/Plat/Brand/logo_61.jpg',NULL,NULL,NULL,NULL,NULL,1),(62,'合生元',0,'/Storage/Plat/Brand/logo_62.jpg',NULL,NULL,NULL,NULL,NULL,1),(63,'路途乐',0,'/Storage/Plat/Brand/logo_63.jpg',NULL,NULL,NULL,NULL,NULL,1),(64,'好奇',0,'/Storage/Plat/Brand/logo_64.jpg',NULL,NULL,NULL,NULL,NULL,1),(65,'孕之彩',0,'/Storage/Plat/Brand/logo_65.jpg',NULL,NULL,NULL,NULL,NULL,1),(66,'New Balance kids',0,'/Storage/Plat/Brand/logo_66.jpg',NULL,NULL,NULL,NULL,NULL,1),(67,'南极人',0,'/Storage/Plat/Brand/logo_67.jpg',NULL,NULL,NULL,NULL,NULL,1),(68,'红孩儿',0,'/Storage/Plat/Brand/logo_68.jpg',NULL,NULL,NULL,NULL,NULL,1),(69,'百草味',0,'/Storage/Plat/Brand/logo_69.jpg',NULL,NULL,NULL,NULL,NULL,1),(70,'五粮液',0,'/Storage/Plat/Brand/logo_70.jpg',NULL,NULL,NULL,NULL,NULL,1),(71,'贵州馆',0,'/Storage/Plat/Brand/logo_71.gif',NULL,NULL,NULL,NULL,NULL,1),(72,'庄民',0,'/Storage/Plat/Brand/logo_72.gif',NULL,NULL,NULL,NULL,NULL,1),(73,'拉菲',0,'/Storage/Plat/Brand/logo_73.jpg',NULL,NULL,NULL,NULL,NULL,1),(74,'日百',0,'/Storage/Plat/Brand/logo_74.jpg',NULL,NULL,NULL,NULL,NULL,1),(75,'汇源',0,'/Storage/Plat/Brand/logo_75.jpg',NULL,NULL,NULL,NULL,NULL,1),(76,'洋河',0,'/Storage/Plat/Brand/logo_76.jpg',NULL,NULL,NULL,NULL,NULL,1),(77,'顺丰',0,'/Storage/Plat/Brand/logo_77.gif',NULL,NULL,NULL,NULL,NULL,1),(78,'马莎',0,'/Storage/Plat/Brand/logo_78.jpg',NULL,NULL,NULL,NULL,NULL,1),(79,'111',0,'/Storage/Plat/Brand/logo_79.jpg',NULL,'111',NULL,NULL,NULL,1),(80,'iPhone',0,'/Storage/Plat/Brand/logo_80.jpg',NULL,'苹果\r\n',NULL,NULL,NULL,1),(82,'老人头',0,'/Storage/Plat/Brand/logo_82.jpg',NULL,NULL,NULL,NULL,NULL,1),(83,'浪美',0,'/Storage/Plat/Brand/logo_83.jpg',NULL,NULL,NULL,NULL,NULL,1),(84,'雪曼',0,'/Storage/Plat/Brand/logo_84.jpg',NULL,NULL,NULL,NULL,NULL,1),(85,'茜茜',0,'/Storage/Plat/Brand/logo_85.jpg',NULL,NULL,NULL,NULL,NULL,1),(86,'朗芙丝',0,'/Storage/Plat/Brand/logo_86.jpg',NULL,NULL,NULL,NULL,NULL,1),(87,'千百惠',0,'/Storage/Plat/Brand/logo_87.jpg',NULL,NULL,NULL,NULL,NULL,1),(90,'欧莱雅',0,'/Storage/Plat/Brand/logo_90.png',NULL,'法国欧莱雅集团是世界上最大的化妆品公司，创办于1907年。\r\n欧莱雅集团世界美妆品行业中的的领导者，经营范围遍及130多个国家和地区，在全球拥有283家分公司、42家工厂、100多个代理商，以及5万多名的员工，是总部设于法国旳跨国公司，也是财富全球500强企业之一。',NULL,NULL,NULL,1),(92,'海飞丝',0,'/Storage/Plat/Brand/logo_92.png',NULL,'海飞丝去屑洗发露清爽去油型500mlX2 ',NULL,NULL,NULL,1),(93,'苹果',0,'/Storage/Plat/Brand/logo_93.gif',NULL,NULL,NULL,NULL,NULL,0),(95,'潘婷',0,'/Storage/Plat/Brand/logo_95.png',NULL,'潘婷乳液修复洗发水750ml*2瓶深层修复滋润洗发露套装',NULL,NULL,NULL,1),(96,'多芬',0,'/Storage/Plat/Brand/logo_96.jpg',NULL,'全新多芬，比牛奶更滋润。',NULL,NULL,NULL,1),(98,'舒肤佳',0,'/Storage/Plat/Brand/logo_98.jpg',NULL,'专业保护健康全家',NULL,NULL,NULL,1),(99,'飘柔',0,'/Storage/Plat/Brand/logo_99.png',NULL,'飘柔滋润去屑洗发水/露700mlX2 去屑',NULL,NULL,NULL,1),(101,'力士',0,'/Storage/Plat/Brand/logo_101.jpg',NULL,'幽莲魅肤力士，精油香氛沐浴露。',NULL,NULL,NULL,1),(104,'拉芳',0,'/Storage/Plat/Brand/logo_104.png',NULL,'水疗素护发素柔顺发膜 倒膜套装染烫受损修复毛躁',NULL,NULL,NULL,0),(106,'Loreal欧莱雅',0,'/Storage/Plat/Brand/logo_106.jpg',NULL,'Loreal欧莱雅',NULL,NULL,NULL,0),(107,'多芬',0,'/Storage/Plat/Brand/logo_107.png',NULL,'深度损伤洗发水',NULL,NULL,NULL,0),(109,'玉兰油',0,'/Storage/Plat/Brand/logo_109.png',NULL,'Olay是一款全球领导护肤品牌，60年来倍受全球女性信任挚爱。Olay一直坚持深入聆听女性需求，并通过将尖端护肤科技注入产品以满足女性日新月异的护肤需求。Olay以卓越的产品品质成为广大女性的美丽标志，为全球超过八千万女性带来健康美丽的肌肤。',NULL,NULL,NULL,0),(111,'资生堂',0,'/Storage/Plat/Brand/logo_111.png',NULL,'去屑无硅油洗发露护发素',NULL,NULL,NULL,0),(112,'华为',0,'/Storage/Plat/Brand/logo_112.jpg',NULL,NULL,NULL,NULL,NULL,0),(113,'沙宣',0,'/Storage/Plat/Brand/logo_113.png',NULL,' 垂坠质感洗发水+护发素 弹性轻盈保湿顺滑',NULL,NULL,NULL,0),(115,'韩伊',0,'/Storage/Plat/Brand/logo_115.png',NULL,'coe韩伊Olive橄榄营养洗发水护发素套装男女士洗发水',NULL,NULL,NULL,0),(116,'纳美牙刷',0,'/Storage/Plat/Brand/logo_116.png',NULL,'纳美纳米抗菌牙刷软毛牙刷',NULL,NULL,NULL,0),(117,'黑人牙刷',0,'/Storage/Plat/Brand/logo_117.png',NULL,'黑人牙膏套装超白',NULL,NULL,NULL,0),(118,'水之密语',0,'/Storage/Plat/Brand/logo_118.jpg',NULL,'温和洗净，祛除油脂污垢，深锁肌肤水分，持久滋润，让肌肤保持自然清爽！',NULL,NULL,NULL,0),(119,'郁美净',0,'/Storage/Plat/Brand/logo_119.png',NULL,'郁美净人坚持优质产品的标准起步要高，郁美净儿童系列护肤品，如郁美净儿童霜、高级儿童霜、儿童营养霜、儿童营养保湿霜等都采用了国际标准，并取得了采用国际标准产品标志证书，产品水平认定为国际先进水平。',NULL,NULL,NULL,0),(120,'三星',0,'/Storage/Plat/Brand/logo_120.jpg',NULL,NULL,NULL,NULL,NULL,0),(121,'高露洁',0,'/Storage/Plat/Brand/logo_121.png',NULL,'高露洁三重深洁波浪牙刷（有效清洁牙缝）',NULL,NULL,NULL,0),(122,'李施德林',0,'/Storage/Plat/Brand/logo_122.png',NULL,'李施德林漱口水',NULL,NULL,NULL,0),(123,'ora2皓乐齿',0,'/Storage/Plat/Brand/logo_123.png',NULL,'ora2皓乐齿0酒精漱口水 去除牙龈出血口臭口气牙渍 日本进口',NULL,NULL,NULL,0),(124,'袋鼠妈妈',0,'/Storage/Plat/Brand/logo_124.jpg',NULL,'袋鼠妈妈孕妇专用护肤品，坏境中生长有机原料有机植物和有机植被以及大豆里面提取的精华研制而成的。适合准妈妈们食用 非转基因小麦成分，为准妈妈带来更好的福音',NULL,NULL,NULL,0),(125,'护舒宝',0,'/Storage/Plat/Brand/logo_125.png',NULL,'护舒宝卫生巾',NULL,NULL,NULL,0),(126,'ABC卫生巾',0,'/Storage/Plat/Brand/logo_126.png',NULL,'ABC卫生巾',NULL,NULL,NULL,0),(127,'安尔乐',0,'/Storage/Plat/Brand/logo_127.jpg',NULL,'安尔乐护垫',NULL,NULL,NULL,0),(128,'高洁丝',0,'/Storage/Plat/Brand/logo_128.png',NULL,'高洁丝卫生巾',NULL,NULL,NULL,0),(129,'妇炎洁',0,'/Storage/Plat/Brand/logo_129.png',NULL,'妇炎洁洗液',NULL,NULL,NULL,0),(131,'七度空间',0,'/Storage/Plat/Brand/logo_131.jpg',NULL,'七度空间护垫',NULL,NULL,NULL,0),(132,'LION狮王',0,'/Storage/Plat/Brand/logo_132.gif',NULL,'LION狮王日本进口CLINICA酵素洁净牙膏',NULL,NULL,NULL,0),(133,'苏菲',0,'/Storage/Plat/Brand/logo_133.jpg',NULL,'苏菲卫生巾',NULL,NULL,NULL,0),(134,'娇妍',0,'/Storage/Plat/Brand/logo_134.png',NULL,'娇妍私处护理液',NULL,NULL,NULL,0),(135,'洁尔阴',0,'/Storage/Plat/Brand/logo_135.png',NULL,'洁尔阴洗液',NULL,NULL,NULL,0),(136,'迪彩',0,'/Storage/Plat/Brand/logo_136.png',NULL,'发剂 植物遮白发 黑色棕黑棕色酒红紫红全套工具染发膏',NULL,NULL,NULL,0),(137,'威娜',0,'/Storage/Plat/Brand/logo_137.png',NULL,'正品威娜可丽丝倍佳染发膏60g 染膏染发剂送双氧染黑发',NULL,NULL,NULL,0),(138,'凡士林',0,'/Storage/Plat/Brand/logo_138.jpg',NULL,'凡士林是vaseline的译音，一种油脂状的石油产品。白色至黄棕色允许有矿物油气味，而不允许有煤油气味。滴点约37-54度。是由石油的残油经硫酸和白土精制而得，也可以由固体石腊烃和矿物润滑油调制而成。凡士林的化学成分长链烷烃。',NULL,NULL,NULL,0),(139,'老人头',0,'/Storage/Plat/Brand/logo_139.png',NULL,'老人头五倍子泡沫染发剂纯植物染发梳染发膏染发笔染发棒黑色',NULL,NULL,NULL,0),(140,'佰草集',0,'/Storage/Plat/Brand/logo_140.jpg',NULL,'佰草集',NULL,NULL,NULL,0),(141,'香奈儿',0,'/Storage/Plat/Brand/logo_141.jpg',NULL,'香奈儿（CHANEL)），是由Gabrielle Chanel于1913年在法国巴黎创立的品牌，至今已有百年历史。',NULL,NULL,NULL,0),(142,'海蓝之谜',0,'/Storage/Plat/Brand/logo_142.jpg',NULL,'LA MER海蓝之谜，中国唯一官方网站，全球高端奢华护肤品牌，从具深层滋养保湿能量的深海巨藻中萃取神奇活性精萃，拥有强大修复再生功效。',NULL,NULL,NULL,0),(143,'福安康',0,'/Storage/Plat/Brand/logo_143.jpg',NULL,'福安康秉承“弘扬敬老助残传统美德，发展老残病人用品事业”的宗旨，积极倡导老残病人护理新概念，积极推动敬老助残事业的发展，在做大、做强“福安康” 品牌的辛勤努力下，从最初的直营店经营发展为现在的连锁经营，经营品种由几十个发展到现在的六大类十二大系列、数千个品种，涵盖了老年人、残疾人、病人康复、保健护理、治疗、健身、娱乐、休闲的各个方面。',NULL,NULL,NULL,0),(144,'曼秀雷敦',0,'/Storage/Plat/Brand/logo_144.jpg',NULL,'曼秀雷敦自1889年创立以来,分支机构遍布全球多个国家。1991年,曼秀雷敦(中国)药业有限公司在广东省中山市成立,其先进的生产设备、严谨的生产标准及专业的销售团队。',NULL,NULL,NULL,0),(145,'柏莱雅',0,'/Storage/Plat/Brand/logo_145.jpg',NULL,'柏莱雅化妆品',NULL,NULL,NULL,0),(146,'美帕',0,'/Storage/Plat/Brand/logo_146.png',NULL,'MedSPA的产品由法国顶级联合医学实验室出品，其实验室为全球最前沿皮肤诊所及抗衰老中心、著名护肤品牌商而定制小众产品。',NULL,NULL,NULL,0),(147,'HTC',0,'/Storage/Plat/Brand/logo_147.jpg',NULL,NULL,NULL,NULL,NULL,0),(148,'御泥坊',0,'/Storage/Plat/Brand/logo_148.jpg',NULL,'御泥坊，相传在滩头，这个有着1500年历史的湘西边陲小镇，古代的居民们一直保留着一种奇特的“祭泥仪式”。 清光绪年间，以这种神秘泥块为原料生产的护肤品颇受妇女欢迎，成为宫中养颜圣品，被封为“御泥”。御泥坊通过网络口碑相传，已成为中国泥浆面膜第一品牌',NULL,NULL,NULL,0),(149,'松下',0,'/Storage/Plat/Brand/logo_149.png',NULL,'松下电器始终秉承着“通过生产、销售活动，改善并提高社会生活，为世界文化的发展做贡献”的经营理念，潜心研发了Econavi节能导航与nanoe纳米水离子两项先进技术，致力于为中国消费者提供最新的冰箱、电视机、4K数码相机、空气净化器在内的高品质电器产品。 ',NULL,NULL,NULL,0),(150,'高丝',0,'/Storage/Plat/Brand/logo_150.png',NULL,'高丝（日语：コーセー），是日本一家以化妆品制造与贩售为主的企业，初期以代理其他美容化妆品牌为主，1948年开始发展自己的品牌，由创办者小林孝三郎结合化学与药学人士于1946年创立。',NULL,NULL,NULL,0),(151,'春笑',0,'/Storage/Plat/Brand/logo_151.png',NULL,'春天般的微笑',NULL,NULL,NULL,0),(152,'仟草佰露 ',0,'/Storage/Plat/Brand/logo_152.png',NULL,'仟草佰露严选最纯净的有机植物与芳香精油、结合传统医疗的古老智慧，呈现了最天然、最完整的植物商品。以合理、生活化的价格分享给大家，让精油产品唾手可得。',NULL,NULL,NULL,0),(153,'Gukoo',0,'/Storage/Plat/Brand/logo_153.jpg',NULL,'Gukoo',NULL,NULL,NULL,0),(154,'小米',0,'/Storage/Plat/Brand/logo_154.jpg',NULL,'小米科技',NULL,NULL,NULL,0),(155,'美特斯邦威',0,'/Storage/Plat/Brand/logo_155.jpg',NULL,'美特斯邦威',NULL,NULL,NULL,0),(156,'Allin',0,'/Storage/Plat/Brand/logo_156.jpg',NULL,'Allin',NULL,NULL,NULL,0),(259,'Nike',0,'/Storage/Plat/Brand/logo_259.jpg',NULL,NULL,NULL,NULL,NULL,0),(260,'杰克琼斯',0,'/Storage/Plat/Brand/logo_260.jpg',NULL,NULL,NULL,NULL,NULL,0),(261,'京天华盛',0,'/Storage/Plat/Brand/logo_261.jpg',NULL,NULL,NULL,NULL,NULL,0),(262,'乔丹',0,'/Storage/Plat/Brand/logo_262.jpg',NULL,NULL,NULL,NULL,NULL,0),(263,'周先生',0,'/Storage/Plat/Brand/logo_263.gif',NULL,NULL,NULL,NULL,NULL,0),(264,'戴尔',0,'/Storage/Plat/Brand/logo_264.gif',NULL,NULL,NULL,NULL,NULL,0),(265,'1acer',0,'/Storage/Plat/Brand/logo_265.png',NULL,'商家申请新品牌','1','1','1',0),(266,'ceshi',0,'/Storage/Plat/Brand/logo_266.jpg',NULL,NULL,NULL,NULL,NULL,0),(267,'hishop',0,'/Storage/Plat/Brand/logo_267.jpg',NULL,NULL,NULL,NULL,NULL,0),(270,'测试',0,'/Storage/Plat/Brand/logo_270.png',NULL,'策士',NULL,NULL,NULL,0),(271,'第三方',0,'/Storage/Plat/Brand/logo_271.png',NULL,'德国风格的',NULL,NULL,NULL,0),(272,'斯蒂芬',0,'/Storage/Plat/Brand/logo_272.png',NULL,'斯蒂芬',NULL,NULL,NULL,0),(273,'七格格',0,'/Storage/Plat/Brand/logo_273.jpg',NULL,'七格格',NULL,NULL,NULL,0),(274,'马克华菲',0,'/Storage/Plat/Brand/logo_274.jpg',NULL,'马克华菲',NULL,NULL,NULL,0),(275,'卡宾',0,'/Storage/Plat/Brand/logo_275.jpg',NULL,'卡宾',NULL,NULL,NULL,0),(276,'vishop',0,'/Storage/Plat/Brand/logo_276.jpg',NULL,'vishop',NULL,NULL,NULL,0),(277,'olrain',0,'/Storage/Plat/Brand/logo_277.jpg',NULL,'olrain',NULL,NULL,NULL,0),(278,'韩都衣舍',0,'/Storage/Plat/Brand/logo_278.jpg',NULL,'韩都衣舍',NULL,NULL,NULL,0),(279,'森马',0,'/Storage/Plat/Brand/logo_279.jpg',NULL,'森马',NULL,NULL,NULL,0),(280,'珀莱雅',0,'/Storage/Plat/Brand/logo_280.jpg',NULL,'珀莱雅',NULL,NULL,NULL,0),(281,'自然堂',0,'/Storage/Plat/Brand/logo_281.jpg',NULL,'自然堂',NULL,NULL,NULL,0),(282,'Shiseido资生堂',0,'/Storage/Plat/Brand/logo_282.jpg',NULL,'Shiseido资生堂',NULL,NULL,NULL,0),(283,'Clinique倩碧',0,'/Storage/Plat/Brand/logo_283.jpg',NULL,'Clinique倩碧',NULL,NULL,NULL,0),(284,'SKII',0,'/Storage/Plat/Brand/logo_284.jpg',NULL,'SKII',NULL,NULL,NULL,0),(285,'美肤宝',0,'/Storage/Plat/Brand/logo_285.jpg',NULL,'美肤宝',NULL,NULL,NULL,0),(286,'Marubi丸美',0,'/Storage/Plat/Brand/logo_286.jpg',NULL,'Marubi/丸美',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `Himall_Brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_BrowsingHistory`
--

DROP TABLE IF EXISTS `Himall_BrowsingHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_BrowsingHistory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberId` bigint(20) NOT NULL COMMENT '会员ID',
  `ProductId` bigint(20) NOT NULL,
  `BrowseTime` datetime NOT NULL COMMENT '浏览时间',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_BrowsingHistory_Himall_BrowsingHistory` (`MemberId`) USING BTREE,
  KEY `FK_Himall_BrowsingHistory_Himall_Products` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_browsinghistory_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `Himall_Members` (`Id`),
  CONSTRAINT `himall_browsinghistory_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2057 DEFAULT CHARSET=utf8 COMMENT='浏览历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_BrowsingHistory`
--

LOCK TABLES `Himall_BrowsingHistory` WRITE;
/*!40000 ALTER TABLE `Himall_BrowsingHistory` DISABLE KEYS */;
INSERT INTO `Himall_BrowsingHistory` VALUES (1932,543,185,'2015-10-08 15:47:30'),(1933,541,189,'2015-10-14 09:20:00'),(1934,542,187,'2015-10-08 15:55:33'),(1935,545,189,'2015-10-10 17:30:17'),(1936,543,188,'2015-10-08 16:03:11'),(1939,541,301,'2015-10-14 13:58:50'),(1940,545,301,'2015-10-08 16:27:42'),(1941,541,186,'2015-10-13 16:13:02'),(1943,541,230,'2015-10-13 15:43:59'),(1945,550,250,'2015-10-10 10:52:55'),(1946,549,301,'2015-10-09 14:26:33'),(1948,552,302,'2015-10-09 14:48:46'),(1949,553,230,'2015-10-10 08:23:27'),(1950,541,302,'2015-10-14 10:46:11'),(1951,550,241,'2015-10-09 16:00:29'),(1952,550,224,'2015-10-09 16:00:39'),(1953,544,189,'2015-10-09 16:12:39'),(1954,555,182,'2015-10-10 09:17:56'),(1955,556,189,'2015-10-10 10:31:59'),(1956,559,250,'2015-10-10 14:22:27'),(1957,560,246,'2015-10-10 15:43:23'),(1958,560,241,'2015-10-10 15:43:23'),(1959,561,244,'2015-10-10 15:30:57'),(1960,560,245,'2015-10-10 15:40:06'),(1961,560,253,'2015-10-10 15:40:56'),(1962,567,250,'2015-10-10 16:19:31'),(1963,567,302,'2015-10-10 16:22:28'),(1964,568,302,'2015-10-10 17:47:12'),(1965,544,187,'2015-10-10 17:15:33'),(1966,568,230,'2015-10-10 17:35:53'),(1967,569,250,'2015-10-10 17:41:28'),(1968,570,187,'2015-10-10 17:51:13'),(1970,572,186,'2015-10-11 15:17:18'),(1971,572,230,'2015-10-11 15:17:49'),(1972,572,252,'2015-10-11 15:18:08'),(1973,572,253,'2015-10-11 15:18:09'),(1975,548,243,'2015-10-11 22:08:26'),(1976,548,237,'2015-10-13 12:17:35'),(1977,574,231,'2015-10-11 22:18:21'),(1978,575,253,'2015-10-11 22:41:06'),(1979,575,235,'2015-10-11 22:41:17'),(1980,576,192,'2015-10-11 23:47:51'),(1981,557,244,'2015-10-12 08:44:00'),(1982,557,250,'2015-10-12 08:44:38'),(1983,557,240,'2015-10-12 08:44:59'),(1984,577,229,'2015-10-12 10:18:47'),(1985,578,242,'2015-10-12 12:43:27'),(1986,578,244,'2015-10-12 10:27:25'),(1987,578,246,'2015-10-12 10:30:26'),(1988,577,190,'2015-10-12 10:36:41'),(1989,577,226,'2015-10-12 10:50:38'),(1990,577,302,'2015-10-12 11:18:22'),(1991,577,253,'2015-10-12 11:18:22'),(1992,579,248,'2015-10-12 11:49:05'),(1994,578,250,'2015-10-12 22:01:14'),(1995,578,302,'2015-10-12 12:43:27'),(2000,541,306,'2015-10-13 15:43:47'),(2001,581,302,'2015-10-12 17:45:01'),(2002,541,184,'2015-10-13 17:03:37'),(2003,582,194,'2015-10-13 09:15:07'),(2004,583,301,'2015-10-13 11:15:43'),(2005,548,241,'2015-10-13 12:17:53'),(2006,548,242,'2015-10-13 12:18:00'),(2007,584,230,'2015-10-13 12:37:26'),(2008,584,306,'2015-10-13 12:46:56'),(2009,541,307,'2015-10-13 16:18:29'),(2010,541,305,'2015-10-13 16:23:56'),(2011,584,303,'2015-10-13 12:47:36'),(2013,586,301,'2015-10-13 14:07:45'),(2014,541,231,'2015-10-13 14:42:50'),(2015,541,222,'2015-10-13 14:42:02'),(2016,541,253,'2015-10-13 17:14:54'),(2017,587,310,'2015-10-13 15:13:01'),(2018,544,196,'2015-10-13 15:52:44'),(2019,557,196,'2015-10-14 14:21:37'),(2020,554,194,'2015-10-13 17:10:21'),(2021,541,304,'2015-10-13 21:07:37'),(2022,541,256,'2015-10-13 17:33:28'),(2023,590,228,'2015-10-13 17:37:33'),(2024,541,245,'2015-10-13 17:40:20'),(2025,592,230,'2015-10-13 20:57:23'),(2026,541,311,'2015-10-13 21:07:06'),(2027,550,196,'2015-10-14 15:45:21'),(2028,548,301,'2015-10-14 09:23:18'),(2029,548,184,'2015-10-14 09:24:20'),(2030,593,312,'2015-10-14 10:28:20'),(2031,541,312,'2015-10-14 09:55:01'),(2032,593,313,'2015-10-14 13:51:24'),(2033,550,313,'2015-10-14 10:58:40'),(2034,560,313,'2015-10-14 10:41:19'),(2035,560,312,'2015-10-14 10:28:20'),(2036,595,313,'2015-10-14 10:34:09'),(2037,541,193,'2015-10-14 13:56:12'),(2038,597,301,'2015-10-14 14:04:56'),(2039,599,252,'2015-10-14 14:16:53'),(2040,599,185,'2015-10-14 14:17:14'),(2041,541,246,'2015-10-14 16:29:15'),(2042,557,224,'2015-10-14 14:24:59'),(2043,601,221,'2015-10-14 15:07:03'),(2044,601,219,'2015-10-14 15:07:26'),(2045,600,235,'2015-10-14 15:07:55'),(2046,601,313,'2015-10-14 15:26:26'),(2047,600,313,'2015-10-14 15:09:50'),(2048,601,246,'2015-10-14 15:17:55'),(2049,600,246,'2015-10-14 15:14:57'),(2050,584,246,'2015-10-14 15:22:51'),(2051,601,244,'2015-10-14 15:25:35'),(2052,601,237,'2015-10-14 15:24:48'),(2053,600,230,'2015-10-14 15:47:39'),(2054,541,314,'2015-10-14 17:19:36'),(2055,593,196,'2015-10-14 15:46:08'),(2056,603,246,'2015-10-14 16:27:59');
/*!40000 ALTER TABLE `Himall_BrowsingHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_BusinessCategories`
--

DROP TABLE IF EXISTS `Himall_BusinessCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_BusinessCategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `CategoryId` bigint(20) NOT NULL COMMENT '分类ID',
  `CommisRate` decimal(8,2) NOT NULL COMMENT '分佣比例',
  PRIMARY KEY (`Id`),
  KEY `FK_Category_BusinessCategory` (`CategoryId`) USING BTREE,
  CONSTRAINT `himall_businesscategories_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `Himall_Categories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2613 DEFAULT CHARSET=utf8 COMMENT='店铺经营类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_BusinessCategories`
--

LOCK TABLES `Himall_BusinessCategories` WRITE;
/*!40000 ALTER TABLE `Himall_BusinessCategories` DISABLE KEYS */;
INSERT INTO `Himall_BusinessCategories` VALUES (1571,211,29,1.00),(1572,211,30,2.00),(1573,211,33,1.00),(1574,211,34,2.00),(1575,211,35,1.00),(1576,211,36,3.00),(1577,211,38,2.00),(1578,211,39,2.00),(1579,211,73,4.00),(1580,211,77,2.00),(1581,211,78,1.00),(1582,211,79,3.00),(1583,211,80,1.00),(1584,211,81,3.00),(1585,211,82,4.00),(1586,211,570,4.00),(2107,210,64,2.00),(2108,210,65,4.00),(2109,210,66,2.00),(2110,210,67,2.00),(2111,210,137,4.00),(2112,210,138,5.00),(2113,210,139,3.00),(2114,210,140,2.00),(2115,210,141,4.00),(2116,210,142,1.00),(2117,210,143,2.00),(2118,210,144,2.00),(2119,210,49,2.00),(2181,215,64,2.00),(2182,215,65,4.00),(2183,215,66,2.00),(2184,215,67,2.00),(2185,215,137,4.00),(2186,215,138,5.00),(2187,215,139,3.00),(2188,215,140,2.00),(2189,215,141,4.00),(2190,215,142,1.00),(2191,215,143,2.00),(2192,215,144,2.00),(2193,215,357,1.00),(2477,232,233,2.00),(2478,232,235,3.00),(2479,232,237,3.00),(2480,232,239,4.00),(2481,232,241,1.00),(2482,232,243,1.00),(2483,232,245,2.00),(2484,232,247,3.00),(2485,232,249,4.00),(2486,232,251,3.00),(2487,232,253,3.00),(2488,232,256,2.00),(2489,232,258,2.00),(2490,232,259,3.00),(2491,232,260,3.00),(2492,232,262,3.00),(2493,232,323,1.00),(2494,232,324,2.00),(2495,232,325,2.00),(2496,232,327,2.00),(2497,232,330,2.00),(2498,232,331,2.00),(2499,232,334,3.00),(2500,232,336,1.00),(2501,232,337,2.00),(2502,232,339,1.00),(2503,232,342,2.00),(2504,232,343,3.00),(2505,232,346,2.00),(2506,232,348,2.00),(2507,232,350,2.00),(2508,233,29,1.00),(2509,233,30,2.00),(2510,233,33,1.00),(2511,233,34,2.00),(2512,233,35,1.00),(2513,233,36,3.00),(2514,233,38,2.00),(2515,233,39,2.00),(2516,233,73,4.00),(2517,233,77,2.00),(2518,233,78,1.00),(2519,233,79,3.00),(2520,233,80,1.00),(2521,233,81,3.00),(2522,233,82,4.00),(2523,233,570,4.00),(2524,235,55,2.00),(2525,235,56,2.00),(2526,235,57,1.00),(2527,235,58,1.00),(2528,235,59,2.00),(2529,235,111,2.00),(2530,235,112,3.00),(2531,235,113,5.00),(2532,235,114,3.00),(2533,235,115,3.00),(2534,235,116,3.00),(2535,235,117,3.00),(2536,235,118,3.00),(2537,235,119,3.00),(2538,235,120,4.00),(2539,236,43,3.00),(2540,237,48,2.00),(2541,237,49,2.00),(2542,237,50,2.00),(2543,237,51,2.00),(2544,237,85,2.00),(2545,237,86,1.00),(2546,237,87,4.00),(2547,237,88,2.00),(2548,237,89,3.00),(2549,237,90,3.00),(2550,237,91,2.00),(2551,237,92,5.00),(2552,237,52,1.00),(2553,237,53,1.00),(2554,237,54,2.00),(2555,237,96,1.00),(2556,237,97,3.00),(2557,237,98,2.00),(2558,237,99,2.00),(2559,237,100,1.00),(2560,237,101,2.00),(2561,237,102,3.00),(2562,237,103,3.00),(2563,237,104,4.00),(2564,237,105,5.00),(2565,237,106,3.00),(2566,237,107,3.00),(2567,238,323,1.00),(2568,238,324,2.00),(2569,238,325,2.00),(2570,238,327,2.00),(2571,238,330,2.00),(2572,238,331,2.00),(2573,238,334,3.00),(2574,238,336,1.00),(2575,238,337,2.00),(2576,238,339,1.00),(2577,238,342,2.00),(2578,238,343,3.00),(2579,238,346,2.00),(2580,238,348,2.00),(2581,238,350,2.00),(2582,240,50,2.00),(2583,240,58,1.00),(2584,242,41,2.00),(2585,245,357,1.00),(2586,247,29,1.00),(2587,247,30,2.00),(2588,247,33,1.00),(2589,247,34,2.00),(2590,247,35,1.00),(2591,247,36,3.00),(2592,247,38,2.00),(2593,247,39,2.00),(2594,247,73,4.00),(2595,247,77,2.00),(2596,247,78,1.00),(2597,247,79,3.00),(2598,247,80,1.00),(2599,247,81,3.00),(2600,247,82,4.00),(2601,247,570,4.00),(2602,247,40,3.00),(2603,247,41,2.00),(2604,247,42,3.00),(2605,247,43,3.00),(2606,247,44,3.00),(2607,247,45,3.00),(2608,247,46,1.00),(2609,247,47,2.00),(2610,247,83,3.00),(2611,248,384,1.00),(2612,249,505,2.00);
/*!40000 ALTER TABLE `Himall_BusinessCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Capital`
--

DROP TABLE IF EXISTS `Himall_Capital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Capital` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemId` bigint(20) NOT NULL COMMENT '会员ID',
  `Balance` decimal(18,2) DEFAULT '0.00' COMMENT '可用余额',
  `FreezeAmount` decimal(18,2) DEFAULT '0.00' COMMENT '冻结资金',
  `ChargeAmount` decimal(18,2) DEFAULT '0.00' COMMENT '累计充值总金额',
  PRIMARY KEY (`Id`Balance
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Capital`
--

LOCK TABLES `Himall_Capital` WRITE;
/*!40000 ALTER TABLE `Himall_Capital` DISABLE KEYS */;
INSERT INTO `Himall_Capital` VALUES (73,541,102.09,1.00,0.10),(74,550,4.00,0.00,0.00),(75,551,2.00,0.00,0.00),(76,559,2.00,0.00,0.00),(77,560,2.00,0.00,0.00),(78,567,2.00,0.00,0.00),(79,569,2.00,0.00,0.00),(80,557,2.00,0.00,0.00),(81,578,2.00,0.00,0.00),(82,593,1.01,0.00,1.00),(83,599,60.00,0.00,0.00);
/*!40000 ALTER TABLE `Himall_Capital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CapitalDetail`
--

DROP TABLE IF EXISTS `Himall_CapitalDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CapitalDetail` (
  `Id` bigint(20) NOT NULL,
  `CapitalID` bigint(20) NOT NULL COMMENT '资产主表ID',
  `SourceType` int(11) NOT NULL COMMENT '资产类型',
  `Amount` decimal(18,2) NOT NULL COMMENT '金额',
  `SourceData` varchar(100) DEFAULT NULL COMMENT '来源数据',
  `CreateTime` datetime DEFAULT NULL COMMENT '交易时间',
  `Remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_Himall_CapitalDetail` (`CapitalID`),
  CONSTRAINT `FK_Reference_Himall_CapitalDetail` FOREIGN KEY (`CapitalID`) REFERENCES `Himall_Capital` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CapitalDetail`
--

LOCK TABLES `Himall_CapitalDetail` WRITE;
/*!40000 ALTER TABLE `Himall_CapitalDetail` DISABLE KEYS */;
INSERT INTO `Himall_CapitalDetail` VALUES (2015101240866321,73,4,-0.01,'2015101296168092','2015-10-12 11:59:36',NULL),(2015101261157183,73,5,45.00,'1234567952','2015-10-12 11:57:28',NULL),(2015101402924846,73,5,58.00,'1234567953','2015-10-14 10:20:34',NULL),(2015101495031619,82,5,0.01,'1234567954','2015-10-14 10:20:11',NULL),(2015101499322881,83,5,60.00,'1234567956','2015-10-14 14:22:48',NULL),(15100918204821397,73,2,0.10,'15100918195225031','2015-10-09 18:20:48',' 微信扫码支付'),(15100918265111244,74,1,2.00,NULL,'2015-10-09 18:26:52',' '),(15101007055417922,75,1,2.00,NULL,'2015-10-10 07:05:53',' '),(15101014125215161,76,1,2.00,NULL,'2015-10-10 14:11:13',' '),(15101015151314113,77,1,2.00,NULL,'2015-10-10 15:15:14',' '),(15101016165412438,78,1,2.00,NULL,'2015-10-09 18:28:05',' '),(15101017394415086,79,1,2.00,NULL,'2015-10-10 17:38:31',' '),(15101216173512344,80,1,2.00,NULL,'2015-10-12 16:17:35',' '),(15101222012916507,81,1,2.00,NULL,'2015-10-12 22:01:29',' '),(15101411185719383,74,1,2.00,NULL,'2015-10-14 11:18:58',' '),(15101411222426068,82,2,1.00,'15101411215520903','2015-10-14 11:22:24',' 微信扫码支付');
/*!40000 ALTER TABLE `Himall_CapitalDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CashDeposit`
--

DROP TABLE IF EXISTS `Himall_CashDeposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CashDeposit` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ShopId` bigint(20) NOT NULL COMMENT 'Shop表外键',
  `CurrentBalance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用金额',
  `TotalBalance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已缴纳金额',
  `Date` datetime NOT NULL COMMENT '最后一次缴纳时间',
  `EnableLabels` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示标志，只有保证金欠费该字段才有用，默认显示',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_CashDeposit_Himall_Shops` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_cashdeposit_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COMMENT='保证金';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CashDeposit`
--

LOCK TABLES `Himall_CashDeposit` WRITE;
/*!40000 ALTER TABLE `Himall_CashDeposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_CashDeposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CashDepositDetail`
--

DROP TABLE IF EXISTS `Himall_CashDepositDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CashDepositDetail` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CashDepositId` bigint(20) NOT NULL DEFAULT '0',
  `AddDate` datetime NOT NULL,
  `Balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Operator` varchar(50) NOT NULL COMMENT '操作类型',
  `Description` varchar(1000) DEFAULT NULL COMMENT '说明',
  `RechargeWay` int(11) DEFAULT NULL COMMENT '充值类型（银联、支付宝之类的）',
  PRIMARY KEY (`Id`),
  KEY `KF_Himall_CashDeposit_Himall_CashDepositDetail` (`CashDepositId`) USING BTREE,
  CONSTRAINT `himall_cashdepositdetail_ibfk_1` FOREIGN KEY (`CashDepositId`) REFERENCES `Himall_CashDeposit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=gbk COMMENT='保证金详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CashDepositDetail`
--

LOCK TABLES `Himall_CashDepositDetail` WRITE;
/*!40000 ALTER TABLE `Himall_CashDepositDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_CashDepositDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Categories`
--

DROP TABLE IF EXISTS `Himall_Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Categories` (
  `Id` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL COMMENT '分类名称',
  `Icon` varchar(1000) DEFAULT NULL COMMENT '分类图标',
  `DisplaySequence` bigint(20) NOT NULL,
  `ParentCategoryId` bigint(20) NOT NULL,
  `Depth` int(11) NOT NULL COMMENT '分类的深度',
  `Path` varchar(100) NOT NULL COMMENT '分类的路径（以|分离）',
  `RewriteName` varchar(50) DEFAULT NULL COMMENT '未使用',
  `HasChildren` tinyint(1) NOT NULL COMMENT '是否有子分类',
  `TypeId` bigint(20) NOT NULL DEFAULT '0',
  `CommisRate` decimal(8,2) NOT NULL COMMENT '分佣比例',
  `Meta_Title` varchar(1000) DEFAULT NULL,
  `Meta_Description` varchar(1000) DEFAULT NULL,
  `Meta_Keywords` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Type_Category` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_categories_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `Himall_Types` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Categories`
--

LOCK TABLES `Himall_Categories` WRITE;
/*!40000 ALTER TABLE `Himall_Categories` DISABLE KEYS */;
INSERT INTO `Himall_Categories` VALUES (1,'图书','/Storage/Plat/Category/201411280221592666310.jpg',6,0,1,'1',NULL,1,6,0.00,NULL,NULL,NULL),(2,'电子书',NULL,2,1,2,'1|2',NULL,1,6,0.00,NULL,NULL,NULL),(3,'文学',NULL,2,1,2,'1|3',NULL,1,6,0.00,NULL,NULL,NULL),(4,'少儿',NULL,3,1,2,'1|4',NULL,1,6,0.00,NULL,NULL,NULL),(5,'音像',NULL,33,0,1,'5',NULL,1,42,0.00,NULL,NULL,NULL),(6,'教育音像',NULL,3,5,2,'5|6',NULL,1,1,0.00,NULL,NULL,NULL),(7,'数字音乐',NULL,2,5,2,'5|7',NULL,1,1,0.00,NULL,NULL,NULL),(8,'影视',NULL,1,5,2,'5|8',NULL,1,1,0.00,NULL,NULL,NULL),(9,'数字商品',NULL,1,0,1,'9',NULL,1,1,0.00,NULL,NULL,NULL),(10,'数字音乐',NULL,1,9,2,'9|10',NULL,1,1,0.00,NULL,NULL,NULL),(11,'网络原创',NULL,2,9,2,'9|11',NULL,1,1,0.00,NULL,NULL,NULL),(13,'家用电器',NULL,2,0,1,'13',NULL,1,24,0.00,NULL,NULL,NULL),(14,'大家电',NULL,1,13,2,'13|14',NULL,1,1,0.00,NULL,NULL,NULL),(15,'数字杂志',NULL,3,9,2,'9|15',NULL,1,1,0.00,NULL,NULL,NULL),(16,'生活电器',NULL,2,13,2,'13|16',NULL,1,1,0.00,NULL,NULL,NULL),(17,'手机',NULL,17,0,1,'17',NULL,1,12,0.00,NULL,NULL,NULL),(18,'手机通讯',NULL,1,17,2,'17|18',NULL,1,1,0.00,NULL,NULL,NULL),(19,'合约机',NULL,2,17,2,'17|19',NULL,1,1,0.00,NULL,NULL,NULL),(20,'数码',NULL,5,0,1,'20',NULL,1,13,0.00,NULL,NULL,NULL),(21,'数码配件',NULL,1,20,2,'20|21',NULL,1,1,0.00,NULL,NULL,NULL),(22,'时尚影音',NULL,2,20,2,'20|22',NULL,1,1,0.00,NULL,NULL,NULL),(23,'电脑',NULL,7,0,1,'23',NULL,1,25,0.00,NULL,NULL,NULL),(24,'电脑整机',NULL,1,23,2,'23|24',NULL,1,25,0.00,NULL,NULL,NULL),(25,'电脑配件',NULL,2,23,2,'23|25',NULL,1,25,0.00,NULL,NULL,NULL),(26,'办公',NULL,8,0,1,'26',NULL,1,25,0.00,NULL,NULL,NULL),(27,'办公文仪',NULL,1,26,2,'26|27',NULL,1,25,0.00,NULL,NULL,NULL),(28,'服务产品',NULL,2,26,2,'26|28',NULL,1,1,0.00,NULL,NULL,NULL),(29,'小说',NULL,4,2,3,'1|2|29',NULL,0,6,1.00,NULL,NULL,NULL),(30,'多媒体图书',NULL,2,2,3,'1|2|30',NULL,0,6,2.00,NULL,NULL,NULL),(33,'数字杂志',NULL,3,2,3,'1|2|33',NULL,0,6,1.00,NULL,NULL,NULL),(34,'诗歌词曲',NULL,1,3,3,'1|3|34',NULL,0,6,2.00,NULL,NULL,NULL),(35,'世界名著',NULL,2,3,3,'1|3|35',NULL,0,6,1.00,NULL,NULL,NULL),(36,'名家作品',NULL,3,3,3,'1|3|36',NULL,0,6,3.00,NULL,NULL,NULL),(38,'动漫/卡通',NULL,1,4,3,'1|4|38',NULL,0,6,2.00,NULL,NULL,NULL),(39,'少儿英语',NULL,2,4,3,'1|4|39',NULL,0,6,2.00,NULL,NULL,NULL),(40,'学前启蒙',NULL,3,6,3,'5|6|40',NULL,0,1,3.00,NULL,NULL,NULL),(41,'英语学习',NULL,1,6,3,'5|6|41',NULL,0,1,2.00,NULL,NULL,NULL),(42,'电脑培训',NULL,2,6,3,'5|6|42',NULL,0,1,3.00,NULL,NULL,NULL),(43,'明星周边',NULL,1,7,3,'5|7|43',NULL,0,1,3.00,NULL,NULL,NULL),(44,'欧美流行',NULL,2,7,3,'5|7|44',NULL,0,1,3.00,NULL,NULL,NULL),(45,'古典',NULL,3,7,3,'5|7|45',NULL,0,1,3.00,NULL,NULL,NULL),(46,'影视周边',NULL,1,8,3,'5|8|46',NULL,0,1,1.00,NULL,NULL,NULL),(47,'电视剧',NULL,2,8,3,'5|8|47',NULL,0,1,2.00,NULL,NULL,NULL),(48,'流行音乐',NULL,1,10,3,'9|10|48',NULL,0,1,2.00,NULL,NULL,NULL),(49,'爵士蓝调',NULL,2,10,3,'9|10|49',NULL,0,1,2.00,NULL,NULL,NULL),(50,'言情',NULL,1,11,3,'9|11|50',NULL,0,1,2.00,NULL,NULL,NULL),(51,'生活/家庭',NULL,4,15,3,'9|15|51',NULL,0,1,2.00,NULL,NULL,NULL),(52,'空调',NULL,1,14,3,'13|14|52',NULL,0,24,1.00,NULL,NULL,NULL),(53,'取暖电器',NULL,1,16,3,'13|16|53',NULL,0,24,1.00,NULL,NULL,NULL),(54,'净化器',NULL,2,16,3,'13|16|54',NULL,0,24,2.00,NULL,NULL,NULL),(55,'720高清',NULL,1,18,3,'17|18|55',NULL,0,12,2.00,NULL,NULL,NULL),(56,'拍照神器',NULL,2,18,3,'17|18|56',NULL,0,12,2.00,NULL,NULL,NULL),(57,'双卡手机',NULL,3,18,3,'17|18|57',NULL,0,12,1.00,NULL,NULL,NULL),(58,'中国联通',NULL,1,19,3,'17|19|58',NULL,0,12,1.00,NULL,NULL,NULL),(59,'中国移动',NULL,2,19,3,'17|19|59',NULL,0,12,2.00,NULL,NULL,NULL),(60,'存储卡',NULL,1,21,3,'20|21|60',NULL,0,13,2.00,NULL,NULL,NULL),(61,' 读卡器',NULL,2,21,3,'20|21|61',NULL,0,13,4.00,NULL,NULL,NULL),(62,'苹果周边',NULL,1,22,3,'20|22|62',NULL,0,13,2.00,NULL,NULL,NULL),(63,' 蓝牙音箱',NULL,2,22,3,'20|22|63',NULL,0,13,3.00,NULL,NULL,NULL),(64,'笔记本',NULL,1,24,3,'23|24|64',NULL,0,25,2.00,NULL,NULL,NULL),(65,'超极本',NULL,2,24,3,'23|24|65',NULL,0,25,4.00,NULL,NULL,NULL),(66,'CPU',NULL,1,25,3,'23|25|66',NULL,0,25,2.00,NULL,NULL,NULL),(67,'显卡',NULL,2,25,3,'23|25|67',NULL,0,25,2.00,NULL,NULL,NULL),(68,'学生文具',NULL,1,27,3,'26|27|68',NULL,0,25,2.00,NULL,NULL,NULL),(69,'文件管理',NULL,2,27,3,'26|27|69',NULL,0,25,3.00,NULL,NULL,NULL),(70,'上门服务',NULL,1,28,3,'26|28|70',NULL,0,25,2.00,NULL,NULL,NULL),(71,'远程服务',NULL,2,28,3,'26|28|71',NULL,0,25,2.00,NULL,NULL,NULL),(73,'儿童教育',NULL,3,4,3,'1|4|73',NULL,0,6,4.00,NULL,NULL,NULL),(75,'教育',NULL,4,1,2,'1|75',NULL,1,6,0.00,NULL,NULL,NULL),(76,'人文社科',NULL,1,1,2,'1|76',NULL,1,6,0.00,NULL,NULL,NULL),(77,'外语学习',NULL,1,75,3,'1|75|77',NULL,0,6,2.00,NULL,NULL,NULL),(78,'考试',NULL,2,75,3,'1|75|78',NULL,0,6,1.00,NULL,NULL,NULL),(79,'教材',NULL,3,75,3,'1|75|79',NULL,0,6,3.00,NULL,NULL,NULL),(80,'社会科学',NULL,1,76,3,'1|76|80',NULL,0,6,1.00,NULL,NULL,NULL),(81,'法律',NULL,2,76,3,'1|76|81',NULL,0,6,3.00,NULL,NULL,NULL),(82,'历史',NULL,3,76,3,'1|76|82',NULL,0,6,4.00,NULL,NULL,NULL),(83,'亲子幼教',NULL,3,8,3,'5|8|83',NULL,0,1,3.00,NULL,NULL,NULL),(84,'有声读物',NULL,4,9,2,'9|84',NULL,1,1,100.00,NULL,NULL,NULL),(85,'世界音乐',NULL,3,10,3,'9|10|85',NULL,0,1,2.00,NULL,NULL,NULL),(86,'都市生活',NULL,2,11,3,'9|11|86',NULL,0,1,1.00,NULL,NULL,NULL),(87,'玄幻奇幻',NULL,3,11,3,'9|11|87',NULL,0,1,4.00,NULL,NULL,NULL),(88,'娱乐/时尚',NULL,2,15,3,'9|15|88',NULL,0,1,2.00,NULL,NULL,NULL),(89,'经管理财',NULL,3,15,3,'9|15|89',NULL,0,1,3.00,NULL,NULL,NULL),(90,'百家讲坛',NULL,1,84,3,'9|84|90',NULL,0,1,3.00,NULL,NULL,NULL),(91,'评书',NULL,2,84,3,'9|84|91',NULL,0,1,2.00,NULL,NULL,NULL),(92,'历史录音',NULL,3,84,3,'9|84|92',NULL,0,1,5.00,NULL,NULL,NULL),(93,'厨房电器',NULL,3,13,2,'13|93',NULL,1,1,100.00,NULL,NULL,NULL),(94,'个护健康',NULL,4,13,2,'13|94',NULL,1,1,100.00,NULL,NULL,NULL),(95,'五金家装',NULL,5,13,2,'13|95',NULL,1,1,100.00,NULL,NULL,NULL),(96,'平板电视',NULL,2,14,3,'13|14|96',NULL,0,24,1.00,NULL,NULL,NULL),(97,'冰箱',NULL,3,14,3,'13|14|97',NULL,0,24,3.00,NULL,NULL,NULL),(98,'吸尘器',NULL,3,16,3,'13|16|98',NULL,0,24,2.00,NULL,NULL,NULL),(99,'榨汁机',NULL,1,93,3,'13|93|99',NULL,0,24,2.00,NULL,NULL,NULL),(100,'电压力锅',NULL,2,93,3,'13|93|100',NULL,0,24,1.00,NULL,NULL,NULL),(101,'电饭煲',NULL,3,93,3,'13|93|101',NULL,0,24,2.00,NULL,NULL,NULL),(102,'口腔护理',NULL,1,94,3,'13|94|102',NULL,0,24,3.00,NULL,NULL,NULL),(103,'剃须刀',NULL,2,94,3,'13|94|103',NULL,0,24,3.00,NULL,NULL,NULL),(104,'电吹风',NULL,3,94,3,'13|94|104',NULL,0,24,4.00,NULL,NULL,NULL),(105,'LED灯',NULL,1,95,3,'13|95|105',NULL,0,24,5.00,NULL,NULL,NULL),(106,'电动工具',NULL,2,95,3,'13|95|106',NULL,0,24,3.00,NULL,NULL,NULL),(107,'排气扇',NULL,3,95,3,'13|95|107',NULL,0,24,3.00,NULL,NULL,NULL),(108,'手机配件',NULL,3,17,2,'17|108',NULL,1,1,100.00,NULL,NULL,NULL),(109,'手机预售',NULL,4,17,2,'17|109',NULL,1,1,0.00,NULL,NULL,NULL),(110,'新机首发',NULL,5,17,2,'17|110',NULL,1,1,100.00,NULL,NULL,NULL),(111,'全部手机',NULL,4,18,3,'17|18|111',NULL,0,12,2.00,NULL,NULL,NULL),(112,'中国电信',NULL,3,19,3,'17|19|112',NULL,0,12,3.00,NULL,NULL,NULL),(113,'电池',NULL,1,108,3,'17|108|113',NULL,0,12,5.00,NULL,NULL,NULL),(114,'蓝牙耳机',NULL,2,108,3,'17|108|114',NULL,0,12,3.00,NULL,NULL,NULL),(115,'移动电源',NULL,3,108,3,'17|108|115',NULL,0,12,3.00,NULL,NULL,NULL),(116,'iPhone6',NULL,1,109,3,'17|109|116',NULL,0,12,3.00,NULL,NULL,NULL),(117,'华为mate7',NULL,2,109,3,'17|109|117',NULL,0,12,3.00,NULL,NULL,NULL),(118,'iphone 6plus',NULL,3,109,3,'17|109|118',NULL,0,12,3.00,NULL,NULL,NULL),(119,'荣耀 6 ',NULL,1,110,3,'17|110|119',NULL,0,12,3.00,NULL,NULL,NULL),(120,'三星note4',NULL,2,110,3,'17|110|120',NULL,0,12,4.00,NULL,NULL,NULL),(121,' 摄影摄像',NULL,3,20,2,'20|121',NULL,1,1,100.00,NULL,NULL,NULL),(122,'智能设备',NULL,4,20,2,'20|122',NULL,1,1,100.00,NULL,NULL,NULL),(123,'电子教育',NULL,5,20,2,'20|123',NULL,1,1,100.00,NULL,NULL,NULL),(124,' 滤镜',NULL,3,21,3,'20|21|124',NULL,0,13,2.00,NULL,NULL,NULL),(125,'蓝牙耳机 ',NULL,3,22,3,'20|22|125',NULL,0,13,5.00,NULL,NULL,NULL),(126,'数码相机 ',NULL,1,121,3,'20|121|126',NULL,0,13,2.00,NULL,NULL,NULL),(127,'微单相机',NULL,2,121,3,'20|121|127',NULL,0,13,2.00,NULL,NULL,NULL),(128,' 单反相机',NULL,3,121,3,'20|121|128',NULL,0,13,2.00,NULL,NULL,NULL),(129,'智能手环',NULL,1,122,3,'20|122|129',NULL,0,12,1.00,NULL,NULL,NULL),(130,' 智能手表',NULL,2,122,3,'20|122|130',NULL,0,13,2.00,NULL,NULL,NULL),(131,'运动跟踪器',NULL,3,122,3,'20|122|131',NULL,0,13,3.00,NULL,NULL,NULL),(132,'学生平板',NULL,1,123,3,'20|123|132',NULL,0,13,5.00,NULL,NULL,NULL),(133,' 早教机',NULL,2,123,3,'20|123|133',NULL,0,13,1.00,NULL,NULL,NULL),(134,' 故事机 ',NULL,3,123,3,'20|123|134',NULL,0,13,3.00,NULL,NULL,NULL),(135,'外设产品',NULL,3,23,2,'23|135',NULL,1,25,0.00,NULL,NULL,NULL),(136,'网络产品',NULL,4,23,2,'23|136',NULL,1,25,0.00,NULL,NULL,NULL),(137,'平板电脑1',NULL,3,24,3,'23|24|137',NULL,0,25,4.00,NULL,NULL,NULL),(138,'主板',NULL,3,25,3,'23|25|138',NULL,0,25,5.00,NULL,NULL,NULL),(139,'路由器',NULL,1,135,3,'23|135|139',NULL,0,25,3.00,NULL,NULL,NULL),(140,'U盘',NULL,2,135,3,'23|135|140',NULL,0,25,2.00,NULL,NULL,NULL),(141,'鼠标',NULL,3,135,3,'23|135|141',NULL,0,25,4.00,NULL,NULL,NULL),(142,'网卡',NULL,1,136,3,'23|136|142',NULL,0,25,1.00,NULL,NULL,NULL),(143,'交换机',NULL,2,136,3,'23|136|143',NULL,0,25,2.00,NULL,NULL,NULL),(144,'3G上网',NULL,3,136,3,'23|136|144',NULL,0,25,2.00,NULL,NULL,NULL),(145,'办公打印',NULL,3,26,2,'26|145',NULL,1,1,100.00,NULL,NULL,NULL),(146,'办公文具',NULL,3,27,3,'26|27|146',NULL,0,25,2.00,NULL,NULL,NULL),(147,'打印机',NULL,1,145,3,'26|145|147',NULL,0,25,2.00,NULL,NULL,NULL),(148,'一体机',NULL,2,145,3,'26|145|148',NULL,0,25,1.00,NULL,NULL,NULL),(149,'投影机',NULL,3,145,3,'26|145|149',NULL,0,25,3.00,NULL,NULL,NULL),(150,'营养保健',NULL,9,0,1,'150',NULL,1,41,0.00,NULL,NULL,NULL),(151,'电脑软件',NULL,3,28,3,'26|28|151',NULL,0,25,4.00,NULL,NULL,NULL),(152,'家居',NULL,10,0,1,'152',NULL,1,5,0.00,NULL,NULL,NULL),(153,'家纺',NULL,1,152,2,'152|153',NULL,1,1,100.00,NULL,NULL,NULL),(154,'清洁用品',NULL,2,152,2,'152|154',NULL,1,1,100.00,NULL,NULL,NULL),(155,'生活日用',NULL,3,152,2,'152|155',NULL,1,1,100.00,NULL,NULL,NULL),(156,'灯具用品',NULL,4,152,2,'152|156',NULL,1,1,100.00,NULL,NULL,NULL),(157,'床品套件',NULL,1,153,3,'152|153|157',NULL,0,5,2.00,NULL,NULL,NULL),(158,'蚊帐',NULL,2,153,3,'152|153|158',NULL,0,5,2.00,NULL,NULL,NULL),(159,'凉席',NULL,3,153,3,'152|153|159',NULL,0,5,2.00,NULL,NULL,NULL),(160,'被子',NULL,4,153,3,'152|153|160',NULL,0,5,4.00,NULL,NULL,NULL),(161,'纸品湿巾',NULL,1,154,3,'152|154|161',NULL,0,5,2.00,NULL,NULL,NULL),(162,'衣物清洁',NULL,2,154,3,'152|154|162',NULL,0,5,1.00,NULL,NULL,NULL),(163,'家装软饰',NULL,5,152,2,'152|163',NULL,1,1,100.00,NULL,NULL,NULL),(164,'驱虫用品',NULL,3,154,3,'152|154|164',NULL,0,5,2.00,NULL,NULL,NULL),(165,'营养健康',NULL,1,150,2,'150|165',NULL,1,3,100.00,NULL,NULL,NULL),(166,'收纳用品',NULL,1,155,3,'152|155|166',NULL,0,5,2.00,NULL,NULL,NULL),(167,'雨伞雨具',NULL,2,155,3,'152|155|167',NULL,0,5,4.00,NULL,NULL,NULL),(168,'营养成分',NULL,2,150,2,'150|168',NULL,1,3,100.00,NULL,NULL,NULL),(169,'传统滋补',NULL,3,150,2,'150|169',NULL,1,3,100.00,NULL,NULL,NULL),(170,'浴室用品',NULL,3,155,3,'152|155|170',NULL,0,5,3.00,NULL,NULL,NULL),(171,'缝纫针织',NULL,4,155,3,'152|155|171',NULL,0,5,2.00,NULL,NULL,NULL),(172,'成人用品',NULL,4,150,2,'150|172',NULL,1,3,100.00,NULL,NULL,NULL),(173,'台灯',NULL,1,156,3,'152|156|173',NULL,0,5,1.00,NULL,NULL,NULL),(174,'保健器械',NULL,5,150,2,'150|174',NULL,1,3,100.00,NULL,NULL,NULL),(175,'节能灯',NULL,2,156,3,'152|156|175',NULL,0,5,3.00,NULL,NULL,NULL),(176,'LED灯',NULL,3,156,3,'152|156|176',NULL,0,5,2.00,NULL,NULL,NULL),(177,'调节免疫',NULL,1,165,3,'150|165|177',NULL,0,41,1.00,NULL,NULL,NULL),(178,'调节三高',NULL,2,165,3,'150|165|178',NULL,0,41,1.00,NULL,NULL,NULL),(179,'缓解疲劳',NULL,3,165,3,'150|165|179',NULL,0,41,1.00,NULL,NULL,NULL),(180,'肠胃养护',NULL,4,165,3,'150|165|180',NULL,0,41,1.00,NULL,NULL,NULL),(181,'照片墙',NULL,1,163,3,'152|163|181',NULL,0,5,2.00,NULL,NULL,NULL),(182,'地毯地垫',NULL,2,163,3,'152|163|182',NULL,0,5,2.00,NULL,NULL,NULL),(183,'明目益智',NULL,5,165,3,'150|165|183',NULL,0,41,1.00,NULL,NULL,NULL),(184,'装饰字画',NULL,3,163,3,'152|163|184',NULL,0,5,2.00,NULL,NULL,NULL),(185,'蛋白质',NULL,1,168,3,'150|168|185',NULL,0,41,1.00,NULL,NULL,NULL),(186,'家具',NULL,11,0,1,'186',NULL,1,26,0.00,NULL,NULL,NULL),(187,'左旋肉碱',NULL,2,168,3,'150|168|187',NULL,0,41,1.00,NULL,NULL,NULL),(188,'卧室家具',NULL,1,186,2,'186|188',NULL,1,1,100.00,NULL,NULL,NULL),(189,'客厅家具',NULL,2,186,2,'186|189',NULL,1,1,100.00,NULL,NULL,NULL),(190,'葡萄籽',NULL,3,168,3,'150|168|190',NULL,0,41,1.00,NULL,NULL,NULL),(191,'餐厅家具',NULL,3,186,2,'186|191',NULL,1,1,100.00,NULL,NULL,NULL),(192,'书房家具',NULL,4,186,2,'186|192',NULL,1,1,100.00,NULL,NULL,NULL),(193,'胶原蛋白',NULL,4,168,3,'150|168|193',NULL,0,41,1.00,NULL,NULL,NULL),(194,'储物家具',NULL,5,186,2,'186|194',NULL,1,1,100.00,NULL,NULL,NULL),(195,'芦荟提取',NULL,5,168,3,'150|168|195',NULL,0,40,1.00,NULL,NULL,NULL),(196,'床',NULL,1,188,3,'186|188|196',NULL,0,26,2.00,NULL,NULL,NULL),(197,'阿胶',NULL,1,169,3,'150|169|197',NULL,0,41,1.00,NULL,NULL,NULL),(198,'床垫',NULL,2,188,3,'186|188|198',NULL,0,26,3.00,NULL,NULL,NULL),(199,'参类',NULL,2,169,3,'150|169|199',NULL,0,41,1.00,NULL,NULL,NULL),(200,'床头柜',NULL,3,188,3,'186|188|200',NULL,0,26,4.00,NULL,NULL,NULL),(201,'冬虫夏草',NULL,3,169,3,'150|169|201',NULL,0,41,1.00,NULL,NULL,NULL),(202,'衣柜',NULL,4,188,3,'186|188|202',NULL,0,26,2.00,NULL,NULL,NULL),(203,'燕窝',NULL,4,169,3,'150|169|203',NULL,0,41,1.00,NULL,NULL,NULL),(204,'沙发',NULL,1,189,3,'186|189|204',NULL,0,26,2.00,NULL,NULL,NULL),(205,'灵芝',NULL,5,169,3,'150|169|205',NULL,0,41,1.00,NULL,NULL,NULL),(206,'电视柜',NULL,2,189,3,'186|189|206',NULL,0,26,3.00,NULL,NULL,NULL),(207,'安全避孕',NULL,1,172,3,'150|172|207',NULL,0,41,1.00,NULL,NULL,NULL),(208,'床边桌',NULL,3,189,3,'186|189|208',NULL,0,26,3.00,NULL,NULL,NULL),(209,'验孕测孕',NULL,2,172,3,'150|172|209',NULL,0,41,1.00,NULL,NULL,NULL),(210,'人体润滑',NULL,3,172,3,'150|172|210',NULL,0,41,1.00,NULL,NULL,NULL),(211,'餐桌',NULL,1,191,3,'186|191|211',NULL,0,26,2.00,NULL,NULL,NULL),(212,'情爱玩具',NULL,4,172,3,'150|172|212',NULL,0,41,1.00,NULL,NULL,NULL),(213,'餐边柜',NULL,2,191,3,'186|191|213',NULL,0,26,1.00,NULL,NULL,NULL),(214,'情趣内衣',NULL,5,172,3,'150|172|214',NULL,0,41,1.00,NULL,NULL,NULL),(215,'餐椅',NULL,3,191,3,'186|191|215',NULL,0,26,2.00,NULL,NULL,NULL),(216,'电脑椅',NULL,1,192,3,'186|192|216',NULL,0,26,1.00,NULL,NULL,NULL),(217,'电脑桌',NULL,2,192,3,'186|192|217',NULL,0,26,2.00,NULL,NULL,NULL),(218,'血压仪器',NULL,1,174,3,'150|174|218',NULL,0,41,1.00,NULL,NULL,NULL),(219,'书柜/书架',NULL,3,192,3,'186|192|219',NULL,0,26,2.00,NULL,NULL,NULL),(220,'血糖用品',NULL,2,174,3,'150|174|220',NULL,0,41,1.00,NULL,NULL,NULL),(221,'衣帽鞋架',NULL,1,194,3,'186|194|221',NULL,0,26,2.00,NULL,NULL,NULL),(222,'储物收纳',NULL,2,194,3,'186|194|222',NULL,0,26,3.00,NULL,NULL,NULL),(223,'置物架',NULL,3,194,3,'186|194|223',NULL,0,26,3.00,NULL,NULL,NULL),(224,'家装',NULL,12,0,1,'224',NULL,1,27,0.00,NULL,NULL,NULL),(225,'养生器械',NULL,3,174,3,'150|174|225',NULL,0,41,1.00,NULL,NULL,NULL),(226,'灯饰照明',NULL,1,224,2,'224|226',NULL,1,1,100.00,NULL,NULL,NULL),(227,'康复辅助',NULL,4,174,3,'150|174|227',NULL,0,41,1.00,NULL,NULL,NULL),(228,'厨房卫浴',NULL,2,224,2,'224|228',NULL,1,1,100.00,NULL,NULL,NULL),(229,'五金工具',NULL,3,224,2,'224|229',NULL,1,1,100.00,NULL,NULL,NULL),(230,'电工电料',NULL,4,224,2,'224|230',NULL,1,1,100.00,NULL,NULL,NULL),(231,'呼吸制氧',NULL,5,174,3,'150|174|231',NULL,0,41,1.00,NULL,NULL,NULL),(232,'墙地面材料',NULL,5,224,2,'224|232',NULL,1,1,100.00,NULL,NULL,NULL),(233,'吸顶灯',NULL,1,226,3,'224|226|233',NULL,0,27,2.00,NULL,NULL,NULL),(234,'食品饮料',NULL,13,0,1,'234',NULL,1,38,0.00,NULL,NULL,NULL),(235,'台灯',NULL,2,226,3,'224|226|235',NULL,0,27,3.00,NULL,NULL,NULL),(236,'进口食品',NULL,1,234,2,'234|236',NULL,1,3,100.00,NULL,NULL,NULL),(237,'筒灯',NULL,3,226,3,'224|226|237',NULL,0,27,3.00,NULL,NULL,NULL),(238,'休闲食品',NULL,2,234,2,'234|238',NULL,1,3,100.00,NULL,NULL,NULL),(239,'射灯',NULL,4,226,3,'224|226|239',NULL,0,27,4.00,NULL,NULL,NULL),(240,'地方特产',NULL,3,234,2,'234|240',NULL,1,3,100.00,NULL,NULL,NULL),(241,'淋浴花洒',NULL,1,228,3,'224|228|241',NULL,0,27,1.00,NULL,NULL,NULL),(242,'茗茶',NULL,4,234,2,'234|242',NULL,1,3,100.00,NULL,NULL,NULL),(243,'厨卫',NULL,2,228,3,'224|228|243',NULL,0,27,1.00,NULL,NULL,NULL),(244,'饮料冲调',NULL,5,234,2,'234|244',NULL,1,3,100.00,NULL,NULL,NULL),(245,'挂件龙头',NULL,3,228,3,'224|228|245',NULL,0,27,2.00,NULL,NULL,NULL),(246,'牛奶',NULL,1,236,3,'234|236|246',NULL,0,38,1.00,NULL,NULL,NULL),(247,'锁具',NULL,1,229,3,'224|229|247',NULL,0,27,3.00,NULL,NULL,NULL),(248,'饼干蛋糕',NULL,2,236,3,'234|236|248',NULL,0,38,1.00,NULL,NULL,NULL),(249,'手动工具',NULL,2,229,3,'224|229|249',NULL,0,27,4.00,NULL,NULL,NULL),(250,'巧克力',NULL,3,236,3,'234|236|250',NULL,0,38,1.00,NULL,NULL,NULL),(251,'电动工具',NULL,3,229,3,'224|229|251',NULL,0,27,3.00,NULL,NULL,NULL),(252,'休闲零食',NULL,4,236,3,'234|236|252',NULL,0,38,1.00,NULL,NULL,NULL),(253,'开关插座',NULL,1,230,3,'224|230|253',NULL,0,27,3.00,NULL,NULL,NULL),(254,'冲调饮品',NULL,5,236,3,'234|236|254',NULL,0,38,1.00,NULL,NULL,NULL),(255,'休闲零食',NULL,1,238,3,'234|238|255',NULL,0,38,1.00,NULL,NULL,NULL),(256,'智能家居',NULL,2,230,3,'224|230|256',NULL,0,27,2.00,NULL,NULL,NULL),(257,'坚果炒货',NULL,2,238,3,'234|238|257',NULL,0,38,1.00,NULL,NULL,NULL),(258,'配电箱',NULL,3,230,3,'224|230|258',NULL,0,27,2.00,NULL,NULL,NULL),(259,'油漆/涂料',NULL,1,232,3,'224|232|259',NULL,0,27,3.00,NULL,NULL,NULL),(260,'壁纸',NULL,2,232,3,'224|232|260',NULL,0,27,3.00,NULL,NULL,NULL),(261,'肉干肉脯',NULL,3,238,3,'234|238|261',NULL,0,38,1.00,NULL,NULL,NULL),(262,'瓷砖',NULL,3,232,3,'224|232|262',NULL,0,27,3.00,NULL,NULL,NULL),(263,'蜜饯果干',NULL,4,238,3,'234|238|263',NULL,0,38,1.00,NULL,NULL,NULL),(264,'厨具',NULL,14,0,1,'264',NULL,1,28,0.00,NULL,NULL,NULL),(265,'无糖食品',NULL,5,238,3,'234|238|265',NULL,0,38,1.00,NULL,NULL,NULL),(266,'烹饪锅具',NULL,1,264,2,'264|266',NULL,1,1,100.00,NULL,NULL,NULL),(267,'新疆',NULL,1,240,3,'234|240|267',NULL,0,38,1.00,NULL,NULL,NULL),(268,'厨房配件',NULL,2,264,2,'264|268',NULL,1,1,100.00,NULL,NULL,NULL),(269,'餐  具',NULL,3,264,2,'264|269',NULL,1,1,100.00,NULL,NULL,NULL),(270,'四川',NULL,2,240,3,'234|240|270',NULL,0,38,1.00,NULL,NULL,NULL),(271,'水具酒具',NULL,4,264,2,'264|271',NULL,1,1,100.00,NULL,NULL,NULL),(272,'云南',NULL,3,240,3,'234|240|272',NULL,0,38,1.00,NULL,NULL,NULL),(273,'咖啡具',NULL,5,264,2,'264|273',NULL,1,1,100.00,NULL,NULL,NULL),(274,'湖南',NULL,4,240,3,'234|240|274',NULL,0,38,1.00,NULL,NULL,NULL),(275,'内蒙',NULL,5,240,3,'234|240|275',NULL,0,38,1.00,NULL,NULL,NULL),(276,'炒锅',NULL,1,266,3,'264|266|276',NULL,0,28,2.00,NULL,NULL,NULL),(277,'铁观音',NULL,1,242,3,'234|242|277',NULL,0,38,1.00,NULL,NULL,NULL),(278,'煎锅',NULL,2,266,3,'264|266|278',NULL,0,28,2.00,NULL,NULL,NULL),(279,'普洱',NULL,2,242,3,'234|242|279',NULL,0,38,1.00,NULL,NULL,NULL),(280,'压力锅',NULL,3,266,3,'264|266|280',NULL,0,28,3.00,NULL,NULL,NULL),(281,'蒸锅',NULL,4,266,3,'264|266|281',NULL,0,28,2.00,NULL,NULL,NULL),(282,'龙井',NULL,3,242,3,'234|242|282',NULL,0,38,1.00,NULL,NULL,NULL),(283,'绿茶',NULL,4,242,3,'234|242|283',NULL,0,38,1.00,NULL,NULL,NULL),(284,'乌龙茶',NULL,5,242,3,'234|242|284',NULL,0,38,1.00,NULL,NULL,NULL),(285,'保鲜用品',NULL,1,268,3,'264|268|285',NULL,0,28,2.00,NULL,NULL,NULL),(286,'牛奶乳品',NULL,1,244,3,'234|244|286',NULL,0,38,1.00,NULL,NULL,NULL),(287,'饭盒/提锅',NULL,2,268,3,'264|268|287',NULL,0,28,2.00,NULL,NULL,NULL),(288,'饮料',NULL,2,244,3,'234|244|288',NULL,0,38,1.00,NULL,NULL,NULL),(289,'厨房工具',NULL,3,268,3,'264|268|289',NULL,0,28,3.00,NULL,NULL,NULL),(290,'饮用水',NULL,3,244,3,'234|244|290',NULL,0,38,1.00,NULL,NULL,NULL),(291,'咖啡',NULL,4,244,3,'234|244|291',NULL,0,38,1.00,NULL,NULL,NULL),(292,'餐具套装',NULL,1,269,3,'264|269|292',NULL,0,28,3.00,NULL,NULL,NULL),(293,'蜂蜜柚子茶',NULL,5,244,3,'234|244|293',NULL,0,41,1.00,NULL,NULL,NULL),(294,'碗/碟',NULL,2,269,3,'264|269|294',NULL,0,28,1.00,NULL,NULL,NULL),(295,'酒类',NULL,15,0,1,'295',NULL,1,39,0.00,NULL,NULL,NULL),(296,'筷勺/刀叉',NULL,3,269,3,'264|269|296',NULL,0,28,4.00,NULL,NULL,NULL),(297,'中外名酒',NULL,1,295,2,'295|297',NULL,1,3,100.00,NULL,NULL,NULL),(298,'葡萄酒',NULL,1,297,3,'295|297|298',NULL,0,39,1.00,NULL,NULL,NULL),(299,'塑料杯',NULL,1,271,3,'264|271|299',NULL,0,28,2.00,NULL,NULL,NULL),(300,'白酒',NULL,2,297,3,'295|297|300',NULL,0,39,1.00,NULL,NULL,NULL),(301,'运动水杯',NULL,2,271,3,'264|271|301',NULL,0,28,2.00,NULL,NULL,NULL),(302,'洋酒',NULL,3,297,3,'295|297|302',NULL,0,39,1.00,NULL,NULL,NULL),(303,'玻璃杯',NULL,3,271,3,'264|271|303',NULL,0,28,2.00,NULL,NULL,NULL),(304,'啤酒',NULL,4,297,3,'295|297|304',NULL,0,39,1.00,NULL,NULL,NULL),(305,'保温杯',NULL,4,271,3,'264|271|305',NULL,0,28,2.00,NULL,NULL,NULL),(306,'整套茶具',NULL,1,273,3,'264|273|306',NULL,0,28,1.00,NULL,NULL,NULL),(307,'黄酒',NULL,5,297,3,'295|297|307',NULL,0,39,1.00,NULL,NULL,NULL),(308,'茶杯',NULL,2,273,3,'264|273|308',NULL,0,28,1.00,NULL,NULL,NULL),(309,'生鲜',NULL,16,0,1,'309',NULL,1,40,0.00,NULL,NULL,NULL),(310,'茶壶',NULL,3,273,3,'264|273|310',NULL,0,28,2.00,NULL,NULL,NULL),(311,'生鲜食品',NULL,1,309,2,'309|311',NULL,1,3,100.00,NULL,NULL,NULL),(312,'男装',NULL,17,0,1,'312',NULL,1,1,100.00,NULL,NULL,NULL),(313,'食品礼券',NULL,2,309,2,'309|313',NULL,1,3,100.00,NULL,NULL,NULL),(314,'当季流行',NULL,1,312,2,'312|314',NULL,1,1,100.00,NULL,NULL,NULL),(315,'水果蔬菜',NULL,1,311,3,'309|311|315',NULL,0,40,1.00,NULL,NULL,NULL),(316,'上装',NULL,2,312,2,'312|316',NULL,1,1,100.00,NULL,NULL,NULL),(317,'海鲜水产',NULL,2,311,3,'309|311|317',NULL,0,40,1.00,NULL,NULL,NULL),(318,'下装',NULL,3,312,2,'312|318',NULL,1,1,100.00,NULL,NULL,NULL),(319,'海参',NULL,3,311,3,'309|311|319',NULL,0,40,1.00,NULL,NULL,NULL),(320,'特色',NULL,4,312,2,'312|320',NULL,1,1,100.00,NULL,NULL,NULL),(321,'牛排',NULL,4,311,3,'309|311|321',NULL,0,40,1.00,NULL,NULL,NULL),(322,'热销品牌',NULL,5,312,2,'312|322',NULL,1,1,100.00,NULL,NULL,NULL),(323,'纯色羽绒',NULL,1,314,3,'312|314|323',NULL,0,21,1.00,NULL,NULL,NULL),(324,'帅气牛仔',NULL,2,314,3,'312|314|324',NULL,0,21,2.00,NULL,NULL,NULL),(325,'潮流棉服',NULL,3,314,3,'312|314|325',NULL,0,21,2.00,NULL,NULL,NULL),(326,'熟食腊味',NULL,5,311,3,'309|311|326',NULL,0,40,1.00,NULL,NULL,NULL),(327,'羽绒服',NULL,1,316,3,'312|316|327',NULL,0,21,2.00,NULL,NULL,NULL),(328,'大闸蟹',NULL,1,313,3,'309|313|328',NULL,0,40,1.00,NULL,NULL,NULL),(329,'粽子',NULL,2,313,3,'309|313|329',NULL,0,40,1.00,NULL,NULL,NULL),(330,'夹克',NULL,2,316,3,'312|316|330',NULL,0,21,2.00,NULL,NULL,NULL),(331,'衬衫',NULL,3,316,3,'312|316|331',NULL,0,21,2.00,NULL,NULL,NULL),(332,'月饼',NULL,3,313,3,'309|313|332',NULL,0,40,1.00,NULL,NULL,NULL),(334,'牛仔裤',NULL,1,318,3,'312|318|334',NULL,0,21,3.00,NULL,NULL,NULL),(335,'卡券',NULL,5,313,3,'309|313|335',NULL,0,40,1.00,NULL,NULL,NULL),(336,'休闲裤',NULL,2,318,3,'312|318|336',NULL,0,21,1.00,NULL,NULL,NULL),(337,'西裤',NULL,3,318,3,'312|318|337',NULL,0,21,2.00,NULL,NULL,NULL),(338,'母婴',NULL,18,0,1,'338',NULL,1,36,0.00,NULL,NULL,NULL),(339,'华菲型格',NULL,1,320,3,'312|320|339',NULL,0,21,1.00,NULL,NULL,NULL),(340,'奶粉',NULL,1,338,2,'338|340',NULL,1,3,100.00,NULL,NULL,NULL),(341,'营养辅食',NULL,2,338,2,'338|341',NULL,1,3,100.00,NULL,NULL,NULL),(342,'品立',NULL,2,320,3,'312|320|342',NULL,0,21,2.00,NULL,NULL,NULL),(343,'花笙记',NULL,3,320,3,'312|320|343',NULL,0,21,3.00,NULL,NULL,NULL),(344,'尿裤湿巾',NULL,3,338,2,'338|344',NULL,1,3,100.00,NULL,NULL,NULL),(345,'洗护用品',NULL,4,338,2,'338|345',NULL,1,3,100.00,NULL,NULL,NULL),(346,'劲霸',NULL,1,322,3,'312|322|346',NULL,0,21,2.00,NULL,NULL,NULL),(347,'喂养用品',NULL,5,338,2,'338|347',NULL,1,3,100.00,NULL,NULL,NULL),(348,'海澜之家',NULL,2,322,3,'312|322|348',NULL,0,21,2.00,NULL,NULL,NULL),(349,'婴幼奶粉',NULL,1,340,3,'338|340|349',NULL,0,36,1.00,NULL,NULL,NULL),(350,'马克华菲',NULL,3,322,3,'312|322|350',NULL,0,21,2.00,NULL,NULL,NULL),(351,'成人奶粉',NULL,2,340,3,'338|340|351',NULL,0,36,1.00,NULL,NULL,NULL),(352,'女装',NULL,19,0,1,'352',NULL,1,20,0.00,NULL,NULL,NULL),(353,'最热推荐',NULL,1,352,2,'352|353',NULL,1,1,100.00,NULL,NULL,NULL),(354,'DHA',NULL,1,341,3,'338|341|354',NULL,0,36,1.00,NULL,NULL,NULL),(355,'热门类目',NULL,2,352,2,'352|355',NULL,1,1,100.00,NULL,NULL,NULL),(356,'大牌精选',NULL,3,352,2,'352|356',NULL,1,1,100.00,NULL,NULL,NULL),(357,'哥弟针织衫',NULL,1,353,3,'352|353|357',NULL,0,20,1.00,NULL,NULL,NULL),(358,'钙铁锌',NULL,2,341,3,'338|341|358',NULL,0,36,1.00,NULL,NULL,NULL),(359,'益生菌',NULL,3,341,3,'338|341|359',NULL,0,36,1.00,NULL,NULL,NULL),(360,'冬季连衣裙',NULL,2,353,3,'352|353|360',NULL,0,20,3.00,NULL,NULL,NULL),(361,'加绒裤',NULL,3,353,3,'352|353|361',NULL,0,20,3.00,NULL,NULL,NULL),(362,'宝宝零食',NULL,4,341,3,'338|341|362',NULL,0,36,1.00,NULL,NULL,NULL),(363,'果汁',NULL,5,341,3,'338|341|363',NULL,0,36,1.00,NULL,NULL,NULL),(364,'新品连衣裙',NULL,1,355,3,'352|355|364',NULL,0,20,2.00,NULL,NULL,NULL),(367,'婴儿尿裤',NULL,1,344,3,'338|344|367',NULL,0,36,1.00,NULL,NULL,NULL),(368,'针织衫',NULL,2,355,3,'352|355|368',NULL,0,20,1.00,NULL,NULL,NULL),(369,'拉拉裤',NULL,2,344,3,'338|344|369',NULL,0,36,1.00,NULL,NULL,NULL),(370,'毛呢大衣',NULL,3,355,3,'352|355|370',NULL,0,20,2.00,NULL,NULL,NULL),(371,'成人尿裤',NULL,3,344,3,'338|344|371',NULL,0,36,1.00,NULL,NULL,NULL),(372,'湿巾',NULL,4,344,3,'338|344|372',NULL,0,36,1.00,NULL,NULL,NULL),(373,'鄂尔多斯',NULL,1,356,3,'352|356|373',NULL,0,20,3.00,NULL,NULL,NULL),(374,'欧时力',NULL,2,356,3,'352|356|374',NULL,0,20,2.00,NULL,NULL,NULL),(375,'宝宝护肤',NULL,1,345,3,'338|345|375',NULL,0,36,1.00,NULL,NULL,NULL),(376,'ONLY',NULL,3,356,3,'352|356|376',NULL,0,20,2.00,NULL,NULL,NULL),(377,'宝宝洗浴',NULL,2,345,3,'338|345|377',NULL,0,36,1.00,NULL,NULL,NULL),(378,'内衣',NULL,20,0,1,'378',NULL,1,1,0.00,NULL,NULL,NULL),(379,'洗衣液',NULL,3,345,3,'338|345|379',NULL,0,36,1.00,NULL,NULL,NULL),(380,'当季流行',NULL,1,378,2,'378|380',NULL,1,1,100.00,NULL,NULL,NULL),(381,'热门分类',NULL,2,378,2,'378|381',NULL,1,1,100.00,NULL,NULL,NULL),(382,'热门品牌',NULL,3,378,2,'378|382',NULL,1,1,100.00,NULL,NULL,NULL),(383,'理发器',NULL,4,345,3,'338|345|383',NULL,0,36,1.00,NULL,NULL,NULL),(384,'保暖速递',NULL,1,380,3,'378|380|384',NULL,0,1,1.00,NULL,NULL,NULL),(385,'聚拢文胸',NULL,2,380,3,'378|380|385',NULL,0,1,2.00,NULL,NULL,NULL),(386,'奶瓶清洗',NULL,5,345,3,'338|345|386',NULL,0,36,1.00,NULL,NULL,NULL),(387,'纯棉睡衣',NULL,3,380,3,'378|380|387',NULL,0,1,2.00,NULL,NULL,NULL),(388,'奶瓶奶嘴',NULL,1,347,3,'338|347|388',NULL,0,36,1.00,NULL,NULL,NULL),(389,'保暖内衣',NULL,1,381,3,'378|381|389',NULL,0,1,2.00,NULL,NULL,NULL),(390,'吸奶器',NULL,2,347,3,'338|347|390',NULL,0,36,1.00,NULL,NULL,NULL),(391,'文胸',NULL,2,381,3,'378|381|391',NULL,0,1,3.00,NULL,NULL,NULL),(392,'打底裤袜',NULL,3,381,3,'378|381|392',NULL,0,1,3.00,NULL,NULL,NULL),(393,'牙胶安抚',NULL,3,347,3,'338|347|393',NULL,0,36,1.00,NULL,NULL,NULL),(394,'暖奶消毒',NULL,4,347,3,'338|347|394',NULL,0,36,1.00,NULL,NULL,NULL),(395,'爱慕',NULL,1,382,3,'378|382|395',NULL,0,1,2.00,NULL,NULL,NULL),(396,'水壶',NULL,5,347,3,'338|347|396',NULL,0,36,1.00,NULL,NULL,NULL),(397,'华歌尔',NULL,2,382,3,'378|382|397',NULL,0,1,2.00,NULL,NULL,NULL),(398,'曼妮芬',NULL,3,382,3,'378|382|398',NULL,0,1,3.00,NULL,NULL,NULL),(399,'玩具乐器',NULL,21,0,1,'399',NULL,1,37,0.00,NULL,NULL,NULL),(400,'古今',NULL,4,382,3,'378|382|400',NULL,0,1,2.00,NULL,NULL,NULL),(403,'珠宝',NULL,22,0,1,'403',NULL,1,29,0.00,NULL,NULL,NULL),(405,'时尚饰品',NULL,1,403,2,'403|405',NULL,1,1,100.00,NULL,NULL,NULL),(406,'玩具乐器',NULL,4,399,2,'399|406',NULL,1,3,100.00,NULL,NULL,NULL),(407,'纯金饰品',NULL,2,403,2,'403|407',NULL,1,1,100.00,NULL,NULL,NULL),(408,'金银投资',NULL,3,403,2,'403|408',NULL,1,1,100.00,NULL,NULL,NULL),(409,'钻石',NULL,4,403,2,'403|409',NULL,1,1,100.00,NULL,NULL,NULL),(410,'翡翠玉石',NULL,5,403,2,'403|410',NULL,1,1,100.00,NULL,NULL,NULL),(411,'适用年龄',NULL,1,406,3,'399|406|411',NULL,0,37,1.00,NULL,NULL,NULL),(412,'毛绒布艺',NULL,2,406,3,'399|406|412',NULL,0,37,1.00,NULL,NULL,NULL),(413,'娃娃玩具',NULL,3,406,3,'399|406|413',NULL,0,37,1.00,NULL,NULL,NULL),(414,'项链',NULL,1,405,3,'403|405|414',NULL,0,29,2.00,NULL,NULL,NULL),(415,'动漫玩具',NULL,4,406,3,'399|406|415',NULL,0,37,1.00,NULL,NULL,NULL),(416,'益智玩具',NULL,5,406,3,'399|406|416',NULL,0,37,1.00,NULL,NULL,NULL),(417,' 戒指',NULL,2,405,3,'403|405|417',NULL,0,30,2.00,NULL,NULL,NULL),(418,'整车',NULL,23,0,1,'418',NULL,1,33,0.00,NULL,NULL,NULL),(419,' 耳饰',NULL,3,405,3,'403|405|419',NULL,0,29,2.00,NULL,NULL,NULL),(420,'全新整车',NULL,1,418,2,'418|420',NULL,1,3,100.00,NULL,NULL,NULL),(421,'耳饰',NULL,1,407,3,'403|407|421',NULL,0,29,2.00,NULL,NULL,NULL),(422,'小型车',NULL,1,420,3,'418|420|422',NULL,0,33,1.00,NULL,NULL,NULL),(423,'戒指',NULL,2,407,3,'403|407|423',NULL,0,29,3.00,NULL,NULL,NULL),(424,'紧凑型车',NULL,2,420,3,'418|420|424',NULL,0,33,1.00,NULL,NULL,NULL),(425,'中型车',NULL,3,420,3,'418|420|425',NULL,0,33,1.00,NULL,NULL,NULL),(426,'吊坠',NULL,3,407,3,'403|407|426',NULL,0,29,2.00,NULL,NULL,NULL),(427,'豪华车',NULL,4,420,3,'418|420|427',NULL,0,33,1.00,NULL,NULL,NULL),(428,'SUV',NULL,5,420,3,'418|420|428',NULL,0,33,1.00,NULL,NULL,NULL),(429,'工艺金',NULL,1,408,3,'403|408|429',NULL,0,29,1.00,NULL,NULL,NULL),(430,'工艺银',NULL,2,408,3,'403|408|430',NULL,0,29,1.00,NULL,NULL,NULL),(431,'汽车用品',NULL,24,0,1,'431',NULL,1,35,0.00,NULL,NULL,NULL),(432,'维修保养',NULL,1,431,2,'431|432',NULL,1,3,100.00,NULL,NULL,NULL),(433,'车载电器',NULL,2,431,2,'431|433',NULL,1,3,100.00,NULL,NULL,NULL),(434,'裸钻',NULL,1,409,3,'403|409|434',NULL,0,29,1.00,NULL,NULL,NULL),(435,'美容清洗',NULL,3,431,2,'431|435',NULL,1,3,100.00,NULL,NULL,NULL),(436,'戒指',NULL,2,409,3,'403|409|436',NULL,0,29,2.00,NULL,NULL,NULL),(437,'汽车装饰',NULL,4,431,2,'431|437',NULL,1,3,100.00,NULL,NULL,NULL),(438,'安全自驾',NULL,5,431,2,'431|438',NULL,1,3,100.00,NULL,NULL,NULL),(439,'手镯',NULL,3,409,3,'403|409|439',NULL,0,29,2.00,NULL,NULL,NULL),(440,'润滑剂',NULL,1,432,3,'431|432|440',NULL,0,35,1.00,NULL,NULL,NULL),(441,'添加剂',NULL,2,432,3,'431|432|441',NULL,0,35,1.00,NULL,NULL,NULL),(442,'手串',NULL,1,410,3,'403|410|442',NULL,0,29,1.00,NULL,NULL,NULL),(443,'防冻液',NULL,3,432,3,'431|432|443',NULL,0,35,1.00,NULL,NULL,NULL),(444,'高值收藏',NULL,2,410,3,'403|410|444',NULL,0,29,3.00,NULL,NULL,NULL),(445,'滤清器',NULL,4,432,3,'431|432|445',NULL,0,35,1.00,NULL,NULL,NULL),(446,'项链',NULL,3,410,3,'403|410|446',NULL,0,29,4.00,NULL,NULL,NULL),(447,'火花塞',NULL,5,432,3,'431|432|447',NULL,0,35,1.00,NULL,NULL,NULL),(448,'个户化妆',NULL,25,0,1,'448',NULL,1,9,0.00,NULL,NULL,NULL),(449,'导航仪',NULL,1,433,3,'431|433|449',NULL,0,35,1.00,NULL,NULL,NULL),(450,'面部护理',NULL,1,448,2,'448|450',NULL,1,1,100.00,NULL,NULL,NULL),(451,'安全预警仪',NULL,2,433,3,'431|433|451',NULL,0,35,1.00,NULL,NULL,NULL),(452,'身体护理',NULL,2,448,2,'448|452',NULL,1,1,100.00,NULL,NULL,NULL),(453,'行车记录仪',NULL,3,433,3,'431|433|453',NULL,0,35,1.00,NULL,NULL,NULL),(454,'洗发护发',NULL,3,448,2,'448|454',NULL,1,1,100.00,NULL,NULL,NULL),(455,'倒车雷达',NULL,4,433,3,'431|433|455',NULL,0,35,1.00,NULL,NULL,NULL),(456,'口腔护理',NULL,4,448,2,'448|456',NULL,1,1,100.00,NULL,NULL,NULL),(457,'净化器',NULL,5,433,3,'431|433|457',NULL,0,35,1.00,NULL,NULL,NULL),(458,'女性护理',NULL,5,448,2,'448|458',NULL,1,1,100.00,NULL,NULL,NULL),(459,'车蜡',NULL,1,435,3,'431|435|459',NULL,0,35,1.00,NULL,NULL,NULL),(460,'护肤',NULL,1,450,3,'448|450|460',NULL,0,9,1.00,NULL,NULL,NULL),(461,'补漆笔',NULL,2,435,3,'431|435|461',NULL,0,35,1.00,NULL,NULL,NULL),(462,'面膜',NULL,2,450,3,'448|450|462',NULL,0,9,2.00,NULL,NULL,NULL),(463,'清洁',NULL,3,450,3,'448|450|463',NULL,0,9,2.00,NULL,NULL,NULL),(464,'玻璃水',NULL,3,435,3,'431|435|464',NULL,0,3,1.00,NULL,NULL,NULL),(465,'清洁剂',NULL,4,435,3,'431|435|465',NULL,0,3,1.00,NULL,NULL,NULL),(466,'沐浴',NULL,1,452,3,'448|452|466',NULL,0,9,2.00,NULL,NULL,NULL),(467,'洗车工具',NULL,5,435,3,'431|435|467',NULL,0,3,1.00,NULL,NULL,NULL),(468,'润肤',NULL,2,452,3,'448|452|468',NULL,0,9,2.00,NULL,NULL,NULL),(469,'脚垫',NULL,1,437,3,'431|437|469',NULL,0,3,1.00,NULL,NULL,NULL),(470,'坐垫',NULL,2,437,3,'431|437|470',NULL,0,3,1.00,NULL,NULL,NULL),(471,'手足',NULL,3,452,3,'448|452|471',NULL,0,9,2.00,NULL,NULL,NULL),(472,'洗发',NULL,1,454,3,'448|454|472',NULL,0,9,2.00,NULL,NULL,NULL),(473,'护发',NULL,2,454,3,'448|454|473',NULL,0,9,3.00,NULL,NULL,NULL),(474,'染发',NULL,3,454,3,'448|454|474',NULL,0,9,3.00,NULL,NULL,NULL),(475,'牙刷',NULL,1,456,3,'448|456|475',NULL,0,9,2.00,NULL,NULL,NULL),(476,'后备箱垫',NULL,3,437,3,'431|437|476',NULL,0,35,1.00,NULL,NULL,NULL),(477,'牙膏',NULL,2,456,3,'448|456|477',NULL,0,9,3.00,NULL,NULL,NULL),(478,'漱口水',NULL,3,456,3,'448|456|478',NULL,0,9,2.00,NULL,NULL,NULL),(479,'香水',NULL,4,437,3,'431|437|479',NULL,0,35,1.00,NULL,NULL,NULL),(480,'卫生棉',NULL,1,458,3,'448|458|480',NULL,0,9,2.00,NULL,NULL,NULL),(481,'护垫',NULL,2,458,3,'448|458|481',NULL,0,9,3.00,NULL,NULL,NULL),(482,'车内饰品',NULL,5,437,3,'431|437|482',NULL,0,35,1.00,NULL,NULL,NULL),(483,'私密护理',NULL,3,458,3,'448|458|483',NULL,0,9,2.00,NULL,NULL,NULL),(484,'安全座椅',NULL,1,438,3,'431|438|484',NULL,0,35,1.00,NULL,NULL,NULL),(485,'鞋靴',NULL,26,0,1,'485',NULL,1,17,0.00,NULL,NULL,NULL),(486,'时尚女鞋',NULL,1,485,2,'485|486',NULL,1,1,100.00,NULL,NULL,NULL),(487,'流行男鞋',NULL,2,485,2,'485|487',NULL,1,1,100.00,NULL,NULL,NULL),(488,'充气泵',NULL,2,438,3,'431|438|488',NULL,0,35,1.00,NULL,NULL,NULL),(489,'防盗设备',NULL,3,438,3,'431|438|489',NULL,0,35,1.00,NULL,NULL,NULL),(490,'雪地靴',NULL,1,486,3,'485|486|490',NULL,0,17,2.00,NULL,NULL,NULL),(491,'长筒靴',NULL,2,486,3,'485|486|491',NULL,0,17,3.00,NULL,NULL,NULL),(492,'储物箱',NULL,4,438,3,'431|438|492',NULL,0,35,1.00,NULL,NULL,NULL),(494,'单鞋',NULL,3,486,3,'485|486|494',NULL,0,17,3.00,NULL,NULL,NULL),(495,'自驾野营',NULL,6,438,3,'431|438|495',NULL,0,35,1.00,NULL,NULL,NULL),(496,'短靴',NULL,4,486,3,'485|486|496',NULL,0,17,2.00,NULL,NULL,NULL),(497,'休闲鞋',NULL,1,487,3,'485|487|497',NULL,0,17,2.00,NULL,NULL,NULL),(498,'板鞋',NULL,2,487,3,'485|487|498',NULL,0,17,3.00,NULL,NULL,NULL),(499,'正装鞋',NULL,3,487,3,'485|487|499',NULL,0,17,2.00,NULL,NULL,NULL),(500,'箱包',NULL,27,0,1,'500',NULL,1,16,0.00,NULL,NULL,NULL),(501,'潮流女包',NULL,1,500,2,'500|501',NULL,1,1,100.00,NULL,NULL,NULL),(502,'精品男包',NULL,2,500,2,'500|502',NULL,1,1,100.00,NULL,NULL,NULL),(503,'功能箱包',NULL,3,500,2,'500|503',NULL,1,1,100.00,NULL,NULL,NULL),(504,'礼品',NULL,4,500,2,'500|504',NULL,1,1,100.00,NULL,NULL,NULL),(505,'钱包',NULL,1,501,3,'500|501|505',NULL,0,16,2.00,NULL,NULL,NULL),(506,'手拿包',NULL,2,501,3,'500|501|506',NULL,0,16,3.00,NULL,NULL,NULL),(507,'单肩包',NULL,3,501,3,'500|501|507',NULL,0,16,3.00,NULL,NULL,NULL),(508,'双肩包',NULL,4,501,3,'500|501|508',NULL,0,16,3.00,NULL,NULL,NULL),(509,'商务公文包',NULL,1,502,3,'500|502|509',NULL,0,16,2.00,NULL,NULL,NULL),(510,'单肩包',NULL,2,502,3,'500|502|510',NULL,0,16,2.00,NULL,NULL,NULL),(511,'斜挎包',NULL,3,502,3,'500|502|511',NULL,0,16,3.00,NULL,NULL,NULL),(512,'拉杆箱/包',NULL,1,503,3,'500|503|512',NULL,0,16,2.00,NULL,NULL,NULL),(513,'电脑包',NULL,2,503,3,'500|503|513',NULL,0,16,2.00,NULL,NULL,NULL),(514,'休闲运动包',NULL,3,503,3,'500|503|514',NULL,0,16,2.00,NULL,NULL,NULL),(515,'旅行包',NULL,4,503,3,'500|503|515',NULL,0,16,3.00,NULL,NULL,NULL),(516,'工艺礼品',NULL,1,504,3,'500|504|516',NULL,0,16,2.00,NULL,NULL,NULL),(517,'火机烟具',NULL,2,504,3,'500|504|517',NULL,0,16,2.00,NULL,NULL,NULL),(518,'礼品文具',NULL,3,504,3,'500|504|518',NULL,0,16,2.00,NULL,NULL,NULL),(519,'军刀军具',NULL,4,504,3,'500|504|519',NULL,0,16,3.00,NULL,NULL,NULL),(520,'钟表',NULL,28,0,1,'520',NULL,1,30,0.00,NULL,NULL,NULL),(521,'男表',NULL,1,520,2,'520|521',NULL,0,1,100.00,NULL,NULL,NULL),(522,'女表',NULL,2,520,2,'520|522',NULL,0,1,100.00,NULL,NULL,NULL),(523,'儿童表',NULL,3,520,2,'520|523',NULL,0,1,100.00,NULL,NULL,NULL),(524,'座钟挂钟',NULL,4,520,2,'520|524',NULL,0,1,100.00,NULL,NULL,NULL),(525,'奢侈品',NULL,29,0,1,'525',NULL,1,31,0.00,NULL,NULL,NULL),(526,'箱包',NULL,1,525,2,'525|526',NULL,1,1,100.00,NULL,NULL,NULL),(527,'钱包',NULL,2,525,2,'525|527',NULL,1,1,100.00,NULL,NULL,NULL),(528,'服饰',NULL,3,525,2,'525|528',NULL,1,1,100.00,NULL,NULL,NULL),(529,'腰带',NULL,4,525,2,'525|529',NULL,1,1,100.00,NULL,NULL,NULL),(530,'鞋靴',NULL,5,525,2,'525|530',NULL,1,1,100.00,NULL,NULL,NULL),(531,'COACH',NULL,1,526,3,'525|526|531',NULL,0,31,2.00,NULL,NULL,NULL),(532,'MCM',NULL,2,526,3,'525|526|532',NULL,0,31,2.00,NULL,NULL,NULL),(533,'古驰',NULL,3,526,3,'525|526|533',NULL,0,31,2.00,NULL,NULL,NULL),(534,'普拉达',NULL,1,527,3,'525|527|534',NULL,0,31,2.00,NULL,NULL,NULL),(535,'巴宝莉',NULL,2,527,3,'525|527|535',NULL,0,31,2.00,NULL,NULL,NULL),(536,'兰姿',NULL,3,527,3,'525|527|536',NULL,0,31,2.00,NULL,NULL,NULL),(537,'迪赛',NULL,1,528,3,'525|528|537',NULL,0,31,2.00,NULL,NULL,NULL),(538,'芬迪',NULL,2,528,3,'525|528|538',NULL,0,31,2.00,NULL,NULL,NULL),(539,'杰尼亚',NULL,3,528,3,'525|528|539',NULL,0,31,2.00,NULL,NULL,NULL),(540,'巴宝莉',NULL,1,529,3,'525|529|540',NULL,0,31,2.00,NULL,NULL,NULL),(541,'蔻驰',NULL,2,529,3,'525|529|541',NULL,0,31,3.00,NULL,NULL,NULL),(542,'阿玛尼',NULL,3,529,3,'525|529|542',NULL,0,31,3.00,NULL,NULL,NULL),(544,'巴利',NULL,1,530,3,'525|530|544',NULL,0,31,3.00,NULL,NULL,NULL),(545,'托德斯',NULL,2,530,3,'525|530|545',NULL,0,31,3.00,NULL,NULL,NULL),(546,'运动户外',NULL,30,0,1,'546',NULL,1,32,0.00,NULL,NULL,NULL),(547,'运动鞋包',NULL,1,546,2,'546|547',NULL,1,1,100.00,NULL,NULL,NULL),(548,'运动服饰',NULL,2,546,2,'546|548',NULL,1,1,100.00,NULL,NULL,NULL),(549,'健身训练',NULL,3,546,2,'546|549',NULL,1,1,100.00,NULL,NULL,NULL),(550,'骑行运动',NULL,4,546,2,'546|550',NULL,1,1,100.00,NULL,NULL,NULL),(551,'体育用品',NULL,5,546,2,'546|551',NULL,1,1,100.00,NULL,NULL,NULL),(552,'跑步鞋',NULL,1,547,3,'546|547|552',NULL,0,32,2.00,NULL,NULL,NULL),(553,'篮球鞋',NULL,2,547,3,'546|547|553',NULL,0,32,2.00,NULL,NULL,NULL),(554,' 休闲鞋',NULL,3,547,3,'546|547|554',NULL,0,32,3.00,NULL,NULL,NULL),(555,'卫衣套头衫',NULL,1,548,3,'546|548|555',NULL,0,32,2.00,NULL,NULL,NULL),(556,'套装',NULL,2,548,3,'546|548|556',NULL,0,32,2.00,NULL,NULL,NULL),(557,'夹克/风衣',NULL,3,548,3,'546|548|557',NULL,0,32,2.00,NULL,NULL,NULL),(558,'甩脂机',NULL,1,549,3,'546|549|558',NULL,0,32,2.00,NULL,NULL,NULL),(559,'健身器械',NULL,2,549,3,'546|549|559',NULL,0,32,2.00,NULL,NULL,NULL),(560,'家用跑步机',NULL,3,549,3,'546|549|560',NULL,0,32,3.00,NULL,NULL,NULL),(561,'平衡车',NULL,1,550,3,'546|550|561',NULL,0,32,2.00,NULL,NULL,NULL),(562,'折叠车',NULL,2,550,3,'546|550|562',NULL,0,32,2.00,NULL,NULL,NULL),(563,'挡风被',NULL,3,550,3,'546|550|563',NULL,0,32,3.00,NULL,NULL,NULL),(564,'自营篮球',NULL,1,551,3,'546|551|564',NULL,0,32,2.00,NULL,NULL,NULL),(566,'羽毛球拍',NULL,3,551,3,'546|551|566',NULL,0,32,3.00,NULL,NULL,NULL),(567,'水果',NULL,3,309,2,'309|567',NULL,1,40,100.00,NULL,NULL,NULL),(568,'进口水果',NULL,1,567,3,'309|567|568',NULL,0,40,2.00,NULL,NULL,NULL),(569,'国内水果',NULL,2,567,3,'309|567|569',NULL,0,40,3.00,NULL,NULL,NULL),(570,'测试',NULL,4,75,3,'1|75|570',NULL,0,6,4.00,NULL,NULL,NULL),(571,'ceshi',NULL,3,567,3,'309|567|571',NULL,0,1,0.10,NULL,NULL,NULL),(572,'医药用品',NULL,31,0,1,'572',NULL,0,1,100.00,NULL,NULL,NULL),(573,'药丸',NULL,1,572,2,'572|573',NULL,0,1,100.00,NULL,NULL,NULL),(574,'测试新加',NULL,32,0,1,'574',NULL,0,1,100.00,'大','在','在'),(575,'酒店','/Storage/Plat/Category/201510121539581922800.png',34,0,1,'575',NULL,0,73,100.00,'酒店',NULL,NULL),(576,'宾馆',NULL,1,575,2,'575|576',NULL,0,73,100.00,NULL,NULL,NULL),(577,'旅馆',NULL,1,576,3,'575|576|577',NULL,0,73,20.00,NULL,NULL,NULL),(578,'第三方',NULL,6,312,2,'312|578',NULL,0,1,100.00,NULL,NULL,NULL),(579,'机械',NULL,34,0,1,'579',NULL,0,74,100.00,NULL,NULL,NULL),(580,'易损件',NULL,1,579,2,'579|580',NULL,0,74,100.00,NULL,NULL,NULL),(581,'螺丝',NULL,1,580,3,'579|580|581',NULL,0,74,3.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Himall_Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CategoryCashDeposit`
--

DROP TABLE IF EXISTS `Himall_CategoryCashDeposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CategoryCashDeposit` (
  `Id` bigint(20) DEFAULT NULL COMMENT '主键Id',
  `CategoryId` bigint(20) NOT NULL COMMENT '分类Id',
  `NeedPayCashDeposit` decimal(10,2) DEFAULT '0.00' COMMENT '需要缴纳保证金',
  `EnableNoReasonReturn` tinyint(1) DEFAULT '0' COMMENT '允许七天无理由退货',
  PRIMARY KEY (`CategoryId`),
  KEY `FK_Himall_CategoriesObligation_Categories` (`CategoryId`),
  CONSTRAINT `FK_Himall_CategoriesObligation_Categories` FOREIGN KEY (`CategoryId`) REFERENCES `Himall_Categories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CategoryCashDeposit`
--

LOCK TABLES `Himall_CategoryCashDeposit` WRITE;
/*!40000 ALTER TABLE `Himall_CategoryCashDeposit` DISABLE KEYS */;
INSERT INTO `Himall_CategoryCashDeposit` VALUES (32,1,0.00,1),(33,5,0.00,1),(34,9,0.00,1),(35,13,0.00,1),(36,17,0.00,1),(37,20,0.00,1),(38,23,0.00,0),(39,150,0.00,1),(40,152,0.00,1),(41,186,0.00,1),(42,224,0.00,1),(43,234,0.00,1),(44,264,0.00,1),(45,295,0.00,1),(46,309,0.00,1),(47,312,0.00,1),(48,338,0.00,1),(49,352,401.00,0),(50,378,0.00,1),(51,399,0.00,1),(52,403,10000.00,1),(53,418,10000.00,1),(54,431,0.00,1),(55,448,0.00,1),(56,485,0.00,1),(57,500,0.00,1),(58,520,0.00,1),(59,525,100000.00,1),(60,546,0.00,1),(61,572,10000.00,1),(0,574,0.00,0),(0,575,0.00,0),(0,579,0.00,1);
/*!40000 ALTER TABLE `Himall_CategoryCashDeposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ChargeDetail`
--

DROP TABLE IF EXISTS `Himall_ChargeDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ChargeDetail` (
  `Id` bigint(20) NOT NULL,
  `MemId` bigint(20) NOT NULL COMMENT '会员ID',
  `ChargeTime` datetime DEFAULT NULL COMMENT '充值时间',
  `ChargeAmount` decimal(18,2) NOT NULL COMMENT '充值金额',
  `ChargeWay` varchar(50) DEFAULT NULL COMMENT '充值方式',
  `ChargeStatus` int(11) NOT NULL COMMENT '充值状态',
  `CreateTime` datetime DEFAULT NULL COMMENT '提交充值时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ChargeDetail`
--

LOCK TABLES `Himall_ChargeDetail` WRITE;
/*!40000 ALTER TABLE `Himall_ChargeDetail` DISABLE KEYS */;
INSERT INTO `Himall_ChargeDetail` VALUES (15100918195225031,541,'2015-10-09 18:20:47',0.10,'微信扫码支付',2,'2015-10-09 18:19:52'),(15101015024426282,541,NULL,200.00,NULL,1,'2015-10-10 15:02:45'),(15101017351324206,568,NULL,1000.00,NULL,1,'2015-10-10 17:35:14'),(15101017353029607,568,NULL,0.01,NULL,1,'2015-10-10 17:35:30'),(15101017530421543,570,NULL,1000.00,NULL,1,'2015-10-10 17:53:04'),(15101116492229475,573,NULL,10.00,NULL,1,'2015-10-11 16:49:22'),(15101210202920629,577,NULL,200.00,NULL,1,'2015-10-12 10:20:29'),(15101309162126424,582,NULL,200.00,NULL,1,'2015-10-13 09:16:21'),(15101316590727079,589,NULL,10.00,NULL,1,'2015-10-13 16:59:08'),(15101317014822231,589,NULL,10.00,NULL,1,'2015-10-13 17:01:49'),(15101411215520903,593,'2015-10-14 11:22:23',1.00,'微信扫码支付',2,'2015-10-14 11:21:56'),(15101415542825421,541,NULL,300.00,NULL,1,'2015-10-14 15:54:28'),(15101417212626634,541,NULL,100.00,NULL,1,'2015-10-14 17:21:26');
/*!40000 ALTER TABLE `Himall_ChargeDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Collocation`
--

DROP TABLE IF EXISTS `Himall_Collocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Collocation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID自增',
  `Title` varchar(100) NOT NULL COMMENT '组合购标题',
  `StartTime` datetime NOT NULL COMMENT '开始日期',
  `EndTime` datetime NOT NULL COMMENT '结束日期',
  `ShortDesc` varchar(1000) DEFAULT NULL COMMENT '组合描述',
  `ShopId` bigint(20) NOT NULL COMMENT '组合购店铺ID',
  `CreateTime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Collocation`
--

LOCK TABLES `Himall_Collocation` WRITE;
/*!40000 ALTER TABLE `Himall_Collocation` DISABLE KEYS */;
INSERT INTO `Himall_Collocation` VALUES (60,'11组合购','2015-10-09 00:00:00','2015-10-25 00:00:00','',1,'2015-10-09 09:50:36'),(61,'12','2015-10-09 00:00:00','2015-10-16 00:00:00','2555',1,'2015-10-09 09:54:01'),(62,'组合购','2015-10-13 00:00:00','2015-10-22 00:00:00','',1,'2015-10-13 11:22:49'),(63,'测试活动','2015-10-13 00:00:00','2015-10-25 00:00:00','',1,'2015-10-13 17:51:29'),(64,'满10送1','2015-10-13 00:00:00','2015-10-31 00:00:00','',1,'2015-10-13 21:02:34');
/*!40000 ALTER TABLE `Himall_Collocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CollocationPoruducts`
--

DROP TABLE IF EXISTS `Himall_CollocationPoruducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CollocationPoruducts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID自增',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `ColloId` bigint(20) NOT NULL COMMENT '组合购ID',
  `IsMain` tinyint(1) NOT NULL COMMENT '是否主商品',
  `DisplaySequence` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `FK_Collocation_CollPoruducts` (`ColloId`),
  KEY `FK_Product_CollPoruducts` (`ProductId`),
  CONSTRAINT `FK_Collocation_CollPoruducts` FOREIGN KEY (`ColloId`) REFERENCES `Himall_Collocation` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Product_CollPoruducts` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CollocationPoruducts`
--

LOCK TABLES `Himall_CollocationPoruducts` WRITE;
/*!40000 ALTER TABLE `Himall_CollocationPoruducts` DISABLE KEYS */;
INSERT INTO `Himall_CollocationPoruducts` VALUES (563,230,61,1,0),(564,228,61,0,1),(565,229,61,0,2),(566,301,60,1,0),(567,228,60,0,1),(568,229,60,0,2),(569,230,60,0,3),(570,231,60,0,4),(571,232,60,0,5),(572,233,60,0,6),(573,303,62,1,0),(574,306,62,0,1),(575,309,63,1,0),(576,305,63,0,1),(577,302,64,1,0),(578,233,64,0,1),(579,301,64,0,2);
/*!40000 ALTER TABLE `Himall_CollocationPoruducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CollocationSkus`
--

DROP TABLE IF EXISTS `Himall_CollocationSkus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CollocationSkus` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID自增',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `SkuID` varchar(100) NOT NULL COMMENT '商品SkuId',
  `ColloProductId` bigint(20) NOT NULL COMMENT '组合商品表ID',
  `Price` decimal(18,2) NOT NULL COMMENT '组合购价格',
  `SkuPirce` decimal(18,2) DEFAULT NULL COMMENT '原始价格',
  PRIMARY KEY (`ID`),
  KEY `FK_Product_CollSkus` (`ProductId`),
  KEY `FK_ColloPoruducts_CollSkus` (`ColloProductId`),
  CONSTRAINT `FK_ColloProuducts_Skus` FOREIGN KEY (`ColloProductId`) REFERENCES `Himall_CollocationPoruducts` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Product_ColloSkus` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CollocationSkus`
--

LOCK TABLES `Himall_CollocationSkus` WRITE;
/*!40000 ALTER TABLE `Himall_CollocationSkus` DISABLE KEYS */;
INSERT INTO `Himall_CollocationSkus` VALUES (1119,230,'230_245_0_40',563,3499.00,3499.00),(1120,230,'230_245_0_41',563,3499.00,3499.00),(1121,230,'230_245_0_42',563,3499.00,3499.00),(1122,230,'230_65_0_40',563,3499.00,3499.00),(1123,230,'230_65_0_41',563,3499.00,3499.00),(1124,230,'230_65_0_42',563,3499.00,3499.00),(1125,230,'230_66_0_40',563,3499.00,3499.00),(1126,230,'230_66_0_41',563,3499.00,3499.00),(1127,230,'230_66_0_42',563,3499.00,3499.00),(1128,228,'228_71_0_70',564,1298.00,1298.00),(1129,228,'228_72_0_70',564,1298.00,1298.00),(1130,229,'229_71_0_68',565,1399.00,1399.00),(1131,229,'229_71_0_69',565,1399.00,1399.00),(1132,229,'229_71_0_70',565,1399.00,1399.00),(1133,229,'229_72_0_68',565,1399.00,1399.00),(1134,229,'229_72_0_69',565,1399.00,1399.00),(1135,229,'229_72_0_70',565,1399.00,1399.00),(1136,301,'301_0_0_0',566,80.00,100.00),(1137,228,'228_71_0_70',567,1298.00,1298.00),(1138,228,'228_72_0_70',567,1298.00,1298.00),(1139,229,'229_71_0_68',568,1399.00,1399.00),(1140,229,'229_71_0_69',568,1399.00,1399.00),(1141,229,'229_71_0_70',568,1399.00,1399.00),(1142,229,'229_72_0_68',568,1399.00,1399.00),(1143,229,'229_72_0_69',568,1399.00,1399.00),(1144,229,'229_72_0_70',568,1399.00,1399.00),(1145,230,'230_245_0_40',569,3499.00,3499.00),(1146,230,'230_245_0_41',569,3499.00,3499.00),(1147,230,'230_245_0_42',569,3499.00,3499.00),(1148,230,'230_65_0_40',569,3499.00,3499.00),(1149,230,'230_65_0_41',569,3499.00,3499.00),(1150,230,'230_65_0_42',569,3499.00,3499.00),(1151,230,'230_66_0_40',569,3499.00,3499.00),(1152,230,'230_66_0_41',569,3499.00,3499.00),(1153,230,'230_66_0_42',569,3499.00,3499.00),(1154,231,'231_245_0_40',570,566.00,566.00),(1155,231,'231_245_0_41',570,566.00,566.00),(1156,231,'231_245_0_42',570,566.00,566.00),(1157,231,'231_65_0_40',570,566.00,566.00),(1158,231,'231_65_0_41',570,566.00,566.00),(1159,231,'231_65_0_42',570,566.00,566.00),(1160,231,'231_66_0_40',570,566.00,566.00),(1161,231,'231_66_0_41',570,566.00,566.00),(1162,231,'231_66_0_42',570,566.00,566.00),(1163,231,'231_67_0_40',570,566.00,566.00),(1164,231,'231_67_0_41',570,566.00,566.00),(1165,231,'231_67_0_42',570,566.00,566.00),(1166,232,'232_87_0_100',571,8888.00,8888.00),(1167,232,'232_87_0_101',571,8888.00,8888.00),(1168,232,'232_87_0_99',571,8888.00,8888.00),(1169,232,'232_88_0_100',571,8888.00,8888.00),(1170,232,'232_88_0_101',571,8888.00,8888.00),(1171,232,'232_88_0_99',571,8888.00,8888.00),(1172,232,'232_90_0_100',571,8888.00,8888.00),(1173,232,'232_90_0_101',571,8888.00,8888.00),(1174,232,'232_90_0_99',571,8888.00,8888.00),(1175,232,'232_91_0_100',571,8888.00,8888.00),(1176,232,'232_91_0_101',571,8888.00,8888.00),(1177,232,'232_91_0_99',571,8888.00,8888.00),(1178,232,'232_93_0_100',571,8888.00,8888.00),(1179,232,'232_93_0_101',571,8888.00,8888.00),(1180,232,'232_93_0_99',571,8888.00,8888.00),(1181,232,'232_95_0_100',571,8888.00,8888.00),(1182,232,'232_95_0_101',571,8888.00,8888.00),(1183,232,'232_95_0_99',571,8888.00,8888.00),(1184,233,'233_115_0_0',572,168.00,168.00),(1185,233,'233_116_0_0',572,168.00,168.00),(1186,233,'233_117_0_0',572,168.00,168.00),(1187,233,'233_119_0_0',572,168.00,168.00),(1188,233,'233_120_0_0',572,168.00,168.00),(1189,233,'233_121_0_0',572,168.00,168.00),(1190,233,'233_122_0_0',572,168.00,168.00),(1191,233,'233_124_0_0',572,168.00,168.00),(1192,233,'233_126_0_0',572,168.00,168.00),(1193,303,'303_0_0_0',573,122.00,122.00),(1194,306,'306_0_0_668',574,100.00,100.00),(1195,306,'306_0_0_669',574,200.00,200.00),(1196,309,'309_0_0_0',575,99.00,100.00),(1197,305,'305_0_0_0',576,99.00,100.00),(1198,302,'302_66_0_40',577,0.01,0.01),(1199,302,'302_66_0_42',577,0.01,0.01),(1200,302,'302_66_0_41',577,0.01,0.01),(1201,302,'302_245_0_40',577,0.01,0.01),(1202,302,'302_245_0_42',577,0.01,0.01),(1203,302,'302_245_0_41',577,0.01,0.01),(1204,233,'233_115_0_0',578,168.00,168.00),(1205,233,'233_116_0_0',578,168.00,168.00),(1206,233,'233_117_0_0',578,168.00,168.00),(1207,233,'233_119_0_0',578,168.00,168.00),(1208,233,'233_120_0_0',578,168.00,168.00),(1209,233,'233_121_0_0',578,168.00,168.00),(1210,233,'233_122_0_0',578,168.00,168.00),(1211,233,'233_124_0_0',578,168.00,168.00),(1212,233,'233_126_0_0',578,168.00,168.00),(1213,301,'301_0_0_0',579,100.00,100.00);
/*!40000 ALTER TABLE `Himall_CollocationSkus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Coupon`
--

DROP TABLE IF EXISTS `Himall_Coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Coupon` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `Price` decimal(18,0) NOT NULL COMMENT '价格',
  `PerMax` int(11) NOT NULL COMMENT '最大可领取张数',
  `OrderAmount` decimal(18,0) NOT NULL COMMENT '订单金额（满足多少钱才能使用）',
  `Num` int(11) NOT NULL COMMENT '发行张数',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL,
  `CouponName` varchar(100) NOT NULL COMMENT '优惠券名称',
  `CreateTime` datetime NOT NULL,
  `ReceiveType` int(11) NOT NULL DEFAULT '0' COMMENT '领取方式 0 店铺首页 1 积分兑换 2 主动发放',
  `NeedIntegral` int(11) NOT NULL COMMENT '所需积分',
  `EndIntegralExchange` datetime DEFAULT NULL COMMENT '兑换截止时间',
  `IntegralCover` varchar(200) DEFAULT NULL COMMENT '积分商城封面',
  `IsSyncWeiXin` int(11) NOT NULL DEFAULT '0' COMMENT '是否同步到微信',
  `WXAuditStatus` int(11) NOT NULL DEFAULT '0' COMMENT '微信状态',
  `CardLogId` bigint(20) DEFAULT NULL COMMENT '微信卡券记录号 与微信卡券记录关联',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Coupon_Himall_Shops` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_coupon_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='商城优惠券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Coupon`
--

LOCK TABLES `Himall_Coupon` WRITE;
/*!40000 ALTER TABLE `Himall_Coupon` DISABLE KEYS */;
INSERT INTO `Himall_Coupon` VALUES (22,210,'扣扣电脑城',10,0,0,10000,'2015-07-01 00:00:00','2015-07-09 00:00:00','满100使用71','2015-06-30 19:25:36',0,0,NULL,NULL,0,0,NULL),(23,210,'扣扣电脑城',999,3,1000,100000,'2015-06-30 00:00:00','2015-07-13 00:00:00','999','2015-06-30 19:26:17',0,0,NULL,NULL,0,0,NULL),(29,210,'扣扣电脑城',100,0,200,10000,'2015-07-01 00:00:00','2015-07-13 00:00:00','100','2015-07-01 11:17:06',0,0,NULL,NULL,0,0,NULL),(54,215,'糖糖的店铺',20,0,200,20,'2015-07-20 00:00:00','2016-06-01 00:00:00','年中大促','2015-07-20 10:56:23',0,0,NULL,NULL,0,0,NULL),(55,215,'糖糖的店铺',100,0,500,20,'2015-07-20 00:00:00','2015-07-31 00:00:00','满500减100','2015-07-20 10:56:52',0,0,NULL,NULL,0,0,NULL),(56,215,'糖糖的店铺',200,0,800,50,'2015-07-20 00:00:00','2015-08-27 00:00:00','满800减200','2015-07-20 10:57:27',0,0,NULL,NULL,0,0,NULL),(145,1,'官方自营店',50,0,200,110,'2015-10-09 00:00:00','2015-10-16 00:00:00','年末促销','2015-10-09 14:19:35',0,0,NULL,NULL,1,1,41),(146,233,'123',15,0,100,200,'2015-10-10 00:00:00','2016-01-17 00:00:00','aa123','2015-10-10 15:31:20',1,10,'2016-01-17 11:55:12','/Storage/Shop/233/Coupon/146.jpg',0,1,NULL),(147,232,'zara专卖',5,0,0,1000,'2015-10-10 00:00:00','2016-06-26 00:00:00','zara11','2015-10-10 15:32:50',1,10,'2016-01-02 03:15:55','/Storage/Shop/232/Coupon/147.jpg',0,1,NULL),(148,235,'Life Style',50,0,200,3000,'2015-10-10 00:00:00','2016-05-22 00:00:00','Adidas长沙旗舰','2015-10-10 15:39:01',1,10,'2016-04-23 15:55:12','/Storage/Shop/235/Coupon/148.jpg',0,1,NULL),(149,236,'fex电子数码芙蓉店',1,0,0,1000,'2015-10-10 00:00:00','2015-10-30 00:00:00','123123','2015-10-10 15:48:48',1,10,'2015-10-27 23:55:14','/Storage/Shop/236/Coupon/149.jpg',0,1,NULL),(150,237,'西城电子',100,1,0,1000,'2015-10-10 00:00:00','2015-11-10 00:00:00','123123','2015-10-10 15:54:03',1,10,'2015-11-08 15:55:30','/Storage/Shop/237/Coupon/150.jpg',0,1,NULL),(151,238,'步走寻常路',50,2,50,1000,'2015-10-10 00:00:00','2016-01-16 00:00:00','1231','2015-10-10 16:01:12',1,10,'2016-01-16 16:15:19','/Storage/Shop/238/Coupon/151.jpg',0,1,NULL),(152,1,'官方自营店',20,1,100,10,'2015-10-13 00:00:00','2015-12-02 00:00:00','优惠券','2015-10-13 12:23:56',0,0,NULL,NULL,0,1,NULL),(153,1,'官方自营店',10,2,0,20,'2015-10-13 00:00:00','2015-11-21 00:00:00','测试活动','2015-10-13 13:39:43',0,0,NULL,NULL,0,1,NULL),(154,1,'官方自营店',10,1,0,10,'2015-10-13 00:00:00','2015-11-20 00:00:00','测试活动01','2015-10-13 14:19:33',1,10,'2015-10-28 14:15:59',NULL,0,1,NULL),(155,1,'官方自营店',10,1,0,10,'2015-10-13 00:00:00','2015-11-30 00:00:00','满10减10','2015-10-13 20:55:14',2,0,NULL,NULL,0,1,NULL),(156,247,'数码旗舰店',10,5,11,100,'2015-10-14 00:00:00','2015-11-14 00:00:00','双11大促','2015-10-14 11:03:16',0,0,NULL,NULL,0,1,NULL);
/*!40000 ALTER TABLE `Himall_Coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CouponRecord`
--

DROP TABLE IF EXISTS `Himall_CouponRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CouponRecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CouponId` bigint(20) NOT NULL,
  `CounponSN` varchar(50) NOT NULL COMMENT '优惠券的SN标示',
  `CounponTime` datetime NOT NULL,
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `UserId` bigint(20) NOT NULL,
  `UsedTime` datetime DEFAULT NULL,
  `OrderId` bigint(20) DEFAULT NULL COMMENT '使用的订单ID',
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) NOT NULL,
  `CounponStatus` int(11) NOT NULL COMMENT '优惠券状态',
  `WXCodeId` bigint(20) DEFAULT NULL COMMENT '微信Code记录号 与微信卡券投放记录关联',
  PRIMARY KEY (`Id`),
  KEY `fk_couponrecord_couponid` (`CouponId`) USING BTREE,
  KEY `FK_couponrecord_shopid` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_couponrecord_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`),
  CONSTRAINT `himall_couponrecord_ibfk_2` FOREIGN KEY (`CouponId`) REFERENCES `Himall_Coupon` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8 COMMENT='系统优惠券使用记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CouponRecord`
--

LOCK TABLES `Himall_CouponRecord` WRITE;
/*!40000 ALTER TABLE `Himall_CouponRecord` DISABLE KEYS */;
INSERT INTO `Himall_CouponRecord` VALUES (517,145,'a8a3f66e9b884e5eb847dec93213bfa3','2015-10-09 14:25:44','wxroo1zo',549,NULL,NULL,1,'官方自营店',0,212),(518,145,'e157de0db8344607b3f715f64b9da56b','2015-10-09 18:25:07','wxtsnumw',550,NULL,NULL,1,'官方自营店',0,213),(519,145,'ccd0401f260e4989873b1a24d0bd4891','2015-10-09 18:26:01','wxtsnumw',550,NULL,NULL,1,'官方自营店',0,214),(520,145,'9c6daf0e015c4d35bd32c9ca0d1a338c','2015-10-10 07:06:59','wxji8qai',551,NULL,NULL,1,'官方自营店',0,215),(521,145,'d464fdea8cfd49b9905bca4344aba773','2015-10-10 07:07:23','wxji8qai',551,NULL,NULL,1,'官方自营店',0,216),(522,145,'62c4d5c66d954201aeeca279030ed5bf','2015-10-10 09:57:23','wxji8qai',551,NULL,NULL,1,'官方自营店',0,NULL),(523,145,'b67d3dc368fa4e4bab5beacf2fb98480','2015-10-10 14:13:07','wxujj010',559,NULL,NULL,1,'官方自营店',0,217),(524,145,'fb6a2e00f6974781a7cdc540430b9178','2015-10-10 14:19:55','wxujj010',559,NULL,NULL,1,'官方自营店',0,218),(525,145,'e4e0818d29c84836a0f2a8b4ac2b6abe','2015-10-10 14:21:05','wxujj010',559,NULL,NULL,1,'官方自营店',0,219),(526,145,'a0a61afd2f884c5d8425faf71a00bc06','2015-10-10 15:15:03','15211013426',560,NULL,NULL,1,'官方自营店',0,220),(527,145,'9c2e79b01f114d30b924afde02150988','2015-10-11 18:04:45','wxtsnumw',550,NULL,NULL,1,'官方自营店',0,227),(528,145,'f2b19ae3e1e34ad7a9e1244bec90d044','2015-10-12 10:35:44','lanhama',577,'2015-10-12 10:38:05',2015101226784923,1,'官方自营店',1,NULL),(529,145,'0042ee3bfd87447b96c97ff5d9b71c6a','2015-10-12 11:46:05','wx4wlqm2',579,NULL,NULL,1,'官方自营店',0,228),(530,145,'63d728711b9a4c7ca98845ec20c1f7f5','2015-10-12 11:46:46','wx4wlqm2',579,NULL,NULL,1,'官方自营店',0,229),(531,145,'57019f24cc3d4d5ab6d370bf0a50d960','2015-10-12 15:03:01','selleradmin',541,'2015-10-13 11:03:44',2015101317110252,1,'官方自营店',1,NULL),(532,145,'18f82be309e04a7abd19e79f2455a806','2015-10-12 22:02:38','wxxetrj1',578,NULL,NULL,1,'官方自营店',0,230),(533,154,'a05cd5f63da343f2b0c64f14e62ea223','2015-10-13 15:25:05','selleradmin',541,'2015-10-13 15:25:44',2015101397944793,1,'官方自营店',1,NULL),(534,152,'109ce26f8b244b2aa10d062c177cf736','2015-10-13 15:53:38','selleradmin',541,'2015-10-14 09:20:54',2015101449634572,1,'官方自营店',1,NULL),(535,145,'f25a7a5d7319449ba2f7b7750b1e488c','2015-10-13 15:54:01','selleradmin',541,NULL,NULL,1,'官方自营店',0,NULL),(536,145,'8096f012f8274a839fff2f89101cc252','2015-10-13 15:54:06','selleradmin',541,NULL,NULL,1,'官方自营店',0,NULL),(537,153,'9ccbb3a89d424bacab4be091f0c69b89','2015-10-13 15:54:15','selleradmin',541,'2015-10-14 17:19:42',2015101441283161,1,'官方自营店',1,NULL),(538,145,'5754ff583b6d4f4d9456a42d56a5a11f','2015-10-13 16:00:59','selleradmin',541,NULL,NULL,1,'官方自营店',0,NULL),(539,145,'592a27b91f4c46199528bdb141f78981','2015-10-13 16:48:44','wx6md5cc',557,NULL,NULL,1,'官方自营店',0,231),(540,153,'e57f009d3a9c41bfb5bf5517de4aba4b','2015-10-13 16:49:15','wx6md5cc',557,NULL,NULL,1,'官方自营店',0,NULL),(541,153,'6ed2baab2d21496495c0cbe05666afad','2015-10-13 16:49:22','wx6md5cc',557,NULL,NULL,1,'官方自营店',0,NULL),(542,151,'ba64f4b4c8704ef692ec86f8f01d1f5d','2015-10-13 17:17:16','selleradmin',541,NULL,NULL,238,'步走寻常路',0,NULL),(543,150,'cd1f667f335d44f1bc7bfa60d37745bf','2015-10-13 17:17:21','selleradmin',541,NULL,NULL,237,'西城电子',0,NULL),(544,149,'92eb46c6c3b24d0798e38e2c58bde7b0','2015-10-13 17:17:28','selleradmin',541,NULL,NULL,236,'fex电子数码芙蓉店',0,NULL),(545,147,'3e0a69a2a2c84aa2a2bb80b37d0f7139','2015-10-13 17:17:32','selleradmin',541,NULL,NULL,232,'zara专卖',0,NULL),(546,145,'18f21bee82e3424eb8b645ebefe7a85a','2015-10-13 17:37:18','wxdqifrc',590,NULL,NULL,1,'官方自营店',0,232),(547,155,'c8c2d4ebbcc64f45bdb331305f3028f1','2015-10-13 20:56:33','韩寒韩寒',592,NULL,NULL,1,'官方自营店',0,NULL);
/*!40000 ALTER TABLE `Himall_CouponRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CouponSetting`
--

DROP TABLE IF EXISTS `Himall_CouponSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CouponSetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PlatForm` int(11) NOT NULL COMMENT '优惠券的发行平台',
  `CouponID` bigint(20) NOT NULL,
  `Display` int(11) DEFAULT NULL COMMENT '是否显示',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='优惠券设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CouponSetting`
--

LOCK TABLES `Himall_CouponSetting` WRITE;
/*!40000 ALTER TABLE `Himall_CouponSetting` DISABLE KEYS */;
INSERT INTO `Himall_CouponSetting` VALUES (7,99,29,0),(8,99,22,0),(13,0,23,0),(49,4,54,1),(50,0,54,1),(51,4,55,1),(52,0,55,1),(53,4,56,1),(54,0,56,1),(208,4,145,1),(209,0,145,1),(210,4,152,1),(211,0,152,1),(212,4,153,1),(213,0,153,1),(214,4,156,1),(215,0,156,1);
/*!40000 ALTER TABLE `Himall_CouponSetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_CustomerServices`
--

DROP TABLE IF EXISTS `Himall_CustomerServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_CustomerServices` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Tool` int(11) NOT NULL COMMENT '工具类型（QQ、旺旺）',
  `Type` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL COMMENT '客服名称',
  `AccountCode` varchar(1000) NOT NULL COMMENT '通信账号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='系统客服表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_CustomerServices`
--

LOCK TABLES `Himall_CustomerServices` WRITE;
/*!40000 ALTER TABLE `Himall_CustomerServices` DISABLE KEYS */;
INSERT INTO `Himall_CustomerServices` VALUES (7,1,1,1,'小美丽','774588512'),(8,1,2,2,'杨过','66321548552'),(14,210,1,1,'客服售前','15556784'),(19,210,2,1,'售前旺旺','tanglingling325@126.com'),(24,1,1,1,'美眉','459151755'),(25,245,1,1,'美眉','459151755'),(26,1,1,1,'2028194988','2028194988');
/*!40000 ALTER TABLE `Himall_CustomerServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FavoriteShops`
--

DROP TABLE IF EXISTS `Himall_FavoriteShops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FavoriteShops` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `ShopId` bigint(20) NOT NULL,
  `Tags` varchar(100) DEFAULT NULL COMMENT '分类标签',
  `Date` datetime NOT NULL COMMENT '收藏日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='收藏店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FavoriteShops`
--

LOCK TABLES `Himall_FavoriteShops` WRITE;
/*!40000 ALTER TABLE `Himall_FavoriteShops` DISABLE KEYS */;
INSERT INTO `Himall_FavoriteShops` VALUES (144,549,1,'','2015-10-09 14:25:34'),(145,560,210,'','2015-10-10 15:39:29'),(146,572,210,'','2015-10-11 15:18:53');
/*!40000 ALTER TABLE `Himall_FavoriteShops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Favorites`
--

DROP TABLE IF EXISTS `Himall_Favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Favorites` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `ProductId` bigint(20) NOT NULL,
  `Tags` varchar(100) DEFAULT NULL COMMENT '分类标签',
  `Date` datetime NOT NULL COMMENT '收藏日期',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_Favorite` (`UserId`) USING BTREE,
  KEY `FK_Product_Favorite` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_favorites_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_favorites_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8 COMMENT='收藏商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Favorites`
--

LOCK TABLES `Himall_Favorites` WRITE;
/*!40000 ALTER TABLE `Himall_Favorites` DISABLE KEYS */;
INSERT INTO `Himall_Favorites` VALUES (406,574,231,'','2015-10-11 22:18:07');
/*!40000 ALTER TABLE `Himall_Favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FloorBrands`
--

DROP TABLE IF EXISTS `Himall_FloorBrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FloorBrands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `BrandId` bigint(20) NOT NULL COMMENT '品牌ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Brand_FloorBrand` (`BrandId`) USING BTREE,
  KEY `FK_HomeFloor_FloorBrand` (`FloorId`) USING BTREE,
  CONSTRAINT `himall_floorbrands_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `Himall_Brands` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_floorbrands_ibfk_2` FOREIGN KEY (`FloorId`) REFERENCES `Himall_HomeFloors` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 COMMENT='商城首页楼层品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FloorBrands`
--

LOCK TABLES `Himall_FloorBrands` WRITE;
/*!40000 ALTER TABLE `Himall_FloorBrands` DISABLE KEYS */;
INSERT INTO `Himall_FloorBrands` VALUES (278,1,264),(279,1,41),(280,1,261),(281,1,260),(282,1,259),(283,1,93),(284,1,262),(285,1,40),(286,1,154),(287,1,263),(298,62,264),(300,62,260),(302,62,259),(305,62,40),(369,65,156),(370,65,155),(371,65,3),(372,65,153),(373,65,278),(374,65,275),(375,65,274),(376,65,277),(377,65,273),(378,65,279),(379,65,276),(381,69,140),(383,69,283),(384,69,106),(385,69,286),(388,69,284),(390,69,148),(391,69,281),(392,69,285),(394,69,282),(395,69,280),(396,62,156),(397,62,140),(399,62,153),(400,62,278),(402,62,93),(403,62,3),(415,71,156),(416,72,156);
/*!40000 ALTER TABLE `Himall_FloorBrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FloorCategories`
--

DROP TABLE IF EXISTS `Himall_FloorCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FloorCategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL,
  `CategoryId` bigint(20) NOT NULL,
  `Depth` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Category_FloorCategory` (`CategoryId`) USING BTREE,
  KEY `FK_HomeFloor_FloorCategory` (`FloorId`) USING BTREE,
  CONSTRAINT `himall_floorcategories_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `Himall_Categories` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_floorcategories_ibfk_2` FOREIGN KEY (`FloorId`) REFERENCES `Himall_HomeFloors` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FloorCategories`
--

LOCK TABLES `Himall_FloorCategories` WRITE;
/*!40000 ALTER TABLE `Himall_FloorCategories` DISABLE KEYS */;
INSERT INTO `Himall_FloorCategories` VALUES (90,1,312,1),(91,1,352,1),(92,1,378,1),(93,1,485,1),(106,1,314,2),(107,1,324,3),(108,1,325,3),(109,1,323,3),(110,1,381,2),(111,1,389,3),(112,1,391,3),(113,1,392,3),(144,1,353,2),(145,1,360,3),(146,1,361,3),(147,1,357,3);
/*!40000 ALTER TABLE `Himall_FloorCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FloorProducts`
--

DROP TABLE IF EXISTS `Himall_FloorProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FloorProducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `Tab` int(11) NOT NULL COMMENT '楼层标签',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`Id`),
  KEY `FK_HomeFloor_FloorProduct` (`FloorId`) USING BTREE,
  KEY `FK_Product_FloorProduct` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_floorproducts_ibfk_1` FOREIGN KEY (`FloorId`) REFERENCES `Himall_HomeFloors` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_floorproducts_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城首页楼层商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FloorProducts`
--

LOCK TABLES `Himall_FloorProducts` WRITE;
/*!40000 ALTER TABLE `Himall_FloorProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_FloorProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FloorTablDetails`
--

DROP TABLE IF EXISTS `Himall_FloorTablDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FloorTablDetails` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TabId` bigint(20) NOT NULL COMMENT 'TabID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`Id`),
  KEY `TabIdFK` (`TabId`),
  KEY `ProductIdFK` (`ProductId`),
  CONSTRAINT `TabIdFK` FOREIGN KEY (`TabId`) REFERENCES `Himall_FloorTabls` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COMMENT='商城首页楼层Tab表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FloorTablDetails`
--

LOCK TABLES `Himall_FloorTablDetails` WRITE;
/*!40000 ALTER TABLE `Himall_FloorTablDetails` DISABLE KEYS */;
INSERT INTO `Himall_FloorTablDetails` VALUES (193,85,186),(194,85,188),(195,85,189),(196,85,190),(197,85,191),(198,85,192),(199,85,193),(200,85,196),(217,88,218),(218,88,219),(219,88,220),(220,88,221),(221,88,222),(222,88,223),(223,88,224),(224,88,225),(257,93,226),(258,93,227),(259,93,228),(260,93,229),(261,93,230),(262,93,231),(263,93,232),(264,93,236),(281,96,186),(282,96,196),(283,96,218),(284,96,221),(285,96,226),(286,96,228),(287,96,230),(288,96,233),(375,109,196),(376,109,197),(377,109,237),(378,109,240),(379,109,242),(380,109,246),(381,109,250),(382,109,309),(383,110,181),(384,110,182),(385,110,183),(386,110,184),(387,110,185),(388,110,186),(389,110,187),(390,110,188);
/*!40000 ALTER TABLE `Himall_FloorTablDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FloorTabls`
--

DROP TABLE IF EXISTS `Himall_FloorTabls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FloorTabls` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `Name` varchar(50) NOT NULL COMMENT '楼层名称',
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`),
  KEY `FloorIdFK` (`FloorId`),
  CONSTRAINT `FloorIdFK` FOREIGN KEY (`FloorId`) REFERENCES `Himall_HomeFloors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='商城首页楼层Table表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FloorTabls`
--

LOCK TABLES `Himall_FloorTabls` WRITE;
/*!40000 ALTER TABLE `Himall_FloorTabls` DISABLE KEYS */;
INSERT INTO `Himall_FloorTabls` VALUES (85,65,'男装女装'),(88,69,'化妆专区'),(93,1,'数码家电'),(96,62,'百货商场'),(109,72,'女装'),(110,72,'男装');
/*!40000 ALTER TABLE `Himall_FloorTabls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FloorTopics`
--

DROP TABLE IF EXISTS `Himall_FloorTopics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FloorTopics` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorId` bigint(20) NOT NULL COMMENT '楼层ID',
  `TopicType` int(11) NOT NULL COMMENT '专题类型',
  `TopicImage` varchar(100) NOT NULL COMMENT '专题封面图片',
  `TopicName` varchar(100) NOT NULL COMMENT '专题名称',
  `Url` varchar(1000) DEFAULT NULL COMMENT '专题跳转URL',
  PRIMARY KEY (`Id`),
  KEY `FK_HomeFloor_FloorTopic` (`FloorId`) USING BTREE,
  CONSTRAINT `himall_floortopics_ibfk_1` FOREIGN KEY (`FloorId`) REFERENCES `Himall_HomeFloors` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3566 DEFAULT CHARSET=utf8 COMMENT='商城首页楼层专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FloorTopics`
--

LOCK TABLES `Himall_FloorTopics` WRITE;
/*!40000 ALTER TABLE `Himall_FloorTopics` DISABLE KEYS */;
INSERT INTO `Himall_FloorTopics` VALUES (3118,65,11,'','男装','/'),(3119,65,29,'/Storage/Plat/PageSettings/HomeFloor/65/floor_ScrollOne_20150714114837579218.jpg','','http://www.baidu.com'),(3120,65,30,'/Storage/Plat/PageSettings/HomeFloor/65/floor_ScrollTwo_20150714114837579218.jpg','','http://www.baidu.com'),(3121,65,31,'/Storage/Plat/PageSettings/HomeFloor/65/floor_ScrollThree_20150714114837579218.jpg','','http://www.baidu.com'),(3122,65,32,'/Storage/Plat/PageSettings/HomeFloor/65/floor_ScrollFour_20150714114837579218.jpg','','http://www.baidu.com'),(3123,65,21,'/Storage/Plat/PageSettings/HomeFloor/65/floor_ROne_20150714111618262063.jpg','','http://www.baidu.com'),(3124,65,22,'/Storage/Plat/PageSettings/HomeFloor/65/floor_RTwo_20150714111618262063.jpg','','http://www.baidu.com'),(3125,65,23,'/Storage/Plat/PageSettings/HomeFloor/65/floor_RThree_20150714111618293323.jpg','','http://www.baidu.com'),(3126,65,24,'/Storage/Plat/PageSettings/HomeFloor/65/floor_RFour_20150714111618293323.jpg','','http://www.baidu.com'),(3127,65,25,'/Storage/Plat/PageSettings/HomeFloor/65/floor_RFive_20150714111618293323.jpg','','http://www.baidu.com'),(3128,65,26,'/Storage/Plat/PageSettings/HomeFloor/65/floor_RSix_20150714111618308950.jpg','','http://www.baidu.com'),(3129,65,27,'/Storage/Plat/PageSettings/HomeFloor/65/floor_RSeven_20150714111618308950.jpg','','http://www.baidu.com'),(3130,65,28,'/Storage/Plat/PageSettings/HomeFloor/65/floor_REight_20150714111618308950.jpg','','http://www.baidu.com'),(3157,69,11,'','美妆套餐','/'),(3158,69,29,'/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollOne_20150716155207460108.jpg','','/'),(3159,69,30,'/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollTwo_20150716155207475746.jpg','','/'),(3160,69,31,'/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollThree_20150716155207491357.jpg','','/'),(3161,69,32,'/Storage/Plat/PageSettings/HomeFloor/0/floor_ScrollFour_20150716155207506985.jpg','','/'),(3162,69,21,'/Storage/Plat/PageSettings/HomeFloor/0/floor_ROne_20150716155207506985.jpg','','/'),(3163,69,22,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RTwo_20150716155207522621.jpg','','/'),(3164,69,23,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RThree_20150716155207522621.jpg','','/'),(3165,69,24,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RFour_20150716155207522621.jpg','','/'),(3166,69,25,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RFive_20150716155207522621.jpg','','/'),(3167,69,26,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RSix_20150716155207522621.jpg','','/'),(3168,69,27,'/Storage/Plat/PageSettings/HomeFloor/69/floor_RSeven_20150716165650938028.jpg','','/'),(3169,69,28,'/Storage/Plat/PageSettings/HomeFloor/69/floor_REight_20150716165412028283.jpg','','/'),(3250,1,11,'','精品男装','/'),(3251,1,11,'','品牌女装','/'),(3252,1,11,'','水晶手链','/'),(3253,1,11,'','菩提手串','/'),(3254,1,11,'','奢侈名表','/'),(3255,1,11,'','天梭特卖','/'),(3256,1,11,'','护肤套餐','/'),(3257,1,11,'','彩妆香水','/'),(3258,1,29,'/Storage/Plat/PageSettings/HomeFloor/1/floor_ScrollOne_20150630192040658758.jpg','','/'),(3259,1,30,'/Storage/Plat/PageSettings/HomeFloor/1/floor_ScrollTwo_20150630192040674383.jpg','','/'),(3260,1,31,'/Storage/Plat/PageSettings/HomeFloor/1/floor_ScrollThree_20150630192040674383.jpg','','/'),(3261,1,32,'/Storage/Plat/PageSettings/HomeFloor/1/floor_ScrollFour_20150630192040674383.jpg','','/'),(3262,1,21,'/Storage/Plat/PageSettings/HomeFloor/1/floor_ROne_20150630192040674383.jpg','','/'),(3263,1,22,'/Storage/Plat/PageSettings/HomeFloor/1/floor_RTwo_20150630192040690009.jpg','','/'),(3264,1,23,'/Storage/Plat/PageSettings/HomeFloor/1/floor_RThree_20150630192040690009.jpg','','/'),(3265,1,24,'/Storage/Plat/PageSettings/HomeFloor/1/floor_RFour_20150630192936490246.png','','/'),(3266,1,25,'/Storage/Plat/PageSettings/HomeFloor/1/floor_RFive_20150630192040705635.jpg','','/'),(3267,1,26,'/Storage/Plat/PageSettings/HomeFloor/1/floor_RSix_20150630192040705635.jpg','','/'),(3268,1,27,'/Storage/Plat/PageSettings/HomeFloor/1/floor_RSeven_20150720141827984811.jpg','','/'),(3269,1,28,'/Storage/Plat/PageSettings/HomeFloor/1/floor_REight_20150630193202431358.jpg','','/'),(3310,62,11,'','空净特卖','/'),(3311,62,11,'','精品家电','/'),(3312,62,11,'','智能电视','/'),(3313,62,11,'','电视特惠','/'),(3314,62,11,'','彩电风暴','/'),(3315,62,11,'','乐趣厨房','/'),(3316,62,11,'','智能设备','/'),(3317,62,11,'','华为荣耀','/'),(3318,62,29,'/Storage/Plat/PageSettings/HomeFloor/62/floor_ScrollOne_20150720150952084734.png','','/'),(3319,62,30,'/Storage/Plat/PageSettings/HomeFloor/62/floor_ScrollTwo_20150720151011479934.png','','/'),(3320,62,31,'/Storage/Plat/PageSettings/HomeFloor/62/floor_ScrollThree_20150720151105521696.png','','/'),(3321,62,32,'/Storage/Plat/PageSettings/HomeFloor/62/floor_ScrollFour_20150720151105521696.png','','/'),(3322,62,21,'/Storage/Plat/PageSettings/HomeFloor/0/floor_ROne_20150630195316807110.jpg','','/'),(3323,62,22,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RTwo_20150630195316823557.png','','/'),(3324,62,23,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RThree_20150630195316823557.png','','/'),(3325,62,24,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RFour_20150630195316839193.jpg','','/'),(3326,62,25,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RFive_20150630195316839193.png','','/'),(3327,62,26,'/Storage/Plat/PageSettings/HomeFloor/0/floor_RSix_20150630195316839193.png','','/'),(3328,62,27,'/Storage/Plat/PageSettings/HomeFloor/62/floor_RSeven_20150630201340069285.png','','/'),(3329,62,28,'/Storage/Plat/PageSettings/HomeFloor/0/floor_REight_20150630195316854813.png','','/'),(3516,71,11,'','品牌推介','http://demo.himall.kuaidiantong.cn/'),(3517,71,1,'/Storage/Plat/PageSettings/HomeFloor/71/floor_LeftOne_20151014131409593990.jpg','','http://demo.himall.kuaidiantong.cn/Gift/Detail/65'),(3518,71,2,'/Storage/Plat/PageSettings/HomeFloor/71/floor_LeftTwo_20151014131409593990.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/230'),(3519,71,3,'/Storage/Plat/PageSettings/HomeFloor/71/floor_MiddleOne_20151014131409594966.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/231'),(3520,71,4,'/Storage/Plat/PageSettings/HomeFloor/71/floor_MiddleTwo_20151014131409596920.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/225'),(3521,71,5,'/Storage/Plat/PageSettings/HomeFloor/71/floor_MiddleThree_20151014131528139975.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/219'),(3522,71,6,'/Storage/Plat/PageSettings/HomeFloor/71/floor_MiddleFour_20151014131409597896.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/221'),(3523,71,7,'/Storage/Plat/PageSettings/HomeFloor/71/floor_MiddleFive_20151014131528140951.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/220'),(3524,71,8,'/Storage/Plat/PageSettings/HomeFloor/71/floor_RightOne_20151014131409598873.jpg','','http://demo.himall.kuaidiantong.cn/'),(3525,71,9,'/Storage/Plat/PageSettings/HomeFloor/71/floor_RightTwo_20151014131409599849.jpg','','http://demo.himall.kuaidiantong.cn/'),(3526,71,10,'/Storage/Plat/PageSettings/HomeFloor/71/floor_RightThree_20151014131409603756.jpg','','http://demo.himall.kuaidiantong.cn/'),(3553,72,11,'','品牌推介','http://demo.himall.kuaidiantong.cn/'),(3554,72,29,'/Storage/Plat/PageSettings/HomeFloor/72/floor_ScrollOne_20151014133212219098.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3555,72,30,'/Storage/Plat/PageSettings/HomeFloor/72/floor_ScrollTwo_20151014133212220074.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3556,72,31,'/Storage/Plat/PageSettings/HomeFloor/72/floor_ScrollThree_20151014133212221051.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3557,72,32,'/Storage/Plat/PageSettings/HomeFloor/72/floor_ScrollFour_20151014133212222028.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3558,72,21,'/Storage/Plat/PageSettings/HomeFloor/72/floor_ROne_20151014133212223981.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3559,72,22,'/Storage/Plat/PageSettings/HomeFloor/72/floor_RTwo_20151014130517065096.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3560,72,23,'/Storage/Plat/PageSettings/HomeFloor/72/floor_RThree_20151014133212223981.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3561,72,24,'/Storage/Plat/PageSettings/HomeFloor/72/floor_RFour_20151014130517066072.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3562,72,25,'/Storage/Plat/PageSettings/HomeFloor/72/floor_RFive_20151014133212224957.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3563,72,26,'/Storage/Plat/PageSettings/HomeFloor/72/floor_RSix_20151014130517069978.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3564,72,27,'/Storage/Plat/PageSettings/HomeFloor/72/floor_RSeven_20151014133212226911.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246'),(3565,72,28,'/Storage/Plat/PageSettings/HomeFloor/72/floor_REight_20151014130517070955.jpg','','http://demo.himall.kuaidiantong.cn/Product/Detail/246');
/*!40000 ALTER TABLE `Himall_FloorTopics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FreightAreaContent`
--

DROP TABLE IF EXISTS `Himall_FreightAreaContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FreightAreaContent` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FreightTemplateId` bigint(20) NOT NULL COMMENT '运费模板ID',
  `AreaContent` varchar(4000) DEFAULT NULL COMMENT '地区选择',
  `FirstUnit` int(11) DEFAULT NULL COMMENT '首笔单元计量',
  `FirstUnitMonry` float DEFAULT NULL COMMENT '首笔单元费用',
  `AccumulationUnit` int(11) DEFAULT NULL COMMENT '递增单元计量',
  `AccumulationUnitMoney` float DEFAULT NULL COMMENT '递增单元费用',
  `IsDefault` tinyint(4) DEFAULT NULL COMMENT '是否为默认',
  PRIMARY KEY (`Id`),
  KEY `FK_Freighttemalate_FreightAreaContent` (`FreightTemplateId`) USING BTREE,
  CONSTRAINT `himall_freightareacontent_ibfk_1` FOREIGN KEY (`FreightTemplateId`) REFERENCES `Himall_FreightTemplate` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COMMENT='运费模详细板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FreightAreaContent`
--

LOCK TABLES `Himall_FreightAreaContent` WRITE;
/*!40000 ALTER TABLE `Himall_FreightAreaContent` DISABLE KEYS */;
INSERT INTO `Himall_FreightAreaContent` VALUES (228,100,'',100,5,1,1,1),(229,100,'3796,3797,3798,3800,3801',100,10,10,2,0),(231,107,'3796,3797,3798,3800,3801',10,10,1,2,0),(232,107,'',10,10,1,2,1),(233,99,'',10,5,1,1,1),(234,99,'3796,3797,3798,3800,3801',10,10,1,2,0),(311,136,'',1,5,1,1,1);
/*!40000 ALTER TABLE `Himall_FreightAreaContent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_FreightTemplate`
--

DROP TABLE IF EXISTS `Himall_FreightTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_FreightTemplate` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL COMMENT '运费模板名称',
  `SourceAddress` int(11) DEFAULT NULL COMMENT '宝贝发货地',
  `SendTime` varchar(100) DEFAULT NULL COMMENT '发送时间',
  `IsFree` int(11) NOT NULL COMMENT '是否商家负责运费',
  `ValuationMethod` int(11) NOT NULL COMMENT '定价方法(按体积、重量计算）',
  `ShippingMethod` int(11) DEFAULT NULL COMMENT '运送类型（物流、快递）',
  `ShopID` bigint(20) NOT NULL COMMENT '店铺ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='运费模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_FreightTemplate`
--

LOCK TABLES `Himall_FreightTemplate` WRITE;
/*!40000 ALTER TABLE `Himall_FreightTemplate` DISABLE KEYS */;
INSERT INTO `Himall_FreightTemplate` VALUES (99,'质量',216,NULL,0,1,NULL,210),(100,'体积',533,NULL,0,2,NULL,210),(103,'免运费',1051,'12',1,0,NULL,1),(107,'体积',216,NULL,0,2,NULL,1),(133,'线下支付',104,'4',1,0,NULL,1),(134,'测试',102,'',1,0,NULL,245),(136,'顺丰快递',1666,'12',0,0,NULL,247),(137,'免运费',102,'48',1,0,NULL,247);
/*!40000 ALTER TABLE `Himall_FreightTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_GiftOrderItem`
--

DROP TABLE IF EXISTS `Himall_GiftOrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_GiftOrderItem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `OrderId` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `GiftId` bigint(20) NOT NULL COMMENT '礼品编号',
  `Quantity` int(11) NOT NULL COMMENT '数量',
  `SaleIntegral` int(11) DEFAULT NULL COMMENT '积分单价',
  `GiftName` varchar(100) DEFAULT NULL COMMENT '礼品名称',
  `GiftValue` decimal(8,3) DEFAULT NULL COMMENT '礼品价值',
  `ImagePath` varchar(100) DEFAULT NULL COMMENT '图片存放地址',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_Gitem_OrderId` (`OrderId`),
  CONSTRAINT `FK_Himall_Gitem_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Himall_GiftsOrder` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='礼物订单项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_GiftOrderItem`
--

LOCK TABLES `Himall_GiftOrderItem` WRITE;
/*!40000 ALTER TABLE `Himall_GiftOrderItem` DISABLE KEYS */;
INSERT INTO `Himall_GiftOrderItem` VALUES (83,1201510129796357,66,1,10,'小米LED随身灯',15.000,'/Storage/Gift/66');
/*!40000 ALTER TABLE `Himall_GiftOrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Gifts`
--

DROP TABLE IF EXISTS `Himall_Gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Gifts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `GiftName` varchar(100) NOT NULL COMMENT '名称',
  `NeedIntegral` int(11) NOT NULL COMMENT '需要积分',
  `LimtQuantity` int(11) NOT NULL COMMENT '限制兑换数量 0表示不限兑换数量',
  `StockQuantity` int(11) NOT NULL COMMENT '库存数量',
  `EndDate` datetime NOT NULL COMMENT '兑换结束时间',
  `NeedGrade` int(11) NOT NULL DEFAULT '0' COMMENT '等级要求 0表示不限定',
  `VirtualSales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `RealSales` int(11) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `SalesStatus` int(11) NOT NULL COMMENT '状态',
  `ImagePath` varchar(100) DEFAULT NULL COMMENT '图片存放地址',
  `Sequence` int(11) NOT NULL DEFAULT '100' COMMENT '顺序 默认100 数字越小越靠前',
  `GiftValue` decimal(8,2) DEFAULT NULL COMMENT '礼品价值',
  `Description` longtext COMMENT '描述',
  `AddDate` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='积分礼品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Gifts`
--

LOCK TABLES `Himall_Gifts` WRITE;
/*!40000 ALTER TABLE `Himall_Gifts` DISABLE KEYS */;
INSERT INTO `Himall_Gifts` VALUES (50,'森麦 立体声头戴式二级',3279,100,100,'2015-10-23 13:51:09',6,0,0,1,'/Storage/Gift/50',8,59.00,'<p><img src=\"/Storage/Gift/50/Details/f2616a1c5ed04f05b40c4fa3bf8cd499.jpg\"/></p><p><img src=\"/Storage/Gift/50/Details/d65e62542966475381cc9b3faa9a05db.jpg\"/></p>','2015-09-23 14:02:07'),(51,'ENONG驿能 胡巴图案自带线充电宝 聚合物通用移动电源 4000毫安',10,100,100,'2015-10-23 14:02:35',7,0,0,1,'/Storage/Gift/51',7,58.00,'<h2 id=\"promotionDesc\" style=\"margin: 0px 0px -9px; padding: 0px; font-size: 14px; font-weight: 400; font-stretch: normal; line-height: 1.5; font-family: 微软雅黑; color: rgb(255, 102, 0); word-break: break-all; white-space: normal;\">萌萌哒有木有，等什么！非常便携，4000毫安能给手机充两次电啦！</h2><p><img alt=\"\" src=\"/Storage/Gift/51/Details/87dd828c92204a339317d311137a8007.jpg\" class=\"err-product\" height=\"638\" width=\"750\" style=\"border: 0px; vertical-align: middle; color: rgb(51, 51, 51); font-family: Arial, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background: url(http://res.suning.cn/public/v3/css/images/blankbg.gif?v=2015072001) 50% 50% no-repeat rgb(255, 255, 255);\"/><img alt=\"\" src=\"/Storage/Gift/51/Details/38ab741b849e48d4b2138d97626e8910.jpg\" class=\"err-product\" height=\"523\" width=\"750\" style=\"border: 0px; vertical-align: middle; color: rgb(51, 51, 51); font-family: Arial, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background: url(http://res.suning.cn/public/v3/css/images/blankbg.gif?v=2015072001) 50% 50% no-repeat rgb(255, 255, 255);\"/><img alt=\"\" src=\"/Storage/Gift/51/Details/af6732ef07aa47c294af82ec20015653.jpg\" class=\"err-product\" height=\"525\" width=\"750\" style=\"border: 0px; vertical-align: middle; color: rgb(51, 51, 51); font-family: Arial, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background: url(http://res.suning.cn/public/v3/css/images/blankbg.gif?v=2015072001) 50% 50% no-repeat rgb(255, 255, 255);\"/><img alt=\"\" src=\"/Storage/Gift/51/Details/5bbb3aaccf3f461e95ba2a41cdaef679.jpg\" class=\"err-product\" height=\"519\" width=\"750\" style=\"border: 0px; vertical-align: middle; color: rgb(51, 51, 51); font-family: Arial, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background: url(http://res.suning.cn/public/v3/css/images/blankbg.gif?v=2015072001) 50% 50% no-repeat rgb(255, 255, 255);\"/></p>','2015-09-23 14:04:08'),(52,'耐翔 H1加长安卓数据线micro USB充电线 三星小米华为魅族通用电源线',1200,10,100,'2015-10-23 14:04:28',0,0,0,1,'/Storage/Gift/52',2,19.90,'<p><img src=\"/Storage/Gift/52/Details/638507072ba14e8db0da2f2e7b3fe822.jpg\"/></p>','2015-09-23 14:05:51'),(53,'内慧 女秋冬新款中筒兔羊毛袜保暖加厚袜子5双礼盒装 WZ5008 包邮 三只熊款 均码',2580,0,100,'2015-10-23 14:06:20',0,0,0,0,'/Storage/Gift/53',100,32.00,'<p><img src=\"/Storage/Gift/53/Details/30c7d092090942e985e2cd8921ce6940.jpg\"/></p>','2015-09-23 14:07:13'),(54,'九百亩 阳澄湖大闸蟹礼券1368型 全母2.2-2.6两8只 装提货券 经典礼卡',20,0,1000000,'2015-10-23 14:08:05',0,0,0,0,'/Storage/Gift/54',100,99.00,'<p><img src=\"/Storage/Gift/54/Details/fb3627f7029947f9aa19dcbcea8f2942.jpg\" alt=\"788_01\"/></p>','2015-09-23 14:09:14'),(55,'大闸蟹礼券 谷源道阳澄湖大闸蟹券非实物礼盒 858型8只装 公蟹3.6-4.0两4只 母蟹2.6-3.0两4只 螃蟹券',77,0,10,'2015-10-23 14:09:44',0,0,0,0,'/Storage/Gift/55',100,958.00,'<p><img src=\"/Storage/Gift/55/Details/36c5d2d9461a446d9ee3d980aef4140a.jpg\"/></p>','2015-09-23 14:10:54'),(56,'【统牌】阳澄湖大闸蟹礼盒 1288型 提货券 55折中秋礼品大礼包',100,10,999999999,'2015-10-23 14:11:15',0,0,0,0,'/Storage/Gift/56',100,999.00,'<p><img src=\"/Storage/Gift/56/Details/f894435d19c54d5dae0d18a18b573bb2.jpg\"/></p>','2015-09-23 14:12:31'),(57,'欧雷柏 蓝牙自拍器 手机自拍杆 苹果小米 蓝牙遥控自拍神器杆便捷迷你折叠自拍杆',700,100,1000,'2015-10-23 14:14:14',0,0,0,0,'/Storage/Gift/57',100,39.90,'<p><img src=\"/Storage/Gift/57/Details/2cf818c8e32f4b4f828080c0884dfc6a.jpg\"/></p>','2015-09-23 14:15:37'),(58,'语欣(RESIN) 深层洁净婴儿专用洗衣液1000ml 宝宝儿童衣物清洗剂 婴儿洗护 洗衣皂',99,99,100,'2015-10-23 14:16:03',0,0,0,0,'/Storage/Gift/58',100,49.00,'<p><img src=\"/Storage/Gift/58/Details/2cb085c433dd4aeeaa7fb724064cbf54.jpg\"/></p>','2015-09-23 14:16:32'),(59,'翊品耗材YIPINGLONG 大眼萌U盘 神偷奶爸小黄人U盘8G 喵星人优盘双款可选 可爱创意卡通优盘8G大眼萌官方标配',30,30,300,'2015-10-23 14:17:44',0,0,0,0,'/Storage/Gift/59',5,30.00,'<p><img src=\"/Storage/Gift/59/Details/e43e2be553a34440aab4b71fda04482d.jpg\"/></p>','2015-09-23 14:18:53'),(60,'恩谷 ENGUE EG-06 智能运动手环 腕带健康智能穿戴 IP65级防水设计 计步测距 健康监测（颜色随机发货）',30,30,300,'2015-10-23 14:19:17',0,0,0,1,'/Storage/Gift/60',4,30.00,'<p><img src=\"/Storage/Gift/60/Details/b284be9147a64d879ceefbef58d19809.jpg\"/></p>','2015-09-23 14:20:03'),(61,'SLOKY 施诺绮 依恋925纯银饰锆石项链 进口AAA仿真钻石吊坠 时尚饰品首饰 送女友送老婆礼物 白色',10,100,1000,'2015-10-23 14:20:25',0,0,0,0,'/Storage/Gift/61',100,99.00,'<p><a href=\"http://product.suning.com/detail_0070070166_126446815.html\" target=\"_blank\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: 0px; margin: 0px; padding: 0px; font-family: Arial, 宋体; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"\" src=\"/Storage/Gift/61/Details/c16c1747397040729970536064b7f28b.jpg\" class=\"err-product\" style=\"border: 0px; vertical-align: middle; background: url(http://res.suning.cn/public/v3/css/images/blankbg.gif?v=2015072001) 50% 50% no-repeat;\"/><img alt=\"\" src=\"/Storage/Gift/61/Details/3b52db0e47914287aa316d06904e1248.jpg\" class=\"err-product\" style=\"border: 0px; vertical-align: middle; background: url(http://res.suning.cn/public/v3/css/images/blankbg.gif?v=2015072001) 50% 50% no-repeat;\"/></a></p>','2015-09-23 14:21:01'),(62,'Yeelight床头灯',10000,110,10000,'2015-10-23 14:47:28',0,0,0,1,'/Storage/Gift/62',3,251.00,'<p><img src=\"/Storage/Gift/62/Details/e19547f6dec1412ebfe186f73ba3ce9d.jpg\"/></p>','2015-09-23 14:48:35'),(63,'小米智能家庭套装',111000,1110,100,'2015-10-23 14:50:19',0,0,0,1,'/Storage/Gift/63',6,150.00,'<p><img src=\"/Storage/Gift/63/Details/52eb997204b34752a6379bb6dca46ef4.jpg\"/></p>','2015-09-23 14:51:50'),(64,'极薄防蓝光玻璃膜',100,100,100,'2015-10-23 15:19:58',0,0,0,1,'/Storage/Gift/64',1,49.00,'<p><img src=\"/Storage/Gift/64/Details/a7d3e712358c40bca8a08bf65d4f02c2.jpg\"/></p>','2015-09-23 15:22:21'),(65,'经典版米兔',100,100,100,'2015-10-23 15:32:17',0,0,0,1,'/Storage/Gift/65',1,20.00,'<p><img alt=\"\" data-src=\"/Storage/Gift/65/Details/6ef6ef8321ff4754b583de372d9af711.jpg\" src=\"/Storage/Gift/65/Details/6ef6ef8321ff4754b583de372d9af711.jpg\" style=\"border: 0px; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Heiti SC&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-size: 14px; line-height: 21px; text-align: center; white-space: normal; margin-bottom: 20px; background-color: rgb(245, 245, 245);\"/><img alt=\"\" data-src=\"/Storage/Gift/65/Details/2e142d98c4fd4dc08a203aef99fec779.jpg\" src=\"/Storage/Gift/65/Details/2e142d98c4fd4dc08a203aef99fec779.jpg\" style=\"border: 0px; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, &#39;Microsoft Yahei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Heiti SC&#39;, &#39;WenQuanYi Micro Hei&#39;, sans-serif; font-size: 14px; line-height: 21px; text-align: center; white-space: normal; margin-bottom: 20px; background-color: rgb(245, 245, 245);\"/></p>','2015-09-23 15:32:48'),(66,'小米LED随身灯',10,100,99,'2015-10-23 15:33:15',0,0,1,1,'/Storage/Gift/66',100,15.00,'<p><img src=\"/Storage/Gift/66/Details/6fc4649531d144b1a2d304de4aec219a.jpg\"/></p>','2015-09-23 15:33:52'),(67,'米兔手机U盘升级版',46,40,1000,'2015-10-23 15:34:18',0,0,0,1,'/Storage/Gift/67',100,49.00,'<p><img src=\"/Storage/Gift/67/Details/49f9ab5af2f64343af9da0c1bbb1d688.jpg\"/></p>','2015-09-23 15:34:49'),(68,'测试活动',10,1,10,'2015-11-13 18:30:55',0,0,0,0,'/Storage/Gift/68',100,100.00,'<p>21321313</p>','2015-10-13 18:31:47');
/*!40000 ALTER TABLE `Himall_Gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_GiftsOrder`
--

DROP TABLE IF EXISTS `Himall_GiftsOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_GiftsOrder` (
  `Id` bigint(20) NOT NULL COMMENT '编号',
  `OrderStatus` int(11) NOT NULL COMMENT '订单状态',
  `UserId` bigint(20) NOT NULL COMMENT '用户编号',
  `UserRemark` varchar(200) DEFAULT NULL COMMENT '会员留言',
  `ShipTo` varchar(100) DEFAULT NULL COMMENT '收货人',
  `CellPhone` varchar(100) DEFAULT NULL COMMENT '收货人电话',
  `TopRegionId` int(11) DEFAULT NULL COMMENT '一级地区',
  `RegionId` int(11) DEFAULT NULL COMMENT '地区编号',
  `RegionFullName` varchar(100) DEFAULT NULL COMMENT '地区全称',
  `Address` varchar(100) DEFAULT NULL COMMENT '地址',
  `ExpressCompanyName` varchar(4000) DEFAULT NULL COMMENT '快递公司',
  `ShipOrderNumber` varchar(4000) DEFAULT NULL COMMENT '快递单号',
  `ShippingDate` datetime DEFAULT NULL COMMENT '发货时间',
  `OrderDate` datetime NOT NULL COMMENT '下单时间',
  `FinishDate` datetime DEFAULT NULL COMMENT '完成时间',
  `TotalIntegral` int(11) DEFAULT NULL COMMENT '积分总价',
  `CloseReason` varchar(200) DEFAULT NULL COMMENT '关闭原因',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='礼物订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_GiftsOrder`
--

LOCK TABLES `Himall_GiftsOrder` WRITE;
/*!40000 ALTER TABLE `Himall_GiftsOrder` DISABLE KEYS */;
INSERT INTO `Himall_GiftsOrder` VALUES (1201510129796357,5,541,NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方','顺丰快递','1111','2015-10-12 14:03:53','2015-10-12 14:02:08','2015-10-12 14:04:09',10,NULL);
/*!40000 ALTER TABLE `Himall_GiftsOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_HandSlideAds`
--

DROP TABLE IF EXISTS `Himall_HandSlideAds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_HandSlideAds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ImageUrl` varchar(100) NOT NULL COMMENT '图片URL',
  `Url` varchar(1000) NOT NULL COMMENT '图片跳转URL',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商城首页手动轮播图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_HandSlideAds`
--

LOCK TABLES `Himall_HandSlideAds` WRITE;
/*!40000 ALTER TABLE `Himall_HandSlideAds` DISABLE KEYS */;
INSERT INTO `Himall_HandSlideAds` VALUES (1,'/Storage/Plat/ImageAd/201411051528182361563.jpg','/',1),(2,'/Storage/Plat/ImageAd/201411051528229582873.jpg','/',2),(3,'/Storage/Plat/ImageAd/201411051528270478945.jpg','/',3),(5,'/Storage/Plat/ImageAd/201411051528364572567.jpg','/',4),(6,'/Storage/Plat/ImageAd/201411051528404527667.jpg','/',5),(7,'/Storage/Plat/ImageAd/201411051528443681324.jpg','/',6),(8,'/Storage/Plat/ImageAd/201411051528483706424.jpg','/',7),(9,'/Storage/Plat/ImageAd/201411051528527222779.jpg','/',8);
/*!40000 ALTER TABLE `Himall_HandSlideAds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_HomeCategories`
--

DROP TABLE IF EXISTS `Himall_HomeCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_HomeCategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RowId` int(11) NOT NULL COMMENT '分类所属行数',
  `CategoryId` bigint(20) NOT NULL COMMENT '分类ID',
  `Depth` int(11) NOT NULL COMMENT '分类深度(最深3）',
  PRIMARY KEY (`Id`),
  KEY `FK_Category_HomeCategory` (`CategoryId`) USING BTREE,
  CONSTRAINT `himall_homecategories_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `Himall_Categories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2481 DEFAULT CHARSET=utf8 COMMENT='商城首页分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_HomeCategories`
--

LOCK TABLES `Himall_HomeCategories` WRITE;
/*!40000 ALTER TABLE `Himall_HomeCategories` DISABLE KEYS */;
INSERT INTO `Himall_HomeCategories` VALUES (1113,4,186,1),(1114,4,152,1),(1115,4,223,3),(1116,4,222,3),(1117,4,221,3),(1118,4,219,3),(1119,4,217,3),(1120,4,216,3),(1121,4,215,3),(1122,4,213,3),(1123,4,211,3),(1124,4,208,3),(1125,4,206,3),(1126,4,204,3),(1127,4,202,3),(1128,4,200,3),(1129,4,198,3),(1130,4,196,3),(1131,4,184,3),(1132,4,182,3),(1133,4,181,3),(2045,9,485,1),(2046,9,520,1),(2047,9,499,3),(2048,9,498,3),(2049,9,497,3),(2050,9,496,3),(2051,9,494,3),(2052,9,491,3),(2053,9,490,3),(2344,2,20,1),(2345,2,150,1),(2346,2,128,3),(2347,2,127,3),(2348,2,126,3),(2349,2,205,3),(2350,2,203,3),(2351,2,201,3),(2352,2,199,3),(2353,2,197,3),(2365,5,338,1),(2366,5,403,1),(2367,5,396,3),(2368,5,394,3),(2369,5,393,3),(2370,5,390,3),(2371,5,388,3),(2372,5,446,3),(2373,5,444,3),(2374,5,442,3),(2375,7,152,1),(2376,7,224,1),(2377,7,176,3),(2378,7,175,3),(2379,7,173,3),(2380,7,171,3),(2381,7,170,3),(2382,7,167,3),(2383,7,166,3),(2384,13,234,1),(2385,13,295,1),(2386,13,293,3),(2387,13,291,3),(2388,13,290,3),(2389,13,288,3),(2390,13,286,3),(2391,13,307,3),(2392,13,304,3),(2393,13,302,3),(2394,13,300,3),(2395,13,298,3),(2396,11,418,1),(2397,11,431,1),(2398,11,495,3),(2399,11,492,3),(2400,11,489,3),(2401,11,488,3),(2402,11,457,3),(2403,11,455,3),(2404,11,453,3),(2405,11,451,3),(2406,12,338,1),(2407,12,399,1),(2408,12,396,3),(2409,12,394,3),(2410,12,393,3),(2411,12,390,3),(2412,12,363,3),(2413,12,362,3),(2414,12,359,3),(2415,12,358,3),(2416,1,312,1),(2417,1,546,1),(2418,1,350,3),(2419,1,348,3),(2420,1,346,3),(2421,1,343,3),(2422,1,342,3),(2423,1,339,3),(2424,1,337,3),(2425,1,336,3),(2426,1,334,3),(2427,1,331,3),(2428,1,330,3),(2429,1,327,3),(2430,3,23,1),(2431,3,26,1),(2432,3,149,3),(2433,3,148,3),(2434,3,147,3),(2435,3,151,3),(2436,3,71,3),(2437,3,70,3),(2438,6,13,1),(2439,6,107,3),(2440,6,106,3),(2441,6,105,3),(2442,6,104,3),(2443,6,103,3),(2444,6,102,3),(2445,6,101,3),(2446,6,100,3),(2447,6,99,3),(2448,6,98,3),(2449,6,54,3),(2450,6,53,3),(2451,8,448,1),(2452,8,483,3),(2453,8,481,3),(2454,8,480,3),(2455,8,478,3),(2456,8,477,3),(2457,8,475,3),(2458,10,546,1),(2459,10,566,3),(2460,10,564,3),(2461,10,563,3),(2462,10,562,3),(2463,10,561,3),(2464,14,150,1),(2465,14,231,3),(2466,14,227,3),(2467,14,225,3),(2468,14,220,3),(2469,14,214,3),(2470,14,212,3),(2471,14,210,3),(2472,14,209,3),(2473,14,205,3),(2474,14,203,3),(2475,14,201,3),(2476,14,199,3),(2477,14,195,3),(2478,14,193,3),(2479,14,190,3),(2480,14,187,3);
/*!40000 ALTER TABLE `Himall_HomeCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_HomeCategoryRows`
--

DROP TABLE IF EXISTS `Himall_HomeCategoryRows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_HomeCategoryRows` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `RowId` int(11) NOT NULL COMMENT '行ID',
  `Image1` varchar(100) NOT NULL COMMENT '所属行推荐图片1',
  `Url1` varchar(100) NOT NULL COMMENT '所属行推荐图片1的URL',
  `Image2` varchar(100) NOT NULL COMMENT '所属行推荐图片2',
  `Url2` varchar(100) NOT NULL COMMENT '所属行推荐图片2的URL',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城首页分类所属行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_HomeCategoryRows`
--

LOCK TABLES `Himall_HomeCategoryRows` WRITE;
/*!40000 ALTER TABLE `Himall_HomeCategoryRows` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_HomeCategoryRows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_HomeFloors`
--

DROP TABLE IF EXISTS `Himall_HomeFloors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_HomeFloors` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `FloorName` varchar(100) NOT NULL COMMENT '楼层名称',
  `SubName` varchar(100) DEFAULT NULL COMMENT '楼层小标题',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '显示顺序',
  `IsShow` tinyint(1) NOT NULL COMMENT '是否显示的首页',
  `StyleLevel` int(10) unsigned NOT NULL COMMENT '楼层所属样式（目前支持2套）',
  `DefaultTabName` varchar(50) DEFAULT NULL COMMENT '楼层的默认tab标题',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='商城首页楼层表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_HomeFloors`
--

LOCK TABLES `Himall_HomeFloors` WRITE;
/*!40000 ALTER TABLE `Himall_HomeFloors` DISABLE KEYS */;
INSERT INTO `Himall_HomeFloors` VALUES (1,'综合商场       ',NULL,8,0,1,'大牌            '),(62,'百货商场     ',NULL,15,0,1,'大牌              '),(65,'服饰广场                ',NULL,1,0,1,'大牌   '),(69,'美容美妆        ',NULL,11,0,1,'大牌        '),(71,'酒水饮料        ','          ',16,1,0,NULL),(72,'服装鞋帽     ',NULL,17,1,1,'热销     ');
/*!40000 ALTER TABLE `Himall_HomeFloors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ImageAds`
--

DROP TABLE IF EXISTS `Himall_ImageAds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ImageAds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `ImageUrl` varchar(100) NOT NULL COMMENT '图片的存放URL',
  `Url` varchar(1000) NOT NULL COMMENT '图片的调整地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1128 DEFAULT CHARSET=utf8 COMMENT='商城首页、店铺首页广告图片表\r\n平台：ShopId为0\r\n商家：shopId就是商家ID';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ImageAds`
--

LOCK TABLES `Himall_ImageAds` WRITE;
/*!40000 ALTER TABLE `Himall_ImageAds` DISABLE KEYS */;
INSERT INTO `Himall_ImageAds` VALUES (1,0,'/Storage/Plat/ImageAd/201510131521396050270.png','/'),(2,0,'/Storage/Plat/ImageAd/201507141113517447420.jpg','/'),(3,0,'/Storage/Plat/ImageAd/201507141113577374740.jpg','/'),(4,0,'/Storage/Plat/ImageAd/201507141114038361740.jpg','/'),(5,0,'/Storage/Plat/ImageAd/201507141114107154480.jpg','/'),(6,0,'/Storage/Plat/ImageAd/201507141114450875180.jpg','/'),(7,0,'/Storage/Plat/ImageAd/201507141114557255630.jpg','/'),(8,0,'/Storage/Plat/ImageAd/201507141115026562490.jpg','/'),(9,0,'/Storage/Plat/ImageAd/201411271925179346361.png','/'),(10,0,'/Storage/Plat/ImageAd/201411051538294152167.jpg','/'),(11,0,'/Storage/Plat/ImageAd/201411051538347344891.jpg','/'),(12,0,'/Storage/Plat/ImageAd/201411051538401142128.jpg','/'),(13,0,'/Storage/Plat/ImageAd/201411271923150932253.jpg','/'),(14,0,'/Storage/Plat/ImageAd/201507141154486858880.jpg','/'),(15,0,'/Storage/Plat/ImageAd/201507141125025515100.jpg','/'),(16,0,'/Storage/Plat/ImageAd/201510101530482189630.jpg','http://demo.himall.kuaidiantong.cn/m-ios/topic/detail/39'),(17,0,'/Storage/Plat/ImageAd/201509171118078648430.jpg',''),(18,0,'/Storage/Plat/ImageAd/201509171118158693010.jpg',''),(19,0,'/Storage/Plat/ImageAd/201509171118225416830.jpg',''),(20,0,'/Storage/Plat/ImageAd/201509171118295840850.jpg',''),(1008,210,'/Storage/Shop/210/ImageAd/201507171802426740310.png','http://192.168.10.69:8080/m-wap/topic/detail/34'),(1009,210,'/Storage/Shop/210/ImageAd/201507171736329809450.jpg','www.baidu.com'),(1010,210,'/Storage/Shop/210/ImageAd/201507171745348966330.jpg','/'),(1011,210,'/Storage/Shop/210/ImageAd/201507171730386625910.jpg','/'),(1016,1,'/Storage/Shop/1/ImageAd/201510131448281713360.jpg','/'),(1017,1,'/Storage/Shop/1/ImageAd/201507201620138599680.png','/'),(1018,1,'/Storage/Shop/1/ImageAd/201507201620212468810.png','/'),(1019,1,'/Storage/Shop/1/ImageAd/201507201718002001580.png','/'),(1024,215,'',''),(1025,215,'',''),(1026,215,'',''),(1027,215,'',''),(1048,223,'',''),(1049,223,'',''),(1050,223,'',''),(1051,223,'',''),(1080,238,'',''),(1081,238,'',''),(1082,238,'',''),(1083,238,'',''),(1084,240,'',''),(1085,240,'',''),(1086,240,'',''),(1087,240,'',''),(1088,236,'',''),(1089,236,'',''),(1090,236,'',''),(1091,236,'',''),(1092,233,'',''),(1093,233,'',''),(1094,233,'',''),(1095,233,'',''),(1096,242,'',''),(1097,242,'',''),(1098,242,'',''),(1099,242,'',''),(1100,237,'',''),(1101,237,'',''),(1102,237,'',''),(1103,237,'',''),(1104,245,'/Storage/Shop/245/ImageAd/201510131513529440800.JPG','/'),(1105,245,'/Storage/Shop/245/ImageAd/201510131514447237270.jpg','/'),(1106,245,'/Storage/Shop/245/ImageAd/201510131520132658260.jpg','/'),(1107,245,'/Storage/Shop/245/ImageAd/201510131520267874220.png','/'),(1108,232,'',''),(1109,232,'',''),(1110,232,'',''),(1111,232,'',''),(1112,235,'',''),(1113,235,'',''),(1114,235,'',''),(1115,235,'',''),(1116,247,'',''),(1117,247,'',''),(1118,247,'',''),(1119,247,'',''),(1120,248,'',''),(1121,248,'',''),(1122,248,'',''),(1123,248,'',''),(1124,249,'',''),(1125,249,'',''),(1126,249,'',''),(1127,249,'','');
/*!40000 ALTER TABLE `Himall_ImageAds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_InviteRecord`
--

DROP TABLE IF EXISTS `Himall_InviteRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_InviteRecord` (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '用户名',
  `RegName` varchar(100) NOT NULL COMMENT '邀请的用户',
  `InviteIntegral` int(11) NOT NULL COMMENT '邀请获得的积分',
  `RegIntegral` int(11) DEFAULT NULL COMMENT '被邀请获得的积分',
  `RegTime` datetime DEFAULT NULL COMMENT '注册时间',
  `UserId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `RegUserId` bigint(20) DEFAULT NULL COMMENT '被邀请的用户ID',
  `RecordTime` datetime DEFAULT NULL COMMENT '获得积分时间',
  PRIMARY KEY (`Id`),
  KEY `InviteMember` (`UserId`),
  KEY `RegMember` (`RegUserId`),
  CONSTRAINT `InviteMember` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `RegMember` FOREIGN KEY (`RegUserId`) REFERENCES `Himall_Members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_InviteRecord`
--

LOCK TABLES `Himall_InviteRecord` WRITE;
/*!40000 ALTER TABLE `Himall_InviteRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_InviteRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_InviteRule`
--

DROP TABLE IF EXISTS `Himall_InviteRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_InviteRule` (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `InviteIntegral` int(11) DEFAULT NULL COMMENT '邀请能获得的积分',
  `RegIntegral` int(11) DEFAULT NULL COMMENT '被邀请能获得的积分',
  `ShareTitle` varchar(100) DEFAULT NULL COMMENT '分享标题',
  `ShareDesc` varchar(1000) DEFAULT NULL COMMENT '分享详细',
  `ShareIcon` varchar(200) DEFAULT NULL COMMENT '分享图标',
  `ShareRule` varchar(1000) DEFAULT NULL COMMENT '分享规则',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_InviteRule`
--

LOCK TABLES `Himall_InviteRule` WRITE;
/*!40000 ALTER TABLE `Himall_InviteRule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_InviteRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_InvoiceContext`
--

DROP TABLE IF EXISTS `Himall_InvoiceContext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_InvoiceContext` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL COMMENT '发票名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='发票表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_InvoiceContext`
--

LOCK TABLES `Himall_InvoiceContext` WRITE;
/*!40000 ALTER TABLE `Himall_InvoiceContext` DISABLE KEYS */;
INSERT INTO `Himall_InvoiceContext` VALUES (35,'图书'),(37,'明细');
/*!40000 ALTER TABLE `Himall_InvoiceContext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_InvoiceTitle`
--

DROP TABLE IF EXISTS `Himall_InvoiceTitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_InvoiceTitle` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `Name` varchar(200) DEFAULT NULL COMMENT '抬头名称',
  `IsDefault` tinyint(4) NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='发票抬头表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_InvoiceTitle`
--

LOCK TABLES `Himall_InvoiceTitle` WRITE;
/*!40000 ALTER TABLE `Himall_InvoiceTitle` DISABLE KEYS */;
INSERT INTO `Himall_InvoiceTitle` VALUES (5,331,'单位',0),(6,331,'发票抬头',0),(8,331,'商业发票',0),(11,577,'df ',0),(13,541,'长沙海商',0),(16,541,'55',0),(17,541,'123',0);
/*!40000 ALTER TABLE `Himall_InvoiceTitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_LimitTimeMarket`
--

DROP TABLE IF EXISTS `Himall_LimitTimeMarket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_LimitTimeMarket` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL COMMENT '标题',
  `ProductId` bigint(20) NOT NULL,
  `ProductName` varchar(100) NOT NULL COMMENT '商品名称',
  `CategoryName` varchar(100) NOT NULL COMMENT '分类名称',
  `AuditStatus` smallint(6) NOT NULL COMMENT '审核状态',
  `AuditTime` datetime NOT NULL COMMENT '审核时间',
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `Price` decimal(18,2) NOT NULL COMMENT '价格',
  `RecentMonthPrice` decimal(18,2) NOT NULL COMMENT '最近一个月的价格',
  `StartTime` datetime NOT NULL COMMENT '开始日期',
  `EndTime` datetime NOT NULL COMMENT '结束日期',
  `Stock` int(11) NOT NULL COMMENT '库存',
  `SaleCount` int(11) NOT NULL COMMENT '销售数量',
  `CancelReson` text NOT NULL COMMENT '取消原因',
  `MaxSaleCount` int(11) NOT NULL COMMENT '限量购买',
  `ProductAd` varchar(100) NOT NULL COMMENT '商品广告',
  `MinPrice` decimal(18,2) NOT NULL COMMENT '最小价格',
  `ImagePath` varchar(100) NOT NULL COMMENT '图片Path',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='限时购表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_LimitTimeMarket`
--

LOCK TABLES `Himall_LimitTimeMarket` WRITE;
/*!40000 ALTER TABLE `Himall_LimitTimeMarket` DISABLE KEYS */;
INSERT INTO `Himall_LimitTimeMarket` VALUES (54,'限时折扣',301,'地方第三方倒萨','服装',2,'2015-10-08 16:25:14',1,'官方自营店',20.00,100.00,'2015-10-08 00:00:00','2015-10-11 16:20:33',0,1,'',3,'斯蒂芬斯蒂芬d\'s',100.00,'/Storage/Shop/1/Products/301'),(55,'限时折扣',230,'Canon/佳能700d 18-55 stm套机700D小套 佳能入门单反相机 包邮','电器',1,'2015-10-10 00:00:00',1,'官方自营店',0.10,3499.00,'2015-10-10 00:00:00','2015-10-11 09:25:33',0,0,'',1,'普及型单反 全新正品行货 机打发票 全国联保',3499.00,'/Storage/Shop/1/Products/230'),(56,'限时折扣',301,'地方第三方倒萨','服装',2,'2015-10-12 13:28:48',1,'官方自营店',10.00,20.00,'2015-10-12 00:00:00','2015-10-15 13:25:14',0,0,'',1,'斯蒂芬斯蒂芬d\'s',100.00,'/Storage/Shop/1/Products/301'),(57,'限时折扣',302,'电相机','家电',1,'2015-10-12 00:00:00',1,'官方自营店',0.01,0.01,'2015-10-12 00:00:00','2015-10-14 11:35:53',0,0,'',2,'放电的感觉',0.01,'/Storage/Shop/1/Products/302'),(58,'限时折扣',307,'aaa','服装',2,'2015-10-13 12:22:54',1,'官方自营店',100.00,111.00,'2015-10-13 00:00:00','2015-10-22 09:05:09',0,0,'',1,'',111.00,'/Storage/Shop/1/Products/307'),(59,'测试活动',306,'爱丁堡酒店','服装',2,'2015-10-13 13:37:57',1,'官方自营店',95.00,100.00,'2015-10-13 00:00:00','2015-10-31 00:00:27',0,0,'',2,'都干点啥风格',100.00,'/Storage/Shop/1/Products/306'),(60,'限时折扣',313,'平头螺丝','服装',5,'2015-10-14 11:03:51',247,'数码旗舰店',0.01,0.01,'2015-10-14 00:00:00','2015-10-30 10:55:33',0,0,'已被管理员取消',3,'',0.10,'/Storage/Shop/247/Products/313');
/*!40000 ALTER TABLE `Himall_LimitTimeMarket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Logs`
--

DROP TABLE IF EXISTS `Himall_Logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Logs` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `PageUrl` varchar(1000) NOT NULL,
  `Date` datetime NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `IPAddress` varchar(100) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3339 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Logs`
--

LOCK TABLES `Himall_Logs` WRITE;
/*!40000 ALTER TABLE `Himall_Logs` DISABLE KEYS */;
INSERT INTO `Himall_Logs` VALUES (3220,1,'/Product/SaveProductDetail','2015-10-08 16:19:55','selleradmin','222.240.184.122','商家发布商品，名称=地方第三方倒萨'),(3221,0,'product/BatchAudit','2015-10-08 16:23:40','admin','222.240.184.122','批量审核商品状态,操作记录:'),(3222,0,'LimitTimeBuy/AuditItem','2015-10-08 16:25:14','admin','222.240.184.122','审核商品状态,操作记录:'),(3223,1,'/Category/UpdateName','2015-10-08 17:43:23','selleradmin','118.113.216.13','修改店铺分类名称，Id=1,名称=男士专区'),(3224,1,'/Category/UpdateName','2015-10-08 17:43:32','selleradmin','118.113.216.13','修改店铺分类名称，Id=1,名称=男士专区'),(3225,1,'Manager/Add','2015-10-09 09:36:47','selleradmin','222.240.184.122','添加卖家子帐号,操作记录:'),(3226,1,'Manager/Delete','2015-10-09 09:36:53','selleradmin','222.240.184.122','删除卖家子帐号,操作记录:'),(3227,1,'/Product/SaveProductDetail','2015-10-09 14:44:41','selleradmin','118.249.115.31','商家发布商品，名称=电相机'),(3228,0,'product/BatchAudit','2015-10-09 14:45:19','admin','118.249.115.31','批量审核商品状态,操作记录:'),(3229,1,'/Product/SaveProductDetail','2015-10-09 15:32:04','selleradmin','222.240.184.122','商家发布商品，名称=电相机'),(3230,0,'Category/Add','2015-10-10 11:30:26','admin','222.240.184.122','添加平台分类,操作记录:'),(3231,1,'/Category/UpdateName','2015-10-10 14:52:02','selleradmin','113.247.250.222','修改店铺分类名称，Id=1,名称=男士专区'),(3232,1,'ShopHomeModule/SaveShopModuleProducts','2015-10-10 14:59:50','selleradmin','113.247.250.222','添加商品模块,操作记录:'),(3233,0,'/Shop/Auditing/232','2015-10-10 15:25:55','admin','222.240.184.122','开店审核页面，店铺Id=232,状态为：WaitPay, 说明是：'),(3234,0,'/Shop/Auditing/232','2015-10-10 15:26:38','admin','222.240.184.122','开店审核页面，店铺Id=232,状态为：Open, 说明是：'),(3235,0,'/Shop/Auditing/233','2015-10-10 15:29:32','admin','222.240.184.122','开店审核页面，店铺Id=233,状态为：WaitPay, 说明是：'),(3236,0,'/Shop/Auditing/233','2015-10-10 15:29:48','admin','222.240.184.122','开店审核页面，店铺Id=233,状态为：Open, 说明是：'),(3237,0,'/Shop/Auditing/235','2015-10-10 15:36:09','admin','222.240.184.122','开店审核页面，店铺Id=235,状态为：WaitPay, 说明是：'),(3238,0,'/Shop/Auditing/235','2015-10-10 15:37:42','admin','222.240.184.122','开店审核页面，店铺Id=235,状态为：Open, 说明是：'),(3239,0,'/Shop/Auditing/236','2015-10-10 15:46:16','admin','222.240.184.122','开店审核页面，店铺Id=236,状态为：WaitPay, 说明是：'),(3240,0,'/Shop/Auditing/236','2015-10-10 15:47:02','admin','222.240.184.122','开店审核页面，店铺Id=236,状态为：Open, 说明是：'),(3241,0,'/Shop/Auditing/237','2015-10-10 15:52:47','admin','222.240.184.122','开店审核页面，店铺Id=237,状态为：WaitPay, 说明是：'),(3242,0,'/Shop/Auditing/237','2015-10-10 15:53:07','admin','222.240.184.122','开店审核页面，店铺Id=237,状态为：Open, 说明是：'),(3243,0,'/Shop/Auditing/238','2015-10-10 15:59:09','admin','222.240.184.122','开店审核页面，店铺Id=238,状态为：WaitPay, 说明是：'),(3244,0,'/Shop/Auditing/238','2015-10-10 16:00:08','admin','222.240.184.122','开店审核页面，店铺Id=238,状态为：Open, 说明是：'),(3245,0,'/Shop/Auditing/240','2015-10-11 14:32:34','HimallDemoUser','113.247.250.222','开店审核页面，店铺Id=240,状态为：WaitPay, 说明是：'),(3246,0,'/Shop/Auditing/240','2015-10-11 14:54:24','HimallDemoUser','113.247.250.222','开店审核页面，店铺Id=240,状态为：Open, 说明是：'),(3247,1,'/Product/SaveProductDetail','2015-10-12 12:46:21','selleradmin','223.148.245.200','商家发布商品，名称=电相机'),(3248,0,'LimitTimeBuy/AuditItem','2015-10-12 13:28:48','HimallDemoUser','61.183.19.54','审核商品状态,操作记录:'),(3249,0,'Gift/SendGift','2015-10-12 14:03:53','HimallDemoUser','61.183.19.54','礼品订单发货,操作记录:'),(3250,1,'/Product/SaveProductDetail','2015-10-12 15:00:55','selleradmin','58.20.97.195','商家发布商品，名称=爱丽斯顿酒店'),(3251,0,'product/BatchAudit','2015-10-12 15:01:32','HimallDemoUser','58.20.97.195','批量审核商品状态,操作记录:'),(3252,1,'/Category/CreateCategory','2015-10-12 15:21:10','selleradmin','58.20.97.195','创建店铺分类，父Id=0'),(3253,1,'/Category/CreateCategory','2015-10-12 15:21:26','selleradmin','58.20.97.195','创建店铺分类，父Id=318'),(3254,1,'/Category/CreateCategory','2015-10-12 15:21:36','selleradmin','58.20.97.195','创建店铺分类，父Id=318'),(3255,1,'/Category/UpdateName','2015-10-12 15:21:40','selleradmin','58.20.97.195','修改店铺分类名称，Id=318,名称=酒店'),(3256,1,'/Category/UpdateName','2015-10-12 15:21:48','selleradmin','58.20.97.195','修改店铺分类名称，Id=1,名称=男士专区'),(3257,1,'/Category/CreateCategory','2015-10-12 15:25:05','selleradmin','58.20.97.195','创建店铺分类，父Id=318'),(3258,1,'/Category/CreateCategory','2015-10-12 15:27:26','selleradmin','58.20.97.195','创建店铺分类，父Id=0'),(3259,1,'/Category/CreateCategory','2015-10-12 15:27:36','selleradmin','58.20.97.195','创建店铺分类，父Id=322'),(3260,0,'/ProductType/SaveModel','2015-10-12 15:32:12','HimallDemoUser','58.20.97.195','修改平台类目，Id=0'),(3261,0,'/ProductType/SaveModel','2015-10-12 15:37:19','HimallDemoUser','58.20.97.195','修改平台类目，Id=73'),(3262,0,'Category/Add','2015-10-12 15:40:21','HimallDemoUser','58.20.97.195','添加平台分类,操作记录:'),(3263,0,'Category/Add','2015-10-12 15:41:10','HimallDemoUser','58.20.97.195','添加平台分类,操作记录:'),(3264,0,'Category/Add','2015-10-12 15:42:42','HimallDemoUser','58.20.97.195','添加平台分类,操作记录:'),(3265,1,'/Product/SaveProductDetail','2015-10-12 15:45:10','selleradmin','58.20.97.195','商家发布商品，名称=爱丽斯顿酒店'),(3266,1,'/Product/SaveProductDetail','2015-10-12 15:51:21','selleradmin','58.20.97.195','商家发布商品，名称=爱丽斯顿酒店'),(3267,1,'/Product/SaveProductDetail','2015-10-12 16:32:30','selleradmin','58.20.97.195','商家发布商品，名称=爱丁堡酒店'),(3268,0,'product/BatchAudit','2015-10-12 16:33:21','HimallDemoUser','58.20.97.195','批量审核商品状态,操作记录:'),(3269,0,'/ProductType/SaveModel','2015-10-12 16:35:20','HimallDemoUser','58.20.97.195','修改平台类目，Id=73'),(3270,1,'/Product/SaveProductDetail','2015-10-12 16:36:37','selleradmin','58.20.97.195','商家发布商品，名称=爱丁堡酒店'),(3271,0,'product/BatchAudit','2015-10-12 20:34:36','HimallDemoUser','117.27.182.238','批量审核商品状态,操作记录:'),(3272,0,'product/BatchAudit','2015-10-13 10:52:36','HimallDemoUser','202.98.203.187','批量审核商品状态,操作记录:'),(3273,1,'/Product/SaveProductDetail','2015-10-13 11:00:20','selleradmin','202.98.203.187','商家发布商品，名称=aaa'),(3274,0,'product/BatchAudit','2015-10-13 11:24:39','HimallDemoUser','202.98.203.187','批量审核商品状态,操作记录:'),(3275,0,'LimitTimeBuy/AuditItem','2015-10-13 12:22:54','HimallDemoUser','202.98.203.187','审核商品状态,操作记录:'),(3276,0,'LimitTimeBuy/AuditItem','2015-10-13 13:37:57','HimallDemoUser','222.240.184.122','审核商品状态,操作记录:'),(3277,1,'/Product/SaveProductDetail','2015-10-13 13:59:51','selleradmin','36.40.189.15','商家发布商品，名称=aaa'),(3278,0,'Category/Add','2015-10-13 14:46:48','HimallDemoUser','202.98.203.187','添加平台分类,操作记录:'),(3279,0,'/Shop/Auditing/245','2015-10-13 15:04:13','HimallDemoUser','222.240.184.122','开店审核页面，店铺Id=245,状态为：WaitPay, 说明是：'),(3280,0,'/Shop/Auditing/245','2015-10-13 15:06:58','HimallDemoUser','222.240.184.122','开店审核页面，店铺Id=245,状态为：Open, 说明是：'),(3281,245,'/Category/CreateCategory','2015-10-13 15:07:50','测试33','222.240.184.122','创建店铺分类，父Id=0'),(3282,245,'/Category/CreateCategory','2015-10-13 15:08:03','测试33','222.240.184.122','创建店铺分类，父Id=324'),(3283,245,'brand/Apply','2015-10-13 15:08:23','测试33','222.240.184.122','申请品牌,操作记录:'),(3284,245,'/Product/SaveProductDetail','2015-10-13 15:12:30','测试33','222.240.184.122','商家发布商品，名称=cscscs'),(3285,0,'product/BatchAudit','2015-10-13 15:12:46','HimallDemoUser','222.240.184.122','批量审核商品状态,操作记录:'),(3286,1,'/Product/SaveProductDetail','2015-10-13 15:18:36','selleradmin','222.240.184.122','商家发布商品，名称=香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S'),(3287,1,'/Category/UpdateName','2015-10-13 15:26:46','selleradmin','111.4.122.8','修改店铺分类名称，Id=39,名称=箱包'),(3288,1,'/Category/UpdateName','2015-10-13 15:26:47','selleradmin','111.4.122.8','修改店铺分类名称，Id=1,名称=男士专区'),(3289,1,'/Category/UpdateName','2015-10-13 15:26:51','selleradmin','111.4.122.8','修改店铺分类名称，Id=1,名称=男士专区'),(3290,0,'product/BatchAudit','2015-10-13 15:27:05','HimallDemoUser','218.201.212.211','批量审核商品状态,操作记录:'),(3291,245,'ShopHomeModule/SaveShopModuleProducts','2015-10-13 15:30:16','测试33','222.240.184.122','添加商品模块,操作记录:'),(3292,0,'/Shop/Auditing/242','2015-10-13 15:31:55','HimallDemoUser','218.201.212.211','开店审核页面，店铺Id=242,状态为：WaitPay, 说明是：'),(3293,1,'/Product/SaveProductDetail','2015-10-13 15:32:55','selleradmin','36.40.184.55','商家发布商品，名称=爱丁堡酒店'),(3294,1,'/Product/BatchSaleOff','2015-10-13 15:36:16','selleradmin','218.201.212.211','商家商品批量下架，Ids=308'),(3295,1,'/Product/SaveProductDetail','2015-10-13 18:16:55','selleradmin','222.240.184.122','商家发布商品，名称=sji '),(3296,1,'/Product/BatchSaleOff','2015-10-13 18:17:02','selleradmin','222.240.184.122','商家商品批量下架，Ids=305'),(3297,1,'/Category/CreateCategory','2015-10-13 18:17:26','selleradmin','222.240.184.122','创建店铺分类，父Id=0'),(3298,1,'/Category/CreateCategory','2015-10-13 18:17:32','selleradmin','222.240.184.122','创建店铺分类，父Id=326'),(3299,1,'brand/Apply','2015-10-13 18:18:07','selleradmin','222.240.184.122','申请品牌,操作记录:'),(3300,0,'product/BatchAudit','2015-10-13 18:20:00','HimallDemoUser','222.240.184.122','批量审核商品状态,操作记录:'),(3301,0,'Gift/Edit','2015-10-13 18:31:47','HimallDemoUser','222.240.184.122','操作礼品信息,操作记录:'),(3302,1,'Manager/Add','2015-10-13 18:47:04','selleradmin','222.240.184.122','添加卖家子帐号,操作记录:'),(3303,1,'Privilege/Edit','2015-10-13 20:22:11','selleradmin','119.39.19.247','编辑商家权限组,操作记录:'),(3304,1,'/Category/DeleteCategoryById','2015-10-14 09:05:17','selleradmin','111.4.122.8','删除店铺分类，Id=326'),(3305,1,'/Category/CreateCategory','2015-10-14 09:05:38','selleradmin','111.4.122.8','创建店铺分类，父Id=0'),(3306,1,'/Category/CreateCategory','2015-10-14 09:05:52','selleradmin','111.4.122.8','创建店铺分类，父Id=0'),(3307,1,'/Category/DeleteCategoryById','2015-10-14 09:07:46','selleradmin','111.4.122.8','删除店铺分类，Id=329'),(3308,1,'/Category/DeleteCategoryById','2015-10-14 09:07:51','selleradmin','111.4.122.8','删除店铺分类，Id=328'),(3309,1,'brand/Apply','2015-10-14 09:26:12','selleradmin','111.4.122.8','申请品牌,操作记录:'),(3310,0,'/Shop/Auditing/247','2015-10-14 09:32:29','admin','113.247.250.222','开店审核页面，店铺Id=247,状态为：WaitPay, 说明是：'),(3311,0,'/Shop/Auditing/247','2015-10-14 09:36:11','admin','113.247.250.222','开店审核页面，店铺Id=247,状态为：Open, 说明是：'),(3312,0,'/ProductType/SaveModel','2015-10-14 09:42:28','admin','113.247.250.222','修改平台类目，Id=0'),(3313,0,'/ProductType/SaveModel','2015-10-14 09:42:39','admin','113.247.250.222','修改平台类目，Id=74'),(3314,0,'Category/Add','2015-10-14 09:43:05','admin','113.247.250.222','添加平台分类,操作记录:'),(3315,0,'Category/Add','2015-10-14 09:43:37','admin','113.247.250.222','添加平台分类,操作记录:'),(3316,0,'Category/Add','2015-10-14 09:43:49','admin','113.247.250.222','添加平台分类,操作记录:'),(3317,1,'/Product/SaveProductDetail','2015-10-14 09:48:41','selleradmin','113.247.250.222','商家发布商品，名称=平头螺丝'),(3318,0,'product/BatchAudit','2015-10-14 09:52:08','admin','113.247.250.222','批量审核商品状态,操作记录:'),(3319,1,'ShopHomeModule/Delelte','2015-10-14 10:03:12','selleradmin','218.28.40.210','删除商品模块,操作记录:'),(3320,247,'/Product/SaveProductDetail','2015-10-14 10:03:17','quentin','113.247.250.222','商家发布商品，名称=平头螺丝'),(3321,0,'product/BatchAudit','2015-10-14 10:03:24','admin','113.247.250.222','批量审核商品状态,操作记录:'),(3322,247,'/Product/SaveProductDetail','2015-10-14 10:08:54','quentin','113.247.250.222','商家发布商品，名称=平头螺丝'),(3323,247,'/Product/SaveProductDetail','2015-10-14 10:56:03','quentin','113.247.250.222','商家发布商品，名称=平头螺丝'),(3324,247,'/Product/SaveProductDetail','2015-10-14 10:56:27','quentin','113.247.250.222','商家发布商品，名称=平头螺丝'),(3325,0,'LimitTimeBuy/AuditItem','2015-10-14 10:57:40','admin','113.247.250.222','审核商品状态,操作记录:'),(3326,1,'/Category/CreateCategory','2015-10-14 14:15:35','selleradmin','202.98.203.187','创建店铺分类，父Id=0'),(3327,1,'/Category/UpdateName','2015-10-14 14:16:28','selleradmin','202.98.203.187','修改店铺分类名称，Id=330,名称=毛线11111111111'),(3328,1,'brand/Apply','2015-10-14 14:19:09','selleradmin','202.98.203.187','申请品牌,操作记录:'),(3329,1,'brand/Apply','2015-10-14 14:19:12','selleradmin','202.98.203.187','申请品牌,操作记录:'),(3330,1,'brand/Apply','2015-10-14 14:19:16','selleradmin','202.98.203.187','申请品牌,操作记录:'),(3331,0,'product/BatchAudit','2015-10-14 15:25:26','HimallDemoUser','202.98.203.187','批量审核商品状态,操作记录:'),(3332,0,'product/BatchAudit','2015-10-14 15:25:30','HimallDemoUser','202.98.203.187','批量审核商品状态,操作记录:'),(3333,1,'/Product/SaveProductDetail','2015-10-14 15:43:00','selleradmin','58.20.97.195','商家发布商品，名称=马尔代夫大酒店'),(3334,0,'product/BatchAudit','2015-10-14 15:43:09','HimallDemoUser','58.20.97.195','批量审核商品状态,操作记录:'),(3335,0,'/Shop/Auditing/248','2015-10-14 16:56:02','HimallDemoUser','175.8.225.82','开店审核页面，店铺Id=248,状态为：WaitPay, 说明是：'),(3336,0,'/Shop/Auditing/248','2015-10-14 16:58:14','HimallDemoUser','175.8.225.82','开店审核页面，店铺Id=248,状态为：Open, 说明是：'),(3337,0,'/Shop/Auditing/249','2015-10-14 17:06:23','HimallDemoUser','222.240.184.122','开店审核页面，店铺Id=249,状态为：WaitPay, 说明是：'),(3338,0,'/Shop/Auditing/249','2015-10-14 17:07:04','HimallDemoUser','222.240.184.122','开店审核页面，店铺Id=249,状态为：Open, 说明是：');
/*!40000 ALTER TABLE `Himall_Logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Managers`
--

DROP TABLE IF EXISTS `Himall_Managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Managers` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `RoleId` bigint(20) NOT NULL COMMENT '角色ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `Password` varchar(100) NOT NULL COMMENT '密码',
  `PasswordSalt` varchar(100) NOT NULL COMMENT '密码加盐',
  `CreateDate` datetime NOT NULL COMMENT '创建日期',
  `Remark` varchar(1000) DEFAULT NULL,
  `RealName` varchar(1000) DEFAULT NULL COMMENT '真实名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='管理员表，平台和商家的管理员都放在这张表，平台管理员的ShopId为0 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Managers`
--

LOCK TABLES `Himall_Managers` WRITE;
/*!40000 ALTER TABLE `Himall_Managers` DISABLE KEYS */;
INSERT INTO `Himall_Managers` VALUES (287,1,0,'selleradmin','4287bb9b059597a21d411d0423b26d04','432fa30b-c134-43a4-9f40-f56b86fd0a4a','2015-10-08 15:31:43',NULL,NULL),(288,0,0,'admin','bdf3feaea442a01e0e830a511672f1fb','74865e95-8dbf-4d00-a1b4-b79bf0abb07f','2015-10-08 15:31:43',NULL,NULL),(289,0,3,'admin1','828b3806b650060a043b8f6ccba150b2','96dbec68-f78f-4369-917d-2cb36e59e8f2','2015-10-08 17:38:01',NULL,NULL),(290,0,3,'HimallDemoUser','cbb56467222e926257271b57ca2f6f8e','96c90ee1-5560-43b7-957e-1fa1b69861b1','2015-10-08 17:41:18',NULL,NULL),(291,229,0,'杨炎雪你好','781ad8d4fcca9bf524206061fb13777f','4ac7834debcb84d0422a','2015-10-09 09:16:25',NULL,NULL),(293,230,0,'banana','9b9f927a18c2f3ced9963b47a32e2a77','48429086c5185af0123c','2015-10-09 14:54:41',NULL,NULL),(294,231,0,'123l','3931d84cd5284fb3164d39b2e99683f9','4886b35aff80ca2d04fe','2015-10-10 13:19:59',NULL,NULL),(295,232,0,'zz123','e48b6607e9b5f7cc3dfa222a454a7aa7','4b32a1dddd9a9d398a0e','2015-10-10 15:18:03',NULL,NULL),(296,233,0,'zlsq1989','b688a620877c95d91be7008203d5c582','41619ebc9961e0fd32aa','2015-10-10 15:27:43',NULL,NULL),(297,234,0,'cici','147cf6dcd9d2772f06ec741da843a641','49eaaa8cdb6feb29d12f','2015-10-10 15:29:04',NULL,NULL),(298,235,0,'zz124','3f41dc197751422dbdfbb1c0d05a1d0a','419c98b6d69eea96952f','2015-10-10 15:33:51',NULL,NULL),(299,236,0,'zz125','c0c672c0aad3a8fcfd6596018679fe6a','4b0a820b2a6e949b273c','2015-10-10 15:43:32',NULL,NULL),(300,237,0,'zz126','2c93bcd84301244e16597da74b4181d2','4b83ad36b79c09c686c1','2015-10-10 15:49:40',NULL,NULL),(301,238,0,'zz127','f9b9b6889e66647c52c406e196209436','46b49ac86debc6644582','2015-10-10 15:56:58',NULL,NULL),(302,239,0,'test','30c54ba05a629247212bd85b21a32adb','42e08cc981f3cec544a7','2015-10-10 22:34:25',NULL,NULL),(303,240,0,'xiao','d2d1e387f469a6a33a57238d53af1636','4ba9933347b8ed5829e6','2015-10-11 14:17:48',NULL,NULL),(304,241,0,'w123456','a87f329e094c9fcb55f0c2cd11bc1d6a','4740b0a472a44cf5a7d3','2015-10-11 16:48:20',NULL,NULL),(305,242,0,'bbaiw','f1878f4ab03030b8a11633548faa81e9','45b7b05ba5aa20587798','2015-10-11 23:31:42',NULL,NULL),(306,243,0,'lanhama','7550aa98b19d03b3f04979328ae1462a','400bb0762f369bdbd143','2015-10-12 10:35:16',NULL,NULL),(307,244,0,'jiangbonf','861f34a17377411005926e154dd217c2','4f2fa2ea0f811fde259e','2015-10-12 17:50:45',NULL,NULL),(308,245,0,'测试33','fb9c324aca17617a367372c7b7db4420','425b99de53dadc7671b1','2015-10-13 14:59:53',NULL,NULL),(309,246,0,'zsl5566','de89a46afbe4ea10dfd37044af7d781a','4fdaa3439b91f6db97d3','2015-10-13 16:50:53',NULL,NULL),(310,1,4,'selleradmin:测试123','fea77d1c25333a78f1d9ace26a699791','3770e6da-c1ba-4cfc-9a96-4166b35675ca','2015-10-13 18:47:04',NULL,'测试'),(311,247,0,'quentin','8d2cd1433c3a6f03dda7bcb400e86042','4f9e959affd7c0ceb00b','2015-10-14 09:23:57',NULL,NULL),(312,248,0,'wensicarter2','0698944753cb7b3b6eb02c79b0797850','4817922a1083f539a14a','2015-10-14 16:32:53',NULL,NULL),(313,249,0,'1121','2fe3c74b49015b26c07156d906221fc5','4a6392f142f0da42603e','2015-10-14 17:02:04',NULL,NULL);
/*!40000 ALTER TABLE `Himall_Managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MarketServiceRecord`
--

DROP TABLE IF EXISTS `Himall_MarketServiceRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MarketServiceRecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MarketServiceId` bigint(20) NOT NULL,
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `SettlementFlag` int(16) unsigned zerofill NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_MarketServiceRecord_Himall_ActiveMarketService` (`MarketServiceId`) USING BTREE,
  CONSTRAINT `himall_marketservicerecord_ibfk_1` FOREIGN KEY (`MarketServiceId`) REFERENCES `Himall_ActiveMarketService` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='营销服务购买记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MarketServiceRecord`
--

LOCK TABLES `Himall_MarketServiceRecord` WRITE;
/*!40000 ALTER TABLE `Himall_MarketServiceRecord` DISABLE KEYS */;
INSERT INTO `Himall_MarketServiceRecord` VALUES (10,9,'2015-06-30 00:00:00','2016-04-30 19:24:08',0000000000000001),(12,11,'2015-07-01 00:00:00','2016-05-01 08:44:07',0000000000000001),(15,14,'2015-07-07 00:00:00','2034-01-07 08:28:55',0000000000000000),(16,15,'2015-07-08 00:00:00','2015-08-08 16:22:24',0000000000000001),(17,11,'2016-05-01 08:44:07','2016-06-01 08:44:07',0000000000000001),(18,16,'2015-07-09 00:00:00','2015-08-09 15:36:43',0000000000000001),(20,18,'2015-07-13 00:00:00','2015-08-13 11:28:25',0000000000000001),(21,11,'2016-06-01 08:44:07','2017-04-01 08:44:07',0000000000000001),(22,9,'2016-04-30 19:24:08','2016-05-30 19:24:08',0000000000000001),(28,21,'2015-07-16 00:00:00','2015-08-16 14:04:31',0000000000000001),(30,23,'2015-07-20 00:00:00','2015-10-20 11:02:04',0000000000000000),(58,16,'2015-08-09 15:36:43','2015-10-09 15:36:43',0000000000000001),(59,16,'2015-10-09 15:36:43','2015-11-09 15:36:43',0000000000000001),(60,39,'2015-10-09 00:00:00','2016-08-09 09:48:07',0000000000000001),(61,40,'2015-10-09 00:00:00','2016-08-09 14:16:51',0000000000000001),(62,21,'2015-08-16 14:04:31','2015-10-16 14:04:31',0000000000000001),(63,21,'2015-10-16 14:04:31','2015-12-16 14:04:31',0000000000000001),(64,41,'2015-10-10 00:00:00','2016-10-10 15:30:10',0000000000000000),(65,42,'2015-10-10 00:00:00','2016-10-10 15:31:53',0000000000000000),(66,43,'2015-10-10 00:00:00','2026-01-10 15:38:10',0000000000000000),(67,44,'2015-10-10 00:00:00','2042-07-10 15:47:12',0000000000000000),(68,45,'2015-10-10 00:00:00','2017-08-10 15:53:22',0000000000000000),(69,46,'2015-10-10 00:00:00','2017-08-10 16:00:18',0000000000000000),(70,47,'2015-10-11 00:00:00','2015-11-11 15:24:11',0000000000000000),(71,40,'2016-08-09 14:16:51','2016-09-09 14:16:51',0000000000000001),(72,16,'2015-11-09 15:36:43','2015-12-09 15:36:43',0000000000000001),(73,21,'2015-12-16 14:04:31','2016-01-16 14:04:31',0000000000000001),(74,40,'2016-09-09 14:16:51','2017-07-09 14:16:51',0000000000000001),(75,48,'2015-10-14 00:00:00','2015-12-14 10:53:05',0000000000000000),(76,48,'2015-12-14 10:53:05','2016-01-14 10:53:05',0000000000000000),(77,49,'2015-10-14 00:00:00','2015-11-14 11:00:35',0000000000000000),(78,50,'2015-10-14 00:00:00','2015-11-14 11:15:35',0000000000000000);
/*!40000 ALTER TABLE `Himall_MarketServiceRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MarketSetting`
--

DROP TABLE IF EXISTS `Himall_MarketSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MarketSetting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL COMMENT '营销类型ID',
  `Price` decimal(18,0) NOT NULL COMMENT '营销使用价格（/月）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='营销补充表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MarketSetting`
--

LOCK TABLES `Himall_MarketSetting` WRITE;
/*!40000 ALTER TABLE `Himall_MarketSetting` DISABLE KEYS */;
INSERT INTO `Himall_MarketSetting` VALUES (5,1,2),(6,2,2),(9,3,10),(10,4,10);
/*!40000 ALTER TABLE `Himall_MarketSetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MarketSettingMeta`
--

DROP TABLE IF EXISTS `Himall_MarketSettingMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MarketSettingMeta` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MarketId` int(11) NOT NULL,
  `MetaKey` varchar(100) NOT NULL,
  `MetaValue` text,
  PRIMARY KEY (`Id`),
  KEY `FK_Hiamll_MarketSettingMeta_ToSetting` (`MarketId`) USING BTREE,
  CONSTRAINT `himall_marketsettingmeta_ibfk_1` FOREIGN KEY (`MarketId`) REFERENCES `Himall_MarketSetting` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='  可扩充营销服务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MarketSettingMeta`
--

LOCK TABLES `Himall_MarketSettingMeta` WRITE;
/*!40000 ALTER TABLE `Himall_MarketSettingMeta` DISABLE KEYS */;
INSERT INTO `Himall_MarketSettingMeta` VALUES (4,5,'Categories','服装,电脑,手机,家电,电器,奢侈品');
/*!40000 ALTER TABLE `Himall_MarketSettingMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberContacts`
--

DROP TABLE IF EXISTS `Himall_MemberContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberContacts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserType` int(11) NOT NULL COMMENT '用户类型(0 Email  1 SMS)',
  `ServiceProvider` varchar(100) NOT NULL COMMENT '插件名称',
  `Contact` varchar(100) NOT NULL COMMENT '联系号码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='系统会员联系方式表（手机短信、Email）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberContacts`
--

LOCK TABLES `Himall_MemberContacts` WRITE;
/*!40000 ALTER TABLE `Himall_MemberContacts` DISABLE KEYS */;
INSERT INTO `Himall_MemberContacts` VALUES (31,232,1,'Himall.Plugin.Message.Email','zlsq1989@126.com'),(32,232,1,'Himall.Plugin.Message.SMS','123'),(33,233,1,'Himall.Plugin.Message.Email','123@12.com'),(34,233,1,'Himall.Plugin.Message.SMS','123'),(35,235,1,'Himall.Plugin.Message.Email','123123@1231231.com'),(36,235,1,'Himall.Plugin.Message.SMS','123123'),(37,236,1,'Himall.Plugin.Message.Email','123123@1231.com'),(38,236,1,'Himall.Plugin.Message.SMS','1231231'),(39,237,1,'Himall.Plugin.Message.Email','123123@123.com'),(40,237,1,'Himall.Plugin.Message.SMS','123123'),(41,238,1,'Himall.Plugin.Message.Email','123@12.聪明'),(42,238,1,'Himall.Plugin.Message.SMS','123'),(43,240,1,'Himall.Plugin.Message.Email','11@qq.com'),(44,240,1,'Himall.Plugin.Message.SMS','18607310745'),(45,242,1,'Himall.Plugin.Message.Email','qefasdf@sef.fg'),(46,242,1,'Himall.Plugin.Message.SMS','32141234123'),(47,1,1,'Himall.Plugin.Message.Email','Yang@hishop.com'),(48,1,1,'Himall.Plugin.Message.SMS','13988887748'),(49,245,1,'Himall.Plugin.Message.Email','415154466@qq.com'),(50,245,1,'Himall.Plugin.Message.SMS','13000000000'),(51,247,1,'Himall.Plugin.Message.Email','1960187469@qq.com'),(52,247,1,'Himall.Plugin.Message.SMS','13567890987'),(53,248,1,'Himall.Plugin.Message.Email','6926419@qq.com'),(54,248,1,'Himall.Plugin.Message.SMS','13432334544'),(55,249,1,'Himall.Plugin.Message.Email','123355@qq.com'),(56,249,1,'Himall.Plugin.Message.SMS','111');
/*!40000 ALTER TABLE `Himall_MemberContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberGrade`
--

DROP TABLE IF EXISTS `Himall_MemberGrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberGrade` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `GradeName` varchar(100) NOT NULL COMMENT '会员等级名称',
  `Integral` int(11) NOT NULL COMMENT '该等级所需积分',
  `Remark` varchar(1000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='会员等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberGrade`
--

LOCK TABLES `Himall_MemberGrade` WRITE;
/*!40000 ALTER TABLE `Himall_MemberGrade` DISABLE KEYS */;
INSERT INTO `Himall_MemberGrade` VALUES (6,'1',100,NULL),(7,'vip',200,'00');
/*!40000 ALTER TABLE `Himall_MemberGrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberIntegral`
--

DROP TABLE IF EXISTS `Himall_MemberIntegral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberIntegral` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberId` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `HistoryIntegrals` int(11) NOT NULL COMMENT '用户历史积分',
  `AvailableIntegrals` int(11) NOT NULL COMMENT '用户可用积分',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_MemberIntegral` (`MemberId`) USING BTREE,
  CONSTRAINT `himall_memberintegral_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `Himall_Members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='会员积分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberIntegral`
--

LOCK TABLES `Himall_MemberIntegral` WRITE;
/*!40000 ALTER TABLE `Himall_MemberIntegral` DISABLE KEYS */;
INSERT INTO `Himall_MemberIntegral` VALUES (66,541,'selleradmin',1020,940);
/*!40000 ALTER TABLE `Himall_MemberIntegral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberIntegralExchangeRules`
--

DROP TABLE IF EXISTS `Himall_MemberIntegralExchangeRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberIntegralExchangeRules` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IntegralPerMoney` int(11) NOT NULL COMMENT '一块钱对应多少积分',
  `MoneyPerIntegral` int(11) NOT NULL COMMENT '一个积分对应多少钱',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户积分兑换规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberIntegralExchangeRules`
--

LOCK TABLES `Himall_MemberIntegralExchangeRules` WRITE;
/*!40000 ALTER TABLE `Himall_MemberIntegralExchangeRules` DISABLE KEYS */;
INSERT INTO `Himall_MemberIntegralExchangeRules` VALUES (2,10,1);
/*!40000 ALTER TABLE `Himall_MemberIntegralExchangeRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberIntegralRecord`
--

DROP TABLE IF EXISTS `Himall_MemberIntegralRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberIntegralRecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberId` bigint(20) NOT NULL,
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `TypeId` int(11) NOT NULL COMMENT '兑换类型（登录、下单等）',
  `Integral` int(11) NOT NULL COMMENT '积分数量',
  `RecordDate` datetime DEFAULT NULL COMMENT '记录日期',
  `ReMark` varchar(100) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`Id`),
  KEY `fk_MemberId_Members` (`MemberId`) USING BTREE,
  CONSTRAINT `himall_memberintegralrecord_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `Himall_Members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 COMMENT='用户积分兑换记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberIntegralRecord`
--

LOCK TABLES `Himall_MemberIntegralRecord` WRITE;
/*!40000 ALTER TABLE `Himall_MemberIntegralRecord` DISABLE KEYS */;
INSERT INTO `Himall_MemberIntegralRecord` VALUES (494,541,'selleradmin',8,1000,'2015-10-12 14:01:24',''),(495,541,'selleradmin',2,-10,'2015-10-12 14:02:08','礼品订单号:1201510129796357'),(496,541,'selleradmin',2,-10,'2015-10-13 15:25:05','兑换优惠券:面值10.00'),(497,541,'selleradmin',2,-10,'2015-10-13 17:17:16','兑换优惠券:面值50.00'),(498,541,'selleradmin',2,-10,'2015-10-13 17:17:21','兑换优惠券:面值100.00'),(499,541,'selleradmin',2,-10,'2015-10-13 17:17:28','兑换优惠券:面值1.00'),(500,541,'selleradmin',2,-10,'2015-10-13 17:17:32','兑换优惠券:面值5.00'),(501,541,'selleradmin',2,-10,'2015-10-13 17:34:05','订单号:2015101351188869'),(502,541,'selleradmin',2,-10,'2015-10-13 17:34:08','订单号:2015101315238958'),(503,541,'selleradmin',10,10,'2015-10-13 20:00:00','订单号:2015101315238958'),(504,541,'selleradmin',10,10,'2015-10-13 20:00:00','订单号:2015101351188869');
/*!40000 ALTER TABLE `Himall_MemberIntegralRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberIntegralRecordAction`
--

DROP TABLE IF EXISTS `Himall_MemberIntegralRecordAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberIntegralRecordAction` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IntegralRecordId` bigint(20) NOT NULL COMMENT '积分兑换ID',
  `VirtualItemTypeId` int(11) DEFAULT NULL COMMENT '兑换虚拟物l类型ID',
  `VirtualItemId` bigint(20) NOT NULL COMMENT '虚拟物ID',
  PRIMARY KEY (`Id`),
  KEY `fk_IntegralRecordId_MemberIntegralRecord` (`IntegralRecordId`) USING BTREE,
  CONSTRAINT `himall_memberintegralrecordaction_ibfk_1` FOREIGN KEY (`IntegralRecordId`) REFERENCES `Himall_MemberIntegralRecord` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='积分兑换虚拟物记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberIntegralRecordAction`
--

LOCK TABLES `Himall_MemberIntegralRecordAction` WRITE;
/*!40000 ALTER TABLE `Himall_MemberIntegralRecordAction` DISABLE KEYS */;
INSERT INTO `Himall_MemberIntegralRecordAction` VALUES (81,495,1,1201510129796357),(82,501,1,2015101351188869),(83,502,1,2015101315238958),(84,503,6,2015101315238958),(85,504,6,2015101351188869);
/*!40000 ALTER TABLE `Himall_MemberIntegralRecordAction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberIntegralRule`
--

DROP TABLE IF EXISTS `Himall_MemberIntegralRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberIntegralRule` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL COMMENT '积分规则类型ID',
  `Integral` int(11) NOT NULL COMMENT '规则对应的积分数量',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='积分规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberIntegralRule`
--

LOCK TABLES `Himall_MemberIntegralRule` WRITE;
/*!40000 ALTER TABLE `Himall_MemberIntegralRule` DISABLE KEYS */;
INSERT INTO `Himall_MemberIntegralRule` VALUES (5,9,0),(6,6,0),(7,5,0),(8,7,0);
/*!40000 ALTER TABLE `Himall_MemberIntegralRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MemberOpenIds`
--

DROP TABLE IF EXISTS `Himall_MemberOpenIds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MemberOpenIds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `OpenId` varchar(100) DEFAULT NULL COMMENT '微信OpenID',
  `UnionOpenId` varchar(100) DEFAULT NULL COMMENT '开发平台Openid',
  `UnionId` varchar(100) DEFAULT NULL COMMENT '开发平台Unionid',
  `ServiceProvider` varchar(100) NOT NULL COMMENT '插件名称（Himall.Plugin.OAuth.WeiXin）',
  `AppIdType` int(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Member_MemberOpenId` (`UserId`) USING BTREE,
  CONSTRAINT `himall_memberopenids_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='微信会员OpenID表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MemberOpenIds`
--

LOCK TABLES `Himall_MemberOpenIds` WRITE;
/*!40000 ALTER TABLE `Himall_MemberOpenIds` DISABLE KEYS */;
INSERT INTO `Himall_MemberOpenIds` VALUES (236,546,'DF540AC445693EA9223F3F559C6556F5','DF540AC445693EA9223F3F559C6556F5','','Himall.Plugin.OAuth.QQ',1),(237,549,'osRzujh4PfGROqb5lpcWjehJZJb8','','o4vsuuB8aLKOB9lLEdlAaXil5kvw','Himall.Plugin.OAuth.WeiXin',0),(238,550,'osRzujvuZWgJFi4bY2ngxdNdj1UY','','o4vsuuLcxulpdjkCvP4CyH8GGLG8','Himall.Plugin.OAuth.WeiXin',0),(239,551,'osRzujk3499vkVSm3dqX5F0HonPg','','o4vsuuEhrNwiDzeFoAC9uLpKlBGQ','Himall.Plugin.OAuth.WeiXin',0),(240,557,'osRzujsSdpyA-Fd1OqdeNGaB-PkM','','o4vsuuCLPZkP5rUeSycq425VPtsE','Himall.Plugin.OAuth.WeiXin',0),(241,559,'osRzujsr7d-wjmzu6Kbca53cqOKM','','o4vsuuGrshh14-v4Hyc7AHM3ZB2w','Himall.Plugin.OAuth.WeiXin',0),(242,560,'osRzujoQ96VPjp2Mdf8Q39f3h2Ko',NULL,'o4vsuuNL12n3USnd4Owa1JHLlFek','Himall.Plugin.OAuth.WeiXin',0),(243,561,'osRzujo6tM6qm_xq5GVBDgmJfFK4','','o4vsuuKrFZOuSxLpkFwISg3IuJaA','Himall.Plugin.OAuth.WeiXin',0),(244,567,'osRzujo1mpla0AfOOrAhxCfULzT4','','o4vsuuE6rLuPnBIR4Kfev3_ApEPk','Himall.Plugin.OAuth.WeiXin',0),(245,569,'osRzujjvQGlFvrA33ypfn4pVtZfU','','o4vsuuMBNukRAtZm5GR7xsdPwCJw','Himall.Plugin.OAuth.WeiXin',0),(246,578,'osRzujlCOCkl4I4vXoHfG6iZQhJs','','o4vsuuGtOnaK_nFnWig0mQuSfLqg','Himall.Plugin.OAuth.WeiXin',0),(247,579,'osRzujiNxw7RQS772gNjwTcjW-EQ','','o4vsuuOUqb4P6oIfO9P_-nZV9JEw','Himall.Plugin.OAuth.WeiXin',0),(248,580,'5308488571','5308488571','','Himall.Plugin.OAuth.Weibo',1),(249,590,'osRzujqDQScyskczGDUWb0yxQg4Q','','o4vsuuM8EKwl7mrdSml1RSrgzr94','Himall.Plugin.OAuth.WeiXin',0),(250,596,'osRzujtI8ixPR4wPo2kkueX-6RCo','','o4vsuuN5fGBW8B1ypqMcajJJ7WhI','Himall.Plugin.OAuth.WeiXin',0),(251,600,'osRzujqZ7MtwORH1HcFmz4BtKBeA','','o4vsuuHvNUhWH0TKcBbDYIp-B6dU','Himall.Plugin.OAuth.WeiXin',0);
/*!40000 ALTER TABLE `Himall_MemberOpenIds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Members`
--

DROP TABLE IF EXISTS `Himall_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Members` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL COMMENT '名称',
  `Password` varchar(100) NOT NULL COMMENT '密码',
  `PasswordSalt` varchar(100) NOT NULL COMMENT '密码加盐',
  `Nick` varchar(50) DEFAULT NULL COMMENT '昵称',
  `Email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `CreateDate` datetime NOT NULL COMMENT '创建日期',
  `TopRegionId` int(11) NOT NULL COMMENT '省份ID',
  `RegionId` int(11) NOT NULL COMMENT '省市区ID',
  `RealName` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `CellPhone` varchar(100) DEFAULT NULL COMMENT '电话',
  `QQ` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `Address` varchar(100) DEFAULT NULL COMMENT '街道地址',
  `Disabled` tinyint(1) NOT NULL COMMENT '是否禁用',
  `LastLoginDate` datetime NOT NULL COMMENT '最后登录日期',
  `OrderNumber` int(11) NOT NULL COMMENT '下单次数',
  `Expenditure` decimal(18,2) NOT NULL COMMENT '未使用',
  `Points` int(11) NOT NULL,
  `Photo` varchar(100) DEFAULT NULL COMMENT '头像',
  `ParentSellerId` bigint(20) NOT NULL DEFAULT '0' COMMENT '商家父账号ID',
  `Remark` varchar(1000) DEFAULT NULL,
  `PayPwd` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `PayPwdSalt` varchar(100) DEFAULT NULL COMMENT '支付密码加密字符',
  `InviteUserId` bigint(20) DEFAULT NULL COMMENT '邀请人ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Members`
--

LOCK TABLES `Himall_Members` WRITE;
/*!40000 ALTER TABLE `Himall_Members` DISABLE KEYS */;
INSERT INTO `Himall_Members` VALUES (541,'selleradmin','4287bb9b059597a21d411d0423b26d04','432fa30b-c134-43a4-9f40-f56b86fd0a4a',NULL,NULL,'2015-10-08 15:31:43',0,0,NULL,NULL,NULL,NULL,0,'2015-10-14 16:55:09',0,0.00,0,NULL,0,NULL,'9c952649c02a521fb78aa9b70bad8c57','79c3349d58bf450a89ec3c126244a390',NULL),(542,'zesion','cc5ba91634341430ca01cfca8c87eb88','49cda8a68433d3b96a8d','zesion',NULL,'2015-10-08 15:44:22',0,0,'zesion',NULL,NULL,NULL,0,'2015-10-08 15:44:29',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(543,'admin','050258cfc921387e4b1700198a4c027f','48a59cbe0782f4367af2','admin',NULL,'2015-10-08 15:44:28',0,0,'admin',NULL,NULL,NULL,0,'2015-10-13 16:55:17',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(544,'luss','4e166af3c5cf9b1583512ad065af2b3e','4b5ea4b92127da4664e6','luss',NULL,'2015-10-08 15:55:35',0,0,'luss',NULL,NULL,NULL,0,'2015-10-13 15:52:26',0,0.00,0,NULL,0,NULL,'fd303c08ab0190b718ec0fd5c25db1f5','1ea515c734c4465d91afb1933a019209',NULL),(545,'zz123','e48b6607e9b5f7cc3dfa222a454a7aa7','4b32a1dddd9a9d398a0e','zz123',NULL,'2015-10-08 15:56:28',0,0,'zz123',NULL,NULL,NULL,0,'2015-10-10 16:39:07',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(546,'wxsf9f1t','e5cc12c61164d703dca3aeb5a68e6b27','o42f5b988619ab29535db','云上一峰闲',NULL,'2015-10-08 16:54:14',0,0,'',NULL,NULL,NULL,0,'2015-10-08 16:54:14',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(547,'v45365336','3bb34f5b9bad6b877eff46a42ed5d96a','4a3b93dbdd861199bf7f','v45365336',NULL,'2015-10-09 08:54:31',0,0,'v45365336','',NULL,NULL,0,'2015-10-09 08:54:31',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(548,'杨炎雪你好','781ad8d4fcca9bf524206061fb13777f','4ac7834debcb84d0422a','杨炎雪你好',NULL,'2015-10-09 09:15:39',0,0,'杨炎雪你好',NULL,NULL,NULL,0,'2015-10-14 09:23:17',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(549,'wxroo1zo','4bf74d9fd410e639ce754b74fcb58377','o448892bf6a49e0cf6da2','sara玢',NULL,'2015-10-09 14:12:37',0,0,'sara玢',NULL,NULL,NULL,0,'2015-10-09 14:12:37',0,0.00,0,'/Storage/Member/549/headImage.jpg',0,NULL,NULL,NULL,NULL),(550,'wxtsnumw','7bff0c8ba5a7279119b722ea238296e0','o4198bf5aa8d3db21ecfc','王春',NULL,'2015-10-09 14:22:15',0,0,'王春',NULL,NULL,NULL,0,'2015-10-09 14:22:15',0,0.00,0,'/Storage/Member/550/headImage.jpg',0,NULL,NULL,NULL,NULL),(551,'wxji8qai','35b52232b171d5209f1abc7357dc7803','o4f2b8bb63f7b205764ed','陈军',NULL,'2015-10-09 14:28:27',0,0,'陈军',NULL,NULL,NULL,0,'2015-10-09 14:28:27',0,0.00,0,'/Storage/Member/551/headImage.jpg',0,NULL,NULL,NULL,NULL),(552,'banana','9b9f927a18c2f3ced9963b47a32e2a77','48429086c5185af0123c','banana',NULL,'2015-10-09 14:48:02',0,0,'banana',NULL,NULL,NULL,0,'2015-10-09 14:54:59',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(553,'测试00','54332cb1ac32844248ce6d7cb8e98cb0','4922910782b77fe3081b','测试00',NULL,'2015-10-09 15:06:00',0,0,'测试00',NULL,NULL,NULL,0,'2015-10-10 08:23:15',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(554,'123456','6c20e184a6ef7b3d2dac980404d333bf','48e1af74d06a42b897ac','123456',NULL,'2015-10-09 17:49:59',0,0,'123456',NULL,NULL,NULL,0,'2015-10-13 17:01:04',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(555,'lttx','64ad1a9a1fb6a68f49a4327115f31f64','49989d32643ab2fd216a','lttx',NULL,'2015-10-10 09:17:45',0,0,'lttx',NULL,NULL,NULL,0,'2015-10-14 11:35:08',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(556,'zlsq1989','b688a620877c95d91be7008203d5c582','41619ebc9961e0fd32aa','zlsq1989',NULL,'2015-10-10 10:31:44',0,0,'zlsq1989',NULL,NULL,NULL,0,'2015-10-14 09:44:08',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(557,'wx6md5cc','67511d4ad72284f7c2d68972952fccd5','o43f2a898d4103a7098df','欸欸',NULL,'2015-10-10 10:50:09',0,0,'欸欸',NULL,NULL,NULL,0,'2015-10-10 10:50:09',0,0.00,0,'/Storage/Member/557/headImage.jpg',0,NULL,NULL,NULL,NULL),(558,'123l','3931d84cd5284fb3164d39b2e99683f9','4886b35aff80ca2d04fe','123l',NULL,'2015-10-10 13:17:21',0,0,'123l',NULL,NULL,NULL,0,'2015-10-10 13:17:32',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(559,'wxujj010','650752fb6635d902d98e413d055bc030','o442cb6c0e5988e261c81','某依',NULL,'2015-10-10 14:12:49',0,0,'某依',NULL,NULL,NULL,0,'2015-10-10 14:12:49',0,0.00,0,'/Storage/Member/559/headImage.jpg',0,NULL,NULL,NULL,NULL),(560,'15211013426','56487c3ae7835f7db24afab8c9a29ec4','4bb69d13eddf3a4571e4','15211013426',NULL,'2015-10-10 15:13:38',0,0,NULL,NULL,NULL,NULL,0,'2015-10-10 15:13:38',0,0.00,0,'/Storage/Member/560/headImage.jpg',0,NULL,NULL,NULL,NULL),(561,'wxowhd3r','560d8a70e5a17fcc007323b1dec84fef','o46638f0b7027866db6d4','砼友殷岳元',NULL,'2015-10-10 15:27:09',0,0,'砼友殷岳元',NULL,NULL,NULL,0,'2015-10-10 15:27:09',0,0.00,0,'/Storage/Member/561/headImage.jpg',0,NULL,NULL,NULL,NULL),(562,'cici','147cf6dcd9d2772f06ec741da843a641','49eaaa8cdb6feb29d12f','cici',NULL,'2015-10-10 15:28:38',0,0,'cici',NULL,NULL,NULL,0,'2015-10-10 15:28:49',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(563,'zz124','3f41dc197751422dbdfbb1c0d05a1d0a','419c98b6d69eea96952f','zz124',NULL,'2015-10-10 15:33:10',0,0,'zz124',NULL,NULL,NULL,0,'2015-10-10 15:33:46',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(564,'zz125','c0c672c0aad3a8fcfd6596018679fe6a','4b0a820b2a6e949b273c','zz125',NULL,'2015-10-10 15:42:39',0,0,'zz125',NULL,NULL,NULL,0,'2015-10-10 15:43:26',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(565,'zz126','2c93bcd84301244e16597da74b4181d2','4b83ad36b79c09c686c1','zz126',NULL,'2015-10-10 15:49:26',0,0,'zz126',NULL,NULL,NULL,0,'2015-10-10 15:49:34',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(566,'zz127','f9b9b6889e66647c52c406e196209436','46b49ac86debc6644582','zz127',NULL,'2015-10-10 15:56:45',0,0,'zz127',NULL,NULL,NULL,0,'2015-10-10 15:56:52',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(567,'wx41bimz','3e46b62934dd9d61ef3a37e6370c48c5','o4c3585855fdcd8483404','廖日龙',NULL,'2015-10-10 16:16:53',0,0,'廖日龙',NULL,NULL,NULL,0,'2015-10-10 16:16:53',0,0.00,0,'/Storage/Member/567/headImage.jpg',0,NULL,NULL,NULL,NULL),(568,'hishop测试111','cde57bc51ce55f9b196af8e7a825dbeb','41e6864cd66ffa1e3636','hishop测试111',NULL,'2015-10-10 16:26:14',0,0,'hishop测试111',NULL,NULL,NULL,0,'2015-10-10 16:26:31',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(569,'wxoc39cd','e109f3618431f45f7b7a33f047d563fa','o474b83c679f2b480c2c8','Summer ',NULL,'2015-10-10 17:39:42',0,0,'Summer ',NULL,NULL,NULL,0,'2015-10-10 17:39:42',0,0.00,0,'/Storage/Member/569/headImage.jpg',0,NULL,NULL,NULL,NULL),(570,'张三123','e0ae2962516a38f96be8580f2fd2b92d','4a1ab9c0e36a7238530c','张三123',NULL,'2015-10-10 17:50:27',0,0,'张三123',NULL,NULL,NULL,0,'2015-10-10 17:50:50',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(571,'test','30c54ba05a629247212bd85b21a32adb','42e08cc981f3cec544a7','test',NULL,'2015-10-10 22:34:08',0,0,'test',NULL,NULL,NULL,0,'2015-10-10 22:34:17',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(572,'xiao','d2d1e387f469a6a33a57238d53af1636','4ba9933347b8ed5829e6','xiao',NULL,'2015-10-11 14:16:39',0,0,'xiao',NULL,NULL,NULL,0,'2015-10-11 14:16:49',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(573,'w123456','a87f329e094c9fcb55f0c2cd11bc1d6a','4740b0a472a44cf5a7d3','w123456',NULL,'2015-10-11 16:46:24',0,0,'w123456',NULL,NULL,NULL,0,'2015-10-11 16:57:07',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(574,'tuping','ff5e07f46af1b123dfb5bd3ce6716a80','4843a6aad241c37305d0','tuping',NULL,'2015-10-11 22:13:42',0,0,'tuping',NULL,NULL,NULL,0,'2015-10-11 22:13:56',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(575,'zuceyongo','7d8ccaf6e323445145d268f81ed16596','440faebb6d424ceca842','zuceyongo',NULL,'2015-10-11 22:37:52',0,0,'zuceyongo',NULL,NULL,NULL,0,'2015-10-11 22:40:33',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(576,'bbaiw','f1878f4ab03030b8a11633548faa81e9','45b7b05ba5aa20587798','bbaiw',NULL,'2015-10-11 23:31:06',0,0,'bbaiw',NULL,NULL,NULL,0,'2015-10-11 23:31:18',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(577,'lanhama','7550aa98b19d03b3f04979328ae1462a','400bb0762f369bdbd143','lanhama',NULL,'2015-10-12 10:18:37',0,0,'lanhama',NULL,NULL,NULL,0,'2015-10-12 10:29:22',0,0.00,0,NULL,0,NULL,'c9c848db798c7a3ef868db2f78509f51','4065c207850a4c06845722ab329a3577',NULL),(578,'wxxetrj1','f02ff99722911236a305a67991f4976a','o4bc48b0668feeec7fb5c','陈再强(中国电信)',NULL,'2015-10-12 10:23:14',0,0,'陈再强(中国电信)',NULL,NULL,NULL,0,'2015-10-12 10:23:14',0,0.00,0,'/Storage/Member/578/headImage.jpg',0,NULL,NULL,NULL,NULL),(579,'wx4wlqm2','4bdf4fc72e9d3e30129e8aeaf278d282','o40708d99ad0beb5ad232','夹缝',NULL,'2015-10-12 11:45:59',0,0,'夹缝',NULL,NULL,NULL,0,'2015-10-12 11:45:59',0,0.00,0,'/Storage/Member/579/headImage.jpg',0,NULL,NULL,NULL,NULL),(580,'wxn40fnk','30c07d5118bb7a18af270ed743c2d984','o4a3e94bb30f2109e322f','沧桑了的流年',NULL,'2015-10-12 14:36:44',0,0,'',NULL,NULL,NULL,0,'2015-10-12 14:36:44',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(581,'jiangbonf','861f34a17377411005926e154dd217c2','4f2fa2ea0f811fde259e','jiangbonf',NULL,'2015-10-12 17:44:52',0,0,'jiangbonf',NULL,NULL,NULL,0,'2015-10-12 17:45:01',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(582,'xixi','d8a9da44e521c908bb1d084277ecb602','411aa52329d2124f0933','xixi',NULL,'2015-10-13 09:02:07',0,0,'xixi',NULL,NULL,NULL,0,'2015-10-13 09:02:21',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(583,'admins','3b04d7ac07d6c456305e772384de9a8c','4bd89d213c071747190c','admins',NULL,'2015-10-13 11:11:11',0,0,'admins',NULL,NULL,NULL,0,'2015-10-13 11:11:22',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(584,'18286101075','26071570f7b78cda1664565518e27aa5','4dcc82b3112b237a9d3f','18286101075',NULL,'2015-10-13 12:36:22',0,0,'18286101075',NULL,NULL,NULL,0,'2015-10-14 15:21:40',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(585,'测试000','2a65060c13fcf3ebdfd6ed0248e58818','4bab9138ad7e27af167e','测试000',NULL,'2015-10-13 14:02:24',0,0,'测试000',NULL,NULL,NULL,0,'2015-10-13 14:02:47',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(586,'abccc','9ca157bec7f849d83fd0c93face60604','45febc1a2ed495b7c8ba','abccc',NULL,'2015-10-13 14:06:38',0,0,'abccc',NULL,NULL,NULL,0,'2015-10-13 14:07:12',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(587,'测试33','fb9c324aca17617a367372c7b7db4420','425b99de53dadc7671b1','测试33',NULL,'2015-10-13 14:59:02',0,0,'测试33',NULL,NULL,NULL,0,'2015-10-13 16:25:28',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(588,'zsl5566','de89a46afbe4ea10dfd37044af7d781a','4fdaa3439b91f6db97d3','zsl5566',NULL,'2015-10-13 16:26:05',0,0,'zsl5566',NULL,NULL,NULL,0,'2015-10-14 16:26:56',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(589,'tcg_888','c7cca11b75293a4f12e938bf3d63b710','44a38fc6c6797ac6f5ee','tcg_888',NULL,'2015-10-13 16:48:06',0,0,'tcg_888',NULL,NULL,NULL,0,'2015-10-13 16:48:21',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(590,'wxdqifrc','32509b224bb1f07b17d220a8a6922506','o4ae99bfbec2a070a7eb2','*天涯咫尺*²º¹⁵',NULL,'2015-10-13 17:37:09',0,0,'*天涯咫尺*²º¹⁵',NULL,NULL,NULL,0,'2015-10-13 17:37:09',0,0.00,0,'/Storage/Member/590/headImage.jpg',0,NULL,NULL,NULL,NULL),(591,'长沙海商','c699d57b764773626cbbb1293a77fbb7','438d9ebe2dc0a5f60ba0','长沙海商',NULL,'2015-10-13 20:36:10',0,0,'长沙海商',NULL,NULL,NULL,0,'2015-10-13 20:39:41',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(592,'韩寒韩寒','8e2e345d5788210ec79f9ece10e76b1b','41bd97c25d9f4a8e393c','韩寒韩寒',NULL,'2015-10-13 20:56:29',0,0,'韩寒韩寒','',NULL,NULL,0,'2015-10-13 20:57:16',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(593,'quentin','8d2cd1433c3a6f03dda7bcb400e86042','4f9e959affd7c0ceb00b','quentin',NULL,'2015-10-14 09:22:25',0,0,'quentin',NULL,NULL,NULL,0,'2015-10-14 15:46:06',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(594,'杨炎雪心和','5a76810554f3fb305d1cc18799a805d8','4643a65cb6f6a4d02e9a','杨炎雪心和',NULL,'2015-10-14 09:23:10',0,0,'杨炎雪心和',NULL,NULL,NULL,0,'2015-10-14 09:23:10',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(595,'test11','ca5084d2d11c4f0c1cb3a3a7b63a375d','4cd291cbfcc3d85f465a','test11',NULL,'2015-10-14 10:32:46',0,0,'test11',NULL,NULL,NULL,0,'2015-10-14 10:32:55',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(596,'wxmgyj15','7523d2c10e3ff85dee4cc4c904ac5861','o4a96b4a855f909ed685c','曾顺',NULL,'2015-10-14 11:20:40',0,0,'曾顺',NULL,NULL,NULL,0,'2015-10-14 11:20:40',0,0.00,0,'/Storage/Member/596/headImage.jpg',0,NULL,NULL,NULL,NULL),(597,'Eagle','25c7f396070f6deebfcf4d714b025bf1','4e989419cd3c72520385','Eagle',NULL,'2015-10-14 14:02:51',0,0,'Eagle',NULL,NULL,NULL,0,'2015-10-14 14:03:00',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(598,'pjtest','4e88f9cc6d0f0e8ea809d71b35733a64','42028ea33ba9e33ea0ba','pjtest',NULL,'2015-10-14 14:05:37',0,0,'pjtest',NULL,NULL,NULL,0,'2015-10-14 14:05:45',0,0.00,0,NULL,0,NULL,'a160b2dbd2cb69c0bb9d05314bf3ed6e','5de4efa12e8f41dead117e8c1b3819a6',NULL),(599,'test1001','613c66d894d0cb109ae3518371d75820','4cd98b126e046c82447a','test1001',NULL,'2015-10-14 14:16:45',0,0,'test1001',NULL,NULL,NULL,0,'2015-10-14 14:21:52',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(600,'wxcf463h','af3d4dcb3eec2739a1642a2cf9418726','o43cfae1344c83eff2660','铁杆烟丝',NULL,'2015-10-14 14:58:44',0,0,'铁杆烟丝',NULL,NULL,NULL,0,'2015-10-14 14:58:44',0,0.00,0,'/Storage/Member/600/headImage.jpg',0,NULL,NULL,NULL,NULL),(601,'test001','bb8bd17988d417be0e6c9d4045c76e09','4f3b844ad8af84e8aa7b','test001',NULL,'2015-10-14 15:06:58',0,0,'test001',NULL,NULL,NULL,0,'2015-10-14 15:23:04',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(602,'test123','df81aca1ffac77a1e42a30ba8aad43f3','42038c849c81debf628c','test123',NULL,'2015-10-14 15:46:49',0,0,'test123','',NULL,NULL,0,'2015-10-14 15:46:49',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(603,'wensicarter','4b853d56de9b5ad4a7901dc9cc01c0fa','415081d4796e7f9a421d','wensicarter',NULL,'2015-10-14 16:25:12',0,0,'wensicarter',NULL,NULL,NULL,0,'2015-10-14 16:25:24',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(604,'wensicarter2','0698944753cb7b3b6eb02c79b0797850','4817922a1083f539a14a','wensicarter2',NULL,'2015-10-14 16:32:33',0,0,'wensicarter2',NULL,NULL,NULL,0,'2015-10-14 16:57:05',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL),(605,'1121','2fe3c74b49015b26c07156d906221fc5','4a6392f142f0da42603e','1121',NULL,'2015-10-14 17:01:29',0,0,'1121',NULL,NULL,NULL,0,'2015-10-14 17:01:38',0,0.00,0,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Himall_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Menus`
--

DROP TABLE IF EXISTS `Himall_Menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Menus` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentId` bigint(20) NOT NULL COMMENT '上级ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Title` varchar(10) NOT NULL COMMENT '标题',
  `Url` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `Depth` smallint(6) NOT NULL COMMENT '深度',
  `Sequence` smallint(6) NOT NULL,
  `FullIdPath` varchar(100) NOT NULL COMMENT '全路径',
  `Platform` int(11) NOT NULL COMMENT '终端',
  `UrlType` int(11) DEFAULT NULL COMMENT 'url类型',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='移动端菜单表（主要用于微信） ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Menus`
--

LOCK TABLES `Himall_Menus` WRITE;
/*!40000 ALTER TABLE `Himall_Menus` DISABLE KEYS */;
INSERT INTO `Himall_Menus` VALUES (23,0,0,'优惠券','http://demo.himall.kuaidiantong.cn/m-wap/vshop/CouponInfo/145',1,1,'1',1,6),(25,0,0,'商城','',1,1,'1',1,0),(26,25,0,'个人中心','http://demo.himall.kuaidiantong.cn/m-WeiXin/member/center',2,1,'1',1,4),(27,25,0,'商城首页','http://demo.himall.kuaidiantong.cn/m-WeiXin/',2,1,'1',1,1),(28,0,210,'店铺首页','http://lussnail.wicp.net/m-WeiXin/vshop/detail/4?shop=210',1,1,'1',1,1),(29,0,210,'链接','',1,1,'1',1,0),(30,29,210,'购物车','http://lussnail.wicp.net/m-WeiXin/cart/cart?shop=210',2,1,'1',1,3),(31,29,210,'个人中心','http://lussnail.wicp.net/m-WeiXin/member/center?shop=210',2,1,'1',1,4),(32,29,210,'商品分类','http://lussnail.wicp.net/m-WeiXin/vshop/category?vshopid=4&shop=210',2,1,'1',1,2),(33,0,223,'商城','',1,1,'1',1,0),(34,33,223,'首页','http://becks1989.oicp.net/m-WeiXin/vshop/detail/9?shop=223',2,1,'1',1,1),(35,33,223,'分类','http://becks1989.oicp.net/m-WeiXin/vshop/category?vshopid=9&shop=223',2,1,'1',1,2),(36,33,223,'购物车','http://becks1989.oicp.net/m-WeiXin/cart/cart?shop=223',2,1,'1',1,3),(37,0,223,'个人中心','http://becks1989.oicp.net/m-WeiXin/member/center?shop=223',1,1,'1',1,4),(38,0,223,'链接','http://www.baidu.com',1,1,'1',1,5),(39,25,0,'微店','http://demo.himall.kuaidiantong.cn/m-WeiXin/vshop/list',2,1,'1',1,2),(40,0,211,'首页','http://becks1989.oicp.net/m-WeiXin/vshop/detail/5?shop=211',1,1,'1',1,1),(41,0,211,'商城','http://becks1989.oicp.net/m-WeiXin/member/center?shop=211',1,1,'1',1,0),(42,41,211,'个人中心','http://becks1989.oicp.net/m-WeiXin/member/center?shop=211',2,1,'1',1,4),(43,41,211,'购物车','http://becks1989.oicp.net/m-WeiXin/cart/cart?shop=211',2,1,'1',1,3),(49,0,210,'debug','http://lussnail.wicp.net/m-weixin/debug',1,1,'1',1,5),(50,0,215,'首页','http://lussnail.wicp.net/m-WeiXin/vshop/detail/8?shop=215',1,1,'1',1,1),(51,0,215,'分类','http://lussnail.wicp.net/m-WeiXin/vshop/category?vshopid=8&shop=215',1,1,'1',1,2),(52,0,215,'个人中心','http://lussnail.wicp.net/m-WeiXin/member/center?shop=215',1,1,'1',1,4),(60,0,0,'红包','http://demo.himall.kuaidiantong.cn/m-weixin/bonus/index/168',1,1,'1',1,6),(63,0,1,'fj','http://demo.himall.kuaidiantong.cn/m-WeiXin/vshop/detail/16?shop=1',1,1,'1',1,1),(64,0,1,'kj','',1,1,'1',1,0),(65,64,1,'jj','http://demo.himall.kuaidiantong.cn/m-WeiXin/vshop/category?vshopid=16&shop=1',2,1,'1',1,2),(68,0,245,'于金明','http://demo.himall.kuaidiantong.cn/m-WeiXin/vshop/detail/18?shop=245',1,1,'1',1,1);
/*!40000 ALTER TABLE `Himall_Menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MessageLog`
--

DROP TABLE IF EXISTS `Himall_MessageLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MessageLog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) DEFAULT NULL,
  `TypeId` varchar(100) DEFAULT NULL,
  `MessageContent` char(1) DEFAULT NULL,
  `SendTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1094 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MessageLog`
--

LOCK TABLES `Himall_MessageLog` WRITE;
/*!40000 ALTER TABLE `Himall_MessageLog` DISABLE KEYS */;
INSERT INTO `Himall_MessageLog` VALUES (1077,0,'短信','尊','2015-10-11 22:17:25'),(1078,0,'短信','尊','2015-10-11 22:38:27'),(1079,1,'短信','【','2015-10-13 14:08:32'),(1080,1,'短信','【','2015-10-13 15:25:44'),(1081,1,'短信','【','2015-10-13 15:28:01'),(1082,1,'短信','【','2015-10-13 15:31:59'),(1083,0,'短信','【','2015-10-13 15:34:15'),(1084,1,'短信','【','2015-10-13 16:50:39'),(1085,1,'短信','【','2015-10-13 16:54:26'),(1086,0,'短信','【','2015-10-13 16:54:39'),(1087,215,'短信','【','2015-10-13 17:02:57'),(1088,1,'短信','【','2015-10-13 17:11:01'),(1089,1,'短信','【','2015-10-13 17:11:06'),(1090,210,'短信','【','2015-10-13 17:15:09'),(1091,210,'短信','【','2015-10-13 17:19:29'),(1092,215,'短信','【','2015-10-13 17:34:05'),(1093,215,'短信','【','2015-10-13 17:34:08');
/*!40000 ALTER TABLE `Himall_MessageLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MobileHomeProducts`
--

DROP TABLE IF EXISTS `Himall_MobileHomeProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MobileHomeProducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `PlatFormType` int(11) NOT NULL COMMENT '终端类型(微信、WAP）',
  `Sequence` smallint(6) NOT NULL COMMENT '顺序',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_MobileHomeProducts_Himall_Products` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_mobilehomeproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='微信端首页的商品配置表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MobileHomeProducts`
--

LOCK TABLES `Himall_MobileHomeProducts` WRITE;
/*!40000 ALTER TABLE `Himall_MobileHomeProducts` DISABLE KEYS */;
INSERT INTO `Himall_MobileHomeProducts` VALUES (49,223,1,1,161),(73,215,1,1,237),(74,215,1,1,239),(75,215,1,1,240),(76,215,1,1,242),(77,215,1,0,244),(78,215,1,1,246),(79,215,1,1,248),(80,215,1,2,250),(81,210,1,1,234),(82,210,1,1,235),(83,210,1,1,236),(84,210,1,1,238),(85,210,1,1,241),(86,210,1,1,243),(87,210,1,1,245),(88,210,1,1,252),(89,0,1,1,222),(90,0,1,1,223),(91,0,1,1,224),(92,0,1,1,225),(93,0,1,1,236),(94,0,1,1,237),(95,0,1,1,238),(96,0,1,1,239),(97,0,1,1,240),(98,0,1,1,241),(99,0,1,1,242),(100,0,1,1,244),(101,0,1,1,246),(102,0,1,1,248),(103,0,1,2,250),(110,1,1,1,220),(111,1,1,1,221),(112,1,1,1,222),(113,1,1,1,223),(114,1,1,1,224),(115,1,1,1,225),(116,1,1,1,226),(117,1,1,1,227),(118,1,1,1,228),(119,1,1,1,229),(120,1,1,1,230),(121,1,1,1,231),(122,0,1,0,196),(123,245,1,1,310),(124,247,1,1,313);
/*!40000 ALTER TABLE `Himall_MobileHomeProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_MobileHomeTopics`
--

DROP TABLE IF EXISTS `Himall_MobileHomeTopics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_MobileHomeTopics` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `Platform` int(11) NOT NULL COMMENT '终端',
  `TopicId` bigint(20) NOT NULL COMMENT '专题ID',
  `Sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK__Himall_Mo__Topic__02C769E9` (`TopicId`) USING BTREE,
  CONSTRAINT `himall_mobilehometopics_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `Himall_Topics` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT=' 微信端首页的专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_MobileHomeTopics`
--

LOCK TABLES `Himall_MobileHomeTopics` WRITE;
/*!40000 ALTER TABLE `Himall_MobileHomeTopics` DISABLE KEYS */;
INSERT INTO `Himall_MobileHomeTopics` VALUES (15,0,1,38,0),(16,0,1,39,0),(17,0,1,31,0);
/*!40000 ALTER TABLE `Himall_MobileHomeTopics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ModuleProducts`
--

DROP TABLE IF EXISTS `Himall_ModuleProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ModuleProducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ModuleId` bigint(20) NOT NULL COMMENT '模块ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `DisplaySequence` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ModuleProduct` (`ProductId`) USING BTREE,
  KEY `FK_TopicModule_ModuleProduct` (`ModuleId`) USING BTREE,
  CONSTRAINT `himall_moduleproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_moduleproducts_ibfk_2` FOREIGN KEY (`ModuleId`) REFERENCES `Himall_TopicModules` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8 COMMENT='商品模块 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ModuleProducts`
--

LOCK TABLES `Himall_ModuleProducts` WRITE;
/*!40000 ALTER TABLE `Himall_ModuleProducts` DISABLE KEYS */;
INSERT INTO `Himall_ModuleProducts` VALUES (215,155,220,1),(216,155,221,2),(217,155,222,3),(218,155,223,4),(219,155,224,5),(220,155,225,6),(228,157,219,1),(229,157,220,2),(230,157,221,3),(231,157,222,4),(232,157,223,5),(233,157,224,6),(234,157,225,7),(235,158,191,1),(236,158,192,2),(237,158,193,3),(238,158,194,4),(239,158,195,5),(240,158,237,6),(241,158,238,7),(242,158,239,8),(243,159,189,1),(244,159,190,2),(245,159,191,3),(246,159,192,4),(247,159,196,5),(248,159,197,6),(249,160,197,1),(250,160,237,2),(251,160,239,3),(252,160,240,4),(253,160,242,5),(254,160,244,6),(255,160,246,7),(256,160,250,8),(325,169,234,1),(326,169,235,2),(327,169,236,3),(328,169,238,4),(329,169,241,5),(330,169,243,6),(331,169,249,7),(337,172,236,1),(338,172,243,2),(339,172,245,3),(340,172,249,4),(341,173,235,1),(342,173,236,2),(343,173,238,3),(344,173,241,4),(345,173,243,5),(346,173,245,6),(347,173,249,7),(348,173,251,8),(349,173,252,9),(350,173,253,10),(365,178,307,1),(380,183,301,1),(381,183,302,2),(382,183,303,3),(383,183,304,4),(384,183,305,5),(385,183,309,6),(386,184,304,1),(387,184,305,2),(388,184,309,3),(389,185,307,1),(390,186,302,1),(391,186,303,2),(392,186,304,3),(393,186,305,4),(394,186,306,5),(395,186,309,6);
/*!40000 ALTER TABLE `Himall_ModuleProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_OpenIds`
--

DROP TABLE IF EXISTS `Himall_OpenIds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_OpenIds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OpenId` varchar(100) NOT NULL,
  `SubscribeTime` date NOT NULL COMMENT '关注时间',
  `IsSubscribe` tinyint(1) NOT NULL COMMENT '是否关注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_OpenIds`
--

LOCK TABLES `Himall_OpenIds` WRITE;
/*!40000 ALTER TABLE `Himall_OpenIds` DISABLE KEYS */;
INSERT INTO `Himall_OpenIds` VALUES (140,'osRzujmn5htU2DXn4Oz-18peeAzo','2015-10-09',1),(141,'osRzujmn5htU2DXn4Oz-18peeAzo','2015-10-09',1),(142,'osRzujmn5htU2DXn4Oz-18peeAzo','2015-10-09',1),(143,'osRzujvuZWgJFi4bY2ngxdNdj1UY','2015-10-09',1),(144,'osRzujo1mpla0AfOOrAhxCfULzT4','2015-10-09',1),(145,'osRzujk3499vkVSm3dqX5F0HonPg','2015-10-10',1),(146,'osRzujv12sql1WmO224tiCf6XXGM','2015-10-10',0),(147,'osRzujsSdpyA-Fd1OqdeNGaB-PkM','2015-10-10',1),(148,'osRzujo2tFjZT-TXlTdUTeeyhgzI','2015-10-10',1),(149,'osRzujsr7d-wjmzu6Kbca53cqOKM','2015-10-10',1),(150,'osRzujrZlCVNdRLgmPEg_FEEpuE0','2015-10-10',1),(151,'osRzujoQ96VPjp2Mdf8Q39f3h2Ko','2015-10-10',1),(152,'osRzujo6tM6qm_xq5GVBDgmJfFK4','2015-10-10',1),(153,'osRzujpjCgzY9-ycUhVVEPbL-HJY','2015-10-10',1),(154,'osRzujjvQGlFvrA33ypfn4pVtZfU','2015-10-10',1),(155,'osRzujlgPQw5MkcosMd7J3BiT2qU','2015-10-10',1),(156,'osRzujvVA-O5k1X-SZm2xsUrFhQA','2015-10-11',1),(157,'osRzujlfhtAKUP9q9Wh8ATxiRLbw','2015-10-11',1),(158,'osRzujjU_n6a-sqfgbhETjTYq_Yk','2015-10-11',1),(159,'osRzujlCOCkl4I4vXoHfG6iZQhJs','2015-10-12',1),(160,'osRzujjnj_mpQ7Y9FIX0wo5PbVq8','2015-10-12',1),(161,'osRzujk1W_hcSkMEdIhjzbzssoRo','2015-10-13',1),(162,'osRzujuac3gg0xEp4Qyg7QToVPTE','2015-10-13',1),(163,'osRzujmlml7vijDrjr510xoDmfgo','2015-10-13',1),(164,'osRzujrHSbaIhjFctuyQDiFw_cAE','2015-10-13',1),(165,'osRzujo--JoJmWYCvJcAoGgbFjjc','2015-10-14',1),(166,'osRzujqCh6UYHqXN9qlwjanzOLZU','2015-10-14',1),(167,'osRzujrNYZdL0IXdB68WbXtG0Irc','2015-10-14',1),(168,'osRzujtGT6AXudX57cPq-bVkaTe0','2015-10-14',1),(169,'osRzujtI8ixPR4wPo2kkueX-6RCo','2015-10-14',1);
/*!40000 ALTER TABLE `Himall_OpenIds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_OrderComments`
--

DROP TABLE IF EXISTS `Himall_OrderComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_OrderComments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `CommentDate` datetime NOT NULL COMMENT '评价日期',
  `PackMark` int(11) NOT NULL COMMENT '包装评分',
  `DeliveryMark` int(11) NOT NULL COMMENT '物流评分',
  `ServiceMark` int(11) NOT NULL COMMENT '服务评分',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderComment` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_ordercomments_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `Himall_Orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='订单评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_OrderComments`
--

LOCK TABLES `Himall_OrderComments` WRITE;
/*!40000 ALTER TABLE `Himall_OrderComments` DISABLE KEYS */;
INSERT INTO `Himall_OrderComments` VALUES (6,2015100888340498,1,'官方自营店',541,'selleradmin','2015-10-08 18:14:47',5,5,5),(7,2015100947826621,1,'官方自营店',541,'selleradmin','2015-10-12 11:44:08',5,5,5),(8,2015101296168092,1,'官方自营店',541,'selleradmin','2015-10-12 13:56:13',5,5,5),(9,2015101472911285,247,'数码旗舰店',593,'quentin','2015-10-14 10:27:28',5,5,5);
/*!40000 ALTER TABLE `Himall_OrderComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_OrderComplaints`
--

DROP TABLE IF EXISTS `Himall_OrderComplaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_OrderComplaints` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `Status` int(11) NOT NULL COMMENT '审核状态',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `ShopPhone` varchar(100) NOT NULL COMMENT '店铺联系方式',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserName` varchar(100) NOT NULL COMMENT '用户名称',
  `UserPhone` varchar(100) DEFAULT NULL COMMENT '用户联系方式',
  `ComplaintDate` datetime NOT NULL COMMENT '投诉日期',
  `ComplaintReason` varchar(1000) NOT NULL COMMENT '投诉原因',
  `SellerReply` varchar(1000) DEFAULT NULL COMMENT '商家反馈信息',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderComplaint` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_ordercomplaints_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `Himall_Orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='订单投诉表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_OrderComplaints`
--

LOCK TABLES `Himall_OrderComplaints` WRITE;
/*!40000 ALTER TABLE `Himall_OrderComplaints` DISABLE KEYS */;
INSERT INTO `Himall_OrderComplaints` VALUES (27,2015101296168092,2,1,'官方自营店','876588888',541,'selleradmin','18286101075','2015-10-13 17:39:35','产品质量不好','我们会处理的。');
/*!40000 ALTER TABLE `Himall_OrderComplaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_OrderItems`
--

DROP TABLE IF EXISTS `Himall_OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_OrderItems` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `SkuId` varchar(100) DEFAULT NULL COMMENT 'SKUId',
  `SKU` varchar(20) DEFAULT NULL COMMENT '未使用',
  `Quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `ReturnQuantity` bigint(20) NOT NULL COMMENT '退货数量',
  `CostPrice` decimal(18,2) NOT NULL COMMENT '成本价',
  `SalePrice` decimal(18,2) NOT NULL COMMENT '销售价',
  `DiscountAmount` decimal(18,2) NOT NULL COMMENT '优惠金额',
  `RealTotalPrice` decimal(18,2) NOT NULL COMMENT '实际应付金额',
  `RefundPrice` decimal(18,2) NOT NULL COMMENT '退款价格',
  `ProductName` varchar(100) NOT NULL COMMENT '商品名称',
  `Color` varchar(100) DEFAULT NULL COMMENT 'SKU颜色',
  `Size` varchar(100) DEFAULT NULL COMMENT 'SKU尺寸',
  `Version` varchar(100) DEFAULT NULL COMMENT 'SKU版本',
  `ThumbnailsUrl` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `CommisRate` decimal(18,2) NOT NULL COMMENT '分佣比例',
  `EnabledRefundAmount` decimal(18,2) DEFAULT NULL COMMENT '可退金额',
  `IsLimitBuy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为限时购商品',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderItem` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_orderitems_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `Himall_Orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2666 DEFAULT CHARSET=utf8 COMMENT='订单详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_OrderItems`
--

LOCK TABLES `Himall_OrderItems` WRITE;
/*!40000 ALTER TABLE `Himall_OrderItems` DISABLE KEYS */;
INSERT INTO `Himall_OrderItems` VALUES (2598,2015100888421835,1,189,'189_129_128_0','',1,0,0.00,59.00,0.00,59.00,0.00,'公爵车春夏季薄款男士休闲裤小脚男裤子修身直筒长裤韩版潮男装棉','黑色','S','','/Storage/Shop/1/Products/189/1_100.png',0.00,NULL,0),(2599,2015100888340498,1,186,'186_129_128_0','',1,0,0.00,45.00,0.00,45.00,0.00,'2015男士休闲短裤男夏天潮修身5分五分裤夏季沙滩裤薄中裤子7七分','黑色','S','','/Storage/Shop/1/Products/186/1_100.png',0.00,NULL,0),(2600,2015100936935524,1,189,'189_129_128_0','',2,0,0.00,59.00,0.00,118.00,0.00,'公爵车春夏季薄款男士休闲裤小脚男裤子修身直筒长裤韩版潮男装棉','黑色','S','','/Storage/Shop/1/Products/189/1_100.png',0.00,NULL,0),(2601,2015100947826621,1,301,'301_0_0_0','',1,1,6.00,20.00,0.00,20.00,20.00,'地方第三方倒萨','','','','/Storage/Shop/1/Products/301/1_100.png',0.00,20.00,1),(2602,2015100975586770,215,250,'250_8_14_0','',1,0,0.00,0.01,0.00,0.01,0.00,'AMII及简2015秋新品A型大摆圆领撞色开衫大码羊毛衣女','黑白','150','','/Storage/Shop/215/Products/250/1_100.png',0.01,NULL,0),(2603,2015100952073591,1,301,'301_0_0_0','',1,0,6.00,20.00,20.00,0.00,0.00,'地方第三方倒萨','','','','/Storage/Shop/1/Products/301/1_100.png',0.00,NULL,1),(2604,2015100927938483,1,302,'302_66_0_40','',1,0,0.00,0.01,0.00,0.01,0.00,'电相机','白色','','官方标配','/Storage/Shop/1/Products/302/1_100.png',0.00,NULL,0),(2605,2015100983124809,1,230,'230_245_0_40','',1,0,0.00,3499.00,0.00,3499.00,0.00,'Canon/佳能700d 18-55 stm套机700D小套 佳能入门单反相机 包邮','黑色','','官方标配','/Storage/Shop/1/Products/230/1_100.png',0.00,NULL,0),(2606,2015101095442528,1,230,'230_245_0_40','',1,0,0.00,3499.00,0.00,3499.00,0.00,'Canon/佳能700d 18-55 stm套机700D小套 佳能入门单反相机 包邮','黑色','','官方标配','/Storage/Shop/1/Products/230/1_100.png',0.00,NULL,0),(2607,2015101058800888,1,302,'302_66_0_40','',1,0,0.00,0.01,0.00,0.01,0.00,'电相机','白色','','官方标配','/Storage/Shop/1/Products/302/1_100.png',0.00,NULL,0),(2608,2015101058800888,1,301,'301_0_0_0','',1,0,6.00,100.00,0.00,100.00,0.00,'地方第三方倒萨','','','','/Storage/Shop/1/Products/301/1_100.png',0.00,NULL,0),(2609,2015101066777011,215,246,'246_7_11_0','',1,0,0.00,499.00,0.00,499.00,0.00,'AMII及简2015夏纯色圆领百搭短袖T恤镂空拼蕾丝女修身打底衫','红白','120','','/Storage/Shop/215/Products/246/1_100.png',0.01,NULL,0),(2610,2015101002189303,210,253,'253_0_0_0','',1,0,5200.00,3799.00,0.00,3799.00,0.00,'      宏碁（acer）V3-572G 15.6英寸超薄本（i5-5200U 4G 500G G','','','','/Storage/Shop/210/Products/253/1_100.png',0.02,NULL,0),(2611,2015101012526857,215,250,'250_8_12_0','',1,0,0.00,0.01,0.00,0.01,0.00,'AMII及简2015秋新品A型大摆圆领撞色开衫大码羊毛衣女','黑白','130','','/Storage/Shop/215/Products/250/1_100.png',0.01,NULL,0),(2612,2015101096566714,1,302,'302_245_0_41','',1,0,0.00,0.01,0.00,0.01,0.00,'电相机','黑色','','套餐一','/Storage/Shop/1/Products/302/1_100.png',0.00,NULL,0),(2613,2015101076263472,1,302,'302_245_0_41','',1,0,0.00,0.01,0.00,0.01,0.00,'电相机','黑色','','套餐一','/Storage/Shop/1/Products/302/1_100.png',0.00,NULL,0),(2614,2015101017681538,215,250,'250_8_14_0','',1,0,0.00,0.01,0.00,0.01,0.00,'AMII及简2015秋新品A型大摆圆领撞色开衫大码羊毛衣女','黑白','150','','/Storage/Shop/215/Products/250/1_100.png',0.01,NULL,0),(2615,2015101137608947,1,186,'186_129_17_0','',1,0,0.00,45.00,0.00,45.00,0.00,'2015男士休闲短裤男夏天潮修身5分五分裤夏季沙滩裤薄中裤子7七分','黑色','M','','/Storage/Shop/1/Products/186/1_100.png',0.00,NULL,0),(2616,2015101140383898,210,253,'253_0_0_0','',1,0,5200.00,3799.00,0.00,3799.00,0.00,'      宏碁（acer）V3-572G 15.6英寸超薄本（i5-5200U 4G 500G G','','','','/Storage/Shop/210/Products/253/1_100.png',0.02,NULL,0),(2617,2015101140383898,210,235,'235_0_0_0','',1,0,454.00,5000.00,0.00,5000.00,0.00,'      清华同方U850台式电脑23英寸屏 i5-4460 4G 1T 2G独显 带wifi  ','','','','/Storage/Shop/210/Products/235/1_100.png',0.02,NULL,0),(2618,2015101127126163,1,192,'192_10_11_0','',1,0,0.00,159.00,0.00,159.00,0.00,'拉夏贝尔SPORT2015夏新品雪纺印花裙 衬衫领无袖连衣裙20006170','白紫','120','','/Storage/Shop/1/Products/192/1_100.png',0.00,NULL,0),(2619,2015101127126163,1,192,'192_6_13_0','',6,0,0.00,159.00,0.00,954.00,0.00,'拉夏贝尔SPORT2015夏新品雪纺印花裙 衬衫领无袖连衣裙20006170','蓝白','140','','/Storage/Shop/1/Products/192/1_100.png',0.00,NULL,0),(2620,2015101226784923,1,231,'231_245_0_40','',1,0,0.00,566.00,0.00,566.00,0.00,'Sony/索尼 DSC-W810 数码相机/照相机 6倍光学变焦 2010万像素','黑色','','官方标配','/Storage/Shop/1/Products/231/1_100.png',0.00,NULL,0),(2621,2015101274232135,215,248,'248_10_12_0','',2,0,0.00,299.00,0.00,598.00,0.00,'AMII极简2015秋新修身拼接雪纺开衩下摆修身长袖长款毛衣','白紫','130','','/Storage/Shop/215/Products/248/1_100.png',0.01,NULL,0),(2622,2015101257850081,1,186,'186_129_128_0','',1,1,0.00,45.00,0.00,45.00,45.00,'2015男士休闲短裤男夏天潮修身5分五分裤夏季沙滩裤薄中裤子7七分','黑色','S','','/Storage/Shop/1/Products/186/1_100.png',0.00,45.00,0),(2623,2015101260825342,210,234,'234_0_0_0','',1,0,25.00,190.00,0.00,190.00,0.00,'      清华同方（TongFang）精锐X200H-BI02 18.5英寸台式电脑(G1840 ','','','','/Storage/Shop/210/Products/234/1_100.png',0.02,NULL,0),(2624,2015101296168092,1,302,'302_66_0_40','',1,0,0.00,0.01,0.00,0.01,0.00,'电相机','白色','','官方标配','/Storage/Shop/1/Products/302/1_100.png',0.00,NULL,0),(2625,2015101205702615,1,302,'302_66_0_40','',1,0,0.00,0.01,0.00,0.01,0.00,'电相机','白色','','官方标配','/Storage/Shop/1/Products/302/1_100.png',0.00,NULL,0),(2626,2015101239773423,1,186,'186_129_128_0','',1,0,0.00,45.00,0.00,45.00,0.00,'2015男士休闲短裤男夏天潮修身5分五分裤夏季沙滩裤薄中裤子7七分','黑色','S','','/Storage/Shop/1/Products/186/1_100.png',0.00,NULL,0),(2627,2015101380783326,1,184,'184_130_128_0','',1,1,0.00,58.00,0.00,58.00,58.00,'2015夏季男士短袖T恤 韩版修身纯棉半袖体恤青春夏装上衣服潮男装','灰色','S','','/Storage/Shop/1/Products/184/1_100.png',0.00,58.00,0),(2628,2015101384126879,1,194,'194_10_11_0','',1,0,0.00,159.00,0.00,159.00,0.00,'欧芮儿2015夏季新款女装甜美优雅印花拼接无袖连衣裙高腰a字裙夏','白紫','120','','/Storage/Shop/1/Products/194/1_100.png',0.00,NULL,0),(2629,2015101317110252,1,230,'230_245_0_40','',1,0,0.00,3499.00,0.00,3499.00,0.00,'Canon/佳能700d 18-55 stm套机700D小套 佳能入门单反相机 包邮','黑色','','官方标配','/Storage/Shop/1/Products/230/1_100.png',0.00,NULL,0),(2630,2015101333394567,1,301,'301_0_0_0','',1,0,6.00,10.00,0.00,10.00,0.00,'地方第三方倒萨','','','','/Storage/Shop/1/Products/301/1_100.png',0.00,NULL,1),(2631,2015101397944793,1,306,'306_0_0_668','',1,0,0.00,95.00,80.00,15.00,0.00,'爱丁堡酒店','','','标间','/Storage/Shop/1/Products/306/1_100.png',0.00,NULL,1),(2632,2015101359017260,1,302,'302_66_0_40','',1,0,0.00,0.01,0.00,0.01,0.00,'电相机','白色','','官方标配','/Storage/Shop/1/Products/302/1_100.png',0.00,NULL,0),(2633,2015101373865248,1,301,'301_0_0_0','',1,0,6.00,10.00,0.00,10.00,0.00,'地方第三方倒萨','','','','/Storage/Shop/1/Products/301/1_100.png',0.00,NULL,1),(2634,2015101312729400,1,196,'196_7_13_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','红白','140','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2635,2015101370463743,1,196,'196_7_13_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','红白','140','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2636,2015101351765564,215,250,'250_8_12_0','',1,0,0.00,0.01,0.00,0.01,0.00,'AMII及简2015秋新品A型大摆圆领撞色开衫大码羊毛衣女','黑白','130','','/Storage/Shop/215/Products/250/1_100.png',0.01,NULL,0),(2637,2015101394616147,1,194,'194_10_11_0','',1,0,0.00,159.00,0.00,159.00,0.00,'欧芮儿2015夏季新款女装甜美优雅印花拼接无袖连衣裙高腰a字裙夏','白紫','120','','/Storage/Shop/1/Products/194/1_100.png',0.00,NULL,0),(2638,2015101357039174,1,194,'194_10_11_0','',1,0,0.00,159.00,0.00,159.00,0.00,'欧芮儿2015夏季新款女装甜美优雅印花拼接无袖连衣裙高腰a字裙夏','白紫','120','','/Storage/Shop/1/Products/194/1_100.png',0.00,NULL,0),(2639,2015101399252264,210,253,'253_0_0_0','',1,0,5200.00,3799.00,0.00,3799.00,0.00,'      宏碁（acer）V3-572G 15.6英寸超薄本（i5-5200U 4G 500G G','','','','/Storage/Shop/210/Products/253/1_100.png',0.02,NULL,0),(2640,2015101361023885,210,253,'253_0_0_0','',1,0,5200.00,3799.00,0.00,3799.00,0.00,'      宏碁（acer）V3-572G 15.6英寸超薄本（i5-5200U 4G 500G G','','','','/Storage/Shop/210/Products/253/1_100.png',0.02,NULL,0),(2641,2015101351188869,215,256,'256_0_0_0','',1,0,0.00,1.00,0.00,1.00,0.00,'可口可乐 碳酸饮料 汽水330ml/罐','','','','/Storage/Shop/215/Products/256/1_100.png',0.04,NULL,0),(2642,2015101315238958,215,256,'256_0_0_0','',1,0,0.00,1.00,0.00,1.00,0.00,'可口可乐 碳酸饮料 汽水330ml/罐','','','','/Storage/Shop/215/Products/256/1_100.png',0.04,NULL,0),(2643,2015101303770876,1,196,'196_8_12_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','黑白','130','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2644,2015101468844146,1,196,'196_8_12_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','黑白','130','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2645,2015101498454425,1,196,'196_7_12_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','红白','130','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2646,2015101479785896,1,196,'196_8_12_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','黑白','130','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2647,2015101449634572,1,189,'189_129_128_0','',2,0,0.00,59.00,0.00,118.00,0.00,'公爵车春夏季薄款男士休闲裤小脚男裤子修身直筒长裤韩版潮男装棉','黑色','S','','/Storage/Shop/1/Products/189/1_100.png',0.00,NULL,0),(2648,2015101498139419,1,184,'184_130_128_0','',1,0,0.00,58.00,0.00,58.00,0.00,'2015夏季男士短袖T恤 韩版修身纯棉半袖体恤青春夏装上衣服潮男装','灰色','S','','/Storage/Shop/1/Products/184/1_100.png',0.00,NULL,0),(2649,2015101465153036,247,313,'313_132_615_617','',1,0,0.00,8.00,0.00,8.00,0.00,'平头螺丝','白','32','童装','/Storage/Shop/247/Products/313/1_100.png',0.03,NULL,0),(2650,2015101472911285,247,313,'313_132_615_617','',1,0,0.00,0.01,0.00,0.01,0.01,'平头螺丝','白','32','童装','/Storage/Shop/247/Products/313/1_100.png',0.03,0.01,0),(2651,2015101418788911,1,312,'312_679_692_694','',1,0,0.00,12.00,0.00,12.00,0.00,'平头螺丝','黑色','170/92(M)','50mm','/Storage/Shop/1/Products/312/1_100.png',0.00,NULL,0),(2652,2015101485140969,247,313,'313_132_615_617','',1,1,0.00,0.01,0.00,0.01,0.01,'平头螺丝','白','32','童装','/Storage/Shop/247/Products/313/1_100.png',0.03,0.01,0),(2653,2015101440463554,1,196,'196_10_11_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','白紫','120','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2654,2015101479019253,247,313,'313_132_615_617','',1,0,0.00,0.01,0.00,0.01,0.00,'平头螺丝','白','32','童装','/Storage/Shop/247/Products/313/1_100.png',0.03,NULL,1),(2655,2015101433461907,1,301,'301_0_0_0','',1,0,6.00,10.00,8.00,2.00,0.00,'地方第三方倒萨','','','','/Storage/Shop/1/Products/301/1_100.png',0.00,NULL,1),(2656,2015101413925875,1,185,'185_0_0_0','',1,0,0.00,60.00,0.00,60.00,60.00,'2015男士休闲短裤男夏天潮修身5分五分裤夏季沙滩裤薄中裤子7七分','','','','/Storage/Shop/1/Products/185/1_100.png',0.00,60.00,0),(2657,2015101441149101,215,246,'246_7_11_0','',1,0,0.00,499.00,0.00,499.00,0.00,'AMII及简2015夏纯色圆领百搭短袖T恤镂空拼蕾丝女修身打底衫','红白','120','','/Storage/Shop/215/Products/246/1_100.png',0.01,NULL,0),(2658,2015101459191744,215,246,'246_7_11_0','',1,0,0.00,499.00,0.00,499.00,0.00,'AMII及简2015夏纯色圆领百搭短袖T恤镂空拼蕾丝女修身打底衫','红白','120','','/Storage/Shop/215/Products/246/1_100.png',0.01,NULL,0),(2659,2015101449315368,215,244,'244_6_13_0','',1,0,0.00,499.00,0.00,499.00,0.00,'AMII及简2015夏新灯笼式大圆领显瘦宽松纯色长款连衣裙','蓝白','140','','/Storage/Shop/215/Products/244/1_100.png',0.01,NULL,0),(2660,2015101426710616,215,237,'237_0_0_0','',1,0,0.00,699.00,0.00,699.00,0.00,'AMII及简2015夏纯色T恤女镂空花边拼接宽松大码圆领上衣','','','','/Storage/Shop/215/Products/237/1_100.png',0.01,NULL,0),(2661,2015101493042311,215,244,'244_7_14_0','',1,0,0.00,499.00,0.00,499.00,0.00,'AMII及简2015夏新灯笼式大圆领显瘦宽松纯色长款连衣裙','红白','150','','/Storage/Shop/215/Products/244/1_100.png',0.01,NULL,0),(2662,2015101434764417,247,313,'313_132_615_617','',1,0,0.00,0.10,0.00,0.10,0.00,'平头螺丝','白','32','童装','/Storage/Shop/247/Products/313/1_100.png',0.03,NULL,0),(2663,2015101439502022,1,196,'196_7_13_0','',1,0,0.00,0.01,0.00,0.01,0.00,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','红白','140','','/Storage/Shop/1/Products/196/1_100.png',0.00,NULL,0),(2664,2015101442448106,1,314,'314_0_0_668','',2,0,90.00,100.00,0.00,200.00,0.00,'马尔代夫大酒店','','','标间','/Storage/Shop/1/Products/314/1_100.png',0.00,NULL,0),(2665,2015101441283161,1,314,'314_0_0_668','',1,0,90.00,100.00,0.00,100.00,0.00,'马尔代夫大酒店','','','标间','/Storage/Shop/1/Products/314/1_100.png',0.00,NULL,0);
/*!40000 ALTER TABLE `Himall_OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_OrderOperationLogs`
--

DROP TABLE IF EXISTS `Himall_OrderOperationLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_OrderOperationLogs` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `Operator` varchar(100) NOT NULL COMMENT '操作者',
  `OperateDate` datetime NOT NULL COMMENT '操作日期',
  `OperateContent` varchar(1000) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`Id`),
  KEY `FK_Order_OrderOperationLog` (`OrderId`) USING BTREE,
  CONSTRAINT `himall_orderoperationlogs_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `Himall_Orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 COMMENT='订单操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_OrderOperationLogs`
--

LOCK TABLES `Himall_OrderOperationLogs` WRITE;
/*!40000 ALTER TABLE `Himall_OrderOperationLogs` DISABLE KEYS */;
INSERT INTO `Himall_OrderOperationLogs` VALUES (277,2015100888340498,'HimallDemoUser','2015-10-08 18:14:02','平台确认收到订单货款'),(278,2015100888340498,'selleradmin','2015-10-08 18:14:12','商家发货'),(279,2015100888340498,'selleradmin','2015-10-08 18:14:28','会员确认收货'),(280,2015100947826621,'HimallDemoUser','2015-10-09 13:55:52','平台确认收到订单货款'),(281,2015100952073591,'selleradmin','2015-10-09 14:28:52','商家修改订单商品的优惠金额'),(282,2015100927938483,'admin','2015-10-09 14:54:00','平台确认收到订单货款'),(283,2015101226784923,'lanhama','2015-10-12 10:39:37','会员取消订单'),(284,2015100947826621,'selleradmin','2015-10-12 11:35:44','商家发货'),(285,2015100947826621,'selleradmin','2015-10-12 11:40:29','商家处理退款退货申请'),(286,2015100947826621,'selleradmin','2015-10-12 11:43:25','会员确认收货'),(287,2015101274232135,'wx4wlqm2','2015-10-12 11:50:33','会员取消订单'),(288,2015101260825342,'HimallDemoUser','2015-10-12 11:56:24','平台确认收到订单货款'),(289,2015101257850081,'HimallDemoUser','2015-10-12 11:56:31','平台确认收到订单货款'),(290,2015101257850081,'selleradmin','2015-10-12 11:57:14','商家处理退款退货申请'),(291,2015101257850081,'HimallDemoUser','2015-10-12 11:57:28','确认退款/退货'),(292,2015101296168092,'selleradmin','2015-10-12 12:00:03','商家发货'),(293,2015101296168092,'selleradmin','2015-10-12 12:00:37','会员确认收货'),(294,2015101380783326,'HimallDemoUser','2015-10-13 09:01:34','平台确认收到订单货款'),(295,2015101380783326,'selleradmin','2015-10-13 09:03:05','商家处理退款退货申请'),(296,2015101384126879,'HimallDemoUser','2015-10-13 09:17:42','平台确认收到订单货款'),(297,2015101397944793,'selleradmin','2015-10-13 15:26:39','商家修改订单商品的优惠金额'),(298,2015101472911285,'quentin','2015-10-14 10:09:55','商家发货'),(299,2015101472911285,'quentin','2015-10-14 10:20:00','商家处理退款退货申请'),(300,2015101380783326,'admin','2015-10-14 10:20:34','确认退款/退货'),(301,2015101472911285,'admin','2015-10-14 13:48:36','确认退款/退货'),(302,2015101413925875,'HimallDemoUser','2015-10-14 14:19:14','平台确认收到订单货款'),(303,2015101413925875,'selleradmin','2015-10-14 14:21:00','商家发货'),(304,2015101413925875,'selleradmin','2015-10-14 14:22:36','商家处理退款退货申请'),(305,2015101413925875,'HimallDemoUser','2015-10-14 14:22:48','确认退款/退货'),(306,2015101433461907,'selleradmin','2015-10-14 14:45:08','商家修改订单商品的优惠金额'),(307,2015101449315368,'test001','2015-10-14 15:24:25','会员取消订单');
/*!40000 ALTER TABLE `Himall_OrderOperationLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_OrderPay`
--

DROP TABLE IF EXISTS `Himall_OrderPay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_OrderPay` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PayId` bigint(20) NOT NULL,
  `OrderId` bigint(20) NOT NULL,
  `PayState` tinyint(1) unsigned zerofill NOT NULL COMMENT '支付状态',
  `PayTime` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_OrderPay`
--

LOCK TABLES `Himall_OrderPay` WRITE;
/*!40000 ALTER TABLE `Himall_OrderPay` DISABLE KEYS */;
INSERT INTO `Himall_OrderPay` VALUES (556,20151008884218350,2015100888421835,0,NULL),(557,20151008883404980,2015100888340498,0,NULL),(558,20151009369355240,2015100936935524,0,NULL),(559,20151009478266210,2015100947826621,0,NULL),(560,20151009755867700,2015100975586770,0,NULL),(561,20151009520735910,2015100952073591,0,NULL),(562,20151009279384830,2015100927938483,0,NULL),(563,20151009831248090,2015100983124809,0,NULL),(564,20151010954425280,2015101095442528,0,NULL),(565,20151010588008880,2015101058800888,0,NULL),(566,20151010667770110,2015101066777011,0,NULL),(567,20151010021893030,2015101002189303,0,NULL),(568,20151010125268570,2015101012526857,0,NULL),(569,20151010965667140,2015101096566714,1,'2015-10-10 16:20:21'),(570,20151010762634720,2015101076263472,1,'2015-10-10 16:23:10'),(571,20151010176815380,2015101017681538,0,NULL),(572,20151011376089470,2015101137608947,0,NULL),(573,20151011403838980,2015101140383898,0,NULL),(574,20151011271261630,2015101127126163,0,NULL),(575,20151012267849230,2015101226784923,0,NULL),(576,20151012742321350,2015101274232135,0,NULL),(577,151012551152911864,2015101257850081,0,NULL),(578,151012551152911864,2015101260825342,0,NULL),(579,20151012961680920,2015101296168092,1,'2015-10-12 11:59:36'),(580,20151012057026150,2015101205702615,1,'2015-10-12 12:47:01'),(581,20151012397734230,2015101239773423,0,NULL),(582,20151013807833260,2015101380783326,0,NULL),(583,20151013841268790,2015101384126879,0,NULL),(584,20151013171102520,2015101317110252,0,NULL),(585,20151013333945670,2015101333394567,0,NULL),(586,20151013979447930,2015101397944793,0,NULL),(587,20151013590172600,2015101359017260,0,NULL),(588,20151013738652480,2015101373865248,0,NULL),(589,20151013127294000,2015101312729400,0,NULL),(590,20151013704637430,2015101370463743,1,'2015-10-13 16:54:37'),(591,20151013517655640,2015101351765564,0,NULL),(592,20151013946161470,2015101394616147,0,NULL),(593,20151013992522640,2015101399252264,0,NULL),(594,20151013610238850,2015101361023885,0,NULL),(595,20151013511888690,2015101351188869,0,NULL),(596,20151013037708760,2015101303770876,0,NULL),(597,20151014688441460,2015101468844146,0,NULL),(598,20151014984544250,2015101498454425,1,'2015-10-14 10:43:02'),(599,20151014797858960,2015101479785896,1,'2015-10-14 08:48:16'),(600,20151014496345720,2015101449634572,0,NULL),(601,20151014981394190,2015101498139419,0,NULL),(602,20151014651530360,2015101465153036,0,NULL),(603,20151014729112850,2015101472911285,1,'2015-10-14 10:09:33'),(604,20151014187889110,2015101418788911,0,NULL),(605,20151014851409690,2015101485140969,1,'2015-10-14 10:35:01'),(606,20151014404635540,2015101440463554,0,NULL),(607,20151014790192530,2015101479019253,0,NULL),(608,20151014334619070,2015101433461907,0,NULL),(609,20151014139258750,2015101413925875,0,NULL),(610,20151014411491010,2015101441149101,0,NULL),(611,20151014591917440,2015101459191744,0,NULL),(612,20151014493153680,2015101449315368,0,NULL),(613,20151014267106160,2015101426710616,0,NULL),(614,20151014930423110,2015101493042311,0,NULL),(615,20151014347644170,2015101434764417,0,NULL),(616,20151014395020220,2015101439502022,0,NULL),(617,20151014424481060,2015101442448106,0,NULL),(618,20151014412831610,2015101441283161,0,NULL);
/*!40000 ALTER TABLE `Himall_OrderPay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_OrderRefunds`
--

DROP TABLE IF EXISTS `Himall_OrderRefunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_OrderRefunds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderId` bigint(20) NOT NULL COMMENT '订单ID',
  `OrderItemId` bigint(20) NOT NULL COMMENT '订单详情ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `Applicant` varchar(100) NOT NULL COMMENT '申请内容',
  `ContactPerson` varchar(100) DEFAULT NULL COMMENT '联系人',
  `ContactCellPhone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `RefundAccount` varchar(100) DEFAULT NULL COMMENT '退款金额',
  `ApplyDate` datetime NOT NULL COMMENT '申请时间',
  `Amount` decimal(18,2) NOT NULL COMMENT '金额',
  `Reason` varchar(1000) NOT NULL COMMENT '退款原因',
  `SellerAuditStatus` int(11) NOT NULL COMMENT '商家审核状态',
  `SellerAuditDate` datetime NOT NULL COMMENT '商家审核时间',
  `SellerRemark` varchar(1000) DEFAULT NULL COMMENT '商家注释',
  `ManagerConfirmStatus` int(11) NOT NULL COMMENT '平台审核状态',
  `ManagerConfirmDate` datetime NOT NULL COMMENT '平台审核时间',
  `ManagerRemark` varchar(1000) DEFAULT NULL COMMENT '平台注释',
  `IsReturn` tinyint(1) NOT NULL COMMENT '是否已经退款',
  `ExpressCompanyName` varchar(100) DEFAULT NULL COMMENT '快递公司',
  `ShipOrderNumber` varchar(100) DEFAULT NULL COMMENT '快递单号',
  `Payee` varchar(200) DEFAULT NULL COMMENT '收款人',
  `PayeeAccount` varchar(200) DEFAULT NULL COMMENT '收款人账户',
  `RefundMode` int(11) NOT NULL COMMENT '退款方式',
  `RefundPayStatus` int(11) DEFAULT NULL COMMENT '退款支付状态',
  `RefundPayType` int(11) DEFAULT NULL COMMENT '退款支付类型',
  `BuyerDeliverDate` datetime DEFAULT NULL COMMENT '买家发货时间',
  `SellerConfirmArrivalDate` datetime DEFAULT NULL COMMENT '卖家确认到货时间',
  PRIMARY KEY (`Id`),
  KEY `FK_OrderItem_OrderRefund` (`OrderItemId`) USING BTREE,
  CONSTRAINT `himall_orderrefunds_ibfk_1` FOREIGN KEY (`OrderItemId`) REFERENCES `Himall_OrderItems` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1234567957 DEFAULT CHARSET=utf8 COMMENT='订单退款表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_OrderRefunds`
--

LOCK TABLES `Himall_OrderRefunds` WRITE;
/*!40000 ALTER TABLE `Himall_OrderRefunds` DISABLE KEYS */;
INSERT INTO `Himall_OrderRefunds` VALUES (1234567951,2015100947826621,2601,1,'官方自营店',541,'selleradmin','222','13111111111',NULL,'2015-10-12 11:39:53',20.00,'222222222',2,'2015-10-12 11:40:29','',6,'2015-10-12 11:39:53',NULL,1,NULL,NULL,NULL,NULL,3,NULL,3,NULL,NULL),(1234567952,2015101257850081,2622,1,'官方自营店',541,'selleradmin','111','13111111111',NULL,'2015-10-12 11:56:57',45.00,'取消订单退款',5,'2015-10-12 11:57:14','',7,'2015-10-12 11:57:28','',0,NULL,NULL,NULL,NULL,1,1,3,NULL,NULL),(1234567953,2015101380783326,2627,1,'官方自营店',541,'selleradmin','测试','15215215215',NULL,'2015-10-13 09:02:52',58.00,'取消订单退款',5,'2015-10-13 09:03:05','',7,'2015-10-14 10:20:34','',0,NULL,NULL,NULL,NULL,1,1,3,NULL,NULL),(1234567954,2015101472911285,2650,247,'数码旗舰店',593,'quentin','quentin','13508976',NULL,'2015-10-14 10:18:50',0.01,'产品质量问题',5,'2015-10-14 10:20:00','',7,'2015-10-14 13:48:36','',0,NULL,NULL,NULL,NULL,2,1,3,NULL,NULL),(1234567955,2015101485140969,2652,247,'数码旗舰店',595,'test11','test11','18711052244',NULL,'2015-10-14 10:35:26',0.01,'取消订单退款',1,'2015-10-14 10:35:26',NULL,6,'2015-10-14 10:35:26',NULL,0,NULL,NULL,NULL,NULL,1,NULL,3,NULL,NULL),(1234567956,2015101413925875,2656,1,'官方自营店',599,'test1001','test1001','13588884451',NULL,'2015-10-14 14:22:19',60.00,'212121212121',5,'2015-10-14 14:22:36','121212121',7,'2015-10-14 14:22:48','111111111111',0,NULL,NULL,NULL,NULL,2,1,3,NULL,NULL);
/*!40000 ALTER TABLE `Himall_OrderRefunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Orders`
--

DROP TABLE IF EXISTS `Himall_Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Orders` (
  `Id` bigint(20) NOT NULL,
  `OrderStatus` int(11) NOT NULL COMMENT '订单状态 [Description("待付款")]WaitPay = 1,[Description("待发货")]WaitDelivery,[Description("待收货")]WaitReceiving,[Description("已关闭")]Close,[Description("已完成")]Finish',
  `OrderDate` datetime NOT NULL COMMENT '订单创建日期',
  `CloseReason` varchar(1000) DEFAULT NULL COMMENT '关闭原因',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `SellerPhone` varchar(100) DEFAULT NULL COMMENT '商家电话',
  `SellerAddress` varchar(100) DEFAULT NULL COMMENT '商家发货地址',
  `SellerRemark` varchar(1000) DEFAULT NULL COMMENT '商家说明',
  `UserId` bigint(20) NOT NULL COMMENT '会员ID',
  `UserName` varchar(100) NOT NULL COMMENT '会员名称',
  `UserRemark` varchar(1000) DEFAULT NULL COMMENT '会员留言',
  `ShipTo` varchar(100) NOT NULL COMMENT '收货人',
  `CellPhone` varchar(100) DEFAULT NULL COMMENT '收货人电话',
  `TopRegionId` int(11) NOT NULL COMMENT '收货人地址省份ID',
  `RegionId` int(11) NOT NULL COMMENT '收货人区域ID',
  `RegionFullName` varchar(100) NOT NULL COMMENT '全名的收货地址',
  `Address` varchar(100) NOT NULL COMMENT '收货具体街道信息',
  `ExpressCompanyName` varchar(100) DEFAULT NULL COMMENT '快递公司',
  `Freight` decimal(8,2) NOT NULL COMMENT '运费',
  `ShipOrderNumber` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '物流订单号',
  `ShippingDate` datetime DEFAULT NULL COMMENT '发货日期',
  `IsPrinted` tinyint(1) NOT NULL COMMENT '是否打印快递单',
  `PaymentTypeName` varchar(100) DEFAULT NULL COMMENT '付款类型名称',
  `PaymentTypeGateway` varchar(100) DEFAULT NULL COMMENT '付款类型使用 插件名称',
  `GatewayOrderId` varchar(100) DEFAULT NULL COMMENT '支付接口返回的ID',
  `PayRemark` varchar(1000) DEFAULT NULL COMMENT '付款注释',
  `PayDate` datetime DEFAULT NULL COMMENT '付款日期',
  `InvoiceType` int(11) NOT NULL COMMENT '发票类型',
  `InvoiceTitle` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `Tax` decimal(8,2) NOT NULL COMMENT '税钱，但是未使用',
  `FinishDate` datetime DEFAULT NULL COMMENT '完成订单日期',
  `ProductTotalAmount` decimal(18,2) NOT NULL COMMENT '商品总金额',
  `RefundTotalAmount` decimal(18,2) NOT NULL COMMENT '退款金额',
  `CommisTotalAmount` decimal(18,2) NOT NULL COMMENT '佣金总金额',
  `RefundCommisAmount` decimal(18,2) NOT NULL COMMENT '退还佣金总金额',
  `ActiveType` int(11) NOT NULL DEFAULT '0' COMMENT '未使用',
  `Platform` int(11) NOT NULL DEFAULT '0' COMMENT '来自哪个终端的订单',
  `DiscountAmount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '针对该订单的优惠金额（用于优惠券）',
  `IntegralDiscount` decimal(18,2) NOT NULL COMMENT '积分优惠金额',
  `InvoiceContext` varchar(50) DEFAULT NULL COMMENT '发票明细',
  `OrderType` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统订单主表，还有一张Himall_OrderItem,记录订单中的每个商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Orders`
--

LOCK TABLES `Himall_Orders` WRITE;
/*!40000 ALTER TABLE `Himall_Orders` DISABLE KEYS */;
INSERT INTO `Himall_Orders` VALUES (2015100888340498,5,'2015-10-08 18:12:26',NULL,1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方','其他',0.00,'','2015-10-08 18:14:12',0,'平台线下收款',NULL,NULL,'','2015-10-08 18:14:02',0,'',0.00,'2015-10-08 18:14:28',45.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015100888421835,4,'2015-10-08 17:03:00','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,59.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015100927938483,2,'2015-10-09 14:52:57',NULL,1,'官方自营店',NULL,NULL,NULL,552,'banana',NULL,'121','18865432126',1662,1666,'湖南省 长沙市 岳麓区','33232',NULL,0.00,NULL,NULL,0,'平台线下收款',NULL,NULL,'','2015-10-09 14:54:00',0,'',0.00,NULL,0.01,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015100936935524,4,'2015-10-09 11:30:44','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,118.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015100947826621,5,'2015-10-09 13:55:25',NULL,1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方','天天快递',0.00,'111','2015-10-12 11:35:44',0,'平台线下收款',NULL,NULL,'','2015-10-09 13:55:52',0,'',0.00,'2015-10-12 11:43:25',20.00,0.00,0.00,0.00,0,0,0.00,0.00,'',2),(2015100952073591,2,'2015-10-09 14:27:37',NULL,1,'官方自营店',NULL,NULL,NULL,549,'wxroo1zo',NULL,'Wangbin','13017195356',1662,1664,'湖南省 长沙市 芙蓉区','大剧院1915',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-10-09 14:29:17',0,NULL,0.00,NULL,0.00,0.00,0.00,0.00,0,1,0.00,0.00,NULL,2),(2015100975586770,4,'2015-10-09 14:22:58','过期没付款，自动关闭',215,'糖糖的店铺',NULL,NULL,NULL,550,'wxtsnumw',NULL,'王春','15399907687',1662,1667,'湖南省 长沙市 开福区','四方坪',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015100983124809,4,'2015-10-09 15:08:31','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,553,'测试00',NULL,'测试','15112321110',100,102,'浙江省 杭州市 上城区','测试',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,3499.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101002189303,4,'2015-10-10 15:41:27','过期没付款，自动关闭',210,'扣扣电脑城Update',NULL,NULL,NULL,560,'15211013426',NULL,'李','15211013426',1662,1664,'湖南省 长沙市 芙蓉区','祝您是',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,3799.00,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101012526857,4,'2015-10-10 16:17:40','过期没付款，自动关闭',215,'糖糖的店铺',NULL,NULL,NULL,567,'wx41bimz',NULL,'了','13699887752',516,549,'江西省 九江市 修水县','宝贝',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101017681538,4,'2015-10-10 17:42:11','过期没付款，自动关闭',215,'糖糖的店铺',NULL,NULL,NULL,569,'wxoc39cd',NULL,'哈哈','13603016801',213,215,'上海 上海市 黄浦区','刚和黑胡椒',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101058800888,4,'2015-10-10 15:02:28','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,100.01,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101066777011,4,'2015-10-10 15:14:34','过期没付款，自动关闭',215,'糖糖的店铺',NULL,NULL,NULL,560,'15211013426',NULL,'李','15211013426',1662,1664,'湖南省 长沙市 芙蓉区','祝您是',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,499.00,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101076263472,2,'2015-10-10 16:23:03',NULL,1,'官方自营店',NULL,NULL,NULL,567,'wx41bimz',NULL,'了','13699887752',516,549,'江西省 九江市 修水县','宝贝',NULL,0.00,NULL,NULL,0,'微信支付','Himall.Plugin.Payment.WeiXinPay','1007360620201510101150828691',NULL,'2015-10-10 16:23:10',0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101095442528,4,'2015-10-10 08:23:35','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,553,'测试00',NULL,'测试','15112321110',100,102,'浙江省 杭州市 上城区','测试',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,3499.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101096566714,2,'2015-10-10 16:20:07',NULL,1,'官方自营店',NULL,NULL,NULL,567,'wx41bimz',NULL,'了','13699887752',516,549,'江西省 九江市 修水县','宝贝',NULL,0.00,NULL,NULL,0,'微信支付','Himall.Plugin.Payment.WeiXinPay','1007360620201510101150805909',NULL,'2015-10-10 16:20:21',0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101127126163,4,'2015-10-11 23:49:27','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,576,'bbaiw',NULL,'fgsf','11111111111',213,216,'上海 上海市 卢湾区','sdfgsdfgsdf',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,1113.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101137608947,4,'2015-10-11 15:22:04','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,45.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101140383898,4,'2015-10-11 22:42:06','过期没付款，自动关闭',210,'扣扣电脑城Update',NULL,NULL,NULL,575,'zuceyongo',NULL,'方法','13058742010',213,216,'上海 上海市 卢湾区','飞帆过好好奋斗',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,8799.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101205702615,2,'2015-10-12 12:46:24',NULL,1,'官方自营店',NULL,NULL,NULL,578,'wxxetrj1',NULL,'张三','18899998888',1662,1664,'湖南省 长沙市 芙蓉区','王府井',NULL,0.00,NULL,NULL,0,'微信支付','Himall.Plugin.Payment.WeiXinPay','1007780620201510121170114189',NULL,'2015-10-12 12:47:01',0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101226784923,4,'2015-10-12 10:38:04',NULL,1,'官方自营店',NULL,NULL,NULL,577,'lanhama',NULL,'东风','13911111111',374,406,'安徽省 淮南市 田家庵区','阿斯蒂芬',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,566.00,0.00,0.00,0.00,0,0,50.00,0.00,'',NULL),(2015101239773423,4,'2015-10-12 18:13:15','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,45.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101257850081,4,'2015-10-12 11:55:53','商家同意退款，取消订单',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,'平台线下收款',NULL,NULL,'','2015-10-12 11:56:31',0,'',0.00,NULL,45.00,45.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101260825342,2,'2015-10-12 11:55:53',NULL,210,'扣扣电脑城Update',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,'平台线下收款',NULL,NULL,'','2015-10-12 11:56:24',0,'',0.00,NULL,190.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101274232135,4,'2015-10-12 11:49:59',NULL,215,'糖糖的店铺',NULL,NULL,NULL,579,'wx4wlqm2',NULL,'eeee','13111111111',236,281,'江苏省 常州市 武进区','ddddd',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,598.00,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101296168092,5,'2015-10-12 11:59:26',NULL,1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方','天天快递',0.00,'22323232','2015-10-12 12:00:03',0,'预付款支付','',NULL,NULL,'2015-10-12 11:59:36',0,'',0.00,'2015-10-12 12:00:37',0.01,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101303770876,4,'2015-10-13 21:32:24','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,557,'wx6md5cc',NULL,'zzz','18684850987',213,218,'上海 上海市 长宁区','龙猫',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101312729400,4,'2015-10-13 16:50:39','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,557,'wx6md5cc',NULL,'zzz','18684850987',213,218,'上海 上海市 长宁区','龙猫',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101315238958,4,'2015-10-13 17:34:08','过期没付款，自动关闭',215,'糖糖的店铺',NULL,NULL,NULL,541,'selleradmin',NULL,'奋斗个','18711052244',642,644,'北京 北京市 东城区','梵蒂冈',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,1.00,0.00,0.00,0.00,0,0,0.00,1.00,'',NULL),(2015101317110252,4,'2015-10-13 11:03:44','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,3499.00,0.00,0.00,0.00,0,0,50.00,0.00,'',NULL),(2015101333394567,4,'2015-10-13 14:08:32','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,586,'abccc',NULL,'accc','23456787654',100,102,'浙江省 杭州市 上城区','dddddd',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,10.00,0.00,0.00,0.00,0,0,0.00,0.00,'',2),(2015101351188869,4,'2015-10-13 17:34:04','过期没付款，自动关闭',215,'糖糖的店铺',NULL,NULL,NULL,541,'selleradmin',NULL,'奋斗个','18711052244',642,644,'北京 北京市 东城区','梵蒂冈',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,1.00,0.00,0.00,0.00,0,0,0.00,1.00,'',NULL),(2015101351765564,4,'2015-10-13 17:02:56','过期没付款，自动关闭',215,'糖糖的店铺',NULL,NULL,NULL,557,'wx6md5cc',NULL,'zzz','18684850987',213,218,'上海 上海市 长宁区','龙猫',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101357039174,4,'2015-10-13 17:11:06','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,554,'123456',NULL,'测试','13524562541',236,265,'江苏省 徐州市 云龙区','测试题',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,159.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101359017260,4,'2015-10-13 15:28:01','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,0.01,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101361023885,4,'2015-10-13 17:19:29','过期没付款，自动关闭',210,'扣扣电脑城Update',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','14798653258332653235',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,3799.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101370463743,2,'2015-10-13 16:54:26',NULL,1,'官方自营店',NULL,NULL,NULL,557,'wx6md5cc',NULL,'zzz','18684850987',213,218,'上海 上海市 长宁区','龙猫',NULL,0.00,NULL,NULL,0,'微信支付','Himall.Plugin.Payment.WeiXinPay','1002690620201510131183659243',NULL,'2015-10-13 16:54:37',0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101373865248,4,'2015-10-13 15:31:59','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,10.00,0.00,0.00,0.00,0,0,0.00,0.00,'',2),(2015101380783326,4,'2015-10-13 08:57:58','商家同意退款，取消订单',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','18711052244',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,'平台线下收款',NULL,NULL,'测试','2015-10-13 09:01:34',0,'',0.00,NULL,58.00,58.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101384126879,2,'2015-10-13 09:15:49',NULL,1,'官方自营店',NULL,NULL,NULL,582,'xixi',NULL,'xixi','13213213212',213,215,'上海 上海市 黄浦区','家园',NULL,0.00,NULL,NULL,0,'平台线下收款',NULL,NULL,'00','2015-10-13 09:17:42',0,'',0.00,NULL,159.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101394616147,4,'2015-10-13 17:11:01','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,554,'123456',NULL,'测试','13524562541',236,265,'江苏省 徐州市 云龙区','测试题',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,159.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101397944793,4,'2015-10-13 15:25:44','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干','18711052244',213,215,'上海 上海市 黄浦区','人格人',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,15.00,0.00,0.00,0.00,0,0,10.00,0.00,'',2),(2015101399252264,4,'2015-10-13 17:15:09','过期没付款，自动关闭',210,'扣扣电脑城Update',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','14798653258332653235',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,3799.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101413925875,3,'2015-10-14 14:17:37',NULL,1,'官方自营店',NULL,NULL,NULL,599,'test1001',NULL,'方法','13544854421',100,102,'浙江省 杭州市 上城区','范德萨发','邮政EMS',0.00,'212121','2015-10-14 14:21:00',0,'平台线下收款',NULL,NULL,'','2015-10-14 14:19:14',0,'',0.00,NULL,60.00,60.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101418788911,4,'2015-10-14 10:24:55','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,560,'15211013426',NULL,'李','15211013426',1662,1664,'湖南省 长沙市 芙蓉区','祝您是',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,12.00,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101426710616,1,'2015-10-14 15:24:51',NULL,215,'糖糖的店铺',NULL,NULL,NULL,601,'test001',NULL,'张三','12345678901',236,281,'江苏省 常州市 武进区','刘家庄',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,699.00,0.00,0.00,0.00,0,4,0.00,0.00,NULL,NULL),(2015101433461907,1,'2015-10-14 14:05:28',NULL,1,'官方自营店',NULL,NULL,NULL,597,'Eagle',NULL,'fg','13021638465',100,102,'浙江省 杭州市 上城区','gfg',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,2.00,0.00,0.00,0.00,0,0,0.00,0.00,'',2),(2015101434764417,1,'2015-10-14 15:26:32',NULL,247,'数码旗舰店',NULL,NULL,NULL,601,'test001',NULL,'张三','12345678901',236,281,'江苏省 常州市 武进区','刘家庄',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.10,0.00,0.00,0.00,0,4,0.00,0.00,NULL,NULL),(2015101439502022,1,'2015-10-14 15:46:12',NULL,1,'官方自营店',NULL,NULL,NULL,593,'quentin',NULL,'王春','13562314089',1662,1667,'湖南省 长沙市 开福区','湖南文化大厦',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,4,0.00,0.00,NULL,NULL),(2015101440463554,4,'2015-10-14 10:43:45','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,557,'wx6md5cc',NULL,'zzz','18684850987',213,218,'上海 上海市 长宁区','龙猫',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101441149101,1,'2015-10-14 15:13:38',NULL,215,'糖糖的店铺',NULL,NULL,NULL,600,'wxcf463h',NULL,'张三','12345678901',642,648,'北京 北京市 朝阳区','王府井',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,499.00,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101441283161,1,'2015-10-14 17:19:41',NULL,1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','14798653258332653235',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,100.00,0.00,0.00,0.00,0,0,10.00,0.00,'',NULL),(2015101442448106,1,'2015-10-14 15:53:39',NULL,1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','14798653258332653235',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,200.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101449315368,4,'2015-10-14 15:24:03',NULL,215,'糖糖的店铺',NULL,NULL,NULL,601,'test001',NULL,'张三','12345678901',236,281,'江苏省 常州市 武进区','刘家庄',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,499.00,0.00,0.00,0.00,0,4,0.00,0.00,NULL,NULL),(2015101449634572,4,'2015-10-14 09:20:53','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,541,'selleradmin',NULL,'豆腐干豆腐干地方','14798653258332653235',1152,1166,'山东省 青岛市 市南区','豆腐干豆腐干地方',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,118.00,0.00,0.00,0.00,0,0,20.00,0.00,'',NULL),(2015101459191744,1,'2015-10-14 15:22:27',NULL,215,'糖糖的店铺',NULL,NULL,NULL,584,'18286101075',NULL,'王牌','18585858585',3356,3413,'贵州省 黔西南 兴义市','下午屯新屯安置区',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,499.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101465153036,4,'2015-10-14 10:07:59','过期没付款，自动关闭',247,'数码旗舰店',NULL,NULL,NULL,593,'quentin',NULL,'王春','13562314089',1662,1667,'湖南省 长沙市 开福区','湖南文化大厦',NULL,5.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,8.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101468844146,4,'2015-10-14 08:15:04','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,550,'wxtsnumw',NULL,'王春','15399907687',1662,1667,'湖南省 长沙市 开福区','四方坪',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101472911285,5,'2015-10-14 10:09:10',NULL,247,'数码旗舰店',NULL,NULL,NULL,593,'quentin',NULL,'王春','13562314089',1662,1667,'湖南省 长沙市 开福区','湖南文化大厦','其他',0.00,'','2015-10-14 10:09:55',0,'微信扫码支付','Himall.Plugin.Payment.WeiXinPay_Native','1008010620201510141189768076',NULL,'2015-10-14 10:09:33',0,'',0.00,'2015-10-14 10:26:51',0.01,0.01,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101479019253,4,'2015-10-14 10:59:40','过期没付款，自动关闭',247,'数码旗舰店',NULL,NULL,NULL,550,'wxtsnumw',NULL,'王春','15399907687',1662,1667,'湖南省 长沙市 开福区','四方坪',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,2),(2015101479785896,2,'2015-10-14 08:48:09',NULL,1,'官方自营店',NULL,NULL,NULL,550,'wxtsnumw',NULL,'王春','15399907687',1662,1667,'湖南省 长沙市 开福区','四方坪',NULL,0.00,NULL,NULL,0,'微信支付','Himall.Plugin.Payment.WeiXinPay','1005760620201510141189155013',NULL,'2015-10-14 08:48:16',0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL),(2015101485140969,2,'2015-10-14 10:34:27',NULL,247,'数码旗舰店',NULL,NULL,NULL,595,'test11',NULL,'第三方','18711052244',213,216,'上海 上海市 卢湾区','第三方',NULL,0.00,NULL,NULL,0,'微信扫码支付','Himall.Plugin.Payment.WeiXinPay_Native','1002320620201510141190043701',NULL,'2015-10-14 10:35:01',0,'',0.00,NULL,0.01,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101493042311,1,'2015-10-14 15:25:38',NULL,215,'糖糖的店铺',NULL,NULL,NULL,601,'test001',NULL,'张三','12345678901',236,281,'江苏省 常州市 武进区','刘家庄',NULL,10.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0.00,NULL,499.00,0.00,0.00,0.00,0,4,0.00,0.00,NULL,NULL),(2015101498139419,4,'2015-10-14 09:25:15','过期没付款，自动关闭',1,'官方自营店',NULL,NULL,NULL,548,'杨炎雪你好',NULL,'进京东','125236616621',374,421,'安徽省 淮北市 烈山区','的扩大 ',NULL,0.00,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,'',0.00,NULL,58.00,0.00,0.00,0.00,0,0,0.00,0.00,'',NULL),(2015101498454425,2,'2015-10-14 08:44:30',NULL,1,'官方自营店',NULL,NULL,NULL,557,'wx6md5cc',NULL,'zzz','18684850987',213,218,'上海 上海市 长宁区','龙猫',NULL,0.00,NULL,NULL,0,'微信支付','Himall.Plugin.Payment.WeiXinPay','1002690620201510141190155621',NULL,'2015-10-14 10:43:02',0,NULL,0.00,NULL,0.01,0.00,0.00,0.00,0,1,0.00,0.00,NULL,NULL);
/*!40000 ALTER TABLE `Himall_Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ProductAttributes`
--

DROP TABLE IF EXISTS `Himall_ProductAttributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ProductAttributes` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `AttributeId` bigint(20) NOT NULL COMMENT '属性ID',
  `ValueId` bigint(20) NOT NULL COMMENT '属性值ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Attribute_ProductAttribute` (`AttributeId`) USING BTREE,
  KEY `FK_Product_ProductAttribute` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_productattributes_ibfk_1` FOREIGN KEY (`AttributeId`) REFERENCES `Himall_Attributes` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_productattributes_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5915 DEFAULT CHARSET=utf8 COMMENT='商品和属性的中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ProductAttributes`
--

LOCK TABLES `Himall_ProductAttributes` WRITE;
/*!40000 ALTER TABLE `Himall_ProductAttributes` DISABLE KEYS */;
INSERT INTO `Himall_ProductAttributes` VALUES (5059,204,23,0),(5206,186,42,140),(5207,186,42,141),(5208,186,42,269),(5209,186,42,270),(5210,186,43,142),(5211,186,43,143),(5212,186,43,144),(5213,186,43,145),(5214,186,67,273),(5215,186,118,556),(5216,186,118,559),(5217,186,118,561),(5218,186,120,575),(5219,186,121,588),(5220,218,73,313),(5221,218,113,508),(5222,218,114,510),(5223,218,114,511),(5224,218,114,512),(5225,218,115,0),(5226,219,73,313),(5227,219,113,508),(5228,219,114,510),(5229,219,114,511),(5230,219,114,512),(5231,219,114,513),(5232,219,115,0),(5233,220,73,313),(5234,220,113,508),(5235,220,114,510),(5236,220,114,512),(5237,220,114,514),(5238,220,115,0),(5239,221,73,313),(5240,221,113,508),(5241,221,115,0),(5242,222,73,313),(5243,222,113,508),(5244,222,114,510),(5245,222,114,511),(5246,222,114,512),(5247,222,115,0),(5248,223,73,313),(5249,223,113,508),(5250,223,114,510),(5251,223,114,511),(5252,223,114,512),(5253,223,115,0),(5254,224,73,313),(5255,224,113,508),(5256,224,114,510),(5257,224,114,511),(5258,224,115,0),(5259,225,73,313),(5260,225,113,508),(5261,225,115,0),(5262,227,52,191),(5265,230,26,75),(5266,230,26,76),(5267,230,26,77),(5268,230,27,78),(5269,230,27,79),(5270,230,50,182),(5271,231,26,75),(5272,231,26,76),(5273,231,26,77),(5274,231,27,78),(5275,231,27,79),(5276,231,50,181),(5287,234,56,0),(5288,235,54,195),(5289,235,54,197),(5290,235,55,201),(5291,235,55,203),(5292,235,56,206),(5305,236,54,195),(5306,236,54,196),(5307,236,54,197),(5308,236,54,198),(5309,236,54,199),(5310,236,54,200),(5311,236,55,201),(5312,236,55,202),(5313,236,55,203),(5314,236,55,204),(5315,236,55,205),(5316,236,56,207),(5320,238,54,195),(5321,238,54,200),(5322,238,56,0),(5323,241,54,195),(5324,241,54,196),(5325,241,54,197),(5326,241,54,198),(5327,241,55,205),(5328,241,56,206),(5329,243,54,195),(5330,243,54,196),(5331,243,55,202),(5332,243,56,206),(5333,245,56,0),(5334,247,56,0),(5335,249,54,195),(5336,249,54,196),(5337,249,54,197),(5338,249,54,198),(5339,249,54,199),(5340,249,54,200),(5341,249,55,204),(5342,249,55,205),(5343,249,56,207),(5344,251,54,196),(5345,251,54,197),(5346,251,54,198),(5347,251,54,199),(5348,251,55,204),(5349,251,55,205),(5350,251,56,0),(5351,252,54,195),(5352,252,54,197),(5353,252,54,199),(5354,252,55,205),(5355,252,56,0),(5356,253,56,0),(5357,181,42,140),(5358,181,42,141),(5359,181,42,269),(5360,181,42,270),(5361,181,42,271),(5362,181,43,142),(5363,181,43,143),(5364,181,43,144),(5365,181,43,145),(5366,181,43,272),(5367,181,67,273),(5368,181,118,556),(5369,181,118,558),(5370,181,118,559),(5371,181,118,561),(5372,181,118,563),(5373,181,119,566),(5374,181,120,575),(5391,182,42,140),(5392,182,42,141),(5393,182,42,269),(5394,182,43,142),(5395,182,43,143),(5396,182,43,144),(5397,182,43,145),(5398,182,67,273),(5399,182,67,274),(5400,182,118,556),(5401,182,118,558),(5402,182,118,559),(5403,182,118,561),(5404,182,119,566),(5405,182,120,575),(5406,182,121,587),(5409,183,42,140),(5410,183,42,141),(5411,183,42,269),(5412,183,42,270),(5413,183,43,142),(5414,183,43,143),(5415,183,43,144),(5416,183,43,145),(5417,183,67,273),(5418,183,118,556),(5419,183,118,558),(5420,183,118,559),(5421,183,119,566),(5422,183,120,575),(5423,183,121,587),(5424,184,42,140),(5425,184,42,141),(5426,184,42,269),(5427,184,42,270),(5428,184,42,271),(5429,184,43,142),(5430,184,43,143),(5431,184,43,144),(5432,184,43,145),(5433,184,67,273),(5434,184,118,556),(5435,184,118,558),(5436,184,118,561),(5437,184,119,566),(5438,184,120,575),(5439,184,121,587),(5440,185,42,140),(5441,185,42,141),(5442,185,42,269),(5443,185,43,142),(5444,185,43,143),(5445,185,43,144),(5446,185,43,145),(5447,185,67,273),(5448,185,118,556),(5449,185,118,558),(5450,185,118,560),(5451,185,118,561),(5452,185,120,575),(5453,185,121,588),(5454,187,42,140),(5455,187,42,141),(5456,187,42,269),(5457,187,42,270),(5458,187,43,142),(5459,187,43,143),(5460,187,43,144),(5461,187,43,145),(5462,187,67,273),(5463,187,118,556),(5464,187,120,575),(5465,188,42,140),(5466,188,42,141),(5467,188,42,269),(5468,188,42,270),(5469,188,43,142),(5470,188,43,143),(5471,188,43,144),(5472,188,43,145),(5473,188,43,272),(5474,188,118,558),(5475,188,120,575),(5476,188,121,588),(5477,189,42,141),(5478,189,42,269),(5479,189,42,270),(5480,189,43,142),(5481,189,43,143),(5482,189,43,144),(5483,189,43,145),(5484,189,43,272),(5485,189,67,273),(5486,189,118,556),(5487,189,120,575),(5488,189,121,587),(5489,190,42,140),(5490,190,42,141),(5491,190,42,269),(5492,190,42,270),(5493,190,43,142),(5494,190,43,143),(5495,190,43,144),(5496,190,43,145),(5497,190,43,272),(5498,190,67,273),(5499,190,118,556),(5500,190,120,575),(5501,190,121,588),(5502,191,40,131),(5503,191,40,132),(5504,191,40,133),(5505,191,40,134),(5506,191,41,136),(5507,191,41,137),(5508,191,41,138),(5509,191,41,139),(5510,191,41,279),(5511,191,41,280),(5512,191,69,281),(5513,191,69,284),(5514,191,69,285),(5515,191,69,287),(5516,191,69,288),(5517,193,40,131),(5518,193,40,132),(5519,193,40,133),(5520,193,40,134),(5521,193,41,136),(5522,193,41,137),(5523,193,41,138),(5524,193,41,139),(5525,193,69,281),(5526,193,69,282),(5527,193,69,283),(5528,193,69,284),(5529,193,69,285),(5530,194,40,131),(5531,194,40,132),(5532,194,41,136),(5533,194,41,137),(5534,194,41,138),(5535,194,41,139),(5536,194,41,279),(5537,194,69,282),(5538,194,69,283),(5539,194,69,284),(5540,194,69,285),(5541,195,40,131),(5542,195,40,132),(5543,195,40,133),(5544,195,41,136),(5545,195,41,137),(5546,195,41,138),(5547,195,41,139),(5548,195,41,279),(5549,195,41,280),(5550,195,69,281),(5551,195,69,283),(5574,197,40,131),(5575,197,40,132),(5576,197,40,133),(5577,197,40,134),(5578,197,41,136),(5579,197,41,137),(5580,197,41,138),(5581,197,69,281),(5582,197,69,282),(5583,197,69,283),(5584,232,58,227),(5585,232,59,231),(5586,232,59,232),(5587,232,59,233),(5588,232,60,237),(5589,232,60,238),(5590,232,60,239),(5592,229,52,192),(5593,228,52,192),(5594,233,64,260),(5595,233,65,264),(5596,233,66,267),(5599,256,56,0),(5838,301,12,22),(5849,302,26,75),(5850,302,26,76),(5851,302,26,77),(5852,302,27,78),(5853,302,50,178),(5854,303,23,58),(5855,303,51,188),(5856,304,159,742),(5857,304,159,743),(5858,304,159,744),(5859,304,159,745),(5860,305,159,742),(5861,305,159,743),(5862,305,159,744),(5863,305,159,745),(5872,307,23,58),(5873,307,51,187),(5874,196,40,131),(5875,196,40,132),(5876,196,40,133),(5877,196,41,136),(5878,196,41,137),(5879,196,41,138),(5880,196,41,139),(5881,196,69,281),(5882,196,69,282),(5883,196,69,283),(5884,196,69,284),(5885,306,159,742),(5886,306,159,743),(5887,306,159,744),(5888,311,23,60),(5889,312,160,746),(5890,312,161,747),(5909,313,10,289),(5910,313,11,293),(5911,313,12,23),(5912,313,12,24),(5913,313,70,300),(5914,313,70,301);
/*!40000 ALTER TABLE `Himall_ProductAttributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ProductComments`
--

DROP TABLE IF EXISTS `Himall_ProductComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ProductComments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `SubOrderId` bigint(20) DEFAULT NULL COMMENT '订单详细ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `UserName` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `Email` varchar(1000) DEFAULT NULL COMMENT 'Email',
  `ReviewContent` varchar(1000) DEFAULT NULL COMMENT '评价内容',
  `ReviewDate` datetime NOT NULL COMMENT '评价日期',
  `ReviewMark` int(11) NOT NULL COMMENT '评价说明',
  `ReplyContent` varchar(1000) DEFAULT NULL COMMENT '商家回复内容',
  `ReplyDate` datetime DEFAULT NULL COMMENT '商家回复日期',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductComment` (`ProductId`) USING BTREE,
  KEY `SubOrderId` (`SubOrderId`) USING BTREE,
  KEY `ShopId` (`ShopId`) USING BTREE,
  KEY `UserId` (`UserId`) USING BTREE,
  CONSTRAINT `himall_productcomments_ibfk_1` FOREIGN KEY (`SubOrderId`) REFERENCES `Himall_OrderItems` (`Id`),
  CONSTRAINT `himall_productcomments_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`),
  CONSTRAINT `himall_productcomments_ibfk_3` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`),
  CONSTRAINT `himall_productcomments_ibfk_4` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ProductComments`
--

LOCK TABLES `Himall_ProductComments` WRITE;
/*!40000 ALTER TABLE `Himall_ProductComments` DISABLE KEYS */;
INSERT INTO `Himall_ProductComments` VALUES (10,2599,186,1,'官方自营店',541,'selleradmin',NULL,'很帅气','2015-10-08 18:14:47',5,'测试回复','2015-10-10 11:08:52'),(11,2601,301,1,'官方自营店',541,'selleradmin',NULL,'无','2015-10-12 11:44:08',5,'1212','2015-10-13 18:20:43'),(12,2624,302,1,'官方自营店',541,'selleradmin',NULL,'无','2015-10-12 13:56:13',5,'112121111111','2015-10-13 14:26:23'),(13,2650,313,247,'数码旗舰店',593,'quentin',NULL,'无','2015-10-14 10:27:28',5,'谢谢评价','2015-10-14 10:28:06');
/*!40000 ALTER TABLE `Himall_ProductComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ProductConsultations`
--

DROP TABLE IF EXISTS `Himall_ProductConsultations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ProductConsultations` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `ShopId` bigint(20) NOT NULL,
  `ShopName` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `UserId` bigint(20) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `Email` varchar(1000) DEFAULT NULL,
  `ConsultationContent` varchar(1000) DEFAULT NULL COMMENT '咨询内容',
  `ConsultationDate` datetime NOT NULL COMMENT '咨询时间',
  `ReplyContent` varchar(1000) DEFAULT NULL COMMENT '回复内容',
  `ReplyDate` datetime DEFAULT NULL COMMENT '回复日期',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductConsultation` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_productconsultations_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ProductConsultations`
--

LOCK TABLES `Himall_ProductConsultations` WRITE;
/*!40000 ALTER TABLE `Himall_ProductConsultations` DISABLE KEYS */;
INSERT INTO `Himall_ProductConsultations` VALUES (9,301,1,'官方自营店',541,'selleradmin',NULL,'请问这电视机有啥好的','2015-10-13 15:31:31','12121','2015-10-13 18:20:51');
/*!40000 ALTER TABLE `Himall_ProductConsultations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ProductDescriptionTemplates`
--

DROP TABLE IF EXISTS `Himall_ProductDescriptionTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ProductDescriptionTemplates` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Name` varchar(100) NOT NULL COMMENT '板式名称',
  `Position` int(11) NOT NULL COMMENT '位置（上、下）',
  `Content` varchar(4000) NOT NULL COMMENT '板式内容',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='关联版式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ProductDescriptionTemplates`
--

LOCK TABLES `Himall_ProductDescriptionTemplates` WRITE;
/*!40000 ALTER TABLE `Himall_ProductDescriptionTemplates` DISABLE KEYS */;
INSERT INTO `Himall_ProductDescriptionTemplates` VALUES (22,210,'测试顶部板式',1,'<p><img src=\"/Storage/Shop/210/templates/22/7b5f19ca1f674f8e9150d131ff267f34.jpg\" title=\"顶部样式图片.jpg\" alt=\"顶部样式图片.jpg\"/></p>'),(23,227,'苹果',0,'<p>哈哈</p>'),(24,227,'喽啰',0,'<p>尺寸</p>'),(25,210,'通用底部',2,'<p><img src=\"/Storage/Shop/210/templates/0/1838e8dd62e24fb2a66de299b24a62d3.png\" title=\"手动轮播1.png\" alt=\"手动轮播1.png\"/></p>'),(27,1,'测试',1,'<p><img src=\"/Storage/Shop/1/templates/0/86c2f49ef76d4d449bc2e0abdfc6e599.png\" title=\"登录引导图片.png\" alt=\"登录引导图片.png\"/></p>'),(28,1,'啊哈哈',1,'<p>今天</p>');
/*!40000 ALTER TABLE `Himall_ProductDescriptionTemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ProductDescriptions`
--

DROP TABLE IF EXISTS `Himall_ProductDescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ProductDescriptions` (
  `Id` bigint(20) DEFAULT NULL,
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `AuditReason` varchar(1000) DEFAULT NULL COMMENT '审核原因',
  `Description` text COMMENT '详情',
  `DescriptionPrefixId` bigint(20) NOT NULL COMMENT '关联版式',
  `DescriptiondSuffixId` bigint(20) NOT NULL,
  `Meta_Title` varchar(1000) DEFAULT NULL COMMENT 'SEO',
  `Meta_Description` varchar(1000) DEFAULT NULL,
  `Meta_Keywords` varchar(1000) DEFAULT NULL,
  `MobileDescription` text COMMENT '移动端描述',
  PRIMARY KEY (`ProductId`),
  KEY `FK_Product_ProductDescription` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_productdescriptions_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ProductDescriptions`
--

LOCK TABLES `Himall_ProductDescriptions` WRITE;
/*!40000 ALTER TABLE `Himall_ProductDescriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_ProductDescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ProductShopCategories`
--

DROP TABLE IF EXISTS `Himall_ProductShopCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ProductShopCategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `ShopCategoryId` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductShopCategory` (`ProductId`) USING BTREE,
  KEY `FK_ShopCategory_ProductShopCategory` (`ShopCategoryId`) USING BTREE,
  CONSTRAINT `himall_productshopcategories_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_productshopcategories_ibfk_2` FOREIGN KEY (`ShopCategoryId`) REFERENCES `Himall_ShopCategories` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1728 DEFAULT CHARSET=utf8 COMMENT='商品和店铺分类的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ProductShopCategories`
--

LOCK TABLES `Himall_ProductShopCategories` WRITE;
/*!40000 ALTER TABLE `Himall_ProductShopCategories` DISABLE KEYS */;
INSERT INTO `Himall_ProductShopCategories` VALUES (1436,161,297),(1483,204,298),(1556,234,290),(1557,235,290),(1559,236,290),(1560,237,301),(1562,238,292),(1563,239,301),(1564,240,301),(1565,241,291),(1566,242,301),(1567,243,290),(1568,244,301),(1569,245,290),(1570,246,301),(1571,247,290),(1572,248,301),(1573,249,292),(1575,251,290),(1576,252,290),(1577,253,290),(1581,250,301),(1584,254,298),(1585,255,298),(1614,256,301),(1724,310,325),(1727,314,330);
/*!40000 ALTER TABLE `Himall_ProductShopCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ProductVistis`
--

DROP TABLE IF EXISTS `Himall_ProductVistis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ProductVistis` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `Date` datetime NOT NULL,
  `VistiCounts` bigint(20) NOT NULL COMMENT '浏览次数',
  `SaleCounts` bigint(20) NOT NULL COMMENT '销售量',
  `SaleAmounts` decimal(18,2) NOT NULL COMMENT '销售额',
  `OrderCounts` bigint(20) unsigned DEFAULT '0' COMMENT '订单总数',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ProductVisti` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_productvistis_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2331 DEFAULT CHARSET=utf8 COMMENT='商品浏览记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ProductVistis`
--

LOCK TABLES `Himall_ProductVistis` WRITE;
/*!40000 ALTER TABLE `Himall_ProductVistis` DISABLE KEYS */;
INSERT INTO `Himall_ProductVistis` VALUES (2171,194,'2015-10-08 15:39:05',1,0,0.00,NULL),(2172,189,'2015-10-08 15:42:41',17,0,0.00,NULL),(2173,193,'2015-10-08 15:44:07',1,0,0.00,NULL),(2174,185,'2015-10-08 15:47:30',1,0,0.00,NULL),(2175,187,'2015-10-08 15:55:33',1,0,0.00,NULL),(2176,184,'2015-10-08 15:58:22',3,0,0.00,NULL),(2177,188,'2015-10-08 16:03:11',2,0,0.00,NULL),(2178,252,'2015-10-08 16:07:02',1,0,0.00,NULL),(2179,251,'2015-10-08 16:08:20',1,0,0.00,NULL),(2180,301,'2015-10-08 16:25:02',10,0,0.00,1),(2181,191,'2015-10-08 16:45:37',2,0,0.00,NULL),(2182,186,'2015-10-08 18:11:42',2,1,45.00,1),(2183,182,'2015-10-08 18:16:32',1,0,0.00,NULL),(2184,243,'2015-10-08 23:10:16',1,0,0.00,NULL),(2185,189,'2015-10-09 08:43:34',4,0,0.00,NULL),(2186,228,'2015-10-09 08:56:57',2,0,0.00,NULL),(2187,193,'2015-10-09 08:59:15',3,0,0.00,NULL),(2188,301,'2015-10-09 09:51:21',11,1,20.00,NULL),(2189,230,'2015-10-09 09:54:39',3,0,0.00,NULL),(2190,227,'2015-10-09 10:49:14',1,0,0.00,NULL),(2191,186,'2015-10-09 10:52:46',8,0,0.00,NULL),(2192,243,'2015-10-09 11:13:24',1,0,0.00,NULL),(2193,239,'2015-10-09 11:19:08',3,0,0.00,NULL),(2194,245,'2015-10-09 11:20:12',1,0,0.00,NULL),(2195,252,'2015-10-09 13:50:30',1,0,0.00,NULL),(2196,256,'2015-10-09 13:50:56',5,0,0.00,NULL),(2197,250,'2015-10-09 14:22:08',4,0,0.00,NULL),(2198,253,'2015-10-09 14:31:50',1,0,0.00,NULL),(2199,302,'2015-10-09 14:44:57',12,1,0.01,1),(2200,241,'2015-10-09 16:00:29',1,0,0.00,NULL),(2201,224,'2015-10-09 16:00:39',1,0,0.00,NULL),(2202,230,'2015-10-10 08:23:27',8,0,0.00,NULL),(2203,189,'2015-10-10 09:27:23',17,0,0.00,NULL),(2204,187,'2015-10-10 09:29:03',4,0,0.00,NULL),(2205,182,'2015-10-10 09:29:11',2,0,0.00,NULL),(2206,244,'2015-10-10 10:34:57',2,0,0.00,NULL),(2207,301,'2015-10-10 10:36:48',12,0,0.00,NULL),(2208,250,'2015-10-10 10:52:55',12,0,0.00,NULL),(2209,302,'2015-10-10 11:30:14',18,2,0.02,NULL),(2210,186,'2015-10-10 14:51:54',1,0,0.00,NULL),(2211,246,'2015-10-10 15:12:45',2,0,0.00,NULL),(2212,241,'2015-10-10 15:17:51',3,0,0.00,NULL),(2213,252,'2015-10-10 15:17:52',3,0,0.00,NULL),(2214,245,'2015-10-10 15:40:06',1,0,0.00,NULL),(2215,253,'2015-10-10 15:40:56',1,0,0.00,NULL),(2216,256,'2015-10-10 15:47:39',1,0,0.00,NULL),(2217,188,'2015-10-10 15:51:00',2,0,0.00,NULL),(2218,225,'2015-10-10 16:12:46',1,0,0.00,NULL),(2219,228,'2015-10-10 22:18:21',2,0,0.00,NULL),(2220,224,'2015-10-10 22:27:32',1,0,0.00,NULL),(2221,219,'2015-10-10 22:29:10',1,0,0.00,NULL),(2222,222,'2015-10-10 22:33:27',1,0,0.00,NULL),(2223,227,'2015-10-10 22:39:08',1,0,0.00,NULL),(2224,226,'2015-10-10 22:40:20',1,0,0.00,NULL),(2225,229,'2015-10-10 22:43:38',1,0,0.00,NULL),(2226,242,'2015-10-10 23:50:25',1,0,0.00,NULL),(2227,239,'2015-10-10 23:50:26',1,0,0.00,NULL),(2228,248,'2015-10-10 23:50:27',1,0,0.00,NULL),(2229,223,'2015-10-11 00:17:00',2,0,0.00,NULL),(2230,237,'2015-10-11 11:17:44',2,0,0.00,NULL),(2231,230,'2015-10-11 11:41:19',3,0,0.00,NULL),(2232,186,'2015-10-11 15:17:18',3,0,0.00,NULL),(2233,252,'2015-10-11 15:18:08',1,0,0.00,NULL),(2234,253,'2015-10-11 15:18:09',2,0,0.00,NULL),(2235,301,'2015-10-11 15:19:06',1,0,0.00,NULL),(2236,181,'2015-10-11 15:19:43',1,0,0.00,NULL),(2237,189,'2015-10-11 15:24:13',4,0,0.00,NULL),(2238,302,'2015-10-11 15:25:36',3,0,0.00,NULL),(2239,256,'2015-10-11 16:54:24',1,0,0.00,NULL),(2240,228,'2015-10-11 19:02:59',3,0,0.00,NULL),(2241,231,'2015-10-11 22:11:44',2,0,0.00,NULL),(2242,235,'2015-10-11 22:41:17',1,0,0.00,NULL),(2243,222,'2015-10-11 23:07:40',1,0,0.00,NULL),(2244,192,'2015-10-11 23:41:35',4,0,0.00,NULL),(2245,248,'2015-10-12 01:05:47',3,0,0.00,NULL),(2246,240,'2015-10-12 01:50:40',2,0,0.00,NULL),(2247,250,'2015-10-12 01:50:40',6,0,0.00,NULL),(2248,244,'2015-10-12 01:50:41',5,0,0.00,NULL),(2249,231,'2015-10-12 08:52:18',2,0,0.00,NULL),(2250,301,'2015-10-12 08:54:48',11,0,0.00,NULL),(2251,230,'2015-10-12 09:17:38',5,0,0.00,NULL),(2252,302,'2015-10-12 10:09:42',14,2,0.02,NULL),(2253,226,'2015-10-12 10:16:21',3,0,0.00,NULL),(2254,225,'2015-10-12 10:20:49',4,0,0.00,NULL),(2255,242,'2015-10-12 10:22:06',2,0,0.00,NULL),(2256,246,'2015-10-12 10:30:26',3,0,0.00,NULL),(2257,190,'2015-10-12 10:36:41',1,0,0.00,NULL),(2258,253,'2015-10-12 11:18:22',1,0,0.00,NULL),(2259,234,'2015-10-12 11:55:24',1,1,190.00,NULL),(2260,186,'2015-10-12 00:00:00',5,0,0.00,0),(2261,237,'2015-10-12 12:58:20',1,0,0.00,NULL),(2262,219,'2015-10-12 13:23:33',2,0,0.00,NULL),(2263,218,'2015-10-12 13:34:51',1,0,0.00,NULL),(2264,241,'2015-10-12 13:44:44',1,0,0.00,NULL),(2265,184,'2015-10-12 13:46:37',1,0,0.00,NULL),(2266,303,'2015-10-12 15:01:19',8,0,0.00,NULL),(2267,189,'2015-10-12 16:24:09',2,0,0.00,NULL),(2268,306,'2015-10-12 16:33:37',12,0,0.00,NULL),(2269,305,'2015-10-12 20:34:42',1,0,0.00,NULL),(2270,222,'2015-10-12 22:50:17',1,0,0.00,NULL),(2271,194,'2015-10-12 23:13:31',1,0,0.00,NULL),(2272,184,'2015-10-13 08:56:16',6,1,58.00,NULL),(2273,194,'2015-10-13 09:15:07',3,1,159.00,NULL),(2274,230,'2015-10-13 11:01:12',26,0,0.00,NULL),(2275,302,'2015-10-13 11:01:26',11,0,0.00,NULL),(2276,301,'2015-10-13 11:15:43',15,0,0.00,NULL),(2277,307,'2015-10-13 11:24:49',2,0,0.00,NULL),(2278,237,'2015-10-13 12:17:35',1,0,0.00,NULL),(2279,241,'2015-10-13 12:17:53',2,0,0.00,NULL),(2280,242,'2015-10-13 12:18:00',1,0,0.00,NULL),(2281,227,'2015-10-13 12:42:12',1,0,0.00,NULL),(2282,226,'2015-10-13 12:42:17',2,0,0.00,NULL),(2283,306,'2015-10-13 12:46:56',10,0,0.00,NULL),(2284,305,'2015-10-13 12:47:24',5,0,0.00,NULL),(2285,303,'2015-10-13 12:47:36',1,0,0.00,NULL),(2286,229,'2015-10-13 13:16:22',1,0,0.00,NULL),(2287,235,'2015-10-13 13:26:22',1,0,0.00,NULL),(2288,234,'2015-10-13 13:27:05',2,0,0.00,NULL),(2289,231,'2015-10-13 14:41:08',3,0,0.00,NULL),(2290,222,'2015-10-13 14:42:02',1,0,0.00,NULL),(2291,253,'2015-10-13 14:46:01',8,0,0.00,NULL),(2292,310,'2015-10-13 15:13:01',2,0,0.00,NULL),(2293,248,'2015-10-13 15:48:05',2,0,0.00,NULL),(2294,196,'2015-10-13 15:48:59',10,1,0.01,NULL),(2295,186,'2015-10-13 16:12:32',3,0,0.00,NULL),(2296,304,'2015-10-13 16:50:26',2,0,0.00,NULL),(2297,256,'2015-10-13 17:33:28',2,0,0.00,NULL),(2298,228,'2015-10-13 17:37:33',1,0,0.00,NULL),(2299,245,'2015-10-13 17:40:20',2,0,0.00,NULL),(2300,311,'2015-10-13 21:07:06',1,0,0.00,NULL),(2301,236,'2015-10-13 21:16:35',2,0,0.00,NULL),(2302,301,'2015-10-14 04:27:53',6,0,0.00,NULL),(2303,196,'2015-10-14 08:14:43',10,2,0.02,NULL),(2304,302,'2015-10-14 08:59:25',4,0,0.00,NULL),(2305,189,'2015-10-14 09:18:38',1,0,0.00,NULL),(2306,184,'2015-10-14 09:24:20',1,0,0.00,NULL),(2307,312,'2015-10-14 09:51:58',7,0,0.00,NULL),(2308,313,'2015-10-14 10:04:18',36,2,0.02,NULL),(2309,306,'2015-10-14 10:18:29',3,0,0.00,NULL),(2310,305,'2015-10-14 10:19:05',1,0,0.00,NULL),(2311,242,'2015-10-14 11:56:53',1,0,0.00,NULL),(2312,230,'2015-10-14 12:25:09',7,0,0.00,NULL),(2313,219,'2015-10-14 12:29:37',6,0,0.00,NULL),(2314,187,'2015-10-14 12:34:25',3,0,0.00,NULL),(2315,231,'2015-10-14 12:58:52',4,0,0.00,NULL),(2316,225,'2015-10-14 12:58:55',4,0,0.00,NULL),(2317,221,'2015-10-14 12:59:04',3,0,0.00,NULL),(2318,246,'2015-10-14 12:59:39',35,0,0.00,NULL),(2319,220,'2015-10-14 13:19:37',3,0,0.00,NULL),(2320,252,'2015-10-14 14:15:01',1,0,0.00,NULL),(2321,185,'2015-10-14 14:17:14',3,1,60.00,NULL),(2322,224,'2015-10-14 14:24:59',1,0,0.00,NULL),(2323,249,'2015-10-14 15:05:36',1,0,0.00,NULL),(2324,248,'2015-10-14 15:06:07',1,0,0.00,NULL),(2325,235,'2015-10-14 15:07:25',3,0,0.00,NULL),(2326,244,'2015-10-14 15:23:21',3,0,0.00,NULL),(2327,237,'2015-10-14 15:24:48',1,0,0.00,NULL),(2328,303,'2015-10-14 15:26:12',1,0,0.00,NULL),(2329,314,'2015-10-14 15:43:32',7,0,0.00,NULL),(2330,245,'2015-10-14 16:42:43',1,0,0.00,NULL);
/*!40000 ALTER TABLE `Himall_ProductVistis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Products`
--

DROP TABLE IF EXISTS `Himall_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Products` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `CategoryId` bigint(20) NOT NULL COMMENT '分类ID',
  `CategoryPath` varchar(100) NOT NULL COMMENT '分类路径',
  `TypeId` bigint(20) NOT NULL COMMENT '类型ID',
  `BrandId` bigint(20) NOT NULL COMMENT '品牌ID',
  `ProductName` varchar(100) NOT NULL COMMENT '商品名称',
  `ProductCode` varchar(100) DEFAULT NULL COMMENT '商品编号',
  `ShortDescription` varchar(4000) DEFAULT NULL COMMENT '广告词',
  `SaleStatus` int(11) NOT NULL COMMENT '销售状态',
  `AuditStatus` int(11) NOT NULL COMMENT '审核状态',
  `AddedDate` datetime NOT NULL COMMENT '添加日期',
  `DisplaySequence` bigint(20) NOT NULL COMMENT '显示顺序',
  `ImagePath` varchar(100) DEFAULT NULL COMMENT '存放图片的目录',
  `MarketPrice` decimal(18,2) NOT NULL COMMENT '市场价',
  `MinSalePrice` decimal(18,2) NOT NULL COMMENT '最小销售价',
  `HasSKU` tinyint(1) NOT NULL COMMENT '是否有SKU',
  `VistiCounts` bigint(20) NOT NULL COMMENT '浏览次数',
  `SaleCounts` bigint(20) NOT NULL COMMENT '销售量',
  `FreightTemplateId` bigint(20) NOT NULL COMMENT '运费模板ID',
  `Weight` decimal(18,2) DEFAULT NULL COMMENT '重量',
  `Volume` decimal(18,2) DEFAULT NULL COMMENT '体积',
  `Quantity` int(11) DEFAULT NULL COMMENT '数量',
  `MeasureUnit` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `EditStatus` int(11) NOT NULL DEFAULT '0' COMMENT '修改状态 0 正常 1己修改 2待审核 3 己修改并待审核',
  PRIMARY KEY (`Id`),
  KEY `FK_SHOPID` (`ShopId`),
  KEY `FK_CategoryId` (`CategoryId`),
  CONSTRAINT `FK_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `Himall_Categories` (`Id`),
  CONSTRAINT `FK_SHOPID` FOREIGN KEY (`ShopId`) REFERENCES `himall_shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8 COMMENT='商品主表，存放常用数据，\r\n还有一个Himall_ProductDescriptions表，存放商品的其他信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Products`
--

LOCK TABLES `Himall_Products` WRITE;
/*!40000 ALTER TABLE `Himall_Products` DISABLE KEYS */;
INSERT INTO `Himall_Products` VALUES (161,223,202,'186|188|202',26,0,'ANNE KLEIN 淑/女百搭\\无袖连衣裙','','',1,2,'2015-07-08 17:19:14',1,'/Storage/Shop/223/Products//161',100.00,100.00,1,0,2,99,NULL,NULL,NULL,NULL,0),(181,1,331,'312|316|331',21,0,'依泽麦布2015 运动套装T恤 男夏新款 短袖T恤男修身印花 男士短袖T恤衫 t恤 男 短 蓝色- ','','支持货到付款……潮男修身短袖T恤套装（上衣+裤子）',1,2,'2015-07-14 19:39:12',1,'/Storage/Shop/1/Products/181',88.00,128.00,1,0,0,103,0.00,0.00,NULL,'kg',0),(182,1,331,'312|316|331',21,0,'keircy2015夏装上新潮修身男士印花短袖T恤男装半袖t恤衫 白色 M','','支持货到付款……潮男时尚修身短袖T恤',1,2,'2015-07-14 19:44:39',1,'/Storage/Shop/1/Products/182',89.00,59.00,1,0,0,103,0.00,0.00,NULL,'kg',0),(183,1,331,'312|316|331',21,0,'古莱登 2015夏套装上新男士短袖POLO衫/T恤男高品质短袖T恤男 白 L','','全场满减优惠！优惠详询客服～！',1,2,'2015-07-14 19:49:04',1,'/Storage/Shop/1/Products/183',148.00,108.00,1,0,0,103,0.00,0.00,NULL,'kg',0),(184,1,331,'312|316|331',21,0,'2015夏季男士短袖T恤 韩版修身纯棉半袖体恤青春夏装上衣服潮男装','','2件减10元 3件减20元 全国包邮 送运费险',1,2,'2015-07-14 19:53:47',1,'/Storage/Shop/1/Products/184',158.00,58.00,1,0,0,103,0.00,0.00,NULL,'kg',0),(185,1,331,'312|316|331',21,0,'2015男士休闲短裤男夏天潮修身5分五分裤夏季沙滩裤薄中裤子7七分','','纯棉 一1件65元 一2件119 一3件169',1,2,'2015-07-14 19:56:58',1,'/Storage/Shop/1/Products/185',200.00,60.00,1,0,1,103,0.00,0.00,NULL,'kg',0),(186,1,336,'312|318|336',21,0,'2015男士休闲短裤男夏天潮修身5分五分裤夏季沙滩裤薄中裤子7七分','','3件141 4件184 日销3千件 100%棉',1,2,'2015-07-14 20:00:29',1,'/Storage/Shop/1/Products/186',288.00,45.00,1,0,1,103,0.00,0.00,NULL,'kg',0),(187,1,336,'312|318|336',21,0,'春夏季薄款九分裤男士休闲裤9分裤子男装小脚中裤修身英伦韩版潮','','夏季薄款 小脚九分裤 舒适弹力 型男必备 抢抢抢',1,2,'2015-07-14 20:03:47',1,'/Storage/Shop/1/Products/187',150.00,48.80,1,0,0,103,0.00,0.00,NULL,'件',0),(188,1,334,'312|318|334',21,0,'Le hondies夏季超薄款男士牛仔短裤大码5分牛仔裤中裤男装五分裤','','超薄面料 清凉透气 简约款式 穿着舒适 夏季必备',1,2,'2015-07-14 20:06:27',1,'/Storage/Shop/1/Products/188',159.00,59.00,1,0,0,103,0.00,0.00,NULL,'件',0),(189,1,336,'312|318|336',21,0,'公爵车春夏季薄款男士休闲裤小脚男裤子修身直筒长裤韩版潮男装棉','','高端纯棉 大牌风范 舒适透气 15天退换货',1,2,'2015-07-14 20:08:36',1,'/Storage/Shop/1/Products/189',189.00,59.00,1,0,0,103,0.00,0.00,NULL,'件',0),(190,1,334,'312|318|334',21,0,'夏季薄款男士修身牛仔短裤大码5分裤7七分裤男夏天牛仔裤五分中裤','','轻薄透气 送运费险 品质保证 夏季必备',1,2,'2015-07-14 20:10:44',1,'/Storage/Shop/1/Products/190',289.00,88.00,1,0,0,103,0.00,0.00,NULL,'件',0),(191,1,364,'352|355|364',20,0,'韩都衣舍韩版2015夏装新款女装字母印花纱网拼接宽松T恤MR4157汩','','简约圆领短袖 字母印花装饰 韩版百搭款式',1,2,'2015-07-14 20:14:17',1,'/Storage/Shop/1/Products/191',288.00,119.00,1,0,0,103,0.00,0.00,NULL,'件',0),(192,1,364,'352|355|364',20,0,'拉夏贝尔SPORT2015夏新品雪纺印花裙 衬衫领无袖连衣裙20006170','','',1,2,'2015-07-14 20:16:32',1,'/Storage/Shop/1/Products/192',309.00,159.00,1,0,0,103,0.00,0.00,NULL,'件',0),(193,1,364,'352|355|364',20,0,'润乙一2015夏装假两件套无袖印花连衣裙夏季中长款女裙小清新女装','','热销款 S/M预 7.20 身高',1,2,'2015-07-14 20:19:19',1,'/Storage/Shop/1/Products/193',508.00,189.00,1,0,0,103,0.00,0.00,NULL,'件',0),(194,1,364,'352|355|364',20,0,'欧芮儿2015夏季新款女装甜美优雅印花拼接无袖连衣裙高腰a字裙夏','','性感拼接 飞鸟印花 荷叶下摆 甜美可爱气质',1,2,'2015-07-14 20:21:58',1,'/Storage/Shop/1/Products/194',508.00,159.00,1,0,1,103,0.00,0.00,NULL,'件',0),(195,1,364,'352|355|364',20,0,'妖精的口袋 冷月灯笼 欧美夏装女腰间抽绳趣味印花连衣裙','','胶印 罗纹 腰间抽绳',1,2,'2015-07-14 20:27:34',1,'/Storage/Shop/1/Products/195',888.00,250.00,1,0,0,103,0.00,0.00,NULL,'件',0),(196,1,364,'352|355|364',20,0,'香影2015夏装新款时尚印花褶皱连衣裙沙滩裙韩版修身无袖中裙 兰色 S','','夏装特惠季,全场低至1折，满299减50 满399减100，支持货到付款！',1,2,'2015-07-14 20:39:06',1,'/Storage/Shop/1/Products/196',852.00,0.01,1,0,3,103,0.00,0.00,NULL,'件',0),(197,1,364,'352|355|364',20,0,'香影2015夏季连衣裙女短袖新款韩版修身蕾丝拼接淑女荷叶边短裙潮 白色 S','','夏装特惠季,全场低至1折，满299减50 满399减100，支持货到付款！',1,2,'2015-07-14 20:42:15',1,'/Storage/Shop/1/Products/197',388.00,158.00,1,0,0,107,0.00,1.00,NULL,'件',0),(218,1,460,'448|450|460',9,0,'巧迪尚惠彩妆套装全套组合正品美妆裸妆淡妆初学者化妆品套装彩妆','','先领券再购买 送17件赠品',1,2,'2015-07-16 17:58:46',1,'/Storage/Shop/1/Products/218',388.00,129.00,1,0,0,103,0.00,0.00,NULL,'件',0),(219,1,460,'448|450|460',9,0,'ILISYA化妆品彩妆套装初学者全套组合正品 裸妆淡妆美妆工具正品','','安全植物彩妆 孕妇儿童可用 送使用教程 正品',1,2,'2015-07-16 18:05:39',1,'/Storage/Shop/1/Products/219',588.00,88.00,1,0,0,103,0.00,0.00,NULL,'件',0),(220,1,463,'448|450|463',9,0,'Dior/迪奥香水3件套装女士 真我花漾甜心魅惑礼盒版5ml五Q版小样','','',1,2,'2015-07-16 18:11:47',1,'/Storage/Shop/1/Products/220',555.00,168.00,1,0,0,103,0.00,0.00,NULL,'瓶',0),(221,1,463,'448|450|463',9,0,'冰希黎DIVA娇之真我50ML女士香水女士淡香持久清新法国正品送小样','','送3支小样 +精美礼品袋 免费试闻 30天退换',1,2,'2015-07-16 18:20:49',1,'/Storage/Shop/1/Products/221',755.00,58.00,1,0,0,103,0.00,0.00,NULL,'件',0),(222,1,477,'448|456|477',9,0,'新品首发 美宝莲绝色持久炼焰凝彩唇釉 唇彩唇蜜口红滋润保湿正品','','含花蜜精华 淡化唇纹 水亮持久 柔滑滋润',1,2,'2015-07-16 18:44:37',1,'/Storage/Shop/1/Products/222',588.00,88.00,1,0,0,103,0.00,0.00,NULL,'件',0),(223,1,477,'448|456|477',9,0,'包邮 Dior迪奥 魅惑丰唇蜜 骨胶原活性唇彩 俏唇蜜6ml 抚平唇纹','','丰盈性感 保湿滋润',1,2,'2015-07-16 18:48:35',1,'/Storage/Shop/1/Products/223',388.00,118.00,1,0,0,103,0.00,0.00,NULL,'件',0),(224,1,460,'448|450|460',9,0,'玛丽黛佳 王牌嫁接睫毛膏纤长浓密卷翘/防水防汗不晕染','','嫁接式睫毛膏 瞬间解决 短小睫毛',1,2,'2015-07-16 18:57:49',1,'/Storage/Shop/1/Products/224',79.00,59.00,1,0,0,103,0.00,0.00,NULL,'件',0),(225,1,460,'448|450|460',9,0,'卡姿兰睫毛膏 黑密度大眼睛睫毛膏 纤长卷翘浓密不晕染防水包邮','','全网销量冠军 瞬间浓密 纤长卷翘 防水不晕染',1,2,'2015-07-16 19:05:00',1,'/Storage/Shop/1/Products/225',188.00,88.00,1,0,0,103,0.00,0.00,NULL,'件',0),(226,1,52,'13|14|52',24,0,'AUX/奥克斯 KFR-35GW/BpHRB+3大1.5匹高端智能云变频挂机空调','','智能wifi 稀土压缩机 高效除甲醛 内外静音',1,2,'2015-07-16 19:10:27',1,'/Storage/Shop/1/Products/226',2999.00,1888.00,1,0,0,103,0.00,0.00,NULL,'件',0),(227,1,52,'13|14|52',24,0,'Midea/美的 KFR-26GW/WPAD3大1匹1P 壁挂式家用冷暖定速空调挂机','','库存告急 欲购从速 强力电机 稳压运行 快速冷热',1,2,'2015-07-16 19:13:36',1,'/Storage/Shop/1/Products/227',3999.00,2199.00,1,0,0,103,0.00,0.00,NULL,'件',0),(228,1,97,'13|14|97',24,0,'Midea/美的 BCD-206TM(E) 三门电冰箱三开门节能家用软冷冻智能','','三门热销款 三万多好评 1298元 错过不再',1,2,'2015-07-16 19:16:35',1,'/Storage/Shop/1/Products/228',3099.00,1298.00,1,0,0,103,0.00,0.00,NULL,'件',0),(229,1,97,'13|14|97',24,0,'Haier/海尔 BCD-206STPA/206升三门家用电冰箱/软冷冻/冷藏冷冻','','软冷冻技术 肉食不用化冻 即时切',1,2,'2015-07-16 19:19:50',1,'/Storage/Shop/1/Products/229',1499.00,1399.00,1,0,0,103,0.00,0.00,NULL,'件',0),(230,1,128,'20|121|128',13,0,'Canon/佳能700d 18-55 stm套机700D小套 佳能入门单反相机 包邮','','普及型单反 全新正品行货 机打发票 全国联保',1,2,'2015-07-16 19:23:13',1,'/Storage/Shop/1/Products/230',4099.00,3499.00,1,0,0,103,0.00,0.00,NULL,'件',0),(231,1,126,'20|121|126',13,0,'Sony/索尼 DSC-W810 数码相机/照相机 6倍光学变焦 2010万像素','','赠包自拍镜 6倍变焦 2010万像 素',1,2,'2015-07-16 19:27:11',1,'/Storage/Shop/1/Products/231',599.00,566.00,1,0,0,103,0.00,0.00,NULL,'件',0),(232,1,204,'186|189|204',26,0,'KGC O3骑士按摩椅 家用太空舱 全身多功能 电动按摩椅沙发椅正品','','程序无限升级 头部双效理疗 滚轮刮痧 赢免单',1,2,'2015-07-16 19:33:44',1,'/Storage/Shop/1/Products/232',24888.00,8888.00,1,0,0,103,0.00,0.00,NULL,'件',0),(233,1,289,'264|268|289',28,0,'卡贝 厨房置物架壁挂 五金刀架用品收纳架 304不锈钢厨房挂件挂架','','销量领先 好评过万 真正304 不锈钢 加宽台面',1,2,'2015-07-16 19:39:08',1,'/Storage/Shop/1/Products/233',498.00,168.00,1,0,0,103,0.00,0.00,NULL,'件',0),(234,210,64,'23|24|64',25,265,'      清华同方（TongFang）精锐X200H-BI02 18.5英寸台式电脑(G1840 ','125','疯抢价，只要1999！双核办公利器，强大扩展，大牌专享三年上门！',1,2,'2015-07-17 16:42:25',1,'/Storage/Shop/210/Products/234',19.00,190.00,1,0,1,99,2.00,0.00,NULL,'件',0),(235,210,64,'23|24|64',25,265,'      清华同方U850台式电脑23英寸屏 i5-4460 4G 1T 2G独显 带wifi  ','5','现货发售，内置蓝牙，WiFi，销量冠军！做电脑我们是认真的！',1,2,'2015-07-17 16:49:53',1,'/Storage/Shop/210/Products/235',54.00,5000.00,1,0,0,99,5.00,0.00,NULL,'件',0),(236,210,65,'23|24|65',25,265,'      联想（Lenovo）YOGA3 11 11.6英寸触控超薄本 （5Y10 4G 256G','4444','大联想年度旗舰 256G纯SSD极速运行 星爸爸、头等仓必备利器 回头率100%',1,2,'2015-07-17 16:53:55',1,'/Storage/Shop/210/Products/236',59222.00,55500.00,1,0,0,99,5.00,0.00,NULL,'件',0),(237,215,357,'352|353|357',20,0,'AMII及简2015夏纯色T恤女镂空花边拼接宽松大码圆领上衣','','',1,2,'2015-07-17 17:02:35',1,'/Storage/Shop/215/Products/237',899.00,699.00,1,0,0,107,0.00,0.00,NULL,'件',0),(238,210,65,'23|24|65',25,265,'    整机厚度15.8mm，重量仅1.1kg，360°自由翻转， 四种使用模式，满足更多使用环境！','22','【11英寸外形 13.3英寸屏幕！】全新XPS王者归来 模具全新升级！最薄处仅9mm！搭载全新第五代i7处理器！',1,2,'2015-07-17 17:03:00',1,'/Storage/Shop/210/Products/238',2269.00,5592.00,1,0,0,107,52.00,0.00,NULL,'件',0),(239,215,357,'352|353|357',20,0,'AMII及简2015夏纯色T恤女镂空花边拼接宽松大码圆领上衣','','',1,2,'2015-07-17 17:07:52',1,'/Storage/Shop/215/Products/239',799.00,699.00,1,0,0,107,0.00,0.00,NULL,'件',0),(240,215,357,'352|353|357',20,0,'AMII及简2015夏新品圆领泼墨印花破洞多色大码背心上衣女','','',1,2,'2015-07-17 17:11:56',1,'/Storage/Shop/215/Products/240',399.00,199.00,1,0,0,107,0.00,0.00,NULL,'件',0),(241,210,64,'23|24|64',25,0,'2015新款Apple/苹果 MacBook Air MJVE2CH/A 13.3/128GB电脑','','国行正品 全国联保 售后无忧',1,2,'2015-07-17 17:16:34',1,'/Storage/Shop/210/Products/241',10999.00,6888.00,1,0,0,99,1.00,0.00,NULL,'台',0),(242,215,357,'352|353|357',20,0,'AMII及简2015夏烫金蛇纹印花雪纺背心圆领褶皱吊带上衣','','',1,2,'2015-07-17 17:17:14',1,'/Storage/Shop/215/Products/242',699.00,399.00,1,0,0,107,0.00,0.00,NULL,'件',0),(243,210,64,'23|24|64',25,265,'      酷爱（COOAV）一体机电脑1037双核台式机电脑 19.5英寸4G/500G     ','2','已直降389元19.5寸4G/500G今日特价',1,2,'2015-07-17 17:19:30',1,'/Storage/Shop/210/Products/243',5522.00,5555.00,1,0,0,99,55.00,0.00,NULL,'件',0),(244,215,357,'352|353|357',20,0,'AMII及简2015夏新灯笼式大圆领显瘦宽松纯色长款连衣裙','','',1,2,'2015-07-17 17:22:15',1,'/Storage/Shop/215/Products/244',699.00,499.00,1,0,0,107,0.00,0.00,NULL,'件',0),(245,210,64,'23|24|64',25,265,'未来人类（Terrans Force）P57 17.3英寸游戏本(六核i7-4960X 32G 1.','5','全网六核双显游戏神器！高端大气上档次，狂拽炫酷吊炸天~',1,2,'2015-07-17 17:26:01',1,'/Storage/Shop/210/Products/245',8256.00,5555.00,1,0,0,100,0.00,55.00,NULL,'件',0),(246,215,357,'352|353|357',20,0,'AMII及简2015夏纯色圆领百搭短袖T恤镂空拼蕾丝女修身打底衫','','',1,2,'2015-07-17 17:27:33',1,'/Storage/Shop/215/Products/246',699.00,499.00,1,0,0,107,0.00,0.00,NULL,'件',0),(247,210,142,'23|136|142',25,265,'TP-LINK TL-WN725N 微型150M无线USB网卡','225','精致小巧，易携带，TP品质，值得信赖！',1,2,'2015-07-17 17:31:29',1,'/Storage/Shop/210/Products/247',51.00,521.00,1,0,3,100,0.00,2.00,NULL,'个',0),(248,215,357,'352|353|357',20,0,'AMII极简2015秋新修身拼接雪纺开衩下摆修身长袖长款毛衣','','',1,2,'2015-07-17 17:31:40',1,'/Storage/Shop/215/Products/248',399.00,299.00,1,0,0,107,0.00,0.00,NULL,'件',0),(249,210,65,'23|24|65',25,0,'送u盘Thinkpad IBM X250 X250 20CL-A06CCD CCD i5-5200U','','天猫分期 五代酷睿 HD5500 经典触摸板',1,2,'2015-07-17 17:34:07',1,'/Storage/Shop/210/Products/249',6599.00,6099.00,1,0,0,100,0.00,1.00,NULL,'台',0),(250,215,357,'352|353|357',20,0,'AMII及简2015秋新品A型大摆圆领撞色开衫大码羊毛衣女','','',1,2,'2015-07-17 17:36:48',1,'/Storage/Shop/215/Products/250',10.00,0.01,1,0,7,107,0.00,0.00,NULL,'件',0),(251,210,64,'23|24|64',25,0,'QRTECH 麦本本 小麦2X 2G独显15.6寸超薄游戏本 固态笔记本电脑','','i7独显 15寸 十色可选 30天试用 全国联保',1,2,'2015-07-17 17:40:29',1,'/Storage/Shop/210/Products/251',4999.00,3488.00,1,0,0,99,1.00,0.00,NULL,'台',0),(252,210,64,'23|24|64',25,265,'Apple MacBook 12英寸笔记本 金色 512GB闪存 MK4N2CH/A','2','苹果air，苹果pro，Air，air，Pro，pro，MacBook，苹果笔记本，新品上市',1,2,'2015-07-17 17:49:42',1,'/Storage/Shop/210/Products/252',9666.00,5999.00,1,0,0,100,0.00,55.00,NULL,'件',0),(253,210,64,'23|24|64',25,265,'      宏碁（acer）V3-572G 15.6英寸超薄本（i5-5200U 4G 500G G','4','【热销~】纤薄机身搭配5代cpu 840高端显卡！要的就是性能！刷本？不在话下！',1,2,'2015-07-17 17:56:33',1,'/Storage/Shop/210/Products/253',4452.00,3799.00,1,0,0,99,55.00,0.00,NULL,'件',0),(256,215,141,'23|135|141',25,0,'可口可乐 碳酸饮料 汽水330ml/罐','','',1,2,'2015-07-20 11:00:54',1,'/Storage/Shop/215/Products/256',5.00,1.00,1,0,8,107,0.00,0.00,NULL,'罐',0),(301,1,44,'5|7|44',1,126,'地方第三方倒萨','66','斯蒂芬斯蒂芬d\'s',1,2,'2015-10-08 16:19:55',1,'/Storage/Shop/1/Products/301',120.00,100.00,1,0,1,103,0.00,0.00,NULL,'个',0),(302,1,126,'20|121|126',13,3,'电相机','','放电的感觉',1,2,'2015-10-09 14:44:40',1,'/Storage/Shop/1/Products/302',1000.00,0.01,1,0,5,103,0.00,0.00,NULL,'台',0),(303,1,36,'1|3|36',6,0,'爱丽斯顿酒店','','阿斯顿发生飞洒',1,2,'2015-10-12 15:00:55',1,'/Storage/Shop/1/Products/303',122.00,122.00,1,0,0,103,0.00,0.00,NULL,'间',0),(304,1,577,'575|576|577',73,0,'爱丽斯顿酒店','','',1,2,'2015-10-12 15:45:10',1,'/Storage/Shop/1/Products/304',100.00,100.00,1,0,0,103,0.00,0.00,NULL,'间',0),(305,1,577,'575|576|577',73,0,'爱丽斯顿酒店','','',2,1,'2015-10-12 15:51:21',1,'/Storage/Shop/1/Products/305',99.00,100.00,1,0,0,103,0.00,0.00,NULL,'间',0),(306,1,577,'575|576|577',73,0,'爱丁堡酒店','','都干点啥风格',1,2,'2015-10-12 16:32:30',1,'/Storage/Shop/1/Products/306',100.00,100.00,1,0,0,103,0.00,0.00,NULL,'晚',0),(307,1,29,'1|2|29',6,0,'aaa','','',1,2,'2015-10-13 11:00:19',1,'/Storage/Shop/1/Products/307',1111.00,111.00,1,0,0,103,0.00,0.00,NULL,'人名币',0),(308,1,570,'1|75|570',6,0,'超级小麦02','549_21_35','',2,1,'2015-10-13 13:37:09',1,'/Storage/Shop/1/Products//308',1.00,1.00,1,0,0,0,NULL,NULL,NULL,NULL,3),(309,1,570,'1|75|570',6,0,'ANNE KLEIN 淑/女百搭\\无袖连衣裙','','',1,2,'2015-10-13 13:37:09',1,'/Storage/Shop/1/Products//309',100.00,100.00,1,0,0,0,NULL,NULL,NULL,NULL,0),(310,245,357,'352|353|357',20,30,'cscscs','','',1,2,'2015-10-13 15:12:30',1,'/Storage/Shop/245/Products/310',150.00,120.00,1,0,0,134,0.00,0.00,NULL,'克',0),(311,1,29,'1|2|29',6,0,'sji ','','',1,2,'2015-10-13 18:16:55',1,'/Storage/Shop/1/Products/311',22.00,12.00,1,0,0,103,0.00,0.00,NULL,'g',0),(312,1,581,'579|580|581',74,30,'平头螺丝','','螺丝促销',1,2,'2015-10-14 09:48:40',1,'/Storage/Shop/1/Products/312',15.00,12.00,1,0,0,133,0.00,0.00,NULL,'个',0),(313,247,83,'5|8|83',1,0,'平头螺丝','','',1,2,'2015-10-14 10:03:16',1,'/Storage/Shop/247/Products/313',15.00,0.10,1,0,2,137,0.00,0.00,NULL,'个',0),(314,1,577,'575|576|577',73,0,'马尔代夫大酒店','20023','携程在手，说走就走',1,2,'2015-10-14 15:42:59',1,'/Storage/Shop/1/Products/314',100.00,100.00,1,0,0,103,0.00,0.00,NULL,'间',0);
/*!40000 ALTER TABLE `Himall_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_RolePrivileges`
--

DROP TABLE IF EXISTS `Himall_RolePrivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_RolePrivileges` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Privilege` int(11) NOT NULL COMMENT '权限ID',
  `RoleId` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Role_RolePrivilege` (`RoleId`) USING BTREE,
  CONSTRAINT `himall_roleprivileges_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `Himall_Roles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='系统权限和角色的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_RolePrivileges`
--

LOCK TABLES `Himall_RolePrivileges` WRITE;
/*!40000 ALTER TABLE `Himall_RolePrivileges` DISABLE KEYS */;
INSERT INTO `Himall_RolePrivileges` VALUES (100,2001,3),(101,2002,3),(102,2003,3),(103,2004,3),(104,2006,3),(105,2007,3),(106,3001,3),(107,3002,3),(108,3009,3),(109,3003,3),(110,3004,3),(111,3005,3),(112,3006,3),(113,3007,3),(114,3008,3),(115,4003,3),(116,4004,3),(117,4005,3),(118,4006,3),(119,4007,3),(120,4008,3),(121,5001,3),(122,5002,3),(123,5003,3),(124,5004,3),(125,6002,3),(126,6003,3),(127,6004,3),(128,7001,3),(129,7002,3),(130,7003,3),(131,8004,3),(132,8005,3),(133,8006,3),(134,9001,3),(135,9002,3),(136,9003,3),(137,9004,3),(138,9005,3),(139,9006,3),(140,9007,3),(141,10002,3),(142,10003,3),(143,12001,3),(144,11001,3),(145,11002,3),(146,0,5),(147,2001,4),(148,2002,4),(149,2003,4),(150,2004,4),(151,2005,4),(152,2006,4),(153,2007,4),(154,2008,4);
/*!40000 ALTER TABLE `Himall_RolePrivileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Roles`
--

DROP TABLE IF EXISTS `Himall_Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Roles` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `RoleName` varchar(100) NOT NULL COMMENT '角色名称',
  `Description` varchar(1000) NOT NULL COMMENT '说明',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表，平台和商家的角色目前都放在这个表，\r\n平台角色：ShopId为0\r\n商家角色：shopId就是商家ID';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Roles`
--

LOCK TABLES `Himall_Roles` WRITE;
/*!40000 ALTER TABLE `Himall_Roles` DISABLE KEYS */;
INSERT INTO `Himall_Roles` VALUES (3,0,'演示组','演示组'),(4,1,'业务部','业务部'),(5,1,'售后部','售后部');
/*!40000 ALTER TABLE `Himall_Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_SKUs`
--

DROP TABLE IF EXISTS `Himall_SKUs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_SKUs` (
  `Id` varchar(100) NOT NULL COMMENT '商品ID_颜色规格ID_颜色规格ID_尺寸规格',
  `AutoId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键Id',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `Color` varchar(100) DEFAULT NULL COMMENT '颜色规格',
  `Size` varchar(100) DEFAULT NULL COMMENT '尺寸规格',
  `Version` varchar(100) DEFAULT NULL COMMENT '版本规格',
  `Sku` varchar(100) DEFAULT NULL COMMENT 'SKU',
  `Stock` bigint(20) NOT NULL COMMENT '库存',
  `CostPrice` decimal(18,2) NOT NULL COMMENT '成本价',
  `SalePrice` decimal(18,2) NOT NULL COMMENT '销售价',
  PRIMARY KEY (`AutoId`),
  KEY `FK_Product_Sku` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_skus_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3427 DEFAULT CHARSET=utf8 COMMENT='系统SKU表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_SKUs`
--

LOCK TABLES `Himall_SKUs` WRITE;
/*!40000 ALTER TABLE `Himall_SKUs` DISABLE KEYS */;
INSERT INTO `Himall_SKUs` VALUES ('161_0_0_0',2938,161,NULL,NULL,NULL,NULL,396,100.00,100.00),('181_129_128_0',2939,181,'黑色','S','Stock','',100,0.00,128.00),('181_129_17_0',2940,181,'黑色','M','','',100,0.00,128.00),('181_129_18_0',2941,181,'黑色','L','','',100,0.00,128.00),('181_129_19_0',2942,181,'黑色','XL','','',100,0.00,128.00),('181_129_20_0',2943,181,'黑色','XXL','','',100,0.00,128.00),('181_130_128_0',2944,181,'灰色','S','','',100,0.00,128.00),('181_130_17_0',2945,181,'灰色','M','','',100,0.00,128.00),('181_130_18_0',2946,181,'灰色','L','','',100,0.00,128.00),('181_130_19_0',2947,181,'灰色','XL','','',100,0.00,128.00),('181_130_20_0',2948,181,'灰色','XXL','','',100,0.00,128.00),('181_131_128_0',2949,181,'白色','S','','',100,0.00,128.00),('181_131_17_0',2950,181,'白色','M','','',100,0.00,128.00),('181_131_18_0',2951,181,'白色','L','','',100,0.00,128.00),('181_131_19_0',2952,181,'白色','XL','','',100,0.00,128.00),('181_131_20_0',2953,181,'白色','XXL','','',100,0.00,128.00),('182_129_128_0',2954,182,'黑色','S','','',100,0.00,59.00),('182_129_17_0',2955,182,'黑色','M','','',100,0.00,59.00),('182_129_18_0',2956,182,'黑色','L','','',100,0.00,59.00),('182_129_19_0',2957,182,'黑色','XL','','',100,0.00,59.00),('182_129_20_0',2958,182,'黑色','XXL','','',100,0.00,59.00),('182_130_128_0',2959,182,'灰色','S','','',100,0.00,59.00),('182_130_17_0',2960,182,'灰色','M','','',100,0.00,59.00),('182_130_18_0',2961,182,'灰色','L','','',100,0.00,59.00),('182_130_19_0',2962,182,'灰色','XL','','',100,0.00,59.00),('182_130_20_0',2963,182,'灰色','XXL','','',100,0.00,59.00),('182_131_128_0',2964,182,'白色','S','','',100,0.00,59.00),('182_131_17_0',2965,182,'白色','M','','',100,0.00,59.00),('182_131_18_0',2966,182,'白色','L','','',100,0.00,59.00),('182_131_19_0',2967,182,'白色','XL','','',100,0.00,59.00),('182_131_20_0',2968,182,'白色','XXL','','',100,0.00,59.00),('182_16_128_0',2969,182,'军绿','S','','',100,0.00,59.00),('182_16_17_0',2970,182,'军绿','M','','',100,0.00,59.00),('182_16_18_0',2971,182,'军绿','L','','',100,0.00,59.00),('182_16_19_0',2972,182,'军绿','XL','','',100,0.00,59.00),('182_16_20_0',2973,182,'军绿','XXL','','',100,0.00,59.00),('183_129_128_0',2974,183,'黑色','S','','',100,0.00,108.00),('183_129_17_0',2975,183,'黑色','M','','',100,0.00,108.00),('183_129_18_0',2976,183,'黑色','L','','',100,0.00,108.00),('183_129_19_0',2977,183,'黑色','XL','','',100,0.00,108.00),('183_129_20_0',2978,183,'黑色','XXL','','',100,0.00,108.00),('183_130_128_0',2979,183,'灰色','S','','',100,0.00,108.00),('183_130_17_0',2980,183,'灰色','M','','',100,0.00,108.00),('183_130_18_0',2981,183,'灰色','L','','',100,0.00,108.00),('183_130_19_0',2982,183,'灰色','XL','','',100,0.00,108.00),('183_130_20_0',2983,183,'灰色','XXL','','',100,0.00,108.00),('183_131_128_0',2984,183,'白色','S','','',100,0.00,108.00),('183_131_17_0',2985,183,'白色','M','','',100,0.00,108.00),('183_131_18_0',2986,183,'白色','L','','',100,0.00,108.00),('183_131_19_0',2987,183,'白色','XL','','',100,0.00,108.00),('183_131_20_0',2988,183,'白色','XXL','','',100,0.00,108.00),('183_15_128_0',2989,183,'卡其','S','','',100,0.00,108.00),('183_15_17_0',2990,183,'卡其','M','','',100,0.00,108.00),('183_15_18_0',2991,183,'卡其','L','','',100,0.00,108.00),('183_15_19_0',2992,183,'卡其','XL','','',100,0.00,108.00),('183_15_20_0',2993,183,'卡其','XXL','','',100,0.00,108.00),('183_16_128_0',2994,183,'军绿','S','','',100,0.00,108.00),('183_16_17_0',2995,183,'军绿','M','','',100,0.00,108.00),('183_16_18_0',2996,183,'军绿','L','','',100,0.00,108.00),('183_16_19_0',2997,183,'军绿','XL','','',100,0.00,108.00),('183_16_20_0',2998,183,'军绿','XXL','','',100,0.00,108.00),('184_130_128_0',2999,184,'灰色','S','','',9999,0.00,58.00),('184_130_17_0',3000,184,'灰色','M','','',9999,0.00,58.00),('184_130_18_0',3001,184,'灰色','L','','',9999,0.00,58.00),('184_130_19_0',3002,184,'灰色','XL','','',9999,0.00,58.00),('184_130_20_0',3003,184,'灰色','XXL','','',9999,0.00,58.00),('184_131_128_0',3004,184,'白色','S','','',9999,0.00,58.00),('184_131_17_0',3005,184,'白色','M','','',9999,0.00,58.00),('184_131_18_0',3006,184,'白色','L','','',9999,0.00,58.00),('184_131_19_0',3007,184,'白色','XL','','',9999,0.00,58.00),('184_131_20_0',3008,184,'白色','XXL','','',9999,0.00,58.00),('184_15_128_0',3009,184,'卡其','S','','',9999,0.00,58.00),('184_15_17_0',3010,184,'卡其','M','','',9999,0.00,58.00),('184_15_18_0',3011,184,'卡其','L','','',9999,0.00,58.00),('184_15_19_0',3012,184,'卡其','XL','','',9999,0.00,58.00),('184_15_20_0',3013,184,'卡其','XXL','','',9999,0.00,58.00),('184_16_128_0',3014,184,'军绿','S','','',9999,0.00,58.00),('184_16_17_0',3015,184,'军绿','M','','',9999,0.00,58.00),('184_16_18_0',3016,184,'军绿','L','','',9999,0.00,58.00),('184_16_19_0',3017,184,'军绿','XL','','',9999,0.00,58.00),('184_16_20_0',3018,184,'军绿','XXL','','',9999,0.00,58.00),('185_0_0_0',3019,185,'','','','',5823,0.00,60.00),('186_129_128_0',3020,186,'黑色','S','','',5240,0.00,45.00),('186_129_17_0',3021,186,'黑色','M','','',5241,0.00,45.00),('186_129_18_0',3022,186,'黑色','L','','',5241,0.00,45.00),('186_129_19_0',3023,186,'黑色','XL','','',5241,0.00,45.00),('186_130_128_0',3024,186,'灰色','S','','',5241,0.00,45.00),('186_130_17_0',3025,186,'灰色','M','','',5241,0.00,45.00),('186_130_18_0',3026,186,'灰色','L','','',5241,0.00,45.00),('186_130_19_0',3027,186,'灰色','XL','','',5241,0.00,45.00),('186_131_128_0',3028,186,'白色','S','','',5241,0.00,45.00),('186_131_17_0',3029,186,'白色','M','','',5241,0.00,45.00),('186_131_18_0',3030,186,'白色','L','','',5241,0.00,45.00),('186_131_19_0',3031,186,'白色','XL','','',5241,0.00,45.00),('186_16_128_0',3032,186,'军绿','S','','',5241,0.00,45.00),('186_16_17_0',3033,186,'军绿','M','','',5241,0.00,45.00),('186_16_18_0',3034,186,'军绿','L','','',5241,0.00,45.00),('186_16_19_0',3035,186,'军绿','XL','','',5241,0.00,45.00),('187_129_128_0',3036,187,'黑色','S','','',9928000,0.00,48.80),('187_129_17_0',3037,187,'黑色','M','','',9928000,0.00,48.80),('187_129_18_0',3038,187,'黑色','L','','',9928000,0.00,48.80),('187_129_19_0',3039,187,'黑色','XL','','',9928000,0.00,48.80),('187_129_20_0',3040,187,'黑色','XXL','','',9928000,0.00,48.80),('187_130_128_0',3041,187,'灰色','S','','',9928000,0.00,48.80),('187_130_17_0',3042,187,'灰色','M','','',9928000,0.00,48.80),('187_130_18_0',3043,187,'灰色','L','','',9928000,0.00,48.80),('187_130_19_0',3044,187,'灰色','XL','','',9928000,0.00,48.80),('187_130_20_0',3045,187,'灰色','XXL','','',9928000,0.00,48.80),('187_131_128_0',3046,187,'白色','S','','',9928000,0.00,48.80),('187_131_17_0',3047,187,'白色','M','','',9928000,0.00,48.80),('187_131_18_0',3048,187,'白色','L','','',9928000,0.00,48.80),('187_131_19_0',3049,187,'白色','XL','','',9928000,0.00,48.80),('187_131_20_0',3050,187,'白色','XXL','','',9928000,0.00,48.80),('187_16_128_0',3051,187,'军绿','S','','',9928000,0.00,48.80),('187_16_17_0',3052,187,'军绿','M','','',9928000,0.00,48.80),('187_16_18_0',3053,187,'军绿','L','','',9928000,0.00,48.80),('187_16_19_0',3054,187,'军绿','XL','','',9928000,0.00,48.80),('187_16_20_0',3055,187,'军绿','XXL','','',9928000,0.00,48.80),('188_129_128_0',3056,188,'黑色','S','','',100,0.00,59.00),('188_129_17_0',3057,188,'黑色','M','','',100,0.00,59.00),('188_129_18_0',3058,188,'黑色','L','','',100,0.00,59.00),('188_129_19_0',3059,188,'黑色','XL','','',100,0.00,59.00),('188_129_20_0',3060,188,'黑色','XXL','','',100,0.00,59.00),('188_130_128_0',3061,188,'灰色','S','','',100,0.00,59.00),('188_130_17_0',3062,188,'灰色','M','','',100,0.00,59.00),('188_130_18_0',3063,188,'灰色','L','','',100,0.00,59.00),('188_130_19_0',3064,188,'灰色','XL','','',100,0.00,59.00),('188_130_20_0',3065,188,'灰色','XXL','','',100,0.00,59.00),('188_131_128_0',3066,188,'白色','S','','',100,0.00,59.00),('188_131_17_0',3067,188,'白色','M','','',100,0.00,59.00),('188_131_18_0',3068,188,'白色','L','','',100,0.00,59.00),('188_131_19_0',3069,188,'白色','XL','','',100,0.00,59.00),('188_131_20_0',3070,188,'白色','XXL','','',100,0.00,59.00),('188_15_128_0',3071,188,'卡其','S','','',100,0.00,59.00),('188_15_17_0',3072,188,'卡其','M','','',100,0.00,59.00),('188_15_18_0',3073,188,'卡其','L','','',100,0.00,59.00),('188_15_19_0',3074,188,'卡其','XL','','',100,0.00,59.00),('188_15_20_0',3075,188,'卡其','XXL','','',100,0.00,59.00),('188_16_128_0',3076,188,'军绿','S','','',100,0.00,59.00),('188_16_17_0',3077,188,'军绿','M','','',100,0.00,59.00),('188_16_18_0',3078,188,'军绿','L','','',100,0.00,59.00),('188_16_19_0',3079,188,'军绿','XL','','',100,0.00,59.00),('188_16_20_0',3080,188,'军绿','XXL','','',100,0.00,59.00),('189_129_128_0',3081,189,'黑色','S','','',200,0.00,59.00),('189_129_17_0',3082,189,'黑色','M','','',200,0.00,59.00),('189_129_18_0',3083,189,'黑色','L','','',200,0.00,59.00),('189_130_128_0',3084,189,'灰色','S','','',200,0.00,59.00),('189_130_17_0',3085,189,'灰色','M','','',200,0.00,59.00),('189_130_18_0',3086,189,'灰色','L','','',200,0.00,59.00),('189_131_128_0',3087,189,'白色','S','','',200,0.00,59.00),('189_131_17_0',3088,189,'白色','M','','',200,0.00,59.00),('189_131_18_0',3089,189,'白色','L','','',200,0.00,59.00),('190_129_128_0',3090,190,'黑色','S','','',100,0.00,88.00),('190_129_17_0',3091,190,'黑色','M','','',100,0.00,88.00),('190_129_18_0',3092,190,'黑色','L','','',100,0.00,88.00),('190_129_19_0',3093,190,'黑色','XL','','',100,0.00,88.00),('190_129_20_0',3094,190,'黑色','XXL','','',100,0.00,88.00),('190_130_128_0',3095,190,'灰色','S','','',100,0.00,88.00),('190_130_17_0',3096,190,'灰色','M','','',100,0.00,88.00),('190_130_18_0',3097,190,'灰色','L','','',100,0.00,88.00),('190_130_19_0',3098,190,'灰色','XL','','',100,0.00,88.00),('190_130_20_0',3099,190,'灰色','XXL','','',100,0.00,88.00),('190_131_128_0',3100,190,'白色','S','','',100,0.00,88.00),('190_131_17_0',3101,190,'白色','M','','',100,0.00,88.00),('190_131_18_0',3102,190,'白色','L','','',100,0.00,88.00),('190_131_19_0',3103,190,'白色','XL','','',100,0.00,88.00),('190_131_20_0',3104,190,'白色','XXL','','',100,0.00,88.00),('191_10_11_0',3105,191,'白紫','120','','',150,0.00,119.00),('191_10_12_0',3106,191,'白紫','130','','',150,0.00,119.00),('191_10_13_0',3107,191,'白紫','140','','',150,0.00,119.00),('191_10_14_0',3108,191,'白紫','150','','',150,0.00,119.00),('191_6_11_0',3109,191,'蓝白','120','','',150,0.00,119.00),('191_6_12_0',3110,191,'蓝白','130','','',150,0.00,119.00),('191_6_13_0',3111,191,'蓝白','140','','',150,0.00,119.00),('191_6_14_0',3112,191,'蓝白','150','','',150,0.00,119.00),('191_7_11_0',3113,191,'红白','120','','',150,0.00,119.00),('191_7_12_0',3114,191,'红白','130','','',150,0.00,119.00),('191_7_13_0',3115,191,'红白','140','','',150,0.00,119.00),('191_7_14_0',3116,191,'红白','150','','',150,0.00,119.00),('191_8_11_0',3117,191,'黑白','120','','',150,0.00,119.00),('191_8_12_0',3118,191,'黑白','130','','',150,0.00,119.00),('191_8_13_0',3119,191,'黑白','140','','',150,0.00,119.00),('191_8_14_0',3120,191,'黑白','150','','',150,0.00,119.00),('192_10_11_0',3121,192,'白紫','120','','',50,0.00,159.00),('192_10_12_0',3122,192,'白紫','130','','',50,0.00,159.00),('192_10_13_0',3123,192,'白紫','140','','',50,0.00,159.00),('192_10_14_0',3124,192,'白紫','150','','',50,0.00,159.00),('192_6_11_0',3125,192,'蓝白','120','','',50,0.00,159.00),('192_6_12_0',3126,192,'蓝白','130','','',50,0.00,159.00),('192_6_13_0',3127,192,'蓝白','140','','',50,0.00,159.00),('192_6_14_0',3128,192,'蓝白','150','','',50,0.00,159.00),('192_7_11_0',3129,192,'红白','120','','',50,0.00,159.00),('192_7_12_0',3130,192,'红白','130','','',50,0.00,159.00),('192_7_13_0',3131,192,'红白','140','','',50,0.00,159.00),('192_7_14_0',3132,192,'红白','150','','',50,0.00,159.00),('192_8_11_0',3133,192,'黑白','120','','',50,0.00,159.00),('192_8_12_0',3134,192,'黑白','130','','',50,0.00,159.00),('192_8_13_0',3135,192,'黑白','140','','',50,0.00,159.00),('192_8_14_0',3136,192,'黑白','150','','',50,0.00,159.00),('193_10_11_0',3137,193,'白紫','120','','',1000,0.00,189.00),('193_10_12_0',3138,193,'白紫','130','','',1000,0.00,189.00),('193_10_13_0',3139,193,'白紫','140','','',1000,0.00,189.00),('193_10_14_0',3140,193,'白紫','150','','',1000,0.00,189.00),('193_6_11_0',3141,193,'蓝白','120','','',1000,0.00,189.00),('193_6_12_0',3142,193,'蓝白','130','','',1000,0.00,189.00),('193_6_13_0',3143,193,'蓝白','140','','',1000,0.00,189.00),('193_6_14_0',3144,193,'蓝白','150','','',1000,0.00,189.00),('193_7_11_0',3145,193,'红白','120','','',1000,0.00,189.00),('193_7_12_0',3146,193,'红白','130','','',1000,0.00,189.00),('193_7_13_0',3147,193,'红白','140','','',1000,0.00,189.00),('193_7_14_0',3148,193,'红白','150','','',1000,0.00,189.00),('193_8_11_0',3149,193,'黑白','120','','',1000,0.00,189.00),('193_8_12_0',3150,193,'黑白','130','','',1000,0.00,189.00),('193_8_13_0',3151,193,'黑白','140','','',1000,0.00,189.00),('193_8_14_0',3152,193,'黑白','150','','',1000,0.00,189.00),('194_10_11_0',3153,194,'白紫','120','','',179,0.00,159.00),('194_10_12_0',3154,194,'白紫','130','','',180,0.00,159.00),('194_10_13_0',3155,194,'白紫','140','','',180,0.00,159.00),('194_10_14_0',3156,194,'白紫','150','','',180,0.00,159.00),('194_6_11_0',3157,194,'蓝白','120','','',180,0.00,159.00),('194_6_12_0',3158,194,'蓝白','130','','',180,0.00,159.00),('194_6_13_0',3159,194,'蓝白','140','','',180,0.00,159.00),('194_6_14_0',3160,194,'蓝白','150','','',180,0.00,159.00),('194_7_11_0',3161,194,'红白','120','','',180,0.00,159.00),('194_7_12_0',3162,194,'红白','130','','',180,0.00,159.00),('194_7_13_0',3163,194,'红白','140','','',180,0.00,159.00),('194_7_14_0',3164,194,'红白','150','','',180,0.00,159.00),('194_8_11_0',3165,194,'黑白','120','','',180,0.00,159.00),('194_8_12_0',3166,194,'黑白','130','','',180,0.00,159.00),('194_8_13_0',3167,194,'黑白','140','','',180,0.00,159.00),('194_8_14_0',3168,194,'黑白','150','','',180,0.00,159.00),('195_10_11_0',3169,195,'白紫','120','','',50,0.00,250.00),('195_10_12_0',3170,195,'白紫','130','','',50,0.00,250.00),('195_10_13_0',3171,195,'白紫','140','','',50,0.00,250.00),('195_10_14_0',3172,195,'白紫','150','','',50,0.00,250.00),('195_7_11_0',3173,195,'红白','120','','',50,0.00,250.00),('195_7_12_0',3174,195,'红白','130','','',50,0.00,250.00),('195_7_13_0',3175,195,'红白','140','','',50,0.00,250.00),('195_7_14_0',3176,195,'红白','150','','',50,0.00,250.00),('195_8_11_0',3177,195,'黑白','120','','',50,0.00,250.00),('195_8_12_0',3178,195,'黑白','130','','',50,0.00,250.00),('195_8_13_0',3179,195,'黑白','140','','',50,0.00,250.00),('195_8_14_0',3180,195,'黑白','150','','',50,0.00,250.00),('197_10_11_0',3190,197,'白紫','120','','',1000,0.00,158.00),('197_10_12_0',3191,197,'白紫','130','','',1000,0.00,158.00),('197_10_13_0',3192,197,'白紫','140','','',1000,0.00,158.00),('197_7_11_0',3193,197,'红白','120','','',1000,0.00,158.00),('197_7_12_0',3194,197,'红白','130','','',1000,0.00,158.00),('197_7_13_0',3195,197,'红白','140','','',1000,0.00,158.00),('197_8_11_0',3196,197,'黑白','120','','',1000,0.00,158.00),('197_8_12_0',3197,197,'黑白','130','','',1000,0.00,158.00),('197_8_13_0',3198,197,'黑白','140','','',1000,0.00,158.00),('204_0_0_0',3199,204,'','','','',12,0.00,12.00),('218_0_0_239',3200,218,'','','深层净化','',50,0.00,129.00),('218_0_0_240',3201,218,'','','秋冬滋润','',50,0.00,129.00),('218_0_0_241',3202,218,'','','劲能套餐','',50,0.00,129.00),('218_0_0_243',3203,218,'','','控油套餐','',50,0.00,129.00),('219_0_0_239',3204,219,'','','深层净化','',600,0.00,88.00),('219_0_0_240',3205,219,'','','秋冬滋润','',600,0.00,88.00),('219_0_0_241',3206,219,'','','劲能套餐','',600,0.00,88.00),('219_0_0_243',3207,219,'','','控油套餐','',600,0.00,88.00),('220_0_0_239',3208,220,'','','深层净化','',50,0.00,168.00),('220_0_0_240',3209,220,'','','秋冬滋润','',50,0.00,168.00),('220_0_0_241',3210,220,'','','劲能套餐','',50,0.00,168.00),('220_0_0_242',3211,220,'','','型男霜','',50,0.00,168.00),('220_0_0_243',3212,220,'','','控油套餐','',50,0.00,168.00),('221_0_0_239',3213,221,'','','深层净化','',2400,0.00,58.00),('221_0_0_240',3214,221,'','','秋冬滋润','',2400,0.00,58.00),('221_0_0_243',3215,221,'','','控油套餐','',2400,0.00,58.00),('222_0_0_240',3216,222,'','','秋冬滋润','',58,0.00,88.00),('222_0_0_243',3217,222,'','','控油套餐','',58,0.00,88.00),('223_0_0_240',3218,223,'','','秋冬滋润','',88,0.00,118.00),('223_0_0_241',3219,223,'','','劲能套餐','',88,0.00,118.00),('223_0_0_243',3220,223,'','','控油套餐','',88,0.00,118.00),('224_0_0_240',3221,224,'','','秋冬滋润','',88,0.00,59.00),('224_0_0_241',3222,224,'','','劲能套餐','',88,0.00,59.00),('224_0_0_243',3223,224,'','','控油套餐','',88,0.00,59.00),('225_0_0_240',3224,225,'','','秋冬滋润','',562,0.00,88.00),('225_0_0_241',3225,225,'','','劲能套餐','',562,0.00,88.00),('226_71_0_70',3226,226,'银灰色','','标配','',200,0.00,1888.00),('226_72_0_70',3227,226,'白色','','标配','',200,0.00,1888.00),('227_71_0_70',3228,227,'银灰色','','标配','',280,0.00,2199.00),('227_72_0_70',3229,227,'白色','','标配','',280,0.00,2199.00),('228_71_0_70',3230,228,'银灰色','','标配','',260,0.00,1298.00),('228_72_0_70',3231,228,'白色','','标配','',260,0.00,1298.00),('229_71_0_68',3232,229,'银灰色','','套餐2','',180,0.00,1399.00),('229_71_0_69',3233,229,'银灰色','','套餐1','',180,0.00,1399.00),('229_71_0_70',3234,229,'银灰色','','标配','',180,0.00,1399.00),('229_72_0_68',3235,229,'白色','','套餐2','',180,0.00,1399.00),('229_72_0_69',3236,229,'白色','','套餐1','',180,0.00,1399.00),('229_72_0_70',3237,229,'白色','','标配','',180,0.00,1399.00),('230_245_0_40',3238,230,'黑色','','官方标配','',150,0.00,3499.00),('230_245_0_41',3239,230,'黑色','','套餐一','',150,0.00,3499.00),('230_245_0_42',3240,230,'黑色','','套餐二','',150,0.00,3499.00),('230_65_0_40',3241,230,'红色','','官方标配','',150,0.00,3499.00),('230_65_0_41',3242,230,'红色','','套餐一','',150,0.00,3499.00),('230_65_0_42',3243,230,'红色','','套餐二','',150,0.00,3499.00),('230_66_0_40',3244,230,'白色','','官方标配','',150,0.00,3499.00),('230_66_0_41',3245,230,'白色','','套餐一','',150,0.00,3499.00),('230_66_0_42',3246,230,'白色','','套餐二','',150,0.00,3499.00),('231_245_0_40',3247,231,'黑色','','官方标配','',180,0.00,566.00),('231_245_0_41',3248,231,'黑色','','套餐一','',180,0.00,566.00),('231_245_0_42',3249,231,'黑色','','套餐二','',180,0.00,566.00),('231_65_0_40',3250,231,'红色','','官方标配','',180,0.00,566.00),('231_65_0_41',3251,231,'红色','','套餐一','',180,0.00,566.00),('231_65_0_42',3252,231,'红色','','套餐二','',180,0.00,566.00),('231_66_0_40',3253,231,'白色','','官方标配','',180,0.00,566.00),('231_66_0_41',3254,231,'白色','','套餐一','',180,0.00,566.00),('231_66_0_42',3255,231,'白色','','套餐二','',180,0.00,566.00),('231_67_0_40',3256,231,'灰色','','官方标配','',180,0.00,566.00),('231_67_0_41',3257,231,'灰色','','套餐一','',180,0.00,566.00),('231_67_0_42',3258,231,'灰色','','套餐二','',180,0.00,566.00),('232_87_0_100',3259,232,'红色','','1.2米','',50,0.00,8888.00),('232_87_0_101',3260,232,'红色','','1.5米','',50,0.00,8888.00),('232_87_0_99',3261,232,'红色','','1米','',50,0.00,8888.00),('232_88_0_100',3262,232,'绿色','','1.2米','',50,0.00,8888.00),('232_88_0_101',3263,232,'绿色','','1.5米','',50,0.00,8888.00),('232_88_0_99',3264,232,'绿色','','1米','',50,0.00,8888.00),('232_90_0_100',3265,232,'蓝色','','1.2米','',50,0.00,8888.00),('232_90_0_101',3266,232,'蓝色','','1.5米','',50,0.00,8888.00),('232_90_0_99',3267,232,'蓝色','','1米','',50,0.00,8888.00),('232_91_0_100',3268,232,'褐色','','1.2米','',50,0.00,8888.00),('232_91_0_101',3269,232,'褐色','','1.5米','',50,0.00,8888.00),('232_91_0_99',3270,232,'褐色','','1米','',50,0.00,8888.00),('232_93_0_100',3271,232,'酒红色','','1.2米','',50,0.00,8888.00),('232_93_0_101',3272,232,'酒红色','','1.5米','',50,0.00,8888.00),('232_93_0_99',3273,232,'酒红色','','1米','',50,0.00,8888.00),('232_95_0_100',3274,232,'黑色','','1.2米','',50,0.00,8888.00),('232_95_0_101',3275,232,'黑色','','1.5米','',50,0.00,8888.00),('232_95_0_99',3276,232,'黑色','','1米','',50,0.00,8888.00),('233_115_0_0',3277,233,'紫色','','','',50,0.00,168.00),('233_116_0_0',3278,233,'红色','','','',50,0.00,168.00),('233_117_0_0',3279,233,'绿色','','','',50,0.00,168.00),('233_119_0_0',3280,233,'蓝色','','','',50,0.00,168.00),('233_120_0_0',3281,233,'褐色','','','',50,0.00,168.00),('233_121_0_0',3282,233,'透明','','','',50,0.00,168.00),('233_122_0_0',3283,233,'酒红色','','','',50,0.00,168.00),('233_124_0_0',3284,233,'黑色','','','',50,0.00,168.00),('233_126_0_0',3285,233,'深紫色','','','',50,0.00,168.00),('234_0_0_0',3286,234,'','','','',4,25.00,190.00),('235_0_0_0',3287,235,'','','','',50,454.00,5000.00),('236_0_0_0',3288,236,'','','','',50,55555.00,55500.00),('237_0_0_0',3289,237,'','','','',99,0.00,699.00),('238_0_611_76',3290,238,'','17寸','i3 CPU','',88,2556.00,5592.00),('238_0_613_76',3291,238,'','19寸','i3 CPU','',88,2556.00,5592.00),('238_0_73_76',3292,238,'','10.1寸','i3 CPU','',88,2556.00,5592.00),('239_0_0_0',3293,239,'','','','',100,0.00,699.00),('240_10_12_0',3294,240,'白紫','130','','',100,0.00,199.00),('240_10_13_0',3295,240,'白紫','140','','',100,0.00,199.00),('240_7_12_0',3296,240,'红白','130','','',100,0.00,199.00),('240_7_13_0',3297,240,'红白','140','','',100,0.00,199.00),('240_8_12_0',3298,240,'黑白','130','','',100,0.00,199.00),('240_8_13_0',3299,240,'黑白','140','','',100,0.00,199.00),('241_0_610_76',3300,241,'','15寸','i3 CPU','',100,0.00,6888.00),('241_0_610_77',3301,241,'','15寸','i5 CPU/独显','',100,0.00,6888.00),('241_0_610_78',3302,241,'','15寸','i7 CPU/独显','',100,0.00,6888.00),('241_0_73_76',3303,241,'','10.1寸','i3 CPU','',100,0.00,6888.00),('241_0_73_77',3304,241,'','10.1寸','i5 CPU/独显','',100,0.00,6888.00),('241_0_73_78',3305,241,'','10.1寸','i7 CPU/独显','',100,0.00,6888.00),('241_0_74_76',3306,241,'','12寸','i3 CPU','',100,0.00,6888.00),('241_0_74_77',3307,241,'','12寸','i5 CPU/独显','',100,0.00,6888.00),('241_0_74_78',3308,241,'','12寸','i7 CPU/独显','',100,0.00,6888.00),('241_0_75_76',3309,241,'','14寸','i3 CPU','',100,0.00,6888.00),('241_0_75_77',3310,241,'','14寸','i5 CPU/独显','',100,0.00,6888.00),('241_0_75_78',3311,241,'','14寸','i7 CPU/独显','',100,0.00,6888.00),('242_10_12_0',3312,242,'白紫','130','','',100,0.00,399.00),('242_10_14_0',3313,242,'白紫','150','','',100,0.00,399.00),('242_8_12_0',3314,242,'黑白','130','','',100,0.00,399.00),('242_8_14_0',3315,242,'黑白','150','','',100,0.00,399.00),('243_0_0_0',3316,243,'','','','',50,5200.00,5555.00),('244_6_12_0',3317,244,'蓝白','130','','',100,0.00,499.00),('244_6_13_0',3318,244,'蓝白','140','','',100,0.00,499.00),('244_6_14_0',3319,244,'蓝白','150','','',100,0.00,499.00),('244_7_12_0',3320,244,'红白','130','','',100,0.00,499.00),('244_7_13_0',3321,244,'红白','140','','',100,0.00,499.00),('244_7_14_0',3322,244,'红白','150','','',99,0.00,499.00),('244_8_12_0',3323,244,'黑白','130','','',100,0.00,499.00),('244_8_13_0',3324,244,'黑白','140','','',100,0.00,499.00),('244_8_14_0',3325,244,'黑白','150','','',100,0.00,499.00),('245_0_0_0',3326,245,'','','','',25,8888.00,5555.00),('246_7_11_0',3327,246,'红白','120','','',98,0.00,499.00),('246_8_11_0',3328,246,'黑白','120','','',100,0.00,499.00),('247_0_0_0',3329,247,'','','','',52,455.00,521.00),('248_10_12_0',3330,248,'白紫','130','','',100,0.00,299.00),('248_10_13_0',3331,248,'白紫','140','','',100,0.00,299.00),('248_8_12_0',3332,248,'黑白','130','','',100,0.00,299.00),('248_8_13_0',3333,248,'黑白','140','','',100,0.00,299.00),('249_0_610_76',3334,249,'','15寸','i3 CPU','',50,0.00,6099.00),('249_0_610_77',3335,249,'','15寸','i5 CPU/独显','',50,0.00,6099.00),('249_0_610_78',3336,249,'','15寸','i7 CPU/独显','',50,0.00,6099.00),('249_0_611_76',3337,249,'','17寸','i3 CPU','',50,0.00,6099.00),('249_0_611_77',3338,249,'','17寸','i5 CPU/独显','',50,0.00,6099.00),('249_0_611_78',3339,249,'','17寸','i7 CPU/独显','',50,0.00,6099.00),('249_0_612_76',3340,249,'','18寸','i3 CPU','',50,0.00,6099.00),('249_0_612_77',3341,249,'','18寸','i5 CPU/独显','',50,0.00,6099.00),('249_0_612_78',3342,249,'','18寸','i7 CPU/独显','',50,0.00,6099.00),('249_0_613_76',3343,249,'','19寸','i3 CPU','',50,0.00,6099.00),('249_0_613_77',3344,249,'','19寸','i5 CPU/独显','',50,0.00,6099.00),('249_0_613_78',3345,249,'','19寸','i7 CPU/独显','',50,0.00,6099.00),('250_7_12_0',3346,250,'红白','130','','',98,0.00,0.01),('250_7_14_0',3347,250,'红白','150','','',98,0.00,0.01),('250_8_12_0',3348,250,'黑白','130','','',97,0.00,0.01),('250_8_14_0',3349,250,'黑白','150','','',100,0.00,0.01),('251_0_610_76',3350,251,'','15寸','i3 CPU','',88,0.00,3488.00),('251_0_610_77',3351,251,'','15寸','i5 CPU/独显','',88,0.00,3488.00),('251_0_610_78',3352,251,'','15寸','i7 CPU/独显','',88,0.00,3488.00),('251_0_611_76',3353,251,'','17寸','i3 CPU','',88,0.00,3488.00),('251_0_611_77',3354,251,'','17寸','i5 CPU/独显','',88,0.00,3488.00),('251_0_611_78',3355,251,'','17寸','i7 CPU/独显','',88,0.00,3488.00),('251_0_74_76',3356,251,'','12寸','i3 CPU','',88,0.00,3488.00),('251_0_74_77',3357,251,'','12寸','i5 CPU/独显','',88,0.00,3488.00),('251_0_74_78',3358,251,'','12寸','i7 CPU/独显','',88,0.00,3488.00),('251_0_75_76',3359,251,'','14寸','i3 CPU','',88,0.00,3488.00),('251_0_75_77',3360,251,'','14寸','i5 CPU/独显','',88,0.00,3488.00),('251_0_75_78',3361,251,'','14寸','i7 CPU/独显','',88,0.00,3488.00),('252_0_0_0',3362,252,'','','','',22,9888.00,5999.00),('253_0_0_0',3363,253,'','','','',44,5200.00,3799.00),('254_0_0_0',3364,254,'','','','',100,0.00,699.00),('255_0_0_0',3365,255,'','','','',50,0.00,799.00),('256_0_0_0',3366,256,'','','','',6,0.00,1.00),('301_0_0_0',3367,301,'','','','',663,6.00,100.00),('302_66_0_40',3380,302,'白色','','官方标配','',1,0.00,0.01),('302_66_0_42',3381,302,'白色','','套餐二','',2,0.00,0.01),('302_66_0_41',3382,302,'白色','','套餐一','',2,0.00,0.01),('302_245_0_40',3383,302,'黑色','','官方标配','',2,0.00,0.01),('302_245_0_42',3384,302,'黑色','','套餐二','',2,0.00,0.01),('302_245_0_41',3385,302,'黑色','','套餐一','',2,0.00,0.01),('303_0_0_0',3386,303,'','','','',100,22.00,122.00),('304_0_0_0',3387,304,'','','','',20,0.00,100.00),('305_0_0_0',3388,305,'','','','',20,0.00,100.00),('308_0_0_0',3397,308,NULL,NULL,NULL,NULL,59997,1.00,1.00),('309_0_0_0',3398,309,NULL,NULL,NULL,NULL,398,100.00,100.00),('307_0_0_0',3399,307,'','','','',1,0.00,111.00),('310_0_0_0',3400,310,'','','','',10,0.00,120.00),('196_10_11_0',3401,196,'白紫','120','','',40,0.00,0.01),('196_10_12_0',3402,196,'白紫','130','','',40,0.00,0.01),('196_10_13_0',3403,196,'白紫','140','','',40,0.00,0.01),('196_7_11_0',3404,196,'红白','120','','',40,0.00,0.01),('196_7_12_0',3405,196,'红白','130','','',39,0.00,0.01),('196_7_13_0',3406,196,'红白','140','','',38,0.00,0.01),('196_8_11_0',3407,196,'黑白','120','','',40,0.00,0.01),('196_8_12_0',3408,196,'黑白','130','','',39,0.00,0.01),('196_8_13_0',3409,196,'黑白','140','','',40,0.00,0.01),('306_0_0_668',3410,306,'','','标间','',25,0.00,100.00),('306_0_0_669',3411,306,'','','豪华套间','',25,0.00,200.00),('311_0_0_0',3412,311,'','','','',12,0.00,12.00),('312_675_683_693',3413,312,'褐色','160/80(XS)','25mm','',100,0.00,8.00),('312_675_683_694',3414,312,'褐色','160/80(XS)','50mm','',100,0.00,12.00),('312_675_692_693',3415,312,'褐色','170/92(M)','25mm','',100,0.00,8.00),('312_675_692_694',3416,312,'褐色','170/92(M)','50mm','',100,0.00,12.00),('312_679_683_693',3417,312,'黑色','160/80(XS)','25mm','',100,0.00,8.00),('312_679_683_694',3418,312,'黑色','160/80(XS)','50mm','',100,0.00,12.00),('312_679_692_693',3419,312,'黑色','170/92(M)','25mm','',100,0.00,8.00),('312_679_692_694',3420,312,'黑色','170/92(M)','50mm','',100,0.00,12.00),('313_132_615_617',3424,313,'白','32','童装','',97,0.00,0.10),('314_0_0_668',3425,314,'','','标间','',97,90.00,100.00),('314_0_0_669',3426,314,'','','豪华套间','',100,100.00,190.00);
/*!40000 ALTER TABLE `Himall_SKUs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_SellerSpecificationValues`
--

DROP TABLE IF EXISTS `Himall_SellerSpecificationValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_SellerSpecificationValues` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ValueId` bigint(20) NOT NULL COMMENT '规格值ID',
  `Specification` int(11) NOT NULL COMMENT '规格（颜色、尺寸、版本）',
  `TypeId` bigint(20) NOT NULL COMMENT '类型ID',
  `Value` varchar(100) NOT NULL COMMENT '商家的规格值',
  PRIMARY KEY (`Id`),
  KEY `FK_SpecificationValue_SellerSpecificationValue` (`ValueId`) USING BTREE,
  CONSTRAINT `himall_sellerspecificationvalues_ibfk_1` FOREIGN KEY (`ValueId`) REFERENCES `Himall_SpecificationValues` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='商家规格快照';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_SellerSpecificationValues`
--

LOCK TABLES `Himall_SellerSpecificationValues` WRITE;
/*!40000 ALTER TABLE `Himall_SellerSpecificationValues` DISABLE KEYS */;
INSERT INTO `Himall_SellerSpecificationValues` VALUES (1,1,131,1,21,'白色'),(2,1,129,1,21,'黑色'),(3,1,130,1,21,'灰色'),(4,1,16,1,21,'军绿'),(5,1,18,2,21,'L'),(6,1,17,2,21,'M'),(7,1,128,2,21,'S'),(8,1,19,2,21,'XL'),(9,1,20,2,21,'XXL');
/*!40000 ALTER TABLE `Himall_SellerSpecificationValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_SensitiveWords`
--

DROP TABLE IF EXISTS `Himall_SensitiveWords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_SensitiveWords` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `SensitiveWord` varchar(100) DEFAULT NULL COMMENT '敏感词',
  `CategoryName` varchar(100) DEFAULT NULL COMMENT '敏感词类别',
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='敏感关键词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_SensitiveWords`
--

LOCK TABLES `Himall_SensitiveWords` WRITE;
/*!40000 ALTER TABLE `Himall_SensitiveWords` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_SensitiveWords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShippingAddresses`
--

DROP TABLE IF EXISTS `Himall_ShippingAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShippingAddresses` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `RegionId` int(11) NOT NULL COMMENT '区域ID',
  `ShipTo` varchar(100) NOT NULL COMMENT '收货人',
  `Address` varchar(100) NOT NULL COMMENT '收货具体街道信息',
  `Phone` varchar(100) NOT NULL COMMENT '收货人电话',
  `IsDefault` tinyint(1) NOT NULL COMMENT '是否为默认',
  `IsQuick` tinyint(1) NOT NULL COMMENT '是否为轻松购地址',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_ShippingAddress` (`UserId`) USING BTREE,
  CONSTRAINT `himall_shippingaddresses_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8 COMMENT='会员的收货地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShippingAddresses`
--

LOCK TABLES `Himall_ShippingAddresses` WRITE;
/*!40000 ALTER TABLE `Himall_ShippingAddresses` DISABLE KEYS */;
INSERT INTO `Himall_ShippingAddresses` VALUES (434,542,266,'22222','dsfa ','13574112547',0,0),(435,542,397,'sdssd','sddsd','13578961452',1,0),(436,545,215,'zz','fds ','18609870987',1,0),(437,541,215,'豆腐干','人格人','18711052244',0,0),(438,541,644,'奋斗个','梵蒂冈','18711052244',0,0),(439,541,1166,'豆腐干豆腐干地方','豆腐干豆腐干地方','14798653258332653235',1,0),(440,550,1667,'王春','四方坪','15399907687',1,0),(441,549,1664,'Wangbin','大剧院1915','13017195356',1,0),(442,552,1666,'121','33232','18865432126',1,0),(443,553,102,'测试','测试','15112321110',1,0),(444,560,1664,'李','祝您是','15211013426',1,0),(445,567,549,'了','宝贝','13699887752',1,0),(446,569,215,'哈哈','刚和黑胡椒','13603016801',1,0),(447,573,1155,'我啊','啊啊','18200000000',1,0),(448,574,215,'22','444','15200949049',1,0),(449,575,216,'方法‘','飞帆过好好奋斗’','13058742010‘',1,0),(450,576,216,'fgsf','sdfgsdfgsdf','11111111111',1,0),(451,577,406,'东风','阿斯蒂芬','13911111111',1,0),(452,579,281,'eeee','ddddd','13111111111',1,0),(453,578,1664,'张三','王府井','18899998888',1,0),(454,582,215,'xixi','家园','13213213212',1,0),(455,586,102,'accc','dddddd','23456787654',1,0),(456,557,218,'zzz','龙猫','18684850987',1,0),(457,543,216,'凤飞飞','凤飞飞凤飞飞','15444444222',1,0),(458,543,215,'凤飞飞反复','凤飞飞反复','15433225678',0,0),(459,554,265,'测试','测试题','13524562541',1,0),(460,548,421,'进京东','的扩大 ','125236616621',1,0),(461,593,1667,'王春','湖南文化大厦','13562314089',1,0),(462,595,216,'第三方','第三方','18711052244',1,0),(463,597,102,'fg','gfg','13021638465',1,0),(464,599,102,'方法','范德萨发','13544854421',1,0),(465,600,648,'张三','王府井','12345678901',1,0),(466,584,3413,'王牌','下午屯新屯安置区','18585858585',1,0),(467,601,281,'张三','刘家庄','12345678901',1,0);
/*!40000 ALTER TABLE `Himall_ShippingAddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopBonus`
--

DROP TABLE IF EXISTS `Himall_ShopBonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopBonus` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Count` int(11) NOT NULL COMMENT '红包数量',
  `RandomAmountStart` decimal(18,2) NOT NULL COMMENT '随机范围Start',
  `RandomAmountEnd` decimal(18,2) NOT NULL COMMENT '随机范围End',
  `UseState` int(11) NOT NULL COMMENT '1:满X元使用  2：没有限制',
  `UsrStatePrice` decimal(18,2) NOT NULL COMMENT '满多少元',
  `GrantPrice` decimal(18,2) NOT NULL COMMENT '满多少元才发放红包',
  `DateStart` datetime NOT NULL,
  `DateEnd` datetime NOT NULL,
  `BonusDateStart` datetime NOT NULL,
  `BonusDateEnd` datetime NOT NULL,
  `ShareTitle` varchar(30) NOT NULL COMMENT '分享',
  `ShareDetail` varchar(150) NOT NULL COMMENT '分享',
  `ShareImg` varchar(200) NOT NULL COMMENT '分享',
  `SynchronizeCard` tinyint(1) NOT NULL COMMENT '是否同步到微信卡包，是的话才出现微信卡卷相关UI',
  `CardTitle` varchar(30) DEFAULT NULL COMMENT '微信卡卷相关',
  `CardColor` varchar(20) DEFAULT NULL COMMENT '微信卡卷相关',
  `CardSubtitle` varchar(30) DEFAULT NULL COMMENT '微信卡卷相关',
  `IsInvalid` tinyint(1) NOT NULL COMMENT '是否失效',
  `ReceiveCount` int(11) DEFAULT NULL COMMENT '领取数量',
  `QRPath` varchar(80) NOT NULL COMMENT '二维码路径',
  `WXCardState` int(255) NOT NULL COMMENT '微信卡卷审核状态',
  PRIMARY KEY (`Id`),
  KEY `FK_zzzShopId` (`ShopId`),
  CONSTRAINT `FK_zzzShopId` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopBonus`
--

LOCK TABLES `Himall_ShopBonus` WRITE;
/*!40000 ALTER TABLE `Himall_ShopBonus` DISABLE KEYS */;
INSERT INTO `Himall_ShopBonus` VALUES (57,1,'双十一大放价',88,5.00,20.00,1,0.00,0.01,'2015-10-09 00:00:00','2015-10-16 23:59:59','2015-11-11 00:00:00','2015-11-11 23:59:59','双十一大放价','双十一大放价','/Storage/Shop/Bonus/cdd33499-0fb2-4269-8fba-0fda991d90b9.jpg',1,'双十一代金券','Color101','无门槛代金券',1,0,'',0),(58,1,'一抵10',10,0.10,1.00,1,0.00,0.01,'2015-10-13 00:00:00','2015-10-31 23:59:59','2015-10-13 00:00:00','2015-10-31 23:59:59','一抵10','0213','/Storage/Shop/Bonus/4b3171bd-576e-4d55-87f8-b803b85f1640.bmp',1,'012','Color090',NULL,0,0,'',0);
/*!40000 ALTER TABLE `Himall_ShopBonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopBonusGrant`
--

DROP TABLE IF EXISTS `Himall_ShopBonusGrant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopBonusGrant` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopBonusId` bigint(20) NOT NULL COMMENT '红包Id',
  `UserId` bigint(20) NOT NULL COMMENT '发放人',
  `OrderId` bigint(20) NOT NULL,
  `BonusQR` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ShopBonusId` (`ShopBonusId`),
  KEY `FK_zzzUserID` (`UserId`),
  CONSTRAINT `FK_ShopBonusId` FOREIGN KEY (`ShopBonusId`) REFERENCES `Himall_ShopBonus` (`Id`),
  CONSTRAINT `FK_zzzUserID` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopBonusGrant`
--

LOCK TABLES `Himall_ShopBonusGrant` WRITE;
/*!40000 ALTER TABLE `Himall_ShopBonusGrant` DISABLE KEYS */;
INSERT INTO `Himall_ShopBonusGrant` VALUES (197,57,567,2015101096566714,'/Storage/Shop/Bonus/03470f93-8eac-41e7-b742-7bf9bf88216d.jpg'),(198,57,567,2015101076263472,'/Storage/Shop/Bonus/0dba898b-4d0c-4e55-92d4-3cf08589732e.jpg'),(199,57,541,2015101296168092,'/Storage/Shop/Bonus/c5af6b26-57f4-4841-a389-114f75f6e23c.jpg'),(200,57,578,2015101205702615,'/Storage/Shop/Bonus/90d9b8e2-64b3-4e33-817b-a5cdaa21236a.jpg'),(201,57,557,2015101370463743,'/Storage/Shop/Bonus/418bd29d-b0c1-46c7-87b5-38d7c3b83c60.jpg'),(202,58,550,2015101479785896,'/Storage/Shop/Bonus/0359de30-dbca-4aad-b310-720405c8045e.jpg'),(203,58,557,2015101498454425,'/Storage/Shop/Bonus/65e892c2-3f53-4896-b2c9-fd9fa5db76c6.jpg');
/*!40000 ALTER TABLE `Himall_ShopBonusGrant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopBonusReceive`
--

DROP TABLE IF EXISTS `Himall_ShopBonusReceive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopBonusReceive` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BonusGrantId` bigint(20) NOT NULL COMMENT '红包Id',
  `OpenId` varchar(100) DEFAULT NULL,
  `Price` decimal(18,2) DEFAULT NULL COMMENT '面额',
  `State` int(11) NOT NULL COMMENT '1.未使用  2.已使用  3.已过期',
  `ReceiveTime` datetime DEFAULT NULL COMMENT '领取时间',
  `UsedTime` datetime DEFAULT NULL COMMENT '使用时间',
  `UserId` bigint(20) DEFAULT NULL COMMENT 'UserID',
  `UsedOrderId` bigint(20) DEFAULT NULL COMMENT '使用的订单号',
  `WXName` varchar(30) DEFAULT NULL,
  `WXHead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_BonusGrantId` (`BonusGrantId`),
  KEY `FK_useUserID` (`UserId`),
  CONSTRAINT `FK_BonusGrantId` FOREIGN KEY (`BonusGrantId`) REFERENCES `Himall_ShopBonusGrant` (`Id`),
  CONSTRAINT `FK_useUserID` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4787 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopBonusReceive`
--

LOCK TABLES `Himall_ShopBonusReceive` WRITE;
/*!40000 ALTER TABLE `Himall_ShopBonusReceive` DISABLE KEYS */;
INSERT INTO `Himall_ShopBonusReceive` VALUES (4327,197,NULL,11.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4328,197,NULL,17.05,1,NULL,NULL,NULL,NULL,NULL,NULL),(4329,197,NULL,7.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4330,197,NULL,8.59,1,NULL,NULL,NULL,NULL,NULL,NULL),(4331,197,NULL,6.49,1,NULL,NULL,NULL,NULL,NULL,NULL),(4332,197,NULL,13.65,1,NULL,NULL,NULL,NULL,NULL,NULL),(4333,197,NULL,17.94,1,NULL,NULL,NULL,NULL,NULL,NULL),(4334,197,NULL,5.53,1,NULL,NULL,NULL,NULL,NULL,NULL),(4335,197,NULL,14.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4336,197,NULL,19.30,1,NULL,NULL,NULL,NULL,NULL,NULL),(4337,197,NULL,13.41,1,NULL,NULL,NULL,NULL,NULL,NULL),(4338,197,NULL,17.47,1,NULL,NULL,NULL,NULL,NULL,NULL),(4339,197,NULL,18.25,1,NULL,NULL,NULL,NULL,NULL,NULL),(4340,197,NULL,10.86,1,NULL,NULL,NULL,NULL,NULL,NULL),(4341,197,NULL,7.81,1,NULL,NULL,NULL,NULL,NULL,NULL),(4342,197,NULL,12.16,1,NULL,NULL,NULL,NULL,NULL,NULL),(4343,197,NULL,14.18,1,NULL,NULL,NULL,NULL,NULL,NULL),(4344,197,NULL,15.26,1,NULL,NULL,NULL,NULL,NULL,NULL),(4345,197,NULL,13.13,1,NULL,NULL,NULL,NULL,NULL,NULL),(4346,197,NULL,12.25,1,NULL,NULL,NULL,NULL,NULL,NULL),(4347,197,NULL,10.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4348,197,NULL,18.34,1,NULL,NULL,NULL,NULL,NULL,NULL),(4349,197,NULL,11.62,1,NULL,NULL,NULL,NULL,NULL,NULL),(4350,197,NULL,10.77,1,NULL,NULL,NULL,NULL,NULL,NULL),(4351,197,NULL,15.46,1,NULL,NULL,NULL,NULL,NULL,NULL),(4352,197,NULL,15.22,1,NULL,NULL,NULL,NULL,NULL,NULL),(4353,197,NULL,9.41,1,NULL,NULL,NULL,NULL,NULL,NULL),(4354,197,NULL,5.02,1,NULL,NULL,NULL,NULL,NULL,NULL),(4355,197,NULL,15.36,1,NULL,NULL,NULL,NULL,NULL,NULL),(4356,197,NULL,7.93,1,NULL,NULL,NULL,NULL,NULL,NULL),(4357,197,NULL,15.40,1,NULL,NULL,NULL,NULL,NULL,NULL),(4358,197,NULL,11.29,1,NULL,NULL,NULL,NULL,NULL,NULL),(4359,197,NULL,5.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4360,197,NULL,19.69,1,NULL,NULL,NULL,NULL,NULL,NULL),(4361,197,NULL,8.75,1,NULL,NULL,NULL,NULL,NULL,NULL),(4362,197,NULL,19.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4363,197,NULL,18.71,1,NULL,NULL,NULL,NULL,NULL,NULL),(4364,197,NULL,19.96,1,NULL,NULL,NULL,NULL,NULL,NULL),(4365,197,NULL,12.51,1,NULL,NULL,NULL,NULL,NULL,NULL),(4366,197,NULL,5.28,1,NULL,NULL,NULL,NULL,NULL,NULL),(4367,197,NULL,18.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4368,197,NULL,6.73,1,NULL,NULL,NULL,NULL,NULL,NULL),(4369,197,NULL,6.26,1,NULL,NULL,NULL,NULL,NULL,NULL),(4370,197,NULL,17.25,1,NULL,NULL,NULL,NULL,NULL,NULL),(4371,197,NULL,7.69,1,NULL,NULL,NULL,NULL,NULL,NULL),(4372,197,NULL,13.23,1,NULL,NULL,NULL,NULL,NULL,NULL),(4373,197,NULL,19.58,1,NULL,NULL,NULL,NULL,NULL,NULL),(4374,197,NULL,13.95,1,NULL,NULL,NULL,NULL,NULL,NULL),(4375,197,NULL,8.61,1,NULL,NULL,NULL,NULL,NULL,NULL),(4376,197,NULL,9.06,1,NULL,NULL,NULL,NULL,NULL,NULL),(4377,197,NULL,14.64,1,NULL,NULL,NULL,NULL,NULL,NULL),(4378,197,NULL,12.97,1,NULL,NULL,NULL,NULL,NULL,NULL),(4379,197,NULL,12.24,1,NULL,NULL,NULL,NULL,NULL,NULL),(4380,197,NULL,10.59,1,NULL,NULL,NULL,NULL,NULL,NULL),(4381,197,NULL,12.08,1,NULL,NULL,NULL,NULL,NULL,NULL),(4382,197,NULL,12.21,1,NULL,NULL,NULL,NULL,NULL,NULL),(4383,197,NULL,9.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4384,197,NULL,5.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4385,197,NULL,9.67,1,NULL,NULL,NULL,NULL,NULL,NULL),(4386,197,NULL,7.75,1,NULL,NULL,NULL,NULL,NULL,NULL),(4387,197,NULL,13.74,1,NULL,NULL,NULL,NULL,NULL,NULL),(4388,197,NULL,13.55,1,NULL,NULL,NULL,NULL,NULL,NULL),(4389,197,NULL,8.70,1,NULL,NULL,NULL,NULL,NULL,NULL),(4390,197,NULL,12.30,1,NULL,NULL,NULL,NULL,NULL,NULL),(4391,197,NULL,7.98,1,NULL,NULL,NULL,NULL,NULL,NULL),(4392,197,NULL,16.89,1,NULL,NULL,NULL,NULL,NULL,NULL),(4393,197,NULL,7.97,1,NULL,NULL,NULL,NULL,NULL,NULL),(4394,197,NULL,14.27,1,NULL,NULL,NULL,NULL,NULL,NULL),(4395,197,NULL,6.16,1,NULL,NULL,NULL,NULL,NULL,NULL),(4396,197,NULL,8.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4397,197,NULL,18.27,1,NULL,NULL,NULL,NULL,NULL,NULL),(4398,197,NULL,16.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4399,197,NULL,7.33,1,NULL,NULL,NULL,NULL,NULL,NULL),(4400,197,NULL,18.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4401,197,NULL,13.46,1,NULL,NULL,NULL,NULL,NULL,NULL),(4402,197,NULL,15.53,1,NULL,NULL,NULL,NULL,NULL,NULL),(4403,197,NULL,11.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4404,197,NULL,12.88,1,NULL,NULL,NULL,NULL,NULL,NULL),(4405,197,NULL,6.98,1,NULL,NULL,NULL,NULL,NULL,NULL),(4406,197,NULL,16.81,1,NULL,NULL,NULL,NULL,NULL,NULL),(4407,197,NULL,16.05,1,NULL,NULL,NULL,NULL,NULL,NULL),(4408,197,NULL,11.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4409,197,NULL,9.61,1,NULL,NULL,NULL,NULL,NULL,NULL),(4410,197,NULL,5.35,1,NULL,NULL,NULL,NULL,NULL,NULL),(4411,197,NULL,8.75,1,NULL,NULL,NULL,NULL,NULL,NULL),(4412,197,NULL,5.12,1,NULL,NULL,NULL,NULL,NULL,NULL),(4413,197,NULL,12.31,1,NULL,NULL,NULL,NULL,NULL,NULL),(4414,197,NULL,17.27,1,NULL,NULL,NULL,NULL,NULL,NULL),(4415,198,'osRzujo1mpla0AfOOrAhxCfULzT4',7.62,1,'2015-10-10 16:27:35',NULL,567,NULL,'廖日龙','http://wx.qlogo.cn/mmopen/mAjqKY9Z3TnsR4sW9ooxrHd8qNyHib1UBX0TibK8TwPdcwUDuZLCDMfib6zNc1sgibC0ZicwAiakGNEtLCEB70jc4KnaQ6ay3IqPibs/0'),(4416,198,'osRzujvuZWgJFi4bY2ngxdNdj1UY',9.13,1,'2015-10-10 16:27:39',NULL,550,NULL,'王春','http://wx.qlogo.cn/mmopen/lKS3D4Nr1QVZUZIZWDeicV0kBIYdRogJLpkAHLyoOp8zsx8ZsURiaTH7TlHsrG4oS5olY36prUEPC15ZkEqcX9mZoVxhD15dTU/0'),(4417,198,'osRzujkyavZMEU9-n1X3Pkd2afUM',19.93,1,'2015-10-10 16:27:49',NULL,NULL,NULL,'戴子意','http://wx.qlogo.cn/mmopen/uibtYsegiaNclswQhjdJhVWZNib3ZcRQHwIx3A2Ewic9n9Zuv7duicR7hEjlDFBcbicwfo1Ed4GqibUHp87Frbg2ibrsic2jI89QNZtFS/0'),(4418,198,'osRzujsSdpyA-Fd1OqdeNGaB-PkM',11.46,1,'2015-10-10 16:28:46',NULL,557,NULL,'欸欸','http://wx.qlogo.cn/mmopen/uibtYsegiaNclswQhjdJhVWYic2SheBBZefpAFhMIsCqPahZIdySW8fsVI8l17OSZGmVAhOibx2JClzH5z2Bt57OHkD3wxz6gibNW/0'),(4419,198,'osRzujpprRI2XGEb6AHojVwQmYKw',9.53,1,'2015-10-10 16:46:10',NULL,NULL,NULL,'Luss','http://wx.qlogo.cn/mmopen/mAjqKY9Z3TkcRO6a9rkro91aHicXQ8zlq6rpiaegMl0STI0WicnjGbVciad4B6LibiciaCMk7KfYQQOJiaANpIzlOIpQvg/0'),(4420,198,'osRzujgSWLRgcgDDHS3hYglRzTdg',11.48,1,'2015-10-10 16:48:26',NULL,NULL,NULL,'姚招财','http://wx.qlogo.cn/mmopen/uibtYsegiaNclswQhjdJhVWd9xia9ibplo8MUgLjeeqC6HKGr18zqKPFAaJVZs0cqla1Z5Zjln7ibvmdxKPtgDSxe9MoBO0l3H3Xh/0'),(4421,198,NULL,11.32,1,NULL,NULL,NULL,NULL,NULL,NULL),(4422,198,NULL,6.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4423,198,NULL,15.66,1,NULL,NULL,NULL,NULL,NULL,NULL),(4424,198,NULL,8.34,1,NULL,NULL,NULL,NULL,NULL,NULL),(4425,198,NULL,12.17,1,NULL,NULL,NULL,NULL,NULL,NULL),(4426,198,NULL,16.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4427,198,NULL,7.33,1,NULL,NULL,NULL,NULL,NULL,NULL),(4428,198,NULL,12.64,1,NULL,NULL,NULL,NULL,NULL,NULL),(4429,198,NULL,15.24,1,NULL,NULL,NULL,NULL,NULL,NULL),(4430,198,NULL,6.34,1,NULL,NULL,NULL,NULL,NULL,NULL),(4431,198,NULL,19.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4432,198,NULL,8.03,1,NULL,NULL,NULL,NULL,NULL,NULL),(4433,198,NULL,7.47,1,NULL,NULL,NULL,NULL,NULL,NULL),(4434,198,NULL,9.03,1,NULL,NULL,NULL,NULL,NULL,NULL),(4435,198,NULL,11.32,1,NULL,NULL,NULL,NULL,NULL,NULL),(4436,198,NULL,5.45,1,NULL,NULL,NULL,NULL,NULL,NULL),(4437,198,NULL,6.06,1,NULL,NULL,NULL,NULL,NULL,NULL),(4438,198,NULL,13.59,1,NULL,NULL,NULL,NULL,NULL,NULL),(4439,198,NULL,13.94,1,NULL,NULL,NULL,NULL,NULL,NULL),(4440,198,NULL,14.23,1,NULL,NULL,NULL,NULL,NULL,NULL),(4441,198,NULL,7.74,1,NULL,NULL,NULL,NULL,NULL,NULL),(4442,198,NULL,18.98,1,NULL,NULL,NULL,NULL,NULL,NULL),(4443,198,NULL,17.67,1,NULL,NULL,NULL,NULL,NULL,NULL),(4444,198,NULL,19.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4445,198,NULL,11.76,1,NULL,NULL,NULL,NULL,NULL,NULL),(4446,198,NULL,16.04,1,NULL,NULL,NULL,NULL,NULL,NULL),(4447,198,NULL,11.11,1,NULL,NULL,NULL,NULL,NULL,NULL),(4448,198,NULL,12.38,1,NULL,NULL,NULL,NULL,NULL,NULL),(4449,198,NULL,6.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4450,198,NULL,19.21,1,NULL,NULL,NULL,NULL,NULL,NULL),(4451,198,NULL,10.24,1,NULL,NULL,NULL,NULL,NULL,NULL),(4452,198,NULL,18.19,1,NULL,NULL,NULL,NULL,NULL,NULL),(4453,198,NULL,7.31,1,NULL,NULL,NULL,NULL,NULL,NULL),(4454,198,NULL,12.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4455,198,NULL,16.90,1,NULL,NULL,NULL,NULL,NULL,NULL),(4456,198,NULL,6.74,1,NULL,NULL,NULL,NULL,NULL,NULL),(4457,198,NULL,13.84,1,NULL,NULL,NULL,NULL,NULL,NULL),(4458,198,NULL,7.24,1,NULL,NULL,NULL,NULL,NULL,NULL),(4459,198,NULL,7.24,1,NULL,NULL,NULL,NULL,NULL,NULL),(4460,198,NULL,7.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4461,198,NULL,12.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4462,198,NULL,13.69,1,NULL,NULL,NULL,NULL,NULL,NULL),(4463,198,NULL,13.99,1,NULL,NULL,NULL,NULL,NULL,NULL),(4464,198,NULL,19.99,1,NULL,NULL,NULL,NULL,NULL,NULL),(4465,198,NULL,13.18,1,NULL,NULL,NULL,NULL,NULL,NULL),(4466,198,NULL,12.45,1,NULL,NULL,NULL,NULL,NULL,NULL),(4467,198,NULL,19.45,1,NULL,NULL,NULL,NULL,NULL,NULL),(4468,198,NULL,17.95,1,NULL,NULL,NULL,NULL,NULL,NULL),(4469,198,NULL,17.73,1,NULL,NULL,NULL,NULL,NULL,NULL),(4470,198,NULL,17.54,1,NULL,NULL,NULL,NULL,NULL,NULL),(4471,198,NULL,7.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4472,198,NULL,17.54,1,NULL,NULL,NULL,NULL,NULL,NULL),(4473,198,NULL,14.03,1,NULL,NULL,NULL,NULL,NULL,NULL),(4474,198,NULL,11.62,1,NULL,NULL,NULL,NULL,NULL,NULL),(4475,198,NULL,19.25,1,NULL,NULL,NULL,NULL,NULL,NULL),(4476,198,NULL,8.86,1,NULL,NULL,NULL,NULL,NULL,NULL),(4477,198,NULL,18.47,1,NULL,NULL,NULL,NULL,NULL,NULL),(4478,198,NULL,15.69,1,NULL,NULL,NULL,NULL,NULL,NULL),(4479,198,NULL,14.19,1,NULL,NULL,NULL,NULL,NULL,NULL),(4480,198,NULL,14.15,1,NULL,NULL,NULL,NULL,NULL,NULL),(4481,198,NULL,9.50,1,NULL,NULL,NULL,NULL,NULL,NULL),(4482,198,NULL,12.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4483,198,NULL,11.65,1,NULL,NULL,NULL,NULL,NULL,NULL),(4484,198,NULL,16.14,1,NULL,NULL,NULL,NULL,NULL,NULL),(4485,198,NULL,19.20,1,NULL,NULL,NULL,NULL,NULL,NULL),(4486,198,NULL,10.42,1,NULL,NULL,NULL,NULL,NULL,NULL),(4487,198,NULL,10.62,1,NULL,NULL,NULL,NULL,NULL,NULL),(4488,198,NULL,9.62,1,NULL,NULL,NULL,NULL,NULL,NULL),(4489,198,NULL,17.06,1,NULL,NULL,NULL,NULL,NULL,NULL),(4490,198,NULL,5.52,1,NULL,NULL,NULL,NULL,NULL,NULL),(4491,198,NULL,13.37,1,NULL,NULL,NULL,NULL,NULL,NULL),(4492,198,NULL,5.32,1,NULL,NULL,NULL,NULL,NULL,NULL),(4493,198,NULL,19.63,1,NULL,NULL,NULL,NULL,NULL,NULL),(4494,198,NULL,12.53,1,NULL,NULL,NULL,NULL,NULL,NULL),(4495,198,NULL,16.16,1,NULL,NULL,NULL,NULL,NULL,NULL),(4496,198,NULL,9.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4497,198,NULL,6.70,1,NULL,NULL,NULL,NULL,NULL,NULL),(4498,198,NULL,8.67,1,NULL,NULL,NULL,NULL,NULL,NULL),(4499,198,NULL,10.23,1,NULL,NULL,NULL,NULL,NULL,NULL),(4500,198,NULL,6.02,1,NULL,NULL,NULL,NULL,NULL,NULL),(4501,198,NULL,9.31,1,NULL,NULL,NULL,NULL,NULL,NULL),(4502,198,NULL,14.76,1,NULL,NULL,NULL,NULL,NULL,NULL),(4503,199,NULL,19.44,1,NULL,NULL,NULL,NULL,NULL,NULL),(4504,199,NULL,12.16,1,NULL,NULL,NULL,NULL,NULL,NULL),(4505,199,NULL,8.54,1,NULL,NULL,NULL,NULL,NULL,NULL),(4506,199,NULL,16.08,1,NULL,NULL,NULL,NULL,NULL,NULL),(4507,199,NULL,9.45,1,NULL,NULL,NULL,NULL,NULL,NULL),(4508,199,NULL,14.12,1,NULL,NULL,NULL,NULL,NULL,NULL),(4509,199,NULL,12.97,1,NULL,NULL,NULL,NULL,NULL,NULL),(4510,199,NULL,6.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4511,199,NULL,17.59,1,NULL,NULL,NULL,NULL,NULL,NULL),(4512,199,NULL,9.25,1,NULL,NULL,NULL,NULL,NULL,NULL),(4513,199,NULL,12.69,1,NULL,NULL,NULL,NULL,NULL,NULL),(4514,199,NULL,13.64,1,NULL,NULL,NULL,NULL,NULL,NULL),(4515,199,NULL,6.49,1,NULL,NULL,NULL,NULL,NULL,NULL),(4516,199,NULL,18.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4517,199,NULL,15.15,1,NULL,NULL,NULL,NULL,NULL,NULL),(4518,199,NULL,16.56,1,NULL,NULL,NULL,NULL,NULL,NULL),(4519,199,NULL,5.11,1,NULL,NULL,NULL,NULL,NULL,NULL),(4520,199,NULL,15.08,1,NULL,NULL,NULL,NULL,NULL,NULL),(4521,199,NULL,15.12,1,NULL,NULL,NULL,NULL,NULL,NULL),(4522,199,NULL,13.22,1,NULL,NULL,NULL,NULL,NULL,NULL),(4523,199,NULL,6.34,1,NULL,NULL,NULL,NULL,NULL,NULL),(4524,199,NULL,19.66,1,NULL,NULL,NULL,NULL,NULL,NULL),(4525,199,NULL,14.62,1,NULL,NULL,NULL,NULL,NULL,NULL),(4526,199,NULL,17.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4527,199,NULL,16.49,1,NULL,NULL,NULL,NULL,NULL,NULL),(4528,199,NULL,11.37,1,NULL,NULL,NULL,NULL,NULL,NULL),(4529,199,NULL,19.42,1,NULL,NULL,NULL,NULL,NULL,NULL),(4530,199,NULL,15.28,1,NULL,NULL,NULL,NULL,NULL,NULL),(4531,199,NULL,17.83,1,NULL,NULL,NULL,NULL,NULL,NULL),(4532,199,NULL,5.71,1,NULL,NULL,NULL,NULL,NULL,NULL),(4533,199,NULL,14.20,1,NULL,NULL,NULL,NULL,NULL,NULL),(4534,199,NULL,10.19,1,NULL,NULL,NULL,NULL,NULL,NULL),(4535,199,NULL,15.08,1,NULL,NULL,NULL,NULL,NULL,NULL),(4536,199,NULL,6.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4537,199,NULL,8.99,1,NULL,NULL,NULL,NULL,NULL,NULL),(4538,199,NULL,11.72,1,NULL,NULL,NULL,NULL,NULL,NULL),(4539,199,NULL,5.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4540,199,NULL,7.18,1,NULL,NULL,NULL,NULL,NULL,NULL),(4541,199,NULL,16.93,1,NULL,NULL,NULL,NULL,NULL,NULL),(4542,199,NULL,19.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4543,199,NULL,14.85,1,NULL,NULL,NULL,NULL,NULL,NULL),(4544,199,NULL,17.23,1,NULL,NULL,NULL,NULL,NULL,NULL),(4545,199,NULL,15.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4546,199,NULL,14.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4547,199,NULL,11.43,1,NULL,NULL,NULL,NULL,NULL,NULL),(4548,199,NULL,8.83,1,NULL,NULL,NULL,NULL,NULL,NULL),(4549,199,NULL,5.85,1,NULL,NULL,NULL,NULL,NULL,NULL),(4550,199,NULL,13.89,1,NULL,NULL,NULL,NULL,NULL,NULL),(4551,199,NULL,19.76,1,NULL,NULL,NULL,NULL,NULL,NULL),(4552,199,NULL,19.59,1,NULL,NULL,NULL,NULL,NULL,NULL),(4553,199,NULL,12.45,1,NULL,NULL,NULL,NULL,NULL,NULL),(4554,199,NULL,17.79,1,NULL,NULL,NULL,NULL,NULL,NULL),(4555,199,NULL,5.70,1,NULL,NULL,NULL,NULL,NULL,NULL),(4556,199,NULL,10.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4557,199,NULL,8.51,1,NULL,NULL,NULL,NULL,NULL,NULL),(4558,199,NULL,13.90,1,NULL,NULL,NULL,NULL,NULL,NULL),(4559,199,NULL,17.58,1,NULL,NULL,NULL,NULL,NULL,NULL),(4560,199,NULL,5.77,1,NULL,NULL,NULL,NULL,NULL,NULL),(4561,199,NULL,10.14,1,NULL,NULL,NULL,NULL,NULL,NULL),(4562,199,NULL,12.30,1,NULL,NULL,NULL,NULL,NULL,NULL),(4563,199,NULL,11.50,1,NULL,NULL,NULL,NULL,NULL,NULL),(4564,199,NULL,19.83,1,NULL,NULL,NULL,NULL,NULL,NULL),(4565,199,NULL,16.59,1,NULL,NULL,NULL,NULL,NULL,NULL),(4566,199,NULL,14.18,1,NULL,NULL,NULL,NULL,NULL,NULL),(4567,199,NULL,12.27,1,NULL,NULL,NULL,NULL,NULL,NULL),(4568,199,NULL,7.98,1,NULL,NULL,NULL,NULL,NULL,NULL),(4569,199,NULL,19.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4570,199,NULL,19.21,1,NULL,NULL,NULL,NULL,NULL,NULL),(4571,199,NULL,5.03,1,NULL,NULL,NULL,NULL,NULL,NULL),(4572,199,NULL,7.01,1,NULL,NULL,NULL,NULL,NULL,NULL),(4573,199,NULL,5.74,1,NULL,NULL,NULL,NULL,NULL,NULL),(4574,199,NULL,10.91,1,NULL,NULL,NULL,NULL,NULL,NULL),(4575,199,NULL,18.33,1,NULL,NULL,NULL,NULL,NULL,NULL),(4576,199,NULL,19.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4577,199,NULL,16.81,1,NULL,NULL,NULL,NULL,NULL,NULL),(4578,199,NULL,12.84,1,NULL,NULL,NULL,NULL,NULL,NULL),(4579,199,NULL,9.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4580,199,NULL,7.03,1,NULL,NULL,NULL,NULL,NULL,NULL),(4581,199,NULL,12.97,1,NULL,NULL,NULL,NULL,NULL,NULL),(4582,199,NULL,5.46,1,NULL,NULL,NULL,NULL,NULL,NULL),(4583,199,NULL,5.18,1,NULL,NULL,NULL,NULL,NULL,NULL),(4584,199,NULL,11.99,1,NULL,NULL,NULL,NULL,NULL,NULL),(4585,199,NULL,9.55,1,NULL,NULL,NULL,NULL,NULL,NULL),(4586,199,NULL,19.47,1,NULL,NULL,NULL,NULL,NULL,NULL),(4587,199,NULL,14.86,1,NULL,NULL,NULL,NULL,NULL,NULL),(4588,199,NULL,15.35,1,NULL,NULL,NULL,NULL,NULL,NULL),(4589,199,NULL,19.47,1,NULL,NULL,NULL,NULL,NULL,NULL),(4590,199,NULL,8.71,1,NULL,NULL,NULL,NULL,NULL,NULL),(4591,200,NULL,11.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4592,200,NULL,9.43,1,NULL,NULL,NULL,NULL,NULL,NULL),(4593,200,NULL,12.32,1,NULL,NULL,NULL,NULL,NULL,NULL),(4594,200,NULL,9.94,1,NULL,NULL,NULL,NULL,NULL,NULL),(4595,200,NULL,11.21,1,NULL,NULL,NULL,NULL,NULL,NULL),(4596,200,NULL,11.13,1,NULL,NULL,NULL,NULL,NULL,NULL),(4597,200,NULL,6.79,1,NULL,NULL,NULL,NULL,NULL,NULL),(4598,200,NULL,6.97,1,NULL,NULL,NULL,NULL,NULL,NULL),(4599,200,NULL,14.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4600,200,NULL,8.74,1,NULL,NULL,NULL,NULL,NULL,NULL),(4601,200,NULL,19.26,1,NULL,NULL,NULL,NULL,NULL,NULL),(4602,200,NULL,5.37,1,NULL,NULL,NULL,NULL,NULL,NULL),(4603,200,NULL,15.66,1,NULL,NULL,NULL,NULL,NULL,NULL),(4604,200,NULL,15.62,1,NULL,NULL,NULL,NULL,NULL,NULL),(4605,200,NULL,16.34,1,NULL,NULL,NULL,NULL,NULL,NULL),(4606,200,NULL,7.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4607,200,NULL,18.99,1,NULL,NULL,NULL,NULL,NULL,NULL),(4608,200,NULL,10.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4609,200,NULL,14.88,1,NULL,NULL,NULL,NULL,NULL,NULL),(4610,200,NULL,18.32,1,NULL,NULL,NULL,NULL,NULL,NULL),(4611,200,NULL,8.43,1,NULL,NULL,NULL,NULL,NULL,NULL),(4612,200,NULL,19.05,1,NULL,NULL,NULL,NULL,NULL,NULL),(4613,200,NULL,6.06,1,NULL,NULL,NULL,NULL,NULL,NULL),(4614,200,NULL,7.85,1,NULL,NULL,NULL,NULL,NULL,NULL),(4615,200,NULL,16.91,1,NULL,NULL,NULL,NULL,NULL,NULL),(4616,200,NULL,13.17,1,NULL,NULL,NULL,NULL,NULL,NULL),(4617,200,NULL,6.22,1,NULL,NULL,NULL,NULL,NULL,NULL),(4618,200,NULL,5.19,1,NULL,NULL,NULL,NULL,NULL,NULL),(4619,200,NULL,12.92,1,NULL,NULL,NULL,NULL,NULL,NULL),(4620,200,NULL,16.82,1,NULL,NULL,NULL,NULL,NULL,NULL),(4621,200,NULL,14.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4622,200,NULL,7.08,1,NULL,NULL,NULL,NULL,NULL,NULL),(4623,200,NULL,6.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4624,200,NULL,8.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4625,200,NULL,11.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4626,200,NULL,9.76,1,NULL,NULL,NULL,NULL,NULL,NULL),(4627,200,NULL,19.94,1,NULL,NULL,NULL,NULL,NULL,NULL),(4628,200,NULL,12.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4629,200,NULL,8.01,1,NULL,NULL,NULL,NULL,NULL,NULL),(4630,200,NULL,8.63,1,NULL,NULL,NULL,NULL,NULL,NULL),(4631,200,NULL,12.82,1,NULL,NULL,NULL,NULL,NULL,NULL),(4632,200,NULL,17.84,1,NULL,NULL,NULL,NULL,NULL,NULL),(4633,200,NULL,16.97,1,NULL,NULL,NULL,NULL,NULL,NULL),(4634,200,NULL,16.66,1,NULL,NULL,NULL,NULL,NULL,NULL),(4635,200,NULL,19.19,1,NULL,NULL,NULL,NULL,NULL,NULL),(4636,200,NULL,17.73,1,NULL,NULL,NULL,NULL,NULL,NULL),(4637,200,NULL,7.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4638,200,NULL,15.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4639,200,NULL,8.91,1,NULL,NULL,NULL,NULL,NULL,NULL),(4640,200,NULL,19.54,1,NULL,NULL,NULL,NULL,NULL,NULL),(4641,200,NULL,17.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4642,200,NULL,11.09,1,NULL,NULL,NULL,NULL,NULL,NULL),(4643,200,NULL,14.78,1,NULL,NULL,NULL,NULL,NULL,NULL),(4644,200,NULL,7.17,1,NULL,NULL,NULL,NULL,NULL,NULL),(4645,200,NULL,15.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4646,200,NULL,18.52,1,NULL,NULL,NULL,NULL,NULL,NULL),(4647,200,NULL,14.12,1,NULL,NULL,NULL,NULL,NULL,NULL),(4648,200,NULL,9.81,1,NULL,NULL,NULL,NULL,NULL,NULL),(4649,200,NULL,17.34,1,NULL,NULL,NULL,NULL,NULL,NULL),(4650,200,NULL,9.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4651,200,NULL,17.58,1,NULL,NULL,NULL,NULL,NULL,NULL),(4652,200,NULL,7.23,1,NULL,NULL,NULL,NULL,NULL,NULL),(4653,200,NULL,17.58,1,NULL,NULL,NULL,NULL,NULL,NULL),(4654,200,NULL,14.91,1,NULL,NULL,NULL,NULL,NULL,NULL),(4655,200,NULL,9.92,1,NULL,NULL,NULL,NULL,NULL,NULL),(4656,200,NULL,9.35,1,NULL,NULL,NULL,NULL,NULL,NULL),(4657,200,NULL,5.72,1,NULL,NULL,NULL,NULL,NULL,NULL),(4658,200,NULL,17.44,1,NULL,NULL,NULL,NULL,NULL,NULL),(4659,200,NULL,10.75,1,NULL,NULL,NULL,NULL,NULL,NULL),(4660,200,NULL,8.01,1,NULL,NULL,NULL,NULL,NULL,NULL),(4661,200,NULL,16.59,1,NULL,NULL,NULL,NULL,NULL,NULL),(4662,200,NULL,19.46,1,NULL,NULL,NULL,NULL,NULL,NULL),(4663,200,NULL,9.34,1,NULL,NULL,NULL,NULL,NULL,NULL),(4664,200,NULL,6.04,1,NULL,NULL,NULL,NULL,NULL,NULL),(4665,200,NULL,16.86,1,NULL,NULL,NULL,NULL,NULL,NULL),(4666,200,NULL,15.90,1,NULL,NULL,NULL,NULL,NULL,NULL),(4667,200,NULL,14.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4668,200,NULL,16.24,1,NULL,NULL,NULL,NULL,NULL,NULL),(4669,200,NULL,18.21,1,NULL,NULL,NULL,NULL,NULL,NULL),(4670,200,NULL,9.03,1,NULL,NULL,NULL,NULL,NULL,NULL),(4671,200,NULL,7.27,1,NULL,NULL,NULL,NULL,NULL,NULL),(4672,200,NULL,18.80,1,NULL,NULL,NULL,NULL,NULL,NULL),(4673,200,NULL,7.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4674,200,NULL,12.94,1,NULL,NULL,NULL,NULL,NULL,NULL),(4675,200,NULL,9.88,1,NULL,NULL,NULL,NULL,NULL,NULL),(4676,200,NULL,11.09,1,NULL,NULL,NULL,NULL,NULL,NULL),(4677,200,NULL,6.28,1,NULL,NULL,NULL,NULL,NULL,NULL),(4678,200,NULL,9.21,1,NULL,NULL,NULL,NULL,NULL,NULL),(4679,201,NULL,8.66,1,NULL,NULL,NULL,NULL,NULL,NULL),(4680,201,NULL,10.88,1,NULL,NULL,NULL,NULL,NULL,NULL),(4681,201,NULL,14.15,1,NULL,NULL,NULL,NULL,NULL,NULL),(4682,201,NULL,8.58,1,NULL,NULL,NULL,NULL,NULL,NULL),(4683,201,NULL,10.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4684,201,NULL,10.65,1,NULL,NULL,NULL,NULL,NULL,NULL),(4685,201,NULL,15.98,1,NULL,NULL,NULL,NULL,NULL,NULL),(4686,201,NULL,12.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4687,201,NULL,14.64,1,NULL,NULL,NULL,NULL,NULL,NULL),(4688,201,NULL,13.06,1,NULL,NULL,NULL,NULL,NULL,NULL),(4689,201,NULL,18.65,1,NULL,NULL,NULL,NULL,NULL,NULL),(4690,201,NULL,11.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4691,201,NULL,10.42,1,NULL,NULL,NULL,NULL,NULL,NULL),(4692,201,NULL,18.63,1,NULL,NULL,NULL,NULL,NULL,NULL),(4693,201,NULL,6.93,1,NULL,NULL,NULL,NULL,NULL,NULL),(4694,201,NULL,7.93,1,NULL,NULL,NULL,NULL,NULL,NULL),(4695,201,NULL,17.02,1,NULL,NULL,NULL,NULL,NULL,NULL),(4696,201,NULL,7.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4697,201,NULL,19.14,1,NULL,NULL,NULL,NULL,NULL,NULL),(4698,201,NULL,18.94,1,NULL,NULL,NULL,NULL,NULL,NULL),(4699,201,NULL,13.92,1,NULL,NULL,NULL,NULL,NULL,NULL),(4700,201,NULL,6.83,1,NULL,NULL,NULL,NULL,NULL,NULL),(4701,201,NULL,10.40,1,NULL,NULL,NULL,NULL,NULL,NULL),(4702,201,NULL,7.51,1,NULL,NULL,NULL,NULL,NULL,NULL),(4703,201,NULL,12.11,1,NULL,NULL,NULL,NULL,NULL,NULL),(4704,201,NULL,15.38,1,NULL,NULL,NULL,NULL,NULL,NULL),(4705,201,NULL,16.33,1,NULL,NULL,NULL,NULL,NULL,NULL),(4706,201,NULL,16.61,1,NULL,NULL,NULL,NULL,NULL,NULL),(4707,201,NULL,8.67,1,NULL,NULL,NULL,NULL,NULL,NULL),(4708,201,NULL,12.22,1,NULL,NULL,NULL,NULL,NULL,NULL),(4709,201,NULL,8.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4710,201,NULL,12.42,1,NULL,NULL,NULL,NULL,NULL,NULL),(4711,201,NULL,11.45,1,NULL,NULL,NULL,NULL,NULL,NULL),(4712,201,NULL,17.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4713,201,NULL,17.01,1,NULL,NULL,NULL,NULL,NULL,NULL),(4714,201,NULL,6.50,1,NULL,NULL,NULL,NULL,NULL,NULL),(4715,201,NULL,16.62,1,NULL,NULL,NULL,NULL,NULL,NULL),(4716,201,NULL,12.98,1,NULL,NULL,NULL,NULL,NULL,NULL),(4717,201,NULL,13.61,1,NULL,NULL,NULL,NULL,NULL,NULL),(4718,201,NULL,9.95,1,NULL,NULL,NULL,NULL,NULL,NULL),(4719,201,NULL,8.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4720,201,NULL,7.99,1,NULL,NULL,NULL,NULL,NULL,NULL),(4721,201,NULL,8.81,1,NULL,NULL,NULL,NULL,NULL,NULL),(4722,201,NULL,7.50,1,NULL,NULL,NULL,NULL,NULL,NULL),(4723,201,NULL,8.57,1,NULL,NULL,NULL,NULL,NULL,NULL),(4724,201,NULL,9.31,1,NULL,NULL,NULL,NULL,NULL,NULL),(4725,201,NULL,14.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4726,201,NULL,15.96,1,NULL,NULL,NULL,NULL,NULL,NULL),(4727,201,NULL,11.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4728,201,NULL,11.92,1,NULL,NULL,NULL,NULL,NULL,NULL),(4729,201,NULL,13.47,1,NULL,NULL,NULL,NULL,NULL,NULL),(4730,201,NULL,15.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4731,201,NULL,5.21,1,NULL,NULL,NULL,NULL,NULL,NULL),(4732,201,NULL,14.13,1,NULL,NULL,NULL,NULL,NULL,NULL),(4733,201,NULL,17.78,1,NULL,NULL,NULL,NULL,NULL,NULL),(4734,201,NULL,5.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4735,201,NULL,10.58,1,NULL,NULL,NULL,NULL,NULL,NULL),(4736,201,NULL,19.84,1,NULL,NULL,NULL,NULL,NULL,NULL),(4737,201,NULL,11.49,1,NULL,NULL,NULL,NULL,NULL,NULL),(4738,201,NULL,7.60,1,NULL,NULL,NULL,NULL,NULL,NULL),(4739,201,NULL,8.32,1,NULL,NULL,NULL,NULL,NULL,NULL),(4740,201,NULL,11.24,1,NULL,NULL,NULL,NULL,NULL,NULL),(4741,201,NULL,16.78,1,NULL,NULL,NULL,NULL,NULL,NULL),(4742,201,NULL,18.06,1,NULL,NULL,NULL,NULL,NULL,NULL),(4743,201,NULL,18.52,1,NULL,NULL,NULL,NULL,NULL,NULL),(4744,201,NULL,13.87,1,NULL,NULL,NULL,NULL,NULL,NULL),(4745,201,NULL,7.39,1,NULL,NULL,NULL,NULL,NULL,NULL),(4746,201,NULL,10.79,1,NULL,NULL,NULL,NULL,NULL,NULL),(4747,201,NULL,15.66,1,NULL,NULL,NULL,NULL,NULL,NULL),(4748,201,NULL,19.02,1,NULL,NULL,NULL,NULL,NULL,NULL),(4749,201,NULL,7.07,1,NULL,NULL,NULL,NULL,NULL,NULL),(4750,201,NULL,14.46,1,NULL,NULL,NULL,NULL,NULL,NULL),(4751,201,NULL,12.66,1,NULL,NULL,NULL,NULL,NULL,NULL),(4752,201,NULL,19.03,1,NULL,NULL,NULL,NULL,NULL,NULL),(4753,201,NULL,16.85,1,NULL,NULL,NULL,NULL,NULL,NULL),(4754,201,NULL,12.95,1,NULL,NULL,NULL,NULL,NULL,NULL),(4755,201,NULL,12.82,1,NULL,NULL,NULL,NULL,NULL,NULL),(4756,201,NULL,14.26,1,NULL,NULL,NULL,NULL,NULL,NULL),(4757,201,NULL,5.48,1,NULL,NULL,NULL,NULL,NULL,NULL),(4758,201,NULL,16.23,1,NULL,NULL,NULL,NULL,NULL,NULL),(4759,201,NULL,9.58,1,NULL,NULL,NULL,NULL,NULL,NULL),(4760,201,NULL,8.32,1,NULL,NULL,NULL,NULL,NULL,NULL),(4761,201,NULL,8.18,1,NULL,NULL,NULL,NULL,NULL,NULL),(4762,201,NULL,11.97,1,NULL,NULL,NULL,NULL,NULL,NULL),(4763,201,NULL,8.16,1,NULL,NULL,NULL,NULL,NULL,NULL),(4764,201,NULL,7.79,1,NULL,NULL,NULL,NULL,NULL,NULL),(4765,201,NULL,12.19,1,NULL,NULL,NULL,NULL,NULL,NULL),(4766,201,NULL,11.20,1,NULL,NULL,NULL,NULL,NULL,NULL),(4767,202,NULL,0.46,1,NULL,NULL,NULL,NULL,NULL,NULL),(4768,202,NULL,0.13,1,NULL,NULL,NULL,NULL,NULL,NULL),(4769,202,NULL,0.10,1,NULL,NULL,NULL,NULL,NULL,NULL),(4770,202,NULL,0.78,1,NULL,NULL,NULL,NULL,NULL,NULL),(4771,202,NULL,0.17,1,NULL,NULL,NULL,NULL,NULL,NULL),(4772,202,NULL,0.46,1,NULL,NULL,NULL,NULL,NULL,NULL),(4773,202,NULL,0.42,1,NULL,NULL,NULL,NULL,NULL,NULL),(4774,202,NULL,0.68,1,NULL,NULL,NULL,NULL,NULL,NULL),(4775,202,NULL,0.53,1,NULL,NULL,NULL,NULL,NULL,NULL),(4776,202,NULL,0.28,1,NULL,NULL,NULL,NULL,NULL,NULL),(4777,203,NULL,0.65,1,NULL,NULL,NULL,NULL,NULL,NULL),(4778,203,NULL,0.50,1,NULL,NULL,NULL,NULL,NULL,NULL),(4779,203,NULL,0.51,1,NULL,NULL,NULL,NULL,NULL,NULL),(4780,203,NULL,0.86,1,NULL,NULL,NULL,NULL,NULL,NULL),(4781,203,NULL,0.27,1,NULL,NULL,NULL,NULL,NULL,NULL),(4782,203,NULL,0.95,1,NULL,NULL,NULL,NULL,NULL,NULL),(4783,203,NULL,0.28,1,NULL,NULL,NULL,NULL,NULL,NULL),(4784,203,NULL,0.63,1,NULL,NULL,NULL,NULL,NULL,NULL),(4785,203,NULL,0.85,1,NULL,NULL,NULL,NULL,NULL,NULL),(4786,203,NULL,0.72,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Himall_ShopBonusReceive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopBrandApplys`
--

DROP TABLE IF EXISTS `Himall_ShopBrandApplys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopBrandApplys` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '商家Id',
  `BrandId` bigint(20) DEFAULT NULL COMMENT '品牌Id',
  `BrandName` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `Logo` varchar(1000) DEFAULT NULL COMMENT '品牌Logo',
  `Description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `AuthCertificate` varchar(4000) DEFAULT NULL COMMENT '品牌授权证书',
  `ApplyMode` int(11) NOT NULL COMMENT '申请类型 枚举 BrandApplyMode',
  `Remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `AuditStatus` int(11) NOT NULL COMMENT '审核状态 枚举 BrandAuditStatus',
  `ApplyTime` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`Id`),
  KEY `FK_ShopId` (`ShopId`) USING BTREE,
  KEY `FK_BrandId` (`BrandId`) USING BTREE,
  KEY `Id` (`Id`) USING BTREE,
  CONSTRAINT `himall_shopbrandapplys_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `Himall_Brands` (`Id`),
  CONSTRAINT `himall_shopbrandapplys_ibfk_2` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=gbk COMMENT='商家品牌申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopBrandApplys`
--

LOCK TABLES `Himall_ShopBrandApplys` WRITE;
/*!40000 ALTER TABLE `Himall_ShopBrandApplys` DISABLE KEYS */;
INSERT INTO `Himall_ShopBrandApplys` VALUES (161,210,30,'爱慕','/Storage/Plat/Brand/logo_30.jpg',NULL,'/Storage/Shop/210/Brand/auth_161_1.png,/Storage/Shop/210/Brand/auth_161_2.png,/Storage/Shop/210/Brand/auth_161_3.png',1,'申请平台已有的品牌',1,'2015-06-30 19:06:15'),(169,1,154,'小米','/Storage/Plat/Brand/logo_154.jpg','小米科技','/Storage/Shop/1/Brand/auth_169_1.png',1,NULL,1,'2015-07-16 14:07:09'),(188,245,30,'爱慕','/Storage/Plat/Brand/logo_30.jpg',NULL,'/Storage/Shop/245/Brand/auth_188_1.png',1,NULL,1,'2015-10-13 15:08:23'),(189,1,30,'爱慕','/Storage/Plat/Brand/logo_30.jpg',NULL,'/Storage/Shop/1/Brand/auth_189_1.png',1,NULL,1,'2015-10-13 18:18:07'),(190,1,NULL,'南剑','/Storage/Shop/1/Brand/logo_190_1.png','南剑派','/Storage/Shop/1/Brand/auth_190_1.png',2,NULL,0,'2015-10-14 09:26:12'),(191,1,126,'ABC卫生巾','/Storage/Plat/Brand/logo_126.png','ABC卫生巾','/Storage/Shop/1/Brand/auth_191_1.png',1,NULL,0,'2015-10-14 14:19:16');
/*!40000 ALTER TABLE `Himall_ShopBrandApplys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopBrands`
--

DROP TABLE IF EXISTS `Himall_ShopBrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopBrands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ShopId` bigint(20) NOT NULL COMMENT '商家Id',
  `BrandId` bigint(20) NOT NULL COMMENT '品牌Id',
  PRIMARY KEY (`Id`),
  KEY `ShopId` (`ShopId`) USING BTREE,
  KEY `BrandId` (`BrandId`) USING BTREE,
  KEY `Id` (`Id`) USING BTREE,
  CONSTRAINT `himall_shopbrands_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `Himall_Brands` (`Id`),
  CONSTRAINT `himall_shopbrands_ibfk_2` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopBrands`
--

LOCK TABLES `Himall_ShopBrands` WRITE;
/*!40000 ALTER TABLE `Himall_ShopBrands` DISABLE KEYS */;
INSERT INTO `Himall_ShopBrands` VALUES (111,210,265),(112,210,30),(113,1,154),(115,210,271),(127,245,30),(128,1,30);
/*!40000 ALTER TABLE `Himall_ShopBrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopCategories`
--

DROP TABLE IF EXISTS `Himall_ShopCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopCategories` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `ParentCategoryId` bigint(20) NOT NULL COMMENT '上级分类ID',
  `Name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `DisplaySequence` bigint(20) NOT NULL,
  `IsShow` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COMMENT='店铺分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopCategories`
--

LOCK TABLES `Himall_ShopCategories` WRITE;
/*!40000 ALTER TABLE `Himall_ShopCategories` DISABLE KEYS */;
INSERT INTO `Himall_ShopCategories` VALUES (132,6,0,'储存卡',26,1),(133,8,0,'平板',27,1),(134,10,0,'美特斯邦威',28,1),(290,210,0,'电脑',12,1),(291,210,290,'笔记本',1,1),(292,210,290,'超极本',2,1),(293,210,290,'台式机',3,1),(294,210,290,'内存条',4,1),(295,223,0,'家具',13,1),(296,223,295,'客厅',1,1),(297,223,295,'卧室',2,1),(298,227,0,'苹果',14,1),(299,227,0,'OPPO',15,1),(300,229,0,'服装',16,1),(301,215,0,'热销',17,1),(302,215,0,'xxxxx',18,1),(303,215,301,'uuuuu',1,1),(304,210,0,'IT',19,1),(309,210,304,'电饭',1,1),(324,245,0,'测试',22,1),(325,245,324,'测测',1,1),(330,1,0,'毛线11111111111',13,1);
/*!40000 ALTER TABLE `Himall_ShopCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopGrades`
--

DROP TABLE IF EXISTS `Himall_ShopGrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopGrades` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '店铺等级名称',
  `ProductLimit` int(11) NOT NULL COMMENT '最大上传商品数量',
  `ImageLimit` int(11) NOT NULL COMMENT '最大图片可使用空间数量',
  `TemplateLimit` int(11) NOT NULL,
  `ChargeStandard` decimal(8,2) NOT NULL,
  `Remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='店铺等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopGrades`
--

LOCK TABLES `Himall_ShopGrades` WRITE;
/*!40000 ALTER TABLE `Himall_ShopGrades` DISABLE KEYS */;
INSERT INTO `Himall_ShopGrades` VALUES (1,'白金店铺',500,500,500,0.00,NULL),(2,'钻石店铺',1000,1000,1000,1000.00,NULL);
/*!40000 ALTER TABLE `Himall_ShopGrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopHomeModuleProducts`
--

DROP TABLE IF EXISTS `Himall_ShopHomeModuleProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopHomeModuleProducts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `HomeModuleId` bigint(20) NOT NULL,
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`Id`),
  KEY `FK_Product_ShopHomeModuleProduct` (`ProductId`) USING BTREE,
  KEY `FK_ShopHomeModule_ShopHomeModuleProduct` (`HomeModuleId`) USING BTREE,
  CONSTRAINT `himall_shophomemoduleproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_shophomemoduleproducts_ibfk_2` FOREIGN KEY (`HomeModuleId`) REFERENCES `Himall_ShopHomeModules` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='店铺首页的楼层模板商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopHomeModuleProducts`
--

LOCK TABLES `Himall_ShopHomeModuleProducts` WRITE;
/*!40000 ALTER TABLE `Himall_ShopHomeModuleProducts` DISABLE KEYS */;
INSERT INTO `Himall_ShopHomeModuleProducts` VALUES (5,17,234),(6,17,235),(7,17,236),(8,17,238),(9,17,241),(10,17,243),(11,17,245),(12,17,249),(13,17,251),(14,17,252),(15,17,253),(16,1,181),(17,1,182),(18,1,186),(19,1,187),(20,1,188),(21,1,189),(22,1,190),(23,1,191),(24,1,192),(25,1,193),(26,1,194),(27,1,195),(28,1,196),(29,1,197),(30,4,218),(31,4,219),(32,4,220),(33,4,221),(34,4,222),(35,4,223),(36,4,224),(37,4,225),(39,5,227),(42,5,230),(43,5,231),(45,5,228),(46,5,229),(47,5,232),(48,1,301),(49,1,302),(50,19,310);
/*!40000 ALTER TABLE `Himall_ShopHomeModuleProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopHomeModules`
--

DROP TABLE IF EXISTS `Himall_ShopHomeModules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopHomeModules` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `Name` ShopId(20) NOT NULL COMMENT '模块名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='店铺首页模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopHomeModules`
--

LOCK TABLES `Himall_ShopHomeModules` WRITE;
/*!40000 ALTER TABLE `Himall_ShopHomeModules` DISABLE KEYS */;
INSERT INTO `Himall_ShopHomeModules` VALUES (1,1,'服装专区'),(2,5,'洗发护发'),(3,5,'身体护理'),(4,1,'美妆专区'),(5,1,'数码家电'),(6,4,'精品推荐'),(7,5,'女性护理'),(8,5,'口腔护理'),(9,5,'面部护肤'),(10,5,'礼品套装'),(11,4,'手机配件'),(12,4,'数码配件'),(13,3,'运动服饰'),(14,3,'精品推荐'),(15,4,'新商品'),(17,210,'新商品模块'),(18,229,'新商品模块'),(19,245,'测试');
/*!40000 ALTER TABLE `Himall_ShopHomeModules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShopVistis`
--

DROP TABLE IF EXISTS `Himall_ShopVistis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShopVistis` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `Date` datetime NOT NULL COMMENT '日期',
  `VistiCounts` bigint(20) NOT NULL COMMENT '浏览量',
  `SaleCounts` bigint(20) NOT NULL COMMENT '销售量',
  `SaleAmounts` decimal(18,2) NOT NULL COMMENT '销售额',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=utf8 COMMENT='店铺浏览量记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShopVistis`
--

LOCK TABLES `Himall_ShopVistis` WRITE;
/*!40000 ALTER TABLE `Himall_ShopVistis` DISABLE KEYS */;
INSERT INTO `Himall_ShopVistis` VALUES (551,1,'2015-10-08 00:00:00',44,1,45.00),(552,210,'2015-10-08 00:00:00',3,0,0.00),(553,1,'2015-10-09 00:00:00',46,2,20.01),(554,210,'2015-10-09 00:00:00',5,0,0.00),(555,215,'2015-10-09 00:00:00',14,0,0.00),(556,1,'2015-10-10 03:34:48',79,2,0.02),(557,210,'2015-10-10 04:01:47',9,0,0.00),(558,215,'2015-10-10 00:00:00',20,0,0.00),(559,1,'2015-10-11 00:00:00',29,0,0.00),(560,215,'2015-10-11 00:00:00',3,0,0.00),(561,210,'2015-10-11 00:00:00',5,0,0.00),(562,236,'2015-10-11 22:41:27',1,0,0.00),(563,215,'2015-10-12 00:00:00',23,0,0.00),(564,1,'2015-10-12 08:51:52',85,3,45.02),(565,238,'2015-10-12 10:32:22',4,0,0.00),(566,210,'2015-10-12 00:00:00',6,1,190.00),(567,233,'2015-10-12 17:52:15',1,0,0.00),(568,1,'2015-10-13 00:00:00',119,2,159.01),(569,215,'2015-10-13 00:00:00',7,0,0.00),(570,210,'2015-10-13 00:00:00',19,0,0.00),(571,242,'2015-10-13 13:48:39',1,0,0.00),(572,237,'2015-10-13 14:07:32',3,0,0.00),(573,245,'2015-10-13 00:00:00',9,0,0.00),(574,236,'2015-10-13 15:32:46',2,0,0.00),(575,238,'2015-10-13 18:02:40',4,0,0.00),(576,1,'2015-10-14 02:48:15',78,3,60.02),(577,232,'2015-10-14 02:50:04',1,0,0.00),(578,235,'2015-10-14 02:50:14',2,0,0.00),(579,238,'2015-10-14 09:50:14',2,0,0.00),(580,247,'2015-10-14 09:51:40',39,2,0.02),(581,215,'2015-10-14 00:00:00',41,0,0.00),(582,237,'2015-10-14 12:30:50',1,0,0.00),(583,210,'2015-10-14 00:00:00',6,0,0.00),(584,249,'2015-10-14 17:06:04',1,0,0.00);
/*!40000 ALTER TABLE `Himall_ShopVistis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_ShoppingCarts`
--

DROP TABLE IF EXISTS `Himall_ShoppingCarts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_ShoppingCarts` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `ProductId` bigint(20) NOT NULL COMMENT '商品ID',
  `SkuId` varchar(100) DEFAULT NULL COMMENT 'SKUID',
  `Quantity` bigint(20) NOT NULL COMMENT '购买数量',
  `AddTime` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`),
  KEY `FK_Member_ShoppingCart` (`UserId`) USING BTREE,
  KEY `FK_Product_ShoppingCart` (`ProductId`) USING BTREE,
  CONSTRAINT `himall_shoppingcarts_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Himall_Members` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_shoppingcarts_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Himall_Products` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=788 DEFAULT CHARSET=utf8 COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_ShoppingCarts`
--

LOCK TABLES `Himall_ShoppingCarts` WRITE;
/*!40000 ALTER TABLE `Himall_ShoppingCarts` DISABLE KEYS */;
INSERT INTO `Himall_ShoppingCarts` VALUES (782,581,302,'302_245_0_40',1,'2015-10-12 17:45:01'),(787,603,246,'246_7_11_0',1,'2015-10-14 16:28:04');
/*!40000 ALTER TABLE `Himall_ShoppingCarts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Shops`
--

DROP TABLE IF EXISTS `Himall_Shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Shops` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `GradeId` bigint(20) NOT NULL COMMENT '店铺等级',
  `ShopName` varchar(100) NOT NULL COMMENT '店铺名称',
  `Logo` varchar(100) DEFAULT NULL COMMENT '店铺LOGO路径',
  `SubDomains` varchar(100) DEFAULT NULL COMMENT '预留子域名，未使用',
  `Theme` varchar(100) DEFAULT NULL COMMENT '预留主题，未使用',
  `IsSelf` tinyint(1) NOT NULL COMMENT '是否是官方自营店',
  `ShopStatus` int(11) NOT NULL COMMENT '店铺状态',
  `RefuseReason` varchar(1000) DEFAULT NULL COMMENT '审核拒绝原因',
  `CreateDate` datetime NOT NULL COMMENT '店铺创建日期',
  `EndDate` datetime DEFAULT NULL COMMENT '店铺过期日期',
  `CompanyName` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `CompanyRegionId` int(11) NOT NULL COMMENT '公司省市区',
  `CompanyAddress` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `CompanyPhone` varchar(100) DEFAULT NULL COMMENT '公司电话',
  `CompanyEmployeeCount` int(11) NOT NULL COMMENT '公司员工数量',
  `CompanyRegisteredCapital` decimal(8,2) NOT NULL COMMENT '公司经营范围',
  `ContactsName` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `ContactsPhone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `ContactsEmail` varchar(100) DEFAULT NULL COMMENT '联系Email',
  `BusinessLicenceNumber` varchar(100) DEFAULT NULL COMMENT '营业执照号',
  `BusinessLicenceNumberPhoto` varchar(100) NOT NULL COMMENT '营业执照',
  `BusinessLicenceRegionId` int(11) NOT NULL COMMENT '营业执照所在地',
  `BusinessLicenceStart` datetime DEFAULT NULL COMMENT '营业执照有效期开始',
  `BusinessLicenceEnd` datetime DEFAULT NULL COMMENT '营业执照有效期',
  `BusinessSphere` varchar(100) DEFAULT NULL COMMENT '法定经营范围',
  `OrganizationCode` varchar(100) DEFAULT NULL COMMENT '组织机构代码',
  `OrganizationCodePhoto` varchar(100) DEFAULT NULL COMMENT '组织机构执照',
  `GeneralTaxpayerPhot` varchar(100) DEFAULT NULL COMMENT '一般纳税人证明',
  `BankAccountName` varchar(100) DEFAULT NULL COMMENT '银行开户名',
  `BankAccountNumber` varchar(100) DEFAULT NULL COMMENT '公司银行账号',
  `BankName` varchar(100) DEFAULT NULL COMMENT '开户银行支行名称',
  `BankCode` varchar(100) DEFAULT NULL COMMENT '支行联行号',
  `BankRegionId` int(11) NOT NULL COMMENT '开户银行所在地',
  `BankPhoto` varchar(100) DEFAULT NULL,
  `TaxRegistrationCertificate` varchar(100) DEFAULT NULL COMMENT '税务登记证',
  `TaxpayerId` varchar(100) DEFAULT NULL COMMENT '税务登记证号',
  `TaxRegistrationCertificatePhoto` varchar(100) DEFAULT NULL COMMENT '纳税人识别号',
  `PayPhoto` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `PayRemark` varchar(1000) DEFAULT NULL COMMENT '支付注释',
  `SenderName` varchar(100) DEFAULT NULL COMMENT '商家发货人名称',
  `SenderAddress` varchar(100) DEFAULT NULL COMMENT '商家发货人地址',
  `SenderPhone` varchar(100) DEFAULT NULL COMMENT '商家发货人电话',
  `Freight` decimal(18,2) NOT NULL COMMENT '运费',
  `FreeFreight` decimal(18,2) NOT NULL COMMENT '多少钱开始免运费',
  `Stage` int(11) DEFAULT '0' COMMENT '注册步骤',
  `SenderRegionId` int(11) DEFAULT NULL COMMENT '商家发货人省市区',
  `BusinessLicenseCert` varchar(120) DEFAULT NULL COMMENT '营业执照证书',
  `ProductCert` varchar(120) DEFAULT NULL COMMENT '商品证书',
  `OtherCert` varchar(120) DEFAULT NULL COMMENT '其他证书',
  `legalPerson` varchar(50) DEFAULT NULL COMMENT '法人代表',
  `CompanyFoundingDate` datetime DEFAULT NULL COMMENT '公司成立日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Shops`
--

LOCK TABLES `Himall_Shops` WRITE;
/*!40000 ALTER TABLE `Himall_Shops` DISABLE KEYS */;
INSERT INTO `Himall_Shops` VALUES (1,1,'官方自营店','/Storage/Shop/1/ImageAd/logo.jpg',NULL,NULL,1,7,NULL,'2014-10-30 00:00:00','2115-10-08 15:31:43','海商网络科技',1963,'文化大厦','876588888',1,1.00,'杨先生','13988887748','Yang@hishop.com','966587458','1',102,'2014-05-05 00:00:00','2014-12-12 00:00:00','1','66548726','1','1','杨先生','6228445888796651200','中国银行','44698',101,'1','1','33695','1','1','1','1','1','1',11.00,11.00,5,102,'/Storage/Shop/1/Cert/BusinessLicenseCert','/Storage/Shop/1/Cert/ProductCert','/Storage/Shop/1/Cert/OtherCert',NULL,NULL),(210,1,'扣扣电脑城Update','/Storage/Shop/210/ImageAd/logo.jpg',NULL,NULL,0,7,NULL,'2015-06-30 19:04:21','2016-08-12 00:00:00','扣扣城公司名称66',955,'某某美的瞬间单数据库防守打法三大-_789','111111',3,1.00,'唐玲玲','8322264','15556784@qq.com','345345','/Storage/Shop/210/Cert/BusinessLicenceNumberPhoto1.png',646,'2015-06-16 00:00:00','2015-07-10 00:00:00','电脑,内存,笔记本,鼠标,台式机','234234324','/Storage/Shop/210/Cert/OrganizationCodePhoto1.png','/Storage/Shop/210/Cert/GeneralTaxpayerPhoto1.png','5432543','345345','534','34534',645,'/Storage/Shop/210/Cert/BankPhoto1.png','454534','34534','/Storage/Shop/210/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/210/Cert/PayPhoto1.png','543534','546546','54try突然','18711052244',0.00,39.00,5,266,'/Storage/Shop/210/Cert/BusinessLicenseCert','/Storage/Shop/210/Cert/ProductCert','/Storage/Shop/210/Cert/OtherCert','代表人','2015-06-23 00:00:00'),(211,1,'微盟旗舰店',NULL,NULL,NULL,0,1,NULL,'2015-06-30 18:57:28','2015-07-13 00:00:00','微盟旗舰店',2088,'东洋区','13562351020',4,0.00,'小王','13562310231','1212@163.com','54132131313','/Storage/Shop/211/Cert/BusinessLicenceNumberPhoto1.png',2088,'2015-06-25 00:00:00','2015-06-30 00:00:00','服装','5113213213','/Storage/Shop/211/Cert/OrganizationCodePhoto1.png','/Storage/Shop/211/Cert/GeneralTaxpayerPhoto1.png','小王','建设银行','分行','420122',1843,'/Storage/Shop/211/Cert/BankPhoto1.png','4513131313','35131311331','/Storage/Shop/211/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/211/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/211/Cert/BusinessLicenseCert','/Storage/Shop/211/Cert/ProductCert','/Storage/Shop/211/Cert/OtherCert','小王','2015-06-26 00:00:00'),(215,1,'糖糖的店铺','/Storage/Shop/215/ImageAd/logo.jpg',NULL,NULL,0,7,'fdsds fdsfsd fsdf sdf ','2015-07-03 14:38:22','2016-07-03 14:38:22','25公司3',280,'第三方斯蒂芬斯蒂芬s\'d','8322264',1,1.00,'第三附属','18711052244','15556784@qq.com','7678','/Storage/Shop/215/Cert/BusinessLicenceNumberPhoto1.png',718,'2015-07-01 00:00:00','2015-08-08 00:00:00','5435345345345','45645','/Storage/Shop/215/Cert/OrganizationCodePhoto1.png','/Storage/Shop/215/Cert/GeneralTaxpayerPhoto1.png','6546','64564','456','645',1382,'/Storage/Shop/215/Cert/BankPhoto1.png','5465464','6456456','/Storage/Shop/215/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/215/Cert/PayPhoto1.png','453453',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/215/Cert/BusinessLicenseCert','/Storage/Shop/215/Cert/ProductCert','/Storage/Shop/215/Cert/OtherCert','ret ','2015-07-01 00:00:00'),(223,1,'伟亿','/Storage/Shop/223/ImageAd/logo.bmp',NULL,NULL,0,7,NULL,'2015-07-08 15:57:07','2016-07-08 15:57:07','伟亿建材店',253,'秦淮河畔','81589638',4,80.00,'伟亿','13202865893','weiyi@gmail.com','25593145','/Storage/Shop/223/Cert/BusinessLicenceNumberPhoto1.png',255,'2015-01-16 00:00:00','2016-01-16 00:00:00','建材','5452452','/Storage/Shop/223/Cert/OrganizationCodePhoto1.png','/Storage/Shop/223/Cert/GeneralTaxpayerPhoto1.png','伟亿','641210245','建行','61221354',278,'/Storage/Shop/223/Cert/BankPhoto1.png','55432523','53423','/Storage/Shop/223/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/223/Cert/PayPhoto1.png','','jiangli','韶山北路湖南文化大厦1905','13203115656',0.00,0.00,5,728,'/Storage/Shop/223/Cert/BusinessLicenseCert','/Storage/Shop/223/Cert/ProductCert','/Storage/Shop/223/Cert/OtherCert','伟亿','2015-03-13 00:00:00'),(229,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-09 09:16:25',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(230,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-09 14:54:41',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(231,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-10 13:19:59',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(232,1,'zara专卖',NULL,NULL,NULL,0,7,NULL,'2015-10-10 15:26:38','2016-10-10 15:26:38','asdfa',216,'asdf','123',1,0.00,'123','123','zlsq1989@126.com','123','/Storage/Shop/232/Cert/BusinessLicenceNumberPhoto1.png',1843,'2015-10-01 00:00:00','2016-09-10 00:00:00','12323','1231','/Storage/Shop/232/Cert/OrganizationCodePhoto1.png','/Storage/Shop/232/Cert/GeneralTaxpayerPhoto1.png','123','123','123','123',215,'/Storage/Shop/232/Cert/BankPhoto1.png','123','123','/Storage/Shop/232/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/232/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/232/Cert/BusinessLicenseCert','/Storage/Shop/232/Cert/ProductCert','/Storage/Shop/232/Cert/OtherCert','123','2015-10-31 00:00:00'),(233,1,'123',NULL,NULL,NULL,0,7,NULL,'2015-10-10 15:29:48','2016-10-10 15:29:48','12312',102,'123','123',2,123.00,'123','123','123@12.com','123','/Storage/Shop/233/Cert/BusinessLicenceNumberPhoto1.png',2114,'2015-10-10 00:00:00','2016-04-17 00:00:00','123','123','/Storage/Shop/233/Cert/OrganizationCodePhoto1.png','/Storage/Shop/233/Cert/GeneralTaxpayerPhoto1.png','123','123','123','123',215,'/Storage/Shop/233/Cert/BankPhoto1.png','123','1233','/Storage/Shop/233/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/233/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/233/Cert/BusinessLicenseCert','/Storage/Shop/233/Cert/ProductCert','/Storage/Shop/233/Cert/OtherCert','123','1899-12-14 00:00:00'),(234,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-10 15:29:04',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(235,2,'Life Style',NULL,NULL,NULL,0,7,NULL,'2015-10-10 15:37:42','2016-10-10 15:37:42','123123123',102,'123123','123123123',1,123.00,'123123','123123','123123@1231231.com','123','/Storage/Shop/235/Cert/BusinessLicenceNumberPhoto1.png',119,'2015-10-10 00:00:00','2016-04-07 00:00:00','12312312','12312323','/Storage/Shop/235/Cert/OrganizationCodePhoto1.png','/Storage/Shop/235/Cert/GeneralTaxpayerPhoto1.png','123123','123123','12312313','123123123',215,'/Storage/Shop/235/Cert/BankPhoto1.png','123123','123123','/Storage/Shop/235/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/235/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/235/Cert/BusinessLicenseCert','/Storage/Shop/235/Cert/ProductCert','/Storage/Shop/235/Cert/OtherCert','123123','1899-12-14 00:00:00'),(236,1,'fex电子数码芙蓉店',NULL,NULL,NULL,0,7,NULL,'2015-10-10 15:47:02','2016-10-10 15:47:02','123123',102,'1231','31231231',1,123.00,'12312312','1231231','123123@1231.com','123','/Storage/Shop/236/Cert/BusinessLicenceNumberPhoto1.png',218,'2015-10-03 00:00:00','2016-03-13 00:00:00','1231231','123123','/Storage/Shop/236/Cert/OrganizationCodePhoto1.png','/Storage/Shop/236/Cert/GeneralTaxpayerPhoto1.png','123123','123123','123123','123123',265,'/Storage/Shop/236/Cert/BankPhoto1.png','123','123','/Storage/Shop/236/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/236/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/236/Cert/BusinessLicenseCert','/Storage/Shop/236/Cert/ProductCert','/Storage/Shop/236/Cert/OtherCert','123123','2016-02-07 00:00:00'),(237,1,'西城电子',NULL,NULL,NULL,0,7,NULL,'2015-10-10 15:53:07','2016-10-10 15:53:07','1231231',215,'123123','1231231',1,123.00,'1231231','123123','123123@123.com','1231','/Storage/Shop/237/Cert/BusinessLicenceNumberPhoto1.png',388,'1899-12-08 00:00:00','1899-12-20 00:00:00','1231231231','123','/Storage/Shop/237/Cert/OrganizationCodePhoto1.png','/Storage/Shop/237/Cert/GeneralTaxpayerPhoto1.png','123','123','123','123',215,'/Storage/Shop/237/Cert/BankPhoto1.png','1231','123','/Storage/Shop/237/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/237/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/237/Cert/BusinessLicenseCert','/Storage/Shop/237/Cert/ProductCert','/Storage/Shop/237/Cert/OtherCert','123123','1899-12-07 00:00:00'),(238,2,'步走寻常路',NULL,NULL,NULL,0,7,NULL,'2015-10-10 16:00:08','2016-10-10 16:00:08','12312312',131,'123123','1231231',1,0.00,'1231','123','123@12.聪明','1231231','/Storage/Shop/238/Cert/BusinessLicenceNumberPhoto1.png',216,'1899-12-15 00:00:00','1899-12-20 00:00:00','4214','1231','/Storage/Shop/238/Cert/OrganizationCodePhoto1.png','/Storage/Shop/238/Cert/GeneralTaxpayerPhoto1.png','12312','123','123','123',215,'/Storage/Shop/238/Cert/BankPhoto1.png','123124','1231','/Storage/Shop/238/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/238/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/238/Cert/BusinessLicenseCert','/Storage/Shop/238/Cert/ProductCert','/Storage/Shop/238/Cert/OtherCert','123','2015-10-22 00:00:00'),(239,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-10 22:34:25',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(240,2,'小肖的店铺',NULL,NULL,NULL,0,7,NULL,'2015-10-11 14:54:24','2016-10-11 14:54:24','奥科电子科技',1664,'麓谷高新区','073188878888',7,100.00,'肖','18607310745','11@qq.com','23423423','/Storage/Shop/240/Cert/BusinessLicenceNumberPhoto1.png',238,'2015-10-11 00:00:00','2015-10-30 00:00:00','fsdfsdf','123124141414','/Storage/Shop/240/Cert/OrganizationCodePhoto1.png','/Storage/Shop/240/Cert/GeneralTaxpayerPhoto1.png','长沙银行','2143141414','长沙银行','124141',1664,'/Storage/Shop/240/Cert/BankPhoto1.png','123124','1241414','/Storage/Shop/240/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/240/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/240/Cert/BusinessLicenseCert','/Storage/Shop/240/Cert/ProductCert','/Storage/Shop/240/Cert/OtherCert','x肖','2015-10-23 00:00:00'),(241,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-11 16:48:20',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(242,1,'asdfasdfasd',NULL,NULL,NULL,0,3,NULL,'2015-10-13 15:31:55',NULL,'werqwer',216,'qwerqwerqwe','12341234123',2,0.00,'rfdf','32141234123','qefasdf@sef.fg','23452345234523','/Storage/Shop/242/Cert/BusinessLicenceNumberPhoto1.png',2215,'2015-10-08 00:00:00','2015-10-24 00:00:00','dfgsdfgsfg','234523452342','/Storage/Shop/242/Cert/OrganizationCodePhoto1.png','/Storage/Shop/242/Cert/GeneralTaxpayerPhoto1.png','asfasdfas','asdfasdfasdf','asdfasdf','asdfasdf',217,'/Storage/Shop/242/Cert/BankPhoto1.png','asdfasdf','asdfasdf','/Storage/Shop/242/Cert/TaxRegistrationCertificatePhoto1.png',NULL,NULL,NULL,NULL,NULL,0.00,0.00,4,NULL,'/Storage/Shop/242/Cert/BusinessLicenseCert','/Storage/Shop/242/Cert/ProductCert','/Storage/Shop/242/Cert/OtherCert','qwerfasdf','2015-10-01 00:00:00'),(243,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-12 10:35:16',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(244,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-12 17:50:45',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(245,1,'测试33','/Storage/Shop/245/ImageAd/logo.png',NULL,NULL,0,7,NULL,'2015-10-13 15:06:58','2016-10-13 15:06:58','测试3333',102,'测试','13000000000',1,50.00,'测试','13000000000','415154466@qq.com','45113131311','/Storage/Shop/245/Cert/BusinessLicenceNumberPhoto1.png',102,'2015-09-01 00:00:00','2016-01-09 00:00:00','656566','125131313131','/Storage/Shop/245/Cert/OrganizationCodePhoto1.png','/Storage/Shop/245/Cert/GeneralTaxpayerPhoto1.png','测试','76136166166445','测试信息','456644646564',102,'/Storage/Shop/245/Cert/BankPhoto1.png','789987798','797987987979','/Storage/Shop/245/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/245/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/245/Cert/BusinessLicenseCert','/Storage/Shop/245/Cert/ProductCert','/Storage/Shop/245/Cert/OtherCert','测试','2015-09-01 00:00:00'),(246,0,'',NULL,NULL,NULL,0,1,NULL,'2015-10-13 16:50:53',NULL,NULL,0,NULL,NULL,1,0.00,NULL,NULL,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,1,NULL,NULL,NULL,NULL,NULL,NULL),(247,1,'数码旗舰店','/Storage/Shop/247/ImageAd/logo.jpg',NULL,NULL,0,7,NULL,'2015-10-14 09:36:11','2016-10-14 09:36:11','长沙海商网络技术',1667,'湖南文化大厦','13560134563',7,1000.00,'小王','13567890987','1960187469@qq.com','8988777777','/Storage/Shop/247/Cert/BusinessLicenceNumberPhoto1.png',117,'2015-10-14 00:00:00','2015-10-28 00:00:00','数码','121333323','/Storage/Shop/247/Cert/OrganizationCodePhoto1.png','/Storage/Shop/247/Cert/GeneralTaxpayerPhoto1.png','小王','62608748642737247','中国建设银行','12131323',1664,'/Storage/Shop/247/Cert/BankPhoto1.png','12133123','3324324','/Storage/Shop/247/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/247/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/247/Cert/BusinessLicenseCert','/Storage/Shop/247/Cert/ProductCert','/Storage/Shop/247/Cert/OtherCert','汪总','2015-10-14 00:00:00'),(248,1,'111',NULL,NULL,NULL,0,7,NULL,'2015-10-14 16:58:14','2016-10-14 16:58:14','湖南宝庆兄弟贸易有限公司',1664,'湖南长沙','0731-8832222',3,22.00,'刘聪明','13432334544','6926419@qq.com','1212121','/Storage/Shop/248/Cert/BusinessLicenceNumberPhoto1.png',1664,'2015-10-07 00:00:00','2015-10-14 00:00:00','医疗器械','231312','/Storage/Shop/248/Cert/OrganizationCodePhoto1.png','/Storage/Shop/248/Cert/GeneralTaxpayerPhoto1.png','2121','12','1','2',1707,'/Storage/Shop/248/Cert/BankPhoto1.png','121','121','/Storage/Shop/248/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/248/Cert/PayPhoto1.png','eeeeeeeeeee',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/248/Cert/BusinessLicenseCert','/Storage/Shop/248/Cert/ProductCert','/Storage/Shop/248/Cert/OtherCert','刘聪明','2015-10-01 00:00:00'),(249,2,'123123123',NULL,NULL,NULL,0,7,NULL,'2015-10-14 17:07:04','2016-10-14 17:07:04','111111111',2883,'5649878','1234567',2,100.00,'111','111','123355@qq.com','11654654','/Storage/Shop/249/Cert/BusinessLicenceNumberPhoto1.png',3304,'2015-10-14 00:00:00','2015-10-14 00:00:00',' 飞阿伟父亲违法潍坊','56465456','/Storage/Shop/249/Cert/OrganizationCodePhoto1.png','/Storage/Shop/249/Cert/GeneralTaxpayerPhoto1.png','3我认为二位二',' 发送到发顺丰 ','1111','1111',3057,'/Storage/Shop/249/Cert/BankPhoto1.png','11111111111','11111111111','/Storage/Shop/249/Cert/TaxRegistrationCertificatePhoto1.png','/Storage/Shop/249/Cert/PayPhoto1.png','',NULL,NULL,NULL,0.00,0.00,5,NULL,'/Storage/Shop/249/Cert/BusinessLicenseCert','/Storage/Shop/249/Cert/ProductCert','/Storage/Shop/249/Cert/OtherCert','111','2015-09-28 00:00:00');
/*!40000 ALTER TABLE `Himall_Shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_SiteSettings`
--

DROP TABLE IF EXISTS `Himall_SiteSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_SiteSettings` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(4000) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_SiteSettings`
--

LOCK TABLES `Himall_SiteSettings` WRITE;
/*!40000 ALTER TABLE `Himall_SiteSettings` DISABLE KEYS */;
INSERT INTO `Himall_SiteSettings` VALUES (1,'Logo','/Storage/Plat/Site/logo.png'),(2,'SiteName','HiMall'),(3,'ICPNubmer',' '),(4,'CustomerTel',' '),(6,'Keyword','手机'),(7,'Hotkeywords','男装,海飞丝,女装,ABC,手机,Nikon,包包,鞋子'),(8,'PageFoot',' '),(9,'UserCookieKey','d1b31e1b3176cf3aa8993428061c8af2'),(10,'MemberLogo','/Storage/Plat/Site/memberLogo.png'),(11,'QRCode','/Storage/Plat/Site/qrCode.png'),(12,'FlowScript','FlowScript1'),(13,'Site_SEOTitle','HiMall'),(14,'Site_SEOKeywords','HiMall,test'),(15,'Site_SEODescription','Site_SEODescription1'),(16,'ProdutAuditOnOff','1'),(54,'SiteIsClose','False'),(55,'MobileVerifOpen','False'),(56,'WXLogo','/Storage/Plat/Site/wxlogo.png'),(57,'WeixinAppId','wx007e3e45af8e55dd'),(58,'WeixinAppSecret','7790007b8b80030518b18679827b0b62'),(59,'WeixinToken','3252EE2CB7D67B51'),(60,'WeixinPartnerID',''),(61,'WeixinPartnerKey',''),(62,'WeixinLoginUrl',''),(63,'WeixinIsValidationService','False'),(64,'SellerAdminAgreement',''),(65,'AdvancePaymentPercent','0'),(66,'AdvancePaymentLimit','0'),(67,'WeekSettlement','7'),(68,'UnpaidTimeout','2'),(69,'NoReceivingTimeout','6'),(70,'SalesReturnTimeout','10'),(71,'WX_MSGGetCouponTemplateId','tFs-V2zJzDbRMCwjF0JUELKHTJrQ4AcwECIi1METfiw');
/*!40000 ALTER TABLE `Himall_SiteSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_SlideAds`
--

DROP TABLE IF EXISTS `Himall_SlideAds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_SlideAds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID，0：平台轮播图  ',
  `ImageUrl` varchar(100) NOT NULL COMMENT '图片保存URL',
  `Url` varchar(1000) NOT NULL COMMENT '图片跳转URL',
  `DisplaySequence` bigint(20) NOT NULL,
  `TypeId` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='商城、店铺首页， 还有微信首页 的自动轮播图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_SlideAds`
--

LOCK TABLES `Himall_SlideAds` WRITE;
/*!40000 ALTER TABLE `Himall_SlideAds` DISABLE KEYS */;
INSERT INTO `Himall_SlideAds` VALUES (1,0,'/Storage/Plat/ImageAd/201411271919471017064.jpg','/',2,0,NULL),(2,0,'/Storage/Plat/ImageAd/201411271919575803729.jpg','/',3,0,NULL),(3,0,'/Storage/Plat/ImageAd/201411271920042657851.jpg','/',4,0,NULL),(6,0,'/Storage/Plat/ImageAd/201411271921554438454.jpg','/',5,0,NULL),(7,0,'/Storage/Plat/ImageAd/201411271921325857372.jpg','/',6,0,NULL),(8,0,'/Storage/Plat/ImageAd/201411281521485989739.jpg','/',1,0,NULL),(9,1,'/Storage/Shop/1/ImageAd/201411281706243546729.jpg','http://himall.kuaidiantong.cn/Product/Detail/261',1,0,NULL),(11,1,'/Storage/Shop/1/ImageAd/201411281524168837472.jpg','http://himall.kuaidiantong.cn/Product/Detail/252',2,0,NULL),(12,1,'/Storage/Shop/1/ImageAd/201411281524222547796.jpg','http://himall.kuaidiantong.cn/Product/Detail/252',3,0,NULL),(35,0,'/Storage/Plat/ImageAd/201507141119399945120.jpg','http://192.168.10.69:8080/',8,1,NULL),(36,0,'/Storage/Plat/ImageAd/201507141119448330760.jpg','http://192.168.10.69:8080/',7,1,NULL),(39,0,'/Storage/Plat/ImageAd/201507201703528252150.png','/',10,2,NULL),(40,210,'/Storage/Shop/210/VShop/201507201025240381540.jpg','www.baidu.com',1,4,NULL),(46,1,'/Storage/Shop/1/ImageAd/201507201719502739060.png','/',4,3,NULL),(54,0,'/Storage/Plat/ImageAd/201507201704236735080.png','http://192.168.10.69:8080/admin',9,2,NULL),(55,0,'/Storage/Plat/ImageAd/201507141131496329640.jpg','/',11,1,NULL),(56,0,'/Storage/Plat/ImageAd/201507141131568217760.jpg','/',12,1,NULL),(62,210,'/Storage/Shop/210/ImageAd/201507171805014212960.png','www.baidu.com',3,3,NULL),(63,210,'/Storage/Shop/210/ImageAd/201507171804190800060.jpg','www.baidu.com',2,3,NULL),(65,215,'/Storage/Shop/215/VShop/201507201132371366020.jpg','',1,4,NULL),(66,0,'/Storage/Plat/Weixin/SlidAd/201507201010342543840.jpg','/m-weixin/topic/detail/31?isMobileHomeTopic=false',13,5,''),(67,0,'/Storage/Plat/Weixin/SlidAd/201507201122019605400.jpg','/m-weixin/topic/detail/38?isMobileHomeTopic=false',14,5,''),(68,0,'/Storage/Plat/Weixin/SlidAd/201507201018077197710.jpg','/m-weixin/topic/detail/35?isMobileHomeTopic=false',15,5,''),(71,215,'/Storage/Shop/215/VShop/201507201133057047610.jpg','',2,4,NULL),(72,0,'/Storage/Plat/ImageAd/201507201704373952460.png','/',16,2,NULL),(73,1,'/Storage/Shop/1/ImageAd/201507201721139778270.png','/',5,3,NULL),(77,245,'/Storage/Shop/245/ImageAd/201510131514187360860.JPG','/',1,3,NULL),(78,1,'/Storage/Shop/1/VShop/201510131537568348800.jpg','',6,4,NULL),(79,0,'/Storage/Plat/APP/SlidAd/201510131547192832350.png','http://demo.himall.kuaidiantong.cn',17,8,'的丰富辅导费的'),(80,0,'/Storage/Plat/APP/SlidAd/201510131548027858820.jpg','http://demo.himall.kuaidiantong.cn',18,8,'第三方'),(81,245,'/Storage/Shop/245/VShop/201510131628063474550.jpg','',4,4,NULL),(82,245,'/Storage/Shop/245/VShop/201510131628292018480.png','',2,4,NULL),(83,245,'/Storage/Shop/245/VShop/201510131630536429130.png','',3,4,NULL),(84,245,'/Storage/Shop/245/VShop/201510131636160191300.png','',5,4,NULL),(85,245,'/Storage/Shop/245/VShop/201510131636215173880.png','',6,4,NULL);
/*!40000 ALTER TABLE `Himall_SlideAds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_SpecificationValues`
--

DROP TABLE IF EXISTS `Himall_SpecificationValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_SpecificationValues` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Specification` int(11) NOT NULL COMMENT '规格名',
  `TypeId` bigint(20) NOT NULL COMMENT '类型ID',
  `Value` varchar(100) NOT NULL COMMENT '规格值',
  PRIMARY KEY (`Id`),
  KEY `FK_Type_SpecificationValue` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_specificationvalues_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `Himall_Types` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8 COMMENT='规格值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_SpecificationValues`
--

LOCK TABLES `Himall_SpecificationValues` WRITE;
/*!40000 ALTER TABLE `Himall_SpecificationValues` DISABLE KEYS */;
INSERT INTO `Himall_SpecificationValues` VALUES (1,1,19,'天蓝色'),(2,1,19,'枚红色'),(3,1,19,'宝蓝色'),(4,1,19,'卡其色'),(5,1,19,'蝴蝶结'),(6,1,20,'蓝白'),(7,1,20,'红白'),(8,1,20,'黑白'),(9,1,20,'绿黑'),(10,1,20,'白紫'),(11,2,20,'120'),(12,2,20,'130'),(13,2,20,'140'),(14,2,20,'150'),(15,1,21,'卡其'),(16,1,21,'军绿'),(17,2,21,'M'),(18,2,21,'L'),(19,2,21,'XL'),(20,2,21,'XXL'),(21,1,3,'琥珀色'),(22,1,3,'白色'),(23,1,3,'绿色'),(24,1,3,'棕花色'),(25,2,3,'S'),(26,2,3,'M'),(27,2,3,'L'),(28,1,17,'土黄色'),(29,1,17,'蓝色'),(30,1,17,'米色'),(31,1,17,'棕色'),(32,1,17,'白色'),(33,1,17,'黑色'),(34,1,17,'红色'),(35,2,17,'38'),(36,2,17,'39'),(37,2,17,'40'),(38,2,17,'41'),(39,2,17,'37'),(40,3,13,'官方标配'),(41,3,13,'套餐一'),(42,3,13,'套餐二'),(57,1,12,'银色'),(58,1,12,'黑色'),(59,1,12,'金色'),(60,1,12,'灰色'),(61,1,12,'白色'),(62,1,12,'红色'),(63,3,12,'非合约机'),(64,3,12,'合约机'),(65,1,13,'红色'),(66,1,13,'白色'),(67,1,13,'灰色'),(68,3,24,'套餐2'),(69,3,24,'套餐1'),(70,3,24,'标配'),(71,1,24,'银灰色'),(72,1,24,'白色'),(73,2,25,'10.1寸'),(74,2,25,'12寸'),(75,2,25,'14寸'),(76,3,25,'i3 CPU'),(77,3,25,'i5 CPU/独显'),(78,3,25,'i7 CPU/独显'),(79,1,5,'红色'),(80,1,5,'绿色'),(81,1,5,'白色'),(82,1,5,'粉色'),(83,1,5,'蓝色'),(84,1,5,'黄色'),(85,1,5,'橙色'),(86,1,26,'紫色'),(87,1,26,'红色'),(88,1,26,'绿色'),(89,1,26,'花色'),(90,1,26,'蓝色'),(91,1,26,'褐色'),(92,1,26,'透明'),(93,1,26,'酒红色'),(94,1,26,'黄色'),(95,1,26,'黑色'),(96,1,26,'深灰色'),(97,1,26,'深紫色'),(98,1,26,'深蓝色'),(99,3,26,'1米'),(100,3,26,'1.2米'),(101,3,26,'1.5米'),(102,1,27,'紫色'),(103,1,27,'红色'),(104,1,27,'绿色'),(105,1,27,'花色'),(106,1,27,'蓝色'),(107,1,27,'褐色'),(108,1,27,'透明'),(109,1,27,'酒红色'),(110,1,27,'黄色'),(111,1,27,'黑色'),(112,1,27,'深灰色'),(113,1,27,'深紫色'),(114,1,27,'深蓝色'),(115,1,28,'紫色'),(116,1,28,'红色'),(117,1,28,'绿色'),(118,1,28,'花色'),(119,1,28,'蓝色'),(120,1,28,'褐色'),(121,1,28,'透明'),(122,1,28,'酒红色'),(123,1,28,'黄色'),(124,1,28,'黑色'),(125,1,28,'深灰色'),(126,1,28,'深紫色'),(127,1,28,'深蓝色'),(128,2,21,'S'),(129,1,21,'黑色'),(130,1,21,'灰色'),(131,1,21,'白色'),(132,1,1,'白'),(133,1,1,'灰'),(134,1,1,'黑'),(135,1,1,'蓝'),(136,1,29,'紫色'),(137,1,29,'红色'),(138,1,29,'绿色'),(139,1,29,'花色'),(140,1,29,'蓝色'),(141,1,29,'褐色'),(142,1,29,'透明'),(143,1,29,'酒红色'),(144,1,29,'黄色'),(145,1,29,'黑色'),(146,1,29,'深灰色'),(147,1,29,'深紫色'),(148,1,29,'深蓝色'),(149,1,16,'白色'),(150,1,16,'红色'),(151,1,30,'紫色'),(152,1,30,'红色'),(153,1,30,'绿色'),(154,1,30,'花色'),(155,1,30,'蓝色'),(156,1,30,'褐色'),(157,1,30,'透明'),(158,1,30,'酒红色'),(159,1,30,'黄色'),(160,1,30,'黑色'),(161,1,30,'深灰色'),(162,1,30,'深紫色'),(163,1,30,'深蓝色'),(164,1,31,'紫色'),(165,1,31,'红色'),(166,1,31,'绿色'),(167,1,31,'花色'),(168,1,31,'蓝色'),(169,1,31,'褐色'),(170,1,31,'透明'),(171,1,31,'酒红色'),(172,1,31,'黄色'),(173,1,31,'黑色'),(174,1,31,'深灰色'),(175,1,31,'深紫色'),(176,1,31,'深蓝色'),(177,1,32,'紫色'),(178,1,32,'红色'),(179,1,32,'绿色'),(180,1,32,'花色'),(181,1,32,'蓝色'),(182,1,32,'褐色'),(183,1,32,'透明'),(184,1,32,'酒红色'),(185,1,32,'黄色'),(186,1,32,'黑色'),(187,1,32,'深灰色'),(188,1,32,'深紫色'),(189,1,32,'深蓝色'),(190,3,33,'版本1'),(191,3,33,'版本2'),(192,3,33,'版本3'),(193,3,33,'版本4'),(194,3,33,'版本5'),(200,1,35,'紫色'),(201,1,35,'红色'),(202,1,35,'绿色'),(203,1,35,'花色'),(204,1,35,'蓝色'),(205,1,35,'褐色'),(206,1,35,'透明'),(207,1,35,'酒红色'),(208,1,35,'黄色'),(209,1,35,'黑色'),(210,1,35,'深灰色'),(211,1,35,'深紫色'),(212,1,35,'深蓝色'),(213,1,36,'紫色'),(214,1,36,'红色'),(215,1,36,'绿色'),(216,1,36,'花色'),(217,1,36,'蓝色'),(218,1,36,'褐色'),(219,1,36,'透明'),(220,1,36,'酒红色'),(221,1,36,'黄色'),(222,1,36,'黑色'),(223,1,36,'深灰色'),(224,1,36,'深紫色'),(225,1,36,'深蓝色'),(226,1,37,'紫色'),(227,1,37,'红色'),(228,1,37,'绿色'),(229,1,37,'花色'),(230,1,37,'蓝色'),(231,1,37,'褐色'),(232,1,37,'透明'),(233,1,37,'酒红色'),(234,1,37,'黄色'),(235,1,37,'黑色'),(236,1,37,'深灰色'),(237,1,37,'深紫色'),(238,1,37,'深蓝色'),(239,3,9,'深层净化'),(240,3,9,'秋冬滋润'),(241,3,9,'劲能套餐'),(242,3,9,'型男霜'),(243,3,9,'控油套餐'),(244,1,12,'蓝色'),(245,1,13,'黑色'),(582,1,70,'紫色'),(583,1,70,'红色'),(584,1,70,'绿色'),(585,1,70,'花色'),(586,1,70,'蓝色'),(587,1,70,'褐色'),(588,1,70,'透明'),(589,1,70,'酒红色'),(590,1,70,'黄色'),(591,1,70,'黑色'),(592,1,70,'深灰色'),(593,1,70,'深紫色'),(594,1,70,'深蓝色'),(595,2,70,'160/80(XS)'),(596,2,70,'190/110(XXXL)'),(597,2,70,'165/84(S)'),(598,2,70,'170/88(M)'),(599,2,70,'175/92(L)'),(600,2,70,'180/96(XL)'),(601,2,70,'185/100(XXL)'),(602,2,70,'160/84(XS)'),(603,2,70,'165/88(S)'),(604,2,70,'170/92(M)'),(605,3,70,'版本1'),(606,3,70,'版本2'),(607,3,70,'版本3'),(608,3,70,'版本4'),(609,3,70,'版本5'),(610,2,25,'15寸'),(611,2,25,'17寸'),(612,2,25,'18寸'),(613,2,25,'19寸'),(614,2,25,'哒哒哒大的寸'),(615,2,1,'32'),(616,2,1,'38'),(617,3,1,'童装'),(666,3,73,'版本4'),(667,3,73,'版本5'),(668,3,73,'标间'),(669,3,73,'豪华套间'),(670,1,74,'紫色'),(671,1,74,'红色'),(672,1,74,'绿色'),(673,1,74,'花色'),(674,1,74,'蓝色'),(675,1,74,'褐色'),(676,1,74,'透明'),(677,1,74,'酒红色'),(678,1,74,'黄色'),(679,1,74,'黑色'),(680,1,74,'深灰色'),(681,1,74,'深紫色'),(682,1,74,'深蓝色'),(683,2,74,'160/80(XS)'),(684,2,74,'190/110(XXXL)'),(685,2,74,'165/84(S)'),(686,2,74,'170/88(M)'),(687,2,74,'175/92(L)'),(688,2,74,'180/96(XL)'),(689,2,74,'185/100(XXL)'),(690,2,74,'160/84(XS)'),(691,2,74,'165/88(S)'),(692,2,74,'170/92(M)'),(693,3,74,'25mm'),(694,3,74,'50mm');
/*!40000 ALTER TABLE `Himall_SpecificationValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_StatisticOrderComments`
--

DROP TABLE IF EXISTS `Himall_StatisticOrderComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_StatisticOrderComments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL,
  `CommentKey` int(11) NOT NULL COMMENT '评价的枚举（宝贝与描述相符 商家得分）',
  `CommentValue` decimal(10,4) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `himall_statisticordercomments_ibfk_1` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_statisticordercomments_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=gbk COMMENT='订单评价统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_StatisticOrderComments`
--

LOCK TABLES `Himall_StatisticOrderComments` WRITE;
/*!40000 ALTER TABLE `Himall_StatisticOrderComments` DISABLE KEYS */;
INSERT INTO `Himall_StatisticOrderComments` VALUES (121,1,1,5.0000),(122,1,2,0.0000),(123,1,3,0.0000),(124,1,4,0.0000),(125,1,9,5.0000),(126,1,10,0.0000),(127,1,11,0.0000),(128,1,12,0.0000),(129,1,5,5.0000),(130,1,6,0.0000),(131,1,7,0.0000),(132,1,8,0.0000);
/*!40000 ALTER TABLE `Himall_StatisticOrderComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_TopicModules`
--

DROP TABLE IF EXISTS `Himall_TopicModules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_TopicModules` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TopicId` bigint(20) NOT NULL COMMENT '专题ID',
  `Name` varchar(100) NOT NULL COMMENT '专题名称',
  PRIMARY KEY (`Id`),
  KEY `FK_Topic_TopicModule` (`TopicId`) USING BTREE,
  CONSTRAINT `himall_topicmodules_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `Himall_Topics` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='系统模块的专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_TopicModules`
--

LOCK TABLES `Himall_TopicModules` WRITE;
/*!40000 ALTER TABLE `Himall_TopicModules` DISABLE KEYS */;
INSERT INTO `Himall_TopicModules` VALUES (16,2,'热卖'),(17,2,'畅销'),(18,2,'新品'),(19,2,'特价'),(36,3,'男装'),(37,3,'女装'),(40,4,'户外'),(43,5,'新品相机'),(44,5,'新款手机'),(45,5,'周边配件'),(46,5,'热卖精品'),(48,7,'新品'),(49,7,'热卖'),(50,7,'畅销'),(51,7,'时尚'),(58,6,'护发系列'),(59,6,'魅力染发'),(60,6,'洗发精品'),(61,8,'新品'),(62,8,'时尚'),(63,8,'畅销'),(64,8,'热销'),(68,9,'手足护理'),(69,9,'润肤系列'),(70,9,'清凉沐浴'),(71,10,'专属自己'),(72,10,'轻松护垫'),(73,10,'保护自己'),(74,11,'清新口气'),(75,11,'专业护牙'),(76,11,'个性牙刷'),(83,12,'面部清洁'),(84,12,'清爽面膜'),(85,12,'养肤护肤'),(112,30,'默认模块1'),(117,33,'默认模块1'),(126,34,'商品，模块名称'),(155,38,'热卖'),(157,39,'护肤品'),(158,31,'服装'),(159,31,'热销女装'),(160,35,'女装'),(169,13,'护理套装'),(172,32,'默认模块1'),(173,36,'电脑'),(178,42,'默认模块1'),(183,44,'默认模块1'),(184,45,'默认模块1'),(185,43,'默认模块1'),(186,43,'默认模块2');
/*!40000 ALTER TABLE `Himall_TopicModules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Topics`
--

DROP TABLE IF EXISTS `Himall_Topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Topics` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '专题名称',
  `FrontCoverImage` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `TopImage` varchar(100) NOT NULL COMMENT '主图',
  `BackgroundImage` varchar(100) DEFAULT NULL COMMENT '背景图片',
  `PlatForm` int(11) NOT NULL DEFAULT '0' COMMENT '使用终端',
  `Tags` varchar(100) DEFAULT NULL COMMENT '标签',
  `ShopId` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `IsRecommend` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否推荐',
  `SelfDefineText` text COMMENT '自定义热点',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Topics`
--

LOCK TABLES `Himall_Topics` WRITE;
/*!40000 ALTER TABLE `Himall_Topics` DISABLE KEYS */;
INSERT INTO `Himall_Topics` VALUES (2,'相机简单购',NULL,'/Storage/Plat/Topic/2/201411281731336145557.jpg','/Storage/Plat/Topic/2/201411281731366014812.jpg',0,NULL,0,0,NULL),(3,'平台自营商店专题',NULL,'/Storage/Plat/Topic/3/201411281738495644504.jpg','/Storage/Plat/Topic/3/201411281752127699721.png',0,NULL,0,0,NULL),(4,'平台自营店专题',NULL,'/Storage/Plat/Topic/4/201411281753348639574.jpg','/Storage/Plat/Topic/4/201411281751134554207.png',0,NULL,0,0,NULL),(5,'新品首发',NULL,'/Storage/Plat/Topic/5/201411281750336942024.jpg','/Storage/Plat/Topic/5/201411281750345167137.jpg',0,NULL,0,0,NULL),(6,'洗发护发',NULL,'/Storage/Plat/Topic/6/201411281803321585529.jpg','/Storage/Plat/Topic/6/201411281803356119642.jpg',0,NULL,0,0,NULL),(7,'手机世界',NULL,'/Storage/Plat/Topic/7/201411281756413549235.jpg','/Storage/Plat/Topic/7/201411281756441522248.jpg',0,NULL,0,0,NULL),(8,'热卖配件',NULL,'/Storage/Plat/Topic/8/201411281803457345649.jpg','/Storage/Plat/Topic/8/201411281803466657032.jpg',0,NULL,0,0,NULL),(9,'身体护理',NULL,'/Storage/Plat/Topic/9/201411281820130007699.jpg','/Storage/Plat/Topic/9/201411281820485451344.jpg',0,NULL,0,0,NULL),(10,'女性护理',NULL,'/Storage/Plat/Topic/10/201411281828049926906.jpg','/Storage/Plat/Topic/10/201411281828080117917.jpg',0,NULL,0,0,NULL),(11,'口腔护理',NULL,'/Storage/Plat/Topic/11/201411281836286221947.jpg','/Storage/Plat/Topic/11/201411281836316847943.jpg',0,NULL,0,0,NULL),(12,'面部护肤',NULL,'/Storage/Plat/Topic/12/201411281841299107863.jpg','/Storage/Plat/Topic/12/201411281843564546626.jpg',0,NULL,0,0,NULL),(13,'礼品套装','','/Storage/Plat/Topic/13/201507100946095902140.jpg','/Storage/Plat/Topic/13/201507171748409359500.jpg',0,NULL,0,0,''),(30,'65456','','/Storage/Plat/Topic/30/201507060942179063320.png','',99,'tretre',210,0,NULL),(31,'运动','/Storage/Plat/Topic/31/201507201006304977920.jpg','/Storage/Plat/Topic/31/201507200932265917360.png','',99,'运动',0,0,NULL),(32,'小米专题','','/Storage/Plat/Topic/32/201507202002003423320.jpg','/Storage/Plat/Topic/32/201507202049577347420.jpg',0,NULL,0,1,'<p><img src=\"http://img13.360buyimg.com/cms/jfs/t1627/280/695896563/159761/501a14a1/55a473c5N87d5e820.jpg\" usemap=\"#Map_55ace2b809ae9\"/><map name=\"Map_55ace2b809ae9\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"540,315,892,412\" target=\"_blank\"/></map></p><p><img src=\"http://img11.360buyimg.com/cms/jfs/t880/72/1346096730/246153/62cee057/559ad078N3a3212ad.jpg\" usemap=\"#Map_55ace379d5ae8\"/><map name=\"Map_55ace379d5ae8\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"1027,366,1193,432\" target=\"_blank\"/></map></p><p><img src=\"http://img13.360buyimg.com/cms/jfs/t1279/97/687632883/293869/41ef0138/559ad078N56dc518d.jpg\" usemap=\"#Map_55ace3c23692f\"/><map name=\"Map_55ace3c23692f\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"512,349,678,415\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p><p><img src=\"http://img11.360buyimg.com/cms/jfs/t1105/74/1375168468/287435/5e567a3b/559ad078N5c1b8d30.jpg\" usemap=\"#Map_55ace3d4ad21a\"/><map name=\"Map_55ace3d4ad21a\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"1034,365,1200,431\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p><p><img src=\"http://img12.360buyimg.com/cms/jfs/t1036/306/1433278913/305260/c259ed5f/55a3dd52Ndca2a9fd.jpg\" usemap=\"#Map_55ace404a0e56\"/><map name=\"Map_55ace404a0e56\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"1055,110,1455,324\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p><p><img src=\"http://img11.360buyimg.com/cms/jfs/t1540/167/667826112/291470/8eeac0f9/55a3deefN248ed213.jpg\" usemap=\"#Map_55ace4200019b\"/><map name=\"Map_55ace4200019b\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"384,256,779,441\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p><p><img src=\"http://img11.360buyimg.com/cms/jfs/t1480/250/694623296/270599/483e03cf/55a3e0daN0fe62934.jpg\" usemap=\"#Map_55ace44d84a84\"/><map name=\"Map_55ace44d84a84\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"487,386,1484,924\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p><p><img src=\"http://img13.360buyimg.com/cms/jfs/t1063/285/1424272637/264334/1cc0470d/559fa579Na4b733e2.jpg\" usemap=\"#Map_55ace46e30bbd\"/><map name=\"Map_55ace46e30bbd\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"489,668,1486,1206\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p><p><img src=\"http://img10.360buyimg.com/cms/jfs/t1276/338/1367994368/196109/81a5eaa8/55a3e561N8666bd48.jpg\" usemap=\"#Map_55ace4d68bb44\"/><map name=\"Map_55ace4d68bb44\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/243\" shape=\"rect\" coords=\"582,222,1573,781\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p><p><img src=\"http://img14.360buyimg.com/cms/jfs/t1360/42/673139263/112344/3351a770/55a48829N3d0eff95.jpg\" usemap=\"#Map_55ace536a605d\"/><map name=\"Map_55ace536a605d\"><area title=\"\" href=\"http://img14.360buyimg.com/cms/jfs/t1360/42/673139263/112344/3351a770/55a48829N3d0eff95.jpg\" shape=\"rect\" coords=\"879,374,1061,443\" target=\"_blank\"/><area title=\"\" href=\"http://img14.360buyimg.com/cms/jfs/t1360/42/673139263/112344/3351a770/55a48829N3d0eff95.jpg\" shape=\"rect\" coords=\"457,378,637,441\" target=\"_blank\"/><area title=\"\" href=\"http://img14.360buyimg.com/cms/jfs/t1360/42/673139263/112344/3351a770/55a48829N3d0eff95.jpg\" shape=\"rect\" coords=\"1353,380,1513,444\" target=\"_blank\"/></map></p>'),(33,'伟亿专题1','','/Storage/Plat/Topic/33/201507081720542114980.jpg','',99,'伟亿',223,0,NULL),(34,'测试专题','','/Storage/Plat/Topic/34/201507141152113052220.png','',99,'斯蒂芬时代',210,0,NULL),(35,'服装','/Storage/Plat/Topic/35/201507200957010257300.jpg','/Storage/Plat/Topic/35/201507200935217385860.png','',99,'服装',0,0,NULL),(36,'OTERTERTE','','/Storage/Plat/Topic/36/201507202112000873320.jpg','/Storage/Plat/Topic/36/201507171746216575770.jpg',0,NULL,0,1,'<p><img src=\"http://192.168.10.69:8080/temp/201507201931552562430.jpg\" usemap=\"#Map_55acdcb4ce81d\"/><map name=\"Map_55acdcb4ce81d\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/236\" shape=\"rect\" coords=\"413,304,978,671\" target=\"_blank\"/><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/238\" shape=\"rect\" coords=\"1036,72,1651,448\" target=\"_blank\"/></map></p><p><img src=\"http://192.168.10.69:8080/temp/201507201948075098350.jpg\" usemap=\"#Map_55ace04768f6e\"/><map name=\"Map_55ace04768f6e\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/238\" shape=\"rect\" coords=\"358,292,981,665\" target=\"_blank\"/><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/238\" shape=\"rect\" coords=\"1036,72,1651,448\" target=\"_blank\"/></map></p><p><img src=\"http://192.168.10.69:8080/temp/201507201951183516770.jpg\" usemap=\"#Map_55ace1249ea86\"/><map name=\"Map_55ace1249ea86\"><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/238\" shape=\"rect\" coords=\"379,240,902,869\" target=\"_blank\"/><area title=\"\" href=\"http://192.168.10.69:8080/Product/Detail/238\" shape=\"rect\" coords=\"1032,4,1635,580\" target=\"_blank\"/><area title=\"\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/><area title=\"undefined\" href shape=\"rect\" coords=\"0,0,100,100\" target=\"_blank\"/></map></p>'),(38,'美妆','/Storage/Plat/Topic/38/201507201002327540340.jpg','/Storage/Plat/Topic/38/201507201002034148830.jpg','',99,'美妆',0,0,NULL),(39,'护肤','/Storage/Plat/Topic/39/201507201005464419430.jpg','/Storage/Plat/Topic/39/201507201004576882100.jpg','',99,'护肤美白',0,0,NULL),(42,'aaa','','/Storage/Plat/Topic/42/201510131224521262830.jpg','',99,'sd',1,0,NULL),(43,'rtr','','/Storage/Plat/Topic/43/201510131245409415690.jpg','/Storage/Plat/Topic/43/201510131245478766720.jpg',0,NULL,0,0,''),(44,'测试','','/Storage/Plat/Topic/44/201510131559039382230.jpg','',99,'测试',1,0,NULL),(45,'测试活动','','/Storage/Plat/Topic/45/201510131755328242940.bmp','',99,'01',1,0,NULL);
/*!40000 ALTER TABLE `Himall_Topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_TypeBrands`
--

DROP TABLE IF EXISTS `Himall_TypeBrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_TypeBrands` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TypeId` bigint(20) NOT NULL,
  `BrandId` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Brand_TypeBrand` (`BrandId`) USING BTREE,
  KEY `FK_Type_TypeBrand` (`TypeId`) USING BTREE,
  CONSTRAINT `himall_typebrands_ibfk_1` FOREIGN KEY (`BrandId`) REFERENCES `Himall_Brands` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `himall_typebrands_ibfk_2` FOREIGN KEY (`TypeId`) REFERENCES `Himall_Types` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1570 DEFAULT CHARSET=utf8 COMMENT='类型和品牌的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_TypeBrands`
--

LOCK TABLES `Himall_TypeBrands` WRITE;
/*!40000 ALTER TABLE `Himall_TypeBrands` DISABLE KEYS */;
INSERT INTO `Himall_TypeBrands` VALUES (32,26,28),(33,26,56),(34,26,54),(35,26,50),(41,17,35),(42,17,34),(43,17,39),(44,17,43),(45,17,63),(48,30,40),(52,32,35),(53,36,59),(54,36,61),(55,36,65),(56,36,68),(57,37,61),(84,41,74),(85,41,72),(86,41,75),(87,41,73),(88,41,76),(89,41,69),(90,41,70),(91,41,78),(92,41,77),(93,16,35),(94,16,38),(95,16,86),(96,16,85),(97,16,84),(98,16,83),(99,16,82),(952,9,95),(953,9,98),(954,9,101),(955,9,44),(956,9,53),(957,9,61),(958,9,68),(959,9,83),(960,9,84),(961,9,85),(962,9,86),(963,9,152),(964,9,92),(965,9,96),(966,9,99),(967,9,104),(968,9,107),(969,9,109),(970,9,111),(971,9,113),(972,9,116),(973,9,117),(974,9,118),(975,9,119),(976,9,121),(977,9,125),(978,9,126),(979,9,128),(980,9,129),(981,9,115),(982,9,122),(983,9,123),(984,9,124),(985,9,132),(986,9,134),(987,9,135),(988,9,136),(989,9,140),(990,9,143),(991,9,144),(992,9,149),(993,9,142),(994,9,145),(995,9,151),(996,9,131),(997,9,133),(998,9,146),(999,9,137),(1000,9,138),(1001,9,139),(1002,9,141),(1003,9,148),(1004,9,150),(1011,13,14),(1012,13,153),(1013,13,120),(1014,13,3),(1015,24,4),(1016,24,5),(1017,24,6),(1018,24,7),(1019,24,8),(1020,24,9),(1021,24,10),(1022,24,11),(1023,24,12),(1024,24,26),(1057,21,29),(1058,21,31),(1059,21,36),(1060,21,37),(1061,21,38),(1062,21,82),(1063,21,35),(1064,21,67),(1065,12,4),(1066,12,3),(1067,12,9),(1068,12,10),(1069,12,11),(1070,12,12),(1071,12,15),(1072,12,93),(1073,12,112),(1074,12,120),(1075,12,147),(1076,12,154),(1077,20,35),(1078,20,57),(1079,20,30),(1080,20,33),(1081,20,36),(1082,20,37),(1083,20,38),(1084,20,42),(1085,20,48),(1086,20,155),(1087,38,156),(1088,38,93),(1494,25,12),(1495,25,16),(1496,25,21),(1497,25,22),(1498,25,18),(1499,25,19),(1500,25,265),(1501,1,51),(1502,1,30),(1503,1,50),(1504,1,126),(1569,74,30);
/*!40000 ALTER TABLE `Himall_TypeBrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_Types`
--

DROP TABLE IF EXISTS `Himall_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_Types` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL COMMENT '类型名称',
  `IsSupportColor` tinyint(1) NOT NULL COMMENT '是否支持颜色规格',
  `IsSupportSize` tinyint(1) NOT NULL COMMENT '是否支持尺寸规格',
  `IsSupportVersion` tinyint(1) NOT NULL COMMENT '是否支持版本规格',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='系统类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_Types`
--

LOCK TABLES `Himall_Types` WRITE;
/*!40000 ALTER TABLE `Himall_Types` DISABLE KEYS */;
INSERT INTO `Himall_Types` VALUES (1,'内衣',1,1,1),(3,'连衣裙',1,1,0),(4,'被子',0,0,0),(5,'家居',1,0,0),(6,'图书',0,0,0),(7,'童书',1,1,1),(8,'彩妆',0,0,0),(9,'个护化妆',0,0,1),(10,'进口食品',0,0,0),(11,'特产果蔬',0,0,0),(12,'手机',1,0,1),(13,'数码',1,0,1),(14,'手包',0,0,0),(15,'斜跨包',1,1,1),(16,'箱包',1,0,0),(17,'鞋靴',1,1,0),(18,'女鞋',1,1,1),(19,'帽子',1,0,0),(20,'女装',1,1,0),(21,'男装',1,1,0),(22,'裤子',1,1,1),(24,'家用电器',1,0,1),(25,'电脑、办公',0,1,1),(26,'家具',1,0,1),(27,'家装',1,0,0),(28,'厨具',1,0,0),(29,'珠宝',1,0,0),(30,'钟表',1,0,0),(31,'奢侈品',1,0,0),(32,'运动户外',1,0,0),(33,'整车',0,0,1),(35,'汽车用品',1,0,0),(36,'母婴',1,0,0),(37,'玩具乐器',1,0,0),(38,'食品饮料',0,0,0),(39,'酒类',0,0,0),(40,'生鲜',0,0,0),(41,'营养保健',0,0,0),(42,'音像',0,0,0),(70,'衣服',1,1,1),(73,'酒店',0,0,1),(74,'螺丝',1,1,1);
/*!40000 ALTER TABLE `Himall_Types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_VShop`
--

DROP TABLE IF EXISTS `Himall_VShop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_VShop` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL COMMENT '名称',
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `CreateTime` datetime NOT NULL COMMENT '创建日期',
  `VisitNum` int(11) NOT NULL COMMENT '历览次数',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  `State` int(11) NOT NULL COMMENT '状态',
  `Logo` varchar(200) DEFAULT NULL COMMENT 'LOGO',
  `BackgroundImage` varchar(200) DEFAULT NULL COMMENT '背景图',
  `Description` varchar(30) DEFAULT NULL COMMENT '详情',
  `Tags` varchar(100) DEFAULT NULL COMMENT '标签',
  `HomePageTitle` varchar(20) DEFAULT NULL COMMENT '微信首页显示的标题',
  `WXLogo` varchar(200) DEFAULT NULL COMMENT '微信Logo',
  PRIMARY KEY (`Id`),
  KEY `FK_vshop_shopinfo` (`ShopId`) USING BTREE,
  CONSTRAINT `himall_vshop_ibfk_1` FOREIGN KEY (`ShopId`) REFERENCES `Himall_Shops` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='微信端微店表  ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_VShop`
--

LOCK TABLES `Himall_VShop` WRITE;
/*!40000 ALTER TABLE `Himall_VShop` DISABLE KEYS */;
INSERT INTO `Himall_VShop` VALUES (4,'扣扣电脑城',210,'2015-06-30 19:46:24',250,55,2,'/Storage/Shop/210/VShop/Logo.jpg','/Storage/Shop/210/VShop/BackgroundImage.jpg','数码','数码',NULL,NULL),(8,'糖糖的店铺',215,'2015-07-07 08:28:36',104,39,99,'/Storage/Shop/215/VShop/Logo.jpg','/Storage/Shop/215/VShop/BackgroundImage.jpg','服装','女装',NULL,NULL),(9,'伟亿',223,'2015-07-08 17:08:15',19,0,99,'/Storage/Shop/223/VShop/Logo.jpg','/Storage/Shop/223/VShop/BackgroundImage.png','ik','ik',NULL,NULL),(16,'官方自营店',1,'2015-10-09 14:04:58',81,13,2,'/Storage/Shop/1/VShop/Logo.jpg','/Storage/Shop/1/VShop/BackgroundImage.jpg','测试','测试','服务站','/Storage/Shop/1/VShop/WXLogo.png'),(17,'zara专卖',232,'2015-10-10 16:39:31',6,0,2,'/Storage/Shop/232/VShop/Logo.jpg','/Storage/Shop/232/VShop/BackgroundImage.jpg','服装','服装',NULL,'/Storage/Shop/232/VShop/WXLogo.png'),(18,'测试33',245,'2015-10-13 16:26:10',10,0,2,'/Storage/Shop/245/VShop/Logo.jpg','/Storage/Shop/245/VShop/BackgroundImage.png','测试','测试','好久没见','/Storage/Shop/245/VShop/WXLogo.png'),(19,'数码旗舰店',247,'2015-10-14 10:40:19',12,2,2,'/Storage/Shop/247/VShop/Logo.jpg','/Storage/Shop/247/VShop/BackgroundImage.jpg','旗舰店','数码',NULL,'/Storage/Shop/247/VShop/WXLogo.png');
/*!40000 ALTER TABLE `Himall_VShop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_VShopExtend`
--

DROP TABLE IF EXISTS `Himall_VShopExtend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_VShopExtend` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `VShopId` bigint(20) NOT NULL COMMENT '微店ID',
  `Sequence` int(11) DEFAULT NULL COMMENT '顺序',
  `Type` int(11) NOT NULL COMMENT '微店类型（主推微店、热门微店）',
  `AddTime` datetime NOT NULL COMMENT '添加时间',
  `State` int(11) NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`Id`),
  KEY `FK_vshopextend_vshop` (`VShopId`) USING BTREE,
  CONSTRAINT `himall_vshopextend_ibfk_1` FOREIGN KEY (`VShopId`) REFERENCES `Himall_VShop` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='微店扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_VShopExtend`
--

LOCK TABLES `Himall_VShopExtend` WRITE;
/*!40000 ALTER TABLE `Himall_VShopExtend` DISABLE KEYS */;
INSERT INTO `Himall_VShopExtend` VALUES (43,4,NULL,1,'2015-10-13 16:39:25',0);
/*!40000 ALTER TABLE `Himall_VShopExtend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_WXAccToken`
--

DROP TABLE IF EXISTS `Himall_WXAccToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_WXAccToken` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AppId` varchar(50) DEFAULT NULL,
  `AccessToken` varchar(150) NOT NULL COMMENT '微信访问令牌',
  `TokenOutTime` datetime NOT NULL COMMENT '微信令牌过期日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信访问令牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_WXAccToken`
--

LOCK TABLES `Himall_WXAccToken` WRITE;
/*!40000 ALTER TABLE `Himall_WXAccToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `Himall_WXAccToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_WXCardCodeLog`
--

DROP TABLE IF EXISTS `Himall_WXCardCodeLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_WXCardCodeLog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CardLogId` bigint(20) DEFAULT NULL COMMENT '卡券记录号',
  `CardId` varchar(50) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL COMMENT '标识',
  `SendTime` datetime DEFAULT NULL COMMENT '投放时间',
  `CodeStatus` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `UsedTime` datetime DEFAULT NULL COMMENT '操作时间 失效、核销、删除时间',
  `CouponType` int(11) DEFAULT NULL COMMENT '红包类型',
  `CouponCodeId` bigint(20) DEFAULT NULL COMMENT '红包记录编号',
  `OpenId` varchar(4000) DEFAULT NULL COMMENT '对应OpenId',
  PRIMARY KEY (`Id`),
  KEY `FK_Himall_WXLog_CardLogId` (`CardLogId`),
  KEY `IDX_Himall_WXLog_CardId` (`CardId`),
  KEY `IDX_Himall_WXLog_Code` (`Code`),
  CONSTRAINT `FK_Himall_WXLog_CardLogId` FOREIGN KEY (`CardLogId`) REFERENCES `Himall_WXCardLog` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COMMENT='微信卡券投放记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_WXCardCodeLog`
--

LOCK TABLES `Himall_WXCardCodeLog` WRITE;
/*!40000 ALTER TABLE `Himall_WXCardCodeLog` DISABLE KEYS */;
INSERT INTO `Himall_WXCardCodeLog` VALUES (212,41,'psRzujgks9MGLt6BomTPTSArSvU8','002796857892','2015-10-09 14:25:54',1,NULL,1,517,'osRzujh4PfGROqb5lpcWjehJZJb8'),(213,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-09 18:25:08',0,NULL,1,518,NULL),(214,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-09 18:26:02',0,NULL,1,519,NULL),(216,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-10 07:07:26',0,NULL,1,521,NULL),(217,41,'psRzujgks9MGLt6BomTPTSArSvU8','868022468049','2015-10-10 14:13:19',1,NULL,1,523,'osRzujsr7d-wjmzu6Kbca53cqOKM'),(218,41,'psRzujgks9MGLt6BomTPTSArSvU8','268710417900','2015-10-10 14:19:59',1,NULL,1,524,'osRzujsr7d-wjmzu6Kbca53cqOKM'),(219,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-10 14:21:06',0,NULL,1,525,NULL),(220,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-10 15:15:03',0,NULL,1,526,NULL),(221,42,'psRzujlM0kYsJKArtILtm5bR0KXM','842101832539','2015-10-10 16:27:55',1,NULL,2,4415,'osRzujo1mpla0AfOOrAhxCfULzT4'),(222,42,'psRzujlM0kYsJKArtILtm5bR0KXM',NULL,'2015-10-10 16:27:40',0,NULL,2,4416,NULL),(223,42,'psRzujlM0kYsJKArtILtm5bR0KXM','373887432219','2015-10-10 16:28:05',1,NULL,2,4417,'osRzujkyavZMEU9-n1X3Pkd2afUM'),(224,42,'psRzujlM0kYsJKArtILtm5bR0KXM',NULL,'2015-10-10 16:28:48',0,NULL,2,4418,NULL),(225,42,'psRzujlM0kYsJKArtILtm5bR0KXM',NULL,'2015-10-10 16:46:11',0,NULL,2,4419,NULL),(226,42,'psRzujlM0kYsJKArtILtm5bR0KXM',NULL,'2015-10-10 16:48:27',0,NULL,2,4420,NULL),(227,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-11 18:04:46',0,NULL,1,527,NULL),(228,41,'psRzujgks9MGLt6BomTPTSArSvU8','927461013324','2015-10-12 11:46:15',1,NULL,1,529,'osRzujiNxw7RQS772gNjwTcjW-EQ'),(229,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-12 11:46:47',0,NULL,1,530,NULL),(230,41,'psRzujgks9MGLt6BomTPTSArSvU8','931178115059','2015-10-12 22:02:47',1,NULL,1,532,'osRzujlCOCkl4I4vXoHfG6iZQhJs'),(231,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-13 16:48:45',0,NULL,1,539,NULL),(232,41,'psRzujgks9MGLt6BomTPTSArSvU8',NULL,'2015-10-13 17:37:19',0,NULL,1,546,NULL);
/*!40000 ALTER TABLE `Himall_WXCardCodeLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_WXCardLog`
--

DROP TABLE IF EXISTS `Himall_WXCardLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_WXCardLog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CardId` varchar(50) DEFAULT NULL COMMENT '卡券编号',
  `CardTitle` varchar(50) DEFAULT NULL COMMENT '标题 英文27  汉字 9个',
  `CardSubTitle` varchar(100) DEFAULT NULL COMMENT '副标题 英文54  汉字18个',
  `CardColor` varchar(10) DEFAULT NULL COMMENT '卡券颜色 HasTable',
  `AuditStatus` int(11) DEFAULT NULL COMMENT '审核状态',
  `AppId` varchar(50) DEFAULT NULL,
  `AppSecret` varchar(50) DEFAULT NULL,
  `CouponType` int(11) DEFAULT NULL COMMENT '红包类型',
  `CouponId` bigint(20) DEFAULT NULL COMMENT '红包编号 涉及多表，不做外键',
  PRIMARY KEY (`Id`),
  KEY `IDX_Himall_WXCardLog_CardId` (`CardId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='微信卡券记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_WXCardLog`
--

LOCK TABLES `Himall_WXCardLog` WRITE;
/*!40000 ALTER TABLE `Himall_WXCardLog` DISABLE KEYS */;
INSERT INTO `Himall_WXCardLog` VALUES (41,'psRzujgks9MGLt6BomTPTSArSvU8','满200减50',NULL,'Color020',1,'wx007e3e45af8e55dd','7790007b8b80030518b18679827b0b62',1,145),(42,'psRzujlM0kYsJKArtILtm5bR0KXM','双十一代金券','无门槛代金券','Color101',1,'wx007e3e45af8e55dd','7790007b8b80030518b18679827b0b62',2,57),(43,'psRzujv6VMgoGi1QgW1mt2ZbW1Q8','012',NULL,'Color090',0,'wx007e3e45af8e55dd','7790007b8b80030518b18679827b0b62',2,58);
/*!40000 ALTER TABLE `Himall_WXCardLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_WXshop`
--

DROP TABLE IF EXISTS `Himall_WXshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_WXshop` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ShopId` bigint(20) NOT NULL COMMENT '店铺ID',
  `AppId` varchar(30) NOT NULL COMMENT '公众号的APPID',
  `AppSecret` varchar(35) NOT NULL COMMENT '公众号的AppSecret',
  `Token` varchar(30) NOT NULL COMMENT '公众号的Token',
  `FollowUrl` varchar(500) DEFAULT NULL COMMENT '跳转的URL',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='微店配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_WXshop`
--

LOCK TABLES `Himall_WXshop` WRITE;
/*!40000 ALTER TABLE `Himall_WXshop` DISABLE KEYS */;
INSERT INTO `Himall_WXshop` VALUES (3,210,'wx6f11c6ea30870a2f','f890b6b6c3b85bed1e4dc356ec585106','AA08D3FBC1BED531','http://becks1989.oicp.net/m-WeiXin/vshop/detail/4'),(4,211,'wxe7b7fdc95e698a7c','746f5606956e32e7b269b6b21a69dbea','AD36B0DAA8ECD05C','http://mp.weixin.qq.com/s?__biz=MzAwNTYwMjY5NA==&mid=217818390&idx=1&sn=e9f49993e5bd6b7a87ad5cf0122a8692#rd'),(5,215,'wx007e3e45af8e55dd','7790007b8b80030518b18679827b0b62','545A7DB974C8EC55','http://mp.weixin.qq.com/s?__biz=MjM5Nzk2OTU4NQ==&mid=208331805&idx=1&sn=569cd7f73f3de7fdc7aff752001b313a#rd'),(6,223,'wx8acac839502ff851','28ba0e0aeec33026113448a362533040','ACEFFA628329E663','');
/*!40000 ALTER TABLE `Himall_WXshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Himall_WeiXinBasic`
--

DROP TABLE IF EXISTS `Himall_WeiXinBasic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Himall_WeiXinBasic` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Ticket` varchar(100) NOT NULL COMMENT '微信Ticket',
  `TicketOutTime` datetime NOT NULL COMMENT '微信Ticket过期日期',
  `AppId` varchar(50) NOT NULL,
  `AccessToken` varchar(150) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='微信票据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Himall_WeiXinBasic`
--

LOCK TABLES `Himall_WeiXinBasic` WRITE;
/*!40000 ALTER TABLE `Himall_WeiXinBasic` DISABLE KEYS */;
INSERT INTO `Himall_WeiXinBasic` VALUES (57,'bxLdikRXVbTPdHSM05e5u3TL3kJRrCdIn85vLIHAL0CLUUCNg1ISHnQehShZwLoWrcTITo-Y4EzNRCdihapVHQ','2015-10-14 17:58:01','wx007e3e45af8e55dd','NxXlFDwyaIc75KD1OPuJ1u0BpNpON3HEHZ2H9nrFHVdBXWK9OkhRODxQ98Q4QqCZNBWVrJ3dmiyCrlR4Bqh5-wvryacu1PhEg6xupNNcy94');
/*!40000 ALTER TABLE `Himall_WeiXinBasic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-14 17:23:05