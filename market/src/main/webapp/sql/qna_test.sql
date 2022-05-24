select * from product order by p_no desc;
select * from qna;
select * from order_product
		
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
		Q.qna_readcount as qna_readcount,
		Q.qna_writedate as qna_writedate,
		Q.qna_delstatus as qna_delstatus,
		M.m_name as m_name,
		P.p_name as p_name
	from qna Q 
	   	left join member M on M.m_email = Q.m_email
	   	left join product P on P.p_no = Q.p_no
	order by qna_ref desc, qna_writedate asc ) a)

insert into qna values (qna_board_seq.nextval,63,null,
			'test@naver.com','문의게시판 테스트입니다2','문의게시판 테스트입니다2',null,qna_board_seq.nextval,
			'N',0,sysdate,'N')
			
update qna set qna_question='문의게시판 테스트입니다3' where qna_no=7
update qna set p_no=null where qna_no=5