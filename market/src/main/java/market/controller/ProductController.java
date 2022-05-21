package market.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import market.model.CategoryDTO;
import market.model.ProductDTO;
import market.model.Product_imgDTO;
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
	

	/*
	 * @RequestMapping("productInsert.do") // 글작성 폼 (원문, 답변글) public String
	 * insert(ProductDTO product, Model model, HttpServletRequest request) {
	 * 
	 * int result = ps.insert(product); model.addAttribute("result", result);
	 * 
	 * return "product/productInsert"; }
	 */
	
	@RequestMapping("productInsert.do")	// 글작성 폼 (원문, 답변글)
	public String insert(ProductDTO product, Product_imgDTO product_img, Model model, 
						MultipartHttpServletRequest mRequest,
						HttpServletRequest request) {

		// 상품정보 등록
		int result = ps.insert(product);
		// 등록한 상품번호를 구해옴
		int number = ps.getMaxNum();

		// 등록한 이미지가 있으면
		List<MultipartFile> fileList = mRequest.getFiles("product_img");
		if(fileList.size() > 0 && !fileList.get(0).getOriginalFilename().equals("")) {
			int i=1;
			// 이미지DTO에 상품번호 등록
			product_img.setP_no(number);
			// 저장경로 설정
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			String path = contextRoot + "upload/product";
			System.out.println("path:"+path);
			
	       for (MultipartFile mf : fileList) {
	    	   
				int size = (int) mf.getSize(); // 첨부파일의 크기 (단위: Byte)
				String originalFileName = mf.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String savedFileName = UUID.randomUUID() +"_" + originalFileName;	//저장될 파일 명
				
				System.out.println("size:"+size);
				System.out.println("originalFileName:"+originalFileName);
				System.out.println("extension:"+extension);
				System.out.println("savedFileName:"+savedFileName);
				
				if(size > 10240000) { // 10MB
						/*
						 * strResult = "{ \"result\":\"BIGfile\" }"; return strResult;
						 */
					System.out.println("파일이 너무 큼");
					result=2;
				}
	
	            try {
	            	//폴더에 파일저장
	            	mf.transferTo(new File(path + "/" + savedFileName));
	                System.out.println("사진입력");
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	           
	        	product_img.setP_img(savedFileName);
	        	product_img.setP_img_order(i++);
	    		ps.insertImg(product_img);
	       	}
        }

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
	
	@RequestMapping("productUpdateForm.do")  // 수정 폼
	public String productUpdateForm(int p_no, String pageNum, Model model) {

		List<CategoryDTO> listCateNo = ps.listCateNo();
		ProductDTO product = ps.select(p_no);
		System.out.println("listCateNo:"+listCateNo);
		System.out.println("product:"+product);
		model.addAttribute("listCateNo", listCateNo);
		model.addAttribute("product", product);
		model.addAttribute("pageNum", pageNum);
		
		return "product/productUpdateForm";
	}
	
	@RequestMapping("productUpdate.do")
	public String productUpdate(ProductDTO product, String pageNum, Model model) {
		
		int result = ps.update(product);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "product/productUpdate";
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
		model.addAttribute("orderCond", product.getOrderCond());
		model.addAttribute("status", product.getStatus());
		
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
		
		List<ProductDTO> list = ps.list(product);
		
		//상품목록
		model.addAttribute("list", list);
		//페이징
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", product.getSearch());
		model.addAttribute("keyword", product.getKeyword());
		//정렬
		model.addAttribute("orderCond", product.getOrderCond());
		
		return "product/productSearchList";
	}
	
	@RequestMapping("productCategoryList.do")	// 전체 목록, 검색 목록
	public String producCategoryList(String pageNum, ProductDTO product, Model model) {
		
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

		List<ProductDTO> list = ps.list(product);
		List<CategoryDTO> listCategory = ps.listCategory(product);
		
		//카테고리목록
		model.addAttribute("listCategory", listCategory);
		//상품목록
		model.addAttribute("list", list);
		//페이징
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", product.getSearch());
		model.addAttribute("keyword", product.getKeyword());
		//정렬
		model.addAttribute("orderCond", product.getOrderCond());
		
		return "product/productCategoryList";
	}


	@RequestMapping("productDelete.do")
	public String productDelete(int p_no, String pageNum, Model model) {
		
		int result = ps.delete(p_no);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "product/productDelete";
	}
}
