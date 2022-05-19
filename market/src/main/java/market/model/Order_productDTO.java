package market.model;

import java.util.Date;

public class Order_productDTO {

	private int op_no;
	private int o_no;
	private int p_no;
	private String op_type;
	private int op_qty;
	private int op_price;
	private int op_refund;
	private int op_calc;
	private String op_status;
	private String op_deli_no;
	private String op_refund_why;
	private Date op_deli_date;
	private Date op_cancel_date;
	private int d_no;
	private int s_no;
	private String m_email;
	private Date op_confirm_date;
	private Date op_refund_date;
	
	// order_tab
	private Date o_date;
	private String d_msg;
	private int o_total_price;
	private int o_sale_price;
	private int o_deli_price;
	private int o_pay_price;
	private String o_pay_type;
	
	// product
	private String p_name;
	
	// product_img
	private String p_img;
	
	// delivery
	private String d_name;
	private String d_tel;
	private String d_post;
	private String d_address;
	
	// shop
	private String s_name;
	
	
	
	// getters and setters
	public int getOp_no() {
		return op_no;
	}
	public void setOp_no(int op_no) {
		this.op_no = op_no;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getOp_type() {
		return op_type;
	}
	public void setOp_type(String op_type) {
		this.op_type = op_type;
	}
	public int getOp_qty() {
		return op_qty;
	}
	public void setOp_qty(int op_qty) {
		this.op_qty = op_qty;
	}
	public int getOp_price() {
		return op_price;
	}
	public void setOp_price(int op_price) {
		this.op_price = op_price;
	}
	public int getOp_refund() {
		return op_refund;
	}
	public void setOp_refund(int op_refund) {
		this.op_refund = op_refund;
	}
	public int getOp_calc() {
		return op_calc;
	}
	public void setOp_calc(int op_calc) {
		this.op_calc = op_calc;
	}
	public String getOp_status() {
		return op_status;
	}
	public void setOp_status(String op_status) {
		this.op_status = op_status;
	}
	public String getOp_deli_no() {
		return op_deli_no;
	}
	public void setOp_deli_no(String op_deli_no) {
		this.op_deli_no = op_deli_no;
	}
	public String getOp_refund_why() {
		return op_refund_why;
	}
	public void setOp_refund_why(String op_refund_why) {
		this.op_refund_why = op_refund_why;
	}
	public Date getOp_deli_date() {
		return op_deli_date;
	}
	public void setOp_deli_date(Date op_deli_date) {
		this.op_deli_date = op_deli_date;
	}
	public Date getOp_cancel_date() {
		return op_cancel_date;
	}
	public void setOp_cancel_date(Date op_cancel_date) {
		this.op_cancel_date = op_cancel_date;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Date getOp_confirm_date() {
		return op_confirm_date;
	}
	public void setOp_confirm_date(Date op_confirm_date) {
		this.op_confirm_date = op_confirm_date;
	}
	public Date getOp_refund_date() {
		return op_refund_date;
	}
	public void setOp_refund_date(Date op_refund_date) {
		this.op_refund_date = op_refund_date;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public String getD_msg() {
		return d_msg;
	}
	public void setD_msg(String d_msg) {
		this.d_msg = d_msg;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_tel() {
		return d_tel;
	}
	public void setD_tel(String d_tel) {
		this.d_tel = d_tel;
	}
	public String getD_post() {
		return d_post;
	}
	public void setD_post(String d_post) {
		this.d_post = d_post;
	}
	public String getD_address() {
		return d_address;
	}
	public void setD_address(String d_address) {
		this.d_address = d_address;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	
	
}
