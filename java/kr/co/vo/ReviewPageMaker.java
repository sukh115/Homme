package kr.co.vo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;



public class ReviewPageMaker {
	private static final Logger logger = LoggerFactory.getLogger(ReviewPageMaker.class);
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private ReviewCriteria rcri;
	
	public void setRcri(ReviewCriteria rcri) {
		this.rcri = rcri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public ReviewCriteria getRcri() {
		return rcri;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(rcri.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		logger.info("와줘");
		int tempEndPage = (int) (Math.ceil(totalCount / (double)rcri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * rcri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		logger.info("??");
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", rcri.getPerPageNum())
							.build();
		logger.info("와");
		return uriComponents.toUriString();
	}
}