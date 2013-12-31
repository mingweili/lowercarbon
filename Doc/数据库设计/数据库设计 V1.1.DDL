/*    此 SQL DDL 脚本由 Microsoft Visual Studio (发布日期:LOCAL BUILD) 生成。                            */

/*    所用驱动程序: Microsoft Visual Studio － Microsoft SQL Server 驱动程序。                            */
/*    文档: C:\Documents and Settings\Administrator\桌面\数据库设计 0.1（EN）.vsd。                       */
/*    创建时间: 2010年12月18日 17:24。                                                                */
/*    操作: 来自 Visio 生成向导。                                                                      */
/*    已连接的数据源: 没有连接。                                                                          */
/*    已连接的服务器: 没有连接。                                                                          */
/*    已连接的数据库: 不适用。                                                                           */



SET QUOTED_IDENTIFIER ON

go


/* 创建 ImagineCup 数据库。                                                                         */
use master  

go

create database "ImagineCup"  

go

use "ImagineCup"  

go

/* 创建新表 "PLATFORM_LOG"。                                                                       */
/* "PLATFORM_LOG" : 账目记录 的表                                                                   */
/* 	"PLATFORM_LOG_NO" : PLATFORM_LOG_NO 标识 账目记录                                               */
/* 	"GOODS_NO" : 商品编号                                                                         */
/* 	"NATURAL_MONTHS" : 自然月                                                                    */
/* 	"AMOUNTS_PAYABLE" : 应付金额                                                                  */
/* 	"ACTUALLY_PAID" : 实付金额                                                                    */
/* 	"LOG_STATE" : 账目状态                                                                        */  
create table "PLATFORM_LOG" ( 
	"PLATFORM_LOG_NO" char(32) not null,
	"GOODS_NO" char(32) not null,
	"NATURAL_MONTHS" datetime not null,
	"AMOUNTS_PAYABLE" numeric(10,2) null,
	"ACTUALLY_PAID" numeric(10,2) null,
	"LOG_STATE" smallint not null)  

go

alter table "PLATFORM_LOG"
	add constraint "PLATFORM_LOG_PK" primary key ("PLATFORM_LOG_NO")   


go

/* 创建新表 "GOODS"。                                                                              */
/* "GOODS" : 登记商品 的表                                                                          */
/* 	"GOODS_NO" : 商品编号                                                                         */
/* 	"EXT_NO" : 购物网店的商品编号                                                                      */
/* 	"VENDOR_BIND_NO" : 销售商绑定账号编号                                                              */
/* 	"CARBON_EMISSIONS" : 制造排碳量                                                                */
/* 	"GOODS_REGISTER_TIME" : 商品登记日期                                                            */
/* 	"COOPERATION_STATE" : 合作状态                                                                */
/* 	"CARBON_DISCOUNT" : 商品纳税折扣                                                                */  
create table "GOODS" ( 
	"GOODS_NO" char(32) not null,
	"EXT_NO" char(32) null,
	"VENDOR_BIND_NO" char(32) not null,
	"CARBON_EMISSIONS" bigint null,
	"GOODS_REGISTER_TIME" datetime not null,
	"COOPERATION_STATE" smallint not null,
	"CARBON_DISCOUNT" numeric(10,2) null)  

go

alter table "GOODS"
	add constraint "GOODS_PK" primary key ("GOODS_NO")   


go

/* 创建新表 "AVG_CAR_FOO_OF_STATE"。                                                               */
/* "AVG_CAR_FOO_OF_STATE" : 国家人平均碳足迹 的表                                                       */
/* 	"STATE_NAME" : STATE_NAME 标识 国家人平均碳足迹                                                     */
/* 	"AVG_CAR_FOO" : AVG_CAR_FOO 属于 国家人平均碳足迹                                                   */
/* 	"DATA_ACQ_DATE" : DATA_ACQ_DATE 属于 国家人平均碳足迹                                               */  
create table "AVG_CAR_FOO_OF_STATE" ( 
	"STATE_NAME" nvarchar(20) not null,
	"AVG_CAR_FOO" numeric(10,2) null,
	"DATA_ACQ_DATE" datetime null)  

go

alter table "AVG_CAR_FOO_OF_STATE"
	add constraint "AVG_CAR_FOO_OF_STATE_PK" primary key ("STATE_NAME")   


go

