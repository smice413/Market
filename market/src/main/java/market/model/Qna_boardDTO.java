package market.model;

import java.util.Date;

public class Qna_boardDTO {

	private int qna_no;
	private int p_no;
	private int op_no;
	private String m_email;
	private String qna_title;
	private String qna_content;
	private String qna_img;
	private int qna_ref;
	private int qna_ref_lev;
	private int qna_ref_seq;
	private Date qna_writedate;
	private String qna_delstatus;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getOp_no() {
		return op_no;
	}
	public void setOp_no(int op_no) {
		this.op_no = op_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_img() {
		return qna_img;
	}
	public void setQna_img(String qna_img) {
		this.qna_img = qna_img;
	}
	public int getQna_ref() {
		return qna_ref;
	}
	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}
	public int getQna_ref_lev() {
		return qna_ref_lev;
	}
	public void setQna_ref_lev(int qna_ref_lev) {
		this.qna_ref_lev = qna_ref_lev;
	}
	public int getQna_ref_seq() {
		return qna_ref_seq;
	}
	public void setQna_ref_seq(int qna_ref_seq) {
		this.qna_ref_seq = qna_ref_seq;
	}
	public Date getQna_writedate() {
		return qna_writedate;
	}
	public void setQna_writedate(Date qna_writedate) {
		this.qna_writedate = qna_writedate;
	}
	public String getQna_delstatus() {
		return qna_delstatus;
	}
	public void setQna_delstatus(String qna_delstatus) {
		this.qna_delstatus = qna_delstatus;
	}
}
