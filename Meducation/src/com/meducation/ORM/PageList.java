package com.meducation.ORM;

import java.util.List;

import org.displaytag.pagination.PaginatedList;
import org.displaytag.properties.SortOrderEnum;

public class PageList implements PaginatedList {
	@SuppressWarnings("rawtypes")
	private List list;// ÿҳ���б�
	private int pageNumber = 1;// ��ǰҳ��
	private int objectsPerPage = 10;// ÿҳ��¼��
	private int fullListSize = 0;// �ܼ�¼��

	private String sortCriterion;
	private SortOrderEnum sortDirection;
	private String searchId;

	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getObjectsPerPage() {
		return objectsPerPage;
	}
	public void setObjectsPerPage(int objectsPerPage) {
		this.objectsPerPage = objectsPerPage;
	}
	public int getFullListSize() {
		return fullListSize;
	}
	public void setFullListSize(int fullListSize) {
		this.fullListSize = fullListSize;
	}
	public String getSortCriterion() {
		return sortCriterion;
	}
	public void setSortCriterion(String sortCriterion) {
		this.sortCriterion = sortCriterion;
	}
	public SortOrderEnum getSortDirection() {
		return sortDirection;
	}
	public void setSortDirection(SortOrderEnum sortDirection) {
		this.sortDirection = sortDirection;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
}
