package com.meducation.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meducation.DAO.SchoolAgencyDao;
import com.meducation.ORM.School;
import com.meducation.ORM.SchoolAgency;
import com.meducation.ORM.SelectedItems;
import com.meducation.ORM.TrainingAgency;
import com.meducation.ORM.TrainingPlan;
import com.meducation.service.SchoolAgencyService;

@Service("schoolAgencyService")
@Transactional
@RemoteProxy(name = "schoolAgencyService")
public class SchoolAgencyServiceImpl implements SchoolAgencyService {

	@Resource
	private SchoolAgencyDao schoolAgencyDao;

	@SuppressWarnings("unchecked")
	@Override
	@RemoteMethod
	public String saveData(SelectedItems selectedItems) {
		String[] list = selectedItems.getItems();

		List<TrainingPlan> Plan_list = schoolAgencyDao
				.queryByString("from TrainingPlan where id="
						+ selectedItems.getPlanID());
		TrainingPlan trainingPlan = (TrainingPlan) Plan_list.get(0);

		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = df.format(date);

		List<School> School_list = schoolAgencyDao
				.queryByString("from School where id=" + list[0]);
		School school = (School) School_list.get(0);

		List<TrainingAgency> Agency_list = schoolAgencyDao
				.queryByString("from TrainingAgency where id=" + list[2]);
		TrainingAgency agency = (TrainingAgency) Agency_list.get(0);

		if (schoolAgencyDao.queryByString(
				"from SchoolAgency t where t.planId='"
						+ selectedItems.getPlanID() + "' and t.schoolId='"
						+ list[0] + "'").size() == 0) {
			SchoolAgency schoolAgency = new SchoolAgency();
			schoolAgency.setPlanId(Integer.toString(trainingPlan.getId()));
			schoolAgency.setPlanName(trainingPlan.getPlanName());
			schoolAgency.setPlanCode(trainingPlan.getPlanNum());
			schoolAgency.setAgencyId(Integer.toString(agency.getId()));
			schoolAgency.setAgencyName(agency.getAgenceName());
			schoolAgency.setAgencyCode(agency.getAgenceCode());
			schoolAgency.setSchoolId(Integer.toString(school.getId()));
			schoolAgency.setSchoolName(school.getSchoolName());
			schoolAgency.setSchoolCode(school.getSchoolCode());
			schoolAgency.setSchoolAdmin(list[1]);
			schoolAgency.setSchoolAdminTime(time);
			schoolAgencyDao.saveOrUpdate(schoolAgency);

			schoolAgencyDao
					.update("update PlanSchool set status='课程已选定' where planId='"
							+ selectedItems.getPlanID()
							+ "' and schoolId='"
							+ list[0] + "'");
		} else {
			String hql = "update SchoolAgency set agencyId='" + agency.getId()
					+ "',agencyName='" + agency.getAgenceName()
					+ "',agencyCode='" + agency.getAgenceCode()
					+ "',schoolAdmin='" + list[1] + "',schoolAdminTime='"
					+ time + "' where planId='" + trainingPlan.getId()
					+ "' and schoolId='" + school.getId() + "'";
			System.out.println(hql);
			schoolAgencyDao.update(hql);
		}

		return "ture";
	}

}
