package kr.co.earthnus.user.camBoard;

public class PagingBean {	
	private int totalcount;
    private int pagenum;
    private int currentPage;
    private int contentnum;
    private int startPage = 1;
    private int endPage = 5;
    private boolean prev;
    private boolean next;
    private int currentblock;
    private int lastblock;
    private String arr;
    private String search;
    private String order;	
    private String orderBy;	
	private String search_type;
	private String search_user;
	private int CAMB_NUM;
	private int CAMB_INDEX;
	private int limit;
	private int offset;
    
    public void prevnext(int pagenum) {
        if(calcpage(totalcount,contentnum)<6) {
        	setPrev(false);
        	setNext(false);
        } else if(pagenum>0 && pagenum<6) {
        	setPrev(false);
        	setNext(true);
        } else if(getLastblock() == getCurrentblock()) {
        	setPrev(true);
            setNext(false);
        } else {
            setPrev(true);
            setNext(true);
        }
    }
    public int calcpage(int totalcount, int contentnum){
        int totalpage = totalcount / contentnum;
        if(totalcount%contentnum>0){
            totalpage++;
        }
        return totalpage;
    }
    
	public String getSearch_user() {
		return search_user;
	}
	public void setSearch_user(String search_user) {
		this.search_user = search_user;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getCAMB_INDEX() {
		return CAMB_INDEX;
	}
	public void setCAMB_INDEX(int cAMB_INDEX) {
		CAMB_INDEX = cAMB_INDEX;
	}
	public int getCAMB_NUM() {
		return CAMB_NUM;
	}
	public void setCAMB_NUM(int cAMB_NUM) {
		CAMB_NUM = cAMB_NUM;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getTotalcount() {
        return totalcount;
    }
    public void setTotalcount(int totalcount) {
        this.totalcount = totalcount;
    }
    public int getPagenum() {
        return pagenum;
    }
    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }
    public int getContentnum() {
        return contentnum;
    }
    public void setContentnum(int contentnum) {
        this.contentnum = contentnum;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int currentblock) {
    	if(totalcount <= 30) {
    		this.startPage = 1;
    	}else this.startPage = (currentblock*5)-4;        
    }
    public void setEndPage(int getlastblock, int getcurrentblock) {
    	if(totalcount <= 30) {
            if(getlastblock == getcurrentblock){
                this.endPage = calcpage(getTotalcount(),getContentnum());
            } else if(totalcount == 0) {
            	this.endPage = 0;
            } else{
                this.endPage = getStartPage()+4;
            }
            
    	}
    }
    
    public int getEndPage() {
        return endPage;
    }
    public boolean isPrev() {
        return prev;
    }
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
    public boolean isNext() {
        return next;
    }
    public void setNext(boolean next) {
        this.next = next;
    }
    public int getCurrentblock() {
        return currentblock;
    }
    public void setCurrentblock(int pagenum) {
        this.currentblock = pagenum/5;
        if(pagenum%5>0){
            this.currentblock++;
        }
    }
    public int getLastblock() {
        return lastblock;
    }
    public void setLastblock(int lastblock) {
        this.lastblock = totalcount / (5*this.contentnum);
        if(totalcount %(5*this.contentnum)>0){
            this.lastblock++;
        }
    }
	@Override
	public String toString() {
		return "PagingBean [totalcount=" + totalcount + ", pagenum=" + pagenum + ", currentPage=" + currentPage
				+ ", contentnum=" + contentnum + ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev
				+ ", next=" + next + ", currentblock=" + currentblock + ", lastblock=" + lastblock + ", arr=" + arr
				+ ", search=" + search + ", order=" + order + ", orderBy=" + orderBy + ", search_type=" + search_type
				+ ", search_user=" + search_user + ", CAMB_NUM=" + CAMB_NUM + ", CAMB_INDEX=" + CAMB_INDEX + ", limit="
				+ limit + ", offset=" + offset + "]";
	}
    
    
}