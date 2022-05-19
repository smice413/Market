select * from category;
select * from product;
select * from product_img;
select * from shop;

select * from product p inner join category c on p.cate_no = c.cate_no where c.cate_large='과일'

select count(*) from product P
			left outer join category C on P.cate_no = C.cate_no
       		left outer join product_img PI on P.p_no = PI.p_no
		       		
select 
	P.p_no as p_no,
	P.cate_no as cate_no,
	P.s_no as s_no,
	P.p_group_buying as p_group_buying,
	P.p_follow_sale as p_follow_sale,
	P.p_name as p_name,
	P.p_detail as p_detail,
	P.p_group_price as p_group_price,
	P.p_sell_price as p_sell_price,
	P.p_follow_price as p_follow_price,
	P.p_stock as p_stock,
	P.p_regdate as p_regdate,
	P.p_status as p_status,
	P.p_hit as p_hit,
	C.cate_large as cate_large,
	C.cate_small as cate_small,
	PI.p_img as p_img,
	S.s_name as s_name
from product P
   	left outer join category C on P.cate_no = C.cate_no
   	left outer join product_img PI on P.p_no = PI.p_no
   	left outer join shop S on P.s_no = S.s_no where p.p_no=14
   
select *
from product P
			left outer join category C on P.cate_no = C.cate_no
       		left outer join product_img PI on P.p_no = PI.p_no
       		where p_group_buying='Y'
       		
delete from product where p_hit=3;