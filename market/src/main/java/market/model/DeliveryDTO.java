package market.model;

public class DeliveryDTO {

	private int d_no;
	private String m_email;
	private String d_name;
	private String d_tel;
	private String d_cate;
	private String d_post;
	private String d_address;
	private String d_default;
	
	// 뷰에서 넘어오는 파라미터
	private String addr1;  // 주소
	private String addr2;  // 상세 주소
	
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
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
	public String getD_cate() {
		return d_cate;
	}
	public void setD_cate(String d_cate) {
		this.d_cate = d_cate;
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
	public String getD_default() {
		return d_default;
	}
	public void setD_default(String d_default) {
		this.d_default = d_default;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	public void d_address() {
		this.d_address = this.addr1+" "+this.addr2;
	}
}

