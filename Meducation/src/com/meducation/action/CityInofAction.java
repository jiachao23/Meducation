package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.meducation.ORM.City;
import com.meducation.ORM.PageList;
import com.meducation.service.CityService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("baseinofaction")
@Scope("prototype")
public class CityInofAction extends ActionSupport implements ModelDriven<City> {

	@Resource
	CityService cityservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<City> memberList;

	private static final long serialVersionUID = 1L;

	@Action(value = "/baseinof_citybrowser", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/cityInfo.jsp")})
	public String citybrowser() {
		cityPage();
		return SUCCESS;

	}

	public void cityPage() {
		count = cityservice.countAll();
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		memberList = cityservice.browseAll(pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/baseinof_citydel", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/cityInfo.jsp")})
	public String citydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		cityservice.delData(id);
		cityPage();
		return SUCCESS;

	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getCityName().isEmpty())
			model.setCityName(new String(model.getCityName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getCityCode().isEmpty())
			model.setCityCode(new String(model.getCityCode().getBytes(
					"iso-8859-1"), "UTF-8"));
	}

	@Action(value = "/baseinof_cityquery", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/cityQuery.jsp")})
	public String cityquery() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getCityName().isEmpty())
			sql = sql + " and t.cityName like '%" + model.getCityName() + "%'";
		if (!model.getCityCode().isEmpty())
			sql = sql + " and t.cityCode like '%" + model.getCityCode() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = cityservice.countByquery(sql);
		memberList = cityservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/baseinof_cityquerydel", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/cityQuery.jsp")})
	public String cityquerydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		cityservice.delData(id);

		processcharset();

		String sql = "t.id<>0";
		if (!model.getCityName().isEmpty())
			sql = sql + " and t.cityName like '%" + model.getCityName() + "%'";
		if (!model.getCityCode().isEmpty())
			sql = sql + " and t.cityCode like '%" + model.getCityCode() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = cityservice.countByquery(sql);
		memberList = cityservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/baseinof_cityedit", results = {@Result(name = "input", location = "/WEB-INF/baseInfo/cityInfoModify.jsp")})
	public String cityedit() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		City city = cityservice.findById(id);
		if (city != null) {
			try {
				BeanUtils.copyProperties(model, city);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String Source = ServletActionContext.getRequest().getParameter("page")
				.trim();
		ServletActionContext.getRequest().setAttribute("page", Source);
		return INPUT;
	}

	private City model = new City();// ���ڷ�װ��Ա����ģ��
	public City getModel() {
		return model;
	}

	@Action(value = "/baseinof_search", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/cityQuery.jsp")})
	public String search() throws UnsupportedEncodingException {
		return SUCCESS;
	}
}
