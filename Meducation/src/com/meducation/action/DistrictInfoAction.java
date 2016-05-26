package com.meducation.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.meducation.ORM.District;
import com.meducation.ORM.PageList;
import com.meducation.service.DistrictService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("json-default")
public class DistrictInfoAction extends ActionSupport
		implements
			ModelDriven<District> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	DistrictService districtservice;

	private int pageNo = 1;
	private int count = 0;
	private int pageSize = 20;
	List<District> memberList;
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void queryByString() {
		JSONArray ja = new JSONArray();
		List<Object[]> list = new ArrayList<Object[]>();
		list = districtservice
				.queryByString("Select distinct t.cityName,t.cityCode from City t");
		for (int i = 0; i < list.size(); i++) {
			Object[] object = (Object[]) list.get(i);
			JSONObject jo = new JSONObject();
			jo.element("code", object[1].toString());
			jo.element("city", object[0].toString());
			ja.add(jo);
		}
		this.result = ja.toString();
	}

	@Action(value = "/DistrictInfo_city", results = {@Result(name = "success", type = "json", params = {
			"root", "result"})})
	public String city() {
		queryByString();
		return SUCCESS;
	}

	private District model = new District();
	public District getModel() {
		return model;
	}

	@Action(value = "/DistrictInfo_browser", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/districtInfo.jsp")})
	public String browser() {
		Page();
		return SUCCESS;
	}

	public void Page() {
		count = districtservice.countAll();
		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}
		memberList = districtservice.browseAll(pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);
	}

	@Action(value = "/DistrictInfo_del", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/districtInfo.jsp")})
	public String del() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		districtservice.delData(id);
		Page();
		return SUCCESS;

	}

	@Action(value = "/DistrictInfo_edit", results = {@Result(name = "input", location = "/WEB-INF/baseInfo/districtInfoModify.jsp")})
	public String edit() {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		District district = districtservice.findById(id);
		if (district != null) {
			try {
				BeanUtils.copyProperties(model, district);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String Source = ServletActionContext.getRequest().getParameter("page")
				.trim();
		ServletActionContext.getRequest().setAttribute("page", Source);
		return INPUT;
	}

	public void processcharset() throws UnsupportedEncodingException {
		if (!model.getDistrictName().isEmpty())
			model.setDistrictName(new String(model.getDistrictName().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getDistrictCode().isEmpty())
			model.setDistrictCode(new String(model.getDistrictCode().getBytes(
					"iso-8859-1"), "UTF-8"));
		if (!model.getBelongCityName().isEmpty())
			model.setBelongCityName(new String(model.getBelongCityName()
					.getBytes("iso-8859-1"), "UTF-8"));

	}

	@Action(value = "/DistrictInfo_query", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/districtInfoQuery.jsp")})
	public String query() throws UnsupportedEncodingException {
		processcharset();

		String sql = "t.id<>0";
		if (!model.getDistrictName().isEmpty())
			sql = sql + " and t.districtName like '%" + model.getDistrictName()
					+ "%'";
		if (!model.getDistrictCode().isEmpty())
			sql = sql + " and t.districtCode like '%" + model.getDistrictCode()
					+ "%'";
		if (!model.getBelongCityName().isEmpty())
			sql = sql + " and t.belongCityName like '%"
					+ model.getBelongCityName() + "%'";

		if (ServletActionContext.getRequest().getParameter("page") != null) {
			pageNo = Integer.parseInt(ServletActionContext.getRequest()
					.getParameter("page"));
		}

		count = districtservice.countByquery(sql);
		memberList = districtservice.findInfoByPage(sql, pageNo, pageSize);
		PageList pageList = new PageList();
		pageList.setPageNumber(pageNo);
		pageList.setFullListSize(count);
		pageList.setList(memberList);
		pageList.setObjectsPerPage(pageSize);
		ServletActionContext.getRequest().setAttribute("pageList", pageList);

		return SUCCESS;
	}

	@Action(value = "/DistrictInfo_querydel", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/districtInfoQuery.jsp")})
	public String querydel() throws UnsupportedEncodingException {
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id").trim());
		districtservice.delData(id);
		query();
		return SUCCESS;
	}

	@Action(value = "/DistrictInfo_search", results = {@Result(name = "success", location = "/WEB-INF/baseInfo/districtInfoQuery.jsp")})
	public String search() throws UnsupportedEncodingException {
		return SUCCESS;
	}

}