/* 创建新表 "CARBON_FOO_CONF"。                                                                    */
/* "CARBON_FOO_CONF" : 碳足迹配置 的表                                                               */
/* 	"CONF_NO" : 标准编号                                                                          */
/* 	"AVG_OF_IND_COUNTRIES" : 工业国家平均值                                                          */
/* 	"GLO_AVG_CAR_FOO" : 全球平均碳足迹                                                               */
/* 	"GLOBAL_GOAL" : 全球性目标                                                                     */
/* 	"LOVE_TREE_STANDARD" : 爱心树标准                                                              */  
create table "CARBON_FOO_CONF" ( 
	"CONF_NO" char(32) not null,
	"AVG_OF_IND_COUNTRIES" numeric(10,2) null,
	"GLO_AVG_CAR_FOO" numeric(10,2) null,
	"GLOBAL_GOAL" numeric(10,2) null,
	"LOVE_TREE_STANDARD" numeric(10,2) null)  

go

alter table "CARBON_FOO_CONF"
	add constraint "CARBON_FOO_CONF_PK" primary key ("CONF_NO")   


go

/* 创建新表 "CARBON_FOOTPRINT"。                                                                   */
/* "CARBON_FOOTPRINT" : 碳足迹 的表                                                                */
/* 	"CARBON_FOOTPRINT_NO" : 足迹编号                                                              */
/* 	"CONSUMER_NO" : 买家编号                                                                      */
/* 	"STATE" : 国家                                                                              */
/* 	"BEGIN_TIME" : 开始时间                                                                       */
/* 	"END_TIME" : 结束时间                                                                         */
/* 	"HOUSEHOLD" : 房屋 足迹 家庭人口                                                                  */
/* 	"POWER" : 房屋 足迹 电力                                                                        */
/* 	"NATURAL_GAS" : 房屋 足迹 天然气                                                                 */
/* 	"HEATING_FUEL" : 房屋 足迹 热力用燃油                                                              */
/* 	"COAL" : 房屋 足迹 煤炭                                                                         */
/* 	"LPG" : 房屋 足迹 液化气                                                                         */
/* 	"PROPANE" : 房屋 足迹 丙烷                                                                      */
/* 	"WOOD_LATH" : 房屋 足迹 木屑板条                                                                  */
/* 	"FLIGHTS_FROM" : 航班 碳足迹 航班起                                                               */
/* 	"FLIGHTS_TO" : 航班 碳足迹 航班到                                                                 */
/* 	"VIA" : 航班 碳足迹 途经                                                                         */
/* 	"SHIPPING_SPACE_TYPE" : 航班 碳足迹 舱位                                                         */
/* 	"TRAVEL_COUNT" : 航班 碳足迹 旅行                                                                */
/* 	"INC_RADIATION_ENERGY" : 航班 碳足迹 包括辐射能量                                                    */
/* 	"CAR_MILEAGE" : 轿车 碳足迹 里程数                                                                */
/* 	"MANUFACTURER" : 轿车 碳足迹 生产商                                                               */
/* 	"MODEL" : 轿车 碳足迹 型号                                                                       */
/* 	"PRODUCTION_YEAR" : 轿车 碳足迹 生产年份                                                           */
/* 	"CAR_EFFECT" : 轿车 碳足迹 功效                                                                  */
/* 	"MOTO_MILEAGE" : 摩托车 碳足迹 里程数                                                              */
/* 	"MOTO_EFFECT" : 摩托车 碳足迹 功效                                                                */
/* 	"BUS" : 巴士和火车 碳足迹 巴士                                                                      */
/* 	"COACH" : 巴士和火车 碳足迹 长途客车                                                                  */
/* 	"NATIONAL_RAIL" : 巴士和火车 碳足迹 国家铁路                                                          */
/* 	"INTERNATIONAL_R" : 巴士和火车 碳足迹 国际铁路                                                        */
/* 	"TRAM" : 巴士和火车 碳足迹 有轨电车                                                                   */
/* 	"METRO" : 巴士和火车 碳足迹 地铁                                                                    */
/* 	"TAXI" : 巴士和火车 碳足迹 出租车                                                                    */
/* 	"SEC_CARBON_FOO" : 二级碳足迹                                                                  */
/* 	"TOTAL_CARBON_FOO" : 碳足迹总量                                                                */
/* 	"CALCULATION_DATE" : 航班 碳足迹                                                               */  
create table "CARBON_FOOTPRINT" ( 
	"CARBON_FOOTPRINT_NO" char(32) not null,
	"CONSUMER_NO" char(32) not null,
	"STATE" nvarchar(20) null,
	"BEGIN_TIME" datetime null,
	"END_TIME" datetime null,
	"HOUSEHOLD" smallint null,
	"POWER" numeric(10,2) null,
	"NATURAL_GAS" numeric(10,2) null,
	"HEATING_FUEL" numeric(10,2) null,
	"COAL" numeric(10,2) null,
	"LPG" numeric(10,2) null,
	"PROPANE" numeric(10,2) null,
	"WOOD_LATH" numeric(10,2) null,
	"FLIGHTS_FROM" char(10) null,
	"FLIGHTS_TO" char(10) null,
	"VIA" nvarchar(10) null,
	"SHIPPING_SPACE_TYPE" nvarchar(10) null,
	"TRAVEL_COUNT" smallint null,
	"INC_RADIATION_ENERGY" bit null,
	"CAR_MILEAGE" char(10) null,
	"MANUFACTURER" nvarchar(20) null,
	"MODEL" nvarchar(20) null,
	"PRODUCTION_YEAR" datetime null,
	"CAR_EFFECT" numeric(10,2) null,
	"MOTO_MILEAGE" numeric(10,2) null,
	"MOTO_EFFECT" numeric(10,2) null,
	"BUS" numeric(10,2) null,
	"COACH" numeric(10,2) null,
	"NATIONAL_RAIL" numeric(10,2) null,
	"INTERNATIONAL_R" numeric(10,2) null,
	"TRAM" numeric(10,2) null,
	"METRO" numeric(10,2) null,
	"TAXI" numeric(10,2) null,
	"SEC_CARBON_FOO" numeric(10,2) null,
	"TOTAL_CARBON_FOO" numeric(10,2) not null,
	"CALCULATION_DATE" datetime not null)  

