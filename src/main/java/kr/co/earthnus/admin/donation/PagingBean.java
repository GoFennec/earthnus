package kr.co.earthnus.admin.donation;

public class PagingBean {	
    private int totalcount;
    private int pagenum;
    private int contentnum;
    private int startPage = 1;
    private int endPage = 5;
    private boolean prev;
    private boolean next;
    private int currentblock;
    private int lastblock;
    
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
        this.startPage = (currentblock*5)-4;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int getlastblock, int getcurrentblock) {
        if(getlastblock == getcurrentblock){
            this.endPage = calcpage(getTotalcount(),getContentnum());
        }else{
            this.endPage = getStartPage()+4;   
        }
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
}
