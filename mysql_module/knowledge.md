### **User 表结构描述**

```
字段名,描述,类型,备注
UserID,用户唯一 ID,整型,主键，自增
UserName,用户名,字符串,用户的登录名或昵称
Email,邮箱,字符串,用户的电子邮箱地址，唯一
Phone,手机号码,字符串,用户的联系方式
CreateTime,创建日期,日期类型,账号创建时间
LastLogin,最后登录时间,日期类型,记录用户最近一次登录时间
Status,账号状态,字符串,0 表示禁用, 1 表示启用
Address,地址,字符串,用户的收货地址
Gender,性别,字符串,例如 Male、Female、Other
BirthDate,生日,日期类型,用户出生日期

```

---

### **Order 表结构描述**

```
字段名,描述,类型,备注
OrderID,订单唯一 ID,整型,主键，自增
UserID,用户 ID,整型,关联 User 表的 UserID
OrderTime,下单时间,日期类型,订单创建时间
TotalAmount,订单总金额,十进制数,订单总价格
Status,订单状态,字符串,例如 Pending（待支付）、Paid（已支付）、Shipped（已发货）、Completed（已完成）、Cancelled（已取消）
PaymentMethod,支付方式,字符串,例如 Credit Card、PayPal、WeChat Pay
ShippingAddress,收货地址,字符串,订单的配送地址
Description,备注信息,字符串,订单的额外说明
TrackingNumber,物流单号,字符串,订单的快递单号
Operator,订单管理员,字符串,处理订单的管理员名称

```