go

alter table "CARBON_FOOTPRINT"
	add constraint "CARBON_FOOTPRINT_PK" primary key ("CARBON_FOOTPRINT_NO")   


go

/* 创建新表 "LOVE_TREE"。                                                                          */
/* "LOVE_TREE" : 爱心树 的表                                                                       */
/* 	"TREE_NO" : 爱心树编号                                                                         */
/* 	"CONSUMER_NO" : 买家编号                                                                      */
/* 	"TREE_SLOGAN" : 设定标语                                                                      */
/* 	"TREE_PIC" : 爱心图                                                                          */
/* 	"TREE_LOCATION" : 植种地点                                                                    */
/* 	"TREE_AGE" : 树龄                                                                           */
/* 	"TREE_STATE" : 已经栽种、等待公益组织                                                                */
/* 	"TREE_PURCHASES_TIME" : 购买日期                                                              */
/* 	"TREE_PLANT_TIME" : 植种日期                                                                  */  
create table "LOVE_TREE" ( 
	"TREE_NO" char(32) not null,
	"CONSUMER_NO" char(32) not null,
	"TREE_SLOGAN" nvarchar(20) null,
	"TREE_PIC" image null,
	"TREE_LOCATION" nvarchar(100) null,
	"TREE_AGE" smallint null,
	"TREE_STATE" smallint not null,
	"TREE_PURCHASES_TIME" datetime null,
	"TREE_PLANT_TIME" datetime null)  

go

alter table "LOVE_TREE"
	add constraint "LOVE_TREE_PK" primary key ("TREE_NO")   


go

/* 创建新表 "VENDOR_BIND_ESHOP "。                                                                 */
/* "VENDOR_BIND_ESHOP " : 网店账户绑定 的表                                                           */
/* 	"VENDOR_BIND_NO" : 销售商绑定账户编号                                                              */
/* 	"VENDOR_NO " : 销售商编号                                                                      */
/* 	"ESHOP_NO" : 网店类型编号                                                                       */
/* 	"VENDOR_BIND_NAME" : 网店用户名                                                                */
/* 	"VENDOR_BIND_PASSWD" : 网店密码                                                               */
/* 	"VENDOR_BIND_HOME" : 登陆主页                                                                 */
/* 	"BIND_STATE" : 绑定状态                                                                       */
/* 	"BIND_TIME" : 绑定时间                                                                        */  
create table "VENDOR_BIND_ESHOP " ( 
	"VENDOR_BIND_NO" char(32) not null,
	"VENDOR_NO " char(32) not null,
	"ESHOP_NO" char(32) not null,
	"VENDOR_BIND_NAME" nvarchar(20) not null,
	"VENDOR_BIND_PASSWD" char(32) not null,
	"VENDOR_BIND_HOME" char(100) null,
	"BIND_STATE" smallint not null,
	"BIND_TIME" datetime not null)  

