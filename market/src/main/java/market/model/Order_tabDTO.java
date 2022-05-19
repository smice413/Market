package market.model;

import java.util.Date;

public class Order_tabDTO {

	private int o_no;
	private String m_email;
	private int d_no;
	private String d_msg;
	private int cp_no;
	private int o_total_price;
	private int o_sale_price;
	private int o_deli_price;
	private int o_pay_price;
	private String o_pay_type;
	private Date o_date;
	private Date o_confirm_date;
	private Date o_cancel_date;
	
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public String getD_msg() {
		return d_msg;
	}
	public void setD_msg(String d_msg) {
		this.d_msg = d_msg;
	}
	public int getCp_no() {
		return cp_no;
	}
	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	public int getO_total_price() {
		return o_total_price;
	}
	public void setO_total_price(int o_total_price) {
		this.o_total_price = o_total_price;
	}
	public int getO_sale_price() {
		return o_sale_price;
	}
	public void setO_sale_price(int o_sale_price) {
		this.o_sale_price = o_sale_price;
	}
	public int getO_deli_price() {
		return o_deli_price;
	}
	public void setO_deli_price(int o_deli_price) {
		this.o_deli_price = o_deli_price;
	}
	public int getO_pay_price() {
		return o_pay_price;
	}
	public void setO_pay_price(int o_pay_price) {
		this.o_pay_price = o_pay_price;
	}
	public String getO_pay_type() {
		return o_pay_type;
	}
	public void setO_pay_type(String o_pay_type) {
		this.o_pay_type = o_pay_type;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public Date getO_confirm_date() {
		return o_confirm_date;
	}
	public void setO_confirm_date(Date o_confirm_date) {
		this.o_confirm_date = o_confirm_date;
	}
	public Date getO_cancel_date() {
		return o_cancel_date;
	}
	public void setO_cancel_date(Date o_cancel_date) {
		this.o_cancel_date = o_cancel_date;
	}
}
