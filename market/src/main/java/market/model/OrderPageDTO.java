package market.model;

public class OrderPageDTO {

	// view에서 전달받을 값
	private int p_no;
	private int cart_qty;
	
	// DB에서 꺼내올 값
	private String p_name;
	private int p_sell_price;

	// 만들어 낼 값
	private int total_price;

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_sell_price() {
		return p_sell_price;
	}

	public void setP_sell_price(int p_sell_price) {
		this.p_sell_price = p_sell_price;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	public void totalPrice() {
		this.total_price = this.p_sell_price*this.cart_qty;
	}
	
}