go

alter table "VENDOR_BIND_ESHOP "
	add constraint "VENDOR_BIND_ESHOP _PK" primary key ("VENDOR_BIND_NO")   


go

/* 创建新表 "VENDOR"。                                                                             */
/* "VENDOR" : 销售商 的表                                                                          */
/* 	"VENDOR_NO" : 销售商编号                                                                       */
/* 	"VENDOR_NAME" : 注册名称                                                                      */
/* 	"VENDOR_PASSWD" : 注册密码                                                                    */
/* 	"V_HEAD_PORTRAIT" : V_HEAD_PORTRAIT 属于 销售商                                                */
/* 	"VENDOR_MAIL_BOX" : 邮箱                                                                    */
/* 	"VENDOR_STATE" : 账户状态                                                                     */
/* 	"REGISTER_TIME" : 注册日期                                                                    */  
create table "VENDOR" ( 
	"VENDOR_NO" char(32) not null,
	"VENDOR_NAME" nvarchar(20) not null,
	"VENDOR_PASSWD" char(32) not null,
	"V_HEAD_PORTRAIT" image null,
	"VENDOR_MAIL_BOX" char(32) null,
	"VENDOR_STATE" smallint not null,
	"REGISTER_TIME" datetime not null)  

go

alter table "VENDOR"
	add constraint "VENDOR_PK" primary key ("VENDOR_NO")   


go

/* 创建新表 "E_SHOP"。                                                                             */
/* "E_SHOP" : 网店类型 的表                                                                         */
/* 	"ESHOP_NO" : 网店编号                                                                         */
/* 	"ESHOP_NAME" : 网店类型名称                                                                     */
/* 	"ESHOP_HOME" : 网店主页                                                                       */  
create table "E_SHOP" ( 
	"ESHOP_NO" char(32) not null,
	"ESHOP_NAME" nvarchar(20) not null,
	"ESHOP_HOME" varchar(100) not null)  

go

alter table "E_SHOP"
	add constraint "E_SHOP_PK" primary key ("ESHOP_NO")   


go

/* 创建新表 "PURCHASES_HISTORY"。                                                                  */
/* "PURCHASES_HISTORY" : 消费者购物历史 的表                                                           */
/* 	"HISTORY_NO" : 记录编号                                                                       */
/* 	"BUSINESS_NO" : 交易编号                                                                      */
/* 	"CONSUMER_NO" : 买家编号                                                                      */
/* 	"GOODS_NO" : 商品编号                                                                         */
/* 	"CONSUMPTION" : 消费数量                                                                      */
/* 	"CONSUMER_TIME" : 消费日期                                                                    */
/* 	"TRANSACTIONS_STATE" : 交易状态                                                               */
/* 	"LAST_TRACKING" : 最后一次跟踪时间                                                                */
/* 	"CARBON_FO_STATE" : 碳足迹结算状态                                                               */  
create table "PURCHASES_HISTORY" ( 
	"HISTORY_NO" char(32) not null,
	"BUSINESS_NO" char(32) not null,
	"CONSUMER_NO" char(32) not null,
	"GOODS_NO" char(32) not null,
	"CONSUMPTION" smallint not null,
	"CONSUMER_TIME" datetime not null,
	"TRANSACTIONS_STATE" varchar(10) not null,
	"LAST_TRACKING" datetime null,
	"CARBON_FO_STATE" smallint not null)  

go

alter table "PURCHASES_HISTORY"
	add constraint "PURCHASES_HISTORY_PK" primary key ("HISTORY_NO")   


go

/* 创建新表 "CONSUMER_BIND_ESHOP"。                                                                */
/* "CONSUMER_BIND_ESHOP" : 绑定账户 的表                                                            */
/* 	"CONSUMER_BIND_NO" : 买家绑定账户编号                                                             */
/* 	"CONSUMER_NO" : 买家编号                                                                      */
/* 	"ESHOP_N0" : 网店类型编号                                                                       */
/* 	"CONSUMER_BIND_NAME" : 账户名称                                                               */
/* 	"CONSUMER_BIND_PASSWD" : 原始密码                                                             */  
create table "CONSUMER_BIND_ESHOP" ( 
	"CONSUMER_BIND_NO" char(32) not null,
	"CONSUMER_NO" char(32) not null,
	"ESHOP_N0" char(32) not null,
	"CONSUMER_BIND_NAME" nvarchar(20) not null,
	"CONSUMER_BIND_PASSWD" char(32) not null)  

