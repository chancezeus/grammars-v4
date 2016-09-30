-----------------------------------------------------------------------
-- Full width chars 

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Japanese chars

USE 総合販売神田店;
GO
SELECT 
	製品.製品名，
	製品.製品番号，
	F略称(製品.製品名) AS 略称，
	オーダー.注文番号，
	オーダー.数量 * 製品.単価 AS 金額，
	case when オーダー.状態 = 0 then '入金待ち'
		else case when オーダー.状態 = 1 then '入金済'
		else case when オーダー.状態 = 2 then '発送済'
		else case when オーダー.状態 = 9 then 'キャンセル'
		end 状態,
FROM 製品情報マスタ 製品
	JOIN オーダー ON オーダー.製品番号 = 製品.製品番号
WHERE オーダー.注文日付 >= '20160801'
；


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Chinese chars
USE 综合量贩贩卖郑州店;
GO
SELECT 
	产品.产品名，
	产品.产品编号，
	F简称(产品.产品名) AS 简称，
	订单.订单号，
	订单.数量 * 产品.单价 AS 金额，
	case when 订单.状态 = 0 then '等待付款'
		else case when 订单.状态 = 1 then '已收款'
		else case when 订单.状态 = 2 then '已发送'
		else case when 订单.状态 = 9 then '取消'
		end 状态,
FROM 产品信息 产品
	JOIN 订单 ON 订单.产品编号 = 产品.产品编号
WHERE 订单.订购日期 >= '20160801'
；
