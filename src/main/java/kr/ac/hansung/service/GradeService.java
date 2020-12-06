package kr.ac.hansung.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.GradeDAO;

import kr.ac.hansung.model.Grade;
import kr.ac.hansung.model.GradeDetail;

@Service
public class GradeService {

	@Autowired
	private GradeDAO gradeDAO;

	public List<Grade> getGradesbysemester() {
		return gradeDAO.getyeargrade();
	}

	public List<GradeDetail> getCurrent() {
		return gradeDAO.getgrades();

	}

	public List<GradeDetail> getDetailGrades(int year, int semester) {
		return gradeDAO.getdetailgrades(year, semester);
	}

	public List<GradeDetail> getGradesbydivision() {

		return gradeDAO.getDivisionGrades();
	}

	public void insert(GradeDetail gradedetail) {
		gradeDAO.insert(gradedetail);
	}

}