go

alter table "CONSUMER_BIND_ESHOP"
	add constraint "CONSUMER_BIND_ESHOP_PK" primary key ("CONSUMER_BIND_NO")   


go

/* 创建新表 "CONSUMER"。                                                                           */
/* "CONSUMER" : 买家 的表                                                                         */
/* 	"CONSUMER_NO" : 消费者编号                                                                     */
/* 	"CONSUMER_NAME" : 注册名称                                                                    */
/* 	"CONSUMER_PASSWD" : MD5加密过的形式                                                             */
/* 	"C_HEAD_PORTRAIT" : 头像                                                                    */
/* 	"CONSUMER_MAIL_BOX" : 邮箱                                                                  */
/* 	"CONSUMER_SEX" : 性别                                                                       */
/* 	"CONSUMER_POINTS" : 积分                                                                    */
/* 	"REGISTER_TIME" : 注册日期                                                                    */  
create table "CONSUMER" ( 
	"CONSUMER_NO" char(32) not null,
	"CONSUMER_NAME" nvarchar(20) not null,
	"CONSUMER_PASSWD" char(32) not null,
	"C_HEAD_PORTRAIT" image null,
	"CONSUMER_MAIL_BOX" char(32) null,
	"CONSUMER_SEX" bit null,
	"CONSUMER_POINTS" bigint not null,
	"REGISTER_TIME" datetime not null)  

go

alter table "CONSUMER"
	add constraint "CONSUMER_PK" primary key ("CONSUMER_NO")   


go

/* 创建新表 "COMMONWEAL_USE"。                                                                     */
/* "COMMONWEAL_USE" : 公益基金使用 的表                                                               */
/* 	"COMMONWEAL_NO" : 使用编号                                                                    */
/* 	"PHILANTHROPIC_NO" : 团体编号                                                                 */
/* 	"FOUND_COUNT" : 申请基金                                                                      */
/* 	"NUM_TREE_PLAN" : 植树数量                                                                    */
/* 	"COM_STATES" : 完成状态                                                                       */
/* 	"COMMONWEAL_TIME" : 申请时间                                                                  */  
create table "COMMONWEAL_USE" ( 
	"COMMONWEAL_NO" char(32) not null,
	"PHILANTHROPIC_NO" char(32) null,
	"FOUND_COUNT" decimal(10,2) null,
	"NUM_TREE_PLAN" bigint null,
	"COM_STATES" smallint null,
	"COMMONWEAL_TIME" datetime null)  

go

alter table "COMMONWEAL_USE"
	add constraint "COMMONWEAL_USE_PK" primary key ("COMMONWEAL_NO")   


go

/* 创建新表 "PHILANTHROPIC_ORG"。                                                                  */
/* "PHILANTHROPIC_ORG" : 公益团体 的表                                                              */
/* 	"PHILANTHROPIC_NO" : 团体编号                                                                 */
/* 	"PHILANTHROPIC_NAME" : 团体名称                                                               */
/* 	"团体简介" : 团体简介                                                                             */
/* 	"EMAIL" : 邮箱                                                                              */
/* 	"PHONE" : 联系电话                                                                            */
/* 	"OFFICE_PLACE" : 办公地址                                                                     */
/* 	"ORG_LOGO" : 组织旗帜                                                                         */  
create table "PHILANTHROPIC_ORG" ( 
	"PHILANTHROPIC_NO" char(32) not null,
	"PHILANTHROPIC_NAME" nvarchar(20) null,
	"团体简介" nvarchar(200) null,
	"EMAIL" char(20) null,
	"PHONE" char(11) null,
	"OFFICE_PLACE" nvarchar(200) null,
	"ORG_LOGO" image null)  

go

alter table "PHILANTHROPIC_ORG"
	add constraint "PHILANTHROPIC_ORG_PK" primary key ("PHILANTHROPIC_NO")   


go

/* 创建新表 "LOVE_TREE_TRACE"。                                                                    */
/* "LOVE_TREE_TRACE" : 爱心树跟踪 的表                                                               */
/* 	"TRAC_NO" : 跟踪编号                                                                          */
/* 	"COMMONWEAL_NO" : 使用编号                                                                    */
/* 	"TREE_NO" : 爱心树编号                                                                         */
/* 	"COM_STATES" : 完成状况                                                                       */  
create table "LOVE_TREE_TRACE" ( 
	"TRAC_NO" char(32) not null,
	"COMMONWEAL_NO" char(32) null,
	"TREE_NO" char(32) null,
	"COM_STATES" smallint null)  

