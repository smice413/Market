package market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import market.model.CategoryDTO;
import market.model.ProductDTO;
import market.service.PagingPgm;
import market.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService ps;

	@RequestMapping("main.do")	// 글작성 폼 (원문, 답변글)
	public String main(String pageNum, ProductDTO product, Model model) {
		
		String search = "p_group_buying";
		String keyword = "Y";
		product.setSearch(search);
		product.setKeyword(keyword);
		product.setStartRow(1);
		product.setEndRow(5);
		
		List<ProductDTO> glist = ps.list(product);

		search = "p_follow_sale";
		keyword = "Y";
		product.setSearch(search);
		product.setKeyword(keyword);
		product.setStartRow(1);
		product.setEndRow(5);
		
		List<ProductDTO> flist = ps.list(product);		
		System.out.println("glist:"+glist);
		System.out.println("flist:"+flist);
		
		model.addAttribute("glist", glist);
		model.addAttribute("flist", flist);
		model.addAttribute("search", product.getSearch());
		model.addAttribute("keyword", product.getKeyword());		
		
		return "common/main";
	}
	
	@RequestMapping("productInsertForm.do")	// 글작성 폼 (원문, 답변글)
	public String productInsertForm(Model model) {

		List<CategoryDTO> listCateNo = ps.listCateNo();
		model.addAttribute("listCateNo", listCateNo);
		return "product/productInsertForm";
	}
	

	@RequestMapping("productInsert.do")	// 글작성 폼 (원문, 답변글)
	public String insert(ProductDTO product, Model model, HttpServletRequest request) {

		int result = ps.insert(product);
		model.addAttribute("result", result);

		return "product/productInsert";
	}

	@RequestMapping("productView.do")	// 상세 페이지
	public String productView(int p_no, String pageNum, Model model) {
		ps.selectUpdate(p_no);	// 조회수 증가
		ProductDTO product = ps.select(p_no);
		System.out.println("product:"+product);
		model.addAttribute("product", product);
		model.addAttribute("pageNum", pageNum);
		
		return "product/productView";
	}
	
	
	@RequestMapping("productList.do")	// 전체 목록, 검색 목록
	public String producList(String pageNum, ProductDTO product, Model model) {
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		int total = ps.getTotal(product); // 검색 (데이터 갯수)
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		product.setStartRow(startRow);
		product.setEndRow(endRow);
		int no = total - startRow + 1;		// 화면 출력 번호
		List<ProductDTO> list = ps.list(product);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", product.getSearch());
		model.addAttribute("keyword", product.getKeyword());
		
		return "product/productList";
	}
	
	@RequestMapping("productSearchList.do")	// 전체 목록, 검색 목록
	public String productSearchList(String pageNum, ProductDTO product, Model model) {
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		int total = ps.getTotal(product); // 검색 (데이터 갯수)
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		product.setStartRow(startRow);
		product.setEndRow(endRow);
		int no = total - startRow + 1;		// 화면 출력 번호
		List<ProductDTO> list = ps.list(product);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", product.getSearch());
		model.addAttribute("keyword", product.getKeyword());
		
		return "product/productSearchList";
	}
	
	@RequestMapping("productCategoryList.do")	// 전체 목록, 검색 목록
	public String producCategoryList(String pageNum, ProductDTO product, Model model) {
//		System.out.println(product.getP_no());
//		List<ProductImgDTO> listImg = ps.listImg(product.getP_no());
		
		final int rowPerPage = 5;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		int total = ps.getTotal(product); // 검색 (데이터 갯수)
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		product.setStartRow(startRow);
		product.setEndRow(endRow);
		int no = total - startRow + 1;		// 화면 출력 번호
		List<ProductDTO> list = ps.list(product);
		List<CategoryDTO> listCategory = ps.listCategory(product);
		
		model.addAttribute("list", list);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", product.getSearch());
		model.addAttribute("keyword", product.getKeyword());
		
		return "product/productCategoryList";
	}
}
