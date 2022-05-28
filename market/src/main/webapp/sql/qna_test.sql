select * from product where p_status=1 order by p_no desc;
select * from shop where s_no in (select distinct s_no from product)
select * from qna where op_no is null;
select * from order_product where m_email='hamtori@gmail.com'
select * from order_tab where s_no is null
select * from member;
select * from review
select * from shop;
delete from order_tab where s_no is null;
update order_tab set s_no=3 where s_no is null;
delete from qna
select * from qna Q left join member M on M.m_email = Q.m_email order by qna_ref desc, qna_writedate asc

select * from (select a.*,rowNum rn from (
			select 
				Q.qna_no as qna_no,
				Q.p_no as p_no,
				Q.op_no as op_no,
				Q.m_email as m_email,
				Q.qna_title as qna_title,
				Q.qna_question as qna_question,
				Q.qna_answer as qna_answer,
				Q.qna_ref as qna_ref,
				Q.qna_secret as qna_secret,
				Q.s_no as s_no,
				Q.qna_writedate as qna_writedate,
				Q.qna_delstatus as qna_delstatus,
				M.m_name as m_name,
				P.p_name as p_name,
				OP.o_no as o_no
			from qna Q 
			   	left join member M on M.m_email = Q.m_email
			   	left join product P on P.p_no = Q.p_no
			   	left join order_product OP on OP.op_no = Q.op_no

	order by qna_ref desc, qna_writedate asc ) a)

insert into qna values (qna_seq.nextval,18,null,
			'ljpson@naver.com','문의게시판 테스트입니다2 ','문의게시판 테스트입니다2 문의게시판 테스트입니다2<br>문의게시판 테스트입니다2','답변대기',qna_seq.nextval,
			'N',3,sysdate,'N')
			
update qna set qna_question='문의게시판 테스트입니다3' where qna_no=7
update qna set p_no=null where qna_no=5