go

alter table "LOVE_TREE_TRACE"
	add constraint "LOVE_TREE_TRACE_PK" primary key ("TRAC_NO")   


go

/* 在表 "PLATFORM_LOG" 中添加外键约束。                                                                 */
alter table "PLATFORM_LOG"
	add constraint "PLATFORM_LOG_FK1" foreign key (
		"GOODS_NO")
	 references "GOODS" (
		"GOODS_NO") on update no action on delete no action  

go

/* 在表 "GOODS" 中添加外键约束。                                                                        */
alter table "GOODS"
	add constraint "GOODS_FK1" foreign key (
		"VENDOR_BIND_NO")
	 references "VENDOR_BIND_ESHOP " (
		"VENDOR_BIND_NO") on update no action on delete no action  

go

/* 在表 "CARBON_FOOTPRINT" 中添加外键约束。                                                             */
alter table "CARBON_FOOTPRINT"
	add constraint "CARBON_FOOTPRINT_FK1" foreign key (
		"CONSUMER_NO")
	 references "CONSUMER" (
		"CONSUMER_NO") on update no action on delete no action  

go

/* 在表 "LOVE_TREE" 中添加外键约束。                                                                    */
alter table "LOVE_TREE"
	add constraint "LOVE_TREE_FK1" foreign key (
		"CONSUMER_NO")
	 references "CONSUMER" (
		"CONSUMER_NO") on update no action on delete no action  

go

/* 在表 "VENDOR_BIND_ESHOP " 中添加外键约束。                                                           */
alter table "VENDOR_BIND_ESHOP "
	add constraint "VENDOR_BIND_ESHOP _FK1" foreign key (
		"VENDOR_NO ")
	 references "VENDOR" (
		"VENDOR_NO") on update no action on delete no action  

go

alter table "VENDOR_BIND_ESHOP "
	add constraint "VENDOR_BIND_ESHOP _FK2" foreign key (
		"ESHOP_NO")
	 references "E_SHOP" (
		"ESHOP_NO") on update no action on delete no action  

go

/* 在表 "PURCHASES_HISTORY" 中添加外键约束。                                                            */
alter table "PURCHASES_HISTORY"
	add constraint "PURCHASES_HISTORY_FK1" foreign key (
		"CONSUMER_NO")
	 references "CONSUMER" (
		"CONSUMER_NO") on update no action on delete no action  

go

alter table "PURCHASES_HISTORY"
	add constraint "PURCHASES_HISTORY_FK2" foreign key (
		"GOODS_NO")
	 references "GOODS" (
		"GOODS_NO") on update no action on delete no action  

go

/* 在表 "CONSUMER_BIND_ESHOP" 中添加外键约束。                                                          */
alter table "CONSUMER_BIND_ESHOP"
	add constraint "CONSUMER_BIND_ESHOP_FK1" foreign key (
		"CONSUMER_NO")
	 references "CONSUMER" (
		"CONSUMER_NO") on update no action on delete no action  

go

alter table "CONSUMER_BIND_ESHOP"
	add constraint "CONSUMER_BIND_ESHOP_FK2" foreign key (
		"ESHOP_N0")
	 references "E_SHOP" (
		"ESHOP_NO") on update no action on delete no action  

go

/* 在表 "COMMONWEAL_USE" 中添加外键约束。                                                               */
alter table "COMMONWEAL_USE"
	add constraint "COMMONWEAL_USE_FK1" foreign key (
		"PHILANTHROPIC_NO")
	 references "PHILANTHROPIC_ORG" (
		"PHILANTHROPIC_NO") on update no action on delete no action  

go

/* 在表 "LOVE_TREE_TRACE" 中添加外键约束。                                                              */
alter table "LOVE_TREE_TRACE"
	add constraint "LOVE_TREE_TRACE_FK1" foreign key (
		"COMMONWEAL_NO")
	 references "COMMONWEAL_USE" (
		"COMMONWEAL_NO") on update no action on delete no action  

go

alter table "LOVE_TREE_TRACE"
	add constraint "LOVE_TREE_TRACE_FK2" foreign key (
		"TREE_NO")
	 references "LOVE_TREE" (
		"TREE_NO") on update no action on delete no action  

go


/* 这是 Microsoft Visual Studio 生成的 SQL DDL 脚本的末尾。                                              */
